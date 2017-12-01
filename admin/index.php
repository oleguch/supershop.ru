<!DOCTYPE html>
<html>
<head>
    <?php
    //$site_domain = 'http://supershop.ru';
    //$site_domain = 'http://test.14school.ru';
    $site_domain = 'http://shoggoth.ru/edu/09/osamylov/supershop.ru';
    //$site_domain = 'http://skill.box/diplom';
    ?>
    <meta charset="utf-8">
	<title>Super Shop - Администрирование</title>
	 <?php echo '<link rel="stylesheet" type="text/css" href="'.$site_domain.'/styles/style_admin.css">';?>
</head>
<body>
<?php

    session_start();
    $dbconn = pg_connect("host=localhost dbname=twi2_sql user=postgres password=330117");
    if ($dbconn === false) {
        echo "Error opening";
    }
//}
    $res_access = pg_fetch_array(pg_query($dbconn, "select * from osamylov_user_access where id_user = ".$_SESSION['user']['id']));
    if (!$res_access) {
        $status = 'none';
    } else {
        $status = $res_access['access_role'];
    }
    if ($status == 'none') {
        echo "Доступ запрещен";
        exit();
    }

    if ($dbconn===false) {
        echo "Error opening";
    }
    ?>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="<?php echo "$site_domain";?>/js/jquery.min.js"><\/script>');</script>
<?php
echo '
<script src="'.$site_domain.'/js/jquery.maskedinput.js"></script>
<script src="'.$site_domain.'/js/script.js"></script>';
?>
    
<span class="left-sidebar">
            <?php echo "<a class='logo' href='$site_domain'>";?>

    <div class="logo1st">SUPER</div>
	    <div class="logo2nd">SHOP</div>
    </a>
    <?php
    echo '<a href="'.$site_domain.'/admin">';

        
        if ((!isset($_GET['page'])) || ($_GET["page"] == 'order')) {
            echo'<div class="admin-menu admin-menu-activ">
                <img src="'.$site_domain.'/img/admin-orders-activ.png" alt="" class="admin-menu-img">';
            } else 
            echo '<div class="admin-menu admin-menu-noactiv">
                <img src="'.$site_domain.'/img/admin-orders-noactiv.png" alt="" class="admin-menu-img">';
        ?>
        <div class="admin-menu-text">Заказы</div>
    </div>
    </a>
    <?php
    if ($status == 'admin') {
    //echo "<a href='$site_domain/users/'>";
    echo "<a href='$site_domain/admin/?page=users'>";

        if ((isset($_GET['page'])) && (($_GET["page"] == 'users') || ($_GET["page"] == 'user'))) {
            echo'<div class="admin-menu admin-menu-activ">
                <img src="'.$site_domain.'/img/admin-persons-activ.png" alt="" class="admin-menu-img">';
            } else 
            echo '<div class="admin-menu admin-menu-noactiv">
                <img src="'.$site_domain.'/img/admin-persons-noactiv.png" alt="" class="admin-menu-img">';

    echo "<div class='admin-menu-text'>Пользователи</div>
    </div>
    </a>";
    }
    //echo "<a href='$site_domain/admin/cats/'>";
    echo "<a href='$site_domain/admin/?page=cats'>";


        if ((isset($_GET['page'])) && (($_GET['page'] == 'cats') || ($_GET['page'] == 'showcat') || ($_GET['page'] == 'showgood'))) {
            echo'<div class="admin-menu admin-menu-activ">
                <img src="'.$site_domain.'/img/admin-goods-activ.png" alt="" class="admin-menu-img">';
            } else 
            echo '<div class="admin-menu admin-menu-noactiv">
                <img src="'.$site_domain.'/img/admin-goods-noactiv.png" alt="" class="admin-menu-img">';
    ?>
        <div class="admin-menu-text">Товары</div>
    </div>
    </a>
    <div class="admnin-cur-user-block">
        <div class="admin-cur-user">
            <?php
            echo $_SESSION['user']['email'];
            ?>
        </div>
        <div class="admin-exit-session-block">
            <?php echo '<a href="'.$site_domain.'/index.php?exit=true" class="admin-exit-session">Выйти</a>'; ?>
        </div>
    </div>
    
    
    
    
</span>
<span class="right-sidebar">
   <?php
    if (!isset($_SESSION['user']['email'])) {
        echo "Доступ запрещен";
        exit();
    }
        if (!isset($_GET["page"])) {
            require "templates/orders.php";
        } elseif ($_GET["page"] == 'users') {
            require "templates/users.php";
        } elseif ($_GET["page"] == 'user') {
            require "templates/user.php";
        } elseif ($_GET["page"] == 'order') {
            require "templates/order.php";
        } elseif ($_GET["page"] == 'cats') {
            require "templates/cats.php";
        } elseif ($_GET["page"] == 'showcat') {
            require "templates/cat.php";
        } elseif ($_GET["page"] == 'showgood') {
            require "templates/item.php";
        }
        
    ?>

    </div>

    
</span>

</body>
<script>
    $(".left-sidebar").height($(".right-sidebar").height());
</script>