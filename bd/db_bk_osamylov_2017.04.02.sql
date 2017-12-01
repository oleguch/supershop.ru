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
    price integer NOT NULL,
    variant text[],
    badge badge DEFAULT 'none'::badge,
    name text NOT NULL
);


ALTER TABLE goods OWNER TO osamylov;

--
-- Name: images; Type: TABLE; Schema: public; Owner: osamylov
--

CREATE TABLE images (
    id integer NOT NULL,
    id_good integer NOT NULL,
    img_path text NOT NULL
);


ALTER TABLE images OWNER TO osamylov;

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: osamylov
--

CREATE SEQUENCE images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE images_id_seq OWNER TO osamylov;

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: osamylov
--

ALTER SEQUENCE images_id_seq OWNED BY images.id;


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
-- Name: var_good; Type: TABLE; Schema: public; Owner: osamylov
--

CREATE TABLE var_good (
    id integer NOT NULL,
    id_good integer NOT NULL,
    variant text
);


ALTER TABLE var_good OWNER TO osamylov;

--
-- Name: var_good_id_seq; Type: SEQUENCE; Schema: public; Owner: osamylov
--

CREATE SEQUENCE var_good_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE var_good_id_seq OWNER TO osamylov;

--
-- Name: var_good_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: osamylov
--

ALTER SEQUENCE var_good_id_seq OWNED BY var_good.id;


--
-- Name: cart id; Type: DEFAULT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY cart ALTER COLUMN id SET DEFAULT nextval('cart_id_seq'::regclass);


--
-- Name: cats id; Type: DEFAULT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY cats ALTER COLUMN id SET DEFAULT nextval('cats_id_seq'::regclass);


--
-- Name: images id; Type: DEFAULT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY images ALTER COLUMN id SET DEFAULT nextval('images_id_seq'::regclass);


