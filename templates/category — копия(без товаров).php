
<?php
$id = $_GET['cat'];
$query = "SELECT * FROM cats WHERE id = ".$id;
$result = pg_query($dbconn, $query);
$r = pg_fetch_array($result);
$name = $r['name'];
$desc = @$r['descript'];


if (isset($_GET["p"])) {
        $page  = $_GET["p"]; 
    } else { $page=1; };
$start_from = ($page-1) * 17;
$query = "SELECT * FROM goods WHERE id = $id ORDER BY id LIMIT 17 OFFSET $start_from";
$result = pg_query($dbconn, $query);
$total_pages = ceil(pg_fetch_row(pg_query($dbconn ,"SELECT COUNT(id) FROM goods"))[0] / 17);
$goods = [];
$c = 1;
while ($r = pg_fetch_array($result)) {
    goods [$c] = $r;
    $c++;
}
?>



<div class="header-page">
	<?php echo $name; ?>
</div>
<div class="cat-num-goods">Показано 1-17 из 100 товаров</div>
<div class="cat-head-num-page">
    <span class="text">Страницы</span>
    <span class="cat-buts-page">
        <a href="#" class="cat-but-page page-activ">1</a>
        <a href="#" class="cat-but-page page-noactiv">2</a>
        <a href="#" class="cat-but-page page-noactiv">3</a>
    </span>
</div>
<div class="cat-goods">
    <span class="cat-desc">
            <img class="cat-desc-img" src="img/cat-img.jpg" alt="">
           <div class="cat-desc-head">Описание категории</div>
           <div class="cat-desc-text"><?php echo $desc; ?></div>
    </span>
    
    <span class="slide-item">
            <div class="slide-item-img"><img src="img/item-img.jpg"></div>
            <div class="slide-item-name">Название товара</div>
            <div class="slide-item-price">4 540руб.</div>
    </span>
    <div class="slides-items">
    <div class="slide-item">
        <div class="slide-item-img"><img src="img/item-img.jpg"></div>
        <div class="slide-item-name">Название товара</div>
        <div class="slide-item-price">4 540руб.</div>
    </div>
    <div class="slide-item">
        <div class="slide-item-img"><img src="img/item-img.jpg"></div>
        <div class="slide-item-name">Название товара</div>
        <div class="slide-item-price">4 540руб.</div>
    </div>
    <div class="slide-item">
        <div class="slide-item-img"><img src="img/item-img.jpg"></div>
        <div class="slide-item-name">Название товара</div>
        <div class="slide-item-price">4 540руб.</div>
    </div>
    <div class="slide-item">
        <div class="slide-item-img"><img src="img/item-img.jpg"></div>
        <div class="slide-item-name">Название товара</div>
        <div class="slide-item-price">4 540руб.</div>
    </div>
    <div class="slide-item">
        <div class="slide-item-img"><img src="img/item-img.jpg"></div>
        <div class="slide-item-name">Название товара</div>
        <div class="slide-item-price">4 540руб.</div>
    </div>
    <div class="slide-item">
        <div class="slide-item-img"><img src="img/item-img.jpg"></div>
        <div class="slide-item-name">Название товара</div>
        <div class="slide-item-price">4 540руб.</div>
    </div>
    <div class="slide-item">
        <div class="slide-item-img"><img src="img/item-img.jpg"></div>
        <div class="slide-item-name">Название товара</div>
        <div class="slide-item-price">4 540руб.</div>
    </div>
    <div class="slide-item">
        <div class="slide-item-img"><img src="img/item-img.jpg"></div>
        <div class="slide-item-name">Название товара</div>
        <div class="slide-item-price">4 540руб.</div>
    </div>

</div>
    <span class="cat-items-mini">
     <div class="slides-items-mini">
        <div class="slide-item">
            <div class="slide-item-img"><img src="img/item-img.jpg"></div>
            <div class="slide-item-name">Название товара</div>
            <div class="slide-item-price">4 540руб.</div>
        </div>
        <div class="slide-item">
            <div class="slide-item-img"><img src="img/item-img.jpg"></div>
            <div class="slide-item-name">Название товара</div>
            <div class="slide-item-price">4 540руб.</div>
        </div>
        <div class="slide-item">
            <div class="slide-item-img"><img src="img/item-img.jpg"></div>
            <div class="slide-item-name">Название товара</div>
            <div class="slide-item-price">4 540руб.</div>
        </div>
        <div class="slide-item">
            <div class="slide-item-img"><img src="img/item-img.jpg"></div>
            <div class="slide-item-name">Название товара</div>
            <div class="slide-item-price">4 540руб.</div>
        </div>
    </div>
    </span>
<span class="cat-promo">
    <img  class="cat-img-promo" src="img/cat-img-promo.jpg" alt="">
    <div class="cat-promo-head">Заголовок пормо-товара</div>
    <div class="cat-promo-desc">Описание промо-товара</div>
    <div class="cat-promo-price">4 540 руб.</div>
    <a href="#" class="cat-promo-see">Посмотреть +</a>
</span>
<div class="slides-items">
    <div class="slide-item">
        <div class="slide-item-img"><img src="img/item-img.jpg"></div>
        <div class="slide-item-name">Название товара</div>
        <div class="slide-item-price">4 540руб.</div>
    </div>
    <div class="slide-item">
        <div class="slide-item-img"><img src="img/item-img.jpg"></div>
        <div class="slide-item-name">Название товара</div>
        <div class="slide-item-price">4 540руб.</div>
    </div>
    <div class="slide-item">
        <div class="slide-item-img"><img src="img/item-img.jpg"></div>
        <div class="slide-item-name">Название товара</div>
        <div class="slide-item-price">4 540руб.</div>
    </div>
    <div class="slide-item">
        <div class="slide-item-img"><img src="img/item-img.jpg"></div>
        <div class="slide-item-name">Название товара</div>
        <div class="slide-item-price">4 540руб.</div>
    </div>
</div>
</div>

<div class="cat-head-num-page">
    <span class="text">Страницы</span>
    <span class="cat-buts-page">
        <a href="#" class="cat-but-page page-activ">1</a>
        <a href="#" class="cat-but-page page-noactiv">2</a>
        <a href="#" class="cat-but-page page-noactiv">3</a>
    </span>
</div>
