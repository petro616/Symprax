<?php
include "../../connect.php";
$verifycode = rand(10000 , 99999);
$email = filterRequest("email");
$data = array(
"verify_code" => $verifycode
);
updateData("adminapp",$data ,"admin_email = '$email'");
sendmail($email , "babe" , "welcome your verify code => $verifycode");
?>