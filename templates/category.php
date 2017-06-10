
<?php
$id = $_GET['cat'];
$query = "SELECT * FROM osamylov_cats WHERE id = ".$id;
$result = pg_query($dbconn, $query);
$r = pg_fetch_array($result);
$name = $r['name'];
$desc = @$r['descript'];


if (isset($_GET["p"])) {
        $page  = $_GET["p"]; 
    } else { $page=1; };
$start_from = ($page-1) * 17;
$query_goods = "SELECT * FROM osamylov_goods WHERE id_cat = $id ORDER BY id LIMIT 17 OFFSET $start_from";
$result_goods = pg_query($dbconn, $query_goods);
$total_goods = pg_fetch_row(pg_query($dbconn ,"SELECT COUNT(id) FROM osamylov_goods WHERE id_cat = $id"))[0];
$total_pages = ceil($total_goods / 17);
$goods = [];
$c = 1;
while ($rg = pg_fetch_array($result_goods)) {
    $goods[$c] = $rg;
    $query_img = "SELECT img_path FROM osamylov_images WHERE id_good = ".$goods[$c]['id'];
    $goods[$c]['img'] = "$site_domain/".pg_fetch_array(pg_query($dbconn,$query_img))['img_path'];
    $goods[$c]['price'] = number_format($goods[$c]['price'], 0, ',', ' ')." руб.";
    $c++;
}
?>



<div class="header-page">
	<?php echo $name; ?>
</div>
<div class="cat-num-goods">Показано 
       <?php 
            echo ($start_from + 1)." - ".(sizeof($goods) + $start_from)." из ".$total_goods;
        ?> товаров</div>
<div class="cat-head-num-page">
    <?php
                if ($total_pages > 1) {
                    echo '<span class="text">Страницы</span>
    <span class="cat-buts-page">';
                    for ($i=1;$i<=$total_pages;$i++) {
                        if ($page == $i) {
                        echo "<a class='cat-but-page page-activ' href='$site_domain/cat/$id/$i'>$i</a>";
                        } else {
                            echo "<a class='cat-but-page page-noactiv' href='$site_domain/cat/$id/$i'>$i</a>";
                        }
                    }
                echo '</span>';
                }
            ?>
</div>
<div class="cat-goods">
    <span class="cat-desc">
            <?php echo  '<img class="cat-desc-img" src="'.$site_domain.'/img/cat-img.jpg" alt="">'; ?>
           <div class="cat-desc-head">Описание категории</div>
           <div class="cat-desc-text"><?php echo $desc; ?></div>
    </span>
    <?php
    if (isset ($goods[1]))
        $badge = $goods[1]['badge'];
    if ($badge == 'NEW')
        $badge_path = "$site_domain/img/new.png";
    if ($badge == 'SALE')
        $badge_path = "$site_domain/img/sale.png";
    if ($badge == 'HOT')
        $badge_path = "$site_domain/img/hot.png";
    if ($badge == 'none')
        $badge_path = "";
        echo '<a href="'.$site_domain.'/product/'.$goods[1]['id'].'"><span class="slide-item good-item-block-slide">
            <div class="slide-item-img"><img src="'.$goods[1]['img'].'"  class="image-good-item-block" ><img class="image-badge" src="'.$badge_path.'"></div>
            <div class="slide-item-text">
            <div class="slide-item-name">'.$goods[1]['name'].'</div>
            <div class="slide-item-price">'.$goods[1]['price'].'</div></div>';
if ($goods[1]['price_wo_discount'] != '') {
    $price_wo_disc = $goods[1]['price_wo_discount'];
    $price_wo_disc =number_format($price_wo_disc, 0, ',', ' ')." руб.";
    echo '<div class="product-old-price price_wo_disc">'.$price_wo_disc.'</div>';
}
 echo   '</span></a>';
    
    ?>

    <div class="slides-items">
    <?php 
        for ($i=2; $i<=9; $i++) {

            if (isset ($goods[$i])) {
                $badge = $goods[$i]['badge'];
                if ($badge == 'NEW')
                    $badge_path = "$site_domain/img/new.png";
                if ($badge == 'SALE')
                    $badge_path = "$site_domain/img/sale.png";
                if ($badge == 'HOT')
                    $badge_path = "$site_domain/img/hot.png";
                if ($badge == 'none')
                    $badge_path = "";

                echo '<a href="'.$site_domain.'/product/' . $goods[$i]['id'] . '"><span class="slide-item good-item-block-slide">
            <div class="slide-item-img"><img class="image-good-item-block" src="' . $goods[$i]['img'] . '"><img class="image-badge" src="' . $badge_path . '"></div>
            <div class="slide-item-text">
            <div class="slide-item-name">' . $goods[$i]['name'] . '</div>
            <div class="slide-item-price">' . $goods[$i]['price'] . '</div></div>';
                if ($goods[$i]['price_wo_discount'] != '') {
                    $price_wo_disc = $goods[$i]['price_wo_discount'];
                    $price_wo_disc =number_format($price_wo_disc, 0, ',', ' ')." руб.";
                    echo '<div class="product-old-price price_wo_disc">'.$price_wo_disc.'</div>';
                }
    echo '</span></a>';
            }
        }
    ?>
   

