<?php
include "connect.php";
$alldata = array();
$alldata["status"] = "success" ;
$categories = getAllData("categories" , null , null , false);
$alldata["categories"] = $categories;
$items = getAllData("items1view" , "1 = 1 LIMIT 25" , null , false);
$alldata["items"] = $items;
$offers = getAllData("items1view" , "items_discount != 0" , null , false);
$alldata["offers"] = $offers;
$topselling =getAllData("itemstopselling" , "1 = 1 ORDER BY countitems DESC LIMIT 25" , null , false);
$alldata["topselling"] = $topselling;
echo json_encode($alldata);
?>