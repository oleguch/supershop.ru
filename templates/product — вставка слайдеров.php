<?php
$id=$_GET['id'];
$query = "SELECT * FROM goods WHERE id = ".$id;
$result = pg_query($dbconn, $query);
$r = pg_fetch_array($result);
$name = $r['name'];
$id_cat = $r['id_cat'];
$name_cat = pg_fetch_array(pg_query($dbconn, "SELECT * FROM cats WHERE id = ".$id_cat))['name'];
$desc = $r['descript'];
$price = $r['price'];
$price =number_format($price, 0, ',', ' ')." руб.";
$query_img_good = "SELECT img_path FROM images WHERE id_good = ".$id;
$result_img_goods = pg_query($dbconn, $query_img_good);
$img = [];
$c_img = 1;
while ($r_img = pg_fetch_array($result_img_goods)){
    $img[$c_img] = $r_img['img_path'];
    $c_img++;
}
$i=1;
$var_arr = [];
$query_var = "SELECT * FROM var_good WHERE id_good = ".$id;
$result_var = pg_query($dbconn, $query_var);
while ($r_var = pg_fetch_array($result_var)) {
    $var_arr[$i]['id']= $r_var['id'];
    $var_arr[$i]['var'] = $r_var['variant'];
    $i++;
}
$c=1;
$goods = [];
$query_goods = "SELECT * FROM goods WHERE id != ".$id." AND id_cat = ".$id_cat." ORDER BY id";
$result_goods = pg_query($dbconn, $query_goods);
while ($rg = pg_fetch_array($result_goods)) {
    $goods[$c] = $rg;
    $query_img = "SELECT img_path FROM images WHERE id_good = ".$goods[$c]['id'];
    $goods[$c]['img'] = pg_fetch_array(pg_query($dbconn,$query_img))['img_path'];
    $goods[$c]['price'] = number_format($goods[$c]['price'], 0, ',', ' ')." руб.";
    $c++;
}


?>
<div class="header-page">
	<?php echo $name_cat; ?>
</div>
<a href="index.php" class="product-back-to-shop">Вернуться в магазин</a>
<div class="product-page">
<span class="product-images">
    <div id="main_img" >
    <?php
            for ($i=1; $i <=sizeof($img);$i++) {
                echo '<div class="image-product-main"><img class="image_product" src="'.$img[$i].'" alt=""></div>';
            }
    ?>
    
    
    </div>
    <div class="prod-images-mini">
        <span><img class="arrow-img-prod" id="prod_img_prev" aria-disabled="true" src="img/img-arrow-left-noactiv.png" alt=""></span>
        <div id="mini_img">
           <?php
            for ($i=1; $i <=sizeof($img);$i++) {
                echo '<div><img src="'.$img[$i].'" style="display: block; max-width: 57px; max-height: 57px;" class="prod-img-mini"></div>';
            }
            ?>

        </div>
        <span><img class="arrow-img-prod" id="prod_img_next" aria-disabled="false" src="img/img-arrow-right-activ.png" alt=""></span>
        
    </div>
</span>
<form method="get">
<span class="product-info">
    <div class="product-name"><?php echo $name; ?></div>
    <div class="product-desc"><?php echo $desc; ?></div>
    <?php
    if (count($var_arr) != 0) {
        echo '<div class="product-var">
                Выберите вариант:
                <select name="prod-var" id="">';
        for ($i=1; $i<=count($var_arr);$i++) {
            $var = $var_arr[$i]['var'];
            $var_id = $var_arr[$i]['id'];
            echo "<option value=$var_id>$var</option>";
        }
        echo '</select>
            </div>';
    }
    ?>
</span>
<span class="product-span3">
    <div class="product-price-div">
        <div class="product-old-price">9 990 руб.</div>
        <div class="product-price"><?php echo $price; ?></div>
        <div class="product-availability">
            <img src="img/icon_availability.png" alt="">
            Есть в наличии
        </div>
    </div>
    <div class="prodict-buy-div">
        <button type="submit" class="btn-buy">
            <img src="img/icon-cart-buy.png" alt="">
            КУПИТЬ
        </button>
    </div>
    <div class="prod-dop-info">
        <img class="prod-icons" src="img/icon_car.png" alt="">
        <div class="prod-icon-text">
            <div class="prod-icon-text1">Бесплатная доставка</div>
            <div class="prod-icon-text2">по всей России</div>
        </div>
    </div>
    <div class="prod-dop-info">
        <img class="prod-icons" src="img/icon_person.png" alt="">
        <div class="prod-icon-text">
            <div class="prod-icon-text1">Горячая линия</div>
            <div class="prod-icon-text2">8 800 000-0-00</div>
        </div>
    </div>
    <div class="prod-dop-info">
        <img class="prod-icons" src="img/icon_present.png" alt="">
        <div class="prod-icon-text">
            <div class="prod-icon-text1">Подарки</div>
            <div class="prod-icon-text2">каждому покуаптелю</div>
        </div>
    </div>
    
</span>
   
    </form>
</div>


<div class="header-list-items">
    <div class="text">Другие товары из категории "<?php echo $name_cat; ?>"</div>
    <div class="arrow-slide" id="arrow-slide"> 
        <img src="img/arrow-left-noactiv.png" class="arrows" id="prev" aria-disabled="true">
        <img src="img/arrow-right-activ.png" class="arrows" id="next" aria-disabled="false">
        
    </div>
</div>

<div class="slides-items" id="slide2">
   <div style="height: 326px;">
       <?php 
        for ($i=1; $i<=4; $i++) {
            if (isset ($goods[$i]))
                echo '<a href="?page=product&id='.$goods[$i]['id'].'"><span class="slide-item good-item-block-slide">
            <div class="slide-item-img"><img class="image-good-item-block" src="'.$goods[$i]['img'].'"></div>
            <div class="slide-item-text">
            <div class="slide-item-name">'.$goods[$i]['name'].'</div>
            <div class="slide-item-price">'.$goods[$i]['price'].'</div>
            </div>
    </span></a>';
        }
    ?>
    </div>
    <div style="height: 326px;">
       <?php 
        for ($i=5; $i<=8; $i++) {
            if (isset ($goods[$i]))
                echo '<a href="?page=product&id='.$goods[$i]['id'].'"><span class="slide-item good-item-block-slide">
            <div class="slide-item-img"><img class="image-good-item-block" src="'.$goods[$i]['img'].'"></div>
            <div class="slide-item-text">
            <div class="slide-item-name">'.$goods[$i]['name'].'</div>
            <div class="slide-item-price">'.$goods[$i]['price'].'</div>
            </div>
    </span></a>';
        }
    ?>
    </div>
    <div style="height: 326px;">
       <?php 
        for ($i=9; $i<=12; $i++) {
            if (isset ($goods[$i]))
                echo '<a href="?page=product&id='.$goods[$i]['id'].'"><span class="slide-item good-item-block-slide">
            <div class="slide-item-img"><img class="image-good-item-block" src="'.$goods[$i]['img'].'"></div>
            <div class="slide-item-text">
            <div class="slide-item-name">'.$goods[$i]['name'].'</div>
            <div class="slide-item-price">'.$goods[$i]['price'].'</div>
            </div>
    </span></a>';
        }
    ?>
    </div>
  
    
    <!--
    <div class="slide-item">
        <div class="slide-item-img"><img src="img/item-img.jpg"></div>
        <div class="slide-item-name">Название товара</div>
        <div class="slide-item-price">4 540руб.</div>
    </div>-->
</div>

