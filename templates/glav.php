<?php

$query_goods = "SELECT * FROM osamylov_goods ORDER BY id DESC";
$result_goods = pg_query($dbconn,$query_goods);
$goods = [];
$c_goods = 0;
while ($r_goods = pg_fetch_array($result_goods)) {
    $goods[$c_goods] = $r_goods;
    $query_img = "SELECT img_path FROM osamylov_images WHERE id_good = ".$goods[$c_goods]['id'];
    $goods[$c_goods]['img'] = pg_fetch_array(pg_query($dbconn,$query_img))['img_path'];
    $goods[$c_goods]['price'] = number_format($goods[$c_goods]['price'], 0, ',', ' ')." руб.";
    $c_goods++;
}
?>
<div class="bg"></div>
<div class="cover">
    <div class="name-1st">Название</div>
    <div class="name-2nd">промо-товара</div>
    <div class="name-opis">Описание промо-товара</div>
    <a href="#"><div class="btn-see">Посмотреть +</div></a>
</div>
<div class="header-list-items">
    <div class="text">Новые товары</div>
    <div class="arrow-slide" id="arrow-slide"> 
        <img src="img/arrow-left-noactiv.png" class="arrows" id="prev" aria-disabled="true">
        <img src="img/arrow-right-activ.png" class="arrows" id="next" aria-disabled="false">
    </div>
</div>
<div class="slides-items sl1" id="slide1">
  <?php

    $total_goods_blocks = ceil(sizeof($goods) / 8) - 1;
    
    for ($a=0; $a<$total_goods_blocks;$a++){
        echo "<div>";
        for ($i=($a*8);$i<($a*8+8);$i++){
            $badge = $goods[$i]['badge'];
            if ($badge == 'NEW')
                $badge_path = "img/new.png";
            if ($badge == 'SALE')
                $badge_path = "img/sale.png";
            if ($badge == 'HOT')
                $badge_path = "img/hot.png";
            if ($badge == 'none')
                $badge_path = "";

            echo '<a href="?page=product&id='.$goods[$i]['id'].'"><span class="slide-item good-item-block-slide">
                <div class="slide-item-img">
                    <img class="image-good-item-block" src="'.$goods[$i]['img'].'">
                    <img class="image-badge" src="'.$badge_path.'">
                </div>
                <div class="slide-item-text">
                <div class="slide-item-name">'.$goods[$i]['name'].'</div>
                <div class="slide-item-price">'.$goods[$i]['price'].'</div></div>';
            if ($goods[$i]['price_wo_discount'] != '') {
                $price_wo_disc = $goods[$i]['price_wo_discount'];
                $price_wo_disc =number_format($price_wo_disc, 0, ',', ' ')." руб.";
                echo '<div class="product-old-price price_wo_disc">'.$price_wo_disc.'</div>';
            }

                echo '</span></a>';
        }
        echo "</div>";
    }
    ?>
</div>
<!--<div class="sliders">
    <div class="sliders-1"> <img src="img/slide1.jpg"> <p class="head">Заголовок</p><p class="body">промо-товара</p></div>
    <div class="sliders-2"> <img src="img/slide2.jpg"> <p class="head">Заголовок</p><p class="body">промо-товара</p></div>
    <div class="sliders-3"> <img src="img/slide3.jpg"> <p class="head">Заголовок</p><p class="body">промо-товара</p></div>
</di>-->





<div class="sliders">
<div class="dws-wrapper">
   <ul class="accordion">
        <li><div class="sliders-1 sl"> <img src="img/sl1_580.png"> <p class="head">Заголовок</p><p class="body">промо-товара</p></div></li>
        <li><div class="sliders-2 sl"> <img src="img/sl2_580.png"> <p class="head">Заголовок</p><p class="body">промо-товара</p></div></li>
        <li><div class="sliders-3 sl"> <img src="img/sl3.jpg"> <p class="head">Заголовок</p><p class="body">промо-товара</p></div></li>
    </ul>
</div>
</div>






<div class="header-list-items">
    <div class="text">Популярные товары</div>
    <div class="arrow-slide" id="arrow_slide_4"> 
        <img src="img/arrow-left-noactiv.png" class="arrows" id="prev_4" aria-disabled="true">
        <img src="img/arrow-right-activ.png" class="arrows" id="next_4" aria-disabled="false">
    </div>
</div>
<div class="slides-items" id="slide4">
    <?php
        
        for ($a = 1; $a <= 8; $a ++) {
            $badge = $goods[$a]['badge'];
            if ($badge == 'NEW')
                $badge_path = "img/new.png";
            if ($badge == 'SALE')
                $badge_path = "img/sale.png";
            if ($badge == 'HOT')
                $badge_path = "img/hot.png";
            if ($badge == 'none')
                $badge_path = "";
                echo '<a href="?page=product&id='.$goods[$a]['id'].'"><span class="slide-item good-item-block-slide">
            <div class="slide-item-img"><img class="image-good-item-block" src="'.$goods[$a]['img'].'"><img class="image-badge" src="'.$badge_path.'"></div>
            <div class="slide-item-text">
            <div class="slide-item-name">'.$goods[$a]['name'].'</div>
            <div class="slide-item-price">'.$goods[$a]['price'].'</div></div>';
            if ($goods[$a]['price_wo_discount'] != '') {
                $price_wo_disc = $goods[$a]['price_wo_discount'];
                $price_wo_disc =number_format($price_wo_disc, 0, ',', ' ')." руб.";
                echo '<div class="product-old-price price_wo_disc">'.$price_wo_disc.'</div>';
            }

                echo '</span></a>';

        }
    
    ?>
</div>

<div class="about-shop">
    <div class="header">О магазине</div>
    <div class="text">
        Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. 
        <br><br>
        Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. 
    </div>
</div>
<script>

    
</script>