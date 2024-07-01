<?php
session_start();
include '../order_taking_system/config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $action = $_POST['action'];

    switch ($action) {
        case 'check_table':
            $tableNumber = $_POST['table_number'];
            $stmt = $conn->prepare("SELECT order_id FROM orders WHERE table_number = ? AND status = 'occupied'");
            $stmt->bind_param('i', $tableNumber);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                echo json_encode(['status' => 'occupied']);
            } else {
                echo json_encode(['status' => 'available']);
            }
            $stmt->close();
            break;

        case 'check_password':
            $username = $_POST['username'];
            $password = md5($_POST['password']);
            $stmt = $conn->prepare("SELECT first_name FROM users WHERE username = ? AND password = ?");
            $stmt->bind_param('ss', $username, $password);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $firstName = $row['first_name'];
                echo json_encode(['status' => 'success', 'first_name' => $firstName]);
            } else {
                echo json_encode(['status' => 'error']);
            }
            $stmt->close();
            break;

        case 'clear_table':
            $tableNumber = $_POST['table_number'];
            $waiterName = $_POST['waiter_name'];

            $stmt = $conn->prepare("SELECT order_id FROM orders WHERE table_number = ? AND status = 'occupied'");
            $stmt->bind_param('i', $tableNumber);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $orderId = $row['order_id'];

                $updateStmt = $conn->prepare("UPDATE orders SET status = 'available', bill_out_by = ? WHERE order_id = ?");
                $updateStmt->bind_param('si', $waiterName, $orderId);
                if ($updateStmt->execute()) {
                    echo json_encode(['status' => 'success']);
                } else {
                    echo json_encode(['status' => 'error']);
                }
                $updateStmt->close();
            } else {
                echo json_encode(['status' => 'error']);
            }
            $stmt->close();
            break;
    }
    $conn->close();
}
?>
