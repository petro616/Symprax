<?php
include "../../connect.php";
$name = filterRequest("name");
$namear = filterRequest("namear");
$imagename = imageUpload("../../upload/categories" , "files");
$data = array(
"categories_name" => $name,
"categories_name_ar" =>  $namear,
"categories_image" =>  $imagename,
);
insertData("categories" , $data);
?>