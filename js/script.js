//var site_domain = 'http://supershop.ru';
//var site_domain = 'http://test.14school.ru';
var site_domain = 'http://shoggoth.ru/edu/09/osamylov/supershop.ru';
//var site_domain = 'http://skill.box/diplom';
function plus(n) {
    var count = document.getElementById("count" + n);
    var cena = document.getElementById('cena' + n);
    cena = toNumber(cena.innerHTML);
    var sum = document.getElementById("sum" + n);
    count.innerHTML = Number(count.innerHTML) + 1;
    sum.innerHTML = formatNumber(cena * Number(count.innerHTML) + " руб.");
    change_count_goods_cart(n, 'plus');
    itogo();
}

function minus(n) {
    var count = document.getElementById("count" + n);
    var cena = document.getElementById('cena' + n);
    cena = toNumber(cena.innerHTML);
    var sum = document.getElementById("sum" + n);
    if ((Number(count.innerHTML) - 1) > 0) {
        change_count_goods_cart(n, 'minus');
    }
    count.innerHTML = (Number(count.innerHTML) - 1) == 0 ? 1: (Number(count.innerHTML) - 1);
    sum.innerHTML = formatNumber(cena * Number(count.innerHTML)) + " руб.";
    itogo();
}
function change_count_goods_cart(id, type) {
    $.ajax({
        url: site_domain + "/work.php",
        type: "post",
        data: ("change_count_cart=" + id + "&type=" + type),
        success: function(answer) {
            console.log("Изменение количества товара в php");
            if (answer == 'ok') {
                console.log("ok");
                //location.href = "index.php?page=cats";
                //del_good_from_order_del(id_sold_good);
            } else {
                console.log(answer);
                $("#answer").html(answer);
            }
        }
    });
}
function itogo() {
    var sum = 0;
    $(".cart-item-sum").each(function(index, element) {
        sum += Number(toNumber(element.innerHTML));
    });
    $("#cart-zakaz-sum").text(formatNumber(sum) + " руб.");
    $("#cart_total_sum").text(formatNumber(sum));
    $("#cart_total_goods").text($('.cart-line').length + " предметов");
    
}

function formatNumber(str) {
    return String(str).replace(/(\d)(?=(\d\d\d)+([^\d]|$))/g, '$1 ');
}

function toNumber(str){
    return Number(str.replace(/[^0-9]/g, ""));
}
//========================================================УДАЛЕНИЕ ТОВАРА ИЗ КОРЗИНЫ
function cartDelItem(line) {
    del_good_from_cart(line);
    $("#cart-line"+line).slideUp('slow', 'linear',function(){
        $(this).remove();
        itogo();
        console.log("Количество товара в корзине: " + $('.cart-line').length);
        if ($('.cart-line').length == 0)
            location.href = site_domain;
    });
}
function del_good_from_cart(id_good) {
    $.ajax({
        url: site_domain + "/work.php",
        type: "post",
        data: ("del_good_from_cart=" + id_good),
        success: function(answer) {
            console.log("Отправка удаленного товара в php");
            if (answer == 'ok') {
                console.log("ok");
            } else {
                console.log(answer);
                $("#answer").html(answer);
            }
        }
    });
}

//======================================================УДАЛЕНИЕ ТОВАРА ИЗ ЗАКАЗА
function del_good_from_order(line) {
    line_good =$('#del_good_from_order_block' + line);
    line_good.text('');
    line_good.append('<span class="del_good_from_from_order" onclick="deleting_good_from_order(' + line + ');">Удалить  </span><span class="cancel_del_good" onclick="cancel_del_good(' + line + ');">Отмена</span>');
}
function cancel_del_good(line) {
    line_good =$('#del_good_from_order_block' + line);
    line_good.text('');
    line_good.append("<a class='del_good_from_from_order' onclick='del_good_from_order(" + line + ");'>убрать из заказа</a>");
}


function deleting_good_from_order (id_sold_good) {
    console.log("Удаление товара из заказа");
    $.ajax({
        url: site_domain + "/work.php",
        type: "post",
        data: ("delsoldgood=" + id_sold_good),
        success: function(answer) {
            console.log("Отправка удаленного товара в php");
            if (answer == 'ok') {
                console.log("ok");
                del_good_from_order_del(id_sold_good);
            } else {
                console.log(answer);
                $("#answer").html(answer);
            }
        }
    });
}

