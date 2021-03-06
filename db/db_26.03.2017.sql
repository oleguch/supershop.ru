toc.dat                                                                                             0000600 0004000 0002000 00000023100 13066020365 0014434 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       )                    u            osamylov_db    9.6.2    9.6.2 (    ~           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false         �           1262    24577    osamylov_db    DATABASE     �   CREATE DATABASE osamylov_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE osamylov_db;
             osamylov    false                     2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false         �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                     3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false         �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1         M           1247    32810    badge    TYPE     L   CREATE TYPE badge AS ENUM (
    'none',
    'NEW',
    'HOT',
    'SALE'
);
    DROP TYPE public.badge;
       public       osamylov    false    3         �            1259    32775    cart    TABLE     �   CREATE TABLE cart (
    id integer NOT NULL,
    id_user integer,
    id_good integer[],
    number integer[],
    delivery integer,
    city text,
    street text,
    house text,
    app integer,
    comment text
);
    DROP TABLE public.cart;
       public         osamylov    false    3         �            1259    32773    cart_id_seq    SEQUENCE     m   CREATE SEQUENCE cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.cart_id_seq;
       public       osamylov    false    3    188         �           0    0    cart_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE cart_id_seq OWNED BY cart.id;
            public       osamylov    false    187         �            1259    32790    cats    TABLE     Z   CREATE TABLE cats (
    id integer NOT NULL,
    name text NOT NULL,
    descript text
);
    DROP TABLE public.cats;
       public         osamylov    false    3         �            1259    32788    cats_id_seq    SEQUENCE     m   CREATE SEQUENCE cats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.cats_id_seq;
       public       osamylov    false    192    3         �           0    0    cats_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE cats_id_seq OWNED BY cats.id;
            public       osamylov    false    191         �            1259    32824    goods_id_seq    SEQUENCE     n   CREATE SEQUENCE goods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.goods_id_seq;
       public       osamylov    false    3         �            1259    32801    goods    TABLE       CREATE TABLE goods (
    id integer DEFAULT nextval('goods_id_seq'::regclass) NOT NULL,
    id_cat integer NOT NULL,
    descript text,
    url_img text[],
    price integer NOT NULL,
    variant text[],
    badge badge DEFAULT 'none'::badge,
    name text NOT NULL
);
    DROP TABLE public.goods;
       public         osamylov    false    194    589    589    3         �            1259    24578    users    TABLE     �   CREATE TABLE users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    pass text,
    address_city text,
    address_street text,
    address_house text,
    address_app integer,
    phone text
);
    DROP TABLE public.users;
       public         osamylov    false    3         �            1259    24584    names_id_seq    SEQUENCE     n   CREATE SEQUENCE names_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.names_id_seq;
       public       osamylov    false    3    185         �           0    0    names_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE names_id_seq OWNED BY users.id;
            public       osamylov    false    186         �            1259    32784 
   sold_goods    TABLE     t   CREATE TABLE sold_goods (
    id integer NOT NULL,
    id_order integer,
    id_good integer,
    number integer
);
    DROP TABLE public.sold_goods;
       public         osamylov    false    3         �            1259    32782    sold_goods_id_seq    SEQUENCE     s   CREATE SEQUENCE sold_goods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.sold_goods_id_seq;
       public       osamylov    false    3    190         �           0    0    sold_goods_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE sold_goods_id_seq OWNED BY sold_goods.id;
            public       osamylov    false    189         �           2604    32778    cart id    DEFAULT     T   ALTER TABLE ONLY cart ALTER COLUMN id SET DEFAULT nextval('cart_id_seq'::regclass);
 6   ALTER TABLE public.cart ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    188    187    188         �           2604    32793    cats id    DEFAULT     T   ALTER TABLE ONLY cats ALTER COLUMN id SET DEFAULT nextval('cats_id_seq'::regclass);
 6   ALTER TABLE public.cats ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    192    191    192         �           2604    32787    sold_goods id    DEFAULT     `   ALTER TABLE ONLY sold_goods ALTER COLUMN id SET DEFAULT nextval('sold_goods_id_seq'::regclass);
 <   ALTER TABLE public.sold_goods ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    189    190    190         �           2604    24586    users id    DEFAULT     V   ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('names_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    186    185         u          0    32775    cart 
   TABLE DATA               b   COPY cart (id, id_user, id_good, number, delivery, city, street, house, app, comment) FROM stdin;
    public       osamylov    false    188       2165.dat �           0    0    cart_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('cart_id_seq', 1, false);
            public       osamylov    false    187         y          0    32790    cats 
   TABLE DATA               +   COPY cats (id, name, descript) FROM stdin;
    public       osamylov    false    192       2169.dat �           0    0    cats_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('cats_id_seq', 22, true);
            public       osamylov    false    191         z          0    32801    goods 
   TABLE DATA               T   COPY goods (id, id_cat, descript, url_img, price, variant, badge, name) FROM stdin;
    public       osamylov    false    193       2170.dat �           0    0    goods_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('goods_id_seq', 4, true);
            public       osamylov    false    194         �           0    0    names_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('names_id_seq', 62, true);
            public       osamylov    false    186         w          0    32784 
   sold_goods 
   TABLE DATA               <   COPY sold_goods (id, id_order, id_good, number) FROM stdin;
    public       osamylov    false    190       2167.dat �           0    0    sold_goods_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('sold_goods_id_seq', 1, false);
            public       osamylov    false    189         r          0    24578    users 
   TABLE DATA               p   COPY users (id, name, email, pass, address_city, address_street, address_house, address_app, phone) FROM stdin;
    public       osamylov    false    185       2162.dat �           2606    32798    cats cats_pkey 
   CONSTRAINT     E   ALTER TABLE ONLY cats
    ADD CONSTRAINT cats_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cats DROP CONSTRAINT cats_pkey;
       public         osamylov    false    192    192         �           2606    32808    goods goods_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY goods
    ADD CONSTRAINT goods_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.goods DROP CONSTRAINT goods_pkey;
       public         osamylov    false    193    193         �           2606    32800    users users_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (email);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         osamylov    false    185    185         �           2606    32819    goods fk-good-cat    FK CONSTRAINT     b   ALTER TABLE ONLY goods
    ADD CONSTRAINT "fk-good-cat" FOREIGN KEY (id_cat) REFERENCES cats(id);
 =   ALTER TABLE ONLY public.goods DROP CONSTRAINT "fk-good-cat";
       public       osamylov    false    2041    193    192                                                                                                                                                                                                                                                                                                                                                                                                                                                                        2165.dat                                                                                            0000600 0004000 0002000 00000000005 13066020365 0014243 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2169.dat                                                                                            0000600 0004000 0002000 00000005533 13066020365 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        11	Сноуборды	Сноуборд, Сноубординг (англ. Snowboarding от англ. snow — снег и англ. board — доска) — зимний олимпийский вид спорта, заключающийся в спуске с заснеженных склонов и гор на специальном снаряде — сноуборде. Изначально зимний вид спорта, хотя отдельные экстремалы освоили его даже летом, катаясь на сноуборде на песчаных склонах (сэндбординг).
7	Вейкборд	Вейкбординг или вейкборд — экстремальный вид спорта, сочетающий в себе элементы воднолыжного слалома, акробатику и прыжки. Представляет собой комбинацию водных лыж, сноуборда, скейта и сёрфинга.
9	Роликовые коньки	Роликовые коньки — Обьект с прикреплёнными к ним рамами, в которых закреплено от двух до пяти (и даже шести) колёс, предназначенные для передвижения по твёрдой ровной поверхности, реже по бездорожью, аналогично передвижению по льду на традиционных коньках
12	Тенисные ракетки	Ракетка — спортивный инвентарь, используемый в игровых видах спорта: теннисе (теннисная ракетка), сквоше, бадминтоне, настольном теннисе и некоторых других менее популярных играх, например, ракетболе
10	Самокаты	Самокат наземное средство передвижения, в основном двухколёсное, приводимое в действие путём многократного отталкивания ногой от земли в положении стоя, и управляемое при помощи руля
8	Двухколесные скейты	Не так давно у любителей экстремальных видов спорта появился новый снаряд – это двухколесный скейт. Он имеет несколько названий - Роллерсёрф, Рипстик, Вэйвборд. Чем отличается это новый скейт от своих предшественников ясно уже из его названия – он имеет только два колеса, а не две пары из двух колес, как на обычном скейте.
\.


                                                                                                                                                                     2170.dat                                                                                            0000600 0004000 0002000 00000000363 13066020365 0014246 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	10	Описание	{../img/items/cat2/1_2.jpg}	4500	\N	SALE	Future 10 2014 super
4	8	Описание	{../img/items/cat2/1_2.jpg}	4999	\N	SALE	Supper 10 2016 hot sale
1	8	sdasdasd	{../img/items/cat1/1_1.jpg}	12232	\N	none	FFshhqk 24 5
\.


                                                                                                                                                                                                                                                                             2167.dat                                                                                            0000600 0004000 0002000 00000000005 13066020365 0014245 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2162.dat                                                                                            0000600 0004000 0002000 00000010075 13066020365 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        7	Олег Всемогущий	adminsite	$2y$10$raZ.ffpsBcz.hxfAKAsfM.OA.XEViDrmjWe1ZwK3w5B0tzvQOECmm	\N	\N	\N	\N	\N
1	qwe	qwe	$2y$10$YQyf1A8wBZD5LRUIRc3Lf.rCs9byJO2x8OBSSa62UzywvnwO7EGpS	Vdjhsdv	KDfysbwh	234f	34	+7(234) 234-2342
9	Петров Федор	petrov@mail.com	$2y$10$6Xpczj5mfd.nlurkQgYahuDGsDpg.SyslaoMe5BBT2cerZG4iOgWe	Москва	Мира	12	32	+7(234) 234-2342
41	Иванов Сергей	ivanov@mail.com	$2y$10$R9WPCbAWfYWFSNTcqjj7geWIdjNcz62pXRGV/dVp8PyKzf5ikg7g6	Москва	Победы	12а	17	+7(912) 234-2342
42	Козлов Михаил	kozlov@mail.com	$2y$10$R9WPCbAWfYWFSNTcqjj7geWIdjNcz62pXRGV/dVp8PyKzf5ikg7g6	Москва	ул. Пушкина	77	22	+7(919) 555-3355
43	Пушкин Александр	pushkin@mail.com	$2y$10$R9WPCbAWfYWFSNTcqjj7geWIdjNcz62pXRGV/dVp8PyKzf5ikg7g6	Санкт-Петербург	ул. Московская	33в	17	+7(900) 123-2342
45	Копытов Федор	kopytov@mail.com	$2y$10$R9WPCbAWfYWFSNTcqjj7geWIdjNcz62pXRGV/dVp8PyKzf5ikg7g6	Казань	Мира	12	32	+7(919) 900-1212
46	Кротов Василий	krotov@mail.com	$2y$10$R9WPCbAWfYWFSNTcqjj7geWIdjNcz62pXRGV/dVp8PyKzf5ikg7g6	Челяинск	Металлургов	78	253	+7(922) 333-1478
47	Ворошилов Григорий	voroshilov@mail.com	$2y$10$R9WPCbAWfYWFSNTcqjj7geWIdjNcz62pXRGV/dVp8PyKzf5ikg7g6	Чистопрудный	Плоская	3	1	+7(911) 114-2121
48	Горький Леденец	gorky@mail.com	$2y$10$R9WPCbAWfYWFSNTcqjj7geWIdjNcz62pXRGV/dVp8PyKzf5ikg7g6	Санкт-Петербург	Грина	12	32	+7(812) 332-2342
49	Шаляпин Николай	shalyapin@mail.com	$2y$10$R9WPCbAWfYWFSNTcqjj7geWIdjNcz62pXRGV/dVp8PyKzf5ikg7g6	Москва	Пушкина	365	321	+7(953) 234-2342
50	Мохов Тимофей	mohov@mail.com	$2y$10$R9WPCbAWfYWFSNTcqjj7geWIdjNcz62pXRGV/dVp8PyKzf5ikg7g6	Сочи	Автомобилистов	100	110	+7(912) 666-4455
51	Утюгов Олег	utyugov.oleg@mail.com	$2y$10$R9WPCbAWfYWFSNTcqjj7geWIdjNcz62pXRGV/dVp8PyKzf5ikg7g6	Москва	проспект Ломоносова	33	74	+7(953) 953-9393
53	Гусин Михаил	gusin@mail.com	$2y$10$KFuv.rhRYjKpdg7iUxMqye5t01rff2RMaPM9/XmRnQ8mFA0P/MwV6	Москва	ул. Пушкина	77	22	+7(919) 555-3355
54	Тютчев Александр	ryutchev@mail.com	$2y$10$KFuv.rhRYjKpdg7iUxMqye5t01rff2RMaPM9/XmRnQ8mFA0P/MwV6	Санкт-Петербург	ул. Московская	33в	17	+7(900) 123-2342
56	Рогов Федор	rogov@mail.com	$2y$10$KFuv.rhRYjKpdg7iUxMqye5t01rff2RMaPM9/XmRnQ8mFA0P/MwV6	Казань	Мира	12	32	+7(919) 900-1212
57	Хомяков Василий	hom.vas@mail.com	$2y$10$KFuv.rhRYjKpdg7iUxMqye5t01rff2RMaPM9/XmRnQ8mFA0P/MwV6	Челяинск	Металлургов	78	253	+7(922) 333-1478
58	Стрелков Григорий	strelkov@mail.com	$2y$10$KFuv.rhRYjKpdg7iUxMqye5t01rff2RMaPM9/XmRnQ8mFA0P/MwV6	Чистопрудный	Плоская	3	1	+7(911) 114-2121
59	Сладкий Пирожок	sladkiq@mail.com	$2y$10$KFuv.rhRYjKpdg7iUxMqye5t01rff2RMaPM9/XmRnQ8mFA0P/MwV6	Санкт-Петербург	Грина	12	32	+7(812) 332-2342
60	Глинка Николай	ginka@mail.com	$2y$10$KFuv.rhRYjKpdg7iUxMqye5t01rff2RMaPM9/XmRnQ8mFA0P/MwV6	Москва	Пушкина	365	321	+7(953) 234-2342
61	Тохов Тимофей	tohov@mail.com	$2y$10$KFuv.rhRYjKpdg7iUxMqye5t01rff2RMaPM9/XmRnQ8mFA0P/MwV6	Сочи	Автомобилистов	100	110	+7(912) 666-4455
62	Лампов Олег	lampov.oleg@mail.com	$2y$10$KFuv.rhRYjKpdg7iUxMqye5t01rff2RMaPM9/XmRnQ8mFA0P/MwV6	Москва	проспект Ломоносова	33	74	+7(953) 953-9393
52	Носорогов Сергей	nosorogov@mail.com	$2y$10$KFuv.rhRYjKpdg7iUxMqye5t01rff2RMaPM9/XmRnQ8mFA0P/MwV6	Москва	Победы	12а	\N	+7(912) 234-2342
55	Ротов Николай Олегович	rotov@mail.com	$2y$10$KFuv.rhRYjKpdg7iUxMqye5t01rff2RMaPM9/XmRnQ8mFA0P/MwV6	Казань	Набережная	130	32	+7(922) 234-1111
44	Носов Николай Олегович	nosov@mail.com	$2y$10$R9WPCbAWfYWFSNTcqjj7geWIdjNcz62pXRGV/dVp8PyKzf5ikg7g6	Казань	Набережная	130	32	+7(922) 234-1111
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                   restore.sql                                                                                         0000600 0004000 0002000 00000021037 13066020365 0015370 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.goods DROP CONSTRAINT "fk-good-cat";
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.goods DROP CONSTRAINT goods_pkey;
ALTER TABLE ONLY public.cats DROP CONSTRAINT cats_pkey;
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.sold_goods ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.cats ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.cart ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.sold_goods_id_seq;
DROP TABLE public.sold_goods;
DROP SEQUENCE public.names_id_seq;
DROP TABLE public.users;
DROP TABLE public.goods;
DROP SEQUENCE public.goods_id_seq;
DROP SEQUENCE public.cats_id_seq;
DROP TABLE public.cats;
DROP SEQUENCE public.cart_id_seq;
DROP TABLE public.cart;
DROP TYPE public.badge;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: badge; Type: TYPE; Schema: public; Owner: osamylov
--

CREATE TYPE badge AS ENUM (
    'none',
    'NEW',
    'HOT',
    'SALE'
);


ALTER TYPE badge OWNER TO osamylov;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cart; Type: TABLE; Schema: public; Owner: osamylov
--

CREATE TABLE cart (
    id integer NOT NULL,
    id_user integer,
    id_good integer[],
    number integer[],
    delivery integer,
    city text,
    street text,
    house text,
    app integer,
    comment text
);


ALTER TABLE cart OWNER TO osamylov;

--
-- Name: cart_id_seq; Type: SEQUENCE; Schema: public; Owner: osamylov
--

CREATE SEQUENCE cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cart_id_seq OWNER TO osamylov;

--
-- Name: cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: osamylov
--

ALTER SEQUENCE cart_id_seq OWNED BY cart.id;


--
-- Name: cats; Type: TABLE; Schema: public; Owner: osamylov
--

CREATE TABLE cats (
    id integer NOT NULL,
    name text NOT NULL,
    descript text
);


ALTER TABLE cats OWNER TO osamylov;

--
-- Name: cats_id_seq; Type: SEQUENCE; Schema: public; Owner: osamylov
--

CREATE SEQUENCE cats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cats_id_seq OWNER TO osamylov;

--
-- Name: cats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: osamylov
--

ALTER SEQUENCE cats_id_seq OWNED BY cats.id;


--
-- Name: goods_id_seq; Type: SEQUENCE; Schema: public; Owner: osamylov
--

CREATE SEQUENCE goods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE goods_id_seq OWNER TO osamylov;

--
-- Name: goods; Type: TABLE; Schema: public; Owner: osamylov
--

CREATE TABLE goods (
    id integer DEFAULT nextval('goods_id_seq'::regclass) NOT NULL,
    id_cat integer NOT NULL,
    descript text,
    url_img text[],
    price integer NOT NULL,
    variant text[],
    badge badge DEFAULT 'none'::badge,
    name text NOT NULL
);


ALTER TABLE goods OWNER TO osamylov;

--
-- Name: users; Type: TABLE; Schema: public; Owner: osamylov
--

CREATE TABLE users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    pass text,
    address_city text,
    address_street text,
    address_house text,
    address_app integer,
    phone text
);


ALTER TABLE users OWNER TO osamylov;

--
-- Name: names_id_seq; Type: SEQUENCE; Schema: public; Owner: osamylov
--

CREATE SEQUENCE names_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE names_id_seq OWNER TO osamylov;

--
-- Name: names_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: osamylov
--

ALTER SEQUENCE names_id_seq OWNED BY users.id;


--
-- Name: sold_goods; Type: TABLE; Schema: public; Owner: osamylov
--

CREATE TABLE sold_goods (
    id integer NOT NULL,
    id_order integer,
    id_good integer,
    number integer
);


ALTER TABLE sold_goods OWNER TO osamylov;

--
-- Name: sold_goods_id_seq; Type: SEQUENCE; Schema: public; Owner: osamylov
--

CREATE SEQUENCE sold_goods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sold_goods_id_seq OWNER TO osamylov;

--
-- Name: sold_goods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: osamylov
--

ALTER SEQUENCE sold_goods_id_seq OWNED BY sold_goods.id;


--
-- Name: cart id; Type: DEFAULT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY cart ALTER COLUMN id SET DEFAULT nextval('cart_id_seq'::regclass);


--
-- Name: cats id; Type: DEFAULT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY cats ALTER COLUMN id SET DEFAULT nextval('cats_id_seq'::regclass);


--
-- Name: sold_goods id; Type: DEFAULT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY sold_goods ALTER COLUMN id SET DEFAULT nextval('sold_goods_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('names_id_seq'::regclass);


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: osamylov
--

COPY cart (id, id_user, id_good, number, delivery, city, street, house, app, comment) FROM stdin;
\.
COPY cart (id, id_user, id_good, number, delivery, city, street, house, app, comment) FROM '$$PATH$$/2165.dat';

--
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: osamylov
--

SELECT pg_catalog.setval('cart_id_seq', 1, false);


--
-- Data for Name: cats; Type: TABLE DATA; Schema: public; Owner: osamylov
--

COPY cats (id, name, descript) FROM stdin;
\.
COPY cats (id, name, descript) FROM '$$PATH$$/2169.dat';

--
-- Name: cats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: osamylov
--

SELECT pg_catalog.setval('cats_id_seq', 22, true);


--
-- Data for Name: goods; Type: TABLE DATA; Schema: public; Owner: osamylov
--

COPY goods (id, id_cat, descript, url_img, price, variant, badge, name) FROM stdin;
\.
COPY goods (id, id_cat, descript, url_img, price, variant, badge, name) FROM '$$PATH$$/2170.dat';

--
-- Name: goods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: osamylov
--

SELECT pg_catalog.setval('goods_id_seq', 4, true);


--
-- Name: names_id_seq; Type: SEQUENCE SET; Schema: public; Owner: osamylov
--

SELECT pg_catalog.setval('names_id_seq', 62, true);


--
-- Data for Name: sold_goods; Type: TABLE DATA; Schema: public; Owner: osamylov
--

COPY sold_goods (id, id_order, id_good, number) FROM stdin;
\.
COPY sold_goods (id, id_order, id_good, number) FROM '$$PATH$$/2167.dat';

--
-- Name: sold_goods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: osamylov
--

SELECT pg_catalog.setval('sold_goods_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: osamylov
--

COPY users (id, name, email, pass, address_city, address_street, address_house, address_app, phone) FROM stdin;
\.
COPY users (id, name, email, pass, address_city, address_street, address_house, address_app, phone) FROM '$$PATH$$/2162.dat';

--
-- Name: cats cats_pkey; Type: CONSTRAINT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY cats
    ADD CONSTRAINT cats_pkey PRIMARY KEY (id);


--
-- Name: goods goods_pkey; Type: CONSTRAINT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY goods
    ADD CONSTRAINT goods_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (email);


--
-- Name: goods fk-good-cat; Type: FK CONSTRAINT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY goods
    ADD CONSTRAINT "fk-good-cat" FOREIGN KEY (id_cat) REFERENCES cats(id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 