# Ordering-System
I am Louie Jay Orellana Jayme, and this is an ordering System I created for Avodah Kitchen (the uploaded file is part of the bigger system that i have created), i'm using it for the sole purpose of getting a hired for a job

Requirements: a running web server (xampp or lampp)
Once installed you will need to go to http://localhost/phpmyadmin and add a database, you can rename it however you want but you'll need to change the name in config.php too the default database name is avodah_emp
now after the database is created, you can import the database called avodah_emp.sql
this database includes a user "admin" and password "password" because there is a check if the table is still occupied or not, and it will require a username and password to clear it out, this is based on the restaurant's work flow.

Optional: Thermal printer (ip based)
to use the thermal printer you will need to remove the /* and */ found on config.php the disabled block of code checks for thermal printer connectivity it ensures that there is a connection between the device and the thermal printer for a guaranteed printing.
