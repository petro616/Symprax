<?php

// ==========================================================
//  Copyright Reserved Wael Wael Abo Hamza (Course Ecommerce)
// ==========================================================

define("MB", 1048576);

function filterRequest($requestname)
{
  return  htmlspecialchars(strip_tags($_POST[$requestname]));
}

function getAllData($table, $where = null, $values = null , $json = true)
{
    global $con;
    $data = array();
    if($where == null){
        $stmt = $con->prepare("SELECT  * FROM $table");
    }else{
        $stmt = $con->prepare("SELECT  * FROM $table WHERE   $where ");    
    }
    $stmt->execute($values);
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $count  = $stmt->rowCount();
    if($json == true){
        if ($count > 0){
            echo json_encode(array("status" => "success", "data" => $data));
        } else {
            echo json_encode(array("status" => "failure"));
        }
        return $count;
    }else{
    if($count > 0){
    return array("status" => "success" , "data" => $data);
    }else{
    return  array("status" => "failure");
    }
    }
    
}

function getData($table, $where = null, $values = null , $json = true)
{
    global $con;
    $data = array();
    $stmt = $con->prepare("SELECT  * FROM $table WHERE   $where ");
    $stmt->execute($values);
    $data = $stmt->fetch(PDO::FETCH_ASSOC);
    $count  = $stmt->rowCount();
    if($json == true){
        if ($count > 0){
            echo json_encode(array("status" => "success", "data" => $data));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }else{
    return $count;
    }
    
    
}

function insertData($table, $data, $json = true)
{
    global $con;
    foreach ($data as $field => $v)
        $ins[] = ':' . $field;
    $ins = implode(',', $ins);
    $fields = implode(',', array_keys($data));
    $sql = "INSERT INTO $table ($fields) VALUES ($ins)";

    $stmt = $con->prepare($sql);
    foreach ($data as $f => $v) {
        $stmt->bindValue(':' . $f, $v);
    }
    $stmt->execute();
    $count = $stmt->rowCount();
    if ($json == true) {
    if ($count > 0) {
        echo json_encode(array("status" => "success"));
    } else {
        echo json_encode(array("status" => "failure"));
    }
  }
    return $count;
}


function updateData($table, $data, $where, $json = true)
{
    global $con;
    $cols = array();
    $vals = array();

    foreach ($data as $key => $val) {
        $vals[] = "$val";
        $cols[] = "`$key` =  ? ";
    }
    $sql = "UPDATE $table SET " . implode(', ', $cols) . " WHERE $where";

    $stmt = $con->prepare($sql);
    $stmt->execute($vals);
    $count = $stmt->rowCount();
    if ($json == true) {
    if ($count > 0) {
        echo json_encode(array("status" => "success"));
    } else {
        echo json_encode(array("status" => "failure"));
    }
    }
    return $count;
}

function deleteData($table, $where, $json = true)
{
    global $con;
    $stmt = $con->prepare("DELETE FROM $table WHERE $where");
    $stmt->execute();
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success"));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }
    return $count;
}

function imageUpload($dir , $imageRequest)
{
  global $msgError;
  if(isset($_FILES[$imageRequest])){
  $imagename  = rand(1000, 10000) . $_FILES[$imageRequest]['name'];
  $imagetmp   = $_FILES[$imageRequest]['tmp_name'];
  $imagesize  = $_FILES[$imageRequest]['size'];
  $allowExt   = array("jpg", "png", "gif", "mp3", "pdf");
  $strToArray = explode(".", $imagename);
  $ext        = end($strToArray);
  $ext        = strtolower($ext);

  if (!empty($imagename) && !in_array($ext, $allowExt)) {
    $msgError = "EXT";
  }
  if ($imagesize > 2 * MB) {
    $msgError = "size";
  }
  if (empty($msgError)) {
    move_uploaded_file($imagetmp,  $dir . "/" . $imagename);
    return $imagename;
  } else {
    return "fail";
  }
  }else{
    return "empty";
  }

}



function deleteFile($dir, $imagename)
{
    if (file_exists($dir . "/" . $imagename)) {
        unlink($dir . "/" . $imagename);
    }
}

function checkAuthenticate()
{
    if (isset($_SERVER['PHP_AUTH_USER'])  && isset($_SERVER['PHP_AUTH_PW'])) {
        if ($_SERVER['PHP_AUTH_USER'] != "wael" ||  $_SERVER['PHP_AUTH_PW'] != "wael12345") {
            header('WWW-Authenticate: Basic realm="My Realm"');
            header('HTTP/1.0 401 Unauthorized');
            echo 'Page Not Found';
            exit;
        }
    } else {
        exit;
    }

    // End 
}
  
  

function getAccessToken() {  
    $url = "https://oauth2.googleapis.com/token"; // Google OAuth token endpoint  
    $fields = array(  
        'grant_type' => 'urn:ietf:params:oauth:grant-type:jwt-bearer',  
        'assertion' => createJWT() // Use the createJWT function  
    );  

    // Set headers  
    $headers = array(  
        'Content-Type: application/x-www-form-urlencoded',  
    );  

    // Initialize cURL  
    $ch = curl_init();  
    curl_setopt($ch, CURLOPT_URL, $url);  
    curl_setopt($ch, CURLOPT_POST, true);  
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);  
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);  
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($fields));  

    // Execute and handle errors  
    $result = curl_exec($ch);  
    if ($result === false) {  
        echo 'Curl error: ' . curl_error($ch);  
        return null;  
    }  

    // Decode JSON response  
    $data = json_decode($result, true);  
    curl_close($ch);  

    return $data['access_token'] ?? null; // Access token  
}  

