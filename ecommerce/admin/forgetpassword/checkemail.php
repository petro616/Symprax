<?php
include "../../connect.php";
$email = filterRequest("email");
$verifycode = rand(10000 , 99999) ;



$stmt = $con->prepare("SELECT * from `adminapp` WHERE admin_email = ?");
$stmt->execute(array($email));
$count = $stmt->rowCount();

if($count > 0){
$data = array("verify_code" => $verifycode);
updateData("adminapp" , $data , "admin_email = '$email'");
sendmail($email , "Emporium" , "welcome your verify code => $verifycode");
}else{
    echo json_encode(array("status" => "failure"));
}