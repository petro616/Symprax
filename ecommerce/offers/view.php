<?php
include "../connect.php";
$stmt = $con->prepare("SELECT items1view.*  , 1 AS favoutire , (items_price - (items_price * items_discount / 100)) AS itemspricediscount FROM items1view INNER JOIN favoutire
ON items1view.items_id = favoutire.favoutire_itemsid 
WHERE items_discount != 0
UNION ALL
SELECT *  , 0 AS favoutire , (items_price - (items_price * items_discount / 100)) AS itemspricediscount FROM items1view
WHERE items_discount != 0 AND items1view.items_id NOT IN (SELECT items1view.items_id FROM items1view INNER JOIN favoutire
ON items1view.items_id = favoutire.favoutire_itemsid )");
$stmt->execute();
$count = $stmt->rowCount();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
if($count > 0){
    echo json_encode(array("status" => "success" , "data" => $data)) ; 
}else{
    echo json_encode(array("status" => "failure")) ;
}
?>