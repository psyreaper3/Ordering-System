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

/*
// Read the INI file
$config = parse_ini_file('printer.ini', true);

// Check if the file was successfully parsed
if ($config === false) {
    die('Error: Unable to parse printer.ini');
}

// Access the data as variables
$printer_ip = $config['printer']['ip'];
$printer_port = $config['printer']['port'];

// Attempt to establish a connection to the printer
$socket = @fsockopen($printer_ip, $printer_port, $errno, $errstr, 10);

// Check if the connection was successful, this is to stop the operation if printer connection isn't established
if (!$socket) {
    die("Error: Unable to connect to printer. Error: $errno - $errstr");
}

// Close the socket connection
fclose($socket);

// Proceed with further execution since the connection was successful
*/
?>