--
-- Name: sold_goods id; Type: DEFAULT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY sold_goods ALTER COLUMN id SET DEFAULT nextval('sold_goods_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('names_id_seq'::regclass);


--
-- Name: var_good id; Type: DEFAULT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY var_good ALTER COLUMN id SET DEFAULT nextval('var_good_id_seq'::regclass);


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: osamylov
--

COPY cart (id, id_user, id_good, number, delivery, city, street, house, app, comment) FROM stdin;
\.


--
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: osamylov
--

SELECT pg_catalog.setval('cart_id_seq', 1, false);


--
-- Data for Name: cats; Type: TABLE DATA; Schema: public; Owner: osamylov
--

COPY cats (id, name, descript) FROM stdin;
11	Сноуборды	Сноуборд, Сноубординг (англ. Snowboarding от англ. snow — снег и англ. board — доска) — зимний олимпийский вид спорта, заключающийся в спуске с заснеженных склонов и гор на специальном снаряде — сноуборде. Изначально зимний вид спорта, хотя отдельные экстремалы освоили его даже летом, катаясь на сноуборде на песчаных склонах (сэндбординг).
7	Вейкборд	Вейкбординг или вейкборд — экстремальный вид спорта, сочетающий в себе элементы воднолыжного слалома, акробатику и прыжки. Представляет собой комбинацию водных лыж, сноуборда, скейта и сёрфинга.
9	Роликовые коньки	Роликовые коньки — Обьект с прикреплёнными к ним рамами, в которых закреплено от двух до пяти (и даже шести) колёс, предназначенные для передвижения по твёрдой ровной поверхности, реже по бездорожью, аналогично передвижению по льду на традиционных коньках
12	Тенисные ракетки	Ракетка — спортивный инвентарь, используемый в игровых видах спорта: теннисе (теннисная ракетка), сквоше, бадминтоне, настольном теннисе и некоторых других менее популярных играх, например, ракетболе
10	Самокаты	Самокат наземное средство передвижения, в основном двухколёсное, приводимое в действие путём многократного отталкивания ногой от земли в положении стоя, и управляемое при помощи руля
8	Двухколесные скейты	Не так давно у любителей экстремальных видов спорта появился новый снаряд – это двухколесный скейт. Он имеет несколько названий - Роллерсёрф, Рипстик, Вэйвборд. Чем отличается это новый скейт от своих предшественников ясно уже из его названия – он имеет только два колеса, а не две пары из двух колес, как на обычном скейте.
\.


--
-- Name: cats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: osamylov
--

SELECT pg_catalog.setval('cats_id_seq', 23, true);


--
-- Data for Name: goods; Type: TABLE DATA; Schema: public; Owner: osamylov
--

COPY goods (id, id_cat, descript, price, variant, badge, name) FROM stdin;
23	7	60-градусная конструкция ABS боковин позволяет обеспечить защиту от ударов, а полностью спеченный скользяк Enduro предлагает нашу самую прочную рабочую поверхность на сегодняшний день. Форма вейкборда Union создана на непрерывном рокере, который обеспечивает отличный «щелчок» и быстрый набор скорости на волну. Особенность тонкой базы позволяет этой серии создать хваткие канты и при этом отличный контакт на перилах. 	28000	\N	none	Вейкборд Hyperlite Union ss14
24	7	Это доска идеально подходит для той девушки,  которая не стоит на месте, а постоянно прогресирует. 3-х ступенчатый гибридный рокер Jett увеличил популярность ollie, ведь с этим рокером его делать действительно гораздо проще. Эта доска была построена для успеха.\r\nЭксклюзивный скользяк LF GRIND BASE - Скользяк доски усилен супер-прочным пластиком LF Grind, предотвращающим ускоренный износ доски при катании по рейлам и в парке	13770	\N	none	Вейкборд Liquid force Jett Grind 2014
19	7	Доска, сделанная специально для девушек, которые учатся и прогрессируют в вейкборде. Fury Grind это комфортная и прощающая ошибки доска, которая при этом сохраняет испытанные качества для развития навыков вейкбординга.\r\n3х ступенчатый рокер. Агрессивный\r\nDouble Concave with Edge Channels - Двойной конкейв с каналами\r\nLifted Variable Edge Rail - Более плавный центр ( закругленный ) для прощения ошибок\r\nShort Based Molded In Fins - Более мягкий и подходящий для самого молодого поколения\r\nЭксклюзивная граиндовая база LF	11120	\N	none	Вейкборд Dream Grind 2014
20	7	Это доска идеально подходит для той девушки, которая не стоит на месте, а постоянно прогресирует. 3-уровневый гибридный рокер Jett увеличил популярность ollie, ведь с этим рокером его делать действительно гораздо проще. Эта доска была построена для успеха.	15840	\N	none	Вейкборд Liquid Force Jett Grind 2014
21	7	Если Вы прогрессируете и выходите за свои пределы, то и матчасть не должна отставать! В этом сезоне Shredtown стал немного шире, что дает Вам преимущество в парке, а увеличенная площадь поверхности лучше поглотит удар при высоких приземлениях. Также сердечник стал тоньше, что увеличило гибкость	18980	\N	none	Вейкборд Slingshot Shredtown 2013 (139 см)
22	7	ХИТ- самый универсальный и востребованный кайтовый серфборд!\r\nНовый в 2015 году Tyrant – это современная, отточенная доска для серфинга на каждый день. Новая круглая корма thumb и новый одинарный, переходящий в двойной конкейв обеспечивает доске стабильность с невероятными характеристиками в любой волне.	56900	\N	none	Кайт Серф борд Slingshot 2015 Tyrant
25	7		9795	\N	none	ВЕЙКБОРД ATTITUDE 139 С КРЕПЛЕНИЯМИ
26	7	Быстрый трехступенчатый рокер и флекс гибридной конструкции позволяют Вам достигать новых высот в катании! С этой доской вы найдете свой катер, или свой кабель еще быстрее.	12780	\N	none	ВЕЙКБОРД LIQUID FORCE DREAM GRIND
27	7	Гладкая и гибкая доска, созданная специально для катания в парке за лебедкой. Плавный рокер мягче скользит по воде, гибкий сердечник позволит выполнять самые сложные трюки. Утончения хвоста и носа вейка для прессов на парковых фигурах, а середина более широкая для уверенных приземлений с амплитудных флэт-прыжков. Четыре встроенных киля минимального размера придают стабильность при зарезке и на приземлении, и не мешают скольжению по фигурам.\r\nВейкборд JIVE CWB создан для уверенных в себе райдеров!\r\nJive 137 см рассчитан на вес райдера до ~73 кг.	14040	\N	none	ВЕЙКБОРД CWB JIVE 2013 (137 СМ)
28	7	Для создания этой промодели свои усилия объединили шейпер Tony Logosz и прорайдер команды Slingshot - Oli Derome. Их целью было создание универсальной прогрессивной формы, которая поможет раскрыть все Ваши таланты в любых стилях катания!	22940	\N	none	ВЕЙКБОРД SLINGSHOT OLI 2014
29	7	Response - вневременная форма, то с чего начался Sligshot! Это классика, легенда, одна из самых эффективных досок на сегодняшний день, за счет своей формы, непрерывного рокера и гибкости, позволяет райдеру затрачивать минимум усилий. Независимо от Вашего стиля Response обеспечит великолепную гибкость, способность зарезаться, отличный щелчок и безболезненные приземления!	21790	\N	none	ВЕЙКБОРД SLINGSHOT RESPONSE 2014
30	7	Новинка 2013 года! SLAB спроектирован, чтобы райдер смог получить максимальное удовольствие от рейлов! У доски деревянный сердечник, который обеспечивает жесткое катание, но быстрой и гибкий, отклик, чтобы катать по плоской воде с легкостью. Джиббинговый король- вот что можно сказать об этой доске !	19180	\N	none	ВЕЙКБОРД LIQUID FORCE SLAB 2013 (139)
31	7	Вейкборд, созданный для агрессивного катания по волнам. В 2013 ничто не сможет превзойти по-настоящему мощный щелчок Hooke. У этой модели такой же контур и линия рокера, как у доски Recoil. И присмотритесь к дизайну - оригинальная графика от Майка Эннена.\r\n\r\nЖесткость: 7\r\nОтдача: 9\r\n\r\nИдеально подходит для фанатов фрирайда, для тех, что шреддит в сноубордическом стиле и стремится к подвижности и скорости, и при этом бережет колени, предпочитая приземления без ударов по ногам.	19800	\N	none	ВЕЙКБОРД SLINGSHOT HOOKE 2013
32	7	Улучшенная версия чрезвычайно успешной про-модели 2014 года. Этот мягкий чувствительный вэйкборд не даст Вам никаких шансов оставить нетронутой ни одну фигуру в парке. Скользяк ES Base добавит контроля при скольжении, а средняя мягкость доски в области между креплений поможет удерживать высокую скорость и даст стабильности во время приземлений.	35950	\N	none	ВЕЙКБОРД SLINGSHOT WINDSOR 2015
33	7	Oli - идеальный кроссовер, который покажет себя отлично как в парке, так и во время езды за катером. Благодаря технологии Naca Tech этот вэйкборд показывает отличные скорости и невероятную стабильность, а Fusion Sidewall обеспечивает прочность и гашение вибрации за счет вплавленных в сердечник боковых стенок, выполненных из высокопрочного пластика.	35950	\N	none	ВЕЙКБОРД SLINGSHOT OLI 2015
34	7	Уникальная модель для катания на лебедке и за катером. Paradigm Obrien объединяет в себе два стиля за счет продвинутого дизайна. Суперлёгкая полиуретановая пена и генетически созданные прочные деревянные стержни по всей длине дарят доске прочную и гибкую платформу. Рифленый профиль контролирует ее поведение на воде. Жёсткий в средней части вейк с эластичными прыгучими концами, который карвит и вылетает с волны с невероятной энергией и скоростью!	25520	\N	none	ВЕЙКБОРД OBRIEN PARADIGM 2014
35	7	Слово «жемчужина» стало метафорой для чего-то очень редкого, изящного, очаровательного и ценного. Плавный щелчок, хорошая гибкость и мягкие, как подушка, приземления – все это даст вам вейкборд Pearl, который объединяет в себе такие инновационные характеристики, как сердечник Atomic Core, боковые стенки SingleShot™ Fusion и систему закладных Fastrack™. Что еще может хотеть женщина?	17820	\N	none	ВЕЙКБОРД SLINGSHOT PEARL 2013
16	7	Трехступенчатый гибридный рокер\r\nWinged Rail Shape - Максимальный контроль от ботинок к самой доске.\r\nЭксклюзивное граиндовое покрытие LF\r\nMolded in Deep, Canted Long Based Side Fins - Низкий профиль доски дает очень позитивную управляемость	10880	\N	none	Вейкборд Wake park pro
17	7	Ограниченная серия вейкбордов Liquid Force c флюоресцентной расцветкой. Но яркие цвета - не единственное преимущество этой доски: трёхступенчатый рокер обеспечит отличный щелчок на вершине волны, в то время как тройной конкейв мягко поддержит во время приводнения.\r\nУровень катания: от среднего до продвинутого\r\nУсиленное покрытие из стекловолокна\r\nТройной конкейв (triple concave)\r\nАгрессивный трёхступенчатый рокер \r\nБоковые стенки обеспечивают высочайшую прочность доски при парковом катании и уверенное, плавное скольжение по рейлам	16730	\N	none	Вейкборд Harley LTD 2014
18	7	Liquid Force B.O.B. - представляем вам следующее поколение модели PRO. Новая форма доски собрала в себе массу новых технологий, эти инновационные особенности делают доску буквально живой! Одна поездка на B.O.B. и вы почувствуете разницу. Если вы, как  BOB Soven, и вы ждали, доску нового уровня, не похожую не на что другое, ваше ожидание официально закончилось!\r\n \r\n5-ступенчатый рокер даст вам то- что 3 ступенчатый не сможет дать, а именно, благодаря "своей плавности" и наличия дополнительных линий преломления, "эффект торможения" попросту отсутствует при вылетах на этом вейкборде!\r\nБоковые стенки  LF LIQUID RAIL  сделаны из эластомера – специального пластика, обеспечивающего высочайшую прочность доски при парковом катании и уверенное, плавное скольжение по рейлам!\r\nРезьба М6. Обеспечивает более жесткую, более надежную фиксацию креплений.\r\nОбработанные на станке с ЧПУ тройные деревянные стрингеры обеспечивают непревзойденную прочность и прогнозируемый флекс, в то время как полиуретан обеспечивает сердечнику минимальный вес.	20540	\N	none	Вейкборд B.O.B. 2013
\.


--
-- Name: goods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: osamylov
--

SELECT pg_catalog.setval('goods_id_seq', 35, true);


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: osamylov
--

COPY images (id, id_good, img_path) FROM stdin;
66	16	img/items/cat_7/16_1.jpg
67	16	img/items/cat_7/16_2.jpg
70	18	img/items/cat_7/18_1.jpg
71	19	img/items/cat_7/19_1.jpg
72	20	img/items/cat_7/20_1.jpg
73	21	img/items/cat_7/21_1.jpg
74	22	img/items/cat_7/22_1.jpg
75	23	img/items/cat_7/23_1.jpg
76	24	img/items/cat_7/24_1.jpg
77	25	img/items/cat_7/25_1.jpg
78	26	img/items/cat_7/26_1.jpg
79	27	img/items/cat_7/27_1.jpg
80	28	img/items/cat_7/28_1.jpg
81	29	img/items/cat_7/29_1.jpg
82	30	img/items/cat_7/30_1.jpg
83	31	img/items/cat_7/31_1.jpg
84	32	img/items/cat_7/32_1.jpg
85	33	img/items/cat_7/33_1.jpg
86	34	img/items/cat_7/34_1.jpg
87	35	img/items/cat_7/35_1.jpg
166	17	img/items/cat_7/17_4227.jpg
176	16	img/items/cat_7/16_8704.jpg
180	17	img/items/cat_7/17_17384.jpg
182	17	img/items/cat_7/17_166.jpg
\.


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: osamylov
--

SELECT pg_catalog.setval('images_id_seq', 182, true);


--
-- Name: names_id_seq; Type: SEQUENCE SET; Schema: public; Owner: osamylov
--

SELECT pg_catalog.setval('names_id_seq', 62, true);


--
-- Data for Name: sold_goods; Type: TABLE DATA; Schema: public; Owner: osamylov
--

COPY sold_goods (id, id_order, id_good, number) FROM stdin;
\.


--
-- Name: sold_goods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: osamylov
--

SELECT pg_catalog.setval('sold_goods_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: osamylov
--

COPY users (id, name, email, pass, address_city, address_street, address_house, address_app, phone) FROM stdin;
7	Олег Всемогущий	adminsite	$2y$10$raZ.ffpsBcz.hxfAKAsfM.OA.XEViDrmjWe1ZwK3w5B0tzvQOECmm	\N	\N	\N	\N	\N
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


--
-- Data for Name: var_good; Type: TABLE DATA; Schema: public; Owner: osamylov
--

COPY var_good (id, id_good, variant) FROM stdin;
8	16	синий
10	16	красный
11	16	желтый
20	17	fdg
21	17	dfge
22	17	dfgy
\.


--
-- Name: var_good_id_seq; Type: SEQUENCE SET; Schema: public; Owner: osamylov
--

SELECT pg_catalog.setval('var_good_id_seq', 22, true);


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
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (email);


--
-- Name: var_good var_good_pkey; Type: CONSTRAINT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY var_good
    ADD CONSTRAINT var_good_pkey PRIMARY KEY (id);


--
-- Name: goods fk-good-cat; Type: FK CONSTRAINT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY goods
    ADD CONSTRAINT "fk-good-cat" FOREIGN KEY (id_cat) REFERENCES cats(id);


--
-- Name: images id_good; Type: FK CONSTRAINT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY images
    ADD CONSTRAINT id_good FOREIGN KEY (id_good) REFERENCES goods(id) ON DELETE CASCADE;


--
-- Name: var_good id_good_var; Type: FK CONSTRAINT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY var_good
    ADD CONSTRAINT id_good_var FOREIGN KEY (id_good) REFERENCES goods(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

