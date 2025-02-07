<?php
include "../../connect.php";
$email = filterRequest("email");
$password = sha1($_POST["password"]);
$data = array("delieveryapp_password" => $password);
updateData("delieveryapp" , $data , "delieveryapp_email = '$email'");