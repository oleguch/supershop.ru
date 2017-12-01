<?php
$dbconn=pg_connect("host=localhost dbname=osamylov_db user=osamylov password=384osamylov231");
    if ($dbconn===false) {
        echo "Error opening";
    }
session_start();

//=============================ПРОВЕРКА АВТОРИЗЦИИ
if (isset($_GET['auth'])) {
    $error = [];
    $email = $_GET['email'];
    $pass = $_GET['pass'];
    $query = "select * from users where email = '$email'";
    if (!$email) {
        $error['email']=1;
    } else  if (!$pass) {
        $error['pass']=1;
    } else {
        $result = pg_query($dbconn, $query);
        $r = pg_fetch_array($result);
        if (!$r) {
            echo "Error!<br>";
            echo $r['name'];
            $error['email'] = 2;
        } else if (!password_verify($pass,$r['pass'])) 
            $error['pass'] = 2;
    }
    print_r($error);
    if ($error)
        header("Location:index.php?page=auth&name=$_GET[email]&error[email]=$error[email]&error[pass]=$error[pass]");
    else {
        $_SESSION['user'] = $r;
        header("Location:index.php");
    }
}





//============================ПРОВЕРКА РЕГИСТРАЦИИ
if (isset($_GET['reg'])) {
    $error=[];
    $name = $_GET['name'];
    $email = $_GET['email'];
    $pass1 = $_GET['pass1'];
    $pass2 = $_GET['pass2'];
    $query = "select * from users where email = '$email'";
    if (!$name) {
        $error['name']=1;
    } else if (!$email) {
        $error['email']=1;
    } else  if (!$pass1) {
        $error['pass1']=1;
    } else  if (!$pass2) {
        $error['pass2']=1;
    } else if ($pass1 != $pass2) {
        $error['pass1'] = 2;
    } else {
        $result = pg_query($dbconn, $query);
        $r = pg_fetch_array($result);
        if ($r['email'] != "") {
            $error['email']=2;
        }
    }
    
    
    if ($error) {
        header("Location:index.php?page=registration&name=$name&email=$email&error[email]=$error[email]&error[pass1]=$error[pass1]&error[pass2]=$error[pass2]&error[name]=$error[name]");
    } else {
        $pass = password_hash($_GET['pass1'], PASSWORD_DEFAULT);
        $name = $_GET['name'];
        $email = $_GET['email'];
        pg_query($dbconn, "insert into users (name, email, pass) values ('$name','$email','$pass')");
        $_SESSION['user']['name'] = $name;
        $_SESSION['user']['email'] = $email;
        header("Location:index.php");
    }
}

//============================ПРОВЕРКА ДАННЫХ ЛИЧНОГО КАБИНЕТА
if (isset($_GET['lk'])) {
    $error=[];
    $name = $_GET['name'];
    $email = $_GET['email'];
    $pass1 = $_GET['pass1'];
    $pass2 = $_GET['pass2'];
    $city = $_GET['city'];
    $street = $_GET['street'];
    $house = $_GET['street'];
    $app = $_GET['app'];
    $phone = $_GET['phone'];
    
}

?>