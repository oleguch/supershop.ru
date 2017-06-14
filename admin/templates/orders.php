<?php
if (isset($_GET["p"])) {
    $page  = $_GET["p"]; 
} else { $page=1; };
$start_from = ($page-1) * 10;

$query = "SELECT * FROM osamylov_orders WHERE status != 'Корзина' ORDER BY id LIMIT 10 OFFSET $start_from";
$result = pg_query($dbconn, $query);
$total_pages = ceil(pg_fetch_row(pg_query($dbconn ,"SELECT COUNT(id) FROM osamylov_orders"))[0] / 10);

?>
<div class="admin-header-page">заказы</div>
    <div class="admin-content-orders">
        <div class="admin-orders-table-head">
            <span class="head1">Номер заказа</span>
            <span class="head2">Статус</span>
            <span class="head3">Сумма</span>
            <span class="head4">Время заказа</span>
        </div>
        <?php 
        while ($r = pg_fetch_array($result)) {
            $number = $r['id'];
            $email = $r['email'];
            $total_order = $r['total_price'];
            $status = $r['status'];
            $total_order = number_format($total_order, 0, ',', ' ');
            $datetime = date("d.m.Y в H:i", $date = strtotime($r['time']));
            echo "<div class='order-line'>
                <span class='col1'>
                    <span class='number'>№ $number</span>
                    <span class='from'>от</span>
                    <span class='from-user'>$email</span>
                </span>
                <span class='col2'>
                    <select class='var-status' name='status-var' data-id_order='$number'>";

            if ($status == 'Отгружен') {
                echo "<option value='Отгружен' style='color: #1ba254;' selected>отгружен</option>";
            } else echo "<option value='Отгружен' style='color: #1ba254;'>отгружен</option>";
            if ($status == 'У курьера') {
                echo "<option value='У курьера' style='color: #ad5a00;' selected>у курьера</option>";
            } else echo "<option value='У курьера' style='color: #ad5a00;'>у курьера</option>";
            if ($status == 'Принят') {
                echo "<option value='Принят' style='color: #0a8eaf;' selected>принят</option>";
            } else echo "<option value='Принят' style='color: #0a8eaf;'>принят</option>";
            if ($status == 'Доставлен') {
                echo "<option value='Доставлен' style='color: #a01ba2;' selected>доставлен</option>";
            } else echo "<option value='Доставлен' style='color: #a01ba2;'>доставлен</option>";
            if ($status == 'Отменен') {
                echo " <option value='Отменен' class='qqq' style='color: #6c6c6c;' selected>отмена</option>";
            } else echo " <option value='Отменен' class='qqq' style='color: #6c6c6c;'>отмена</option>";
            echo "</select>
                    </span>
                    <span class='col3'>$total_order руб.</span>
                    <span class='col4'>$datetime</span>
                    <span class='col5'  id='seeorder$number'><a href='$site_domain/order$number/'>просмотр</a></span>
                </div>";
        }
        ?>
        
        <div class="pages">
            <?php
                if ($total_pages > 1) {
                    for ($i=1;$i<=$total_pages;$i++) {
                        if ($page == $i) {
                            echo "<a class='btn-pages btn-page-activ' href='?p=$i'>$i</a>";
                            } else {
                                echo "<a class='btn-pages btn-page-noactiv' href='?&p=$i'>$i</a>";
                            }
                    }
                }
            ?>
            
        </div>