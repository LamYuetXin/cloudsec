<?php
$serverName= "MYSERVER\ASSIGNMENT"; #change to your server name
$connectionInfo= array("Database"=>"BakeryOrderSystem", "UID"=>"bakery_user", "PWD"=>"StrongPassword123!");
$conn = sqlsrv_connect($serverName, $connectionInfo);

if($conn === false) {
    die(print_r(sqlsrv_errors(), true));
}
?>