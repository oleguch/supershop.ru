<div class="header-page">
	Корзина
</div>
<?php
$itogo_sum = 0;
?>
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
        if (isset($_SESSION['cart_goods'])){
            foreach ($_SESSION['cart_goods'] as $item) {
                $id_good = $item['id_good'];
                $numbers = $item['number'];
                $id_var = $item['var'];
                $res_good = pg_fetch_array(pg_query($dbconn, "SELECT osamylov_goods.name, osamylov_goods.price FROM osamylov_goods WHERE id = ".$id_good));
                $name = $res_good['name'];
                if ($id_var != '') {
                    $var = pg_fetch_array(pg_query($dbconn, "SELECT variant FROM osamylov_var_good WHERE id = ".$id_var))['variant'];
                    $name = $name." (".$var.")";
                }
                $img = "$site_domain/".pg_fetch_array(pg_query($dbconn, "SELECT osamylov_images.img_path FROM osamylov_images WHERE id_good = ".$id_good))['img_path'];
                $cena = $res_good['price'];
                $sum = $cena * $item['number'];
                $itogo_sum += $sum;
                $cena = number_format($cena, 0, ',', ' ');
                $sum = number_format($sum, 0, ',', ' ');
                echo "<div class='cart-line' id='cart-line$id_good''>
                    <span class='col1'>
                        <img class='cart-item-img' src='$img'>
                        <span class='cart-item-name'>$name</span>
                        </span>
                    <span class='col2'>Есть в наличии</span>
                    <span class='col3' id='cena$id_good'>$cena руб.</span>
                    <span class='col4'>
                        <button class='cart-count-minus' onclick='minus($id_good)'>-</button><span id='count$id_good' class='cart-item-count'>$numbers</span><button class='cart-count-plus' onclick='plus($id_good)'>+</button>
                        </span>
                    <span class='col5'>
                        <span class='cart-item-sum' id='sum$id_good'>$sum руб.</span>
                        <img class='cart-del-item' onclick='cartDelItem($id_good)' src='$site_domain/img/cart-del-item.png'></span>
                  </div>";
            }
        } else
            echo "Товаров в корзине нет";
        ?>
    </div>
    <div class="cart-footer">
        <a href="index.php" class="back-to-shop">Вернуться в магазин</a>
        <div class="block-itogo">
            <div class="cart-itogo-text">
                <div class="itogo">Итого:</div>
                <div class="cart-itogo-sum" id="cart-zakaz-sum"><?php echo number_format($itogo_sum, 0, ',', ' ');?> руб.</div>
            </div>
            <?php echo '<a href="'.$site_domain.'/order1" class="cart-zakaz">Оформить заказ</a>';?>
        </div>
        
    </div>
</div>
<script>
    $(document).ready (function(){
        itogo(); 
    });
  

</script>