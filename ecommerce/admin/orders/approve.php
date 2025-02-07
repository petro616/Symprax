<?php
include "../../connect.php";
$ordersid = filterRequest("ordersid");
$usersid = filterRequest("usersid");
$data = array(
	"orders_status" => 1
);
updateData("orders" , $data , "orders_id = '$ordersid' AND orders_status = 0");
insertnotification("HEY MESTER" , "Your Order Is Approved And Now Preparing" , $usersid , "users$usersid" , "none" , "none");
?>