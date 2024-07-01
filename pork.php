<?php
// Redirect /food_menu/pork to pork.php
if ($_SERVER['REQUEST_URI'] === '/food_menu/pork') {
    header('Location: /food_menu/pork.php', true, 301);
    exit;
}
if ($_SERVER['REQUEST_URI'] === '/food_menu/survey') {
    header('Location: /food_menu/survey.php', true, 301);
    exit;
}
session_start();

function unset_cart_and_redirect($redirectUrl) {
    // Unset the 'cart' session variable
    unset($_SESSION['cart']);
    
    // Redirect to the specified page
    header("Location: $redirectUrl");
    exit();
}

// Determine the redirect URL based on the page
$page = isset($_GET['page']) ? $_GET['page'] : '';

if (isset($_GET['unset_cart']) && $_GET['unset_cart'] == '1') {
    if ($page == 'pork') {
        unset_cart_and_redirect('pork.php');
    } elseif ($page == 'index') {
        unset_cart_and_redirect('index.php');
    }
}

// Include database connection
include 'config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $productId = $_POST['product_id'];
    $quantity = $_POST['quantity'];

    // Validate product ID and quantity
    if (!is_numeric($productId) || !is_numeric($quantity) || $quantity <= 0) {
        echo json_encode(['status' => 'error', 'message' => 'Invalid product ID or quantity']);
        exit;
    }

    // Fetch product details
    $stmt = $conn->prepare("SELECT product_id, product_name, unit_price FROM inventory WHERE product_id = ?");
    $stmt->bind_param('i', $productId);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows == 1) {
        $product = $result->fetch_assoc();

        // Add item to the cart
        if (!isset($_SESSION['cart'])) {
            $_SESSION['cart'] = [];
        }

        // Check if the item is already in the cart
        if (isset($_SESSION['cart'][$productId])) {
            $_SESSION['cart'][$productId]['quantity'] += $quantity;
        } else {
            $_SESSION['cart'][$productId] = [
                'product_id' => $product['product_id'],
                'product_name' => $product['product_name'],
                'unit_price' => $product['unit_price'],
                'quantity' => $quantity
            ];
        }

        echo json_encode(['status' => 'success', 'message' => 'Item added to cart']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Product not found']);
    }

    $stmt->close();
    $conn->close();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complete Menu</title>
    <link rel="icon" type="image/x-icon" href="favicon.ico">

    <!-- Include other CSS files -->
    <link rel="stylesheet" href="assets/css/all.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <style type="text/css">
        /* Additional CSS for styling */
        .grid-item {
            padding: 5px;
            margin-bottom: 5px;
            font-family: 'Avenir Regular', sans-serif;
        }
        .jumbotron {
            padding: 4rem 2rem !important;
        }
        img {
            max-width: 100%;
            height: auto;
            display: block; /* Ensures the image extends to the full width of its container */
            margin: 0 auto; /* Centers the image horizontally */
        }
        h5 {
            margin-bottom: 0;
        }
        .jumbotron {
            padding: 0rem 2rem;
        }
        .out_of_stock {
            color: gray;
            opacity: 0.3;
        }
        @font-face {
            font-family: 'Gloriousity Two';
            src: url('assets/webfonts/Gloriousity Two.ttf') format('truetype');
        }
        @font-face {
            font-family: 'Avenir Regular';
            src: url('assets/webfonts/Avenir Regular.ttf') format('truetype');
        }
        /* Apply Gloriousity Two font to category headers */
        h1 {
            font-family: 'Gloriousity Two', sans-serif;
            margin: 10px 0;
        }
        .hidden {
            display: none;
        }
        .description {
            margin-top: 0;
            font-size: 14px; /* Adjust font size for description */
            margin-bottom: 0px;
        }
        .tagline {
            font-family: 'Gloriousity Two', sans-serif;
            text-align: center;
            margin-top: 10px;
        }
        .subcategory{
            font-family: 'Avenir Regular', sans-serif;
        }
        .category {
            text-align: center;
        }
        /* Loading overlay styles */
        .loading-overlay {
            display: flex;
            justify-content: center;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background-color: rgba(255, 255, 255, 1);
            z-index: 9999;
        }

        .loading-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            position: relative;
        }

        .loading-image {
            max-width: 70vw;
            max-height: 70vh;
            object-fit: contain;
            margin-bottom: 20px;
            position: absolute;
            top: 50px; /* Adjust top position */
        }

        .tagline {
            font-family: 'Gloriousity Two', sans-serif;
            font-size: 34px;
            text-align: center;
            position: absolute;
            width: 100%; /* Make sure tagline spans the entire width */
            left: 0;
            right: 0;
            bottom: 100px;
        }
        .search-container {
            position: relative;
            width: 100%;
        }
        .search-input {
            width: 100%;
            padding-right: 25px; /* Space for the clear button */
        }
        .clear-button {
            position: absolute;
            right: 5px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            background: url('assets/images/clear-icon.png') no-repeat center center; /* Use your clear icon */
            background-size: 14px; /* Adjust the size of the clear icon */
            width: 20px;
            height: 20px;
            border: none;
            outline: none;
        }

        .legend{
            color:#000; 
            margin:0 0 0 5px;
            font-family: 'Avenir Regular', sans-serif;
        }
        .fa-star, .fa-home, .fa-pepper-hot{
            margin:0 10px;
            font-size: 17px;
        }
        .top_position {
            position: sticky;
            top: 0;
            z-index: 1000;
            padding: 20px;
            box-sizing: border-box;
            background-color: #e9ecef;
        }

        @media (max-width: 767px) {
            .top_position {
                padding: 15px; /* Reduce padding on smaller screens */
            }
            .legend{
                color:#000; 
                margin:0 0 0 5px;
                font-family: 'Avenir Regular', sans-serif;
                font-size:10px;
            }
        }
        .survey-container {
            display: flex;
            justify-content: space-between;
            align-items: start;
            margin: 0 0 20px 0;
        }

        .survey-link {
            margin-left: auto;
            display: flex;
            align-items: baseline;
            text-decoration: none;
            color: inherit;
        }

        .survey-link i {
            margin-right: 5px;
        }

       @media print {
    /* Apply different styles for printing */
    @page {
        size: A4; /* Set the page size to A4 */
        margin: 0; /* Reset margins for the printed page */
    }
    .out_of_stock{
        color:#212529;
        opacity: 1;
        text-decoration: none;
    }
    .row {
        margin-right: 0px;
        margin-left: 0px;
    }
    body {
        font-size: 12pt; /* Adjust font size for better readability when printed */
        padding: 50px;
        column-count: 2; /* Divide content into two columns */
        column-gap: 2px; /* Add gap between columns for better readability */
    }
    .h1, h1{
        font-size: 2rem;
    }

    /* Adjust other styles as needed for printing */
    /* For example, you may want to hide certain elements that are not relevant for printing */
    .search-container,
    .top_position, 
    .legend {
        display: none; /* Hide search container and top position div */
    }

    .jumbotron {
        padding: 0 !important; /* Remove padding to utilize space more efficiently */
    }

    .grid-item {
        padding: 3px; /* Add padding for spacing between items */
        box-sizing: border-box; /* Include padding and border in the width */
        margin: 0;
    }

    .description {
        word-wrap: break-word; /* Wrap long words to maintain readability */
        max-width: 50%;
        margin-bottom: 5px; /* Add margin to create space between items */
    }

    .category {
        text-align: left;
        margin-top: 5px;
    }
}
.quantity-input {
    width: 100px;
    padding: 2px 5px;
    margin-right: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.add-to-cart-btn {
    padding: 5px 10px;
    background-color: #dd0000;
    font-size: 10px;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.add-to-cart-btn:hover {
    background-color: #218838;
}

.view-cart-icon {
    position: fixed;
    bottom: 40px;
    right: 20px;
    font-size: 34px;
    color: #dd0000;
    z-index:1000;
    display: flex;
    align-items: center;
}

.view-cart-icon:hover {
    color: #007bff;
}

.cart-counter {
    background-color: #dd0000;
    color: white;
    border-radius: 50%;
    padding: 5px 10px;
    margin-left: 0px;
    margin-bottom: 30px;
    font-size: 14px;
}

    </style>
</head>
<body>
    <!-- Loading overlay -->
    <div class="loading-overlay">
        <img src="assets/images/logo.png" alt="Loading..." class="loading-image">
        <br> <br>
        <p class='tagline'>Cravings for the curious</p>
    </div>
    <script type="text/javascript">
        function confirmRedirect(page) {
            if (confirm("Heading to the Pork-Free Menu will clear your current order. Are you sure you wish to proceed?")) {
                window.location.href = "?unset_cart=1&page=" + page;
            }
        }//script for a href pork-free options
    </script>
    <div class="container mt-1">
        <div class="top_position">
            <div class="survey-container">
                <h4><a href="javascript:void(0);" onclick="confirmRedirect('index')">COMPLETE MENU</a></h4>
                <a href="http://avodahkitchen/food_menu/survey" target="_blank" class="survey-link">
                    <i class="fas fa-comment"></i> Survey
                </a>
                <a href="view_cart.php" class="view-cart-icon"><i class="fas fa-shopping-cart"></i><span class="cart-counter">0</span></a>
            </div>
                <i class='fas fa-star' style='color:#FDDA0D'><span class='legend'>BEST SELLER<span></i>
                <i class='fas fa-home' style='color:#FFA500'><span class='legend'> HOUSE SPECIALTY </span></i>
                <i class='fas fa-pepper-hot' style='color:#FF5349'><span class='legend'>SPICY</span></i>
                <hr class="my-4">
                <div class="form-group row">
                    <div class="col-12 col-md-6">
                        <!-- Search input with clear button -->
                         <div class="search-container">
                            <input type="text" class="form-control search-input" id="searchInput" placeholder="Click the Legends or type Spicy / Drinks / Share / Solo">
                            <button class="clear-button" type="button" id="clearSearch"></button>
                        </div>                   
                    </div>
                </div>
            </div>
        <div class="jumbotron">
            
            <!-- PHP code for fetching and displaying inventory items -->
 
            <?php
                // Display inventory items grouped by category
                // Fetch inventory data from the database
                $categories = array("Appetizers", "Salads", "Pasta", "Solo Meal", "To Share", "Pizza", "Desserts", "Drinks");
                foreach ($categories as $category) {
                    echo "<h1 class='category'>$category</h1>";
                    echo '<div class="row">';
                    // SQL query for drinks
                    if ($category == "Drinks") {
                        // Get unique drink classifications
                        $drinkClassifications = array("Coffee", "Soda", "Fruit based", "Ice Blended", "Flavored Lattes", "Tea Selections");
                        foreach ($drinkClassifications as $classification) {
                            echo "<div class='col-12'><h3 class='subcategory'>$classification</h3></div>";
                            $itemsQuery = "
                            SELECT product_id, 
                                        product_name, 
                                        product_image, 
                                        unit_price, 
                                        stock_quantity, 
                                        variety, 
                                        remarks,
                                        product_category, 
                                        product_classification, 
                                        product_description, 
                                        inventory_code
                FROM inventory
                WHERE inventory.inventory_code = 'menu_item' 
                  AND inventory.product_category = 'Drinks' 
                  AND inventory.product_classification = '$classification'
            ";
                            $result = $conn->query($itemsQuery);
                            if ($result->num_rows > 0) {
                                while($row = $result->fetch_assoc()) {
                                    displayDrinkItem($row);
                                }
                            } else {
                                echo '<p class="col-12">No inventory data available</p>';
                            }
                        }
                    } else {
                        // SQL query for other categories
                        $itemsQuery = "SELECT 
                                        product_id, 
                                        product_name, 
                                        product_image, 
                                        unit_price, 
                                        stock_quantity, 
                                        variety, 
                                        remarks,
                                        product_category, 
                                        product_classification, 
                                        product_description, 
                                        inventory_code
                                    FROM 
                                        inventory
                                    WHERE 
                                        inventory.inventory_code = 'menu_item' 
                                        AND product_category = '$category'
                                    ORDER BY product_classification
                                    ";
                        $result = $conn->query($itemsQuery);
                        if ($result->num_rows > 0) {
                            while($row = $result->fetch_assoc()) {
                                displayItem($row);
                            }
                        } else {
                            echo '<p class="col-12">No inventory data available</p>';
                        }
                    }
                    echo '</div>'; // Close row
                }

                // Function to display item
                function displayItem($row) {
                    echo '<div class="col-12 grid-item" data-product-id="' . $row['product_id'] . '">';
                    $remarks = ""; // Initialize remarks variable
                    if ($row['remarks'] == 'House Specialty') {
                        $remarks = "<i class='fas fa-home' style='color:#FFA500'></i>";                    
                    } elseif ($row['remarks'] == 'Spicy') {
                        $remarks = "<i class='fas fa-pepper-hot' style='color:#FF5349'></i>";
                    } elseif ($row['remarks'] == 'Very Spicy') {
                        $remarks = "<i class='fas fa-pepper-hot' style='color:#FF5349'><i class='fas fa-pepper-hot' style='color:#FF5349'></i></i>";
                    } elseif ($row['remarks'] == 'Best Seller') {
                        $remarks = "<i class='fas fa-star' style='color:#FDDA0D'></i>";
                    }
                    if ($row['stock_quantity'] == 0) {
                        echo "<h5><s class='out_of_stock'>" . $row['product_name'] . "</s></h5>";
                        echo "<p class='description'><s class='out_of_stock'>" . $row['product_description'] . "</s></p>";
                    } else {
                        echo "<h5>" . $row['product_name'] . " &#8369;" . $row['unit_price'] . $remarks . "</h5>";
                        echo "<p class='description'>" . $row['product_description'] . "</p>";

                        // Check if quantity is already set in session
                        $quantity = isset($_SESSION['cart'][$row['product_id']]) ? $_SESSION['cart'][$row['product_id']]['quantity'] : '';
                        echo '<input type="number" class="quantity-input" placeholder="Quantity" min="1" value="' . $quantity . '">';
                        echo '<button class="add-to-cart-btn">Add to Cart</button>';
                    }
                    echo "<sub class='hidden'>" . $row['product_category'] . "</sub>";
                    echo "<sub class='hidden'>" . $row['product_classification'] . "</sub>";
                    echo "<sub class='hidden remarks'>" . strtoupper($row['remarks']) . "</sub>";
                    echo '</div>';
                }

                // Function to display drink item
                function displayDrinkItem($row) {
                    echo '<div class="col-12 grid-item" data-product-id="' . $row['product_id'] . '">';
                    $remarks = ""; // Initialize remarks variable
                    if ($row['remarks'] == 'Best Seller') {
                        $remarks = "<i class='fas fa-star' style='color:#FDDA0D'></i>";
                    }
                    if ($row['stock_quantity'] == 0) {
                        echo "<h5><s class='out_of_stock'>" . $row['product_name'] . "</s></h5>";
                        echo "<p class='description'><s class='out_of_stock'>" . $row['product_description'] . "</s></p>";
                    } else {
                        echo "<h5>" . $row['product_name'] . " &#8369;" . $row['unit_price'] . $remarks . "</h5>";
                        echo "<p class='description'>" . $row['product_description'] . "</p>";

                        // Check if quantity is already set in session
                        $quantity = isset($_SESSION['cart'][$row['product_id']]) ? $_SESSION['cart'][$row['product_id']]['quantity'] : '';
                        echo '<input type="number" class="quantity-input" placeholder="Quantity" min="1" value="' . $quantity . '">';
                        echo '<button class="add-to-cart-btn">Add to Cart</button>';
                    }
                    echo "<sub class='hidden'>" . $row['product_category'] . "</sub>";
                    echo "<sub class='hidden'>" . $row['product_classification'] . "</sub>";
                    echo "<sub class='hidden remarks'>" . strtoupper($row['remarks']) . "</sub>";
                    echo '</div>';
                }
            ?>
        </div>
    </div>
    <script src="assets/js/jquery-3.6.0.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script>
       $(document).ready(function(){
    // Hide loading overlay after 2 seconds (simulate loading)
    setTimeout(function(){
        $('.loading-overlay').fadeOut();
    }, 200);

    // Filter items based on search input
    $('#searchInput').on('keyup', function(){
        var searchText = $(this).val().toLowerCase();
        $('.grid-item, .category, .subcategory').each(function(){
            var itemText = $(this).text().toLowerCase();
            if(itemText.indexOf(searchText) === -1){
                $(this).hide();
            }else{
                $(this).show();
            }
        });
    });

    // Sort items based on remarks when clicking on the icons
    $('.legend').on('click', function(){
        var remark = $(this).text().trim(); // Get the text of the clicked icon
        $('.grid-item, .category, .subcategory').each(function(){
            var itemRemark = $(this).find('.remarks').text().trim(); // Get the remarks of the item
            if(itemRemark !== remark){
                $(this).hide();
            } else {
                $(this).show();
            }
        });
    });

    // Clear search input and display all hidden items when clear button is clicked
    $('#clearSearch').on('click', function(){
        $('#searchInput').val(''); // Clear search input
        $('.grid-item, .category, .subcategory').show(); // Show all items
    });

    // Update cart counter
    function updateCartCounter() {
        $.get('cart_count.php', function(data) {
            $('.cart-counter').text(data);
        });
    }

    // Handle adding items to the cart
    $(document).on('click', '.add-to-cart-btn', function(){
        var $gridItem = $(this).closest('.grid-item');
        var productId = $gridItem.data('product-id');
        var quantity = $gridItem.find('.quantity-input').val();

        if (quantity && quantity > 0) {
            // Add item to cart
            $.post('add_to_cart.php', { product_id: productId, quantity: quantity }, function(response) {
                updateCartCounter();
                // Animate cart icon
                var $cartIcon = $('.view-cart-icon');
                $cartIcon.addClass('animate__animated animate__shakeX');
                setTimeout(function() {
                    $cartIcon.removeClass('animate__animated animate__shakeX');
                }, 800);
            });
        } else {
            alert('Please enter a valid quantity');
        }
    });

    // Initial cart counter update
    updateCartCounter();
});
    </script>
</body>
</html>
