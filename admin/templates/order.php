<?php
$id = $_GET['id'];
$query = "SELECT * FROM osamylov_orders INNER JOIN osamylov_delivery ON osamylov_orders.id_delivery = osamylov_delivery.id WHERE osamylov_orders.id = ".$id;
$result = pg_query($dbconn, $query);
$r = pg_fetch_object($result, 0);
$status = $r->status;
/*
pg_query($dbconn, "INSERT INTO sold_goods (id_order, id_good, numbers) VALUES (2, 43, 3)");
pg_query($dbconn, "INSERT INTO sold_goods (id_order, id_good, numbers, id_variant) VALUES (2, 16, 1, 11)");
pg_query($dbconn, "INSERT INTO sold_goods (id_order, id_good, numbers, id_variant) VALUES (2, 87, 1, 59)");
pg_query($dbconn, "INSERT INTO sold_goods (id_order, id_good, numbers) VALUES (2, 119, 3)");*/


?>
   

   <div class="admin-header-order">
    <span class="admin-header-page">заказ</span>
    <span class="admin-order-head-num">№ <?php echo $id; ?> </span>
    <span class="admin-order-head-status">(<?php echo $status; ?>)</span>
</div>
<div class="admin-content-order-items">
    <div class="admin-head-user">содержимое заказа</div>
    <?php
    //$query_goods = "SELECT * FROM sold_goods WHERE id_order = ".$id;
    $query_goods = "select osamylov_sold_goods.id, osamylov_goods.name, osamylov_sold_goods.price, osamylov_sold_goods.numbers, osamylov_var_good.variant from osamylov_sold_goods inner join osamylov_goods on osamylov_sold_goods.id_good = osamylov_goods.id LEFT JOIN osamylov_var_good on osamylov_sold_goods.id_variant = osamylov_var_good.id WHERE osamylov_sold_goods.id_order = ".$id;
    $result_goods = pg_query($dbconn, $query_goods);
    $total_goods = 0;
    while ($r_goods = pg_fetch_object($result_goods)){
        $id_good = $r_goods->id;
        $name = $r_goods->name;
        $price = $r_goods->price;
        if ($r_goods->variant != '') {
            $name = $name." (".$r_goods->variant.")";
        }
        $price_s = number_format($price, 0, ',', ' ');
        $numbers = $r_goods->numbers;
        $total = $price * $numbers;
        $total_s = number_format($total, 0, ',', ' ');
        $total_goods += $total;
        echo "<div class='order-line-item' id='order_line$id_good'>
        <span class='col1'>$name</span>
        <span class='col2'>$price_s руб.</span>
        <span class='col3'>
            <div class='admin-order-item-number'>$numbers</div>
        </span>
        <span class='col4 cart-item-sum' >$total_s руб.</span>
        <span class='col5' id='del_good_from_order_block$id_good'><div class='del_good_from_from_order' onclick='del_good_from_order($id_good);'>убрать из заказа</div></span>
    </div>";
    }
    ?>
    
    
    
    <div class="admin-user-total-block">
        <div class="admin-order-total">
            <span class="text">
                итоговая сумма
            </span>
            <span class="total" id='cart-zakaz-sum'>
                <?php echo number_format($total_goods, 0, ',', ' '); ?> руб.
            </span>
        </div>
    </div>
</div>


<div class="admin-content-order-info">
    <div class="admin-head-user">
            Информация о заказе
    </div>
            <span class="admin-order-left">
                <div class="admin-user-head">Контактное лицо (ФИО):</div>
                <div class="admin-user-pole admin-user-pole-full"><?php echo $r->name; ?></div>
                <div class="admin-user-head" >Контактный телефон:</div>
                <div class="admin-user-pole admin-user-pole-full"><?php echo $r->phone; ?></div>
                <p class="admin-user-head">E-mail:</p>
                <div class="admin-user-pole admin-user-pole-full"><?php echo $r->email; ?></div>
                <p class="admin-user-head">Комментарий к заказу:</p>
                <div class="admin-order-pole-comment"><?php echo $r->comment; ?></div>
            </span>
            <span class="admin-order-center">
                <p class="admin-user-head">Город:</p>
                <div class="admin-user-pole admin-user-pole-full"><?php echo $r->city; ?></div>
                <p class="admin-user-head">Улица:</p>
                <div class="admin-user-pole admin-user-pole-full"><?php echo $r->street; ?></div>
                <div><span style="float: left;">
                    <p class="admin-user-head">Дом:</p>
                    <div class="admin-user-pole admin-user-pole-mini"><?php echo $r->house; ?></div>
                </span>
                <span style="float: left; margin-left: 30px;">
                    <p class="admin-user-head">Квартира:</p>
                    <div class="admin-user-pole admin-user-pole-mini"><?php echo $r->app; ?></div>
                </span>
                </div>
            </span>
            <span class="admin-order-right">
                <p class="admin-user-head">Способ доставки:</p>
                <div class="admin-order-delivery"><?php echo $r->text; ?></div>
            </span>
</div>
<div class="admin-user-delete">
   <?php
    echo '<a href="../work.php?cancel_order='.$id.'">Отменить заказ</a>';
    ?>
</div>