</div>
    <span class="cat-items-mini">
     <div class="slides-items-mini">
        <?php 
        for ($i=10; $i<=13; $i++) {
            if (isset ($goods[$i])) {
                $badge = $goods[$i]['badge'];
                if ($badge == 'NEW')
                    $badge_path = "$site_domain/img/new.png";
                if ($badge == 'SALE')
                    $badge_path = "$site_domain/img/sale.png";
                if ($badge == 'HOT')
                    $badge_path = "$site_domain/img/hot.png";
                if ($badge == 'none')
                    $badge_path = "";
                echo '<a href="'.$site_domain.'/product/' . $goods[$i]['id'] . '"><span class="slide-item good-item-block-slide">
            <div class="slide-item-img"><img class="image-good-item-block" src="' . $goods[$i]['img'] . '"><img class="image-badge" src="' . $badge_path . '"></div>
            <div class="slide-item-text">
            <div class="slide-item-name">' . $goods[$i]['name'] . '</div>
            <div class="slide-item-price">' . $goods[$i]['price'] . '</div></div>';
                if ($goods[$i]['price_wo_discount'] != '') {
                    $price_wo_disc = $goods[$i]['price_wo_discount'];
                    $price_wo_disc =number_format($price_wo_disc, 0, ',', ' ')." руб.";
                    echo '<div class="product-old-price price_wo_disc">'.$price_wo_disc.'</div>';
                }
    echo '</span></a>';
            }
        }
    ?>
    </div>
    </span>
<span class="cat-promo">
    <?php echo '<img  class="cat-img-promo" src="'.$site_domain.'/img/cat-img-promo.jpg" alt="">'; ?>
    <div class="cat-promo-head">Заголовок пормо-товара</div>
    <div class="cat-promo-desc">Описание промо-товара</div>
    <div class="cat-promo-price">4 540 руб.</div>
    <a href="#" class="cat-promo-see">Посмотреть +</a>
</span>
<div class="slides-items">
    <?php 
        for ($i=14; $i<=17; $i++) {
            if (isset ($goods[$i])) {
                $badge = $goods[$i]['badge'];
                if ($badge == 'NEW')
                    $badge_path = "$site_domain/img/new.png";
                if ($badge == 'SALE')
                    $badge_path = "$site_domain/img/sale.png";
                if ($badge == 'HOT')
                    $badge_path = "$site_domain/img/hot.png";
                if ($badge == 'none')
                    $badge_path = "";
                echo '<a href="'.$site_domain.'/product/' . $goods[$i]['id'] . '"><span class="slide-item good-item-block-slide">
            <div class="slide-item-img"><img class="image-good-item-block" src="' . $goods[$i]['img'] . '"><img class="image-badge" src="' . $badge_path . '"></div>
            <div class="slide-item-text">
            <div class="slide-item-name">' . $goods[$i]['name'] . '</div>
            <div class="slide-item-price">' . $goods[$i]['price'] . '</div></div>';
                if ($goods[$i]['price_wo_discount'] != '') {
                    $price_wo_disc = $goods[$i]['price_wo_discount'];
                    $price_wo_disc =number_format($price_wo_disc, 0, ',', ' ')." руб.";
                    echo '<div class="product-old-price price_wo_disc">'.$price_wo_disc.'</div>';
                }
    echo '</span></a>';
            }
        }
    ?>
</div>
</div>

<div class="cat-head-num-page">

       <?php
                if ($total_pages > 1) {
                    echo '<span class="text">Страницы</span>
    <span class="cat-buts-page">';
                    for ($i=1;$i<=$total_pages;$i++) {
                        if ($page == $i) {
                        echo "<a class='cat-but-page page-activ' href='$site_domain/cat/$id/$i'>$i</a>";
                        } else {
                            echo "<a class='cat-but-page page-noactiv' href='$site_domain/cat/$id/$i'>$i</a>";
                        }
                    }
                echo '</span>';
                }
            ?>

</div>
