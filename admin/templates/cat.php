<?php
$id_cat = $_GET['id'];
$name_cat = pg_fetch_array(pg_query($dbconn, "SELECT * FROM osamylov_cats WHERE id = ".$id_cat))['name'];
if (isset($_GET["p"])) {
        $page  = $_GET["p"]; 
    } else { $page=1; };
$start_from = ($page-1) * 10;
$query = "SELECT * FROM osamylov_goods WHERE id_cat = $id_cat ORDER BY id LIMIT 10 OFFSET $start_from";
$result = pg_query($dbconn, $query);
$total_pages = ceil(pg_fetch_row(pg_query($dbconn ,"SELECT COUNT(id) FROM osamylov_goods WHERE id_cat = ".$id_cat))[0] / 10);
?>


<div class="admin-header-page">Товары</div>
<div class="admin-cat-renameblock">
    <form action="" id="form-rename-cat">
    <span class="text">Название категории</span>
    <input type="text" name="rename-cat" class="admin-renamecat-pole" value="<?php echo $name_cat;?>">
    <input type="hidden" name="id_cat" value="<?php echo $id_cat; ?>">
    <div id="btn-rename-cat" class="btn-rename-cat">переименовать</div>
    <br><div id='answer' class='error-pole'></div><br>
</form>
</div>


<div class="admin-content-cats">
    <div class="admin-cats-table-head">
        <span class="head1">название товара</span>
        <span class="head2">стоимость</span>
    </div>
    <?php
        while ($r = pg_fetch_array($result)) {
            $name = $r['name'];
            $id = $r['id'];
            $price = $r['price'];
            $price = number_format($price, 0, ',', ' ');
            echo "<div class='cat-line' id='good_line$id'>
                        <span class='col1'>$name</span>
                        <span class='col2'>$price руб.</span>
                        <span class='col3' id='del_good_line_block$id'><a onclick='delgood_line($id);'>удалить</a></span>
                        <span class='col4' data-id_cat=$id_cat id='show_good_block$id'><a href='$site_domain/item/cat$id_cat/$id/'>просмотр</a></span>
                </div>";
    };
    ?>
   
</div>
<div class="pages">
            <?php
                if ($total_pages > 1) {
                    for ($i=1;$i<=$total_pages;$i++)
                        if ($page == $i) 
                            echo "<a class='btn-pages btn-page-activ' href='$site_domain/showcat/$id_cat/$i'>$i</a>";
                        else 
                            echo "<a class='btn-pages btn-page-noactiv' href='$site_domain/showcat/$id_cat/$i'>$i</a>";
                }
            ?>
            
</div><br><br>
<div class="add-new-cat-block">
  <?php
    echo "<a href='$site_domain/newgood/$id_cat/' class='link-add-newgood'>Добавить новый товар</a>";
   ?>
</div>
