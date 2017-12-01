<?php
$id_order = $_SESSION['cart']['id'];
unset($_SESSION['cart']);
unset($_SESSION['cart_goods']);
?>
<div class="header-page">
	Оформление заказа
</div>
<div class="zakaz-done-cont">
    <div class="zakaz-done-head">
        <span class="zakaz-number">Заказ № <?php echo $id_order;?></span>
        <span class="zakaz-oform">успешно оформлен</span>
    </div>
    <div class="zakaz-done-text">Спасибо за ваш заказ.<br><br>В ближайшее время с вами свяжется оператор для уточнения времени доставки.</div>
        
                
<?php echo '<a href="'.$site_domain.'" class="btn-confirm">Вернуться в магазин</a>';?>
    </div>
</div>

