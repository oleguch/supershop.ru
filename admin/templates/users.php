<?php

    $res_access = pg_fetch_array(pg_query($dbconn, "select * from osamylov_user_access where id_user = ".$_SESSION['user']['id']));
    if (!$res_access) {
        $status = 'none';
    } else {
        $status = $res_access['access_role'];
    }
    if ($status == 'seller') {
        echo "Доступ запрещен";
        exit();
    }
    
    if (isset($_GET["p"])) {
        $page  = $_GET["p"]; 
    } else { $page=1; };
    $start_from = ($page-1) * 10;
    $query = "SELECT * FROM osamylov_users ORDER BY id LIMIT 10 OFFSET $start_from";
    $result = pg_query($dbconn, $query);
    $total_pages = ceil(pg_fetch_row(pg_query($dbconn ,"SELECT COUNT(id) FROM osamylov_users"))[0] / 10);

?>
   
   <div class="admin-header-page">Пользователи</div>
    <div class="admin-content-users">
          <div class="admin-table-head">
            <span class="head1">Имя</span>
            <span class="head2">E-mail</span>
            <span class="head3">Телефон</span>
          </div>
        <?php
        while ($r = pg_fetch_array($result)) {
            $name = $r['name'];
            $email = $r['email'];
            $phone = $r['phone'];
            $id = $r['id'];
            $res_access = pg_fetch_array(pg_query($dbconn, "select * from osamylov_user_access where id_user = ".$id));
            if (!$res_access) {
                $status = 'none';
            } else {
                $status = $res_access['access_role'];
            }
            echo "<div class='user-line' id='user-line'>
                    <span class='col1'>$name</span>
                    <span class='col2'>$email</span>
                    <span class='col3'>$phone</span>
                    <span class='col4'>
                    <select class='access-role' name='access_role' data-id_user = '$id'>";
            if ($status == 'none') {
                echo "<option value='none' style='color: #ad5a00;' selected>Нет роли</option>";
            } else echo "<option value='none' style='color: #ad5a00;'>Нет роли</option>";
            if ($status == 'admin') {
                echo "<option value='admin' style='color: #0a8eaf;' selected>Администратор</option>";
            } else echo "<option value='admin' style='color: #0a8eaf;'>Администратор</option>";
            if ($status == 'seller') {
                echo "<option value='seller' style='color: #a01ba2;' selected>Продавец</option>";
            } else echo "<option value='seller' style='color: #a01ba2;'>Продавец</option>";
            echo "</select></span>
                    <span class='col5' id='see_user$id'><a href='$site_domain/user$id/'>просмотр</a></span>
                </div>";
        }
        ?>
        </div>
        <div class="pages">
            <?php
                if ($total_pages > 1) {
                    for ($i=1;$i<=$total_pages;$i++) {
                        if ($page == $i) {
                        echo "<a class='btn-pages btn-page-activ' href='$site_domain/users/$i'>$i</a>";
                        } else {
                            echo "<a class='btn-pages btn-page-noactiv' href='$site_domain/users/$i'>$i</a>";
                        }
                    }
                }
            ?>
            
        </div>
    </div>
    
