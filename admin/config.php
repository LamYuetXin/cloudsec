<?php
// $serverName= "MYSERVER\ASSIGNMENT"; #change to your server name
// $connectionInfo= array("Database"=>"BakeryOrderSystem", "UID"=>"bakery_user", "PWD"=>"StrongPassword123!");
// $conn = sqlsrv_connect($serverName, $connectionInfo);
function getRoleConnection($role){ 
    $serverName ="MYSERVER\ASSIGNMENT";
    $connectionInfo['Database']='BakeryOrderSystem';
    switch($role){
        case 'admin':
            $connectionInfo['UID']='bakery_admin_login';
            $connectionInfo['PWD']='AdminPass123!';
            break;
        case 'staff':
            $connectionInfo['UID']='bakery_staff_login';
            $connectionInfo['PWD']='StaffPass123!';
            break;
        case 'customer':
            $connectionInfo['UID']='bakery_customer_login';
            $connectionInfo['PWD']='CusPass123!';
            break;
        case 'guest':
            $connectionInfo['UID']='bakery_guest_login';
            $connectionInfo['PWD']='GuestPass123!';
            break;
    }
    return sqlsrv_connect($serverName, $connectionInfo);
}
// if($conn === false) {
//     die(print_r(sqlsrv_errors(), true));
// }
?>