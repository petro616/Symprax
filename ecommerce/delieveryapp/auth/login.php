<?php
include "../../connect.php";
$email = filterRequest("email");
$password = sha1($_POST["password"]) ;
getData("delieveryapp" , "delieveryapp_email = ? AND delieveryapp_password = ?" , array($email , $password));













