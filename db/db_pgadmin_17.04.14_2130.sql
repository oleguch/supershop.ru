PGDMP                         u            osamylov_db    9.6.2    9.6.2 L    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    24577    osamylov_db    DATABASE     �   CREATE DATABASE osamylov_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE osamylov_db;
             osamylov    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            >           1247    32810    badge    TYPE     L   CREATE TYPE badge AS ENUM (
    'none',
    'NEW',
    'HOT',
    'SALE'
);
    DROP TYPE public.badge;
       public       osamylov    false    3            h           1247    41341    status    TYPE     �   CREATE TYPE status AS ENUM (
    'Принят',
    'Доставлен',
    'У курьера',
    'Отгружен',
    'Отменен',
    'Корзина'
);
    DROP TYPE public.status;
       public       osamylov    false    3            �            1259    41152    cats    TABLE     Z   CREATE TABLE cats (
    id integer NOT NULL,
    name text NOT NULL,
    descript text
);
    DROP TABLE public.cats;
       public         osamylov    false    3            �            1259    41158    cats_id_seq    SEQUENCE     m   CREATE SEQUENCE cats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.cats_id_seq;
       public       osamylov    false    3    186            �           0    0    cats_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE cats_id_seq OWNED BY cats.id;
            public       osamylov    false    187            �            1259    41286    delivery    TABLE     B   CREATE TABLE delivery (
    id integer NOT NULL,
    text text
);
    DROP TABLE public.delivery;
       public         osamylov    false    3            �            1259    41284    delivery_id_seq    SEQUENCE     q   CREATE SEQUENCE delivery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.delivery_id_seq;
       public       osamylov    false    3    200            �           0    0    delivery_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE delivery_id_seq OWNED BY delivery.id;
            public       osamylov    false    199            �            1259    32824    goods_id_seq    SEQUENCE     n   CREATE SEQUENCE goods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.goods_id_seq;
       public       osamylov    false    3            �            1259    41160    goods    TABLE     ,  CREATE TABLE goods (
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
    DROP TABLE public.goods;
       public         osamylov    false    185    574    3    574            �            1259    41196    images    TABLE     k   CREATE TABLE images (
    id integer NOT NULL,
    id_good integer NOT NULL,
    img_path text NOT NULL
);
    DROP TABLE public.images;
       public         osamylov    false    3            �            1259    41202    images_id_seq    SEQUENCE     o   CREATE SEQUENCE images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.images_id_seq;
       public       osamylov    false    3    191            �           0    0    images_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE images_id_seq OWNED BY images.id;
            public       osamylov    false    192            �            1259    41168    users    TABLE     �   CREATE TABLE users (
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
       public         osamylov    false    3            �            1259    41174    names_id_seq    SEQUENCE     n   CREATE SEQUENCE names_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.names_id_seq;
       public       osamylov    false    3    189            �           0    0    names_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE names_id_seq OWNED BY users.id;
            public       osamylov    false    190            �            1259    41204    orders    TABLE     8  CREATE TABLE orders (
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
    DROP TABLE public.orders;
       public         osamylov    false    616    616    3            �            1259    41210    orders_id_seq    SEQUENCE     o   CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public       osamylov    false    193    3            �           0    0    orders_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE orders_id_seq OWNED BY orders.id;
            public       osamylov    false    194            �            1259    41256 
   sold_goods    TABLE     �   CREATE TABLE sold_goods (
    id integer NOT NULL,
    id_order integer NOT NULL,
    id_good integer NOT NULL,
    numbers integer DEFAULT 1 NOT NULL,
    id_variant integer
);
    DROP TABLE public.sold_goods;
       public         osamylov    false    3            �            1259    41260    sold_goods_id_seq    SEQUENCE     s   CREATE SEQUENCE sold_goods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.sold_goods_id_seq;
       public       osamylov    false    197    3            �           0    0    sold_goods_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE sold_goods_id_seq OWNED BY sold_goods.id;
            public       osamylov    false    198            �            1259    49489    user_access    TABLE     s   CREATE TABLE user_access (
    id integer NOT NULL,
    id_user integer NOT NULL,
    access_role text NOT NULL
);
    DROP TABLE public.user_access;
       public         osamylov    false    3            �            1259    49487    user_access_id_seq    SEQUENCE     t   CREATE SEQUENCE user_access_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.user_access_id_seq;
       public       osamylov    false    3    202            �           0    0    user_access_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE user_access_id_seq OWNED BY user_access.id;
            public       osamylov    false    201            �            1259    41212    var_good    TABLE     c   CREATE TABLE var_good (
    id integer NOT NULL,
    id_good integer NOT NULL,
    variant text
);
    DROP TABLE public.var_good;
       public         osamylov    false    3            �            1259    41218    var_good_id_seq    SEQUENCE     q   CREATE SEQUENCE var_good_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.var_good_id_seq;
       public       osamylov    false    3    195            �           0    0    var_good_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE var_good_id_seq OWNED BY var_good.id;
            public       osamylov    false    196                       2604    41263    cats id    DEFAULT     T   ALTER TABLE ONLY cats ALTER COLUMN id SET DEFAULT nextval('cats_id_seq'::regclass);
 6   ALTER TABLE public.cats ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    187    186                       2604    41289    delivery id    DEFAULT     \   ALTER TABLE ONLY delivery ALTER COLUMN id SET DEFAULT nextval('delivery_id_seq'::regclass);
 :   ALTER TABLE public.delivery ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    200    199    200                       2604    41264 	   images id    DEFAULT     X   ALTER TABLE ONLY images ALTER COLUMN id SET DEFAULT nextval('images_id_seq'::regclass);
 8   ALTER TABLE public.images ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    192    191                       2604    41265 	   orders id    DEFAULT     X   ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    194    193                       2604    41266    sold_goods id    DEFAULT     `   ALTER TABLE ONLY sold_goods ALTER COLUMN id SET DEFAULT nextval('sold_goods_id_seq'::regclass);
 <   ALTER TABLE public.sold_goods ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    198    197                       2604    49492    user_access id    DEFAULT     b   ALTER TABLE ONLY user_access ALTER COLUMN id SET DEFAULT nextval('user_access_id_seq'::regclass);
 =   ALTER TABLE public.user_access ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    202    201    202                       2604    41267    users id    DEFAULT     V   ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('names_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    190    189                       2604    41268    var_good id    DEFAULT     \   ALTER TABLE ONLY var_good ALTER COLUMN id SET DEFAULT nextval('var_good_id_seq'::regclass);
 :   ALTER TABLE public.var_good ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    196    195            �          0    41152    cats 
   TABLE DATA               +   COPY cats (id, name, descript) FROM stdin;
    public       osamylov    false    186   �M       �           0    0    cats_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('cats_id_seq', 31, true);
            public       osamylov    false    187            �          0    41286    delivery 
   TABLE DATA               %   COPY delivery (id, text) FROM stdin;
    public       osamylov    false    200   FR       �           0    0    delivery_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('delivery_id_seq', 3, true);
            public       osamylov    false    199            �          0    41160    goods 
   TABLE DATA               g   COPY goods (id, id_cat, descript, url_img, price, variant, badge, name, price_wo_discount) FROM stdin;
    public       osamylov    false    188   S       �           0    0    goods_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('goods_id_seq', 134, true);
            public       osamylov    false    185            �          0    41196    images 
   TABLE DATA               0   COPY images (id, id_good, img_path) FROM stdin;
    public       osamylov    false    191   L�       �           0    0    images_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('images_id_seq', 476, true);
            public       osamylov    false    192            �           0    0    names_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('names_id_seq', 62, true);
            public       osamylov    false    190            �          0    41204    orders 
   TABLE DATA               z   COPY orders (id, email, name, phone, comment, city, street, house, app, id_delivery, id_user, "time", status) FROM stdin;
    public       osamylov    false    193   \�       �           0    0    orders_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('orders_id_seq', 43, true);
            public       osamylov    false    194            �          0    41256 
   sold_goods 
   TABLE DATA               I   COPY sold_goods (id, id_order, id_good, numbers, id_variant) FROM stdin;
    public       osamylov    false    197   ײ       �           0    0    sold_goods_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('sold_goods_id_seq', 61, true);
            public       osamylov    false    198            �          0    49489    user_access 
   TABLE DATA               8   COPY user_access (id, id_user, access_role) FROM stdin;
    public       osamylov    false    202   ��       �           0    0    user_access_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('user_access_id_seq', 17, true);
            public       osamylov    false    201            �          0    41168    users 
   TABLE DATA               p   COPY users (id, name, email, pass, address_city, address_street, address_house, address_app, phone) FROM stdin;
    public       osamylov    false    189   ѳ       �          0    41212    var_good 
   TABLE DATA               1   COPY var_good (id, id_good, variant) FROM stdin;
    public       osamylov    false    195   ϸ       �           0    0    var_good_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('var_good_id_seq', 67, true);
            public       osamylov    false    196                       2606    41186    cats cats_pkey 
   CONSTRAINT     E   ALTER TABLE ONLY cats
    ADD CONSTRAINT cats_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cats DROP CONSTRAINT cats_pkey;
       public         osamylov    false    186    186            (           2606    41294    delivery delivery_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.delivery DROP CONSTRAINT delivery_pkey;
       public         osamylov    false    200    200                       2606    41188    goods goods_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY goods
    ADD CONSTRAINT goods_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.goods DROP CONSTRAINT goods_pkey;
       public         osamylov    false    188    188            "           2606    41228    images images_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.images DROP CONSTRAINT images_pkey;
       public         osamylov    false    191    191            $           2606    41230    orders orders_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public         osamylov    false    193    193            *           2606    49497    user_access user_access_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY user_access
    ADD CONSTRAINT user_access_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.user_access DROP CONSTRAINT user_access_pkey;
       public         osamylov    false    202    202                        2606    41190    users users_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (email);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         osamylov    false    189    189            &           2606    41232    var_good var_good_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY var_good
    ADD CONSTRAINT var_good_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.var_good DROP CONSTRAINT var_good_pkey;
       public         osamylov    false    195    195            -           2606    41295    orders delyvery-id_delivery    FK CONSTRAINT     u   ALTER TABLE ONLY orders
    ADD CONSTRAINT "delyvery-id_delivery" FOREIGN KEY (id_delivery) REFERENCES delivery(id);
 G   ALTER TABLE ONLY public.orders DROP CONSTRAINT "delyvery-id_delivery";
       public       osamylov    false    200    193    2088            +           2606    41191    goods fk-good-cat    FK CONSTRAINT     b   ALTER TABLE ONLY goods
    ADD CONSTRAINT "fk-good-cat" FOREIGN KEY (id_cat) REFERENCES cats(id);
 =   ALTER TABLE ONLY public.goods DROP CONSTRAINT "fk-good-cat";
       public       osamylov    false    2076    188    186            ,           2606    41233    images id_good    FK CONSTRAINT     q   ALTER TABLE ONLY images
    ADD CONSTRAINT id_good FOREIGN KEY (id_good) REFERENCES goods(id) ON DELETE CASCADE;
 8   ALTER TABLE ONLY public.images DROP CONSTRAINT id_good;
       public       osamylov    false    191    188    2078            .           2606    41238    var_good id_good_var    FK CONSTRAINT     w   ALTER TABLE ONLY var_good
    ADD CONSTRAINT id_good_var FOREIGN KEY (id_good) REFERENCES goods(id) ON DELETE CASCADE;
 >   ALTER TABLE ONLY public.var_good DROP CONSTRAINT id_good_var;
       public       osamylov    false    195    188    2078            /           2606    41269    sold_goods sold-id_good    FK CONSTRAINT     |   ALTER TABLE ONLY sold_goods
    ADD CONSTRAINT "sold-id_good" FOREIGN KEY (id_good) REFERENCES goods(id) ON UPDATE CASCADE;
 C   ALTER TABLE ONLY public.sold_goods DROP CONSTRAINT "sold-id_good";
       public       osamylov    false    2078    188    197            0           2606    41274    sold_goods sold-id_order    FK CONSTRAINT        ALTER TABLE ONLY sold_goods
    ADD CONSTRAINT "sold-id_order" FOREIGN KEY (id_order) REFERENCES orders(id) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.sold_goods DROP CONSTRAINT "sold-id_order";
       public       osamylov    false    197    193    2084            1           2606    41279    sold_goods sold-var    FK CONSTRAINT     ~   ALTER TABLE ONLY sold_goods
    ADD CONSTRAINT "sold-var" FOREIGN KEY (id_variant) REFERENCES var_good(id) ON DELETE CASCADE;
 ?   ALTER TABLE ONLY public.sold_goods DROP CONSTRAINT "sold-var";
       public       osamylov    false    195    2086    197            �   �  x��V��G�9_ѡ^'>~é'`N��֔��++p�3q:�h�3����_��z=I-��뽪zG�����������/��b*u�3��x�������/����_����Ͽs�4w�ڏXs�ݼua��}5Z�1��p�=�Ϯl�G{��F}��Cm�t�������>Ky0�z���g���΄5�koX�B��vGh��9�CX�[�܂:N�.&2sX��a8��;���8� S���S��Sn\���~�W���d�Z��aE"�}�s�(a�fWNz�@VQ<G���2�:L�0����KX��]O��͋�L�/��0|����_�&��4�t�� �����DL�r~�j�^r5��m��Kq��!fB	���)�fWN�
*t�X�G�p��C��TC�F3���h�\9�9"M�?� h��atM8BFj�S��F�3fV��qHe��^��(�T�����३�i�������re���`�ߺ��~�a	�sx�5����
L B�Ψ����S�����zT����2�*lc) e�-���OȌ�Sy^)1e�#�RW*�Y_p��I�`,�m��z@e��$3��X�J��60AA�V!��ɚ
��a�^(X���}j�ioKc�a(��Ӽ`~�8���.���k3cr����ͺfq�ɂ���Y׵���׊�ɔ[���݁Ge[�I�2����[̀�6�!���5VTd�D����)��*&<���O�1���:�A�<;�xԢO�1��������"���>P�L@��M�2��&��e:F�Q}���ǼdY��]�uG.�l���E5j!�ӹ���j�I�T��e4���M�
�FS	B)�������(𽋨��+��Aꆚ+�k�ͺj�N�ba;k�&,�!�ƀ���{g�S��4f�ڝ"�M�g�v̚M�+��]R��9C̵���XhxB�#+gؖvO�=C~�����3W{�b�ݝ<Px��>Y�ūG�!���e�n&��-�kڱ<�a���\l��V�&R�VPsf��o�t��񒁷����ZVF�bԡ>!qZ���u�m�o�yW�v�8�Ab��V�����k�Ƃї|�d%uoK-[T]3�調s�3�@�-��B�^}��[N���I�����      �   �   x�]�1�0й9�O����L,L\ 	8@S�Ebab�#T�@�Mz����$��v���u���xZ�Q�QpGP�9*�bI&��T�
:4����f�y1k�p�Q�Q��"�k����<����~�k�V��c9�5�����-\���Ȱ%�kZ�<]�2[owf90�| �/��      �      x��}�r[ו�o�)�]5SR7H�~�3EJ�E�5$m9=���(XB	"� [�1ŋe�-G��8�8�#����d�yH`�����$��m��D2ݙ�tU'
���k�˷������s#}=�N{=������F�L���*=L[i����l�������i��<9���m�|\K����c��}�?Z�Q�iZoo*��m���Q��H�p����ߩ�?��������������ʩ�J�:�O���~��E������� �t�7�,��7<T�˷�*e�k}����~����(�:��;�_Uӆ~�'�Ŗ�f�'��6��?�W���~h/��K��M����O��D���k֫�����x}��@?�6�I��zg�X^�����?�5�?�������O��ӆµ9�?���I{�������3|�H��#^�~���W�\�#�&zۏy{�bM^�u^_\"�9|�I��{���o�-��6m�Y"x6�?as@J�z���s�*n%�[�obW���^G�PZ�W׫�?y��+��e�f���?:d!P�Lp/-퇽��O�����,����/�SW�/TJ�����J��������I� w��o��;$(U�&|���_&�م5P�����O�-s��`:�Z(�A�~��р=���#C_�k�仢��4m�_���ޫ{����(��p�q�v��o���A3ҧ�*���y�����H�w���_J�JB�T*rtva77h�_�q��@�Z����8�ת��������Ȼ�tk���z�e.jV	�Y�u����0�������Zd��G�'�&p�:��������k����´�Q�w�̓$t=}s؁-��G=��8�5�c�k�]*��[9��@Fj(#���J�u�\�+�'��/�����5�3�������Bx�j�wP�z�����v92�ſ_+�R�+K�|z5�GG���/e�r����(� ��#��g���93��0ЉuX��n�9z�6��B����Z�?3�R&��Gx�M����=��kK?�>F�ʻ�-Ó(0P~�(�M��	,��ѴAM|=ܱG� j�Ӊ�Ò���ezLv:���p��D���Y���sw�X�.��n�
�byy)�ӂ���zGMߺ��r'��\(����%Z�4l�����O5���a�A��.<[|�pK����p��|�X�>C{T�U�Sc��������u�*p��낑(�B����_�b�N�����+�Q��K���,�����1z�v�`(>O���~�T\�#qx��^���=�#y�N�����7��]�]��h���^�c��?���^���������a��Fn�|Jt�j�nl�P�ǆ^��/w��� _�����]L��V�� �u����>9Ҡk�`�I[ ����!��u|{}�=z���M<�����G�j]߬��\�S)�Z-���'G�s7P!���'?[,��OA֐5�(�S��[��D��d�n**�(7�H^��8���hO��LƄ��n��%Z��_�KË��n���^��8ݻ5��?�kB.���>q"<$�d��L�l���u���Rq��ʝ�Z�����qx����J�J_�HІ�u���kC�;9������y@�� _�&�\�#y��P�>7���O6�(�����J~yU�i�����v��9�Mt�}w����l�Y�����;>����V�[S&Q:���w���T���h���ĵ�IT�Rn��Dw�6���"F� $��$2ܠ�V#Ũ�I/8A��0R�����ࣁ�ۦ��8T�D���q7���v|q\_?�Z�Q�a-pp����aW|�L���,�6}��RM..�,�siZ����)����ߦ����\���oү��# �ϼ�$S�x��`�X��=�U�얳/>2#ކ	���e��+�$M�i��� �{!�k�&X7M� ����$��Xj�U�̜B����!rp�QE�`�H�������3����K�����iui~z�*�b������@�p��uQY����x�	"g���ʟ���6Z5\,}��{��v����0�:Fェ슼@b�W��@�-��9<��P�v�s�qh������{���S�x�QU�\̆Uϡ&_ c_h�D�P����Vm?$�I�T�E@#��l�[v�Ƚa��n}�˥P��Ҡmʃ��c(�Wb�R/�?�X��þ�<��u���)8+	ިaŅ|
����Uy�]�7;�K1���h���3մW�_넝$��'�F��x3�p���@� �#��oͼ;�.ޘ��H�կ�׵[�n�z�hd�*� �p�=~�0b�6c�up��+����� ��)����.J�@܌Q�ߐ�1F8c� P؍�#�AG�Ud�C1��a�`d�u�'��hp�by���-�.����7d�B{ ���Qs���T����\~R�1iP�L
Z�k s��z�d?"���l���G0.n�$�Ink��hw��*r*-r+���$0V��b���6wav�ڛW����P ^�/��//� <� 0p��[� �N���p��0,�Hz'p#^S2L�AnJ�T�^�7�(Z�7Z���������0��O��j����DQm�P���eX/I�Z�l#;
�(j�+�p�љXǥJ$st���sJ�>GmV��wf�rA,3��V4�����D�Fg�@%ǜ�	���g-Ek5,>=lw.�Np�'�;���y��u6]4#��?�H�O/\���0ma����#N��B5[m�����;������	:�H���7�iC4&��gd��� ^g���t�%��.nr�J�Na ��SܩM	�S�Ok�D���_�,� )�����s������WE���<�m2}Z�X�7Y$���o=Po�N�"�E�V��O�,��kz�&��'����&�l1����<�8�N�T��:��->��	\֢�H8=XV��y��.���eN��:��H(�1�q�O�	uT3-ׇoqL���|��z�$Wcχ �#/� �N�Ys��OzZ��;ms4m�_Nc���D�i�2cM������#�Ǌ=u�G����q	J��8��D -p��D��j�H���+�)�,����oM`�c�Ԫ!Pv@���T�S�\Q�5@�7PuD��r�.�&�;+�yM�����a��O��	�2�m�Q�x���V��K�b	\!ֶ�J(|2�'�������Z��wH;�i�:�ć�-*�W%���W�UF�+{,H'�(~���.�j�|���"�Q.� +�?�D��������t�p��Cgt����P��s�bg)�0xUf�8��Eճ炔I�'����Y��9Y'�y��jx�-([]�5�bOg����X߉�앹��)8������}��x�(���a�8��b��7?�<���57ք!}47s4
7�� #��{���xX��d��Pa�k�3VUP��u<�[rx����~n9�"�C���f��0WFX���ȞxR�6�	PQ2й%� ��]#�9��I�;���-�L�7�h@�l���s�X��I�v�<����V}t�l��O3<>|"��1s����<(�@� �'Hͱ�g��.k�)�X��� ���f���Ov�bW�w�C�,ab��)ѴZt��6��s�`�k���Z,,�a�B�Vp��1ȉ���u%xI J�fǁ���k+�Z(�*|�/��xM���	�:��b�F��8���%�m��g	@C̳v�|=t��Ej�O-�h��R=��rpN�:DV��c}�����Y�!�J�XL���+�[������J���3B�p�*4pU7���~2��%9�kT��	�G_��+��0n�/Goer:ǒ�E験BvLu���.��1�A��s>�[S>�Ѱ��nۏu8 ���$�^x������/�cS���]�#:I���b��%�Y�l0C=DrN���3��8ie����	``���V��l�Ί���c�    'z)���CT}l�(�
��[J��2%��^����y��NShc�O5�r���g�����f޼j �A�ki�|DA����h`�_��ÑI�RL�/�;�r�*���P��M��M�C�ٞ}��/-���]����:�l�ĉ3r������v�!���&�`W�X(�\'�F1��e|��V�J]/�+�h,�U�pD�B�����
��	�Mlp�5���{�%u�\��c�V@�#�fl�v��p�����^�m#YL����4������J~��$Kh�8���VqY�9_}J����Y�&�֐\����5�z?���el��,�V̾��|أ�,Q
�	~����R��c<Û&��|���!�.�W�C�*[O��Hx�3�$�9$��{v��q �d�T�:ޚ䎰�ʡ�n>�<�L�K�h�k:F1��T|S"���g�A��w&s�?[�VG{�W5T\�%��cCN侜�CѠ�߇�jx������j�x����8��Q�)v/��Y�y�Lu�?ƫP�UADC*NA:y[���p�a=s#���l�W�ҍQ��v#�kU[x�f/Ydyށ����s���	x1�A:�J�#�|	��q0
Qf�_����86�䱽1π�	�y������K�>9&v3&��b0 ��ǣ�;na��@P{|�^SZ�r�
V�7��o������A*�M)o8��Kh؂5�(�QSsSj����r�^r�#�l�C7Y�vfaj'&j��e��X7�m44>�L�d�(�Rh�'[Jnj���gܲ)�7�1���q���9� �z��;�cd�Z��!Jlbҙ-��a4���t�#����&VsbL��O'2@+>}�q�r��NnSqژ���pj����S9kXz������Z̰�_{���j
���'gf�W}��E��m��2���EXA�9�I*F�߄B��|�@q�����xX�����式��D֑y�h��"�'Ď܁oY�n�_��M�ݫd�1��gG|�*��dtB y���.�Ԥ�%g��j���*\�}	{��j�~�\���z�F��	XJ)�%����g`|p�9�lw#6v��æ���G�u,���G��7ٔ�W���g��!yH�RQu����X�E.`XC�g/�E����.
�s�b~�Tf�˷�L�AS!���C�;<�K��R�k&a$�*��e/��3"j�@��u#a���-����]u�RF�`���@�x>�6�5oud�^��o��p����R+k���[k��r�'E3~�2����_S��v��|]�p,Β�En��$�ܓG��[J�b�'V¹^�T�`�&q2D(l;9�	B�ˈ�	�Qd�L-R+����~��F�d�'�1ۂ]3Q��:%7u�����2��q�7~q���I0��k룷`ƁMz�R_"���Q��@`��0�%�d7�����y��R5��q��}���T�[���<�GB�9�K��%;�Z�!{�����m)�;J�L]�0R��.���������{��d���d.�ת�r/��KlnG�| >�����B�!�K2�I��0 �`Y7��p4JF:��A�M�>4�W<ܥUDx�X�V��M�.��h����͙SUBb�[gJ'9������<�\���K����>�3m9�u��:{`�;a�q2G#�C|�`�n�g�0����ɸ�%|�,�����
�]?5�F����;&�x+)������l�?%�ΨƯ�7�$�^�w����C0osD��zvu���Q:D�p3z��:�Kw ��I󽜘���'��ޔ�;Z�N��7�9����<fD�-�E�'�!z�A�HR@ִ_{V?'��������k��3�Z����N����-le��+����z�
�ڊiB8�C�;�𡣕5�a'��@�M��3	=Z�V�-��ĥi&�ۮ׊6~�Զ�}Xo;։:���r�T���*j����u�RVW�#����/�A`^��n��ܥ��hQ��_)T�����/�����
Ք��nZ=�k<E�n�'�t	�/H3֡���RC�}��cn2p�Q����X7����d���N���y��>g� eʎ�|\�C�'}��wpǀ!�g.����Q�fM?�h��Ϗ��jQ����$�T�6��;��? Ǭ�,��U��֥����eE�`��$�K����������;7j?�J��!��O���Ë�]�%�M�U�/�	��;�%�¢�_��������w�/Oϫ���3�?4�y(~������*��^%�K���`���_r�:�qO� $u8o��0�adyLЊ��ɩ鋣�1@�פ���MA!��|�rE����\�D!�cǇEN���C"ڶ�����A=��I��cؚ�@��[t�ݘz�.�=����&��rh$&b�7�,5˓��v���`����U�dN���i��'d��d{���/�}��1d
.\$�o���n�2p�����mK������<�����e���R�I�\(G��i��R�Z�.�w��^_Y-�U�ŊJ_T�95��Y�����1��YM}Ӏ��~b*�$H���{� �S���>w8s6��\Ed�X�5W�ƧN�����9���ԌC�ԫ�g-��q�Ė��>aJG,=[��$�l�%^ADt}tt���ߛZA�R�m2��ל�HD�Fc�4����صt���2���5��4w�e����v��@@��b��ψ����i\"���++z��+A��ٯ�^�W�@5B�b�:��x 2P�#έ5R.~��{H�4Wb�������Y�55�]�����(�d!��I�1��-��L�H�����ֈ؅�m[ȃTs�X�c����td���gKpG<��N��/��yVr������k'���?`��=3;���?7~�]QB�M�<lrjb��b�!.����.8<������C��H�5���`���|cI�{��|8`N
L8/G9��,@Q�b�?X���]&���߾T�g�;Q�ޗ���x���j��Fep�O�7t���\�K_��BS��B������4V�6E�t.pc��%�i?�
��/�2�_y@�cw�����ߝjPu%��^��}��o���yORrT�tH5���}���B%O�QCplҷ�g��#2�X>oSl�^~F\~�D&��ǆ;oQ�7>>�[��H�[.�-���J�n� ��,J�:�+$�.�r�5a�Y�|�(Z�#h�ԑ{����Ift!���^ƶ[��?�gm��Sw����R*���R��v��aӦ�>��ũ׎qyF���G���}���Ƕ�b�}�h��TA��ŭ
ۛ\�&��w�^��+�BI]�߻_\�����E�Yu#Q�i�Ig#�:�C>#~
�4��cK�o!�]ၰ�N�hh)��t���iT��*����OX��~�m����Q��aK�w�"�5s���h���՛�['o�qO%��T╿ڇ���5Pbӌ)�+)e�?��b9O�fB*�k.i�]A:��4�Ѫ&e}�qY�PȰ��^��Q#ڴ���Q����N�V��d6K�
>*�R�B�M��=�&v}�y{�r�xD�vM��J�����T𝕅�Iuy�_�����Z����\�s���T�xq)v���xI�Yl���e����� 0�YXR�Ē��lv�Hm�@��O����1���6��������h�6����@��;r�68�Lk_e1z��tl�-�����=�.O��:tY[^���r�ޚ���Rް�=�M�k�IGn�s0�}�Sl�<�qa��ήcф^���$��ݕΏuۉ8����
�a^�&�CFq�x=��H	j�H6Q��tL����/��y���m~����y�R�?�l���[����o�W�Wצ'�����^5����.��]zlj��~�v2s�~7�{6��WR+�lL�X�D�ol�é�x� �g����ܷ��B����I�H[�tJ�    �T3@�X���,@ٽѡ�~~��N.,Nϫ��NCZ���W��,�-#Ή8�~s������꼛�5ʊ�MW�O�P�_��=�Gm�t����_��!G�1����Y��g5<�����aI�x���.��>��U�ο�Ά�:��:C<$&B_3��J ��wO/�rߠ�R[#��]-�+W�u���;�R�;
��Ӵ'$'ªLmf���roq��&s:�ǚY0D��q�L�C�������Ͱ�R�
�i!�H��{��Զ��U��c��<�@�;�x��g�O�m�7E�|���T��SM�U��S�-]���3^���ku���p�-Y�&�}ӿ�Nڡi
�����A%`͗q����)f�h����<RTq�t"ϱ)�]�8�� �LiwӘ&"#h=�&�����SK�o����Vp��i��$pHe>�o��,|�˰K۔�N�k!B"3��ǝ��`�u�{*����[�ʏ�km|�틂��=���L/���s�=�jlb�{�N)v�q����e�X+���2��ͿVs�
���	��L�i���6s%�N�:@S���8Lmo�t1QT�����tL�I �ĸ�z�0skø_[\x'��h]�=����v��͛�~P�]������oR�1O�P���RZ�������3{�@�y
�q�	kbkq(FD1����m�����pԐ�9h��%|�v�S�P%��	�->h��L r��n�
���o� PB2׽����+�̣0��?t2�<'�R��135 ��j4;%���mn� ��(T�5��B��r��yX�#Ik�j��7�`E90��0?�qI�db��uabcM/i��➳�Nh(���Cۅ>�&g3}
\��a�2z�z��}w�&]؁%��"נMN֍�ub�F�Z�
T˞�*�v�zAa��!`R�"�*`���EY?�ma�@X�]-n�_>d���f�6�j�pU]͗
�We:Lq�7�P;h��ZY��� ���8�L�J
d)�g��-%�>82xb��h�!�����~L(*h���I,Z5��}>���j���&��>A>�� |���/��o�M�ץ�|��G'R�k�����	���#�� -��%��ʁ�:�n��/�
�&��U���{7j!���@_<=�̘]��U� �Y��ƛ�B��#}�!��藏c��\d<@�^��9�02<P���㣚s�E��b��.�*QaH;7���x~A�kwmS�F�tK0{BʼK}&�~P^�<���@��7:Kܰ��'��*��q􆡼B��?\*�>P�a"\E�h��v�����F�����(����Z�L�w}vn~Z͗o��@_I��W1�H_���4�Eo�6){͹�9{Ms�X#���c�;Bޠ�*՜ԕ��O�X�~	�姝gś过O�H,��`J�Sg I嵈�`�I�[z��гWWbl
��W@��%U� Q�>3I�~@�j��	����'ŪP^M_*W
�"��&�R�Wu�W�l��ǪIw�3$�,D�cKk`أm�]�QW"���"�AD���H8����oc����0R�å�ҧt���H""�&�H��mF���&<p%�Ԡ^Ű�O���@�_�v�����Ӡ��JA�ՐL(�Xz���H�ig��t\�͈%B�4tx�˂$I�b/��qskT:$���r�)�3��P��]���t5�A&�vݘ���ح�
�E7���B�+�t�Q3퐸޺�7��1o�wѪ�,
����"9���I��U��Ԏti�!��&3��nRô�'�p,Dj�N�/�:�?d �ԵH'���Ic:�ݏ�K��c֚�e*3iPni���NY�{��
�{� : #� ��B��θ.�#亼��窛��:{O
��pO��dO0C��
"P���|I�/��#�Nn&[c������^������B7ҠJ��L�mD��Sù?S�F*
h3r�m�1>D3��B���������}�RXY)����@\^^�W%��v�D^:�)Z��JM����'�q��g�055H��ţgqY�Ԓ�7�%0Z�2eˈO��T�sN��q�_�:$X�C"@ڲU��ݟP_cow�g�D�K" ^���@^5�s�Nh�aYH�tPZ�R��sgÜΥ6S��O�x�U�)��U��Zf9��\�`z�q�n�cf��U��F:�xs_D�sY�ϟ8����D�43/%���70�ș2<|
��Q���G�;�CM6}����JaY].Au)�S�n�N~dMH�^=�3�JQ� �@���@Ρ��|,�H_8j�y�{s��;���<��PO`��AH,�E�61�v��� ӱ��~X(ys�M{�s�x���!�.C1Դv�ѥ�D�g>�>���2P6���Z�PGN#��ڗ��@��hpj:s�b�+8j��~�qLV�)A�N(T%�y^�^[."�|+��u�}B���P�
��aN3�8F�yk1���u��a��DB(!-'��H1����$�!u�zTݦ24!�mda����
��"���@ug��#���D--t69}�r�B���;�a0J�B���[�C��t�?������%z�L�bx���'�Sb`([\|򣉇�@��W�w��n�	?Ȳ�M�N������:�&���.B漴L���w4���5�E&���DM��uH���F�{R��v�<�I��<����t���� vP�I���sҝN�V;�x�N;���&O�Ւ�������"�e�k6�>0̌����� es��׿xF��i���q`z�cZ؝��6S���k~��Fz�5��I�� 6tB:{�Gu}�T��1����W'߻8��c�p}r�m��N�[�����5
�c��\�������2�A�p۹\��ft�Hc�d���ݻ��X�dN���п�y;z��-itf\�'ɭ��ۉW�,�Q�OĿB��/#��2�"u��k�sN�Ѿ��pp�ކ�����;�#��Qa�P�I��1M7)�8h�D =6?R���:�z��z#���,�}єY�(V~�=�q�<v!�	���`<;�I�7&&�&[|'�� 2�U��v�ĕUm�ӫy�MwŨ��Ö�5�]��h1�`�[7��qo��.�=���
���X*�+��B�ժ�>�;�!�u@���u8�?�y�Y�p���K��n�VOs?��%����m�	ȅpr���'G<�
�i�Dp\j,�>���L�V�SyC{�Ň���K��9�"\N<h�7�#R��e���0=��$�&8�G9�������]�����̵i\�\v�9i}S��FRkjbe8/����Z����e��Ǉ!���:_�'�B+�_�������_�EJ��_���3��5�O�%@`K<�����I�m�iH������j6���/�nQ�ZP��y��~��R�s7�A��?��}cK���N�u�[�_\}�X)�[�w�?�*n���R[�C�ۋ�$ڜ�a��	�ذ�C/�[v�`ň�$VlM^+��{��1Az��r>�J7��w?r����3��iN"7��ݵ& ��gsd`��̐`����gv�Ĺ�#h���/�~��ץ� �� =z]ʯ�G���V[N��;�����jh�������i9�J�5�o���������N����ܵi�_�O�C��1�#��#v冺R(�����\}�PQ��˖����%-����M��ߡ�Pt.3�R^$�K(���g �x����b�(���Vi���r������ʓ��y�u��0FIu��"�/lD�dԛ%�@c�?L��Ԑ{�bTo9D�T����t��#-����b��;ƣ�w]K,�nӒ�]�4w1C�O�{ssrF��_�
�K0Nޖ�ݼ���[Q�U�`�I�E��$0��U����~�{��E�Ͼ_tsN��y٥g��[�ڴE	5�������SU��f��GG\i��;�d8W�5��m�V�
����
���ve��1����P*�[��I���̗t.��/:/M\dϣt�U������3u��@cm0%    q�F�������p=�@+�dBS�s���4�Q,"%�ҡ�#7hC��ѳ�-S���r��jK �U��ؙ,��ɋ��jjv������.-���(+�g���B�ӗ�**�.E��b����ff�4��ԇ�+�N<9�+|���*Y�l��|�Ѻ�J�⢨�s#Ѕ��HN{D}
b{�V�q]���R�����K�D�)��궔h�a�yxA��Wg�}��A�_��u���a9=�64ҹ�C��l���f	c���Sh6ɘ��at��%�`UA�@�x�=��&�V�����1^̸�N���b�uzd��P�i�p��*����������IW�_��o�91�g�������x`�s��8�٠����e_�1�>���3�-�]�n��:�8�~/&��w;�j�:̗��Ŧh��{	fts"/%��a��!���j*�\ʯ�鞕��emQ�1h1>=yI�=����;�����
jp�-�G�>�0i|�A���n�8�����:M�ܴ<��~�U�(nL�!����ۙ�4Ν8Q�sIQӹ����[�@����4����A���.�O3u�HZ�n8A��,����y���(ö�������ʶQ��@̜��J�wju���͘�qA5|ɊHn�YLQ��A�����:�{lM���ڂ�(�ۂN�N��> CC�o��l֓BnV�q�,û��j�vA���}l���x��y�2��'LB��~t2�V��D�匹��38t�����%�`��e�z��YX.�<ܠ<C�4�U�iӖS���i�-T�a�T�����&1>�H����~�wp��3o��V���@j����)�E�Ôo���-ǝ��G4D�2�K��� d�̦ ��Ĩ�<i��vڢ��~�Y�ܐYjId
�,W˘����gjo�fU���WKP�b1x�����F��q+��wi0�Y�F����j�~a��~qI-V�
�r�����;��!�"���j��O���l'v;�a�"�}�q��y��v�d���;��ARoN_��V��{�y�� �x� �^�UԖ;�"�-�+r�Hg隌�>v[PQ+1"=�.m�j;$���iREC��R�$�˩��cMƾ*U�_]���6�+A_$\aBm6Ӥ���������S�>6�&�w����������9�>3��
�үMM$�M�$i.�3|��z��Jo+~��(��8��+���l�28u4���&߬+�-vS�����γ��|��_Z��w+���=�k*31�'��1�0��07��TCߠ�>���.U7$�C1$�1��o�M�nW���VV�ߪ����K���ʃ8
7���u���4f}B-��l������=�|�]���h֠	�V*�T�����/�L�5��%T���p�J������,/����B���r���z��[�8?�j�6����=ܙ��[؃Nr{S!�"3��s��:�!�tx�@�[.�K��6�M���>�(;b�+���b�]��yMEݖ��z�ܳZ��J�/��F�f*�S�.������Gd�qI�� a/d�ݛ65��g��/.æ"F��3.Sl�dM��X!<RSk����I�nM�:)��H�H��3�p��G}|t���<�G��������w.M��7�7�� �7zR�ѿ��E�)���I�[SMm�t�sJ�N� h؈��[^�<�����4�=7�5e��?��\�8���p�ٱ�wmm{"[�&�yQ	���r$�3��jj�Ⱦo��5hS��,H-�SN�g�v�L����F(1�R�:(o�_]��l��*�~?_�{fe�c�����B�{1�v9��"�����]���Y郺������R�|� �X��C1��"Q�!LY��C԰���h�*5��vӇ̘��Q�ѡg&���c�����4.�)�u���`7�4��#q�ysvExk��ǋ����JN2�֩��0m=�u|�'܍Ҏ��:К�k̪�.��> u-�V��ƨ��]��@�ξsmt/�-���"���B����&�NXQJ+5{n��v�ܥ���C�)=�u��6��@'���{7yD�����*R\lǿ�������ՠ�b�-�LcB��Yi�ˣ���Uf�W���_[�N��Åu�>��l'h�Mų�;���Tg�2�Z��#�M�2"%Trml�@-],�K�E8���GZ^[X���U��+5��9jt�Ug���sQ��WѦ�N�K`���A�L,�5��0�הk���vU-����~F����l��7Y/0D�7�w.�k,z%qD�˩������3
M2�ת4�ۢNE��I�pnvx����c	��B��)>���[$!-t
lm����ˡȀ��9�a8$O�Z��V���m�KF�5S�ӫ������"����#���4���A����v��M�O�B15���a�/]��W�����˥�.�1z��<x�z��.�V ��%�Wփ�T��V���|��}B{���i]����@#�tU'Z�G5f��	]G��3�(E襳v��|��5�Z��ж�YI���{t�T�˅���S�߇ћ~%�<��|�b�bS4��oY��`�V?G5�L����v^h2�Ӝ{��-7�]�0kF��
W�1��P2��� � #&7^�M�N.,.�S�"#Mq}̘p��D�!�/��6�E�.�E'�a,9o��
�F�v�2645�e���%qk��fM&�p�Ґ(�B_S���T	�fz�h1�f�eb>#Y�T��J����o�YU�]PS��I�����|"��`)�̆Q�q�f�p�Gm���#j�G�44���@թ3. tK��_�|�;���� /h^����.�~�P�Ӡ�#F��@x�?fl�-߶���S��)+{�pF� �$�H �L�������Dg��r*:�Ô��Q�e� ���N�ym�gq~��⌎�z��e3�� ��i�o|5{�гXɣ�����!����ԭt/�N�c�Xw��9ka��ڃB���>�3�g��������Hd�6~O&͕1!������VG�k���SqF�J�;8�[��5�>'��ap��ɪ)����
��|"il�rW�r�����9��T�8����"�6yƯ��n��1h;��\�o���m��LcX����M(���@��F�O3����J	
��R�Y��� S��v�ƴ���	�ւV�R�WV��K��2��˫�J���#N�H����v�S؜T-���	�mf꼤I�<'86W�S�ͦ�:�U�>5��衡���V,�V
����{��jqn~�
��޼�h�������a���m�낫wS6hS�(����Dd�#�a�)���G?!R�L�9jKւ�&R�j��R�&)�+��S�@6�S�Y�a/=�ˎj����y��a�YdԱ% H5�L�(=f���xo2��y���e@>�l��"�&���T:QPDL�������>z�s�|�i?��j�S� �6�b?s��e@�᥻�LnK�})Rև���6����q�}n�0�BK�	m��������Ğ�a�C\��ؘ��p�j4��m��xGǟw�,�0cj7��&2�Z�djե��
0�+�������7�ۥ��
B���n\�SS��(<P�
yb�ы� /ˎ2徿@9}U�>ň�G:�E�V|����� �2�0k� �LnEǏ5Gp�3>qv�~hb�}��6���Z��H������_�C�:��jv\���L�v��Yד'\-
���j�~��I48{�ÑI+�2����ׂ����1&ȀLZʝ�E/�W�>���!w~Y�̹1 �̽�r���p��1���[�x�l
���1��n��뙮f]��kc �Cc"r�6��;�JV�x��'K؜�	������$<X��R�x_�]\��k�	/s�g&<I�
��o2L�?�?7�*�"{3�a�$H�9P5.0Lu�o�?f�G��y+k&��ݶ��PP����Z�������>�Y���Ɛ3Z����!�Rk��A�    TZ��"�[������Sn�L~�qFU-�7�-�(����𜘚=D_���J�,u�15&u��-/�A=��G^�L��\����yw�e���;ޕ�1*:�{K_��4����K��̼	r�z�=-"�x �R ��}�CLZ��:��Nb�_S3O�Q w�U"L�<�4O�tu�z^!�NC���j��%èŻ����$3��+K�a��� ��ZkN^[����s5�UZ<\/�HiK�O�=� ��>N�]p5��ma��%J4����sjM�0LT}���S�l6H������<�pG$��:�� �ح-��w+��st�T�D9Z��VR��"TS�	��6u���� �\��طg��ȫ&<1�Ϣ�1�ۃ5mo(�t��2��tz�m�m��ke����T�IQ�5�uAj���=tw�<%W{v�	�A��W��1���\'�^\[Y-�S���ó�ujz�Spj�_K�h1o�7G̰�#$~fU[�_[T�HV��h	�\�=���[��� f$D�t/d��>� ���7hZ�W;�)�pZU�N�7d�!�>	�1B��-�:�6���<�C'I��q��:ލ+�꿰#����'�Fbv�tx�H�pS\6��ى>p��@' �y=�wOv�l��̌F$w�(�`��1��K5�RB�IX^/n8l�[cV��
���B��4��׮Ik�;f�A��XeU)�N�"��XWf'��b��tW]//?��C�6�s�}o8����F���opM���}��6��<b
xf+[YRT4,M5�߶RɅGT��l��P���&A8��<�z?���4OVDHT����a֫��y�n��"�O1>ܳ�!�d>92� ���B%�s��x�&f��Q����2��B�N�v}�j��3q�(e�m�X��j�Ͱ�f@�����Uw��lD��Ze�%�[�@��>B�Z3�FA圞�&����JI?A�Y��g��P�1� 235�W��K�UgIZ1��t?��@�N����\�mm�}	엙(�Ӵf��eۖx|$���t�i��ʽ�Z�_ɓ:����)���ȾN��mi@>�#:ֆ�ƶ�� p��	H�4;.�w�	C��R�������F,�-�}�U��W�Cͫ�Ӡl��'���
��{oSյjK�`��F��j�IQ�cn���C��f�M7E.	����)H������фp|sŋ���pq!+Ҥ�ԍ���?��)�x����D��O�S1�	���Ng	).4 ��KܗĴ�����K"'��<fn q8)�hkI�N��(B�t;�&2n�o��P��u���L7������	���~�i#;�9�F��/#gP�[݄��{e!��^��Y���U ���stQ;��~?Ȥ��$Zz��b(�g�3�&*v$�ǦD�%�$��_'�H_�p��k�F߼�����Ґb=���۵�FK����,5��m|m���5����v�P���L�i��sH�n"Z+�-Sނj�L�m������J�v�gY
\A�L���8!��YdD��zGm'���e�w�*׏�T�5Gg)�S`�v��]�w�m�n�#��Kd�`�p��je���~dz�T����#�����i�{��ꨒWJvo�{ܲ!a�\-��5���^���|7��w�Q<�
}N�E[�m�� �7Gvu;_!��ͭ�5eu� ��Ä�l�!���d8�5p��-k����6�S�"Ol2`�	~)o< ���~�R���T����G�f8(*O:����"�7U�ף��\n�3�ƺ��B�T���q!��t��3��P�z�q�*��C����cH�����2SEh�m�+^`7�:��g9�C�G`*�ְ�"��b�'�3ꞧ�:-��ڹ#��^
�[���"f�?�� �$��r��D���9���wx�mɓ#-��h�������=?��ϭ�t/�+֯M�Ro��G����HæR�N�!��S�������(����n\���D�0���@�WD;�^-�ʷ�@��E����j�����h���~�-씴B@�K��Z(���/78|��}pz�A|˓��b�P�YY-~PVS��uE�/��簅�)�a��4�D,��N�A>Lݱ�U*��0S3��Ȥw�� D�����_��Iĭr!aC��"�Ru*8
���S�f�{��$��Y?:B�n�4GJQ��f6��uR�h������9M���7u5�;�g�ᨗ�,�E�|!@1�G1zf=�	�2�11���JŅv&��^?�K�ช�:I%��i?��5�wڒv��-��L���T��9��<ۂ�������:�J��T�/�V�����
�X\�/��A_�>�fe������w���\{[{�.Y��1�g��@[�#�bi5V�m�7Ai�s.�
-�qQ�o��՟}�
�\���*�G�f:���¿T����yؑ�O{3�����8E�pj�ڛn7@;Y��~{S�e#hJ�r������X��n��uF��|lս���,ϲG>�S]ej}���4�'�1pð˨��	Cy�a�t	�;M��͵|�V.��y��}�̞�KVb]��#|�m�t���<g���ؐ-�v���E��!R?щ��՜���"�h~�Kv�ݛ��nW?�~9�~���[j�m��0�9�ʩ;�|IB���`q~f�?6�-����\�Ձ�DRu�X��r����=������&��uzixu���L[�a�{��ƴf ���n�o�?��,rL!r=��m?+�z�C�4�t���Gj(����\*�ӊ�4�П�4�Un&���;l��e8UB�y���`��Y�W����wL�7��Y�����Y�Vgvv\�Qoɜ�R���fsC���E�%���`u(W
J��l�y���������ZR���Ҝ�� ���h��|�tI��m.�x~ݷ< �H�c.L'�gXweD�P\_��ݕ�O��0U<I����b�^R�Go�2��Jn;��L����3V�{#��q�H˷!��F��bz�pE�6H:�7M��`
"��P���?���|�R3�:O��?Ջ�c:��U\ʗ�� ��@?=��o��(~���Rܼ�))*����T�@pkc�⇽s�5NZg`��NUrݾ�FP��>d�1�>)]�Ȓ�1�F��yٷ\���F�i����f�[��L����i�q:4�s�!�k��0oO?������Bh��2��d��S��8i�7��e}M����ֆ`Վ��Ps�z*��7�]x�	k�����^8��!����́PjQ�Hq��.�N�7X(���>�ЉK����yOi0�8;u�����5�0��uڽ:��<1!B� �P߰��St/�缳+q�a�A��@�<�>S�嵊xd����P]�<Ȇ��3q�̝!�L���P�4��M���p.!����Ǧё���QC�q�=u����%�7����L�d�R�:�����f����jkjl{�	�
O��U�ؚ:(c>B��63xJm��=j	D�5�T)Io��n����A�I�حr���g���D��\�'�̆q�!-S/�K�y��k��H�#Ss;�6(��^�O�A��d�:r&�N����w�]� ��۶,��<2=�A��t����(��d�pʻ�:��cA�I��6-m�x1yN��c�R{�;�q�F�%�R��9N'�~��<��ӯ��_�suez�Z�>=}I���wGI��g�L��?�tX���v����@ߤϑ�4���l�H��+�wjrjnvrQMN��]��S�3����c]��IS��gYSMcq�9����J��>삝����B����a�4g�̝�_�Ez�y}N��V&��y9ڌ��S������I#{��ʉ��ڱ�K��Bǡ�4���H9��,`��ou�yr<��Qal���-��:G�Y爳Mw�5�(_`(��`O�ɋ�Y�@���n�"�����ܘ�]�^���R����Hb��Ks�n�W&�����\��� "  |9�}ȳ8&��N�	��4'���A�$Ji��?4��$R[� ��v4Y��z�̢q���E:2�b���Z,Q�s�=gRҩ��W��.��3#,�m�&�U�x1Z]����������[��k���P2>2E��9`�sZ�%�)��ɷ��������y�E����GƑ,d���x��Ø�����_�E�i"�[���817������|�;�L�������� V��hz�B�&j�<m�aZz��'�`�8���_�����v�����rc�����\��,�|lL����Z��`Q%�c�c�|�X��@߅���N�,>J����52(����:�o"���thk(;[+���&^4��=nU��s^�x����\��qT.X?��d2��m�����5n�aA���e�O�w���
;;�VE�Patl|�G#����u��ݟݍv��jrq��zoT��X&�/����-�]ʩs���N�5����K��e=��nKű���a1"#<�&o�F=�ţ�ذ)�)�k�쭹x,f�]}��Al^��@A}569%��T�v��!�p��f�Hؿ[(-U�ԓ�X��!�\|��0���������.�M�	����
ㅉ��R�N�	K��:�g�FG� �	�m�2��DM�R?j
�#�M�v�̒���6O[Q#;܂��W#�Kȳ��p��i�57�&R	��A�����1��������D���-��D1L��W�09;���܀�H~48vn����C2�ܴJM��[�6dw��]TSk˷��}����۳5��j�~�p��M�R���h����ʉ!ݰ���t�rOT��,�r��R^&�CN�n�S���������QꌽG���R���	9D*8�����R)��%U�X��%C�LG�cu��\� �tmSC
+d,a�K��zD+����	'CRj>D�t�������:�{2�n�o��ѢsV[؛����N&�T��)^�s���g��+s�r�8������-΍�����'�?�я�ݴ�-      �    	  x�}�[�$9��]��߲dYZ�@?�����az��q���P�SU�+_d�Nd�6��ǟ���������o���Z_�/����~���������ߋ�9�9<�����9�m�9L9,m�sx��l��a�amC�a����<�g[�YFZmy�^1l���j#�f��i��V�����Ռ�V㴚I��j�V������L�V㴚�Ƨ�8�F
g;�B�%c�7�*����|ϳ�bKfT��EX���ó�W \!�?�H�вI��j3�тa�D`�����L2����YL��L�i�W��U��&��9{�X=.6�Y�@�2ʽ̒!�`�`Ƚ��&���+籂��%L,^0�i�٫i:�,��݈K��M�����@2�䊙sĩ�̜��Y�3Ϥ�B��0�\M��	��5fZ������y��8�+�F^�R� ��F�'M0���!�0�=s�a\��ȴ���@hQ'��ܓ0$a��\jU�-��SX�����4A��gR}�FP�C�L�(N�F@�T"H7��A7P0p��/Z�g�����#��B�%����iM�3�,mq��q��.c7�w��aA�=*��~P�S��C�� �T��b$K'��y�*���B��aB4�U`Њ�<�j�`x'�L�fm�}|�5cƼ`�V4��<�/q.��A�D飚�&l��=���S�gw)��W�B֤�Ffy�4_iۭ��Ԭ�#�Cz!��v0�`�z���j��G�0�p���<��F*���Y2�r-X��V����X�Y�c7Vc�f`�{V�6F("�	F�g0���{C�\b;4��#ݿ�#j4�L��tE�+�+)䶈P�Y2s乴�1t��,�YMτ��ϙǲ��Jae��g�<�9C���*�������C]P0����)[͓���g��D����}&ȧ���j�-Mi�g8(B���!o���x����@�>#p�<0b5��H==�J����2������+��(��W0W��aEc���``�3<�9Gn��:�s]5�v��{TQ�Z�5D: z�
BxF�I^����ط�F�\10L��%d�YM*-A4�	��h>+]S�>:�u�!��?h�*����K�%��SAZ� �SM�v��?U�I��h�*A������S� T�6�����'�fmo�9�}�y�B�FZ�+-P�(�BZ�qs�>�=�6F�)��9Ά�Qm"8L�d^A"(H���k2r_��x0���-ׂ��y3s�\ HH�+�RR���rH7�r�/cЩ���x��p�
�܅�W�q%�j��)O�����[�u/I��]�g�J�2�A͕�갆rK����
�`T(vy���m3(o�����nF*�'AV��2#Їa�-*���A�o�~�����͠�{@��^M�ݑ},b��*���@,�5BK1b��g�˂B���eW�ͦ���Ee� �XAX.��%�?ο*�z$��=�v۵m}�c?�$������
��=Ě͗����hNk�`�$��ك#��k��j���#����3���d�B"��f������h��/�^MF���Z�{�X�X�rHƂ��ە�я�4���W��K	��٠�� @�8�6�j�� ��*�� �p 0��Ɗ�&-!��Q�X@�R� �5?|	�~��=�{�h������h���d[9����2d�74J���	?\�V6rORB}��L��v̽!m��I��κћ�d�!V�Ѐ=�0"�z`^c��}�1�J�	�ys��}c����p��{������x��v��؃�!*����	�/�Cx=��&��C��5՟`D�i�#�����-<8���9��ڭ^$�����A���?h��ب1�Q����NPȄ3�@{����'g���E/�ܜLk
���h���'�q���P�%�| �3�1��d�D��nJv.��J2��#�6~2�!�d�+8�`c[i��=W�Ԙ;�	������%KL�є�}s�C��_��`Vc�Q���!������[������5���X�ZX�!ꔎj66v��]�)��\�~g�YàP�������1�p�g6����>����6&��Vb��㳛C5G��`�X���ۥ�k�Wp|�sa��7��0��\��E����L��bC־�����,޲
D+��l�qQ�B%d+��\��-(\��I�E����.���9��(\�k����o߾�M���      �   k  x��U�n1]{��K�jF~�s�;$���hڴI���4]T�H��**$�ӈ��G������IC��P�ؓ�}ι��7:f���o��6/>v��wk������`�����N�a�0�_%d��Kŕ�t��(�U��)4�sۅ1�ځ�y:�3��c�d{�����F�/t�&�d�(�cY�IiѼ�������C��wZ�gk7:y3���/+��|�E�Qg��<�)��CA���`H�����=��t��BG7x�W�׶o����0)�iZ=�pgBeJZ�D�R�h\=o�T6���9&mg��Cu#�1U5�(0B��[M].s'���P��.s+���n6:$��P{8�y������݆��V��@	c\��4�˔�S�D��cD.H�VL��I��(�E�k���\s:?s��'�k�.L�U�^��L�@���Q�����/j
�ЕT��k.�B>G.�E�VS��YH��"�2���Dh%��qB�7�ꖺ'��>�}�\���4.g��>Z/||o�z|ro�-dUʕ�0�������H��Qω�(wI�j����Y��(:�.���8:�sj�2t�Bc��W����c��/��
<��	�e      �   �   x�M��!D�̖|�$6��?�d�=L��n�vh���E��H�i ���b��n
�䔂(�&�),)�DM���< 6]+S�ke.z�RM�U�Պ^��k��+qRW�U�1���Npށ;� �U�!��,2:ءg����d�֦�]3��'�J4kqg�;�4�>�qʿ~�� �r�CZ      �   #   x�34�4�LL����24E0�LsNs(3F��� 'n�      �   �  x��W[S�F}^�
?�P�c��e���6�c&``�"lI��2�/�O\������t�R
m'}���/��Q�]��M@��,�Y��w���d��|�����
�9>t�ݟp� %g*v������KY`4�jǳ-&���1[K2�37:[��bF��	�)��Z�1�6�t��'����J���S���"���8=�(�k�5lG��S�r$��V��L�i6*͔<:^�F��b��5PbDs��f�!AD�����`�Bp��(����]sW��� �
=���
��5�l|g(�2�5���\5�*J��c*�U���|}d���̴c�3�J��>�Z�b!�gT��9W�)>�{�6<oq<�ۘD�_�H|���+����BC�􁕎f&�cm>36=�$�T,ʺ�y�+Nd[a�:����V#�N��I��.�����i��~w�|2����x���� 
����q��V�a�����6��9�j5{H��{��AI�B� IQ@W��Tȧ0��4�n�K��_Hw�ħ�Z�S��>@��������y�}��Xf�� �]�%��wf��̒Yuj���� �/�H�R�B�.2�����P�*�=5��e��=T�q_��8��<��qK0 9�xI�XyP� !N�#QF }N!R�o�F����OPôL;_�Q���UJЅ��?���$�F�+�|�ys�x�0#�!��T�'A��6�v���t�*9_E�]�ή�!�Q���J�=�&��&]xKmND��}��Rv����_]3!,H�RI��X�����]Q��@��0��5~���m�s@���:*]]E�rgY�q쥳���(�mI`�@��t��/�ל�n6���B�]#��C�kDr�3z���$����W(*D� �<�:5���i���>�O����O�՜.f��K�*�X��4>�T&�ѡ9#]��c1vr(ٜ�GH"»�K�u�;��S�e��m���i �������$�L��z��Kr@o���V�i�$ț�Pl���3
$p��Ƀiz�o�]��r�?>�R�Ȉ��Q/�iG��?p�"�g�J���"���0KR�CAU7c@/TJ�C��F@�u�SP�w&�>���;��#X�(+F�S	���J  ���=���R1m�W����x����"I�C{��k���v7P�}�ƺ���cX�g�8���,����_@/��̄�y)��O�@ �/�Ia      �   Q  x�u�MN�0������]X���JAb�W!E���9��F�LZ�N�"r�͛�7��@���z~���o��O�����-��� C���V�o���As}}T&�����0������V�H���hєNֈ�\:<�vO�a(9p���36��ɢ������90�2�(���4	|5A������Yl������s���)����A4�&^@�F��i���u-6�i?n���v�6r.(ut�F^Z��4�/�-���A2��3Ȇ�R�~�q}�y��G���������0(�g��<Ѽ��e
��(�[�>^jhW��	4�ˑ��&�wJ�?00�     