<?php
include "../../connect.php";
$itemsid = filterRequest("itemsid");
$imagetwo = imageUpload("../../upload/items" , "secondphoto");
$imagethree = imageUpload("../../upload/items" , "thirdphoto");
$data = array(
"products_itemsId" => $itemsid,
"products_image2" => $imagetwo,
"products_image3" => "empty",
);
$data2 = array(
    "products_image3" => $imagethree,
    );

if($imagetwo != "empty"){
    insertData("products" , $data);
} 
if($imagethree != "empty"){
    updateData("products" , $data2 , "products_itemsId = $itemsid");
}  

?>