function del_good_from_order_del(line) {
    $('#del_good_from_order_block' + line).text('Товар удален');
    setTimeout(function() {
        $("#order_line"+line).css('transition', 'none');
        $("#order_line"+line).slideUp('slow', 'linear',function(){
            $(this).remove();
            itogo()});
    }, 300);
    console.log("Удаление строки заказа");
}


$(document).ready(function(){
	 $('#up').click(function () {
	    $('body,html').animate({scrollTop: 0 }, 400);
        return false;
    });
});



//============================================================СЛАЙДЕРЫ
$(document).ready(function(){
  $('#slide2').slick({
      appendArrows: $('#arrow-slide'),
      prevArrow: $('#prev'),
      nextArrow: $('#next'),
      infinite: false,
      speed: 300,
      slidesToShow: 4,
      slidesToScroll: 1,
      //autoplay: true,
      //autoplaySpeed: 2000,
      
    });
    $('#slide4').slick({
      appendArrows: $('#arrow_slide_4'),
      prevArrow: $('#prev_4'),
      nextArrow: $('#next_4'),
      infinite: false,
      speed: 300,
      slidesToShow: 4,
      slidesToScroll: 1,
      //autoplay: true,
      //autoplaySpeed: 2000,
      
    });
    $('#slide1').slick({
      appendArrows: $('#arrow-slide'),
      prevArrow: $('#prev'),
      nextArrow: $('#next'),
      infinite: false,
      //autoplay: true,
      //autoplaySpeed: 6000,
      fade: true,
      cssEase: 'linear',
      speed: 1000
    });
    //rows: 1,
    //slidesPerRow: 4
      $('#prev').click(function() {
          value_arrow();
      });
    $('#next').click(function() {
          value_arrow();
      });
    $('#prev_4').click(function() {
          value_arrow_pop_good();
      });
    $('#next_4').click(function() {
          value_arrow_pop_good();
      });
    function value_arrow() {
        var value_prev = prev.getAttribute('aria-disabled');
        var value_next = next.getAttribute('aria-disabled');
        if (value_next == 'true') {
          console.log('Вперед нельзя');
          $('#next').attr('src', site_domain + '/img/arrow-right-noactiv.png');
        } else {
          console.log('Вперед можно');
          $('#next').attr('src', site_domain + '/img/arrow-right-activ.png');
        }
        if (value_prev == 'true') {
          console.log('Обратно нельзя');
          $('#prev').attr('src',site_domain + '/img/arrow-left-noactiv.png');
        } else {
          console.log('Обратно можно');
          $('#prev').attr('src', site_domain + '/img/arrow-left-activ.png');
        }
    }
    $('#prod_img_prev').click(function() {
          value_arrow_image_good();
      });
    $('#prod_img_next').click(function() {
          value_arrow_image_good();
      });
    $('#main_img').slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: false,
      fade: true,
      asNavFor: '#mini_img'
    });
    $('#mini_img').slick({
      slidesToShow: 4,
      slidesToScroll: 1,
      asNavFor: '#main_img',
      focusOnSelect: true,
      appendArrows: $('.prod-images-mini'),
      prevArrow: $('#prod_img_prev'),
      nextArrow: $('#prod_img_next'),
        centerMode: true,
        centerPadding: '40px',
    });
    function value_arrow_image_good() {
        var value_prev = prod_img_prev.getAttribute('aria-disabled');
        var value_next = prod_img_next.getAttribute('aria-disabled');
        if (value_next == 'true') {
          console.log('Вперед нельзя');
          $('#prod_img_next').attr('src',site_domain + '/img/img-arrow-right-noactiv.png');
        } else {
          console.log('Вперед можно');
          $('#prod_img_next').attr('src', site_domain + '/img/img-arrow-right-activ.png');
        }
        if (value_prev == 'true') {
          console.log('Обратно нельзя');
          $('#prod_img_prev').attr('src',site_domain + '/img/img-arrow-left-noactiv.png');
        } else {
          console.log('Обратно можно');
          $('#prod_img_prev').attr('src',site_domain + '/img/img-arrow-left-activ.png');
        }
    }
    
    function value_arrow_pop_good() {
        var value_prev = prev_4.getAttribute('aria-disabled');
        var value_next = next_4.getAttribute('aria-disabled');
        if (value_next == 'true') {
          console.log('Вперед нельзя');
          $('#next_4').attr('src',site_domain + '/img/arrow-right-noactiv.png');
        } else {
          console.log('Вперед можно');
          $('#next_4').attr('src',site_domain + '/img/arrow-right-activ.png');
        }
        if (value_prev == 'true') {
          console.log('Обратно нельзя');
          $('#prev_4').attr('src',site_domain + '/img/arrow-left-noactiv.png');
        } else {
          console.log('Обратно можно');
          $('#prev_4').attr('src',site_domain + '/img/arrow-left-activ.png');
        }
    }
    
    lightbox.option({
       showImageNumberLabel: false, 
        wrapAround: true,
    });
});