function createJWT() {  
    $serviceAccountEmail = 'firebase-adminsdk-or5yo@ecommerceapp2-aaed0.iam.gserviceaccount.com'; // Update with your service account email  
    $privateKey = "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDKmYau86CUjD2D\nXeMBZkZz25tuU9EFlUBDRIt8X04F6Zx6UumC9tQBEWyUPDOpjs5pVt2mOgcu8+OE\nk4f8RpqAMuiwtQ1nuJJXadEOtaWvkRfunfg71Xr6zmjc10uXbh/OdozstGQFTGQR\nv98+YRDRO0/ap5lMZRODPfbKfzWKe53RyCuiJmQVpCtukjZ30T01l6+9B5OASkma\nIpzdsHTfmgBK4EUxEN/N9s9dj7NUrjbqIcXe9dkHa1L39rKTqHO3AcCS+k4hHaMi\nUZfrWva8zUfhdmJvPMlC/kvC0NVtPsERSwOvZS+Zq/qHj7FhzlJ8dmbEJbuIuRt0\nJ+aUXLDNAgMBAAECggEAAL9ina2nd4oxmz+oRp6L1FdInQvGdy35pTs7r934KecW\nnTrwwqYfhSYnz5TjSepi0kUFn1ySdIwQ2FyPrBDPTCQj81b6XC90VsnnVsBj1/XX\nRURO9gWPz8dy3/G+xSnHs0QruUnhyUU4D1AKcQP8WGakIPXtB7j4bUu4EpTiloa5\nj+ivTuR7ddRZvUBYbm35F+xl34AS1qIWZYH9Qtm+fG3+9DZUmVINeekci7Ou0hwh\nazbyIJlGU9qmt/yaSYAHdaVTnkLUYtnXABMTSMOLYwfEquNbz9HHLsvcIGvnJs7S\nTyPy1QLyODHpE087zb7Sc5QKp3KoU2PFe+ZkR7p+fwKBgQD4wkemdV6E9kwRJ40O\ngUICZy0DSL8iWEHO2I+ZCcuSA9aCt0SieR3IP8YkrTyLgCzfMAv5EDpkn03R4lkG\n9P8Fh9MNEswiO4AqkN9WfbpazF91ABkMHvkXv3iJrkbEvYScd5P29Jsv4xkgA+y0\nrmsf3n2JdjsZS8Ey0SYAUwbywwKBgQDQf0YRiApdeBy/1l48faEzgYCXCZlq8FwT\ncZiNb60he84F6cHxxpv5bMCA5V1dVNJLMBVwIna5m3qVDSjvyhTrQ7K+heGfF048\nJK9zLOHnuZJPzcDO+sb0enq5fXvfl5WsqxXSX6IOvJxyil3iFP8hQYe0B+WUml+b\nWvqmyiF1LwKBgG+SI7TDG5ujJEblaFzDGKofQI8ih6eN0iZF91H6lLVuxz1lmYEN\ntY/lGqfEk002Nen8kMIqxyXuVWb3kFqQc/k1DDHm5mvMKBXvWFxgk765v26olpNb\nKPm/xP5rjg4bumi7MUAoQZpezxwO5pG7UQzAK6oFv0f/NC3opJSsqIclAoGACqXl\nWzHabambtkRpbadw2yOLAKux1R9PZILRqq+AZQxgmja0+/cLsjJWpn6QRRr23nYn\nMiHgdFw3Z3NTmuN0LAu6DjbiLfDPwwyQlU4+f0of6cl1RlzSWlwC9oQtFl80eqwG\nIkdWDHCfgM4GO2ydFwK0voIEvJEhvtpnoKsECGsCgYEAk+YO13ds+ou/+VrXNEAk\nJEAAn6lsnNI0q8orgFKJq5e+a5AQEdOq0yYtfY0imU4nL5UtC8aRYQki8SN0J6s0\n7UvmAE7RUGllzQ9jiQ6lIVKsP12mjq0q5nhuE8QT6WMaxQd/nXQ7cXszW1RHZTaw\nAqxLETr79PhMODZC+hZNnKQ=\n-----END PRIVATE KEY-----"; // Make sure this key is formatted correctly  
    $scope = 'https://www.googleapis.com/auth/firebase.messaging'; // Define your scope  
    $aud = 'https://oauth2.googleapis.com/token'; // Audience for the token  
    $iat = time(); // Issued at time  
    $exp = $iat + 3600; // Expiration time set to 1 hour from now  

    // Header  
    $header = json_encode([  
        'alg' => 'RS256',  
        'typ' => 'JWT'  
    ]);  
    
    // Payload  
    $payload = json_encode([  
        'iss' => $serviceAccountEmail,  
        'scope' => $scope,  
        'aud' => $aud,  
        'iat' => $iat,  
        'exp' => $exp  
    ]);  

    // Base64Url encode the header and payload  
    $headerBase64 = base64UrlEncode($header);  
    $payloadBase64 = base64UrlEncode($payload);  

    // Create the signature using the private key  
    $signature = '';  
    $signingInput = $headerBase64 . '.' . $payloadBase64;  
    openssl_sign($signingInput, $signature, $privateKey, OPENSSL_ALGO_SHA256);  
    
    // Base64Url encode the signature  
    $signatureBase64 = base64UrlEncode($signature);  

    // Form the JWT  
    $jwt = $headerBase64 . '.' . $payloadBase64 . '.' . $signatureBase64;  

    return $jwt;  
}  

