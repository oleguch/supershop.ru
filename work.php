<?php
//$dbconn=pg_connect("host=localhost dbname=osamylov_db user=osamylov password=384osamylov231");
$dbconn=pg_connect("host=localhost dbname=twi2_sql user=postgres password=330117");
    if ($dbconn===false) {
        echo "Error opening";
    }
session_start();

//=============================ПРОВЕРКА АВТОРИЗЦИИ
if (isset($_GET['auth'])) {
    $error = 0;
    $email = $_GET['email'];
    $pass = $_GET['pass'];
    $query = "select * from osamylov_users where email = '$email'";
    if (!$email) {
        $error++;
        echo "Не введен адрес электронной почты";
    } else  if (!$pass) {
        $error++;
        echo "Не введен пароль";
    } else {
        $result = pg_query($dbconn, $query);
        $r = pg_fetch_array($result);
        if (!$r) {
            $error++;
            echo "Пользователь с такими данными не обнаружен";
        } else if (!password_verify($pass,$r['pass'])) {
            $error++;
            echo "Пароль неверен";
        }
    }
    if ($error == 0) {
        $_SESSION['user'] = $r;
        echo "ok";
        compare_cart_db_session($dbconn);
    }
}


function compare_cart_db_session($dbconn) {
    $id_user = $_SESSION['user']['id'];
    $query = "SELECT * from osamylov_orders WHERE id_user = ".$id_user." AND status = 'Корзина'";
    $r_cart = pg_fetch_array(pg_query($dbconn, $query));
    if (!$r_cart) {
        if (isset($_SESSION['cart_goods'])) {
            add_cart_from_ses_to_db($dbconn);
        }
    } else {
        if (!isset($_SESSION['cart_goods'])) {
            $_SESSION['cart'] = $r_cart;
            add_cart_from_db_to_ses($dbconn, $r_cart['id']);
        } else {
            combination_cart_db_ses($dbconn, $r_cart['id']);
        }
    }
}
function add_cart_from_ses_to_db($dbconn) {
    $id_cart = get_id_cart($_SESSION['user']['id'], $dbconn);
    foreach ($_SESSION['cart_goods'] as $good) {
        $id_good = $good['id_good'];
        $numbers = $good['number'];
        $id_var = $good['var'];
        $price = $good['price'];
        if ($id_var != '')
            $query_good = "INSERT INTO osamylov_sold_goods (id_order, id_good, numbers, id_var, price) VALUES (".$id_cart.", ".$id_good.", ".$numbers.", ".$id_var.", ".$price.")";
        else
            $query_good = "INSERT INTO osamylov_sold_goods (id_order, id_good, numbers, price) VALUES (".$id_cart.", ".$id_good.", ".$numbers.", ".$price.")";
        pg_query($dbconn, $query_good);
    }
}
function add_cart_from_db_to_ses($dbconn, $id_cart) {
    $query = "SELECT * FROM osamylov_sold_goods WHERE id_order = ".$id_cart;
    $res_cart = pg_query($dbconn, $query);
    while ($r = pg_fetch_array($res_cart)) {
        $_SESSION['cart_goods'][] = array('id_good' => $r['id_good'], 'number' => $r['numbers'], 'var' => $r['id_variant']);
    }
}
function combination_cart_db_ses($dbconn, $id_cart) {
    $query = "SELECT * FROM osamylov_sold_goods WHERE id_order = ".$id_cart;
    $res_cart = pg_query($dbconn, $query);
    while ($r = pg_fetch_array($res_cart)) {
        //echo "Сравним товар из бд под id = ".$r['id_good']."\n";
        $count = 0;
        foreach ($_SESSION['cart_goods'] as $k => $v) {
           // echo " c товаром из SESSION с id = ".$v['id_good'];
            if ($r['id_good'] == $v['id_good']) {
               // echo ". Совпадение!\n";
                $numbers = $v['number'] + $r['numbers'];
                change_count_good_in_cart_db($dbconn, $r['id_good'], $numbers, $_SESSION['user']['id']);
                $_SESSION['cart_goods'][$k]['number'] = $numbers;
            } else {
             //   echo ". Нет совпадения, идем дальше\n";
                $count ++;
                //$_SESSION['cart_goods'][] = array('id_good' => $r['id_good'], 'number' => $r['numbers'], 'var' => $r['id_variant']);
            }
        }
       // echo "Не совпали ".$count." товаров из сессии, где всего ".sizeof($_SESSION['cart_goods'])." товаров\n";
        if ($count == sizeof($_SESSION['cart_goods'])) {
       //     echo "Добавим товар с id = ".$r['id_good']." в сессию";
            $_SESSION['cart_goods'][] = array('id_good' => $r['id_good'], 'number' => $r['numbers'], 'var' => $r['id_variant']);
        }
    }
    $max_size = pg_fetch_row(pg_query($dbconn, "select COUNT (*) from osamylov_sold_goods where id_order = ".$id_cart))[0];
    foreach ($_SESSION['cart_goods'] as $k => $v) {
     //   echo "Сравним товар из сессии под id= ".$v['id_good']."\n";
        $count = 0;
        $res_cart = pg_query($dbconn, $query);
        while ($r = pg_fetch_array($res_cart)) {
            //  echo " с товаром из бд с id = ".$r['id_good']."\n";
            if ($r['id_good'] != $v['id_good']) {
                $count++;
            }
        }
         //       echo "Совпадения нет\n";

       // echo "Не совпали ".$count." товаров из базы, где всего ".$max_size." товаров\n";
        if ($count == $max_size) {
        //    echo "Добавим товар с id = ".$v['id_good']." в бд";
            $id_good = $v['id_good'];
            $numbers = $v['number'];
            $id_var = $v['var'];
            $price = $v['price'];
            if ($id_var != '')
                $query_good = "INSERT INTO osamylov_sold_goods (id_order, id_good, numbers, id_variant, price) VALUES (".$id_cart.", ".$id_good.", ".$numbers.", ".$id_var.", ".$price.")";
            else
                $query_good = "INSERT INTO osamylov_sold_goods (id_order, id_good, numbers, price) VALUES (".$id_cart.", ".$id_good.", ".$numbers.", ".$price.")";
            pg_query($dbconn, $query_good);
            $max_size++;
        }
    }


}
//============================ПРОВЕРКА РЕГИСТРАЦИИ
if (isset($_GET['reg'])) {
    $error = 0;
    $name = $_GET['name'];
    $email = $_GET['email'];
    $pass1 = $_GET['pass1'];
    $pass2 = $_GET['pass2'];
    $query = "select * from osamylov_users where email = '$email'";
    if (!$name) {
        $error++;
        echo "Поле Контактное лицо не введено";
    } else if (!$email) {
        $error++;
        echo "Поле E-mail не введено";
    } else  if (!$pass1) {
        $error++;
        echo "Пароль не введен";
    } else  if (!$pass2) {
        $error++;
        echo "Подтверждение пароля не введено";
    } else if ($pass1 != $pass2) {
        $error++;
        echo "Пароли не совпадают";
    } else {
        $result = pg_query($dbconn, $query);
        $r = pg_fetch_array($result);
        if ($r['email'] != "") {
            $error++;
            echo "Пользователь с таким E-mail уже зарегистрирован";
        }
    }
    
    if ($error>0) {
        //header("Location:index.php?page=registration&name=$name&email=$email&error[email]=$error[email]&error[pass1]=$error[pass1]&error[pass2]=$error[pass2]&error[name]=$error[name]");
    } else {
        $pass = password_hash($_GET['pass1'], PASSWORD_DEFAULT);
        $name = $_GET['name'];
        $email = $_GET['email'];
        $user = pg_fetch_array(pg_query($dbconn, "insert into osamylov_users (name, email, pass) values ('$name','$email','$pass') RETURNING *"));
        //$_SESSION['user']['name'] = $name;
        //$_SESSION['user']['email'] = $email;
        $_SESSION['user'] = $user;
        //header("Location:index.php");
        echo "ok";
        compare_cart_db_session($dbconn);
    }
}