jQuery(function($){
   $("#phone").mask("+7(999) 999-9999");
   });



//=================================================СМЕНА СТАТУСА ЗАКАЗА
$(document).ready(function() {
    $('body').on('change', 'select[name=status-var]', function(){
        console.log('У заказа ' + $(this).data('id_order') + ' меняем статус на ' + $(this).val());
        change_status($(this).data('id_order'), $(this).val());
    });
});
function change_status (id_order, status) {
    $.ajax({
        url: site_domain + "/work.php",
        type: "post",
        data: ('change_status_id=' + id_order + '&change_status_st=' + status),
        success: function(answer) {
            if (answer == 'ok') {
                console.log("ok");
                //location.href = "index.php";
                console.log('Усё успешно');
                block =$('#seeorder' + id_order);
                block.text('');
                block.append('<div style="color: #da0000; font-size: 16px;">Статус изменен</div>');
                setTimeout(function () {
                    block.text('');
                    block.append("<a href='?page=order&id=" + id_order + "'>просмотр</a>");
                }, 2000);

            } else {
                console.log(answer);
                $("#answer").html(answer);
            }
        }
    });
}



//=================================================СМЕНА РОЛИ ПОЛЬЗОВАТЕЛЯ
$(document).ready(function() {
    $('body').on('change', 'select[name=access_role]', function(){
        console.log('У пользователя ' + $(this).data('id_user') + ' меняем роль на ' + $(this).val());
        change_role($(this).data('id_user'), $(this).val());
    });
});
function change_role (id_user, status) {
    $.ajax({
        url: site_domain + "/work.php",
        type: "post",
        data: ('change_role_id=' + id_user + '&change_role_st=' + status),
        success: function(answer) {
            if (answer == 'ok') {
                console.log("ok");
                //location.href = "index.php";
                console.log('Усё успешно');
                block =$('#see_user' + id_user);
                block.text('');
                block.append('<div style="color: #da0000; font-size: 14px;">Роль изменена</div>');
                setTimeout(function () {
                    block.text('');
                    block.append("<a href='?page=user&id=" + id_user + "'>просмотр</a>");
                }, 2000);

            } else {
                console.log(answer);
                $("#answer").html(answer);
            }
        }
    });
}


//////////////////АВТОРИЗАЦИЯ
$(document).ready(function() {
    $("#btn-auth").click(function(event){
        console.log("asd1");
        event.preventDefault();
        console.log("asd");
        $.ajax({
            url: site_domain + "/work.php",
            type: "get",
            data: $("#formauth").serialize(),
            success: function(answer) {
                console.log("qqq");
                if (answer == 'ok') {
                    console.log("ok");
                     location.href = site_domain;
                } else {
                    console.log(answer);
                    $("#answer").html(answer);
                }
            }
    });
    });
});


//////////////////FAST АВТОРИЗАЦИЯ
$(document).ready(function() {
    $("#btn-fast-login").click(function(event){
        event.preventDefault();
        $.ajax({
            url: site_domain + "/work.php",
            type: "get",
            data: $("#formfastlogin").serialize(),
            success: function(answer) {
                console.log("qqq");
                if (answer == 'ok') {
                    //location.href = site_domain + "/order2/";
                    location.href = site_domain + "/?page=order2";
                } else {
                    console.log(answer);
                    $("#answer2").html(answer);
                }
            }
    });
    });
});

