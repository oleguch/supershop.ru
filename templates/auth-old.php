<div class="header-page">
	Вход
</div>

<div class="login-page">
<div id='answer' class='error-pole'></div><br>
	<div class="content-auth">

		<div class="header-content-auth">Зарегистрированный пользователь</div>
		<form action='work.php' method="get" id="formauth">
			<p>E-mail</p>
			<input class="pole" type="text" name="email" placeholder="Введите адрес электронной почты"
           <?php
            if (isset($_GET['error'])) echo "value='$_GET[name]'";
            ?>
           >
           <?php
            if (isset($_GET['error']['email'])) {
                if ($_GET['error']['email'] == 1) echo "<div class='error-pole'>Адрес элетронной почты не введен</div>";
                else if ($_GET['error']['email'] == 2) echo "<div class='error-pole'>Пользователя с таким адресом электронной почты не существует</div>";
            }
            ?>
            <input type="hidden" name="auth">
            <br>
			<p>Пароль</p>
			<input class="pole" type="password" name="pass" placeholder="Введите пароль"><br>
			<?php
            if (isset($_GET['error']['pass'])) {
                if ($_GET['error']['pass'] == 1) echo "<div class='error-pole'>Пароль не введен</div><br>";
                else if (($_GET['error']['pass'] == 2) && ($_GET['error']['email'] != 2)) echo "<div class='error-pole'>Пароль не верен</div><br>";
            }
            ?>
			<button type="button" name="auth" id="btn-auth">Войти</button>
            <div class="zabil-pass"><a href="#">Забыли пароль?</a></div>

		</form>
	</div>
	<div class="header-content-auth-reg">
		Новый пользователь <br>
		<a href="?page=registration"><button type="submit" class="btn-reg">Зарегистрироваться</button> </a>
	</div>
</div>
<script type="text/javascript">
        


</script>