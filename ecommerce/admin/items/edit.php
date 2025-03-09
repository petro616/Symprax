<?php
include "../../connect.php";
$res = imageUpload("../../upload/categories" , "imagename");
$imageold = filterRequest("imageold");
$imageoldtwo = filterRequest("imageoldtwo");
$imageoldthree = filterRequest("imageoldthree");

$name = filterRequest("name");
$namear = filterRequest("namear");
$desc = filterRequest("desc");
$descar = filterRequest("descar");
$price = filterRequest("price");
$discount = filterRequest("discount");
$count = filterRequest("count");
$active = filterRequest("active");
$catid = filterRequest("catid");
$itemsid = filterRequest("itemsid");
$imagetwo = imageUpload("../../upload/items" , "image2");
$imagethree = imageUpload("../../upload/items" , "image3");
if($res == "empty"){
    $data = array(
        "items_name" => $name,
        "items_name_ar" =>  $namear,
        "items_description" =>  $desc,
        "items_description_ar" =>  $descar,
        "items_price" =>  $price,
        "items_discount" =>  $discount,
        "items_count" =>  $count,
        "items_active" =>  $active,
        "items_catego" =>  $catid,
        );
}else{
    deleteFile("../../upload/categories" , $imageold);
    deleteFile("../../upload/categories" , $imageoldtwo);
    deleteFile("../../upload/categories" , $imageoldthree);
    $data = array(
   "items_name" => $name,
   "items_name_ar" =>  $namear,
   "items_description" =>  $desc,
   "items_description_ar" =>  $descar,
   "items_image" =>  $res,
   "items_price" =>  $price,
   "items_discount" =>  $discount,
   "items_count" =>  $count,
   "items_active" =>  $active,
   "items_catego" =>  $catid,
    );
    $data2 = array(
    "products_image2" => $imagetwo,
    "products_image3" => $imagethree,
    );
}
updateData("items" , $data , "items_id  = $itemsid");
updateData("products" , $data2 , "products_itemsId = $itemsid" , false);
?>