//==================================РЕГИСТРАЦИЯ
$(document).ready(function() {
    $("#btn-reg").click(function(event){
        console.log("asd1");
        event.preventDefault();
        console.log($("#formreg").serialize());
        $.ajax({
            url: site_domain + "/work.php",
            type: "get",
            data: $("#formreg").serialize(),
            success: function(answer) {
                console.log("qqq: " + answer);
                if (answer == 'ok') {
                    console.log("ok");
                     location.href = site_domain;
                } else {
                    console.log(answer);
                    $("#answer").html(answer);
                }
            }
    });
    });
});



//==================================ЛИЧНЫЙ КАБИНЕТ
$(document).ready(function() {
    $("#btn-lk").click(function(event){
        console.log("asd1");
        event.preventDefault();
        console.log($("#formlk").serialize());
        $.ajax({
            url: site_domain + "/work.php",
            type: "get",
            data: $("#formlk").serialize(),
            success: function(answer) {
                console.log("qqq: " + answer);
                if (answer == 'ok') {
                    console.log("ok");
                     $("#answer").html("Данные сохранены");
                } else {
                    console.log(answer);
                    $("#answer").html(answer);
                }
            }
    });
    });
});



//////////////////РЕГИСТРАЦИЯ КОРЗИНЫ НОВОГО ПОЛЬЗОВАТЕЛЯ
$(document).ready(function() {
    $("#btn-order-newuser").click(function(event){
        console.log("asd1");
        event.preventDefault();
        console.log("asd");
        $.ajax({
            url: site_domain + "/work.php",
            type: "get",
            data: $("#form-order-newuser").serialize(),
            success: function(answer) {
                console.log("qqq");
                if (answer == 'ok') {
                    console.log("ok");
                     //location.href = site_domain + "/order2/";
                    location.href = site_domain + "/?page=order2";
                } else {
                    console.log(answer);
                    $("#answer").html(answer);
                }
            }
    });
    });
});

//////////////////ПРОВЕРКА АДРЕСА ДОСТАВКИ
$(document).ready(function() {
    $("#btn-order-addr").click(function(event){
        console.log("asd1");
        event.preventDefault();
        console.log("asd");
        $.ajax({
            url: site_domain + "/work.php",
            type: "get",
            data: $("#form-order-addr").serialize(),
            success: function(answer) {
                console.log("qqq");
                if (answer == 'ok') {
                    console.log("ok");
                     //location.href = site_domain + "/order3/";
                    location.href = site_domain + "/?page=order3";
                } else {
                    console.log(answer);
                    $("#answer").html(answer);
                }
            }
    });
    });
});


//////////////////ПРОВЕРКА ДОБАВЛЕНИЯ КАТЕГОРИИ
$(document).ready(function() {
    $("#btn-add-cat").click(function(event){
        console.log("asd1");
        event.preventDefault();
        console.log("asd");
        $.ajax({
            url: "../work.php",
            type: "get",
            data: $("#form-add-cat").serialize(),
            success: function(answer) {
                console.log("qqq");
                if (answer == 'ok') {
                    console.log("ok");
                    location.href = "index.php?page=cats";
                } else {
                    console.log(answer);
                    $("#answer").html(answer);
                }
            }
    });
    });
});

//////////////////ПРОВЕРКА УДАЛЕНИЯ КАТЕГОРИИ
function delcatline(id) {

    $('#del_cat_block' + id).text('Удалено');
    $('#show_cat_block' + id).text('');
    setTimeout(function() {
        catline = $("#catline"+ id);
        catline.css('transition', 'none');
        catline.slideUp('slow', 'linear',function(){
            $(this).remove();
        });
    }, 2000);
    console.log("Удаление категории");
}
function delcat(id) {

        console.log("Удаление категории");
        $.ajax({
            url: "../work.php",
            type: "get",
            data: ("delcat=" + id),
            success: function(answer) {
                console.log("qqq");
                if (answer == 'ok') {
                    console.log("ok");
                    //location.href = "index.php?page=cats";
                    delcatline(id)
                } else {
                    console.log(answer);
                    $("#answer").html(answer);
                }
            }
    });
}

//////////////////ПРОВЕРКА ПЕРЕИМЕНОВАНИЯ КАТЕГОРИИ
$(document).ready(function() {
    $("#btn-rename-cat").click(function(event){
        console.log("asd1");
        event.preventDefault();
        console.log("asd");
        $.ajax({
            url: "../work.php",
            type: "get",
            data: $("#form-rename-cat").serialize(),
            success: function(answer) {
                console.log("qqq");
                if (answer == 'ok') {
                    console.log("ok");
                    $("#answer").html("Категория переименована");
                } else {
                    console.log(answer);
                    $("#answer").html(answer);
                }
            }
    });
    });

});


