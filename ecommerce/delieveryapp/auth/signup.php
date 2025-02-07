<?php
include "../../connect.php";
$username = filterRequest("username");
$email = filterRequest("email");
$password = sha1($_POST["password"]) ;
$phone = filterRequest("phone");
$verifycode = rand(10000 , 99999);
$stmt = $con->prepare("SELECT * from `delieveryapp` WHERE 	delieveryapp_email = ? OR delieveryapp_phone = ?");
$stmt->execute(array($email , $phone));
$count = $stmt->rowCount();
if($count > 0){
echo json_encode(array("status" => "failure"));
}else{
    $data = array(
    "delieveryapp_name" => $username,
    "delieveryapp_email" => $email,
    "delieveryapp_password" => $password,
    "delieveryapp_phone" => $phone,
    "verify_code" => $verifycode,
    );
    sendmail($email , "babe" , "welcome your verify code => $verifycode");
    insertData("delieveryapp" , $data);
}
