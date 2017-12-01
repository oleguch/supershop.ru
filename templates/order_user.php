<div class="header-page">
	Оформление заказа
</div>

<div class="zakaz-cur" style="margin-top: 20px;">
    <span class="zakaz-head-num">1.</span>
    <span class="zakaz-head-text">Контактная информация</span>
</div>
<div class="zakaz-user-cont">
   <span class="zakaz-newuser">
        <div class="zakaz-content-head">Для новых покупателей</div>
        <form action="" method="get" id="form-order-newuser">
           <div id='answer' class='error-pole'></div>
            <p class="zakaz-content-headpole">Контактное лицо (ФИО):</p>
            <input type="text" class="zakaz-content-pole zakaz-content-pole-full" name="name">
            <p class="zakaz-content-headpole" >Контактный телефон:</p>
            <input type="text" id="phone" class="zakaz-content-pole zakaz-content-pole-full" name="phone">
            <p class="zakaz-content-headpole">E-mail:</p>
            <input type="email" class="zakaz-content-pole  zakaz-content-pole-full" name="email">
            <input type="hidden" name="order-newuser">
           <button type="button" id="btn-order-newuser" class="zakaz-btn-cont zakaz-btn">Продолжить</button>
       </form>
    </span>
    <span class="zakaz-fastlogin">
        <div class="zakaz-content-head">Быстрый вход</div>
        <form action="" method="get" id="formfastlogin">
           <div id='answer2' class='error-pole'></div>
            <p class="zakaz-content-headpole">Ваш e-mail:</p>
            <input type="email" name="email" class="zakaz-content-pole zakaz-content-pole-full">
            <p class="zakaz-content-headpole">Пароль:</p>
            <input type="password" name="pass" class="zakaz-content-pole zakaz-content-pole-full"><br>
            <input type="hidden" name="auth">
            <button type="button" class="zakaz-btn zakaz-btn-login" id="btn-fast-login">Войти</button>
            <a href="#" class="ahref-pass">Восстановить пароль</a>
        </form>
    </span>
</div>
<div class="zakaz-nocur">
    <span class="zakaz-head-num">2.</span>
    <span class="zakaz-head-text">Информация о доставке</span>
</div>
<div class="zakaz-nocur" style="margin-bottom: 30px;">
    <span class="zakaz-head-num">3.</span>
    <span class="zakaz-head-text">Подтверждение заказа</span>
</div>
<script>

</script>