//===========================ЗАГРУЗКА КАРТРИНКИ
function upload_img(a) {
    console.log(a);
    $("#input_img" + a).click();
}
//============================УДАЛЕНИЕ КАРТИНКИ

function del_img(id, i) {
    console.log(id + "Удаление картинки");
    $('#btn-del-img-'+i).css('display', 'none');
    $('#btn-upload-img-'+i).text('Загрузить');
    $('#img' + i).attr('src',site_domain + '/img/img-0.jpg');
    $("#text_img" + i).append('<div class="img-item-clear" id="btn-clear-img-' + i + '" onClick="clear_img(' + i + ');">Очистить</div>');
    $('#admin_img_block' + i).append('<div class="img-item-deliting" id="image-deleting-' + i + '">Изображение удалено</div>');
    console.log("Добавление блока");
    $('#delimgblock' + i).attr('value', i);
    $('#delimgid' + i).attr('value', id);
}

//===============================ОЧИСТКА КАРТИНКИ ТОВАРА
function clear_img(a) {
    console.log("Очищение картинки");
    $('#img' + a).attr('src', site_domain + "/img/img-0.jpg");
    $("#input_img" + a).prop('value', null);
    $('#btn-clear-img-'+a).css('display', 'none');
    console.log("очищено?");
}
//===============================ИЗМЕНЕНИЕ КАРТИНКИ ТОВАРА
function change_img(a, id) {
    console.log("Изменение картинки");
    $("#input_change_img" + a).click();
    console.log("А что дальше?");
    $('#input_change_img' + a).change(function(){
        readImage(this, a);
        $.ajax({
            type:'post', // Тип запроса
            url: '../work.php', // Скрипт обработчика
            data: formData, // Данные которые мы передаем
            cache:false, // В запросах POST отключено по умолчанию, но перестрахуемся
            contentType: false, // Тип кодирования данных мы задали в форме, это отключим
            processData: false, // Отключаем, так как передаем файл
            success:function(data){
                console.log("Ответ:");
                console.log(data);
                //printMessage('#answer', data);
                if ((data == 'ok') || (data == 'okok')) {
                        console.log("ok");
                        $("#answer").html("Товар сохранен");
                        location.reload();
                    } else {
                        console.log(answer);
                        $("#answer").html(data);
                    }
            },
            error:function(data){
                console.log(data);
            }
        });
    });
}

function readImage (input, img) {
    console.log("Попытка прочитать картинку " + input + " на месте " + img);
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        console.log("readImage");
        reader.onload = function (e) {
            $('#img' + img).attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
        console.log("Прочитал картинку");
    }
}

function change_input(i) {
    console.log("Изменение картинки " + i);
    //readImage($('#input_img' + i).on, i);
    $('#btn-clear-img-' + i).css('display', 'block');
    $('#image-deleting-' + i).css('display', 'none');
}
//==============================ПРОВЕРКА ДОБАВЛЕНИЯ_ИЗМЕНЕНИЯ ТОВАРА С КАРТИНКАМИ
$(document).ready(function () {
 
$('body').on('change', 'input[type=file]', function () {
    console.log("Инпут изменился");
    console.log($(this).data('id_img'));
    readImage(this, $(this).data('id_img'));
});



//$("#form-good-info").on('submit',(function(e) {
$('body').on('submit', "form" ,(function(e) {
    e.preventDefault();
    //$(this).load('form');
    console.log("btn_save_item");
    var formData = new FormData(this);
    console.log(formData);
    $.ajax({
        type:'post', // Тип запроса
        url: '../work.php', // Скрипт обработчика
        data: formData, // Данные которые мы передаем
        cache:false, // В запросах POST отключено по умолчанию, но перестрахуемся
        contentType: false, // Тип кодирования данных мы задали в форме, это отключим
        processData: false, // Отключаем, так как передаем файл
        success:function(data){
            console.log("Ответ:");
            console.log(data);
            //printMessage('#answer', data);
            if ((data == 'ok') || (data == 'okok')) {
                    console.log("ok");
                    $("#answer").html("Товар сохранен");
                    location.reload();
                } else {
                    console.log(answer);
                    $("#answer").html(data);
                }
        },
        error:function(data){
            console.log(data);
        }
    });
}));
});

