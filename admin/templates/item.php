<?php
$id_cat=$_GET['id_cat'];
if (isset($_GET['id'])) { //Если выбрали существующий товар
    $id=$_GET['id'];
    $query = "SELECT * FROM osamylov_goods WHERE id = ".$id;
    $result = pg_query($dbconn, $query);
    $r = pg_fetch_array($result);
    $query_img = "SELECT * FROM osamylov_images WHERE id_good = ".$id;
    $result_img = pg_query($dbconn, $query_img);
}

$name = @$r['name'];
$desc = @$r['descript'];
$price = @$r['price'];
$price_wo_discount = @$r['price_wo_discount'];
$badge = @$r['badge'];

?>

<div class="admin-header-page">Просмотр товара</div>
<div class="admin-content-item-info">
    <form action="" id="form-good-info" enctype="multipart/form-data">
    <div class="admin-cats-table-head">
        <span class="head1">Информация о товаре</span>
    </div>
    
    <span class="admin-good-info">
        <div class="admin-user-head">Название товара:</div>
        <input type="text" name="name" class="admin-user-pole admin-item-pole-full" value="<?php echo $name; ?>">
        <div class="admin-user-head" >Описание товара:</div>
        <textarea name="desc" class="admin-item-desc-textarea" placeholder="Описание товара"><?php echo $desc; ?></textarea>
    </span>
    <span class="badge-block">
        <div class="admin-item-head-badge" >Бэйджик:</div>
        <div class="var-delivery">
           <input type="radio" class="radio" 
           <?php 
                  if ((!isset($badge)) || ($badge == 'none'))
                      echo "checked='checked'";
                  ?>  name="badge" value="none" id="vardelivery1">
           <label for="vardelivery1">Отсутствует</label>
        </div>
       <div class="var-delivery">
           <input type="radio" name="badge"  class="radio" value="NEW" id="vardelivery2" <?php if ($badge == "NEW") echo "checked='checked'"; ?>>
           <label for="vardelivery2">NEW</label><br>
       </div>
       <div class="var-delivery">
           <input type="radio" name="badge" value="HOT" class="radio" id="vardelivery3" <?php if ($badge == "HOT") echo "checked='checked'"; ?>>
           <label for="vardelivery3">HOT</label>
       </div>
       <div class="var-delivery">
           <input type="radio" name="badge" value="SALE" class="radio" id="vardelivery4" <?php if ($badge == "SALE") echo "checked='checked'"; ?>>
           <label for="vardelivery4">SALE</label>
       </div>
        <span style="float: left;">
       <div class="admin-user-head" style="margin-left:0;">Цена товара:</div>
        <input type="text" name="price" class="admin-user-pole admin-item-pole-mini" style="margin-left:0; width: 100px;" value="<?php echo $price; ?>">
        </span>
        <span style="float: left; margin-left: 20px;">
            <div class="admin-user-head" style="margin-left:0;">Цена товара без скидки:</div>
        <input type="text" name="price-wo-discount" class="admin-user-pole admin-item-pole-mini" style="margin-left:0; width: 100px;" value="<?php echo $price_wo_discount; ?>">
        </span>
    </span>
</div>


