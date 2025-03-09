<?php
include "../../connect.php";
$ordersid = filterRequest("ordersid");
$usersid = filterRequest("usersid");
$delieveryid = filterRequest("delieveryid");
$data = array(
	"orders_status" => 3,
	"orders_delievery" => $delieveryid
);
updateData("orders" , $data , "orders_id = '$ordersid' AND orders_status = 2");
insertnotification("HEY MESTER" , "Your Order Is Now On The Way" , $usersid , "users$usersid" , "none" , "none");
sendGCM("Warning" , "The Order Has Been Approved By Delievery" . $delieveryid , "services" , "none" , "none");
sendGCM("Warning" , "The Order Has Been Approved By Delievery" . $delieveryid, "Delievery" , "none" , "none");
?>