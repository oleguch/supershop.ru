PGDMP     "    4                u            osamylov_db    9.6.2    9.6.2 L    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
       public       osamylov    false    3            c           1247    41341    status    TYPE     �   CREATE TYPE status AS ENUM (
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
       public       osamylov    false    186    3            �           0    0    cats_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE cats_id_seq OWNED BY cats.id;
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
       public       osamylov    false    196    3            �           0    0    delivery_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE delivery_id_seq OWNED BY delivery.id;
            public       osamylov    false    195            �            1259    32824    goods_id_seq    SEQUENCE     n   CREATE SEQUENCE goods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.goods_id_seq;
       public       osamylov    false    3            �            1259    41196    images    TABLE     k   CREATE TABLE images (
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
       public       osamylov    false    189    3            �           0    0    names_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE names_id_seq OWNED BY users.id;
            public       osamylov    false    190            �            1259    49530    orders    TABLE     Q  CREATE TABLE orders (
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
    status status DEFAULT 'Принят'::status,
    total_price integer
);
    DROP TABLE public.orders;
       public         osamylov    false    611    611    3            �            1259    49537    orders_id_seq    SEQUENCE     o   CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public       osamylov    false    199    3            �           0    0    orders_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE orders_id_seq OWNED BY orders.id;
            public       osamylov    false    200            �            1259    41160    osamylov_goods    TABLE       CREATE TABLE osamylov_goods (
    id integer DEFAULT nextval('goods_id_seq'::regclass) NOT NULL,
    id_cat integer NOT NULL,
    descript text,
    price integer NOT NULL,
    badge badge DEFAULT 'none'::badge,
    name text NOT NULL,
    price_wo_discount integer
);
 "   DROP TABLE public.osamylov_goods;
       public         osamylov    false    185    574    3    574            �            1259    49539 
   sold_goods    TABLE     �   CREATE TABLE sold_goods (
    id integer NOT NULL,
    id_order integer NOT NULL,
    id_good integer NOT NULL,
    numbers integer DEFAULT 1 NOT NULL,
    id_variant integer,
    price integer
);
    DROP TABLE public.sold_goods;
       public         osamylov    false    3            �            1259    49543    sold_goods_id_seq    SEQUENCE     s   CREATE SEQUENCE sold_goods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.sold_goods_id_seq;
       public       osamylov    false    3    201            �           0    0    sold_goods_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE sold_goods_id_seq OWNED BY sold_goods.id;
            public       osamylov    false    202            �            1259    49489    user_access    TABLE     s   CREATE TABLE user_access (
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
       public       osamylov    false    198    3            �           0    0    user_access_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE user_access_id_seq OWNED BY user_access.id;
            public       osamylov    false    197            �            1259    41212    var_good    TABLE     c   CREATE TABLE var_good (
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
       public       osamylov    false    193    3            �           0    0    var_good_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE var_good_id_seq OWNED BY var_good.id;
            public       osamylov    false    194                       2604    49545    cats id    DEFAULT     T   ALTER TABLE ONLY cats ALTER COLUMN id SET DEFAULT nextval('cats_id_seq'::regclass);
 6   ALTER TABLE public.cats ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    187    186                       2604    49546    delivery id    DEFAULT     \   ALTER TABLE ONLY delivery ALTER COLUMN id SET DEFAULT nextval('delivery_id_seq'::regclass);
 :   ALTER TABLE public.delivery ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    195    196    196                       2604    49547 	   images id    DEFAULT     X   ALTER TABLE ONLY images ALTER COLUMN id SET DEFAULT nextval('images_id_seq'::regclass);
 8   ALTER TABLE public.images ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    192    191                       2604    49548 	   orders id    DEFAULT     X   ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    200    199                       2604    49549    sold_goods id    DEFAULT     `   ALTER TABLE ONLY sold_goods ALTER COLUMN id SET DEFAULT nextval('sold_goods_id_seq'::regclass);
 <   ALTER TABLE public.sold_goods ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    202    201                       2604    49550    user_access id    DEFAULT     b   ALTER TABLE ONLY user_access ALTER COLUMN id SET DEFAULT nextval('user_access_id_seq'::regclass);
 =   ALTER TABLE public.user_access ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    197    198    198                       2604    49551    users id    DEFAULT     V   ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('names_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    190    189                       2604    49552    var_good id    DEFAULT     \   ALTER TABLE ONLY var_good ALTER COLUMN id SET DEFAULT nextval('var_good_id_seq'::regclass);
 :   ALTER TABLE public.var_good ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    194    193            �          0    41152    cats 
   TABLE DATA               +   COPY cats (id, name, descript) FROM stdin;
    public       osamylov    false    186   -N       �           0    0    cats_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('cats_id_seq', 31, true);
            public       osamylov    false    187            �          0    41286    delivery 
   TABLE DATA               %   COPY delivery (id, text) FROM stdin;
    public       osamylov    false    196   �R       �           0    0    delivery_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('delivery_id_seq', 3, true);
            public       osamylov    false    195            �           0    0    goods_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('goods_id_seq', 134, true);
            public       osamylov    false    185            �          0    41196    images 
   TABLE DATA               0   COPY images (id, id_good, img_path) FROM stdin;
    public       osamylov    false    191   �S       �           0    0    images_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('images_id_seq', 476, true);
            public       osamylov    false    192            �           0    0    names_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('names_id_seq', 62, true);
            public       osamylov    false    190            �          0    49530    orders 
   TABLE DATA               �   COPY orders (id, email, name, phone, comment, city, street, house, app, id_delivery, id_user, "time", status, total_price) FROM stdin;
    public       osamylov    false    199   �\       �           0    0    orders_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('orders_id_seq', 45, true);
            public       osamylov    false    200            �          0    41160    osamylov_goods 
   TABLE DATA               ^   COPY osamylov_goods (id, id_cat, descript, price, badge, name, price_wo_discount) FROM stdin;
    public       osamylov    false    188   �]       �          0    49539 
   sold_goods 
   TABLE DATA               P   COPY sold_goods (id, id_order, id_good, numbers, id_variant, price) FROM stdin;
    public       osamylov    false    201   ��       �           0    0    sold_goods_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('sold_goods_id_seq', 65, true);
            public       osamylov    false    202            �          0    49489    user_access 
   TABLE DATA               8   COPY user_access (id, id_user, access_role) FROM stdin;
    public       osamylov    false    198   �       �           0    0    user_access_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('user_access_id_seq', 17, true);
            public       osamylov    false    197            �          0    41168    users 
   TABLE DATA               p   COPY users (id, name, email, pass, address_city, address_street, address_house, address_app, phone) FROM stdin;
    public       osamylov    false    189   ?�       �          0    41212    var_good 
   TABLE DATA               1   COPY var_good (id, id_good, variant) FROM stdin;
    public       osamylov    false    193   =�       �           0    0    var_good_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('var_good_id_seq', 67, true);
            public       osamylov    false    194                       2606    41186    cats cats_pkey 
   CONSTRAINT     E   ALTER TABLE ONLY cats
    ADD CONSTRAINT cats_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cats DROP CONSTRAINT cats_pkey;
       public         osamylov    false    186    186            &           2606    41294    delivery delivery_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.delivery DROP CONSTRAINT delivery_pkey;
       public         osamylov    false    196    196                       2606    41188    osamylov_goods goods_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY osamylov_goods
    ADD CONSTRAINT goods_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.osamylov_goods DROP CONSTRAINT goods_pkey;
       public         osamylov    false    188    188            "           2606    41228    images images_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.images DROP CONSTRAINT images_pkey;
       public         osamylov    false    191    191            *           2606    49554    orders orders_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public         osamylov    false    199    199            (           2606    49497    user_access user_access_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY user_access
    ADD CONSTRAINT user_access_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.user_access DROP CONSTRAINT user_access_pkey;
       public         osamylov    false    198    198                        2606    41190    users users_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (email);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         osamylov    false    189    189            $           2606    41232    var_good var_good_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY var_good
    ADD CONSTRAINT var_good_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.var_good DROP CONSTRAINT var_good_pkey;
       public         osamylov    false    193    193            .           2606    49555    orders delyvery-id_delivery    FK CONSTRAINT     u   ALTER TABLE ONLY orders
    ADD CONSTRAINT "delyvery-id_delivery" FOREIGN KEY (id_delivery) REFERENCES delivery(id);
 G   ALTER TABLE ONLY public.orders DROP CONSTRAINT "delyvery-id_delivery";
       public       osamylov    false    199    196    2086            +           2606    41191    osamylov_goods fk-good-cat    FK CONSTRAINT     k   ALTER TABLE ONLY osamylov_goods
    ADD CONSTRAINT "fk-good-cat" FOREIGN KEY (id_cat) REFERENCES cats(id);
 F   ALTER TABLE ONLY public.osamylov_goods DROP CONSTRAINT "fk-good-cat";
       public       osamylov    false    188    2076    186            ,           2606    41233    images id_good    FK CONSTRAINT     z   ALTER TABLE ONLY images
    ADD CONSTRAINT id_good FOREIGN KEY (id_good) REFERENCES osamylov_goods(id) ON DELETE CASCADE;
 8   ALTER TABLE ONLY public.images DROP CONSTRAINT id_good;
       public       osamylov    false    188    191    2078            -           2606    41238    var_good id_good_var    FK CONSTRAINT     �   ALTER TABLE ONLY var_good
    ADD CONSTRAINT id_good_var FOREIGN KEY (id_good) REFERENCES osamylov_goods(id) ON DELETE CASCADE;
 >   ALTER TABLE ONLY public.var_good DROP CONSTRAINT id_good_var;
       public       osamylov    false    193    188    2078            /           2606    49560    sold_goods sold-id_good    FK CONSTRAINT     �   ALTER TABLE ONLY sold_goods
    ADD CONSTRAINT "sold-id_good" FOREIGN KEY (id_good) REFERENCES osamylov_goods(id) ON UPDATE CASCADE;
 C   ALTER TABLE ONLY public.sold_goods DROP CONSTRAINT "sold-id_good";
       public       osamylov    false    188    2078    201            0           2606    49565    sold_goods sold-id_order    FK CONSTRAINT        ALTER TABLE ONLY sold_goods
    ADD CONSTRAINT "sold-id_order" FOREIGN KEY (id_order) REFERENCES orders(id) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.sold_goods DROP CONSTRAINT "sold-id_order";
       public       osamylov    false    2090    201    199            1           2606    49570    sold_goods sold-var    FK CONSTRAINT     ~   ALTER TABLE ONLY sold_goods
    ADD CONSTRAINT "sold-var" FOREIGN KEY (id_variant) REFERENCES var_good(id) ON DELETE CASCADE;
 ?   ALTER TABLE ONLY public.sold_goods DROP CONSTRAINT "sold-var";
       public       osamylov    false    2084    201    193            �   �  x��V��G�9_ѡ^'>~é'`N��֔��++p�3q:�h�3����_��z=I-��뽪zG�����������/��b*u�3��x�������/����_����Ͽs�4w�ڏXs�ݼua��}5Z�1��p�=�Ϯl�G{��F}��Cm�t�������>Ky0�z���g���΄5�koX�B��vGh��9�CX�[�܂:N�.&2sX��a8��;���8� S���S��Sn\���~�W���d�Z��aE"�}�s�(a�fWNz�@VQ<G���2�:L�0����KX��]O��͋�L�/��0|����_�&��4�t�� �����DL�r~�j�^r5��m��Kq��!fB	���)�fWN�
*t�X�G�p��C��TC�F3���h�\9�9"M�?� h��atM8BFj�S��F�3fV��qHe��^��(�T�����३�i�������re���`�ߺ��~�a	�sx�5����
L B�Ψ����S�����zT����2�*lc) e�-���OȌ�Sy^)1e�#�RW*�Y_p��I�`,�m��z@e��$3��X�J��60AA�V!��ɚ
��a�^(X���}j�ioKc�a(��Ӽ`~�8���.���k3cr����ͺfq�ɂ���Y׵���׊�ɔ[���݁Ge[�I�2����[̀�6�!���5VTd�D����)��*&<���O�1���:�A�<;�xԢO�1��������"���>P�L@��M�2��&��e:F�Q}���ǼdY��]�uG.�l���E5j!�ӹ���j�I�T��e4���M�
�FS	B)�������(𽋨��+��Aꆚ+�k�ͺj�N�ba;k�&,�!�ƀ���{g�S��4f�ڝ"�M�g�v̚M�+��]R��9C̵���XhxB�#+gؖvO�=C~�����3W{�b�ݝ<Px��>Y�ūG�!���e�n&��-�kڱ<�a���\l��V�&R�VPsf��o�t��񒁷����ZVF�bԡ>!qZ���u�m�o�yW�v�8�Ab��V�����k�Ƃї|�d%uoK-[T]3�調s�3�@�-��B�^}��[N���I�����      �   �   x�]�1�0й9�O����L,L\ 	8@S�Ebab�#T�@�Mz����$��v���u���xZ�Q�QpGP�9*�bI&��T�
:4����f�y1k�p�Q�Q��"�k����<����~�k�V��c9�5�����-\���Ȱ%�kZ�<]�2[owf90�| �/��      �    	  x�}�[�$9��]��߲dYZ�@?�����az��q���P�SU�+_d�Nd�6��ǟ���������o���Z_�/����~���������ߋ�9�9<�����9�m�9L9,m�sx��l��a�amC�a����<�g[�YFZmy�^1l���j#�f��i��V�����Ռ�V㴚I��j�V������L�V㴚�Ƨ�8�F
g;�B�%c�7�*����|ϳ�bKfT��EX���ó�W \!�?�H�вI��j3�тa�D`�����L2����YL��L�i�W��U��&��9{�X=.6�Y�@�2ʽ̒!�`�`Ƚ��&���+籂��%L,^0�i�٫i:�,��݈K��M�����@2�䊙sĩ�̜��Y�3Ϥ�B��0�\M��	��5fZ������y��8�+�F^�R� ��F�'M0���!�0�=s�a\��ȴ���@hQ'��ܓ0$a��\jU�-��SX�����4A��gR}�FP�C�L�(N�F@�T"H7��A7P0p��/Z�g�����#��B�%����iM�3�,mq��q��.c7�w��aA�=*��~P�S��C�� �T��b$K'��y�*���B��aB4�U`Њ�<�j�`x'�L�fm�}|�5cƼ`�V4��<�/q.��A�D飚�&l��=���S�gw)��W�B֤�Ffy�4_iۭ��Ԭ�#�Cz!��v0�`�z���j��G�0�p���<��F*���Y2�r-X��V����X�Y�c7Vc�f`�{V�6F("�	F�g0���{C�\b;4��#ݿ�#j4�L��tE�+�+)䶈P�Y2s乴�1t��,�YMτ��ϙǲ��Jae��g�<�9C���*�������C]P0����)[͓���g��D����}&ȧ���j�-Mi�g8(B���!o���x����@�>#p�<0b5��H==�J����2������+��(��W0W��aEc���``�3<�9Gn��:�s]5�v��{TQ�Z�5D: z�
BxF�I^����ط�F�\10L��%d�YM*-A4�	��h>+]S�>:�u�!��?h�*����K�%��SAZ� �SM�v��?U�I��h�*A������S� T�6�����'�fmo�9�}�y�B�FZ�+-P�(�BZ�qs�>�=�6F�)��9Ά�Qm"8L�d^A"(H���k2r_��x0���-ׂ��y3s�\ HH�+�RR���rH7�r�/cЩ���x��p�
�܅�W�q%�j��)O�����[�u/I��]�g�J�2�A͕�갆rK����
�`T(vy���m3(o�����nF*�'AV��2#Їa�-*���A�o�~�����͠�{@��^M�ݑ},b��*���@,�5BK1b��g�˂B���eW�ͦ���Ee� �XAX.��%�?ο*�z$��=�v۵m}�c?�$������
��=Ě͗����hNk�`�$��ك#��k��j���#����3���d�B"��f������h��/�^MF���Z�{�X�X�rHƂ��ە�я�4���W��K	��٠�� @�8�6�j�� ��*�� �p 0��Ɗ�&-!��Q�X@�R� �5?|	�~��=�{�h������h���d[9����2d�74J���	?\�V6rORB}��L��v̽!m��I��κћ�d�!V�Ѐ=�0"�z`^c��}�1�J�	�ys��}c����p��{������x��v��؃�!*����	�/�Cx=��&��C��5՟`D�i�#�����-<8���9��ڭ^$�����A���?h��ب1�Q����NPȄ3�@{����'g���E/�ܜLk
���h���'�q���P�%�| �3�1��d�D��nJv.��J2��#�6~2�!�d�+8�`c[i��=W�Ԙ;�	������%KL�є�}s�C��_��`Vc�Q���!������[������5���X�ZX�!ꔎj66v��]�)��\�~g�YàP�������1�p�g6����>����6&��Vb��㳛C5G��`�X���ۥ�k�Wp|�sa��7��0��\��E����L��bC־�����,޲
D+��l�qQ�B%d+��\��-(\��I�E����.���9��(\�k����o߾�M���      �   �   x�e�=N1���)�Ek��qo�p�4$)�"��%���@`)�$gx�^蠘������P=����S}y2%���6��{,<�a����tw�[j�Vh�	�#�ll(��V
�ʹ�{\�>��#�d����dJ<�O�.��||6���<��N�ߘ�9|�}j���a�[��'O�u�O,3G^:��,�c���H�������FZ)��ph      �      x��}�r[W��o�)�\��4�x�)QmJTH�r'�J�,��l[�#E��eGn�rwO<n�-�=5Iu:�yH`�����I��m��9 ��$�tRӶ	�\�^{]����
��\�����V��=���F��_��j5n����{�-������89���А�w{�q#n�m��D���\�e����=�m�6{�qG��n|���]�Ħ���|!�ԟ6��Ɔ���v����p��O?~:\U�&{��H����W�w�U����3��m��'���}
x���߼7�<�{'7<2�����[��VVU�B��H?����;��)�t]�/_�>��܍����c�ߠ��K��7����s��C��s㹱�^�=�h�A����:��z��K<S�3Kt�#\.���r�?����������QK�~���;������k��{�o�p�����K����x��E�5��*|��@��Hͮ�ި�����Z���zx������~ç�Ů�f��}���&%vU_��o��=ӫ��g��A�^�`S�~}��P?��I��zg�R[����������Z����O�OA*�
�vY��=��ů&VY����������·�=���t����;�'��x�/�&�/.z�&�Mo[����;,[�D�l�?��@�A9�=I���/񫸕�n�Y��#x��(n��Ñۂ�E���\��|a�^88G,
�	�ţ�hP�CCC���j9���~�^���y���
#����ZqD����p_��.�$�L(�|/��_D%�G����njq��/����ӧ����vd^��'��
h�+
�.��C�K8�z���@���mX�6�q�q�v�������3r��*���Ii�%�+H�w���_J��@�Z���$��hi�"_�q��(�Z���k5Q�����Ȼ�\ky�ix��.jV	�٢u����(n������q奄	���3U��8w㊚�^���F�l��I"���9��6�ဣ���b����Ë��.������l #M�m�zOA�ºn�#k������}>9hGѬ�كER��CT�m<dM�;�g�e����x�a����F���V_)���s����$�_���aAy�QpA�y/��qO[5{ZZ�Q�[��$��Qp
�����w
ղ�����̤SH��{��M��&FV�h��]�\� ���ٷ�t��@���Dw�n��>�z������{���~ӑ_:tL"R�gпAۜ|QpLvYև�Ձ=��`}�.�������ղ�\[])���>���U�����-����kp,~�Z�P\�#6�XM���١b�g���z��z�T���x��R�
|�6������O�-�1W���G��.<��%#QFy�k�l�~ux�������)��G�^�����[UW+�k�c������:T|�D�k�����$�����y�?��Wu,���H��e�=�C�A������
�B1��^��K��C����a���6y��B5�l�آ�
�#�h�Y�X a����1�W�ƥiU@Zd.��2R; �T@dM����"9�`�a���#?���o�Oo�Eݎ-��H�"m�u�Kw���뵏V��|�6*!�>�GY�?K;��_���G�0Z��(ޮoQT=)jc���^m����7v�G���lX݇(l�V��W���bFa�W�ĸp�
�F`�욐����]��L���i�Ӑ+LLNdI�R��zg�nm��-Q��baxC�K(\E�����_HX�Gt��ꡨvf0�`�o��nyH��_�).\�y��L�3���O6�(�����ziu#zvp��x����<���nΎ;�h{z6����A����a�wV�[�%q8��w7(3��e�R�k��@�Z�&ܰ�AΎ'��Z"@; ��$�{H�I�P�u�<[py��a,F1��s��㣁�ۡ��HS����ؤ�Ѿ�=oWV�n*�%�ڨ�����������<�>~�ZM//�-�seV���?(�����ſ����������K���>��f�F�ĝ�I��iQ��z+��'g/|�E�	<��ZjO	H���.�a�/������&7�KK�<�C�[�F�����B���!p���� �*i�TwT���s����+�����Yueqv�:EX����Bo�@<������3D����J����Z/\&}^�{��F�C����9A#�g쇼@d�WY�{O��3�0<v�>�v�O�s؀�����G����Ë�
��S"4aC�s���c\�`
-�*�]���Gd�Z���D���p�n90�?�eϰt�\
u�	-�ˎ<�17�z%��!�"�=���&�k�s��^G�֞�S��V\�w o��ِ���hp+[9�?�Eg初�������:G���>3�0B�ϛ���wg�6!��~k��Yu�֌wF��~���زM���F��VE��q�����|�ڌ6�]��[�_Ƈa�w�z�R�����N����܉	B��ڣ�bn���m:|��r �����FjY�}���U-�V��ڝ��/H�y7F�!��w�ӀZ�Vԕr�v��%�k��OIk�6���^!�4��}� L't����N�����ơ��$�	�����"��b�b��ȑ�(P�r��d�.���xs��²Z�����E����յ2�����y?T��aR����&�T��=�-��$�=b��!9"yR�x�=�o��)>0�����O��[��0*oN6���ɂ�DH�l�8�K��.�س��Cv�Ȼ#���9@�a�*����Z����@��j���QIv)���B�o�B��=L�it�q�Y�0�ȓ�r��Q�V����v�)7B�����\g����WZ�㓧����ͅK�F��[!?B��A��ţqA�z��	�$-6�Y�N����xA"8y�`h$��@�ȷc-
.�,_4��%!t�v<�x�D��'�r]�s���9�>�'��
��#�:�o�	��Nr5��^{�.�t'��y�= s��Q�	�8A�7@�閁H�vH�"G��+��n���d�l�1ʉ	�� #X�����ݛF���%����_=Ƙ�=�	.|�ߗ =ǚ0��DP搰}�T���ql�
j#R�rH��j����Y3�~cz���OI?p�PJ(Vnte���#7���X^�U�`����+��!���\o!�v"�����>uQY쒗���b��1��t8����h��Cw]����qJ����?�M�R���_�����vI��{�&�U18nx��>c�/�!(�m�W��g�Dk�6*%��pd��Jg�ĢD�9����a-����N��!�CM�%��l<&�=�	z}8'�N����&%�\?Z��BE�š`>f�Q�c*D�XW~�yy���u1�!c17'�
v|��Q��/��@�W<�i�0TC�#�"����2\1:��6�(n˱��.�#��*p�p{0�I�]�,!�;r#{�I	��Z"<B�@7��\�gv���9��L>#0D���C/�Ƣ�/��Vr���~K�O����.{z��?8C�����=]^o�ݸ�����J,�� <�>l��iq�
�<e��8Rn͸bld@�`:)s���p< �",ƀP�胐�#�O�N��`xp���v��RR�啻�FN	�_^� �T2M+��$N�O��t@ %���0K�*�����>>�a
x���6E��Lw��0r��cI������C���lx�������+A��d)��SK��e84�*�����V���Z��0�!{��#&M�n��ە;�����Jy5@$]�#h�n�l 9�d�D3r�и������s�Q&`1�Fύ���N$�r�"%��(��\�z�зg���YG�"��;�NیM}ׯ�v��.L;ʒJ�Բ��	)g�C����P��mR�-ɣ59��Ðא��M�9�W����b��V�3J)_+�B�a�D��.�    ]�'z�O)��ԒG��،Qf^������=Iϫ��K��M\�F�]�=�1��h1�-�,���P7���̽y���7Ѷ���D��М�ћ�'G��c�N��_�������h��f�]oH]�9�:�/]�����9��y�$0��y��im>c��G(m|��	إ&NC#��KB�q3aO�I�T@�Q7˥z55Z�l8�A���������f��"%���z�^eE]�Ձ������Z�S-/ݭ��铗b�H
#�b�A&B�H���^/�|��<-g�O�.K�6�(������\a|"S���9;�8o��f��g�L'���}t�;��G�X�D�S�"6& ��$$�S<�[&m������AXW>o�ӅzT6�v��V6)!�'DS��y~��d
$�:3��&R�:�|��ʣ�n�#8��g�Kxh�h:@i�/���AJz��
����L1���|���L�W54N�%��#d.g�@Nȑ�N���^�e�5��^�ܯj�"V�%�E*�;�y�}���N&Kr�R �{���Љ]Nv�"��o�&Xϼ��#�2˵�T�\al|8�ƭ�k���_�bɨ�.������� �@�LH��9������m$���D�I�~sq�cwؔ��FL�2�\���)�m7���晖��$��!�3����S��;� ���K�|�/(�I9A��a[�7^U�p���`�:֣�*��O�4��&�@w����T�yy5o/����1Z3�;,v��09��2���I�;�$:pH&�f)�J���#�4�0&�
���*Ń8:p�x�T�tÙ,�$˵D��LꬋV=��_w�O�A$y]���c΅�=h	�A_Ńo��:�R^��ɣ)NN���w^V�8��B�fJ`S�K�g����	����t#p�~_���WskQ@��Рk�H$Ka�����,%��������h����oǠZ(ذ|��W�{u�ql!�Q�!�EiOS09r�g�����v$Ro���(��u����������e�Q���|Ǧ��=����
M����9[ixA6Ĕ�(3�`4�K�C���bV���F���^?�\_�6l�-m�oS)����}�|�Lqz`�������,E�q��|\f5�}!�>���
�ҁʪ�R.�ϫ˥U(n��������L]�wUY���^�@�Ks�?2�<(�xǓ!��&2i��J���R�Cu�^C4`,7��?o�@�:����+����J��jm���zkc�R���ZF�\n�{��k�S�^[����V�EX2����{ڨ&q[	�O��J5sݍ�����8������� ~O��T��с1E���Z"]�Q�Ȃg��+u�&8~ĸ�\��(����	�̎���/ʶ����C�΀��5\��zk `P�$�O �%"��R�:"����\r#�N���?�-OSu�Ԛ`�[���"!U�Ǯ���;�)�)-���O�g�4{��l�^!���o�cOJ��c)e�vK��a�&y��p̩A�7{�i�'<��r&��kuS�WZuO�$�R9�>������́�%DK��sXN�t�8��\<ttIB.��@�G��R���*"t;lp+���ޔ��b<m=Ccw���h�l���\�� �"�]��]�&��t�1a�s�-7�%R����w��%�&qx1>:�Ǌ �a������{��-?��MF綗B���^D��xd�L�!@�e�("o/���h�r�e�1�!�J��$'��7G��7x�[Vj"�|��չ�i�>�*�ԫ�x�t[@����Z�L�LN�m�^���Z̿Vק��gխ�wg����� >EnR����WQ7?�a���7R�Q�y�E>E����Y=>Wpb���Nu{�bj,������»
��!I��A�	���W%�u�fR���4zpćq���)e�,E�@�/���{y�$R�,IvoK��_Ru����(��3U�5j��|g�d��'^��L_Z
�Hm?h>�+��SjG�W[^�VL�:����5�_��x"
6�
hD���i<���yOzWaӀQ�;�
�hr��F�4��P�"��L�Њq��Z�-?�3�>�7<7:,���Z�Z�Æ��j����]u�^S�u�T���o
 $/�<v�M٣��0CN�������c��1�������~5��{�tI�����"��lA�J;�N5&��)� �@�!��%��e��3x��61���r���5J.��4]�-�V�s�q9 �`@��s����x�D��{:�B����b%(�e��@��I�����	�7fVF���[Wf6�$���><�*闫���ʊ��o��;��=��G�l!�[H����~l롬����N��X���jqa~~vq�ū�	�<?��4w��LFF��o�X[���N�zPI�Q��s�~����m�y�eq��F\�Yyy��Wpzf��8},�6e#�R�s��ٖ@<?&>`��"��I� ./"���,�q��O��q����]k,O� ��$7�
Srs.�[rIo��g�����"VE����0NӲ�<IQHW0������Oz�R0�'�nB�|�@j�%�i���4�UN!N�
盰�r��3�������-�Y��9�B� �rhm� �QRCJt`��'���1�NVz�k��t����Z^-�~Q�#}d��jS��<i�q���"��[��!���9�~�mŜ-="��N�8a����iQ�i'G�N��ĊU
;��m"�ͤUv]1�A��� =Bq�1��6�r�)I�[V�W+��>�ߺ��7�M]�LU�N�k�y$b���ǘ��R������x߆e���F4C6i���IV�o���� y~��Y��#n����'��J
������A꛸��e.Q���M��.�.��S��kSS�8d��+1}��yq>���	CBN�U�r'� ���h@J:��%R�����a�6���v[݄\|�(�c����tt\(0��~2��Z��_��&�&;�Ec~Ж=�E�=7?��- �⬈�٨���v8	�?jk���yH� �
8t��ˮ�+E5���NҼ�G��S�%3&���	R,�89YC!�f��)�BSj5��`-�q��˸K������Q���_�TK:h�ܫ�����4䓡�\���k������[����cCeT��Hm��34:�����aE�P����-�= ����Ε�q���
TQ��N�c_"�;�ޗ�%�kQ1�xuߒ�vQ��p�7!�=r(�X ��ԡ:w�FQ��/��I��p����:��4@��WR�ޭU?����z��2�"���Io8l�#yA*���`��H���q���1)��-�ٹxt���^b���Б/��l�R�7�h���c�⅐�0v�H���]/��p���}h�a3��d�t�VT?�]n?��h�zA��.w�mq�� 
?8������Uu�t�~e��Zz��^���b�����N�I:v>����^L/=:�$���{��V~����-���i����u�Cu@Z��2�H>�nRa�.���Un��f>ky-F�^�cܭM�gTD�KE^��}H��[&v̘_�tS
;-c	&���f2�z�����`��ۛ�5h�B����',Y7eȁh������X������ĭ��db�|L+�N6ӈ��E��G���-̧pQx�¸1�W������j�wM�fg���ł�R3Ս��2>��5&rE�)w
�R_&���u�zZ~U�5�(b?�� �x���Ʃt ���G�?�-.Ǒ�J�OLO8���2�]���������������5�D�8�|h_Y1ꊒ>��3�c���@w��ߙjI�%����Z����~�^�[v�Gl�p$�8��:79�'��W�D�J.֐�E�o��s�{�\�e[���fEc�W����8Ct?^�ͬ�g�y$�)���=��F�~�O����m��/����E��߫�W    f|���Z�1;����x���T���/࢏9�~���t\u����E7/!g�O�%����:Q��
.�����.��ҁ�O2�/O�dlh�!���SAT����
��Bn2mo��Ԭ�9���Y��A�:���
��
�k��EB3�$K�QT�У�xH�ݥ�(mu$s�|�V�#�uXy졮�U�C�4޾��0�A�E�W�����[̮ �h|l�0cԣ�3&���4��v|���R�G} �v!�t����-r{z�NV�[��>�~����K��ʜ�L�Or7OX�:}�(��"���/�yJVR�'��v$2f�b%��t�2�-L����C�m�A�wƎL;_Tv_	�t�sδIщDW�\� )�b�C�{t����q�	�e*���2!hXk�(U!�/)�g�v���!n��.)o��M�'��.����a��)
m'����&�%v����щ�;\�����6Vo�k?�9��n��]�����L�O����'1�v'��b��r��� ն������7j�^�N	?AD�mSO�c�"�v$�*}�8��~L�b�2�o.��c������>u�`�Cc۷��MJ��v�����D Jw�;�fP�R���h�oc�N2�����R��;ݹ�{��Hz��3%��qS8�.��V�P��������~A=�G6����?X�%�p�NOr;����#��x��|����sI%�x�"���U�\����<�7�}qr�"v�=�1e�Ɠ3W��L,����@U��(�%�f(��;�G��/��4���yNx�)���=�]�#��^�	�\k4v��6��B�E���s%>�����p�)���Zn�'��!]�u��2�-���gұ�T�F�M��.#t�7����}�^P�A�
HeT%��v�e�LP��K������kW�ۻ●�3�A	�����1\W�K:"��)ӯ������AF׾�lͥ4�@��igzR|D��'��A�T+���)t�@����$� wbJQ		�0d6h�T.�M����jm��%fE[>E~�x������l�#��u���.#�)1�zG.�6qk
cTF���21�{�nt~��v��"��<��CCGRAލ��r��PJ^%u0�r���Z���ʇo�Y/��J86[ῆ~�Ԡ�����i���# ����ԜկB�����6�%A��l���m���m�ډ�r�Y|,�|	n�.����A)���V�i6�Ȗ�Q�O��7U�9�ۡ�l����+��j�>�骫<�9]�N�^��x�0��8������F�}�����Z��_Sš!�/%/a�%~	6w0�lcЖ�����5f�5͕���x4��+y}�}��K%x���$�Ր�[��EV��������ļ��7/9ugr�P����w�T����\z�Ƃ��{�:ܚQ����z�D��jzUCی�I�V�x\�(���h�j�^Vu�|7s���[>�_��6dM]+�Zs��`�8��B�9��>Gmv�ե�#R ����,$O��W�[����(E���ԛ���j�-w8�)2kV��0F`yf�"���nx�!��~�5-l�����}2��Z�T5)x�r���J��.!1"1�ӌ*��	�j���@� ]�.�������$#'�4�7�N��QDG��qF�� 4�]YB�֍��d��z���Rc�ֱ�"���>�R�:0�k7 *KR!��V�I}�Y����|,����d�'_���^J���-&cn���4���h�[ZL��ˠ����
�,f�%�r�_N:��5,�شi��[�!�[R����Y}��] �?�F��	^��	Ge|��7 N�R�svT���0�a�������>Ѓ�� ��X^]/U���@��ݏ;��d�T|�>в�zM�2&�	0�܎��.j-l�d$��*�����#lJ��h��ɳ�i� ц����rm�N����ܩ���*?/�\����瑛�4�Z���)�ݍM��<�k�������6�� �ţgq	|�ȕ7�+Y�%�tϔ��}�M��q�ZJQ@"tl�Y�k�bA�?�>���z�B3H�)H�Rh��5�&��)y)B��c*D���0��M�48��5�u�zG2�kG�X��� �~����Ē��a��)����U_�Te0j�?q���U�Ĥ�`��3���&���Y-M��}[@};��W5�����ZyU]�B�ra���Un7Nf�LXu�ޙO�����/4 qd@�P2ǈ����8��*��/��1�����s;��D���b�_�����k?��6��:�^S�\z<��y�I]<&H�,��P�c��Z��8ZTR�9�/����� ���p�O'ñ�����<Po2���Vʹv�ʹ���'��L�ũ<�"T�y^�A[1 �|��ehS!��d:�8��	&zav2��E|jS1��yr�aag���J�g��G�J�k2��#(Zr�T�`�V���gs?��[���D�����g��(��t�Q��D���	���M�Ɔ�&��%�%'䕯��3����b�� �\��o��@�m��<2�V(p�C���<搗��w��	n� ?���L�NA}���&�#���A�tMʜ�w$���J�
KX��DGm���~�wp�a;�?ҢJe�9�C��;�膙���*��
��e(�(@Hҳ��F&�q.^���%Z�ڔH��W-���ع��&J,�^&�bS��?̘���R0gH]��gh<�5J�'M�tL���tx��V,�IXl�/]���H����<)s�nNI���nnT��bXq�I%�>���埩��Ӌo������c	�K��ߢ(AJU�eH���X]���s��}j�m����Ok�(��Ƚ{oLM������"���h��Q�BW����Y�da�u��cp�Y�gH9��Ht�8t^a��΍������� @8,n�f[��#�������0�Q�TE��p!_��/�-R�� � yͧ �cc#UN���MA/�{��>�����9�D��*���'Α��S�7dpS�j
�`<8���7>%���NͶab
�����t��j�8�^�o�+F-��֝r��r���g^��n��䣧�~F���d��P����j�T/����_����v�+=�Fݎc��l� L���JyM�[�]�s\���d� ��wB�vB r�,#F3��~R��4�K��+d���{�|���苏��Ea뷬	�
LN$h���cR���dL����qu���)ΣQ�5�~Y��+��ߞ��1�^��Z�����������f{/���Q-�#����'G!v�)��O��V�ҁ��j+��J�3�E���Ŀ����}	P�+�>��b��]҅����Zj��Ѫ���2�j�ۃ�	�����[�X8��n݀j���'��V�L����{�t���A�^�M���9-��S�#�ۋ�ږ�Q��<	�X�4�]�q�qA
?IZu-�����B�'���ə�],]�8����7����?�����q�i
2�pǊ��dt{��t�=��&z�����e|�����.e������u)�
9�"��:�,Z���]ȍ3�Ԝ�^������x���.��.-�l~V]��n̂O�B
�/t����9�յ[�Z�Z�}T�A��r]ݯ�Z��s���O�7o�7�o}gyJ�YL�?yy<�.��{>=�GҜbv!>�D���ؠ�>Ãx(U*�N+)Ld�FU���Yh͛����1>*;Kaia��S�U�3r��<@���h�=Gi�k98�$����c�#�p���\����{�ŕ��E�]/�F��M�	rokN����v��I��N߃ܱ݊נ*JJ�)�}P��;���)�픿;hi\�����~�G�'{�@�%�[2Q�����~�ȸzo>Y�;>��A���q�	�y�o�k�_ub�hr]�_��<�s�,��.�Xj��r�v!7~~a��ep_��_�[\v^�����t[h�U���m� ��l�i=
%ɧ����ܷ�    J`=�Ok�d-c��r��[4�
,��J�����l�C���WtIf*w��Zm�R�_���+����ӗg������l{����L����Z���g!�LH��E/�h4s6���f�%�%,�9�yN�Wz�?��D�hsnX��%��*)KU�Z6��/N�4��Y�(�ҡ#D����+�{܅�
��|t��^Vo�;R5���Y �Y�8�o������Tܬ-w �9�����1{�e  ���CL��C�I^�G�#} +*����]/�����Pt�
��)��� ��������-m� ��z���Y��y�{�������?��������H�.��mg�S .��E_��?�7%��1���Wv���[^��ML:P*��e���\2��n�݈fƌD
Cl�49�o07b{ھ�T$L,oG�Pn�����ji]���W״�j뇂�A�����+ڭܚ$�ݙ�FDCxӝS�M��I�D��ᧇyj�PfT4�����<� 0�n�=�6hE����sG�BjI̜�ZNcȉ��8��K� �xH��]�;N�N���:h^���|�Y�
)�S&藝$�7��4�J�������a��W�Hٖ\����3i�Mm����]S�	_�<��3�&U��Pf'C<¸����8���{�o�璨eA�J�2qW����	6n�Ya�i<��/�n��^�SV��r��NҹN�:��,�]�3��_�Nd��T��Lv�U2���u�d?K��څ0�dZ`�Y^��נ7ä4�T�S�S����mT�aR��|����>WKz���ۻ8����L�)B͌?��5b�uǔϢWaJ$h��.�c�F��#�� B�E��� �SF �\8Z��
�4��8���qq<��{>�TQʰY��1.x��,��۾`Ցߟ��K��b1|����Ā�Y���q0�X�Vힶ�j�~y��AeE-�7��j������;�����v����TJ��l;l�g����vlFFǌ����?�΢v�ԛ�7�f���� �}�,bS��H��X�lY�(�;B{"��4�m����m��"R�#�i����^-��Z`�ڽC,�wva!U�|�ɠREB�tw�;>Ӧ�#興�8�Y����\M�^2W��s�wǾ�����v�\���_���b+�u"g6�3�/�5��d���"�z�o�� W��/"9��@���Rքt��R��������h�M�>�^L4�\"4�I�rX��K+�KnŠ�@��ifwA%�4����惚f���b� dP��P ��JQA�Cb����>�N���j}M��z����Jmcu�� I�r�e�h�Z_	>��h�����奄��ə��.���U1KвT�U���]�(U�u��}�
�_�P_�:���\��_[Us3��=���zmm�}@�fo�)�o�ڢB+S��eϑn� :>Ȩ���Lx�V���ZDE���1��e�0�@�t�S{��؇H���FX�%=c����k�g��趴�7뵁��}VB|�M7�4� ��o{�gN#�?>&��K�f{�ݴ�h2��8��Ae6���#�3�����٨��V�R�j��I�F��Zx�{��,}�89>b�7���63��8}��+���-j�=9���Z���;�GvডA���'�$�j��S|�1�uK���"P�;�ޅ|���g�u�;�t[<4�0� �3\�ubGv����Z<��*M�c⼨ut`���6�0�ddٷL\4���e��X(��M$������E#47�&]���|���+��6F<M��/�?|e5Γa����B�{1�9�!��G�h���G�.[݃���c���J�v�@��P��덢��}�L���#ԭ{���h�L)5���G�h�#����"��$���/#������-i%�����3�4���!q�ysv-xk��˥��嵼� �9R��6`��v���O�w����k5�ǘU%-��}�Z��b1�9�W`)r�����4��;7�A��!�'�/��g�{M6�t���:�Ȩ���wVS���*J��pR1Ş�A�ί�R��s�t�}�%Ys�F���~7�vzl/��?�8d���ҔlǾUp��Ʃ*�1r��7�7֟S��pa��������6�B�p�L"���T�X[�9S�t�"zPD����&��Z���[�#�Z�����>U;4�Q��2��2��n�N��POr�J�*���S^�bfU��>&rM�Cof���$�Y]W˨��x�o��r!3¬�0�O썈�}����.�!��%#�20�L�ό�4��=�j����6?Eyr,�8�[/��~� C�hX2<�g�|q�!��SK���<�f9Z�r(2�=\��ӧ�;�F���L����wW��K�j�X",����3���>���\�^j����b,�;����/]�oT֠����kճ.�	��m�3xs���.�V��z����(�]���+��j�j�&�u� �4��~ R���[É�Þ�A5��eBG����I!���i������U����t&�7>�j��Q��Bw�\Z�K�^
C��1
�kgG\#*�D��-	��[��痨��B}�ܶ�$�wO���f܉�f���^��	�
*E�I��?S9
�!�dr��Z�n��b��z��舣c&-��%z�d�յ),Bp꫷Xf�ڨ��խҝ�ah�˸˱I87�Xa��:H����O�y�� ��LtL����]����xF�䩖k��]5S�ܹ��޻\T3��I8�X���|&��`�y({�`6PB��4E��<��9�"=~�!�Tt������Ҡ���L���Z���?���1xI~�B"+2�᧨�MkG��#1�ʸ�[mi���nCPV���"HAGF��N���[7z��F�"���7Li��OQn�w�����7f��//��hi ���!6�o�j]���KwV���*��<���n�܍��)Q�T��*�yi������i������ќa5�&������Ebo����*iΊ	%L��Ew֓:��9�p��3�T���)�Ɲm�6�WP~��PVJ�^��dO��IC6��ؔ�J{!0 t虁�#Q��Qg o���.�,/2��mc�
��}wvR_�K�/��)v�i¥�D}�V	�#�sH��᳄l���R����gH69=L�`��1*�'��ؔveA�^+������%�U�RK���r�|[MN�^$��'Pںt��gN�a���6�tQR�-��6����ͦ�:�6OG/u�h��S��ꪺQ)W�ʐ��H�..��3���8}Xoo^[6v�bad�0J9�Q����y=c��oa"��1�{\�|o0L�D#u��'�G���i�Fm����D�C���ȤZ10Š���F]=�H���Gu�M]�<��G����F=PX��B��ґ�Q��&���'0�Q�Y��W~h.Rc��x֑�i`1W�`8���Ϝ�}T�Y+�0�E�wl2T
�́ks]���35-,˓���X�_#hڑ�B���sE���W��gS�d���1]'��%��w�?�54O�J���H�T&[�,����]}��Ũ����A&_����R^]��r�R���j��r�N������h�[W�Li}	���x�*C���b����<�K.MN/R��/��)��M� c(>�L��i�4������nEqu5pf>uFW�~d��ٯ�2� �f����+���5�_�Cs:���d�d�Q"�
;|�\��Ө�r�V^�4R?��$�=��ؤY4�]��k2E����^@�,�>Ţ��[��8���;ɫgf�0Kf�p���U8y3�����Y�x�dz�x�%��n���������@���D��al�w0<�����a:����L��gv�=�gag�z�V������ʇ�VY蘓3�I��?m~�8`Z��i�;c�"/�7�
����I���P��&�cF]D'���iBh�m{���_o�˿(�_����'"��Q�4��ֹ045��i�?*U�kR�(¼M���E�	�:    ��l�&gK�r�>zC��B�H |p̉y9@tT���b�U^b'U�����ha�D�������ܻs7,Ge����h���Uz�F1@:�}r��̆ Wh����<@������3��i�y�)��d������c�"�X�A&Zg���6p�d:��[��ᲑC��-�� ����/��_�o�84|�����<?�hu�8�J��x�\*Ϥ'�I<�,��B"8�nu��V�����'���&�'�����Q���I%�H�<$q���'pھ�]�%r�[<g��a�檦k��}�̼I�"���kZ=�NJiC�2M&�)s4�����>q�RdߞY�],�n��ļ?]f�v �bz�Hh��`���t����r��8�VR&EJ�l���R��Z�9���\��7��G�O�q�Ŭ� �b��뻼��^����S?������U�P�*+2��������ތ-�63<��ӪzR�ڥ*D�R�����P���S&�љi��l����ݶ-��d�v��+����G8�)�6�d �>$:�]�Bu�w3"���Gnx�Ԥ<T<���X��]5�Wu$�w����7�p��q��މ�+��9��!���4�����N�-љ�3�z����W2sG{T�-a��:�u������q:"&Ջ���/�#d֬a>�vZ;�1�r�}�+I���0�`�8���d�[�WV>T7k����6t0��|ڎ���m�p�R]�7��F���P�R��5�L�?ϓb+��ʅ���n,y�uxH3�zf`�i��$�;A�މ���T��B�<-r��까\�Un��%�cGw+n��O�� U����5	��|&Q���<�*J��[b> �C�i|������w�8h�M6�Lԝ�d����d@{�Y������d�ؑ|�pF�i�C!U��)DM�qs�ixd���j�h�X�4�io�nu�=���}#5H�����sy�^��R-;,9K�J��M_��-�����X9���.ٔ�f�)z�>�����P����2����zl�\�WYWK��%RaCc�2Y29�۝{ߓ�}��Q6�3��S�Sq�Nb@b��kA�ۦ�"y��G�F�J(�G�H�Է�w|P�[�^X1�n(N�iD*�u4�SZ,P�;�6{�*�UO��zT��i�U3�K�I�pK�G� I�4�1h�'rCs��g%�����z�c�(�Bz��ڌz�\ϟ�MzC�����ڴ�	I�c�i<�*�6�~8	��� ��F�Q2~�;���^����$fR4�Ǯ"��M
'�}#Q!�E`��~�]�E#���߉�!�&z�Ox�V6HJ��r�D�i��NA_Sv�s�t�^B�R �~�n��ҡ\���c��n�I�).�l[&G��j��D/�RK���f�)�¾CF����"�5�S��&�7�	��$t�-�[���5/5##�����N�q�v]��R�/��f_;Z�wM�wd�]W(�}~6�l���⧛R������6�f�=�����f�ҥ�$߀k^���T�g#1O�gһB_��$fq���j[}�zm�����Ȗ���n��� �v�vÖx���D�
�����7n�����ǦgJ#8��;e���?ny/7%r�d�m�ӭ���a�R/8�]�U�\wGP��}Gë��4Xj�!�����I�e'D�)�u�IM�QY�b2B��6J>�q���� 7�p�Ӛf�~�ne%��&��I/�n�\(�ծTʫ+�)ڜ*6�#ɨɪ���E�O��Ǚ�.��I^�ҹT���iA\*���-��p*d�g�Jr���`�n��m{���$�����鲎=�V�Ր��ɶ칔F>�،ǉь��	�N�?Ai���u����;,:cx�&eO,w,[��9`[>u�[����pF��8�ʎ云�n�n4Z\�m��`���LRϭ�t?�1%֋��Rl���xg	k����YN��c��������(�f�n\�5�ΤvF�����S��������z{�� Wgi���jr<k>���q���O3q�SP��U^t�r���s�B�#��������+��/jj������/��y�<{]DAa��d���aa�u$��Q��nP��C392{L��> >t]&~�u�1��P.�khY���OTY�DA�Fᷘ�.c�بQ�K3`�$ݣ�GG���\�(?)pw�L���E
M�S�S��8#	������?�F'�->��� P��[~�����DL��_�R���ɉ���ϒR5�5�N>R�9�
c�G�ɴ��N3Ќ���S�͔*���*�L���D:�?���O�t�V.�V�vH�m�)�o(��re��Zٸ}<�ԛ�"��s����Lݜ��*�zɐ>ٺ��n%��]<��6MbcMV�=��@�ls��!�� 1O�l��՟}���욒�G�v6[��¼X�r�U��$�J֦������M��?�8fʶ�~3@���{oK�e�cJ��r�"��.�v�|Z��~���@�dw}�Խ��4,ϲO�ީ�2��v|��S Z��ާ�aHe�i�a:ª
:���f����F�~;�Ǝ<IA=\fߍ�%��)@�1>�a(����f���؍m�^���E�b?M����9�ې���H~�G�ܘs�kW3�f;�f����j�m��/�6셩�9�[I:��Vyqn��?R�-����k��A�SDF�&�ي�B[�l����n
����I`���sR3�4��������0�=7�GLc�	�|)qm�y��S���z����ºM0�0��G$�����6y�j�4C�����L��!�f���[;�ΓPk�3��un���V[(�"�	��ҽR}��:6����LxW&ȭ�X'�1��|�%�."�t�8.*��((K����'e�'Ʀ�kq�)JK4�D��k����j�%��������k���n�a2!��:W(2�����W~^����Q,M��vs�=w�(!x�S�� �2��V��6��{��I�Eˍ!^{F���v[p���F��wL��`B v�ޫ`��A��]���mtf�gEt@K�++��*��<:D�� �q��^�C��>�I'��l����Ym�T�xpa��&I���c����0Ō�!��u*���|��T�Nǁe�f��S������6[�6:�=6��!7�]���d�t0c�~��{�����2QAJ+�N����t��h&5�ڙJ'������Wۡ�؍	�4��]P�����%�:J{���f��t�?��⨅���"A3\x�8o$O�Ó�Ŕ�&N�^(o�݈��C��Y�����OqX	٧I��^��$W����f�HΟ2�_#�N�����ή�����b�����L-�6��sQ�#n�CL�#Bf��� �����9Y���\% �8�DM�e�Ŷ(����]�X�i/� h�s��0\O]~ h�l�g4i��'%c8]��@���w;���5��Nɱ���o�P��l��䈪�A2f"��0���t�{ܠ�@�iya��$�Ȗ��ֺ:~�1I���������k�����?K�)?�ax�B�Ԡ�k����g4�f䋬�)�Ls)��*(�i�^������:v~�M���v��� Jꗁ�)C�<<�a�gd�lNiK&54�h���.X�R��Da�-JϤJL��ә���֖��"wx�8n�7����<���/� �����0�[]�����n��^7�HC��>$q������o�w&u�'��u�њyc�雔o�9,�|#\�c\�m#�+>�Mg�g槗�������5?�<K/<���5u�A�1~�4�4P���H�	��.�H����)Ǜ4��9�d��"�.���K��k%R�����01y>y�>�87m��.�<9����^Z��IL!h�db�i�<Eoh��2��<w�wT_�1�h��庎�W����C�ݯ@;��J7:q��K8�@��r>|y�!�7`�`nr��G����vI��2������$N)P47�e�6,å��W�]}<�b""�4��N��� 
  � �dsH�C�jqI���xGӐ������Z�"��P+�WKK$�9ϛ�q�fٕ�8mI�����˷M�E^G�<�(�쫥^�}�FNS�u�m
 ���+Hh�>fD*��8 mA�Ҥ�_)��ȇ�������y�?�!��&��c�����������蟏��_�E����[�(u���_���w��������&��{^�v�᪋qj�Rf[�Q�M�(n	���k#uQ�U����o/A�c�ߺ�׋������_��N�UG's+�Y&kZH�8���vA�$Xdt�䄺X��=*]:�F��G��Q��AzLub��!_	Ǡ���Y[��kX��0����þq{w?�r�j�&&��ߘ�uL-X9�֤�C�m������m�q:��/d�L�w>,�F&^�}����?>19���hn2t�Rl��i�hّ���g�ϩ��U�t��e?��B��@���ٛZ�Y��Uc������a�H�=�N�+!��j���ʸg�xĀ�ud���=�]5��Ō�¦/��O��?PP���A�.U�'��a1�s�|D��3�^��+�u�=�b(�&K��@�ڼ�aٟ0��)���K�&���mSG^�0��c��uW1w!��i@�Ȍ��� Ц��K	��-1u���z<l״;��9��%���Q(�C 8�!\4�K	���������D��Py!�B�Y:�pt�T*s[C_h1��˜l���+��pbiz~���U@��ݎ׆'r}�F���Oj�V��VW�ٺ�벚�X���ԓ̙Dm����T6��K���TD�%���4�JM� �R9+�{��C}��O�Yj�D�j3o	��(;���&��iF���KB�θw�f��dJL�6�b�n��op�qd�BpmS��5!�W2 �t�81�E��3�J�*���A�����'��Ǵ�<��q�"�>ԑF_����b��~I��m��3$��b�i;�4�����J��ċpN�R���)�][X��w̱��'}/�z��_{�����"      �   C   x��I�0��.����$���qX�s��Ȅaxc-�_
�^�aM'��h�t�O�c�	�C� &Y      �   #   x�34�4�LL����24E0�LsNs(3F��� 'n�      �   �  x��W[S�F}^�
?�P�c��e���6�c&``�"lI��2�/�O\������t�R
m'}���/��Q�]��M@��,�Y��w���d��|�����
�9>t�ݟp� %g*v������KY`4�jǳ-&���1[K2�37:[��bF��	�)��Z�1�6�t��'����J���S���"���8=�(�k�5lG��S�r$��V��L�i6*͔<:^�F��b��5PbDs��f�!AD�����`�Bp��(����]sW��� �
=���
��5�l|g(�2�5���\5�*J��c*�U���|}d���̴c�3�J��>�Z�b!�gT��9W�)>�{�6<oq<�ۘD�_�H|���+����BC�􁕎f&�cm>36=�$�T,ʺ�y�+Nd[a�:����V#�N��I��.�����i��~w�|2����x���� 
����q��V�a�����6��9�j5{H��{��AI�B� IQ@W��Tȧ0��4�n�K��_Hw�ħ�Z�S��>@��������y�}��Xf�� �]�%��wf��̒Yuj���� �/�H�R�B�.2�����P�*�=5��e��=T�q_��8��<��qK0 9�xI�XyP� !N�#QF }N!R�o�F����OPôL;_�Q���UJЅ��?���$�F�+�|�ys�x�0#�!��T�'A��6�v���t�*9_E�]�ή�!�Q���J�=�&��&]xKmND��}��Rv����_]3!,H�RI��X�����]Q��@��0��5~���m�s@���:*]]E�rgY�q쥳���(�mI`�@��t��/�ל�n6���B�]#��C�kDr�3z���$����W(*D� �<�:5���i���>�O����O�՜.f��K�*�X��4>�T&�ѡ9#]��c1vr(ٜ�GH"»�K�u�;��S�e��m���i �������$�L��z��Kr@o���V�i�$ț�Pl���3
$p��Ƀiz�o�]��r�?>�R�Ȉ��Q/�iG��?p�"�g�J���"���0KR�CAU7c@/TJ�C��F@�u�SP�w&�>���;��#X�(+F�S	���J  ���=���R1m�W����x����"I�C{��k���v7P�}�ƺ���cX�g�8���,����_@/��̄�y)��O�@ �/�Ia      �   Q  x�u�MN�0������]X���JAb�W!E���9��F�LZ�N�"r�͛�7��@���z~���o��O�����-��� C���V�o���As}}T&�����0������V�H���hєNֈ�\:<�vO�a(9p���36��ɢ������90�2�(���4	|5A������Yl������s���)����A4�&^@�F��i���u-6�i?n���v�6r.(ut�F^Z��4�/�-���A2��3Ȇ�R�~�q}�y��G���������0(�g��<Ѽ��e
��(�[�>^jhW��	4�ˑ��&�wJ�?00�     