<div class="header-page">
	Регистрация
</div>
<form class="registration-page" action='work.php' method="get" >
    <div class="reg-left">
        <p>Контактное лицо</p>
        <input class="pole" type="text" name="name" placeholder="Введите ФИО"
        <?php
            if (isset($_GET['error'])) echo "value='$_GET[name]'";
            ?>
        >
        <?php
            if (isset($_GET['error']['name'])) {
                if ($_GET['error']['name'] == 1) echo "<div class='error-pole'>Имя не введено</div>";
            }
            ?>
        
        <br>
        
        <p>E-mail адрес</p>
        <input class="pole" type="text" name="email" placeholder="Введите E-mail"
        <?php
            if (isset($_GET['error'])) echo "value='$_GET[email]'";
            ?>
        >
        <?php
            if (isset($_GET['error']['email'])) {
                if ($_GET['error']['email'] == 1) echo "<div class='error-pole'>Адрес элетронной почты не введен</div>";
                else if ($_GET['error']['email'] == 2) echo "<div class='error-pole'>Пользователя с таким адресом электронной уже зарегистрирован</div>";
            }
            ?>
        
        <br>
    </div>
    <div class="reg-right">
        <p>Пароль</p>
        <input class="pole" type="password" name="pass1" placeholder="Введите пароль">
        <?php
            if (isset($_GET['error']['pass1'])) {
                if ($_GET['error']['pass1'] == 1) echo "<div class='error-pole'>Пароль не введен</div>";
                else if ($_GET['error']['pass1'] == 2) echo "<div class='error-pole'>Пароли не совпадают</div>";
            }
            ?>
        
        
        <br>
        <p>Повторите пароль</p>
        <input class="pole" type="password" name="pass2" placeholder="Повторите пароль">
        <?php
            if (isset($_GET['error']['pass2'])) {
                if ($_GET['error']['pass2'] == 1) echo "<div class='error-pole'>Пароль не введен</div>";
                else if ($_GET['error']['pass1'] == 2) echo "<div class='error-pole'>Пароли не совпадают</div>";
            }
            ?>
        <br>
    </div><br>
    <button type="submit" class="btn-reg" name="reg">Зарегистрироваться</button>
</form>
    