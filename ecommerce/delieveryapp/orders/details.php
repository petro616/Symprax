<?php
include "../../connect.php";
$id = filterRequest("id");
getAllData("orderdetailsview" , "cart_orders = $id");
?>