<div class="header-page">
	Корзина
</div>

<div class="cart-page">
    <div class="cart-table">
      <div class="cart-table-head">
        <span class="head1">Товар</span>
        <span class="head2">Доступность</span>
        <span class="head3">Стоимость</span>
        <span class="head4">Количество</span>
        <span class="head5">Итого</span>
      </div>
           <?php
            foreach ($items as $item) {
                $name = $goods[$item['id_good']]['name'];
                $img = $goods[$item['id_good']]['img'];
                $cena = $goods[$item['id_good']]['price'];
                $sum = $cena * $item['number'];
                $cena = number_format($cena, 0, ',', ' ');
                $sum = number_format($sum, 0, ',', ' ');
                echo "<div class='cart-line' id='cart-line$item[id]''>
                    <span class='col1'>
                        <img class='cart-item-img' src='$img'>
                        <span class='cart-item-name'>$name</span>
                        </span>
                    <span class='col2'>Есть в наличии</span>
                    <span class='col3' id='cena$item[id]'>$cena руб.</span>
                    <span class='col4'>
                        <button class='cart-count-minus' onclick='minus($item[id])'>-</button><span id='count$item[id]' class='cart-item-count'>$item[number]</span><button class='cart-count-plus' onclick='plus($item[id])'>+</button>
                        </span>
                    <span class='col5'>
                        <span class='cart-item-sum' id='sum$item[id]'>$sum руб.</span>
                        <img class='cart-del-item' onclick='cartDelItem($item[id])' src='img/cart-del-item.png'></span>
                  </div>";
        }
        ?>
    </div>
    <div class="cart-footer">
        <a href="index.php" class="back-to-shop">Вернуться в магазин</a>
        <div class="block-itogo">
            <div class="cart-itogo-text">
                <div class="itogo" onclick="toNumber('14 325 332')">Итого:</div>
                <div class="cart-itogo-sum" id="cart-zakaz-sum">72 640 руб.</div>
            </div>
            <a href="?page=order1" class="cart-zakaz">Оформить заказ</a>
        </div>
        
    </div>
</div>
<script>
    $(document).ready (function(){
        itogo(); 
    });
  

</script>