//////////////////ПРОВЕРКА УДАЛЕНИЯ ТОВАРА
function delgood(id) {

        console.log("Удаление товара");
        $.ajax({
            url: "../work.php",
            type: "get",
            data: ("delgood=" + id),
            success: function(answer) {
                if (answer == 'ok') {
                    console.log("ok");
                    location.href = "index.php?page=cats";
                } else {
                    console.log(answer);
                    $("#answer").html(answer);
                }
            }
    });
}
//======================================================УДАЛЕНИЕ ТОВАРА
function delgood_line(line) {
    line_good_del_block =$('#del_good_line_block' + line);
    line_good_show_block=$('#show_good_block' + line);
    line_good_del_block.text('');
    line_good_show_block.text('');
    line_good_show_block.append('<span class="del_good_from_from_order" onclick="deleting_good_line(' + line + ');">УДАЛИТЬ?</span>');
    line_good_del_block.append('<span class="cancel_del_good" onclick="cancel_del_good_line(' + line + ');">Отмена</span>');
}
function cancel_del_good_line(line) {

    line_good_del_block =$('#del_good_line_block' + line);
    line_good_show_block=$('#show_good_block' + line);
    line_good_del_block.text('');
    line_good_show_block.text('');
    id_cat = line_good_show_block.data('id_cat');
    line_good_del_block.append("<a onclick='delgood_line(" + line + ");'>удалить</a>");
    line_good_show_block.append("<a href='?page=showgood&id=" + line + "&id_cat=" + id_cat + "'>просмотр</a></span>");
}


function deleting_good_line (id) {
    console.log("Удаление товара полностью");
    $.ajax({
        url: "../work.php",
        type: "get",
        data: ("delgood=" + id),
        success: function(answer) {
            console.log("Отправка удаленного товара в php");
            if (answer == 'ok') {
                console.log("ok");
                del_good_from_list(id);
            } else {
                console.log(answer);
                $("#answer").html(answer);
            }
        }
    });
}

function del_good_from_list(line) {
    line_good_del_block =$('#del_good_line_block' + line);
    line_good_show_block=$('#show_good_block' + line);
    line_good_del_block.text('Удалено');
    line_good_show_block.text('');
    setTimeout(function() {
        $("#good_line"+line).css('transition', 'none');
        $("#good_line"+line).slideUp('slow', 'linear',function(){
            $(this).remove();
        });
    }, 1500);
    console.log("Удаление строки товара");
}


$(document).ready(function(){
    $('#up').click(function () {
        $('body,html').animate({scrollTop: 0 }, 400);
        return false;
    });
});


function delvar(id) {
    console.log("Удаление варианта товара");
    $('#good-var' + id).attr('value', '');
    $('#line-var' + id).append('<div>Вариант удален</div>');
}
//=================================================ДОБАВЛЕНИЕ ТОВАРА В КОРЗИНУ

    $(document).ready(function() {
        $("#add_good_to_cart").click(function(event){
            console.log("Начинаем добавлять товар в корзину");
            event.preventDefault();
            $.ajax({
                url: site_domain + "/work.php",
                type: "POST",
                data: $("#good_info_to_cart").serialize(),
                success: function(answer) {
                    console.log("Пришел ответ");
                    if (answer == 'ok') {
                        console.log("ok");
                        //$("#answer").html("Категория переименована");
                        location.reload();
                    } else {
                        console.log(answer);
                        $("#answer").html(answer);
                    }
                }
            });
        });
    });



//===============================================ПОДТВЕРЖДЕНИЕ ЗАКАЗА
$(document).ready(function() {
    $('.confirm-order').click(function () {
        $.ajax({
            url: site_domain + "/work.php",
            type: "post",
            data: ("confirm_order"),
            success: function(answer) {
                if (answer == 'ok') {
                    console.log("ok");
                    //location.href = site_domain + "/order4/";
                    location.href = site_domain + "/?page=order4";
                    //location.reload();
                } else {
                    console.log(answer);
                    $("#answer").html(answer);
                }
            }
        });
    });
});