<?php
#$site_domain = 'http://localhost/supershop.ru';
//$site_domain = 'http://supershop.ru';
//$site_domain = 'http://test.14school.ru';
$site_domain = 'http://shoggoth.ru/edu/09/osamylov/supershop.ru';
//$site_domain = 'http://skill.box/diplom';
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<title>Super Shop</title>
    <?php

    echo '
	 <link rel="stylesheet" type="text/css" href="'.$site_domain.'/styles/style.css">
	 <link rel="stylesheet" type="text/css" href=""/>
	 <link rel="stylesheet" type="text/css" href="'.$site_domain.'/slick/slick-theme.css"/>
	 <link rel="stylesheet" type="text/css" href="'.$site_domain.'/slick/slick.css"/>
	 <link rel="stylesheet" type="text/css" href="'.$site_domain.'/styles/lightbox.css"/>
';
?>
</head>
<body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/jquery.min.js"><\/script>');</script>
<?php

echo '
<script src="'.$site_domain.'/js/jquery.maskedinput.js"></script>
<script type="text/javascript" src="'.$site_domain.'/js/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="'.$site_domain.'/slick/slick.min.js"></script>

		
<script src="'.$site_domain.'/js/lightbox.min.js"></script>
<script src="'.$site_domain.'/js/script.js"></script>

';
?>


<?php
    session_start();
    
    if (isset($_GET["exit"])) {
        unset($_SESSION['user']);
        unset($_SESSION['cart']);
        unset($_SESSION['cart_goods']);
    }
 //   $dbconn=pg_connect("host=localhost dbname=osamylov_db user=osamylov password=384osamylov231");
 //   if ($dbconn===false) {
        $dbconn = pg_connect("host=localhost dbname=twi2_sql user=postgres password=330117");
        if ($dbconn === false) {
            echo "Error opening";
        }
  //  }


//mail('oleguch@yandex.ru',"Активация аккаунта",'Ghbdtn');
    
//=======================TEMPLATES=============
require "templates/header.php";
if (!isset($_GET["page"])) {
	require "templates/glav.php";
} elseif ($_GET["page"] == 'auth') {
	require "templates/auth.php";
} elseif ($_GET["page"] == 'registration') {
    require "templates/registration.php";
} elseif ($_GET["page"] == 'cart') {
    require "templates/cart.php";
} elseif (($_GET["page"] == 'order1')&&(!isset($_SESSION['user']))) {
    require "templates/order_user.php";
} elseif (($_GET["page"] == 'order1')&&(isset($_SESSION['user']))) {
    require "templates/order_delivery.php";
} elseif ($_GET["page"] == 'order2') {
    require "templates/order_delivery.php";
} elseif ($_GET["page"] == 'order3') {
    require "templates/order_confirm.php";
} elseif ($_GET["page"] == 'order4') {
    require "templates/order_done.php";
} elseif ($_GET["page"] == 'lk') {
    if (isset($_SESSION['user'])) {
        require "templates/lk.php";
    } else echo "Доступ запрещен";
} elseif ($_GET["page"] == 'cat') {
    require "templates/category.php";
} elseif ($_GET["page"] == 'product') {
    require "templates/product.php";
} 

require "templates/footer.php";
//unset($_SESSION['email']);
?>



</body>
</html>