// Helper function for base64Url encoding  
function base64UrlEncode($data) {  
    return rtrim(strtr(base64_encode($data), '+/', '-_'), '=');  
}  

function sendGCM($title, $message, $topic, $pageid, $pagename) {  
    // URL for Firebase Cloud Messaging  
    $url = 'https://fcm.googleapis.com/v1/projects/ecommerceapp2-aaed0/messages:send';  

    // Constructing the message payload  
    $fields = array(  
        "message" => array(  
            "topic" => $topic,  
            "notification" => array(  
                "body" => $message,  
                "title" => $title  
            ),  
            "data" => array(  
                "keysandvalues" => json_encode(array(  
                    "pageid" => $pageid,  
                    "pagename" => $pagename  
                ))  
            ),  
            "android" => array(  
                "priority" => "high",  
                "notification" => array(  
                    "click_action" => "FLUTTER_NOTIFICATION_CLICK" // Adjust if necessary  
                )  
            ),  
            "apns" => array( // Optional: for iOS notifications  
                "payload" => array(  
                    "aps" => array(  
                        "content-available" => 1,  
                        "category" => "NEW_MESSAGE_CATEGORY" // Adjust if necessary  
                    )  
                )  
            ),  
        )  
    );  
    
    // Encoding the fields as JSON  
    $fields = json_encode($fields);  
    
    // Get the access token using the getAccessToken function  
    $accessToken = getAccessToken(); // Retrieve the access token  

    if (!$accessToken) {  
        echo "Failed to retrieve access token.\n";  
        return; // Exit if token is not retrieved  
    }  

    // Headers for the request  
    $headers = array(  
        'Authorization: Bearer ' . $accessToken, // Use the dynamic access token  
        'Content-Type: application/json'  
    );  
    
    // Initializing a cURL session  
    $ch = curl_init();  
    curl_setopt($ch, CURLOPT_URL, $url);  
    curl_setopt($ch, CURLOPT_POST, true);  
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);  
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);  
    curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);  
    
    // Executing the cURL request  
    $result = curl_exec($ch);  
    
    // Error handling  
    if ($result === false) {  
        echo 'Curl error: ' . curl_error($ch);  
    } else {  
      //  echo "Response: " . $result; // Log the response for debugging  
    }  
    
    // Closing cURL session  
    curl_close($ch);  
    
    // Returning the result  
    return $result;  
}  
function insertnotification($title , $body , $usersid , $topic , $pageid , $pagename){
    global $con;
    $stmt = $con->prepare("INSERT INTO `notifications`(`notifications_title`, `notifications_body`, `notifications_usersid`) VALUES (?,?,?)");
    $stmt->execute(array($title , $body , $usersid));
    sendGCM($title , $body , $topic , $pageid , $pagename);
    $count = $stmt->rowCount();
    return $count;

}
function sendmail($to , $title , $body){
    $header = "From: rebal@repostoree.online\r\n";
$header = "CC: repo@repostoree.online\r\n";
    mail($to , $title , $body , $header);
}