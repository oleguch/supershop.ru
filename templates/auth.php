<div class="header-page">
	Вход
</div>

<div class="login-page">

	<div class="content-auth">

		<div class="header-content-auth">Зарегистрированный пользователь</div>
		<br><div id='answer' class='error-pole'></div><br>
		<form action='work.php' method="get" id="formauth">
			<p>E-mail</p>
			<input class="pole" type="text" name="email" placeholder="Введите адрес электронной почты">
            <input type="hidden" name="auth">
            <br>
			<p>Пароль</p>
			<input class="pole" type="password" name="pass" placeholder="Введите пароль"><br>
			<button type="button" name="auth" id="btn-auth">Войти</button>
            <div class="zabil-pass"><a href="#">Забыли пароль?</a></div>

		</form>
	</div>
	<div class="header-content-auth-reg">
		Новый пользователь <br>
		<a href="?page=registration"><button type="button" class="btn-reg">Зарегистрироваться</button> </a>
	</div>
</div>
<script type="text/javascript">
    

</script>