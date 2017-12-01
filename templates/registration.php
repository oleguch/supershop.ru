<div class="header-page">
	Регистрация
</div>

<form id="formreg" class="registration-page" action='work.php' method="get" >
    <div class="reg-left">
       
        <p>Контактное лицо</p>
        <input class="pole" type="text" name="name" placeholder="Введите ФИО"><br>
        <p>E-mail адрес</p>
        <input class="pole" type="text" name="email" placeholder="Введите E-mail"><br>
        <input type="hidden" name="reg">
    </div>
    <div class="reg-right">
        <p>Пароль</p>
        <input class="pole" type="password" name="pass1" placeholder="Введите пароль"><br>
        <p>Повторите пароль</p>
        <input class="pole" type="password" name="pass2" placeholder="Повторите пароль"><br>
    </div><br>
    <button type="button" class="btn-reg" name="reg" id="btn-reg">Зарегистрироваться</button>
    <br><div id='answer' class='error-pole'></div><br>
</form>
    