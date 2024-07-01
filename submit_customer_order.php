<?php
session_start();
include 'config.php'; // Updated path for config.php

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $tableNumber = $_POST['table_number'];
    $pax = $_POST['pax'];
    $waiterName = 'Customer';

    // Insert new order
    $insertOrderStmt = $conn->prepare("INSERT INTO orders (table_number, pax, waiter_name, status, order_status, bill_out_by) VALUES (?, ?, ?, 'occupied', 'pending', ?)");
    $insertOrderStmt->bind_param('iiss', $tableNumber, $pax, $waiterName, $waiterName);
    $insertOrderStmt->execute();
    $newOrderId = $insertOrderStmt->insert_id;
    $insertOrderStmt->close();

    // Insert order items and prepare printing content
    $hasdrinks = false;
    $hasfood = false;
    $cashier_content = "";
    $expediter_content = "";
    $bar_content = "";

    if (isset($_SESSION['cart'])) {
        $cashier_content .= "CASHIER: \n\n";
        $cashier_content .= "#: " . $tableNumber . " / ";
        $cashier_content .= "Name: " . ucwords($waiterName) . " / ";
        $cashier_content .= "Pax: " . $pax . " / ";
        $cashier_content .= date("M-d h:iA") . "\n\n";

        foreach ($_SESSION['cart'] as $item) {
            $productId = $item['product_id'];
            $quantity = $item['quantity'];
            $noteData = '';  // You can collect note data if needed

            $insertItemStmt = $conn->prepare("INSERT INTO order_items (order_id, product_id, note_data, quantity, waiter_name, is_additional) VALUES (?, ?, ?, ?, ?, 'no')");
            $insertItemStmt->bind_param('iisii', $newOrderId, $productId, $noteData, $quantity, $waiterName);
            $insertItemStmt->execute();
            $insertItemStmt->close();

            // Update inventory
            $sql = "SELECT stock_quantity FROM inventory WHERE product_id = '$productId'";
            $result = $conn->query($sql);
            if ($result && $result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $currentStockQuantity = $row['stock_quantity'];
                $newStockQuantity = $currentStockQuantity - $quantity;

                $updateSql = "UPDATE inventory SET stock_quantity = '$newStockQuantity' WHERE product_id = '$productId'";
                $conn->query($updateSql);
            }

            // Fetch product details for printing
            $sql = "SELECT product_name, product_category FROM inventory WHERE product_id = '$productId'";
            $result = $conn->query($sql);
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    $cashier_content .= "$quantity " . $row['product_name'] . "\n";
                    $category = $row['product_category'];

                    if ($category == 'Drinks') {
                        $hasdrinks = true;
                        $bar_content .= "$quantity " . $row['product_name'] . "\n";
                        if (!empty($noteData)) {
                            $bar_content .= " -Note: " . $noteData . "\n";
                        }
                    } else {
                        $hasfood = true;
                        $expediter_content .= "$quantity " . $row['product_name'] . "\n";
                        if (!empty($noteData)) {
                            $expediter_content .= " -Note: " . $noteData . "\n";
                        }
                    }
                }
            }
        }

        if ($hasfood) {
            $expediter_content = "\n\n\n\n\n\n\nEXPEDITER\n\n" .
                "#: " . $tableNumber . " / " .
                "Name: " . ucwords($waiterName) . " / " .
                "Pax: " . $pax . " / " .
                date("M-d h:iA") . "\n\n" . $expediter_content;
        }

        if ($hasdrinks) {
            $bar_content = "\nBAR\n\n" .
                "#: " . $tableNumber . " / " .
                "Name: " . ucwords($waiterName) . " / " .
                "Pax: " . $pax . " / " .
                date("M-d h:iA") . "\n\n" . $bar_content;
        }
    }

    $conn->close();

    // Function to send content to the printer
    function print_to_printer($content, $printer_ip, $printer_port) {
        $printer_socket = socket_create(AF_INET, SOCK_STREAM, SOL_TCP);
        if ($printer_socket === false) {
            echo "Error: Unable to create socket\n";
            exit;
        }
        $connected = socket_connect($printer_socket, $printer_ip, $printer_port);
        if ($connected === false) {
            echo "Error: Unable to connect to printer\n";
            exit;
        }
        $font_command = "\x1B\x21\x10"; // ESC ! n (n = 16, to set font size to double height and double width)
        socket_write($printer_socket, $font_command, strlen($font_command));
        socket_write($printer_socket, $content);
        socket_write($printer_socket, str_repeat("\n", 6)); // Additional space before cutting (6 lines)
        $cut_command = "\x1D\x56\x01"; // ESC @ GS V m  // Cut command (partial cut)
        socket_write($printer_socket, $cut_command, strlen($cut_command)); // Send cut command to the printer
        socket_close($printer_socket); // Close the connection
    }

    // Read the INI file
    $config = parse_ini_file('../order_taking_system/printer.ini', true); // Updated path for printer.ini
    if ($config === false) {
        die('Error: Unable to parse printer.ini');
    }
    $printer_ip = $config['printer']['ip'];
    $printer_port = $config['printer']['port'];

    

    // Print expediter content if there is food
    if ($hasfood) {
        print_to_printer($expediter_content, $printer_ip, $printer_port);
    }

    // Print cashier content
    print_to_printer($cashier_content, $printer_ip, $printer_port);

    // Print bar content if there are drinks
    if ($hasdrinks) {
        print_to_printer($bar_content, $printer_ip, $printer_port);
    }

    // Clear the session cart after printing
    unset($_SESSION['cart']);

    echo '<script>alert("Order successfully submitted!"); window.location.href = "index.php";</script>';
}
?>