<div class="admin-content-cats">
    <div class="admin-cats-table-head">
        <span class="head1">ФОтографии товара</span>
    </div>
    <div class="admin-item-images">
       <?php
        $i=0;
        if (isset($_GET['id'])) {
            //while (($r_img = pg_fetch_array($result_img)) && ($i <= 4)) {
            while ($r_img = pg_fetch_array($result_img))  {
                $path = $r_img['img_path'];
                $id_img = $r_img['id'];
                $i++;
                echo '<span class="admin-item-img-block" id="admin_img_block'.$i.'">
                
                            <div class="img">
                                <img src="../'.$path.'" id="img'.$i.'" style="width: 150px; height: 150px;" >
                            </div>
                            <div class="text" id="text_img'.$i.'">
                                <div class="img-item-change" value="Изменить" id="btn-upload-img-'.$i.'" onClick="upload_img('.$i.');">Изменить</div>
                                <div class="img-item-del" id="btn-del-img-'.$i.'" onclick="del_img('.$id_img.', '.$i.');">Удалить</div>
                                <input type="file" data-id_img="'.$i.'" id="input_img'.$i.'" style="display: none;" name="input_img'.$i.'" onchange="change_input('.$i.')">
                                <input type="hidden" id="changeimg'.$i.'" name="changeimg'.$i.'" value="'.$id_img.'">
                                <input type="hidden" id="delimgblock'.$i.'" name="delimgblock'.$i.'">
                                <input type="hidden" id="delimgid'.$i.'" name="delimgid'.$i.'" data-id_img="'.$id_img.'">
                            </div>
                            
                        </span>';
                
            }
        }
        if ($i % 4 != 0) 
            while ($i % 4 != 0) {
                $i++;
                echo '<span class="admin-item-img-block" id="admin_img_block'.$i.'">
                        <div class="img">
                           <img src="../img/img-0.jpg" id="img'.$i.'" style="width: 150px; height: 150px;">
                        </div>
                        <div class="text" id="text_img'.$i.'">
                            <div class="img-item-upload" value="Загрузить" id="btn-upload-img-'.$i.'" onClick="upload_img('.$i.');">Загрузить</div>
                            <div class="img-item-clear" id="btn-clear-img-'.$i.'" onClick="clear_img('.$i.');">Очистить</div>
                        </div>
                        <input type="file" data-id_img="'.$i.'" id="input_img'.$i.'" style="display: none;" name="input_img'.$i.'" onchange="change_input('.$i.')">
                    </span>';
                
            }
        else do {
            $i++;
            echo '<span class="admin-item-img-block" id="admin_img_block'.$i.'">
                        <div class="img">
                           <img src="../img/img-0.jpg" id="img'.$i.'" style="width: 150px; height: 150px;">
                        </div>
                        <div class="text" id="text_img'.$i.'">
                            <div class="img-item-upload" value="Загрузить" id="btn-upload-img-'.$i.'" onClick="upload_img('.$i.');">Загрузить</div>
                            <div class="img-item-clear" id="btn-clear-img-'.$i.'" onClick="clear_img('.$i.');">Очистить</div>
                        </div>
                        <input type="file" data-id_img="'.$i.'" id="input_img'.$i.'" style="display: none;" name="input_img'.$i.'" onchange="change_input('.$i.')">
                    </span>';
            
        }
        while ($i % 4 != 0);
        ?>

    </div>

</div>


<div class="admin-content-var-item">
    <div class="admin-cats-table-head">
        <span class="head1">Вариации товара</span>
    </div>
    <?php
    $i=1;
    $var_arr = [];
    if (isset($_GET['id'])) {
        $query_var = "SELECT * FROM osamylov_var_good WHERE id_good = ".$id;
        $result_var = pg_query($dbconn, $query_var);
        //while (($r_var = pg_fetch_array($result_var)) && ($i <= 3)) {
        while ($r_var = pg_fetch_array($result_var)) {
            $id_var = $r_var['id'];
            $var_text = $r_var['variant'];
            echo '<div class="line-var-item" id="line-var'.$i.'">
                        <input id="good-var'.$i.'" type="text" name="good-var'.$i.'" class="admin-user-pole admin-item-pole-full item-var" value="'.$var_text.'">
                        <div class="del-var-item" onclick="delvar('.$i.')">Удалить</div>
                        <input type="hidden" name="changevar'.$i.'" value="'.$var_text.'">
                        <input type="hidden" name="varid'.$i.'" value="'.$id_var.'">
                    </div>';
            $i++;
        }
    }
        if ($i <= 4) 
            while ($i <= 4) {
                echo '<div class="line-var-item" id="line-var'.$i.'">
                            <input id="good-var'.$i.'" type="text" name="good-var'.$i.'" class="admin-user-pole admin-item-pole-full item-var">
                            <div class="del-var-item">Удалить</div>
                        </div>';
                $i++;
            }
        else {
            echo '<div class="line-var-item" id="line-var'.$i.'">
                            <input id="good-var'.$i.'" type="text" name="good-var'.$i.'" class="admin-user-pole admin-item-pole-full item-var">
                            <div class="del-var-item">Удалить</div>
                        </div>';
        }
    
    ?>

</div>
<?php
  if (isset($_GET['id'])) {
    echo '<div class="save-or-del-item">
    <span class="del-item-left" onclick="delgood('.$id.');">Удалить товар</span>
    <input type="hidden" name="save_good" value="'.$id.'">
    <input type="hidden" name="cat_id" value = '.$id_cat.'>
    <input type=submit class="save-item-right" id="btn-save-item" value="Сохранить изменения">
    <br><div id="answer" class="error-pole"></div><br>
</div>';
  }  else {
          echo '<div class="save-or-del-item">
    <input type="hidden" value="new" name="save_good">
    <input type="hidden" name="cat_id" value = '.$id_cat.'>
    <input type=submit class="save-item-right" id="btn-save-item" value="Сохранить товар">
    <br><div id="answer" class="error-pole"></div><br>
</div>';
      }
?>    

</form>