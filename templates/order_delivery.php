<div class="header-page">
	Оформление заказа
</div>
<?php
    $name = @$_SESSION['user']['name'];
    $email = @$_SESSION['user']['email'];
    $phone = @$_SESSION['user']['phone'];
    $city = @$_SESSION['user']['address_city'];
    $street = @$_SESSION['user']['address_street'];
    $house = @$_SESSION['user']['address_house'];
    $app = @$_SESSION['user']['address_app'];
?>
<div class="zakaz-nocur" style="margin-top: 20px;">
    <span class="zakaz-head-num">1.</span>
    <span class="zakaz-head-text">Контактная информация</span>
</div>
<div class="zakaz-cur">
    <span class="zakaz-head-num">2.</span>
    <span class="zakaz-head-text">Информация о доставке</span>
</div>
<div class="zakaz-delivery-cont">
   <form action="" method="get" id="form-order-addr">
    <span class="zakaz-address">
            <div class="zakaz-content-head">Адрес доставки</div>
            <br><div id='answer' class='error-pole'></div>
            <p class="zakaz-content-headpole">Город:</p>
            <input name="city" type="text" class="zakaz-content-pole zakaz-content-pole-full"
            <?php
                   echo " value='$city''";
            ?>
            >
            <p class="zakaz-content-headpole">Улица:</p>
            <input type="text" name="street" class="zakaz-content-pole zakaz-content-pole-full"
            <?php
                   echo " value='$street''";
            ?>
            >
            <span style="float: left;"><p class="zakaz-content-headpole">Дом:</p>
            <input type="text" name="house" class="zakaz-content-pole zakaz-content-pole-house"
            <?php
                   echo " value='$house''";
            ?>
            >
            </span>
            <span style="float: left; margin-left: 30px;"><p class="zakaz-content-headpole">Квартира:</p>
            <input type="text" name="app" class="zakaz-content-pole zakaz-content-pole-house"
            <?php
                   echo " value='$app''";
            ?>
            >
            </span>
            <button type="button" id="btn-order-addr" class="zakaz-btn-cont zakaz-btn zakaz2-cont">Продолжить</button>
            
    </span>
    <span class="zakaz-delivery-var">
        <div class="zakaz-content-head" style="margin-bottom: 40px;">Способ доставки</div>
        <div class="var-delivery">
           <input type="radio" class="radio" checked="checked" name="vardelivery" value="1" id="vardelivery1">
           <label for="vardelivery1">Курьерская доставка <br> с оплатой при получении</label>
        </div>
       <div class="var-delivery">
           <input type="radio" name="vardelivery"  class="radio" value="2" id="vardelivery2">
           <label for="vardelivery2">Почта России <br> с наложенным платежом</label><br>
       </div>
       <div class="var-delivery">
           <input type="radio" name="vardelivery" value="3" class="radio" id="vardelivery3">
           <label for="vardelivery3">Доставка через терминалы QIWI Post</label>
       </div>
    </span>
    <span class="zakaz-comment">
        <div class="zakaz-content-head">Комментарий к заказу</div>
        <p class="zakaz-content-headpole">Введите Ваш комментарий:</p>
        <textarea name="comment" class="zakaz-content-textarea" placeholder="Текст комментария"></textarea>
    </span>
    <input type="hidden" name="order-delivery">
   </form>
</div>

<div class="zakaz-nocur" style="margin-bottom: 30px;">
    <span class="zakaz-head-num">3.</span>
    <span class="zakaz-head-text">Подтверждение заказа</span>
</div>
<script>
jQuery(function($){
   $("#phone").mask("+7(999) 999-9999");
   });
</script>