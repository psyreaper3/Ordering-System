<?php
// Database connection parameters
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "avodah_emp";
$timezone = 'Asia/Manila';
date_default_timezone_set($timezone);//set timezone 

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

?>
