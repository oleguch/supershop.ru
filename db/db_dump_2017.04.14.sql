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

ALTER TABLE ONLY public.sold_goods DROP CONSTRAINT "sold-var";
ALTER TABLE ONLY public.sold_goods DROP CONSTRAINT "sold-id_order";
ALTER TABLE ONLY public.sold_goods DROP CONSTRAINT "sold-id_good";
ALTER TABLE ONLY public.var_good DROP CONSTRAINT id_good_var;
ALTER TABLE ONLY public.images DROP CONSTRAINT id_good;
ALTER TABLE ONLY public.goods DROP CONSTRAINT "fk-good-cat";
ALTER TABLE ONLY public.orders DROP CONSTRAINT "delyvery-id_delivery";
ALTER TABLE ONLY public.var_good DROP CONSTRAINT var_good_pkey;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.user_access DROP CONSTRAINT user_access_pkey;
ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
ALTER TABLE ONLY public.images DROP CONSTRAINT images_pkey;
ALTER TABLE ONLY public.goods DROP CONSTRAINT goods_pkey;
ALTER TABLE ONLY public.delivery DROP CONSTRAINT delivery_pkey;
ALTER TABLE ONLY public.cats DROP CONSTRAINT cats_pkey;
ALTER TABLE public.var_good ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.user_access ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.sold_goods ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.images ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.delivery ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.cats ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.var_good_id_seq;
DROP TABLE public.var_good;
DROP SEQUENCE public.user_access_id_seq;
DROP TABLE public.user_access;
DROP SEQUENCE public.sold_goods_id_seq;
DROP TABLE public.sold_goods;
DROP SEQUENCE public.orders_id_seq;
DROP TABLE public.orders;
DROP SEQUENCE public.names_id_seq;
DROP TABLE public.users;
DROP SEQUENCE public.images_id_seq;
DROP TABLE public.images;
DROP TABLE public.goods;
DROP SEQUENCE public.goods_id_seq;
DROP SEQUENCE public.delivery_id_seq;
DROP TABLE public.delivery;
DROP SEQUENCE public.cats_id_seq;
DROP TABLE public.cats;
DROP TYPE public.status;
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

--
-- Name: status; Type: TYPE; Schema: public; Owner: osamylov
--

CREATE TYPE status AS ENUM (
    'Принят',
    'Доставлен',
    'У курьера',
    'Отгружен',
    'Отменен',
    'Корзина'
);


ALTER TYPE status OWNER TO osamylov;

SET default_tablespace = '';

SET default_with_oids = false;

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
-- Name: delivery; Type: TABLE; Schema: public; Owner: osamylov
--

CREATE TABLE delivery (
    id integer NOT NULL,
    text text
);


ALTER TABLE delivery OWNER TO osamylov;

--
-- Name: delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: osamylov
--

CREATE SEQUENCE delivery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE delivery_id_seq OWNER TO osamylov;

--
-- Name: delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: osamylov
--

ALTER SEQUENCE delivery_id_seq OWNED BY delivery.id;


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
    name text NOT NULL,
    price_wo_discount integer
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
-- Name: orders; Type: TABLE; Schema: public; Owner: osamylov
--

CREATE TABLE orders (
    id integer NOT NULL,
    email text,
    name text,
    phone text,
    comment text,
    city text,
    street text,
    house text,
    app integer,
    id_delivery integer,
    id_user integer,
    "time" timestamp with time zone,
    status status DEFAULT 'Принят'::status
);


ALTER TABLE orders OWNER TO osamylov;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: osamylov
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orders_id_seq OWNER TO osamylov;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: osamylov
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: sold_goods; Type: TABLE; Schema: public; Owner: osamylov
--

