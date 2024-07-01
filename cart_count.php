<?php
session_start();
$totalQuantity = 0;

if (isset($_SESSION['cart'])) {
    foreach ($_SESSION['cart'] as $cartItem) {
        $totalQuantity += $cartItem['quantity'];
    }
}

echo $totalQuantity;
?>
