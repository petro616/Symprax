<?php
include "../../connect.php";

$email = filterRequest("email");
$verifycode = filterRequest("verifycode");

$stmt = $con->prepare("SELECT * FROM `delieveryapp` WHERE delieveryapp_email = '$email' AND verify_code = '$verifycode'");
$stmt->execute();
$count = $stmt->rowCount();
if($count > 0){
$data = array("delieveryapp_approve" => "1");
updateData("delieveryapp", $data,"delieveryapp_email = '$email'");
}else{
echo json_encode(array("status" => "failure"));
}


?>