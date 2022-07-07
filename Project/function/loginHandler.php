<?php
function sessionMsg() {
    if(isset($_SESSION['msg'])) {
      echo "<div class='container my-3'><div class='alert alert-{$_SESSION['msg_class']}'>
            {$_SESSION['msg']}
            </div></div>";
      unset($_SESSION['msg']);
      unset($_SESSION['msg_class']);
    }
  }
  
  
function setMsg($msg, $class) {
    global $message;
    $message['msg'] = $msg;
    $message['class'] = $class;
}

// create assoc array to maintain submitted data and errs
$new_user = [
    "username" => "",
    "username_err" => false,
   //  "email" => "",
   //  "email_err" => false,
    "password" => "",
    "password_err" => false,
    "password_confirm" => "",
    "password_confirm_err"=> false
 ];

 // login user arr to store login data and errors
 $login_user = [
    "username" => "",
    "username_err" => false,
    "password" => "",
    "password_err" => false
 ];

 function validateLogin($user, &$login_user) {
    global $conn;
    // assign values to login_user arr, sanitize username
    $login_user['username'] = htmlspecialchars($user['username']); //$_POST['username']
    $login_user['password'] = $user['password'];
    //bring in the users as an assoc arr
    $user = getUser($login_user['username']);
    if(empty($user)) {
       setMsg("Username not found!", "danger");
       $login_user['username_err'] = true;
    } else {
       // next step: check user pw against the hash in the db
       // access the user using the index
       if(password_verify($login_user['password'], $user['pw_hash'])) {
          //login the user
          loginUser($user);
       } else {
          // output error msg about PW
          $login_user['password_err'] = true;
          setMsg("Incorrect password!", "danger");
       }
    }
 }


 function validateNewUser($user, &$new_user) {
    $new_user['username'] = htmlspecialchars($user['username']);
   //  $new_user['email'] = filter_var($user['email'], FILTER_SANITIZE_EMAIL);
    $new_user['password'] = htmlspecialchars($user['password']);
    $new_user['password_confirm'] = htmlspecialchars($user['password_confirm']);
    //input validation
    $user = getUser($new_user['username']);
    // check username > 5 chars
    if(strlen($new_user['username']) <  5 || (!empty($user))) {
       $new_user['username_err'] = true;
    }
    // check email is valid
   //  if(!filter_var($new_user['email'], FILTER_VALIDATE_EMAIL)) {
   //     $new_user['email_err'] = true;
   //  }
    // check password > 5 chars
    if(strlen($new_user['password']) < 5) {
       $new_user['password_err'] = true;
    }
    // check password a = password b
    if($new_user['password'] != $new_user['password_confirm']) {
       $new_user['password_confirm_err'] = true;
    }
    // check if any _err == true in $new_user, if no error create account, else output error msg setMsg($msg, $class)
    if(!array_search(true, $new_user, true)) {
      // create new account, login the user then redirect to home page
       createNewUser($new_user);
    } else {
       setMsg("There was an error with your submission!", "danger");
    }
 }

 function createNewUser($new_user) {
    global $conn;
    $user = [
       "username" => $new_user['username'],
      //  "email" => $new_user['email'],
       "password" => password_hash($new_user['password'], PASSWORD_DEFAULT)
    ];
    $sql = "INSERT INTO user (username, pw_hash) VALUES (?,?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $user['username'], $user['password']);
    $stmt->execute();
    if($stmt->affected_rows == 1) {
       $loginuser = getUser($user['username']);
       loginUser($loginuser);
    }
 }

 function loginUser($user) {
    $_SESSION['username'] = $user['username'];
    $_SESSION['logged_in'] = true;
    $_SESSION['msg'] = "Logged in successfully!";
    $_SESSION['msg_class'] = "success";
    // send user back to homepage 
    header("Location: index.php");
 }


 function getUser($user) {
    global $conn;
    $sql = "SELECT * FROM user WHERE username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $user);
    $stmt->execute();
    $result = $stmt->get_result();
    if($result->num_rows > 0) {
       return $result->fetch_assoc();
    } else {
       return 0;
    }
 }
 // helper function to output error class in input 
 function checkValid($field, $arr) {
    $key = $field . "_err"; // username + _err => $new_user['username_err']
    if($arr[$key]) {
       echo "is-invalid";
    }
 }