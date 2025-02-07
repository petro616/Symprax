<?php
include "../../connect.php";
$name = filterRequest("name");
$namear = filterRequest("namear");
$desc = filterRequest("desc");
$descar = filterRequest("descar");
$imagename = imageUpload("../../upload/items" , "files");
$price = filterRequest("price");
$discount = filterRequest("discount");
$count = filterRequest("count");
$datenow = filterRequest("datenow");
$catid = filterRequest("catid");
$data = array(
"items_name" => $name,
"items_name_ar" =>  $namear,
"items_description" =>  $desc,
"items_description_ar" =>  $descar,
"items_image" =>  $imagename,
"items_price" =>  $price,
"items_discount" =>  $discount,
"items_count" =>  $count,
"items_active" =>  "1",
"items_datetime" =>  $datenow,
"items_catego" =>  $catid,
);
insertData("items" , $data);
?>