<div class="header-page">
	Оформление заказа
</div>
<?php
    if (isset($_SESSION['user'])) {
        $_SESSION['cart']['name'] = $_SESSION['user']['name'];
        $_SESSION['cart']['email'] = $_SESSION['user']['email'];
        $_SESSION['cart']['phone'] = @$_SESSION['user']['phone'];
    }
    $name = $_SESSION['cart']['name'];
    $email = $_SESSION['cart']['email'];
    $phone = $_SESSION['cart']['phone'];
    $city = $_SESSION['cart']['city'];
    $street = $_SESSION['cart']['street'];
    $house = $_SESSION['cart']['house'];
    $app = @$_SESSION['cart']['app'];
    $delivery = $_SESSION['cart']['delivery'];
    $comment = @$_SESSION['cart']['comment'];
    $itogo_sum = 0;
?>
<div class="zakaz-nocur" style="margin-top: 20px;">
    <span class="zakaz-head-num">1.</span>
    <span class="zakaz-head-text">Контактная информация</span>
</div>
<div class="zakaz-nocur">
    <span class="zakaz-head-num">2.</span>
    <span class="zakaz-head-text">Информация о доставке</span>
</div>
<div class="zakaz-cur">
    <span class="zakaz-head-num">3.</span>
    <span class="zakaz-head-text">Подтверждение заказа</span>
</div>
  <div class="zakaz-confirm-cont">
   
        <div class="zakaz-content-head" style="padding-left: 30px;">Состав заказа</div>
        <div class="zakaz-sostav">
            <div class="zakaz-sostav-table-head">
                <span class="head1">Товар</span>
                <span class="head2">Стоимость</span>
                <span class="head3">Количество</span>
                <span class="head4">Итого</span>
            </div>
            <?php
            foreach ($_SESSION['cart_goods'] as $item) {
                $id_good = $item['id_good'];
                $numbers = $item['number'];
                $id_var = $item['var'];
                $res_good = pg_fetch_array(pg_query($dbconn, "SELECT osamylov_goods.name, osamylov_goods.price FROM osamylov_goods WHERE id = " . $id_good));
                $name_good = $res_good['name'];
                if ($id_var != '') {
                    $var = pg_fetch_array(pg_query($dbconn, "SELECT variant FROM osamylov_var_good WHERE id = " . $id_var))['variant'];
                    $name_good = $name_good." (" . $var . ")";
                }
                $cena = $res_good['price'];
                $sum = $cena * $item['number'];
                $itogo_sum += $sum;
                $cena = number_format($cena, 0, ',', ' ');
                $sum = number_format($sum, 0, ',', ' ');
                echo "<div class='cart-line_confirm'>
                            <span class='col1'>$name_good</span>
                            <span class='col2'>$cena руб.</span>
                            <span class='col3'>$numbers</span>
                            <span class='col4'>$sum руб.</span>
                    </div>";
            }

            ?>
        </div>
        <div class="zakaz-sostav-itogo">
            <span class="text">Итого:</span>
            <span class="itogo"><?php echo number_format($itogo_sum, 0, ',', ' ');?> руб.</span>
        </div>
        <div class="zakaz-content-head" style="padding-left: 30px; padding-bottom: 30px;">Доставка:</div>
        <div class="zakaz-confirm-all">
            <span class="zakaz-all-itog" style="width: 250px;">
                <div class="zakaz-content-headpole">Контактное лицо (ФИО):</div>
                <div class="zakaz-confirm-value">
                <?php
                    echo $name;
                ?>
                </div>
                <div class="zakaz-content-headpole">Контактный телефон:</div>
                <div class="zakaz-confirm-value">
                <?php
                    echo $phone;
                ?>
                </div>
                <div class="zakaz-content-headpole">E-mail:</div>
                <div class="zakaz-confirm-value">
                <?php
                    echo $email;
                ?>
                </div>
            </span>
            <span class="zakaz-all-itog" style="width: 330px;">
                <div class="zakaz-content-headpole">Город:</div>
                <div class="zakaz-confirm-value">
                <?php
                    echo $city;
                ?>
                </div>
                <div class="zakaz-content-headpole">Улица:</div>
                <div class="zakaz-confirm-value">
                <?php
                    echo $street;
                ?>
                </div>
                <span style="float: left;">
                    <div class="zakaz-content-headpole">Дом:</div>
                    <div class="zakaz-confirm-value">
                    <?php
                    echo $house;
                    ?>
                    </div>
                </span>
                <span style="float: left; margin-left: 30px;">
                    <div class="zakaz-content-headpole">Квартира:</div>
                    <div class="zakaz-confirm-value">
                    <?php
                    echo $app;
                    ?>
                </div>
                </span>
            </span>
            <span class="zakaz-all-itog">
                <div class="zakaz-content-headpole">Способ доставки:</div>
                <div class="zakaz-confirm-value">
                <?php
                    echo $delivery;
                ?>
                </div>
                <div class="zakaz-content-headpole">Комментарий к заказу:</div>
                <div class="zakaz-confirm-value">
                <?php
                    echo $comment;
                ?>
                </div>
            </span>
        </div>
        <?php
            //echo '<div href="'.$site_domain.'/order4/" class="btn-confirm confirm-order" style="margin-left: 30px;">Подтвердить заказ</div>';
            echo '<div href="'.$site_domain.'/?page=order4" class="btn-confirm confirm-order" style="margin-left: 30px;">Подтвердить заказ</div>';
        ?>
        
        
    </div>
</div>

