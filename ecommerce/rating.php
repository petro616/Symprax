<?php
include "connect.php";
$id = filterRequest("id");
$rating = filterRequest("rating");
$comment = filterRequest("comment");
$data = array(
"orders_noterating" => $comment,
"orders-rating" => $rating
);
updateData("orders" , $data , "orders_id = $id");
?>