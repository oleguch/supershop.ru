<?php
    $query = "SELECT * FROM osamylov_cats ORDER BY id";
    $result = pg_query($dbconn, $query);
?>
     

  <!--   <a class="logo" href="index.php"> -->
        <?php echo '<a class="logo" href="'.$site_domain.'">';?>
	     <div class="logo1st">SUPER</div>
	    <div class="logo2nd">SHOP</div>
    </a>
    <div class="line-menu">
       <div class="line1st">
            <div class="cat-menu">
               <?php
                while ($r = pg_fetch_array($result)) {
                    $name = $r['name'];
                    $id = $r['id'];
                    //echo "<a href='?page=cat&cat=$id'>
                    echo "<a href='".$site_domain."/cat/$id/'>
                            <div style='margin: auto;'>$name</div>
                        </a>";
                }
                ?>
            </div>
            <div class="auth-menu">
               <?php
                if (!isset($_SESSION['user'])) {
                echo "
                <div class='auth'>
                    <img src='$site_domain/img/icon_lk.png'>
                    <a class='auth-link' href='$site_domain/auth/'>Войти</a>
                </div>
                <div class='reg'>
                    <a href='$site_domain/registration/'>Регистрация</a>
                </div>";
                }
                else {
                   $res_access = pg_fetch_array(pg_query($dbconn, "select * from osamylov_user_access where id_user = ".$_SESSION['user']['id']));
                   if (!$res_access) {
                       $status = 'none';
                   } else $status = $res_access['access_role'];
                    $email = $_SESSION['user']['email'];
                    echo "<div class='line-lk'>
                        <img src='$site_domain/img/icon_lk.png'>
                    <a  href='$site_domain/lk/'>$email
                    </a>
                    <div class='lk-menu'>";
                    if ($status != 'none') {
                        echo "<div class='lk-menu-list'>
                        <a href='$site_domain/admin/'>Админка</a>
                        </div>";
                    }
                   echo "<div class='lk-menu-list'>
                            <a href='$site_domain/lk/'>Личный кабинет</a>
                            </div>
                        <div class='lk-menu-list'>
                        <a href='$site_domain/?exit=true'>Выход</a>
                        </div>
                    </div>
                    </div>";
                }
                ?>
           </div>
        </div>
        <?php
        if(isset($_SESSION['cart_goods'])) {
            $total_sum = 0;
            $total_goods = sizeof($_SESSION['cart_goods']);
            foreach ($_SESSION['cart_goods'] as $goods) {
                $numbers = $goods['number'];
                $id_good = $goods['id_good'];
                $price = pg_fetch_array(pg_query($dbconn, "SELECT price FROM osamylov_goods WHERE id = ".$id_good))['price'];
                echo $price;
                $total_sum += $price * $numbers;
            }
            $total_sum = number_format($total_sum, 0, ",", " ");
            echo '<a href="'.$site_domain.'/cart/"><div class="cart">
           <div class="cart-text">
                <div class="summma">
                   <span class="sum" id="cart_total_sum">'.$total_sum.'</span>
                   <span class="rub">руб</span>
                </div>
                <div class="number-items" id="cart_total_goods">'.$total_goods.' предмета</div>
            </div>
            <img src="'.$site_domain.'/img/icon-cart.png">
        </div></a>';
        }
        ?>

    </div>