CREATE TABLE sold_goods (
    id integer NOT NULL,
    id_order integer NOT NULL,
    id_good integer NOT NULL,
    numbers integer DEFAULT 1 NOT NULL,
    id_variant integer
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
-- Name: user_access; Type: TABLE; Schema: public; Owner: osamylov
--

CREATE TABLE user_access (
    id integer NOT NULL,
    id_user integer NOT NULL,
    access_role text NOT NULL
);


ALTER TABLE user_access OWNER TO osamylov;

--
-- Name: user_access_id_seq; Type: SEQUENCE; Schema: public; Owner: osamylov
--

CREATE SEQUENCE user_access_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_access_id_seq OWNER TO osamylov;

--
-- Name: user_access_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: osamylov
--

ALTER SEQUENCE user_access_id_seq OWNED BY user_access.id;


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
-- Name: cats id; Type: DEFAULT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY cats ALTER COLUMN id SET DEFAULT nextval('cats_id_seq'::regclass);


--
-- Name: delivery id; Type: DEFAULT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY delivery ALTER COLUMN id SET DEFAULT nextval('delivery_id_seq'::regclass);


--
-- Name: images id; Type: DEFAULT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY images ALTER COLUMN id SET DEFAULT nextval('images_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: sold_goods id; Type: DEFAULT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY sold_goods ALTER COLUMN id SET DEFAULT nextval('sold_goods_id_seq'::regclass);


--
-- Name: user_access id; Type: DEFAULT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY user_access ALTER COLUMN id SET DEFAULT nextval('user_access_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('names_id_seq'::regclass);


--
-- Name: var_good id; Type: DEFAULT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY var_good ALTER COLUMN id SET DEFAULT nextval('var_good_id_seq'::regclass);


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

SELECT pg_catalog.setval('cats_id_seq', 31, true);


--
-- Data for Name: delivery; Type: TABLE DATA; Schema: public; Owner: osamylov
--

COPY delivery (id, text) FROM stdin;
1	Курьерская доставка <br> с оплатой при получении
2	Почта России <br> с наложенным платежом
3	Доставка через терминалы QIWI Post
\.


--
-- Name: delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: osamylov
--

SELECT pg_catalog.setval('delivery_id_seq', 3, true);


--
-- Data for Name: goods; Type: TABLE DATA; Schema: public; Owner: osamylov
--

COPY goods (id, id_cat, descript, url_img, price, variant, badge, name, price_wo_discount) FROM stdin;
23	7	60-градусная конструкция ABS боковин позволяет обеспечить защиту от ударов, а полностью спеченный скользяк Enduro предлагает нашу самую прочную рабочую поверхность на сегодняшний день. Форма вейкборда Union создана на непрерывном рокере, который обеспечивает отличный «щелчок» и быстрый набор скорости на волну. Особенность тонкой базы позволяет этой серии создать хваткие канты и при этом отличный контакт на перилах. 	\N	28000	\N	none	Вейкборд Hyperlite Union ss14	\N
24	7	Это доска идеально подходит для той девушки,  которая не стоит на месте, а постоянно прогресирует. 3-х ступенчатый гибридный рокер Jett увеличил популярность ollie, ведь с этим рокером его делать действительно гораздо проще. Эта доска была построена для успеха.\r\nЭксклюзивный скользяк LF GRIND BASE - Скользяк доски усилен супер-прочным пластиком LF Grind, предотвращающим ускоренный износ доски при катании по рейлам и в парке	\N	13770	\N	none	Вейкборд Liquid force Jett Grind 2014	\N
19	7	Доска, сделанная специально для девушек, которые учатся и прогрессируют в вейкборде. Fury Grind это комфортная и прощающая ошибки доска, которая при этом сохраняет испытанные качества для развития навыков вейкбординга.\r\n3х ступенчатый рокер. Агрессивный\r\nDouble Concave with Edge Channels - Двойной конкейв с каналами\r\nLifted Variable Edge Rail - Более плавный центр ( закругленный ) для прощения ошибок\r\nShort Based Molded In Fins - Более мягкий и подходящий для самого молодого поколения\r\nЭксклюзивная граиндовая база LF	\N	11120	\N	none	Вейкборд Dream Grind 2014	\N
20	7	Это доска идеально подходит для той девушки, которая не стоит на месте, а постоянно прогресирует. 3-уровневый гибридный рокер Jett увеличил популярность ollie, ведь с этим рокером его делать действительно гораздо проще. Эта доска была построена для успеха.	\N	15840	\N	none	Вейкборд Liquid Force Jett Grind 2014	\N
21	7	Если Вы прогрессируете и выходите за свои пределы, то и матчасть не должна отставать! В этом сезоне Shredtown стал немного шире, что дает Вам преимущество в парке, а увеличенная площадь поверхности лучше поглотит удар при высоких приземлениях. Также сердечник стал тоньше, что увеличило гибкость	\N	18980	\N	none	Вейкборд Slingshot Shredtown 2013 (139 см)	\N
22	7	ХИТ- самый универсальный и востребованный кайтовый серфборд!\r\nНовый в 2015 году Tyrant – это современная, отточенная доска для серфинга на каждый день. Новая круглая корма thumb и новый одинарный, переходящий в двойной конкейв обеспечивает доске стабильность с невероятными характеристиками в любой волне.	\N	56900	\N	none	Кайт Серф борд Slingshot 2015 Tyrant	\N
25	7		\N	9795	\N	none	ВЕЙКБОРД ATTITUDE 139 С КРЕПЛЕНИЯМИ	\N
26	7	Быстрый трехступенчатый рокер и флекс гибридной конструкции позволяют Вам достигать новых высот в катании! С этой доской вы найдете свой катер, или свой кабель еще быстрее.	\N	12780	\N	none	ВЕЙКБОРД LIQUID FORCE DREAM GRIND	\N
27	7	Гладкая и гибкая доска, созданная специально для катания в парке за лебедкой. Плавный рокер мягче скользит по воде, гибкий сердечник позволит выполнять самые сложные трюки. Утончения хвоста и носа вейка для прессов на парковых фигурах, а середина более широкая для уверенных приземлений с амплитудных флэт-прыжков. Четыре встроенных киля минимального размера придают стабильность при зарезке и на приземлении, и не мешают скольжению по фигурам.\r\nВейкборд JIVE CWB создан для уверенных в себе райдеров!\r\nJive 137 см рассчитан на вес райдера до ~73 кг.	\N	14040	\N	none	ВЕЙКБОРД CWB JIVE 2013 (137 СМ)	\N
28	7	Для создания этой промодели свои усилия объединили шейпер Tony Logosz и прорайдер команды Slingshot - Oli Derome. Их целью было создание универсальной прогрессивной формы, которая поможет раскрыть все Ваши таланты в любых стилях катания!	\N	22940	\N	none	ВЕЙКБОРД SLINGSHOT OLI 2014	\N
29	7	Response - вневременная форма, то с чего начался Sligshot! Это классика, легенда, одна из самых эффективных досок на сегодняшний день, за счет своей формы, непрерывного рокера и гибкости, позволяет райдеру затрачивать минимум усилий. Независимо от Вашего стиля Response обеспечит великолепную гибкость, способность зарезаться, отличный щелчок и безболезненные приземления!	\N	21790	\N	none	ВЕЙКБОРД SLINGSHOT RESPONSE 2014	\N
132	12	женская\r\nв чехле\r\nвес 290 - 300 грамм\r\nплощадь струнной поверхности – 660 см2\r\nбаланс – 315 мм\r\nдлина -660 мм\r\nс натянутыми струнами\r\nСостав: титан	\N	340	\N	SALE	Ronin Ракетка для большого тенниса Lady G033A	\N
30	7	Новинка 2013 года! SLAB спроектирован, чтобы райдер смог получить максимальное удовольствие от рейлов! У доски деревянный сердечник, который обеспечивает жесткое катание, но быстрой и гибкий, отклик, чтобы катать по плоской воде с легкостью. Джиббинговый король- вот что можно сказать об этой доске !	\N	19180	\N	none	ВЕЙКБОРД LIQUID FORCE SLAB 2013 (139)	\N
31	7	Вейкборд, созданный для агрессивного катания по волнам. В 2013 ничто не сможет превзойти по-настоящему мощный щелчок Hooke. У этой модели такой же контур и линия рокера, как у доски Recoil. И присмотритесь к дизайну - оригинальная графика от Майка Эннена.\r\n\r\nЖесткость: 7\r\nОтдача: 9\r\n\r\nИдеально подходит для фанатов фрирайда, для тех, что шреддит в сноубордическом стиле и стремится к подвижности и скорости, и при этом бережет колени, предпочитая приземления без ударов по ногам.	\N	19800	\N	none	ВЕЙКБОРД SLINGSHOT HOOKE 2013	\N
32	7	Улучшенная версия чрезвычайно успешной про-модели 2014 года. Этот мягкий чувствительный вэйкборд не даст Вам никаких шансов оставить нетронутой ни одну фигуру в парке. Скользяк ES Base добавит контроля при скольжении, а средняя мягкость доски в области между креплений поможет удерживать высокую скорость и даст стабильности во время приземлений.	\N	35950	\N	none	ВЕЙКБОРД SLINGSHOT WINDSOR 2015	\N
33	7	Oli - идеальный кроссовер, который покажет себя отлично как в парке, так и во время езды за катером. Благодаря технологии Naca Tech этот вэйкборд показывает отличные скорости и невероятную стабильность, а Fusion Sidewall обеспечивает прочность и гашение вибрации за счет вплавленных в сердечник боковых стенок, выполненных из высокопрочного пластика.	\N	35950	\N	none	ВЕЙКБОРД SLINGSHOT OLI 2015	\N
34	7	Уникальная модель для катания на лебедке и за катером. Paradigm Obrien объединяет в себе два стиля за счет продвинутого дизайна. Суперлёгкая полиуретановая пена и генетически созданные прочные деревянные стержни по всей длине дарят доске прочную и гибкую платформу. Рифленый профиль контролирует ее поведение на воде. Жёсткий в средней части вейк с эластичными прыгучими концами, который карвит и вылетает с волны с невероятной энергией и скоростью!	\N	25520	\N	none	ВЕЙКБОРД OBRIEN PARADIGM 2014	\N
35	7	Слово «жемчужина» стало метафорой для чего-то очень редкого, изящного, очаровательного и ценного. Плавный щелчок, хорошая гибкость и мягкие, как подушка, приземления – все это даст вам вейкборд Pearl, который объединяет в себе такие инновационные характеристики, как сердечник Atomic Core, боковые стенки SingleShot™ Fusion и систему закладных Fastrack™. Что еще может хотеть женщина?	\N	17820	\N	none	ВЕЙКБОРД SLINGSHOT PEARL 2013	\N
17	7	Ограниченная серия вейкбордов Liquid Force c флюоресцентной расцветкой. Но яркие цвета - не единственное преимущество этой доски: трёхступенчатый рокер обеспечит отличный щелчок на вершине волны, в то время как тройной конкейв мягко поддержит во время приводнения.\r\nУровень катания: от среднего до продвинутого\r\nУсиленное покрытие из стекловолокна\r\nТройной конкейв (triple concave)\r\nАгрессивный трёхступенчатый рокер \r\nБоковые стенки обеспечивают высочайшую прочность доски при парковом катании и уверенное, плавное скольжение по рейлам	\N	16730	\N	none	Вейкборд Harley LTD 2014	\N
18	7	Liquid Force B.O.B. - представляем вам следующее поколение модели PRO. Новая форма доски собрала в себе массу новых технологий, эти инновационные особенности делают доску буквально живой! Одна поездка на B.O.B. и вы почувствуете разницу. Если вы, как  BOB Soven, и вы ждали, доску нового уровня, не похожую не на что другое, ваше ожидание официально закончилось!\r\n \r\n5-ступенчатый рокер даст вам то- что 3 ступенчатый не сможет дать, а именно, благодаря "своей плавности" и наличия дополнительных линий преломления, "эффект торможения" попросту отсутствует при вылетах на этом вейкборде!\r\nБоковые стенки  LF LIQUID RAIL  сделаны из эластомера – специального пластика, обеспечивающего высочайшую прочность доски при парковом катании и уверенное, плавное скольжение по рейлам!\r\nРезьба М6. Обеспечивает более жесткую, более надежную фиксацию креплений.\r\nОбработанные на станке с ЧПУ тройные деревянные стрингеры обеспечивают непревзойденную прочность и прогнозируемый флекс, в то время как полиуретан обеспечивает сердечнику минимальный вес.	\N	20540	\N	none	Вейкборд B.O.B. 2013	\N
16	7	Трехступенчатый гибридный рокер\r\nWinged Rail Shape - Максимальный контроль от ботинок к самой доске.\r\nЭксклюзивное граиндовое покрытие LF\r\nMolded in Deep, Canted Long Based Side Fins - Низкий профиль доски дает очень позитивную управляемость	\N	10880	\N	none	Вейкборд Wake park pro	\N
36	8	Двухколесный скейт Dragon Board surf Junior – это стильный и надежный скейтборд. Модель Junior имеет слегка укороченную базу и меньший вес. Вы можете подарить его своему малышу в 5-6 лет и быть уверены, что он получит массу незабываемых впечатлений Скейт подарит множество незабываемых и экстремальных впечатлений. Прочный корпус прослужит долго, выдержит самые тяжелые удары. Максимальная нагрузка скейтборда составляет 70 кг. Ваш малыш будет рад новому необычному развлечению.	\N	2390	\N	none	Роллерсерф Dragon Board Surf Junior	\N
37	8	Двухколесный скейт Dragon Board Spiderman – это новая современная модель скейтборда. Скейт изготовлен из прочного ABS пластика, который выдержит самые сильные удары. Модель оснащена надежными колесами. Корпус украшен рисунками в стиле любимого всеми супер героя – Человека-паука. Подарите своему ребенку экстремальные впечатления, купив ему двухколесный скейт Dragon Board Spiderman.	\N	2590	\N	none	Роллерсерф Dragon Board Spiderman	\N
39	8	Двухколесный скейт Dragon Board «Batman» черного цвета - это идеальная модель для любителей экстремальных ощущений. Им легко можно научится управлять. Пластиковый корпус роллерсерфа отличается высокой прочностью и удароустойчивостью, он прослужит достаточно долго. Колеса отличаются повышенной надежностью.	\N	2590	\N	none	Роллерсерф Dragon Board Batman	\N
40	8	Двухколесный скейт Dragon Board surf отличается прекрасной управляемостью и высоким уровнем маневренности. Юный любитель экстрима быстро научится управлять им. Прочный пластиковый корпус не деформируется от множества ударов и больших нагрузок.	\N	2790	\N	none	Роллерсерф Dragon Board Surf	\N
45	8		\N	5300	\N	none	Rollersurfer Switch Pro Mantaray	\N
41	8	Рекомендуем купить двухколесный скейт Powersurfer RT169 тем, кто любит экстремальные развлечения. В нашем интернет-магазине вы сможете приобрести его по максимально выгодной цене. Модель Powersurfer RT169 обладает прочной конструкций в сочетании с мягкостью и плавностью хода. Она изготовлена из противоударного пластика, поэтому не боится ударов и падений.	\N	1490	\N	none	Роллерсерф JDBug Powersurfer RT169	\N
42	8		\N	3500	\N	none	Rollersurfer Classic 08-09	\N
43	8	Роллерсёрф классик, модель 2014 года. 	\N	3500	\N	none	РОЛЛЕРСЕРФ СИНИЙ ROLLERSURFER CLASSIC 2014	\N
44	8	Роллерсерф Rocket Board. \r\nВес роллерсерфа 3,3 кг.\r\nКастор из алюминиевого сплава.\r\nПодшипники ABEC7.\r\nСумка в комплекте.\r\nУкомплектован ключами для смены колес и разборки торсионной пружины	\N	4490	\N	none	РОЛЛЕРСЕРФ (ROLLERSURFER) ROCKET BOARD	\N
46	8		\N	3500	\N	none	Вейвборд классик зеленый	\N
47	8	Плавное скольжение, удобная форма, легкость, самоцентрирующиеся ролики – все это новый Pипстик Эир Про. Купить его можно как для катания, так и для прыжков и трюков в воздухе.	\N	5300	\N	none	Pипстик Эир Про (Riрstik Air Рro, Razor)	\N
48	8	Обучиться катанию на скейте Икслайдер можно за несколько дней. В начале учебы для безопасного передвижения рекомендуется применять специальную ленту. После того, как катание на скейте Исклайдер будет устойчивым и свободным, ленту снимают. И дети, и взрослые прекрасно осваивают катание на этой доске. Купить этот товар можно прямо сейчас, в нашем интернет-магазине.	\N	3990	\N	none	Икслайдер (Xlider, Эврика) Раздельный скейтборд	\N
49	8	это флагман двухколесных скейтов от компании Razor.\r\nОтличное качество материалов, высокая грузоподъемность, в меру жесткий торсион.\r\nГрузоподъемность - 110 кг.	\N	6300	\N	none	Razor RipStik G	\N
50	8		\N	2200	\N	none	СНЕЙКБОРД SKILL	\N
51	9	Отличный выбор для начинающих – легкие, удобные ролики с системой вентиляции. Просто завязывать и развязывать. Наиболее привлекательная модель в сегменте недорогих роликов.	\N	5300	\N	none	Ролики Fila Primo Alu Lady 2014	\N
104	11	Лёгкая, маневренная и стильная модель. Универсальная доска позволит быстро учиться и легко прогрессировать. Профиль Easy Rocker с флэтом между креплениями и рокером носка и хвоста снижает риск зацепиться кантом, облегчает выполнение трюков и позволяет доске не тонуть в пушистом снегу.	\N	10999	\N	none	Сноуборд Volkl Stroke	\N
52	9	Роликовые коньки для фрискейта. Жёсткий пластиковый шелл обеспечивает надёжную фиксацию ног и точность в выполнении маневров, а внутренний сапожок из мягких материалов создаёт необходимый комфорт. Сменные пластиковые слайдеры защищают боковые поверхности ботинок от истирания. Система Heel Damping System представлена пяточным антишоком, который  закрепляется под стелькой. Отверстия в площадках для крепления рам подходят для установки практически любых рам, представленных на рынке. Кроме того, сами площадки можно устанавливать в различных позициях, смещая их в переднезаднем и боковом направлениях. Благодаря особой запатентованной технологии крепления кафа, Вы можете менять и его положение по горизонтали и вертикали. 	\N	17300	\N	none	Freestyle ролики SEBA FR1 80 Blue 2015	\N
53	9	Роликовые коньки для прогулочного катания. Алюминиевая рама, колеса диаметром 82 мм, подшипники Abec 7 обспечивают длительное и гладкое качение. Мягкий комфортный ботинок надежно фиксируется шнуровкой, баклей и пяточным ремнем.	\N	8650	\N	none	Фитнес-ролики Bladerunner Formula 82 W 2015	\N
54	9	Для опытных пользователей и простого передвижения по городу. За секунды превращает обувь в ролики. Ваш надежный партнер для катания в городе.	\N	3999	\N	none	РОЛИКОВЫЕ КОНЬКИ ДЛЯ КАТАНИЯ ПО ГОРОДУ SNEAK-IN ВЗР. OXELO	\N
55	9	Для улучшения техники катания. Подходят для катания на средние дистанции. Легкие и универсальные ролики повышенной комфортности от марки FILA. Версия 2015 года имеет облегченную конструкцию.	\N	7499	\N	none	РОЛИКИ MASTER WAVE МУЖ. FILA	\N
56	9	Для прогулочного катания. Более быстрые (большие колеса) и более легкие ролики (новые технологии). Самые легкие фитнес-ролики, на 600г легче, чем классические ролики!	\N	9999	\N	none	РОЛИКИ FILA PLUME ЖЕН. FILA	\N
57	9	При создании данной обуви использовались такие технологии, как Memory Fit и Hyper shell. Неподражаемый дизайн роликов вызывает неукротимое желание обзавестись точно такими же коньками, причем как можно скорее. Оттенок лайма крайне редко используется при раскраске спортивных аксессуаров, но в сочетании с серебряной тканью он оказался как нельзя более к месту. В подошве роликов скрыт секретный вентиляционный канал, по которому воздух попадает внутрь ботинка, избавляя ступню от перегрева при активном движении. Солидно и надежно выглядят также отменные колеса Hi-rebound HYPER PU 80мм 82А, которые действуют синхронно и крутятся совершенно свободно в пазах. СК Omega в будущем покорит еще немало роллеров по всему миру – это ясно уже по нынешнему спросу на данную модель.	\N	3668	\N	none	Роликовые коньки СК Omega, лайм (2012)	\N
58	9	Молодежная, но уже истинно мужская модель роликов для занятий фитнесом и других видов свободного катания на различных покрытиях. Является недорогой и одновременно актуальной разработкой, с внедрением новых технологий.\r\nРолики оснащены подшипниками последнего поколения ABEC 7, которые слабо восприимчивы к влаге и механическим включениям (песок, мелкий гравий и пр.). Оптимальная скорость работы подшипников не позволяет допуска свободного неконтролируемого вращения колес, что обеспечивает высокий уровень контроля и позволяет приобрести модель для подростков и начинающих роллеров.\r\n\r\nРама повышенной прочности из авиационного алюминия не сдерживает динамику движения, поэтому Expert Male можно считать одной из самых активных моделей для быстрого старта и форсажа.	\N	3363	\N	none	Роликовые коньки Expert Male (2014)	\N
59	9	Рама: Экстр. алюминий, 231мм (UK 3 – 4)\r\nКолеса: FILA 72мм/76мм/80мм/84A\r\nКруглый профиль\r\nПодшипники: ABEC 7\r\nКрепление: Застежка, шнурки, пяточный ремень\r\nс микронастраиваемой застежкой	\N	21000	\N	none	Роликовые коньки Fila Nrk Sd Black/Green	\N
60	9	Застежки: классическая система шнуровки, пяточный ремень, клипса с фиксатором\r\n\r\nВентиляция: дышащие мембранные материалы, анатомическая стелька с антибактериальным покрытием\r\n\r\nРама: алюминий\r\n\r\nПодшипники: ABEC 5\r\n\r\nКолеса: PU 80 мм 82А	\N	3840	\N	none	Роликовые коньки Maxcity Spliter , фиолетовый (2012)	\N
87	10	Самокат для взрослых EXPLORE Robo 200 Black \r\n\r\n \r\n\r\nТех. характер. самоката  EXPLORE ROBO 200 Black\r\n\r\nУникальная разработка этого сезона, новейшая технология сборки (одним нажатием кнопки) дает большую фору другим самокатам, выдерживает \r\nнагрузку до 120 кг, хороший выбор для тех кто ищет самокат с большими колесами! Explore robo 200 подходит как самокат для взрослых и в тоже время как детский самокат от 8+.	\N	3250	\N	none	Самокат для взрослых EXPLORE Robo 200 Black	\N
61	9	Эти роликовые коньки Bladerunner Pro 80 W, выполненные в спортивном стиле, являются высокотехнологичным изобретением трудолюбивых итальянцев. Данная модель коньков предназначена как для профессионалов, так и для новичков. Полумягкий ботинок изготовлен из особых дышащих материалов, и не доставляет никакого дискомфорта во время катания. Ролики фиксируются на ноге при помощи удобной шнуровки, ударопрочной бакли и крепкого пяточного ремня. Роликовые коньки Bladerunner Pro 80 W оснащены стандартной системой торможения, что поможет вам чувствовать себя увереннее при роликовых прогулках. Выбирая коньки данной фирмы, вы выбираете стопроцентное качество.	\N	3300	\N	none	Роликовые коньки Bladerunner Pro 80 W (2013)	\N
62	9	Роликовые коньки для проката Колеса: PU 76 мм / 80А Подшипники: ABEC 5 Рама: алюминий  Ботинок: полумягкий 	\N	4493	\N	none	Роликовые коньки СК Rental RS-2 2013	\N
63	9	Для любителей агрессивного катания фирма Explore, которая занимается производством роликовых коньков, как для профессионалов, так и для любителей уже долгое время, представляет модель Explore Cougar Aggressive. Кроме стильного дизайна, эта модель коньков  имеет массу достоинств, и это: усиленная рама из нейлона, удобный поролоновый ботинок, который надежно фиксируется на ноге благодаря шнуровке, алюминиевой застежке и пяточному ремню, а также новейшие подшипники ABEC 7, которые прекрасно справляются с большими и длительными нагрузками. Нейлоновая подошва с содержанием углеволокна, а также перфорированные стельки обеспечат дополнительный комфорт. В комплекте поставляется вставка, которая позволяет скользить по перилам.	\N	5500	\N	none	Роликовые коньки Explore Cougar Aggressive 2011	\N
64	9	Ролики раздвижные Larsen Flower имеют конструктивную возможность менять размер в диапазоне 4-х размеров. Рама изготовлена из прочного пластика и способна выдерживать значительные нагрузки.\r\n\r\nВ конструкции используется пяточный тормоз. Колеса изготовлены из прочного поливинилхлорида с карбоновыми подшипниками АВЕС5.	\N	2107	\N	none	Ролики раздвижные Larsen Flower	\N
66	9	Ролики раздвижные Larsen Energy G сделаны в современном дизайне с использованием зеленых и серых тонов. Раздвижная рама ботинка позволяет изменять размер ботинка на 4 размера. Специальная дышащая ткань создана для комфорта внутри ботинка. В носке предусмотрена дополнительная вентиляция, что избавит вас от ощущения дискомфорта во время катания. Алюминиевая рама способна переносить большие нагрузки. Застегиваются и регулируются по ноге при помощи пяточного ремня и пластиковой клипсы-фиксатора.	\N	2490	\N	none	Ролики раздвижные Larsen Energy G	\N
67	9	Larsen Flash V - это высококачественные раздвижные роликовые коньки, ориентированные специально на детей и подростков. Пластиковая рама с высоким мягким ботинком, обладающим вентиляцией в носовой части, делают данную модель максимально удобной в использовании. Ролики оснащены поливинилхлоридными колесами с подшипниками среднего класса ABEC 5.	\N	2216	\N	none	Ролики раздвижные Larsen Flash V	\N
68	9	Технологии: Max Fit\r\n\r\nЗастежки: классическая система шнуровки, клипса с фиксатором, пяточный ремень\r\n\r\nВентиляция: дышащие мембранные материалы,вставки из прочной металлической сетки в носочной части, стелька с антибактериальным покрытием\r\n\r\nРаздвижной механизм: Switch & Pull	\N	2500	\N	none	РОЛИКОВЫЕ КОНЬКИ MAXCITY SPARK ФИОЛЕТОВЫЙ	\N
69	9	MaxCity Punto - ролики для начинающих.\r\nТехнологии: Max Fit\r\nРама: алюминий\r\nКолеса: 64mm/80A, 70mm/80A, 72mm/80A (зависят от размера)\r\nПодшипники: ABEC 5\r\nЗастежка: пяточный ремень, шнуровка, клипса\r\nВентиляция: дышащие мембранные материалы, вставки из прочной металлической сетки в носочной части	\N	2000	\N	none	РОЛИКОВЫЕ КОНЬКИ MAXCITY PUNTO СИНИЙ	\N
70	9	Роликовые коньки с жестким каркасом - возвращение к лучшим стандартам в истории роликовых коньков. Легкий асимметричный дизайн, интегрированный амортизатор, удобный внутренний мягкий ботинок и анатомическая стелька обеспечивают максимальный комфорт при катании. Супервентиляция достигается благодаря специально разработанным отверстиям в каркасе. Устойчивый ход и хороший накат достигаются благодаря подшипникам ABEC 7. Ось Zero Clearance разработана специально для скоростного катания.	\N	15499	\N	none	Роликовые коньки женские Roces Vidi	\N
71	10	Стальная рама\r\nНе регулируемая высота руля\r\nПрорезиненные ручки\r\nДеревянная платформа 55*15 см\r\nКолёса: PU 200*36 мм, жесткость 82А\r\nПодшипники: ABEC -7 \r\nГрузоподъемность: до 100 кг	\N	2500	\N	none	Самокат Explore DECKLINE	\N
72	10	Для передвижения по городу на средние и длинные дистанции. Размер: от 1м 45 до 1м 95 ПЕРЕДВИГАЙТЕСЬ ПО ГОРОДУ ПРОЩЕ!Передвигайтесь в 3 раза быстрее на новом самокате Town 7 200Easyfold.	\N	8999	\N	none	САМОКАТ TOWN 7 ХРОМ OXELO	\N
80	10	Самокат для взрослых Explore Spitfire\r\n\r\n100% Алюминиевая рама\r\nПодножка\r\nРегулируемая высота руля до 95см, \r\nЛегкая система складывания\r\nПластиковые крылья-брызговики\r\nПлечевой ремень\r\nКолёса: PU 205/30 мм, жесткость 82А\r\nПодшипники: ABEC -7\r\nГрузоподъемность: до 110 кг\r\nВес: 5 кг	\N	6290	\N	none	Самокат для взрослых Explore Spitfire	\N
73	10	Для желающих обучиться катанию на самокате в стиле "фристайл". Самокат для фристайла, доступный для всех!	\N	4299	\N	none	САМОКАТ ДЛЯ ФРИСТАЙЛА FREESTYLE MF ONE КРАСНЫЙ OXELO	\N
81	10	Самокат для взрослых HW Hellowood Racer pink\r\n\r\nБренды: HelloWood \r\nМатериал: 100% алюминий, стальная вилка, усиленная рулевая стойка. \r\nДека: 46.5*13.5см \r\nКолеса: PU 200мм \r\nПодшипники: ABEC 7 \r\nВес: 5, 5 кг \r\nМаксимальная нагрузка: 100 кг \r\nТехнологии: самокат с двумя амортизаторами	\N	5890	\N	none	Самокат для взрослых HW Hellowood Racer pink	\N
74	10	Для начинающих кататься на самокате в стиле Freestyle. Новый самокат MF 1.8 2013 для первых трюков на самокате!	\N	5999	\N	none	САМОКАТ ДЛЯ ФРИСТАЙЛА MF 1.8 2013 OXELO	\N
75	10	Для передвижения по городу на средние и длинные дистанции. Размер: от 145 до 195 см. Максим. вес: 100 кг. 2 подвески обеспечивают амортизацию. Идеальный самокат для перемещения на средние и длинные дистанции. В 3 раза быстрее и в 3 раза дальше, чем на своих двоих!	\N	6999	\N	none	САМОКАТ TOWN7 XL ВЗР. OXELO	\N
76	10	Для катания в стиле дёрт. Катайтесь по любому покрытию с дертовым самокатом от Oxelo!	\N	7999	\N	none	САМОКАТ ДЛЯ ФРИСТАЙЛА И ДЕРТА MF DIRT OXELO	\N
77	10	Колёса: переднее - 230 мм, заднее - 180 мм.\r\n\r\nПодшипники АВЕС 7.\r\n\r\nОснащён усиленным тормозом и резиновыми ручками.\r\n\r\nВыдерживает вес до 130 кг	\N	6790	\N	none	Самокат для взрослых Explore Big Foot Black/Grey	\N
78	10	Самокат для взрослых HW Hellowod-RACER BLACK\r\n\r\nБренды: HelloWood \r\nМатериал: 100% алюминий, стальная вилка, усиленная рулевая стойка. \r\nДека: 46.5*13.5см \r\nКолеса: PU 200мм \r\nПодшипники: ABEC 7 \r\nВес: 5, 5 кг \r\nМаксимальная нагрузка: 100 кг \r\nТехнологии: самокат с двумя амортизаторами	\N	5890	\N	none	Самокат для взрослых HW Hellowod-RACER BLACK	\N
79	10	Самокат для взрослых HW Hellowood-RACER RED\r\n\r\nБренды: HelloWood \r\nМатериал: 100% алюминий, стальная вилка, усиленная рулевая стойка. \r\nДека: 46.5*13.5см \r\nКолеса: PU 200мм \r\nПодшипники: ABEC 7 \r\nВес: 5, 5 кг \r\nМаксимальная нагрузка: 100 кг \r\nТехнологии: самокат с двумя амортизаторами	\N	5890	\N	none	Самокат для взрослых HW Hellowood-RACER RED	\N
82	10	Колеса 200 мм\r\nПодшипники ABEC 7\r\nМаксимальная нагрузка до 120 кг\r\nЖесткость колес 80 А\r\n100 % алюминий\r\nРучка выдвигается на рост 190 см\r\nПодножка	\N	9990	\N	none	Самокат Zycom Easy Ride 200 white / green	\N
83	10	100% Алюминиевая рама Подножка Регулируемая высота руля до 95 см Легкая система складывания Колёса: PU 205*36 мм, жесткость 82А Подшипники: ABEC - 5 Грузоподъемность: до 100 кг	\N	4650	\N	none	Самокат Explore Leader blk	\N
84	10	Самокат для взрослых MaxCity Fusion розовый\r\nКнопочная раскладная система\r\nМатериал: 100% алюминий\r\nПодшипники: АВЕС 9 хром\r\nКолеса: 200мм\r\nМаксимальная нагрузка: 100кг	\N	4990	\N	none	Самокат для взрослых MaxCity Fusion розовый	\N
85	10	100% Алюминиевая рама Подножка Регулируемая высота руля до 95 см Легкая система складывания Колёса: PU 205*36 мм, жесткость 82А Подшипники: ABEC - 5 Грузоподъемность: до 100 кг	\N	4650	\N	none	Самокат Explore Leader blue	\N
86	10	100% Алюминиевая рама\r\nПодножка\r\nРегулируемая высота руля ______, \r\nПластиковые крылья-брызговики (+ запасной)\r\nПлечевой ремень\r\nЛегкая система складывания\r\nКолёса: PU 205/30 мм, жесткость 82А\r\nПодшипники: ABEC -7\r\nГрузоподъемность: до 100 кг\r\nВес: 6 кг	\N	5790	\N	none	Самокат для взрослых Explore BRIXTON	\N
117	12	Уменьшенный размер головы обеспечивает лучший контроль.	\N	4200	\N	none	Теннисная ракетка Babolat E-sense Lite	\N
88	10	Explore LEADER - самокат, который дарит волшебную возможность витать над землей, пусть даже на колесах, но ощущения легко сравнить с полетом в воздухе. Но испытать такой шанс могут не только дети, которые так любят самокаты, но и взрослые, которые в последнее время все больше приспосабливаются к этому. Покоряй дороги вместе с самокатом Explore LEADER.	\N	4200	\N	none	Двухколесный самокат Explore LEADER	\N
89	10	Колёса 200 мм. \r\n\r\nПодшипники  АВЕС 5.\r\n\r\nРазмеры площадки для ног - 44 * 12 см\r\n\r\nВыдерживает вес до 100 кг	\N	2890	\N	none	Самокат для взрослых Explore Voltage Green	\N
90	10	100 % алюминиевая рама\r\n\r\nРегулируемая высота руля до 95см\r\n\r\nПрорезиненные ручки\r\n\r\nЛегкая система складывания\r\n\r\nПодножка\r\n\r\nКолёса: PU 200*36 мм, жесткость 82А\r\n\r\nПодшипники: ABEC -7\r\n\r\nГрузоподъемность: до 100 кг	\N	3990	\N	none	Самокат для взрослых Explore Rapler green	\N
91	11	Genie - модель в линейке досок для девушек, которые только начинают осваивать сноубординг. Её можно описать фразой, что нет ничего плохого в том, чтобы быть проще! В этой доске собрано всё необходимое для того чтобы быстро и безопасно освоить снежную доску! \r\n\r\nСистема закладных 3D. \r\nФорма - Easy Rider. \r\nСердечник - Womens Specific True Flex Fly. \r\nСтекловолокно - Biax. \r\nЖёсткость - Twin.	\N	12456	\N	none	СНОУБОРД BURTON GENIE (13-14)	\N
92	11	Барракуда - это рыба обитающая в тропических водах мирового океана. Среда обитания, где Барракуды обычно охотятся - заросли, камни и скалы. Именно в таких условиях, конечно, не в мировом океане, обитают настоящие любители фрирайда. Будь-то лес, скалистая альпика или просто свежий паудер рядом с трассой - Barracuda справится со всем! Отличный фрирайд снаряд, позволяющий получить максимальное удовольствие от катания.\r\nНазначение: groomers + backcountry\r\nЖесткость: средняя \r\nПрогиб: S-Rocker\r\nСистема закладных ICS. \r\nФорма 15 мм Taper. \r\nСердечник - Super Fly ll с Dualzone EGD, \r\nВставки из карбона Carbon I-Beam. \r\nFrostbite Edges - канты в зоне креплений на пол-миллиметра шире, для невероятного контроля, даже на ледяной поверхности. При этом общая жесткость доски остается неизменной, \r\nPro-tip - заостренный хвост для лучшей маневренности в глубоком снегу и более низкого веса \r\nInfinite Ride - эксклюзивная технология от Burton, которая позволяет повысить щелчок и прочность доски	\N	29740	\N	none	Сноуборд BURTON BARRACUDA FW15	\N
93	11	Burton Blunt - это отличная парковая доска, ориентированная, преимущественно на джиббинг. Но на ней можно спокойно начинать свой путь в сноубординге новичкам. Ведь доска сама по себе мягкая и податливая, что позитивно сказывается на прогрессе в катании.  Графика - Jeff Fried.\r\n\r\nНазначение: groomers + park\r\nЖесткость: средняя \r\nПрогиб: Rocker \r\nШирина: традиционная и wide\r\nСистема закладных ICS. \r\nФорма Twin. \r\nСердечник - Fly Core. \r\nScoop - специальная форма хвоста и носа делает каждый поворот еще четким. Эта технология позволяет прощать ошибки, как на рейлах, так и в паудере. \r\nСтрингеры Jumper Cables, распределяющие энергию из центральной части к хвосту и тейлу \r\nКанты Frostbite\r\nPro-tip - заостренный хвост для лучшей маневренности в глубоком снегу и более низкого веса	\N	14370	\N	none	Сноуборд BURTON BLUNT FW14	\N
100	11	Сноуборд для максимально быстрого спуска по склону. Новая база позволяет быстро набрать скорость, а форма Pro Camber с усиливающими вставками гарантирует максимальную хватку кантов на самых высоких скоростях. Карбон и встроенная система гашения вибраций обеспечивают плавный ход, что в сочетании с особым типом прогиба делает Coal XT идеальной доской для бэккантри.	\N	33599	\N	none	Сноуборд Volkl Coal Xt	\N
101	11	Отличный набор технологий для сноубордисток, которые хотят прогрессировать! Прогиб Flat Top - комбинация флэта между закладными для стабильности и хватки кантов с рокером носка и хвоста для легкого маневрирования. Канты Frostbite Edges усиливают стабильность доски даже на обледеневших склонах, а специальная форма кантов на носке и хвост Scoop снижает вероятность зацепиться за снег.	\N	27499	\N	none	Сноуборд женский Burton Lip-Stick	\N
102	11	Мягкая и прощающая ошибки доска, разработанная специально для девушек. Технология Cruise Control снижает вероятность поймать кант. Прогиб V-Rocker облегчает маневрирование. Форма Directional с более широким и мягким носом идеальна для новичков. Деревянный сердечник делает доску отзывчивой. Экструдированный скользяк.	\N	22999	\N	none	Сноуборд женский Burton Feather	\N
103	11	Доска для продвинутых любителей фрирайда. Прогиб кэмбер для стабильности и управляемости, форма Directional и расширенный нос для всплывания в пушистом снегу и маневрирования на любом рельефе. Деревянный сердечник усилен карбоновыми струнами для большей отзывчивости и высоты олли	\N	27499	\N	none	Сноуборд Burton Juice Wagon	\N
94	11	Топовая доска для самых амбициозных девушек. Как высокопроизводительная электростанция, доска Torah Bright XC2 BTX поднимет ваши навыки так высоко, как вы и не мечтали. Созданная для постоянного прогресса олимпийской чемпионки Торы Брайт. Стремитесь к своей цели и катайтесь с уверенностью как в горах, так и в парке.\r\n\r\n\r\n\r\nОсобенности:\r\nНазначение: Freeride/Freestyle\r\nФорма: True Twin\r\nMAGNE-TRACTION - Неровные канты доски с Magne-Traction врезаются в снег, как нож, гарантируя больший контроль канта, чем когда-либо. Magne-Traction – это 7 стратегически расположенных плавных выступов на линии обоих боковых радиусов. Больше всего они выдаются в районе ваших ног, где расположен центр тяжести, что добавляет контроля и мощи ровно там, где они нужны больше всего. Остальные выступы меньше и не столь агрессивны: обеспечивая контроль, они не умаляют вашей фристайл-свободы.\r\nСердечник: Light Hearted\r\nСкользяк: Sintered 9900\r\nБоковины: 5 SW\r\nВолокно: триаксильное (в трех направлениях) с добавлением вектрана\r\nГрафика: Jann Nielsen.	\N	19433	\N	none	СНОУБОРД ROXY TORAH BRIGHT XC2 BTX (14-15)	\N
95	11	Представьте, вы лежите в гамаке на пляже, в руке у вас кокос, а в голове никаких забот. А теперь представьте вместо пляжа парк, по которому вы едете к идеально выведенному пайпу, а вместо кокоса у вас Easy Livin. Конструкция изгиба доски Flying V™ легко справляется с любым препятствием на вашем пути. Теперь все на своих местах, и Дэнни Дэвис любит, чтобы все было именно так. Легко и просто.\r\n\r\n\r\nЖесткость: 4\r\nБыстрая установка креплений благодаря The Channel\r\nFlying V™\r\nСердечник: Super Fly\r\nDual Density Triax™ Fiberglass\r\nSintered WFO Base\r\nJumper Cables Hi-Voltage ультра-лёгкие углеродные направляющие, которые передают энергию сразу же от ваших ног к носу и тейлу доски. Они добавляют высоту к олли, а так же отзывчивость доски в поворотах. Отличие от Jumper Cables - в толщине направляющих\r\nInfinite Ride™ - эксклюзивная технология Burton, которая позволяет усилить прочность и «стреляющие» свойства доски. В результате, доска не меняет своих свойств и не теряет прочности сезон за сезоном\r\nLightning Bolts -  направленные от закладных к кантам эти усиливающие вставки моментально передают любое ваше усилие от креплений кантам с невероятной четкостью\r\nFrostbite Edges - канты в зоне креплений на пол-миллиметра шире, для невероятного контроля, даже на ледяной поверхности. При этом общая жесткость доски остается неизменной\r\nEllip Kicks - делает доску более плавной, “стреляющей” и приподнимает нос и хвост доски для еще более простых приземлений в целине и не только\r\nSqueezebox - делает доску еще более стабильной и управляемой\r\n10:45 Sidewalls двойной угол для поглощения ударов\r\nPro Tip™ для максимальной мобильности\r\nTwin Flex - совершенная симметрия от носа до хвоста	\N	25160	\N	none	Сноуборд BURTON EASY LIVIN FW15	\N
96	11	Назначение: groomers, однако хороша так же и в парке и в глубоком снегу \r\nЖесткость: средняя \r\nПрогиб: Flying-V\r\nСистема закладных ICS. \r\nСердечник – Dragonfly Core. \r\nSqueezebox - делаёт доску более стабильной и агрессивной при выполнении поворотов и олли, \r\nJumper Cables Hi-Voltage - для максимального полета и отличного олли \r\nLightning Bolts - направленные от закладных к кантам эти усиливающие вставки моментально передают любое ваше усилие от креплений кантам с невероятной четкостью, \r\nScoop - специальная форма хвоста и носа делает каждый поворот еще четким. Эта технология позволяет прощать ошибки, как на рейлах, так и в паудере. \r\nInfinite Ride - эксклюзивная технология от Burton, которая позволяет повысить щелчок и прочность доски	\N	32030	\N	none	Сноуборд BURTON ANTLER FW15	\N
97	11	Жесткий сноуборд для самого агрессивного катания. Именно на нём завоевывают медали на олимпиадах. Прогиб Сamber. Деревянный сердечник с чередованием жестких и гибких секций и интегрированным карбоном по технологии Squeezebox High - благодаря чему сноуборд одновременно жесткий на скручивание и сохраняет гибкость. Форма Directional - оптимальный вариант для универсальной доски, который дает хорошее всплывание в паудере и управляемость на любом рельефе. Это делает доску более стабильной и агрессивной при выполнении поворотов и олли.	\N	39999	\N	none	Сноуборд Burton Custom X	\N
98	11	Классика от Burton - доска, которая подходит для любого склона. Прогиб Сamber равномерно распределяет вес райдера на канты, облегчая контроль доски на любом склоне и на любой скорости. Деревянный сердечник с чередованием жестких и гибких секций, по технологии Squeezebox, а также технология Lighting Bolts делают доску максимально отзывчивой и хорошо управляемой. Форма Directional - оптимальный вариант для универсальной доски, который дает хорошее всплывание в паудере и управляемость на любом рельефе.	\N	34499	\N	none	Сноуборд Burton Custom	\N
99	11	Сноуборд для фристайла, который также отлично ведет себя в глубоком снегу. Плоский прогиб Flat Top для облегченного маневрирования. Легкий деревянный сердечник Super Fly II. Спеченная база Sintered WFO c добавлением двух парафинов для отличного скольжения на любом снегу не требует дополнительного нанесения парафина весь сезон.	\N	28599	\N	none	Сноуборд Burton Trick Pony	\N
114	12	Новая, облегченная теннисная ракетка Wilson N 4 (101) выполнена с учетом достижений инновационных технологий. Несмотря на то, что Wilson N 4 – бюджетная версия она идеально сочетает в себе мощность, динамичность, легкие игровые свойства, маневренность, непревзойденный дизайн и комфорт.	\N	4000	\N	none	Теннисная ракетка Wilson N 4 (101)	\N
105	11	Идеальный выбор для фристайла. Форма носа и хвоста Park Shape и геометрия True Twin, карбоновый стрингер, конструкция Sidewall с полностью деревянным сердечником и триаксиальной оплёткой, а благодаря технологии Flat Rocker Profile для высокого контроля над доской на скорости и в поворотах, этот сноуборд готов проявить себя не только в парке.	\N	10299	\N	none	Сноуборд Termit Spray	\N
106	11	Женская модель для тех, кто не хочет останавливаться на достигнутом и стремится к большему. Выполнена по технологиям Sidewall и Rocker Profile. Vision не даст вам заскучать в любых условиях, будь то отратраченные склоны, пухляк или трамплины.	\N	9399	\N	none	Сноуборд женский Termit Vision	\N
107	11	Универсальный сноуборд для покорения склонов. Вырез Directional позволяет ездить вне трассы с тем же комфортом, что и по парку. Если трюк получился не полностью, форма не даст поймать кант, а амортизатор с легкостью сгладит даже большие дропы. Рокер и небольшое смещение закладных позволяет всплывать в паудере. Сноуборд сохраняет стабильность даже на высоких скоростях.	\N	17499	\N	none	Сноуборд Volkl Spade	\N
108	11	етский сноуборд невысокой жесткости разработан для самых маленьких сноубордисток. Прощает ошибки и позволяет ребенку быстро прогрессировать. Даже при небольшом весе ваш ребенок сможет легко балансировать и управлять этой доской. Благодаря технологии Easy Ride, когда канты чуть завалены относительно скользящей поверхности, доска не цепляет снег. Симметричная геометрия с приподнятыми носом и хвостом позволит ребенку быстрее освоить повороты и торможение. Скользящая поверхность Extruded рассчитана на то, чтобы поддерживать движение ребенка даже при небольшом весе.	\N	7999	\N	none	Сноуборд для девочек Burton Chicklet	\N
109	11	Фристайл, джиббинг - на этой доске можно выполнить любые трюки. Прогиб Flat Out Rocker идеально подходит для фристайла: плоский профиль между креплениями обеспечивает стабильность. Рокер носа и хвоста для четких приземлений. Новая конструкция Rocket Science: на 1 см шире для большей стабильности, на 5 см короче для большей маневренности.	\N	15899	\N	none	Сноуборд Salomon Sanchez	\N
110	11	Подойдет как профессионалам, так и начинающим, особенно тем, кто заинтересован в постановке правильной техники с самого начала катания. Опытные райдеры оценят мягкий прогиб, благодаря которому можно кататься расслабленно. Форма Easy Camber даст хороший щелчок для первых прыжков и трюков на склоне. Сноуборд позволит настоящим сноубордисткам совершенствовать свой стиль катания быстро и с удовольствием.	\N	15499	\N	none	Сноуборд женский Volkl Melody	\N
112	12	Ракетка Wilson Pro Staff 97 разработана для любителей агрессивной игры и постоянных атак	\N	13500	\N	none	Теннисная ракетка Wilson Pro Staff 97	\N
113	12	Теннисная ракетка Wilson Cierzo Two BLX сочетает в себе, казалось бы, два несовместимых качества – суперлегкость и гипермощность. Для осуществления сильного удара теперь не нужно тратить огромное количество энергии – просто поставьте ракетку на траекторию мяча и она «выстрелит».	\N	5900	\N	none	Теннисная ракетка Wilson Cierzo Two BLX	\N
131	12	Баланс: нейтральный\r\nГолова: 98"\r\nЖесткость: средняя\r\nНатяжка струн: 16х19\r\nМатериал ручки: алюминий\r\nОбод: 24мм\r\nРучка: 2\r\nДлина: 27"	\N	1370	\N	none	Head Ракетка для большого тенниса Head Titanium 1000 Gr2	\N
115	12	Теннисная ракетка Wilson ENVY PINK 25 отличный вариант для начинающего теннисиста. Модель выполнена в современном дизайне и имеет глянцевый внешний вид. Конструкция выполнена из термически обработанного графита, который обеспечивает прочность материала. По весу ракетка достаточно легкая, всего 225 грамм, это отличный вариант для детей, она достаточно удобно лежит в руке и не нагружает мышцы при ударе. Благодаря технологиям O Beam и Bumper Guard, модель имеет продолжительный срок службы, обеспечивает отличную точность, силу удара, надежность и отличное ощущение мяча при отдаче.	\N	1500	\N	none	Теннисная ракетка Wilson ENVY PINK 25	\N
116	12	Теннисная ракетка Wilson Triad 4 - это ракетка из семьи комфортных ракеток TRIAD. Размер головки в 100 кв.дюймов и относительно тонкий обод дает отличное сочетание комфорта и контроля. Рекомендуется любителям всех уровней и игрокам с проблемой "теннисного локтя". Увеличенные комфорт, ударогашение и защита от вибрации.\r\nРакетка без струны, с чехлом.	\N	3900	\N	none	Теннисная ракетка Wilson Triad 4 100	\N
118	12	Технология SmartGrip - ручка теннисной ракетки сделана по форме руки человека. В результате больше комфота из-за более естевтвенной хватки, меньше усилий для более мощного удара, больше контроля из-за уменьшения скольжения ручки.\r\nBabolat Pure Drive 25 - наилучшая комбинация мощности и контроля для максимального чувства мяча.	\N	4200	\N	none	Теннисная ракетка Babolat Pure Drive 25	\N
119	12	Легкие в обращении мощные ракетки с удлиненными ручками. Игра в стиле Энди Маррея.	\N	2100	\N	none	Теннисная ракетка Head Radical 23	\N
120	12	Материал: Графит/Композит.\r\nГрип: Uptake.	\N	4800	\N	none	Теннисная ракетка Babolat Pure Jr 26	\N
121	12	Удобная и прочная ракетка выполнена с учетом достижений самых инновационных технологий.	\N	10990	\N	none	Теннисная ракетка Wilson BLX Pro Staff Six.One 90	\N
122	12	Такая легкая, как тонкое облако, благодаря чему и получила это название. Ракетка для тех, кто не хочет искать компромисс между мощностью, легким весом и комфортом. \r\nТехнология AmpliFeel - улучшенное ощущение ракетки благодаря тому, что рукоятка передаёт больше сигналов при контакте с мячом. \r\nВставки из графита и базальта.	\N	12500	\N	none	Теннисная ракетка Wilson One BLX2	\N
123	12	Эта ракетка лучший выбор для универсальных игроков, ищущих наилучшее сочетание [K]онтроля, маневренности и прощения ошибок. \r\nГолова 102 кв. дюйма, технология FX для улучшения [K]онтроля и ДНК [K] Tour произвели прекрасную ракетку.	\N	5000	\N	none	Теннисная ракетка Wilson [K] Tour Team FX	\N
124	12	Ракетка, предоставляющая сочетание силы и качества.	\N	3900	\N	none	Теннисная ракетка Head MX Cyber Elite	\N
125	12	Drive AeroPro 2015 года отлично подходит для очень широкого круга игроков. Эта новая версия будет оснащаться новой технологии в верхней части ручки, чтобы обеспечить еще больше твердости благодаря ощущению новых материалов и новой конструкции ручки. AeroPro предназначен для более высоких скоростей в игре. В результате больше мощности и контроля.	\N	12600	\N	none	Теннисная ракетка Babolat AeroPro Drive	\N
126	12	Увеличенная поверхность головы, длинная ручка обеспечивает легкую маневренность. Идеальна для детей, которым нравится стиль игры Новака Джоковича.	\N	3270	\N	none	ТЕННИСНАЯ РАКЕТКА HEAD SPEED 25	\N
127	12	Быстрая и маневренная ракетка. Хорошо подходит для юниоров, переходящих во взрослую лигу.	\N	12100	\N	none	ТЕННИСНАЯ РАКЕТКА BABOLAT AEROPRO LITE	\N
128	12	Эта ракетка идеально подходит для молодых игроков возрастом от 8 до 10 лет. Алюминиевая рама предлагает большую силу и уверенность. Отлично подходит для начинающих игроков.	\N	1890	\N	none	ТЕННИСНАЯ РАКЕТКА HEAD MARIA 25	\N
129	12	Прочувствуйте ракетку в действии: в мощности, в отдаче, в маневренности, в контроле ситуации и в прощении ошибок.\r\nОна предназначена для игроков разного уровня, ценящих в ракетке ее ощущение удара.	\N	9700	\N	none	ТЕННИСНАЯ РАКЕТКА WILSON BLADE 104	\N
130	12	Ракетка выпущена для любителей серии PRO SRAFF, которые больше не хотят играть тяжелой ракеткой с маленькой головой. Технология AmpliFeel в ручке ракетки улучшает чувство мяча. Ракетка позволяет играть агрессивно, мощно, атаковать с крученых ударов, играть у сетки. Такое универсальное "оружие" дает вам серьезное преимущество на корте.	\N	5999	\N	none	Ракетка для большого тенниса Wilson Pro Staff Six.One Tour 100	\N
133	12	Длина: 27 дюймов (69 см)\r\nПлощадь головы: 100 кв. дюйма (645 кв.см)\r\nШирина обода: 22 мм\r\nВес без струн: 275 г\r\nВес со струнами: 290 г\r\nБаланс: 330 мм (нейтральный)\r\nЖесткость: 45\r\nСхема натяжки (формула струн): 16x19\r\nРучка: 2(10,8 см)	\N	3932	\N	none	Head MX Ice Tour Gr2	\N
111	12	Ракетка для игры в теннис Wilson BLADE 98 (18х20) предназначена для профессионалов, и ее можно назвать настоящим бестселлером в мире существующих мощнейших ракеток для игры в теннис.	\N	8800	\N	NEW	Теннисная ракетка Wilson BLADE 98 (18х20)	\N
65	9	Отличные роликовые коньки ATEMI X7 lady для фитнес-катания для продвинутых любителей. Сочетание алюминиевой рамы, максимально открытый пластиковый манжет, Abec7 улучшают скоростные характеристики роликового конька. Пластиковый манжет хорошо фиксирует пятку. Бакля, шнурки, Velcro-липучка. Прочный пластиковый мысок защищает пальцы от повреждений. Ботинок изготовлен из современных материалов, которые обладают хорошими вентилируемыми свойствами. Анатомическая форма колодки позволяет кататься на протяжении нескольких часов без дискомфорта. Легок и удобен в одевании.	\N	2429	\N	SALE	Роликовые коньки ATEMI X7 lady	2599
38	8	Двухколесный скейт Dragon Board Deadhead C Bund - это современная модель скейтборда, созданная с помощью современных технологий. Изготовленный из гиперпрочного пластика, он мало весит и подходит для исполнения трюков в воздухе любой сложности. Модель отличается надежными колесами. Корпус украшен рисунками черепов, поэтому будет отличным подарком для мальчика. Подарите своему сыну яркие экстремальные эмоции, купив ему скейт Dragon Board Deadhead C Bund по доступной цене.	\N	2590	\N	HOT	Роллерсерф Dragon Board Deadhead C Bund	6000
\.


--
-- Name: goods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: osamylov
--

SELECT pg_catalog.setval('goods_id_seq', 134, true);


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
232	36	img/items/cat_8/36_2997.jpg
233	36	img/items/cat_8/36_21066.jpg
234	36	img/items/cat_8/36_17851.jpg
235	36	img/items/cat_8/36_23256.jpg
236	36	img/items/cat_8/36_3816.jpg
237	37	img/items/cat_8/37_14593.jpg
238	37	img/items/cat_8/37_17318.jpg
239	37	img/items/cat_8/37_4583.jpg
240	37	img/items/cat_8/37_12692.jpg
241	37	img/items/cat_8/37_465.jpg
242	38	img/items/cat_8/38_9270.jpg
243	38	img/items/cat_8/38_3895.jpg
244	38	img/items/cat_8/38_27812.jpg
245	38	img/items/cat_8/38_27149.jpg
246	38	img/items/cat_8/38_19906.jpg
247	39	img/items/cat_8/39_26579.jpg
248	39	img/items/cat_8/39_12048.jpg
249	39	img/items/cat_8/39_6665.jpg
250	39	img/items/cat_8/39_1038.jpg
251	39	img/items/cat_8/39_24947.jpg
252	40	img/items/cat_8/40_14384.jpg
253	40	img/items/cat_8/40_15529.jpg
254	40	img/items/cat_8/40_558.jpg
255	40	img/items/cat_8/40_8655.jpg
256	40	img/items/cat_8/40_10076.jpg
257	41	img/items/cat_8/41_25661.jpg
258	41	img/items/cat_8/41_29746.jpg
259	41	img/items/cat_8/41_25987.jpg
260	41	img/items/cat_8/41_21248.jpg
261	41	img/items/cat_8/41_22126.jpg
262	42	img/items/cat_8/42_31333.jpg
263	43	img/items/cat_8/43_2425.jpg
264	43	img/items/cat_8/43_5822.jpg
265	43	img/items/cat_8/43_17183.jpg
266	44	img/items/cat_8/44_11825.jpg
267	44	img/items/cat_8/44_18710.jpg
268	45	img/items/cat_8/45_271.jpg
269	46	img/items/cat_8/46_507.jpg
270	46	img/items/cat_8/46_536.jpg
271	46	img/items/cat_8/46_25713.jpg
272	47	img/items/cat_8/47_13932.jpg
273	47	img/items/cat_8/47_17461.jpg
274	47	img/items/cat_8/47_24778.jpg
275	47	img/items/cat_8/47_29243.jpg
276	48	img/items/cat_8/48_4922.jpg
277	48	img/items/cat_8/48_3051.jpg
278	48	img/items/cat_8/48_23880.jpg
279	49	img/items/cat_8/49_11823.jpg
280	50	img/items/cat_8/50_25174.jpg
281	50	img/items/cat_8/50_17111.jpg
282	50	img/items/cat_8/50_10180.jpg
283	50	img/items/cat_8/50_22189.jpg
284	50	img/items/cat_8/50_22497.jpg
285	51	img/items/cat_9/51_10502.jpg
286	52	img/items/cat_9/52_11324.jpg
287	53	img/items/cat_9/53_19938.jpg
288	54	img/items/cat_9/54_13683.jpg
289	54	img/items/cat_9/54_31792.jpg
290	54	img/items/cat_9/54_12457.jpg
291	54	img/items/cat_9/54_26158.jpg
292	54	img/items/cat_9/54_19909.jpg
293	55	img/items/cat_9/55_13724.jpg
294	55	img/items/cat_9/55_2981.jpg
295	55	img/items/cat_9/55_27514.jpg
296	55	img/items/cat_9/55_7979.jpg
297	55	img/items/cat_9/55_3976.jpg
298	55	img/items/cat_9/55_15649.jpg
299	56	img/items/cat_9/56_19800.jpg
300	56	img/items/cat_9/56_28337.jpg
301	56	img/items/cat_9/56_16278.jpg
302	56	img/items/cat_9/56_30487.jpg
303	56	img/items/cat_9/56_13775.jpg
304	56	img/items/cat_9/56_11100.jpg
305	56	img/items/cat_9/56_11877.jpg
306	57	img/items/cat_9/57_17734.jpg
307	57	img/items/cat_9/57_775.jpg
308	57	img/items/cat_9/57_7220.jpg
309	58	img/items/cat_9/58_14138.jpg
310	59	img/items/cat_9/59_26372.jpg
311	59	img/items/cat_9/59_17645.jpg
312	60	img/items/cat_9/60_31687.jpg
313	61	img/items/cat_9/61_16162.jpg
314	61	img/items/cat_9/61_28083.jpg
315	61	img/items/cat_9/61_28528.jpg
316	62	img/items/cat_9/62_2653.jpg
317	63	img/items/cat_9/63_24555.jpg
318	63	img/items/cat_9/63_8520.jpg
319	63	img/items/cat_9/63_19425.jpg
320	64	img/items/cat_9/64_21274.jpg
321	64	img/items/cat_9/64_32331.jpg
322	64	img/items/cat_9/64_20520.jpg
323	64	img/items/cat_9/64_321.jpg
324	65	img/items/cat_9/65_663.jpg
325	65	img/items/cat_9/65_19588.jpg
326	65	img/items/cat_9/65_31853.jpg
327	66	img/items/cat_9/66_3334.jpg
328	66	img/items/cat_9/66_4039.jpg
329	66	img/items/cat_9/66_2548.jpg
330	66	img/items/cat_9/66_17693.jpg
331	66	img/items/cat_9/66_24738.jpg
332	67	img/items/cat_9/67_12595.jpg
333	67	img/items/cat_9/67_11504.jpg
334	67	img/items/cat_9/67_29289.jpg
335	67	img/items/cat_9/67_25838.jpg
336	68	img/items/cat_9/68_29586.jpg
337	69	img/items/cat_9/69_1524.jpg
338	70	img/items/cat_9/70_17129.jpg
339	71	img/items/cat_10/71_24931.jpg
340	71	img/items/cat_10/71_20832.jpg
341	72	img/items/cat_10/72_1766.jpg
342	72	img/items/cat_10/72_13351.jpg
343	72	img/items/cat_10/72_18132.jpg
344	72	img/items/cat_10/72_28797.jpg
345	72	img/items/cat_10/72_11118.jpg
346	72	img/items/cat_10/72_12815.jpg
347	73	img/items/cat_10/73_11663.jpg
348	73	img/items/cat_10/73_10268.jpg
349	73	img/items/cat_10/73_19493.jpg
350	73	img/items/cat_10/73_25082.jpg
351	73	img/items/cat_10/73_5657.jpg
352	73	img/items/cat_10/73_14046.jpg
353	73	img/items/cat_10/73_12479.jpg
354	73	img/items/cat_10/73_9100.jpg
355	73	img/items/cat_10/73_28626.jpg
356	73	img/items/cat_10/73_18595.jpg
357	73	img/items/cat_10/73_18336.jpg
358	74	img/items/cat_10/74_11122.jpg
359	74	img/items/cat_10/74_27587.jpg
360	74	img/items/cat_10/74_31808.jpg
361	74	img/items/cat_10/74_6009.jpg
362	74	img/items/cat_10/74_5035.jpg
363	74	img/items/cat_10/74_10760.jpg
364	74	img/items/cat_10/74_1441.jpg
365	74	img/items/cat_10/74_9158.jpg
366	74	img/items/cat_10/74_4764.jpg
367	74	img/items/cat_10/74_9381.jpg
368	75	img/items/cat_10/75_16263.jpg
369	75	img/items/cat_10/75_24244.jpg
370	75	img/items/cat_10/75_23261.jpg
371	75	img/items/cat_10/75_13906.jpg
372	75	img/items/cat_10/75_19747.jpg
373	75	img/items/cat_10/75_12832.jpg
374	75	img/items/cat_10/75_18393.jpg
375	75	img/items/cat_10/75_26014.jpg
376	75	img/items/cat_10/75_6271.jpg
377	76	img/items/cat_10/76_20556.jpg
378	76	img/items/cat_10/76_2197.jpg
379	76	img/items/cat_10/76_15786.jpg
380	76	img/items/cat_10/76_15771.jpg
381	76	img/items/cat_10/76_9528.jpg
382	76	img/items/cat_10/76_6417.jpg
383	77	img/items/cat_10/77_2678.png
384	77	img/items/cat_10/77_6263.jpg
385	77	img/items/cat_10/77_23780.jpg
386	77	img/items/cat_10/77_13645.jpg
387	78	img/items/cat_10/78_4381.png
388	79	img/items/cat_10/79_22530.png
389	80	img/items/cat_10/80_3262.jpg
390	80	img/items/cat_10/80_287.png
391	80	img/items/cat_10/80_7276.jpg
392	80	img/items/cat_10/80_12853.jpg
393	82	img/items/cat_10/82_17683.jpg
394	82	img/items/cat_10/82_25424.jpg
395	82	img/items/cat_10/82_22857.png
396	82	img/items/cat_10/82_29262.jpg
397	82	img/items/cat_10/82_8047.jpg
398	83	img/items/cat_10/83_25724.jpg
399	84	img/items/cat_10/84_28505.jpg
400	85	img/items/cat_10/85_4218.jpg
401	86	img/items/cat_10/86_14026.jpg
402	87	img/items/cat_10/87_16645.jpg
403	88	img/items/cat_10/88_25946.jpg
404	89	img/items/cat_10/89_31445.jpg
405	90	img/items/cat_10/90_4155.jpg
406	91	img/items/cat_11/91_21214.jpg
407	91	img/items/cat_11/91_7359.jpg
408	91	img/items/cat_11/91_8076.jpg
409	91	img/items/cat_11/91_18133.jpg
410	92	img/items/cat_11/92_14110.jpg
411	92	img/items/cat_11/92_19455.jpg
412	93	img/items/cat_11/93_25322.jpg
413	94	img/items/cat_11/94_6619.jpg
414	95	img/items/cat_11/95_27768.jpg
415	95	img/items/cat_11/95_28497.jpg
416	95	img/items/cat_11/95_17334.jpg
417	96	img/items/cat_11/96_30903.jpg
418	97	img/items/cat_11/97_17291.jpg
419	97	img/items/cat_11/97_19560.jpg
420	98	img/items/cat_11/98_16106.png
421	98	img/items/cat_11/98_17883.png
422	98	img/items/cat_11/98_10360.png
423	99	img/items/cat_11/99_15820.jpg
424	99	img/items/cat_11/99_10261.png
425	99	img/items/cat_11/99_10026.png
426	100	img/items/cat_11/100_22564.jpg
427	100	img/items/cat_11/100_12173.png
428	101	img/items/cat_11/101_31569.png
429	101	img/items/cat_11/101_24502.png
430	102	img/items/cat_11/102_25922.png
431	103	img/items/cat_11/103_26753.png
432	104	img/items/cat_11/104_10523.png
433	105	img/items/cat_11/105_32038.png
434	106	img/items/cat_11/106_27320.png
435	107	img/items/cat_11/107_26963.png
436	107	img/items/cat_11/107_21136.jpg
437	107	img/items/cat_11/107_14217.png
438	108	img/items/cat_11/108_5006.jpg
439	108	img/items/cat_11/108_18351.png
440	109	img/items/cat_11/109_1980.png
441	110	img/items/cat_11/110_12433.png
442	110	img/items/cat_11/110_3062.jpg
443	111	img/items/cat_12/111_15351.jpg
444	111	img/items/cat_12/111_31332.jpg
445	112	img/items/cat_12/112_3431.jpg
446	112	img/items/cat_12/112_18196.jpg
447	113	img/items/cat_12/113_3005.jpg
448	113	img/items/cat_12/113_17842.jpg
449	113	img/items/cat_12/113_6403.jpg
450	114	img/items/cat_12/114_17221.jpg
451	114	img/items/cat_12/114_23194.jpg
452	114	img/items/cat_12/114_12235.jpg
453	115	img/items/cat_12/115_16512.jpg
454	115	img/items/cat_12/115_9913.jpg
455	116	img/items/cat_12/116_25783.jpg
456	116	img/items/cat_12/116_21540.jpg
457	116	img/items/cat_12/116_31629.JPG
458	116	img/items/cat_12/116_16706.JPG
459	117	img/items/cat_12/117_5459.jpg
460	118	img/items/cat_12/118_17613.jpg
461	119	img/items/cat_12/119_29058.jpg
462	120	img/items/cat_12/120_2814.jpg
463	121	img/items/cat_12/121_16991.jpg
464	122	img/items/cat_12/122_8339.jpg
465	123	img/items/cat_12/123_25512.jpg
466	124	img/items/cat_12/124_25772.jpg
467	125	img/items/cat_12/125_22736.jpg
468	126	img/items/cat_12/126_30069.jpg
469	127	img/items/cat_12/127_24777.jpg
470	128	img/items/cat_12/128_22794.jpg
471	128	img/items/cat_12/128_9595.jpg
472	129	img/items/cat_12/129_8088.jpg
473	130	img/items/cat_12/130_20161.jpg
474	131	img/items/cat_12/131_4952.jpg
475	132	img/items/cat_12/132_9166.jpg
476	133	img/items/cat_12/133_29681.jpg
\.


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: osamylov
--

SELECT pg_catalog.setval('images_id_seq', 476, true);


--
-- Name: names_id_seq; Type: SEQUENCE SET; Schema: public; Owner: osamylov
--

SELECT pg_catalog.setval('names_id_seq', 62, true);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: osamylov
--

COPY orders (id, email, name, phone, comment, city, street, house, app, id_delivery, id_user, "time", status) FROM stdin;
37	qwe	qwe	+7(234) 234-2342	jghjghj	Москва	KDfysbwh	234f	34	1	1	2017-04-12 21:35:16.729284+03	Принят
38	qwe	qwe	+7(234) 234-2342	\N	Vdjhsdv	KDfysbwh	234f	\N	3	1	2017-04-12 21:36:18.068771+03	Принят
39	\N	\N	\N	\N	Vdjhsdv	KDfysbwh	234f	34	1	1	\N	Корзина
40	tovar.ivan@gmail.com	Иванов Иван Товарищев	\N		Челчябинск	Комсомольсская	11	11	3	\N	2017-04-14 17:02:21.332823+03	Принят
41	komarov@ya.ru	Комаров	\N		тверь	Труда	12	11	2	\N	2017-04-14 17:04:32.544317+03	Принят
42	mat@gmail.ru	Вяткин Матвей	\N		Вятки	Первая	12	\N	3	\N	2017-04-14 17:08:27.515733+03	Принят
2	petrov@maiil.com	Петров Федор	+7(234) 234-2342	Доставить до 19 часов	Москва	Мира	12	32	2	9	149166-08-30 00:00:00+03	У курьера
43	mat@gmail.ru	Вяткин Матвей	\N		Вятки	Первая	12	\N	3	\N	2017-04-14 17:09:32.002222+03	Принят
1	user@mail.ru	Вася	+7(912)912-12-12	\N	Москва	Победы	343	34	3	19	2017-04-06 15:21:05.32088+03	Отменен
13	petrov@mail.com	Петров Федор	\N		Москва	Мира	12	32	2	9	\N	Принят
14	petrov@mail.com	Петров Федор	\N		Москва	Мира	12	32	2	9	\N	Принят
15	petrov@mail.com	Петров Федор	\N		Москва	Мира	12	32	2	9	\N	Принят
16	petrov@mail.com	Петров Федор	\N		Москва	Мира	12	32	2	9	\N	Принят
17	petrov@mail.com	Петров Федор	\N		Москва	Мира	12	32	3	9	\N	Принят
18	petrov@mail.com	Петров Федор	\N		Москва	Мира	12	32	1	9	2017-04-09 20:15:13.063684+03	Принят
35	qwe	qwe	+7(234) 234-2342	\N	Vdjhsdv	KDfysbwh	234f	34	1	1	\N	Принят
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: osamylov
--

SELECT pg_catalog.setval('orders_id_seq', 43, true);


--
-- Data for Name: sold_goods; Type: TABLE DATA; Schema: public; Owner: osamylov
--

COPY sold_goods (id, id_order, id_good, numbers, id_variant) FROM stdin;
5	1	17	4	\N
6	1	41	3	\N
10	2	16	1	11
12	2	43	3	\N
15	2	119	3	\N
16	13	41	4	34
17	14	111	2	\N
18	14	40	2	\N
19	14	41	4	34
20	15	111	2	\N
21	15	40	2	\N
22	15	41	4	34
23	16	111	2	\N
24	16	40	2	\N
25	16	41	4	34
26	17	127	1	\N
27	17	113	3	\N
28	17	16	2	8
29	18	128	1	66
50	35	131	2	\N
52	35	133	1	\N
51	35	130	2	\N
53	37	131	1	\N
54	38	131	1	\N
56	39	94	1	\N
57	40	128	2	67
58	40	55	1	\N
59	41	131	1	\N
60	42	107	2	\N
61	43	107	2	\N
\.


--
-- Name: sold_goods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: osamylov
--

SELECT pg_catalog.setval('sold_goods_id_seq', 61, true);


--
-- Data for Name: user_access; Type: TABLE DATA; Schema: public; Owner: osamylov
--

COPY user_access (id, id_user, access_role) FROM stdin;
12	1	admin
15	1	admin
16	1	admin
\.


--
-- Name: user_access_id_seq; Type: SEQUENCE SET; Schema: public; Owner: osamylov
--

SELECT pg_catalog.setval('user_access_id_seq', 16, true);


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
27	36	красный
28	36	синий
29	40	желтый
30	40	серый
31	40	красный
32	40	фиолетовый
34	41	голубой
33	41	розовый
35	47	красный
36	47	синий
37	47	черный
38	50	черный
39	50	синий
40	50	красный
41	50	зеленый
42	71	красный
43	71	зеленый
44	72	синий
45	72	черный
46	72	голубой
47	72	серебряный
48	73	красный
49	73	белый
50	74	черный
51	74	серебряный
52	75	белый
53	75	черный
54	82	белый
55	82	синий
56	87	зеленый
57	87	красный
58	87	белый
59	87	фиолетовый
60	91	фиолетовый
61	91	синий
62	91	желтый
63	91	бирюзовый
64	92	черно-синий
65	92	сине-голубой
66	128	фиолетовый
67	128	голубой
\.


--
-- Name: var_good_id_seq; Type: SEQUENCE SET; Schema: public; Owner: osamylov
--

SELECT pg_catalog.setval('var_good_id_seq', 67, true);


--
-- Name: cats cats_pkey; Type: CONSTRAINT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY cats
    ADD CONSTRAINT cats_pkey PRIMARY KEY (id);


--
-- Name: delivery delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY (id);


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
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: user_access user_access_pkey; Type: CONSTRAINT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY user_access
    ADD CONSTRAINT user_access_pkey PRIMARY KEY (id);


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
-- Name: orders delyvery-id_delivery; Type: FK CONSTRAINT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT "delyvery-id_delivery" FOREIGN KEY (id_delivery) REFERENCES delivery(id);


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
-- Name: sold_goods sold-id_good; Type: FK CONSTRAINT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY sold_goods
    ADD CONSTRAINT "sold-id_good" FOREIGN KEY (id_good) REFERENCES goods(id) ON UPDATE CASCADE;


--
-- Name: sold_goods sold-id_order; Type: FK CONSTRAINT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY sold_goods
    ADD CONSTRAINT "sold-id_order" FOREIGN KEY (id_order) REFERENCES orders(id) ON DELETE CASCADE;


--
-- Name: sold_goods sold-var; Type: FK CONSTRAINT; Schema: public; Owner: osamylov
--

ALTER TABLE ONLY sold_goods
    ADD CONSTRAINT "sold-var" FOREIGN KEY (id_variant) REFERENCES var_good(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

