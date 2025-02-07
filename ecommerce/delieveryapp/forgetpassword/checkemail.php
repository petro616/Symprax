<?php
include "../../connect.php";
$email = filterRequest("email");
$verifycode = rand(10000 , 99999) ;



$stmt = $con->prepare("SELECT * from `delieveryapp` WHERE delieveryapp_email = ?");
$stmt->execute(array($email));
$count = $stmt->rowCount();

if($count > 0){
$data = array("verify_code" => $verifycode);
updateData("delieveryapp" , $data , "delieveryapp_email = '$email'");
sendmail($email , "Emporium" , "welcome your verify code => $verifycode");
}else{
    echo json_encode(array("status" => "failure"));
}