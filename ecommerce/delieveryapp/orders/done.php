<?php
include "../../connect.php";
$ordersid = filterRequest("ordersid");
$usersid = filterRequest("usersid");
$data = array(
	"orders_status" => 4
);
updateData("orders" , $data , "orders_id = '$ordersid' AND orders_status = 3");
insertnotification("HEY MESTER" , "Your Order Is With You Know Enjoy It" , $usersid , "users$usersid" , "none" , "none");
sendGCM("Warning" , "The Order Has Been Delieveryied To The Customer" , "services" , "none" , "none");
?>