<?php
include "../../connect.php";
$ordersid = filterRequest("ordersid");
$usersid = filterRequest("usersid");
$data = array(
	"orders_status" => 2
);
updateData("orders" , $data , "orders_id = '$ordersid' AND orders_status = 1");
insertnotification("HEY MESTER" , "Your Order Is Approved And Now Preparing" , $usersid , "users$usersid" , "none" , "none");
sendGCM("Warning" , "There Is An Order Wait For Approve" , "delievery" , "none" , "none");
?>