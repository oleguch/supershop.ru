<?php
$query = "SELECT * FROM osamylov_cats ORDER BY id";

$result = pg_query($dbconn, $query);

?>
<div class="admin-header-page">Товары</div>
<div class="admin-content-cats">
    <div class="admin-cats-table-head">
        <span class="head1">название категории</span>
        <span class="head2">Количество товаров</span>
    </div>

    <?php
        while ($r = pg_fetch_array($result)) {
            
            
            $name = $r['name'];
            $id = $r['id'];
            $query_count = "select count(*) from osamylov_goods where id_cat = $id";
            $result_count = pg_query($dbconn, $query_count);
            $count = pg_fetch_row($result_count)[0];
            echo "<div class='cat-line' id='catline$id'>
                    <span class='col1' style='display: flex; height: 55px;'>
                        <img src='$site_domain/img/icon-folder-cat.png' class='img-folder-cat'>
                        <span class='admin-cats-name'>$name</span>
                    </span>
                    <span class='col2'>$count</span>";
            if ($count == 0) 
                    echo "<span class='col3' id='del_cat_block$id'><a onclick='delcat($id);'>удалить</a></span>";
            else echo "<span class='col3'></span>";
            //echo "<span class='col4' id='show_cat_block$id'><a href='$site_domain/showcat/$id/'>просмотр</a></span>
            echo "<span class='col4' id='show_cat_block$id'><a href='$site_domain/admin/?page=showcat&id=$id'>просмотр</a></span>
    </div>";
        }
        ?>
    
</div>

<div class="add-new-cat-block">
   <div class="admin-add-cat">
   <form action="" id="form-add-cat">
    <span class="admin-add-cat-text">Добавить категорию:</span>
    <input type="text" name="add-cat" class="new-cat-name" placeholder="название категории"><br><br>
    <div class="btn-new-cat" id="btn-add-cat">добавить категорию</div>
    <br><div id='answer' class='error-pole'></div><br>
    </form>
    </div>
</div>
