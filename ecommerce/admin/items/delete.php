<?php
include "../../connect.php";
$itemsid = filterRequest("itemsid");
$imagename = filterRequest("imagename");
$imagetwo = filterRequest("imagetwo");
$imagethree = filterRequest("imagethree");
deleteFile("../../upload/items" , $imagename);
deleteFile("../../upload/items" , $imagetwo);
deleteFile("../../upload/items" , $imagethree);
deleteData("items" , "items_id  = $itemsid");
//deleteData("products" , "products_itemsId  = $itemsid" , false);
?>