<?php
$res_access = pg_fetch_array(pg_query($dbconn, "select * from osamylov_user_access where id_user = ".$_SESSION['user']['id']));
if (!$res_access) {
    $status = 'none';
} else {
    $status = $res_access['access_role'];
}
if ($status == 'seller') {
    echo "Доступ запрещен";
    exit();
}
$id = $_GET['id'];
$query = "SELECT * FROM osamylov_users where id = '$id'";
$result = pg_query($dbconn, $query);
$r = pg_fetch_array($result);
$name = $r['name'];
$email = $r['email'];
$phone = $r['phone'];
$city = $r['address_city'];
$street = $r['address_street'];
$house = $r['address_house'];
$app = $r['address_app'];
//$query_orders = "SELECT * FROM orders WHERE id_user = ".$id;

$total_all_orders = 0;
if (isset($_GET["p"])) {
    $page  = $_GET["p"];
} else { $page=1; };
$start_from = ($page-1) * 7;
$query_orders = "SELECT * FROM osamylov_orders WHERE id_user = ".$id." ORDER BY id LIMIT 7 OFFSET $start_from";
$result_orders = pg_query($dbconn, $query_orders);
$total_pages = ceil(pg_fetch_row(pg_query($dbconn ,"SELECT COUNT(id) FROM osamylov_orders WHERE id_user = $id"))[0] / 7);

/*$res_total = pg_query($dbconn, "select price, numbers from sold_goods inner join goods on sold_goods.id_good = goods.id inner join orders on sold_goods.id_order = orders.id where orders.id_user = $id");
while ($r_total = pg_fetch_array($res_total)) {
    $total_all_orders += $r_total['price'] * $r_total['numbers'];
}*/
$res_total = pg_query($dbconn, "select * from osamylov_orders where id_user = ".$id);
while ($r_total = pg_fetch_array($res_total)) {
    $total_all_orders += $r_total['total_price'];
}
?>
<div class="admin-header-page">Просмотр пользователя</div>
<div class="admin-content-user-info">
    <div class="admin-head-user">
            Информация о пользователе
    </div>
          <?php
            echo '<span class="admin-user-left">
                <div class="admin-user-head">Контактное лицо (ФИО):</div>
                <div class="admin-user-pole admin-user-pole-full">'.$name.'</div>
                <div class="admin-user-head" >Контактный телефон:</div>
                <div class="admin-user-pole admin-user-pole-full">'.$phone.'</div>
                <p class="admin-user-head">E-mail:</p>
                <div class="admin-user-pole admin-user-pole-full">'.$email.'</div>
            </span>
            <span class="admin-user-right">
                <p class="admin-user-head">Город:</p>
                <div class="admin-user-pole admin-user-pole-full">'.$city.'</div>
                <p class="admin-user-head">Улица:</p>
                <div class="admin-user-pole admin-user-pole-full">'.$street.'</div>
                <div><span style="float: left;">
                    <p class="admin-user-head">Дом:</p>
                    <div class="admin-user-pole admin-user-pole-mini">'.$house.'</div>
                </span>
                <span style="float: left; margin-left: 30px;">
                    <p class="admin-user-head">Квартира:</p>
                    <div class="admin-user-pole admin-user-pole-mini">'.$app.'</div>
                </span>
                </div>
            </span>';
    ?>
</div>
<div class="admin-content-user-orders">
    <div class="admin-head-user">история заказов</div>
    <?php
    while ($r_orders = pg_fetch_array($result_orders)) {
        $number = $r_orders['id'];
        $datetime = date("d.m.Y в H:i", strtotime($r_orders['time']));
        $total_order = $r_orders['total_price'];
        /*$q_sold_good = "select osamylov_goods.price, osamylov_sold_goods.numbers from osamylov_sold_goods inner join osamylov_goods on osamylov_sold_goods.id_good = osamylov_goods.id WHERE osamylov_sold_goods.id_order = ".$number;
        $result_sold_good = pg_query($dbconn, $q_sold_good);
        while ($r_sold_good = pg_fetch_array($result_sold_good)) {
            $numbers = $r_sold_good['numbers'];
            $price = $r_sold_good['price'];
            $total_order += $price * $numbers;
        }*/
        //$total_all_orders += $total_order;
        $total_order = number_format($total_order, 0, ',', ' ');
        echo "<a href='?page=order&id=$number' class='href-to-order-from-user'> <div class='user-line-order'>
                <span class='col1'>№ ".$number."</span>
                <span class='col2'>".$total_order." руб.</span>
                <span class='col3'>".$datetime."</span>
            </div></a>";
    }

    ?>
    <div class="pages">
        <?php
        if ($total_pages > 1) {
            for ($i=1;$i<=$total_pages;$i++) {
                if ($page == $i) {
                    echo "<a class='btn-pages btn-page-activ' href='?page=user&id=$id&p=$i'>$i</a>";
                } else {
                    echo "<a class='btn-pages btn-page-noactiv' href='?page=user&id=$id&p=$i'>$i</a>";
                }
            }
        }
        ?>

    </div>
    <br><br>
    <div class="admin-user-total-block">
        <div class="admin-user-total">
            <span class="text">
                итоговая сумма заказов
            </span>
            <span class="total">
                <?php
                $total_all_orders = number_format($total_all_orders, 0, ',', ' ');
                echo $total_all_orders." руб.";
                ?>
            </span>
        </div>
    </div>
</div>
<br>
<div class="admin-user-delete">
    <?php

    echo '<a href="../work.php?delete_user='.$id.'">Удалить пользователя</a>';
    ?>
</div>