//============================ПРОВЕРКА ДАННЫХ ЛИЧНОГО КАБИНЕТА
if (isset($_GET['lk'])) {
    $error= 0;
    $name = $_GET['fio'];
    $email = $_GET['email'];
    $pass1 = $_GET['pass1'];
    $pass2 = $_GET['pass2'];
    $city = $_GET['city'];
    $street = $_GET['street'];
    $house = $_GET['house'];
    $app = $_GET['app'];
    $phone = $_GET['phone'];
    if (!$name) {
        $error++;
        echo "Поле Контактное лицо обязательно для заполнения";
    } else if (!$email) {
        $error++;
        echo "Поле E-mail обязательно для заполнения";
    } else if ($pass1 != $pass2) {
        $error++;
        echo "Пароли не совпадают";
    } else if ($_SESSION['user']['email'] != $email) {
        echo "email another";
        $result = pg_query($dbconn, $query);
        $r = pg_fetch_array($result);
        if ($r['email'] != "") {
            $error++;
            echo "Пользователь с таким E-mail уже зарегистрирован";
        }
    } else if (($pass1 == "") && ($pass2 == "")) {
        echo "ok";
        pg_query($dbconn, "update users set 
                                name = '$name',
                                email = '$email',
                                phone = '$phone',
                                address_city = '$city',
                                address_street = '$street',
                                address_house = '$house',
                                address_app = '$app'
                                where email = '$email'");
    } else {
        echo "ok";
        $pass = password_hash($_GET['pass1'], PASSWORD_DEFAULT);
        pg_query($dbconn, "update users set 
                                name = '$name',
                                email = '$email',
                                phone = '$phone',
                                address_city = '$city',
                                address_street = '$street',
                                address_house = '$house',
                                address_app = '$app',
                                pass = '$pass'
                                where email = '$email'");
    }
    $_SESSION['user']['address_city'] = $_GET['city'];
    $_SESSION['user']['address_street'] = $_GET['street'];
    $_SESSION['user']['address_house'] = $_GET['street'];
    $_SESSION['user']['address_app'] = $_GET['app'];
    $_SESSION['user']['phone'] = $_GET['phone'];
    
}



//=============================ПРОВЕРКА НОВОГО ПОЛЬЗОВАТЕЛЯ КОРЗИНЫ
if (isset($_GET['order-newuser'])) {
    $error = 0;
    $email = $_GET['email'];
    $name = $_GET['name'];
    $phone = $_GET['phone'];
    $query = "select * from osamylov_users where email = '$email'";
    if (!$name) {
        $error++;
        echo "Не введено ФИО контактного лица";
    } else  if (!$phone) {
        $error++;
        echo "Не введен номер телефона";
    } else if (!$email) {
        $error++;
        echo "Не введен адрес электронной почты";
    } else {
        $_SESSION['cart']['name'] = $name;
        $_SESSION['cart']['email'] = $email;
        $_SESSION['cart']['phone'] = $phone;
        echo "ok";

    }
}

//=============================ПРОВЕРКА АДРЕСА КОРЗИНЫ
if (isset($_GET['order-delivery'])) {
    $error = 0;
    $city = $_GET['city'];
    $street = $_GET['street'];
    $house = $_GET['house'];
    $app = $_GET['app'];
    $vardelivery = $_GET['vardelivery'];
    $comment = $_GET['comment'];
    if (!$city) {
        $error++;
        echo "Не введен город";
    } else  if (!$street) {
        $error++;
        echo "Не введена улица";
    } else if (!$house) {
        $error++;
        echo "Не введен номер дома";
    } else {
        $_SESSION['cart']['city'] = $city;
        $_SESSION['cart']['street'] = $street;
        $_SESSION['cart']['house'] = $house;
        $_SESSION['cart']['app'] = $app;
        if ($vardelivery == 1) {
            $_SESSION['cart']['id_delivery'] = 1;
            $_SESSION['cart']['delivery'] = "Курьерская доставка <br> с оплатой при получении";
        } else if ($vardelivery == 2) {
            $_SESSION['cart']['id_delivery'] = 2;
            $_SESSION['cart']['delivery'] = "Почта России <br> с наложенным платежом"; 
        } else if ($vardelivery == 3) {
            $_SESSION['cart']['id_delivery'] = 3;
            $_SESSION['cart']['delivery'] = "Доставка через терминалы QIWI Post"; 
        }
        $_SESSION['cart']['comment'] = $comment;
        echo "ok";
        if (isset($_SESSION['user'])) {
            update_cart_info_address($dbconn);
        }
    }
}

function update_cart_info_address($dbconn) {
    $id_cart = get_id_cart($_SESSION['user']['id'], $dbconn);
    $city = $_SESSION['cart']['city'];
    $street = $_SESSION['cart']['street'];
    $house = $_SESSION['cart']['house'];
    $app = $_SESSION['cart']['app'];
    $vardelivery = $_SESSION['cart']['id_delivery'];
    $comment = $_SESSION['cart']['comment'];
    if ($app != '') {
        $query = "UPDATE osamylov_orders set city = '$city', street = '$street', house = '$house', id_delivery = $vardelivery, app = $app WHERE id = ".$id_cart;
    } else
        $query = "UPDATE osamylov_orders set city = '$city', street = '$street', house = '$house', id_delivery = $vardelivery WHERE id = ".$id_cart;
    pg_query($dbconn, $query);
    if ($comment != '') {
        pg_query($dbconn, "update orders set comment = '$comment' where id = $id_cart");
    }
}



//==================================УДАЛЕНИЕ ПОЛЬЗОВАТЕЛЯ ИЗ БАЗЫ ИЗ АДМИНКИ
if (isset($_GET['delete_user'])) {
    $id=$_GET['delete_user'];
    $query = "DELETE FROM osamylov_users WHERE id = '$id'";
    pg_query($dbconn, $query);
    header("Location:admin/index.php?page=users");
}


//==================================ДОБАВЛЕНИЕ НОВОЙ КАТЕГОРИИ
if (isset($_GET['add-cat'])) {
    $error=0;
    $name=$_GET['add-cat'];
    if ($name == "") {
        $error++;
        echo "Введите название категории";
    } else {
        $query = "SELECT * FROM osamylov_cats WHERE name = '.$name.'";
        $result = pg_query($dbconn, $query);
        $r = pg_fetch_array($result);
        if ($r['name'] != "") {
            $error++;
            echo "Категория с данным названием уже существует";
        }
    }
    if ($error == 0) {
        $query = "INSERT INTO osamylov_cats (name) VALUES ('$name')";
        pg_query($dbconn, $query);
        echo "ok";
    }
}


//==================================УДАЛЕНИЕ КАТЕГОРИИ
if (isset($_GET['delcat'])) {
    $id=$_GET['delcat'];
    if ($id == "") {
        echo "Нечего удалять";
    } else {
        $query_count = "select count(*) from osamylov_goods where id_cat = $id";
        $result_count = pg_query($dbconn, $query_count);
        $count = pg_fetch_row($result_count)[0];
        if ($count > 0) {
            echo "В данной категории имеются товары. Удаление невозможно";
        } else {
            $query = "DELETE FROM osamylov_cats WHERE id = $id";
            pg_query($dbconn, $query);
            echo "ok";
        }
    }
}
//==================================ПЕПЕИМЕНОВАНИЕ КАТЕГОРИИ
if (isset($_GET['rename-cat'])) {
    $name=$_GET['rename-cat'];
    $id = $_GET['id_cat'];
    if ($name == "") {
        echo "Наименование категории не должно быть пустым";
    } else {
        $query_count = "select count(*) from osamylov_cats where name = '".$name."'";
        $result_count = pg_query($dbconn, $query_count);
        $count = pg_fetch_row($result_count)[0];
        if ($count > 0) {
            echo "Категория с таким наименованием уже существует";
        } else {
            $query = "UPDATE osamylov_cats SET name = '".$name."' WHERE id = $id";
            pg_query($dbconn, $query);
            echo "ok";
        }
    }
}

//==================================ИЗМЕНЕНИЕ ТОВАРА
if (isset($_POST['save_good']))  {
    $name = $_POST['name'];
    $price = $_POST['price'];
    $price_wo_discount = @$_POST['price-wo-discount'];
    $desc = $_POST['desc'];
    $badge = $_POST['badge'];
    $id_cat = $_POST['cat_id'];
    if ($name == "") {
        echo "Наименование товара не должно быть пустым";
    } else if ($price == "") {
        echo "Цена товара не может быть пустой";
    } else if (($price_wo_discount != '') & ($price > $price_wo_discount)) {
        echo "Цена товара не может быть больше цены без скидки";
    } else {
        if ($_POST['save_good'] != 'new') {  //Если товар не новый
                $id = $_POST['save_good'];
                $query_count = "select count(*) from osamylov_goods where name = '".$name."' and id != ".$id;
                $result_count = pg_query($dbconn, $query_count);
                $count = pg_fetch_row($result_count)[0];
                if ($count > 0) {
                    echo "Товар с таким наименованием уже существует";
                } else {
                    if ($price_wo_discount != '') {
                        $query = "UPDATE osamylov_goods SET name = '" . $name . "', descript = '" . $desc . "', badge = '" . $badge . "', price = " . $price . ", price_wo_discount = ".$price_wo_discount." WHERE id = " . $id;
                    } else
                        $query = "UPDATE osamylov_goods SET name = '" . $name . "', descript = '" . $desc . "', badge = '" . $badge . "', price = " . $price . " WHERE id = " . $id;
                    pg_query($dbconn, $query);
                    echo "ok";
            }
        }else {                         //Если товар новый
            $query_count = "select count(*) from osamylov_goods where name = '".$name."'";
            $result_count = pg_query($dbconn, $query_count);
            $count = pg_fetch_row($result_count)[0];
            if ($count > 0) {
                echo "Товар с таким наименованием уже существует";
            } else {
            
            $query = "INSERT INTO osamylov_goods (name, id_cat, price, descript, badge) VALUES ('".$name."', ".$id_cat.", ".$price.", '".$desc."', '".$badge."') RETURNING id";
                $id = pg_query($dbconn, $query);
                $id = pg_fetch_array($id)['id'];
                echo "ok";
            }
        }
        //ПРОВЕРЯЕМ МАССИВ ВАРИАНТОВ
        $keysAll = array_keys($_POST);
        $keysPattern = preg_grep('/^good-var(\d+)$/', $keysAll);
        $count_var = count($keysPattern);
        $count_var_full = 0;
        for ($i=1; $i<= $count_var; $i++) {
            $var_good = $_POST['good-var'.$i];
            if ($var_good != '') $count_var_full++;
        }
        if ($count_var_full == 1) 
            echo "Имеется всего один вариант!";
        else {
            for ($i=1; $i<= $count_var; $i++) {
                $var_good = $_POST['good-var'.$i];
                if ($var_good != '') {                                                                          //ЕСЛИ ЧТО-ТО В ПОЛЕ ЕСТЬ
                    if  (isset($_POST['changevar'.$i])) {                                                       //И ПРИ ЭТОМ ЧТО-ТО В ПОЛЕ БЫЛО
                        if ($var_good != $_POST['changevar'.$i]) {                                              //при несовпадении обновляем вариант
                          $id_var = $_POST['varid'.$i];
                          variant_update($var_good, $id, $id_var, $dbconn);
                        }
                    } else {                                                            //ЕСЛИ В ПОЛЕ БЫЛО ПУСТО
                        variant($var_good, $id, $dbconn);                                   //заносим вариант
                    }
            } else {                                                                                          //ЕСЛИ В ПОЛЕ НИЧЕГО НЕТ
                    if  (isset($_POST['changevar'.$i])) {                                                       //И ПРИ ЭТОМ ЧТО-ТО В ПОЛЕ БЫЛО
                        $id_var = $_POST['varid'.$i];                                                         //удаляем вариант
                        $query = "DELETE FROM osamylov_var_good WHERE id = $id_var";
                        pg_query($dbconn, $query);
                    }
                }
            }
        }
    
        
            //========ПРОВЕРЯЕМ МАССИВ ФАЙЛОВ
        $size_files = sizeof($_FILES);
        for($i=1; $i<=$size_files; $i++) {
            $input_img = 'input_img'.$i;
            if (isset($_FILES[$input_img])) {
                $image = $_FILES[$input_img];
                if ($image['size'] > 0) {
                        $res_upload = upload_image_serv($image, $id_cat, $id, $dbconn);
                        if ($res_upload != 'Error') {
                            $changeimg = 'changeimg'.$i;
                            if (isset($_POST[$changeimg])) {
                                $id_img = $_POST[$changeimg];
                                deleting_image_file($id_img, $dbconn);
                                update_image_db($dbconn, $res_upload, $id_img);
                            } else  
                                upload_images_db ($dbconn, $res_upload, $id);
                        }
                } else {
                    if(isset($_POST['delimgid'.$i])) {
                        if($_POST['delimgid'.$i] != '') {
                            $id_img_del = $_POST['delimgid'.$i];
                            deleting_image_file($id_img_del, $dbconn);
                            deleting_image_db($id_img_del, $dbconn);
                        }
                    }
                }
            }
        }
    }
}

function upload_image_serv ($image, $id_cat, $id, $dbconn) {
    $rand = rand();
    if ($image['size'] > 8000000) {
        echo "Размер изображения слишком велик";
    } else {
        $imageFormat = explode('.', $image['name']);
        $imageFormat = $imageFormat[1];   
        if (!is_dir ("img/items/cat_$id_cat"))
            mkdir("img/items/cat_$id_cat");
        $imageFullName = "img/items/cat_$id_cat/$id"."_".$rand.'.'.$imageFormat;
        $imageType = $image['type'];
        if ($imageType == 'image/jpeg' || $imageType == 'image/png') {
            if (!move_uploaded_file($image['tmp_name'],$imageFullName)) {
                return 'Error';
            } else return $imageFullName;
        }
    }
}

    
function upload_images_db ($dbconn, $imageFullName, $id) {
    $query = "INSERT INTO osamylov_images (id_good, img_path) VALUES (".$id.", '".$imageFullName."')";
    pg_query($dbconn, $query);
}
function update_image_db ($dbconn, $imageFullName, $id) {
    $query = "UPDATE osamylov_images SET img_path = '".$imageFullName."' WHERE id = ".$id;
    pg_query($dbconn, $query);
}
            
function variant ($var, $id, $dbconn) {
    $query_var_equals = "SELECT COUNT(*) FROM osamylov_var_good WHERE id_good = ".$id." and variant = '".$var."'";
    $count_var = pg_query($dbconn, $query_var_equals);
    $count_var = pg_fetch_array($count_var)['count'];
    if ($count_var == 0) {
        $query = "INSERT INTO osamylov_var_good (id_good, variant) VALUES (".$id.", '".$var."')";
        pg_query($dbconn, $query);
    } else 
        echo "Такой вариант уже имеется в базе";
}
function variant_update ($var, $id, $id_var, $dbconn) {
    $query_var_equals = "SELECT COUNT(*) FROM osamylov_var_good WHERE id_good = ".$id." and variant = '".$var."'";
    $count_var = pg_query($dbconn, $query_var_equals);
    $count_var = pg_fetch_array($count_var)['count'];
    if ($count_var == 0) {
        $query = "UPDATE osamylov_var_good SET variant = '".$var."' WHERE id = ".$id_var;
        pg_query($dbconn, $query);
    }
}

//==================================УДАЛЕНИЕ КАРТИНКИ ТОВАРА
if (isset($_GET['delimg'])) {
    $id=$_GET['delimg'];
    
    if ($id == "") {
        echo "Нечего удалять";
    } else {
        deleting_image_file($id, $dbconn);
        deleting_image_db($id, $dbconn);
    }
}

function deleting_image_db ($id, $dbconn) {
    $query = "DELETE FROM osamylov_images WHERE id = $id";
    pg_query($dbconn, $query);
    echo "ok";
}
function deleting_image_file($id, $dbconn) {
    $query_img = "SELECT * FROM osamylov_images WHERE id = ".$id;
    $result_img = pg_query($dbconn, $query_img);
    $r_img = pg_fetch_array($result_img);
    $path = $r_img['img_path'];
    if (file_exists($path))
        unlink($path);
    
}

//==================================УДАЛЕНИЕ ТОВАРА
if (isset($_GET['delgood'])) {
    $id=$_GET['delgood'];
    if ($id == "") {
        echo "Нечего удалять";
    } else {
        $query = "DELETE FROM osamylov_goods WHERE id = $id";
        pg_query($dbconn, $query);
        echo "ok";
    }
}
//==================================УДАЛЕНИЕ ВАРИАНТА ТОВАРА
if (isset($_GET['delvar'])) {
    $id=$_GET['delvar'];
    if ($id == "") {
        echo "Нечего удалять";
    } else {
        $query = "DELETE FROM osamylov_var_good WHERE id = $id";
        pg_query($dbconn, $query);
        echo "ok";
    }
}
if(isset($_POST['delsoldgood'])){
    $id = $_POST['delsoldgood'];
    if ($id == "") {
        echo "Нечего удалять";
    } else {
        $query = "DELETE FROM osamylov_sold_goods WHERE id = $id";
        pg_query($dbconn, $query);
        echo "ok";
    }
}

//========================================ИЗМЕНЕНИЕ СТАТУСА ЗАКАЗА
if (isset($_POST['change_status_id'])) {
    $id = $_POST['change_status_id'];
    $status = $_POST['change_status_st'];
    $query = "UPDATE osamylov_orders SET status = '".$status."' WHERE id = ".$id;
    pg_query($dbconn, $query);
    echo 'ok';
}
if (isset($_GET['cancel_order'])){
    $id = $_GET['cancel_order'];
    $query = "UPDATE osamylov_orders SET status = 'Отменен' WHERE id = ".$id;
    pg_query($dbconn, $query);
    header("Location:admin/index.php");
}

//========================================ИЗМЕНЕНИЕ РОЛИ ПОЛЬЗОВАТЕЛЯ
if (isset($_POST['change_role_id'])) {
    $id = $_POST['change_role_id'];
    $status = $_POST['change_role_st'];
    $id_role = pg_fetch_array(pg_query($dbconn, "SELECT * FROM osamylov_user_access WHERE id_user = ".$id));
    if (!$id_role) {
        pg_query($dbconn, "INSERT INTO osamylov_user_access (id_user, access_role) VALUES ($id, '$status')");
    } else {
        if ($status != 'none') {
            pg_query($dbconn, "UPDATE osamylov_user_access SET id_user = $id, access_role = '$status' WHERE id_user = $id");
        } else
            pg_query($dbconn, "DELETE FROM osamylov_user_access WHERE id_user = $id");
    }

    echo 'ok';
}


//============================================ДОБАВЛЕНИЕ ТОВАРА В КОРЗИНУ
if (isset($_POST['add_good_to_cart'])){
    $id = $_POST['id_good'];
    $var = @$_POST['prod-var'];
    $price = $_POST['price'];
    $repeat = 0;
    if (isset($_SESSION['cart_goods']))
        foreach ($_SESSION['cart_goods'] as $k => $val) {
            if ($val['id_good'] == $id) {
                $_SESSION['cart_goods'][$k]['number']++;
                $repeat = 1;
                break;
            }
        }
    if ($repeat == 0)
        $_SESSION['cart_goods'][] = array('id_good' => $id, 'number' => 1, 'var' => $var, 'price' => $price);
    if (isset($_SESSION['user'])) {
        $id_user = $_SESSION['user']['id'];

        add_good_to_cart($id, $var, $id_user, $dbconn);
    }
    echo 'ok';
    //unset($_SESSION['cart_goods']);
}
function add_good_to_cart ($id_good, $id_var, $id_user, $dbconn) {

    $id_cart = get_id_cart($id_user, $dbconn);
    $query = "SELECT * FROM osamylov_sold_goods WHERE id_order = ".$id_cart." AND id_good = ".$id_good;
    $r_good = pg_fetch_array(pg_query($dbconn, $query));

    if (!$r_good) {
        //echo "Данного товара не было раньше";
        $price = pg_fetch_array(pg_query($dbconn, 'select price from osamylov_goods where id = '.$id_good))['price'];
        if ($id_var != '')
            $query_good = "INSERT INTO osamylov_sold_goods (id_order, id_good, id_variant, price) VALUES (".$id_cart.", ".$id_good.", ".$id_var.", ".$price.")";
        else
            $query_good = "INSERT INTO osamylov_sold_goods (id_order, id_good, price) VALUES (".$id_cart.", ".$id_good.", ".$price.")";
        pg_query($dbconn, $query_good);
    } else {
        foreach ($_SESSION['cart_goods'] as $k=> $v) {
            if ($v['id_good'] == $id_good) {
                $number = $v['number'];
            }
        }
        change_count_good_in_cart_db($dbconn, $id_good, $number, $_SESSION['user']['id']);
    }
}

function change_count_good_in_cart_db ($dbconn, $id_good, $number, $id_user) {
    $id_user = (int) $id_user;
    $id_order = get_id_cart($id_user, $dbconn);
    $number = (int) $number;
    $id_good = (int) $id_good;
    $query = "UPDATE osamylov_sold_goods SET numbers = ".$number." WHERE id_order = ".$id_order." AND id_good = ".$id_good;
    pg_query($dbconn, $query);
}

function get_id_cart($id_user, $dbconn) {

    $status = "Корзина";
    $query_cart = "SELECT * FROM osamylov_orders WHERE id_user = ".$id_user." AND status = '".$status."'";
    $res_cart = pg_query($dbconn, $query_cart);
    $r_cat = pg_fetch_array($res_cart);

    if (!$r_cat) {
        $query = "INSERT INTO osamylov_orders (id_user, status) VALUES (".$id_user.", 'Корзина') RETURNING id";
        $id_order = pg_fetch_array(pg_query($dbconn, $query))['id'];
    } else
        $id_order = $r_cat['id'];
    return $id_order;
}
//=======================================УДАЛЕНИЕ ТОВАРА ИЗ КОРЗИНЫ (из массива _SESSION)
if (isset($_POST['del_good_from_cart'])) {
    $id_good = $_POST['del_good_from_cart'];
    del_good_from_cart_session($id_good);
    if (isset($_SESSION['user'])) {
        del_good_from_cart_db($dbconn, $id_good, $_SESSION['user']['id']);
    }
}
function del_good_from_cart_session($id_good) {
    foreach ($_SESSION['cart_goods'] as $k => $v) {
        if ($v['id_good'] == $id_good) {
            unset($_SESSION['cart_goods'][$k]);
            echo 'ok';
            break;
        }
    }
    if (sizeof($_SESSION['cart_goods']) == 0) {
        unset($_SESSION['cart_goods']);
        if (isset($_SESSION['user']))
            delete_cart($dbconn, $_SESSION['user']['id']);
    }
}
function delete_cart($dbconn, $id_user) {
    $id_order = get_id_cart($id_user, $dbconn);
    pg_query($dbconn, "delete from osamylov_orders where id_order = ".$id_order);
}
function del_good_from_cart_db($dbconn, $id_good, $id_user) {
   $id_order = get_id_cart($id_user, $dbconn);
    pg_query($dbconn, "delete from osamylov_sold_goods where id_order = ".$id_order." AND id_good = ".$id_good);
}
//=======================================ИЗМЕНЕНИЕ КОЛИЧЕСТВА ТОВАРА
if (isset($_POST['change_count_cart'])) {
    $id_good = $_POST['change_count_cart'];
    $type = $_POST['type'];
    if ($type == 'minus')
        minus_count_cart($id_good, $dbconn);
    else
        plus_count_cart($id_good, $dbconn);
}
function plus_count_cart ($id_good, $dbconn) {
    foreach ($_SESSION['cart_goods'] as $k => $v) {
        if ($v['id_good'] == $id_good) {
            $_SESSION['cart_goods'][$k]['number']++;
            if (isset($_SESSION['user']))
                change_count_good_in_cart_db($dbconn, $_SESSION['cart_goods'][$k]['id_good'], $_SESSION['cart_goods'][$k]['number'], $_SESSION['user']['id']);
            echo 'ok';
            break;
        }
    }
}
function minus_count_cart ($id_good, $dbconn) {
    foreach ($_SESSION['cart_goods'] as $k => $v) {
        if ($v['id_good'] == $id_good) {
            $_SESSION['cart_goods'][$k]['number']--;
            if (isset($_SESSION['user']))
                change_count_good_in_cart_db($dbconn, $_SESSION['cart_goods'][$k]['id_good'], $_SESSION['cart_goods'][$k]['number'], $_SESSION['user']['id']);
            echo 'ok';
            break;
        }
    }
}

//==========================================================ПОДТВЕРЖДЕНИЕ ЗАКАЗА
if (isset($_POST['confirm_order'])) {
    $name = $_SESSION['cart']['name'];
    $email = $_SESSION['cart']['email'];
    $phone = $_SESSION['cart']['phone'];
    $city = $_SESSION['cart']['city'];
    $street = $_SESSION['cart']['street'];
    $house = $_SESSION['cart']['house'];
    $app = @$_SESSION['cart']['app'];
    $id_delivery = $_SESSION['cart']['id_delivery'];
    $comment = @$_SESSION['cart']['comment'];
    $id_user = @$_SESSION['user']['id'];
    $total_price = 0;
    if (!isset($_SESSION['user'])) {
        if ($app != '')
            $query = "insert into osamylov_orders (email, name, city, street, house, app, comment, id_delivery, time) VALUES ('$email', '$name', '$city', '$street', '$house', $app, '$comment', '$id_delivery' , now()) RETURNING id";
        else
            $query = "insert into osamylov_orders (email, name, city, street, house, comment, id_delivery, time) VALUES ('$email', '$name', '$city', '$street', '$house', '$comment', '$id_delivery' , now()) RETURNING id";

        $id_order = pg_fetch_array(pg_query($dbconn, $query))['id'];
        foreach ($_SESSION['cart_goods'] as $goods) {
            $id_good = $goods['id_good'];
            $numbers = $goods['number'];
            $id_var = @$goods['var'];
            //$price = pg_fetch_array(pg_query($dbconn, 'select price from goods where id = '.$id_good))['price'];
            $price = $goods['price'];
            $total_price += $price * $numbers;
            if ($id_var != '') {
                $query_sold_good = "insert into osamylov_sold_goods (id_order, id_good, numbers, id_variant, price) VALUES ($id_order, $id_good, $numbers, $id_var, $price)";
            } else
                $query_sold_good = "insert into osamylov_sold_goods (id_order, id_good, numbers, price) VALUES ($id_order, $id_good, $numbers, $price)";
            pg_query($dbconn, $query_sold_good);
        }
        $_SESSION['cart']['id'] = $id_order;
        unset($_SESSION['cart_goods']);
    } else {
        $id_order = get_id_cart($id_user, $dbconn);
        $query = "UPDATE osamylov_orders SET name = '$name', email = '$email', phone = '$phone', status = 'Принят', time = now() WHERE id = ".$id_order;
        pg_query($dbconn, $query);
        $res_sold_good = pg_query($dbconn,"select * from osamylov_sold_goods where id_order = ".$id_order);
        while ($r_sg = pg_fetch_array($res_sold_good)) {
            $total_price += $r_sg['price'] * $r_sg['numbers'];
        }
        $_SESSION['cart']['id'] = $id_order;
        unset($_SESSION['cart_goods']);
    }
    pg_query($dbconn, "UPDATE osamylov_orders SET total_price = ".$total_price." where id= ".$id_order);
    echo 'ok';
}
?>
