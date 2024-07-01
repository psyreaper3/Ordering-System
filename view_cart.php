<?php
session_start();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['remove_item'])) {
        $item_id = $_POST['remove_item'];
        unset($_SESSION['cart'][$item_id]);
    }

    if (isset($_POST['change_quantity'])) {
        $item_id = $_POST['change_quantity'];
        $new_quantity = intval($_POST['new_quantity']);
        if ($new_quantity > 0) {
            $_SESSION['cart'][$item_id]['quantity'] = $new_quantity;
        } else {
            unset($_SESSION['cart'][$item_id]);
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Cart</title>
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <link rel="stylesheet" href="assets/css/all.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">
    <style>
        body {
            font-family: 'Avenir Regular', sans-serif;
        }
        .logo {
            width: 150px;
            margin: 10px 0;
        }
        .container {
            margin-top: 20px;
        }
        .cart-item {
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 15px;
            margin-bottom: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            position: relative;
        }
        .cart-item h5 {
            margin: 0;
        }
        .cart-item p {
            margin: 5px 0;
        }
        .cart-total {
            font-weight: bold;
            margin-top: 20px;
        }
        .remove-item {
            cursor: pointer;
            color: red;
            position: absolute;
            top: 15px;
            right: 15px;
            font-size: 20px;
        }
        .button-group {
            display: flex;
            justify-content: space-between;
        }
        .quantity-input {
            display: block;
            width: 100%;
            height: calc(2.25rem + 2px);
            padding: .375rem .75rem;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #495057;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: .25rem;
            transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
        }
        @media (max-width: 767px) {
            .cart-item {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
            }
            .cart-item div {
                margin-bottom: 10px;
            }
            .cart-total {
                text-align: center;
            }
            .button-group {
                flex-direction: column;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Cart</h1>
        <?php
        if (isset($_SESSION['cart']) && !empty($_SESSION['cart'])) {
            $total = 0;
            foreach ($_SESSION['cart'] as $item_id => $item) {
                $subtotal = $item['unit_price'] * $item['quantity'];
                $total += $subtotal;
                echo "<div class='cart-item' data-item-id='$item_id'>";
                echo "<div><h5>" . htmlspecialchars($item['product_name']) . "</h5></div>";
                echo "<div><p>Price: &#8369;" . number_format($item['unit_price'], 2) . "</p></div>";
                echo "<div>
                        <input type='number' class='quantity-input' value='" . htmlspecialchars($item['quantity']) . "' min='1' required>
                      </div>";
                echo "<div><p class='subtotal'>Subtotal: &#8369;" . number_format($subtotal, 2) . "</p></div>";
                echo "<div><i class='fas fa-times remove-item'></i></div>";
                echo "</div>";
            }
            $service_charge = $total * 0.05;
            $grand_total = $total + $service_charge;
            echo "<div class='cart-total'><p>Total: &#8369;" . number_format($total, 2) . "</p></div>";
            echo "<div class='cart-total'><p>Service Charge (5%): &#8369;" . number_format($service_charge, 2) . "</p></div>";
            echo "<div class='cart-total'><p>Grand Total: &#8369;" . number_format($grand_total, 2) . "</p></div>";
        } else {
            echo "<p>Your cart is empty</p>";
        }
        ?>

        <!-- Form to collect table number and pax -->
        <div id="table-number-form" style="margin-top: 20px;">
            <form id="submitOrderForm">
                <div class="form-group">
                    <label for="table_number">Table Number:</label>
                    <input type="number" id="table_number" name="table_number" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="pax">Number of Pax:</label>
                    <input type="number" id="pax" name="pax" class="form-control" required>
                </div>
                <div class="button-group">
                    <button type="submit" class="btn btn-primary">Submit Order</button>
                    <button class="btn btn-secondary" onclick="window.history.go(-1); return false;">Back</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Modal for password input -->
    <div class="modal fade" id="passwordModal" tabindex="-1" role="dialog" aria-labelledby="passwordModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    
                    <h5 class="modal-title" id="passwordModalLabel"><img src='assets/images/logo2.png' class='logo' />
                    <br>The table has not been billed out yet. Please seek assistance from a staff member.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="passwordForm">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="assets/js/jquery-3.6.0.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.quantity-input').on('change', function() {
                var itemId = $(this).closest('.cart-item').data('item-id');
                var newQuantity = $(this).val();

                $.post('view_cart.php', {
                    change_quantity: itemId,
                    new_quantity: newQuantity
                }, function() {
                    location.reload();
                });
            });

            $('.remove-item').on('click', function() {
                var itemId = $(this).closest('.cart-item').data('item-id');

                $.post('view_cart.php', {
                    remove_item: itemId
                }, function() {
                    location.reload();
                });
            });

            $('#submitOrderForm').on('submit', function(e) {
                e.preventDefault();

                var tableNumber = $('#table_number').val();
                var pax = $('#pax').val();

                $.post('table_management.php', { action: 'check_table', table_number: tableNumber }, function(response) {
                    if (response.status === 'occupied') {
                        $('#passwordModal').modal('show');
                    } else {
                        // Submit the order if table is not occupied
                        $.post('submit_customer_order.php', {
                            table_number: tableNumber,
                            pax: pax
                        }, function() {
                            alert('Order successfully submitted!');
                            window.location.href = 'index.php';
                        });
                    }
                }, 'json');
            });

            $('#passwordForm').on('submit', function(e) {
                e.preventDefault();
                var username = $('#username').val();
                var password = $('#password').val();
                var tableNumber = $('#table_number').val();
                var pax = $('#pax').val();

                $.post('table_management.php', { action: 'check_password', username: username, password: password }, function(response) {
                    if (response.status === 'success') {
                        var waiterName = response.first_name;
                        $.post('table_management.php', { action: 'clear_table', table_number: tableNumber, waiter_name: waiterName }, function(res) {
                            if (res.status === 'success') {
                                $('#passwordModal').modal('hide');
                                // Submit the order after clearing the table
                                $.post('submit_customer_order.php', {
                                    table_number: tableNumber,
                                    pax: pax
                                }, function() {
                                    alert('Order successfully submitted!');
                                    window.location.href = 'index.php';
                                });
                            } else {
                                alert('Failed to clear table.');
                            }
                        }, 'json');
                    } else {
                        alert('Incorrect username or password.');
                    }
                }, 'json');
            });
        });
    </script>
</body>
</html>
