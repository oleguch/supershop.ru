<div class="header-page">
	Личный кабинет
</div>
<div class="lk-page">
   <?php
   //$query_user = "SELECT * FROM users WHERE id = ".$_SESSION['user']['id'];

    $name = $_SESSION['user']['name'];
    $email = $_SESSION['user']['email'];
    $phone = @$_SESSION['user']['phone'];
    $city = @$_SESSION['user']['address_city'];
    $street = @$_SESSION['user']['address_street'];
    $house = @$_SESSION['user']['address_house'];
    $app = @$_SESSION['user']['address_app'];
    $id = $_SESSION['user']['id'];
    $query_orders = "SELECT * FROM osamylov_orders WHERE id_user = ".$id." AND status != 'Корзина' ";
    $result_orders = pg_query($dbconn, $query_orders);
    ?>
   
   
    <span class="lk-userdata">
        <form action="work.php" method="get" id="formlk">
          <input type="hidden" name="lk">
           <div class="lk-head">Ваши данные</div>
            <p class="zakaz-content-headpole">Контактное лицо (ФИО):</p>
            <input type="text" class="zakaz-content-pole lk-pole-full" name="fio"
            <?php
            echo "value='$name'";
            ?>
            >
            <p class="zakaz-content-headpole" >Контактный телефон:</p>
            <input type="text" id="phone" class="zakaz-content-pole lk-pole-full" name="phone"
            <?php
            echo "value='$phone'";
            ?>
            >
            <p class="zakaz-content-headpole">E-mail:</p>
            <input type="email" class="zakaz-content-pole lk-pole-full" name="email"
            <?php
            echo "value='$email'";
            ?>
            >
            <div class="lk-head">Адрес доставки</div>
            <p class="zakaz-content-headpole">Город:</p>
            <input name="city" type="text" class="zakaz-content-pole lk-pole-full" 
            <?php
            echo "value='$city'";
            ?>
            >
            <p class="zakaz-content-headpole">Улица:</p>
            <input type="text" name="street" class="zakaz-content-pole lk-pole-full" 
            <?php
            echo "value='$street'";
            ?>
            >
            <span style="float: left;"><p class="zakaz-content-headpole">Дом:</p>
            <input type="text" name="house" class="zakaz-content-pole lk-pole-mini" 
            <?php
            echo "value='$house'";
            ?>       
            >
            </span>
            <span style="float: left; margin-left: 30px;"><p class="zakaz-content-headpole">Квартира:</p>
            <input type="text" name="app" class="zakaz-content-pole lk-pole-mini"
            <?php
            echo "value='$app'";
            ?>
            >
            </span>
            <div class="lk-head">Изменение пароля</div>
            <p class="zakaz-content-headpole">Введите новый пароль:</p>
            <input type="password" name="pass1" class="zakaz-content-pole lk-pole-full" placeholder="***">
            <p class="zakaz-content-headpole">Повторите новый пароль</p>
            <input type="password" name="pass2" class="zakaz-content-pole lk-pole-full" placeholder="***">
            
            <button type="button" id="btn-lk" name="lk" class="zakaz-btn-cont zakaz-btn">Сохранить</button>
            <br><div id='answer' class='error-pole'></div><br>
       </form>
    </span>
    <span class="lk-orders">
        <div class="lk-head">Ваши заказы</div>
        <?php
            while ($r_orders = pg_fetch_array($result_orders)) {
                $number = $r_orders['id'];
                $datetime = date("d.m.Y в H:i", strtotime($r_orders['time']));
                $total_order = $r_orders['total_price'];
                $status = $r_orders['status'];
                $total_order = number_format($total_order, 0, ',', ' ');
                echo '<div class="lk-orders-item">
                            <span class="lk-order-info">
                                <div class="lk-order-id">№ '.$number.'</div>
                                <div class="lk-order-sum">('.$total_order.' руб.)</div>
                                <div class="lk-order-time">'.$datetime.'</div>
                            </span>
                            <span class="lk-order-delivery">'.$status.'</span>
                        </div>';
            }
        ?>

    </span>
    </div>
    