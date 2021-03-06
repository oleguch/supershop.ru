PGDMP                 	        u            osamylov_db    9.6.2    9.6.2 K    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
       public       osamylov    false    3            m           1247    41341    status    TYPE     �   CREATE TYPE status AS ENUM (
    'Принят',
    'Доставлен',
    'У курьера',
    'Отгружен',
    'Отменен',
    'Корзина'
);
    DROP TYPE public.status;
       public       osamylov    false    3            �            1259    41144    cart    TABLE     �   CREATE TABLE cart (
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
       public         osamylov    false    3            �            1259    41150    cart_id_seq    SEQUENCE     m   CREATE SEQUENCE cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.cart_id_seq;
       public       osamylov    false    3    186            �           0    0    cart_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE cart_id_seq OWNED BY cart.id;
            public       osamylov    false    187            �            1259    41152    cats    TABLE     Z   CREATE TABLE cats (
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
       public       osamylov    false    188    3            �           0    0    cats_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE cats_id_seq OWNED BY cats.id;
            public       osamylov    false    189            �            1259    41286    delivery    TABLE     B   CREATE TABLE delivery (
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
       public       osamylov    false    3    202            �           0    0    delivery_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE delivery_id_seq OWNED BY delivery.id;
            public       osamylov    false    201            �            1259    32824    goods_id_seq    SEQUENCE     n   CREATE SEQUENCE goods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.goods_id_seq;
       public       osamylov    false    3            �            1259    41160    goods    TABLE       CREATE TABLE goods (
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
       public       osamylov    false    3    193            �           0    0    images_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE images_id_seq OWNED BY images.id;
            public       osamylov    false    194            �            1259    41168    users    TABLE     �   CREATE TABLE users (
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
       public       osamylov    false    3    191            �           0    0    names_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE names_id_seq OWNED BY users.id;
            public       osamylov    false    192            �            1259    41204    orders    TABLE     8  CREATE TABLE orders (
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
       public         osamylov    false    621    621    3            �            1259    41210    orders_id_seq    SEQUENCE     o   CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public       osamylov    false    3    195            �           0    0    orders_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE orders_id_seq OWNED BY orders.id;
            public       osamylov    false    196            �            1259    41256 
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
       public       osamylov    false    3    199            �           0    0    sold_goods_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE sold_goods_id_seq OWNED BY sold_goods.id;
            public       osamylov    false    200            �            1259    41212    var_good    TABLE     c   CREATE TABLE var_good (
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
       public       osamylov    false    197    3            �           0    0    var_good_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE var_good_id_seq OWNED BY var_good.id;
            public       osamylov    false    198                       2604    41262    cart id    DEFAULT     T   ALTER TABLE ONLY cart ALTER COLUMN id SET DEFAULT nextval('cart_id_seq'::regclass);
 6   ALTER TABLE public.cart ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    187    186                       2604    41263    cats id    DEFAULT     T   ALTER TABLE ONLY cats ALTER COLUMN id SET DEFAULT nextval('cats_id_seq'::regclass);
 6   ALTER TABLE public.cats ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    189    188                       2604    41289    delivery id    DEFAULT     \   ALTER TABLE ONLY delivery ALTER COLUMN id SET DEFAULT nextval('delivery_id_seq'::regclass);
 :   ALTER TABLE public.delivery ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    201    202    202                       2604    41264 	   images id    DEFAULT     X   ALTER TABLE ONLY images ALTER COLUMN id SET DEFAULT nextval('images_id_seq'::regclass);
 8   ALTER TABLE public.images ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    194    193                       2604    41265 	   orders id    DEFAULT     X   ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    196    195                       2604    41266    sold_goods id    DEFAULT     `   ALTER TABLE ONLY sold_goods ALTER COLUMN id SET DEFAULT nextval('sold_goods_id_seq'::regclass);
 <   ALTER TABLE public.sold_goods ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    200    199                       2604    41267    users id    DEFAULT     V   ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('names_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    192    191                       2604    41268    var_good id    DEFAULT     \   ALTER TABLE ONLY var_good ALTER COLUMN id SET DEFAULT nextval('var_good_id_seq'::regclass);
 :   ALTER TABLE public.var_good ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    198    197            �          0    41144    cart 
   TABLE DATA               b   COPY cart (id, id_user, id_good, number, delivery, city, street, house, app, comment) FROM stdin;
    public       osamylov    false    186   XL       �           0    0    cart_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('cart_id_seq', 1, false);
            public       osamylov    false    187            �          0    41152    cats 
   TABLE DATA               +   COPY cats (id, name, descript) FROM stdin;
    public       osamylov    false    188   uL       �           0    0    cats_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('cats_id_seq', 31, true);
            public       osamylov    false    189            �          0    41286    delivery 
   TABLE DATA               %   COPY delivery (id, text) FROM stdin;
    public       osamylov    false    202   Q       �           0    0    delivery_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('delivery_id_seq', 3, true);
            public       osamylov    false    201            �          0    41160    goods 
   TABLE DATA               T   COPY goods (id, id_cat, descript, url_img, price, variant, badge, name) FROM stdin;
    public       osamylov    false    190   �Q       �           0    0    goods_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('goods_id_seq', 134, true);
            public       osamylov    false    185            �          0    41196    images 
   TABLE DATA               0   COPY images (id, id_good, img_path) FROM stdin;
    public       osamylov    false    193   �       �           0    0    images_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('images_id_seq', 476, true);
            public       osamylov    false    194            �           0    0    names_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('names_id_seq', 62, true);
            public       osamylov    false    192            �          0    41204    orders 
   TABLE DATA               z   COPY orders (id, email, name, phone, comment, city, street, house, app, id_delivery, id_user, "time", status) FROM stdin;
    public       osamylov    false    195   �       �           0    0    orders_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('orders_id_seq', 18, true);
            public       osamylov    false    196            �          0    41256 
   sold_goods 
   TABLE DATA               I   COPY sold_goods (id, id_order, id_good, numbers, id_variant) FROM stdin;
    public       osamylov    false    199   *�       �           0    0    sold_goods_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('sold_goods_id_seq', 29, true);
            public       osamylov    false    200            �          0    41168    users 
   TABLE DATA               p   COPY users (id, name, email, pass, address_city, address_street, address_house, address_app, phone) FROM stdin;
    public       osamylov    false    191   ��       �          0    41212    var_good 
   TABLE DATA               1   COPY var_good (id, id_good, variant) FROM stdin;
    public       osamylov    false    197   ��       �           0    0    var_good_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('var_good_id_seq', 67, true);
            public       osamylov    false    198                       2606    41186    cats cats_pkey 
   CONSTRAINT     E   ALTER TABLE ONLY cats
    ADD CONSTRAINT cats_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cats DROP CONSTRAINT cats_pkey;
       public         osamylov    false    188    188            (           2606    41294    delivery delivery_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.delivery DROP CONSTRAINT delivery_pkey;
       public         osamylov    false    202    202                       2606    41188    goods goods_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY goods
    ADD CONSTRAINT goods_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.goods DROP CONSTRAINT goods_pkey;
       public         osamylov    false    190    190            "           2606    41228    images images_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.images DROP CONSTRAINT images_pkey;
       public         osamylov    false    193    193            $           2606    41230    orders orders_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public         osamylov    false    195    195                        2606    41190    users users_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (email);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         osamylov    false    191    191            &           2606    41232    var_good var_good_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY var_good
    ADD CONSTRAINT var_good_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.var_good DROP CONSTRAINT var_good_pkey;
       public         osamylov    false    197    197            +           2606    41295    orders delyvery-id_delivery    FK CONSTRAINT     u   ALTER TABLE ONLY orders
    ADD CONSTRAINT "delyvery-id_delivery" FOREIGN KEY (id_delivery) REFERENCES delivery(id);
 G   ALTER TABLE ONLY public.orders DROP CONSTRAINT "delyvery-id_delivery";
       public       osamylov    false    2088    202    195            )           2606    41191    goods fk-good-cat    FK CONSTRAINT     b   ALTER TABLE ONLY goods
    ADD CONSTRAINT "fk-good-cat" FOREIGN KEY (id_cat) REFERENCES cats(id);
 =   ALTER TABLE ONLY public.goods DROP CONSTRAINT "fk-good-cat";
       public       osamylov    false    2076    190    188            *           2606    41233    images id_good    FK CONSTRAINT     q   ALTER TABLE ONLY images
    ADD CONSTRAINT id_good FOREIGN KEY (id_good) REFERENCES goods(id) ON DELETE CASCADE;
 8   ALTER TABLE ONLY public.images DROP CONSTRAINT id_good;
       public       osamylov    false    193    190    2078            ,           2606    41238    var_good id_good_var    FK CONSTRAINT     w   ALTER TABLE ONLY var_good
    ADD CONSTRAINT id_good_var FOREIGN KEY (id_good) REFERENCES goods(id) ON DELETE CASCADE;
 >   ALTER TABLE ONLY public.var_good DROP CONSTRAINT id_good_var;
       public       osamylov    false    197    2078    190            -           2606    41269    sold_goods sold-id_good    FK CONSTRAINT     |   ALTER TABLE ONLY sold_goods
    ADD CONSTRAINT "sold-id_good" FOREIGN KEY (id_good) REFERENCES goods(id) ON UPDATE CASCADE;
 C   ALTER TABLE ONLY public.sold_goods DROP CONSTRAINT "sold-id_good";
       public       osamylov    false    190    199    2078            .           2606    41274    sold_goods sold-id_order    FK CONSTRAINT        ALTER TABLE ONLY sold_goods
    ADD CONSTRAINT "sold-id_order" FOREIGN KEY (id_order) REFERENCES orders(id) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.sold_goods DROP CONSTRAINT "sold-id_order";
       public       osamylov    false    2084    195    199            /           2606    41279    sold_goods sold-var    FK CONSTRAINT     ~   ALTER TABLE ONLY sold_goods
    ADD CONSTRAINT "sold-var" FOREIGN KEY (id_variant) REFERENCES var_good(id) ON DELETE CASCADE;
 ?   ALTER TABLE ONLY public.sold_goods DROP CONSTRAINT "sold-var";
       public       osamylov    false    197    199    2086            �      x������ � �      �   �  x��V��G�9_ѡ^'>~é'`N��֔��++p�3q:�h�3����_��z=I-��뽪zG�����������/��b*u�3��x�������/����_����Ͽs�4w�ڏXs�ݼua��}5Z�1��p�=�Ϯl�G{��F}��Cm�t�������>Ky0�z���g���΄5�koX�B��vGh��9�CX�[�܂:N�.&2sX��a8��;���8� S���S��Sn\���~�W���d�Z��aE"�}�s�(a�fWNz�@VQ<G���2�:L�0����KX��]O��͋�L�/��0|����_�&��4�t�� �����DL�r~�j�^r5��m��Kq��!fB	���)�fWN�
*t�X�G�p��C��TC�F3���h�\9�9"M�?� h��atM8BFj�S��F�3fV��qHe��^��(�T�����३�i�������re���`�ߺ��~�a	�sx�5����
L B�Ψ����S�����zT����2�*lc) e�-���OȌ�Sy^)1e�#�RW*�Y_p��I�`,�m��z@e��$3��X�J��60AA�V!��ɚ
��a�^(X���}j�ioKc�a(��Ӽ`~�8���.���k3cr����ͺfq�ɂ���Y׵���׊�ɔ[���݁Ge[�I�2����[̀�6�!���5VTd�D����)��*&<���O�1���:�A�<;�xԢO�1��������"���>P�L@��M�2��&��e:F�Q}���ǼdY��]�uG.�l���E5j!�ӹ���j�I�T��e4���M�
�FS	B)�������(𽋨��+��Aꆚ+�k�ͺj�N�ba;k�&,�!�ƀ���{g�S��4f�ڝ"�M�g�v̚M�+��]R��9C̵���XhxB�#+gؖvO�=C~�����3W{�b�ݝ<Px��>Y�ūG�!���e�n&��-�kڱ<�a���\l��V�&R�VPsf��o�t��񒁷����ZVF�bԡ>!qZ���u�m�o�yW�v�8�Ab��V�����k�Ƃї|�d%uoK-[T]3�調s�3�@�-��B�^}��[N���I�����      �   �   x�]�1�0й9�O����L,L\ 	8@S�Ebab�#T�@�Mz����$��v���u���xZ�Q�QpGP�9*�bI&��T�
:4����f�y1k�p�Q�Q��"�k����<����~�k�V��c9�5�����-\���Ȱ%�kZ�<]�2[owf90�| �/��      �      x����r�W��[��mW}_I3 M�g����H�6%*$m��I�`
�A��m�SIQ�eّ[����m�}��W�΀ A�$ U�
^�B_I�:�ӻ��I&驚�M �a���Y�Z+!7t!�6y�4��Z�N�I��|�t��k�����V��r�.?�����OFF��.�͵����676�E�R��܈Z߼_�f���/�${�-}��t;�u���8�$����vw���w?��}��g�U��?�����J?Q'9���IN�ϒFw[�����P��>�?��~��wj�O�?v�7���u��߶�RY���R'�	:x�O�O��HC���}�����f�&����jv��f���/�З<�ﲧ�^�c}G\��~ç�Ŏ�f��}����5�{?�����4��;�&���ǸGJ��~�*����V҂���H����������J�5�,�>nbM��4���m���'-�ksLYܓ�6\�!\e�+~g�։^�Ǽb?�A/|C��c��O'*i�]�>��ŋ�y�x}q�����6��MwG�����)f�����������<��G���U�Jx����]��#x��c�sxu�Z��'��RM�L+��,���G�,
�	�ţ�hP���O�Y��/$��;��x�OIY�-޹���H&?�M�G�5l|�K_��RPC�l�g����=@Z���� �_�]��1�bV9�KPK���Я�Z���os^�+za�|W��=����pz�����#������Ǹָ^{��wqu���So76ం@�*�E��{���_JيA�\.�$����i���@���i��8���8�תÛ������Ȼ�hk���y�.jV	�٠u�����(��M�o֒?jy���t�����s���K�׮����Y5���/�'i�m@���avH=����9�X�R-���Z�2RG�D��SШ��;��ZE�?9�}q����6?X$��>B���sV�����[�$7<>��,���f�z�R]-���ӣ���&���Z�'k����B�ۡm�{�h���H�m؀ y~�mA��^�m|�P9k�۬>�&�Bj���o�-��i�6 ���ϥ�-�}��X��^�
u[�'�Z;����p���;"LǁNJ��FM/�����&�#��po�`�>[���(g.p���n��.W�V?/��Kw����/w
kk��:��_��?B�&�.��T�@�6�.iJ�mo�w
�R�]*��p��h��*xd�)��B�tu�}�A�����o]2e�w���S,ߩT7�La]?��J�������+�����[����H�aկ��'�$����[vH��`!�/ط:��꥖H��q�=�G����W�����\.���^���s���Oa�������K��b�خ��N��\o�E�v>�����	������t+��Z{�������im����"Qk���R=&#H>w_]���^��~=��+��<u��7��/��T��6*�)��	��-TE�Ap�ɷ��?<�П��Gmb���Q��4��z��0&U�
�Xt�~�L}c��GC�$c�au��5���ꗆ3j<��Ѐz��h�c� �خ	��:���Y��X�������519�G��˥���w*�^h�VsÓ�P�K�|���/�$JÃ��Jk�P;6���7Pa׍�<"�r��U���<�+�U�1���ԏ5�(����ʃjamC�i�W�����v-��Y��mt�Mw��Q��lY����;>��o�2�L�r�/7�l�{WQxfޣ��"+qO#4Gu�a��;���k�킄�.�P�!�:�D}�m�r��y�����d��E����n��O�A�F�&ݐ�+�i�q}UD�pkiG3�Q-m�����QWp�H�V_�y�m�]�k5��2����Yr�|��G���.����o���C�u�e&?��܋�I&�O�2�
�N�cX/�V9;�0�^���\ZVW��Q@�D�vH��.� �oi�r�Ŵ���A;B�M��.�X�m�*�M�3	N�9�?�<'2N�q_��[�0��ޞ����.Ϫ+K��W)����a���>>9碦����q�S�����
�n�.Z2\)}p����^��J%��y�/�y��EH\��n?�?Cgp�����ہ�y����S��~�Y�?6.0�.$C5Q.p1H�<���?F���̡��C׬�}D��^�!�� E�� w���?Ê���V�K�yAK���-r�Q�^�zH�2����Z�<*��1�g�4�F-+.�G�������c|��[K�A?�E���������I7�1��}l�a��7�)��$-�9B;���;�����[�:yZ��e[F3�����͒s��h��+ '�ӵSl��^�|]��Ǉa��HC��������Z��9�Z�9���%�(;�f[t�\�@7j��_�ಶ����Z��=P�ە�_88��z)�Ch����X.�+�j�^Q� ��$����17�}� v'��C�#��N!����ޡ򄄶[�N�"/�³b��ԑ13�(Ш�  ��췳���^_~cqE-.�s80�Rq�~em�a��{�gf^U?yp
Ffm�S`� /�ۀ�����������dI������1	@��ѷ�ʿ�~���@���xy�DP�H%d%fB�g[$��],o�IҚg�?�FqyGR!Is�>�.US.Gj�k9G-�7��j�>DU١l���e�2t8Ѳс4���ل�H�Ly��������;�N��ʎ�O�0�:,.q�<��'O%�K����-ϒP#�B^}�)3���+��Ө�_�qB�b�C�(	���y�����k��6e#k,��Ag�E�S�,��;$%����>�.ﳥ�d�D_�s�\����d���@��>e��Cǅ��>&9��I��Ƙ@���%��~) #rݧ��m��v9�3�g�`�(X�6)�6i�c���cE���B��M�N�'���H�RfA���.�D����"vc�4����C�� �1$��~eB����J��#�@��P13懇����J䨾Q��s���l�!� ����������.#$�h�,�.�
nn�{��Z)��:��WB�C�K?��EL�4Q��+�A��G/5�࢏v���ҡeM\�?�=Ct]7t�~c�������'�6�&���<-t�!!�����e�b �8�}��<_�CP�;6�@�Nk��'gׄ�-�K���(g�΁�5S��l4%�ˊ����ԝd��m�'5��P��-��
,�t&@��|N�J�����9��a�~�🅐ģC�|�6���$Wұ������#�|�#(���I�>P��ӌ�u����I5�C�!�%!2삖�c@ۦAvYa�A�ۆ�$�hǉ[����`:�:��i�w�F���*��T��b��I�d��w�1u���-d��� l��MC�z�m��Zh��)����M��񨒡Q%q�֮H�����D����+ˋK�e��6��@�b���[��P`�)�U���P��o�-cS����I��؋�	�����L��B���A:�F���9���ڵ�jA�W�2!�%8 ���tGi7�����=@Ei��
���:�O�K�����>Β!x�ǎ7��Rw��0���cI������C(�P�l����ρ��+A���0:�SK�%B��&�)j1!�*z�1�F?ґ��}��#`&&Y��­��{j��j�����w �k57
���|�~�9�h�
T���D_�9j*$�Goe2
/$Y��� U�X�f�-l���'����� Rim��Z�~%z?l9�@�]7`�9^���(�*�/�оӏM:��Ƈt��o��*iH��ΉH>�醌��7���hq���
�[���(��� ��}��{�џ�	?��GZQ��ccF�?x]�RR����$�u!�痸�[��
�B��}J!��h��A[�Y�����O/M_��*ǯ�U�F���F�    �Ю�Э8 ����r� ߂���$��ȁk�io�]��C��/���;��&3D�/i�މ-�����|̮��9P��8Q4�{MԇZ��_	�Eӄod\�:�TyG]/��h��W�p���ׯ������;/״Q�LoT�V��J��E0*��6`k����;��?}��X5�&�Ű�o��+�oT�w�� ���ℒ�R=�ei��c��N-|�:���$ۚ���K��0��-m�Ar_���{D+�{=b�*� ����1[I�(�����6�o����½�y�/Ԧ��伋x7zs�Cs��B�O����t��4��o!��M^k�,��v�ʱ�1�#�M��6޹D�ƣ�3s�I���R>�G��h|W`�Q/W�-����|UC�4[��=B�r����ê�e~�7���e-\D�������ΰ�x��r�ef%g�1F޽G���Q�s����f�����:@.�q]#MmE]06>܏���l�ZX���U�$y�yfpqpf!�	&�E4��w�(I'���E��� ��$d����@l*ã#֍z	�`����ێ����;GY��3Vw��������q�����U��7�����W�V��8�U����.��*�:Dqs�	C2�R��G�	~Z�SZ�>���Z�������<@��m���m��=�U�I�ɂ6of$�m�q�y:$�u
�ڦ���#�4d2J�� ��Hų8:p
���T�t�=��i`�+0���4)���0�~��K�g�D�U�e��&*��&��W����8MY}G'��8oɏO�yU(����mp�Ƀu	,�N�jx�V$��⯼L=m�������1ݱ����:�8�|�'%g{��O�B���ƴ�߁&�_���zj�z��-b�C�jY�6��� ;�i���i�#_�[֩���8p[B��_��^G?:~J��=�a���5i]ɐp����W�P�]aS�Y?+�ұ �j�c�p	Dr�C����l��F~��~���o��:�(ޢ��;����:���*�1��32$M���AD�w�t=k�����Q�pa.���5u�X��U�kP�PY�����R�o0�<����@��A*%�f@�p���EgF�]���~����Eu�P���W+��@��J�G��@zȖU5��y�Z�����J�zK�oV�Son��*U��ˀ�Kv�My�A�n��uٶ� Kry��<v��3�(��1ݴ���xcJew)k�y�?����&H�,S�gst`L�92u�H�s.�����H�I���1v�f�
�:Gn��{�#��+�͋ʭsZ7~q���10���k壷0��M�d�D��[J�G����v�?� ��e� 7����{y2UR��	p��C���T�;�ۯ�<>D�5&�8�K����[��%{����])�:I�Z[/R��.��;\���;T��Pe���s,��k�S�WXs�-w�yn�-�'v�����$'�DV���� �'u�'G��Ra�'���Z�@����i�
0�$�^�AW�����81���V���e��W�K �Kx�߳�\G@�6���fQ �t�eq7D���u~	�I�_��� Ͱj�?������M��Ǚ����O�)l�R��հ�\�M��/��W�}�H�~������:����p�\��U�\����m��p���X6��K�d���o j���;������l	���<��e�xEU;)��\���t��y�	�3=��=�Tё.|l�9d�$%���7��%��4�CA�{�c�'s
�i� [���B�u���Cl�'�����6	xrHv��<���6=�q�HcҖJ`/���5�ļ�Z@�ir4H^��Ƥ뵢]?�	͌��=�R�a��T)��U��bU-�_�X���W+�����HD�;�������)��K��z�}s����ؤ��	*a�NfC�i�s�)|����51MA
�%��:�4���CeC0Æ)s�A?%{��h��5��^���86�q��T��%o߁8@��� �65ĥ�!n!��Ћ�8?�6kC�>8��H��H��?_�_���T����$��+3���˚ɳ���������ziUM���;��>��<�V���OT���-�%�M~�%x�i�����9~�y��f���^��]R�����/|?2�z"~������A%�1�m�p��R�_��om�` )?4ríF����'zߦgf/�����h0^�����l��c���+�ж�(��"
]�8�*�kR�q�C�äc��<8���>�}	�*�?�]�����[�+jfqz�Jfd,&Y�(�-�ʓ��t��Ȍ`(��e�cVh��I�@$$wg�c{J�"�Snйcb	.Y$�o+s��>˙ZoD�#x3��o����18#*y|8[�g�pw��:�P��SR���ֵe}V�g����Q���KU�|W�d�R������০ƀټ�?5�/6��=FƩ�r^��d9�zL� �p���� �?�	�st0z�Z)E$��)��J�i�E㼈�� {��NXtv(�"�II���E������讏%652El�dJ�Y瑈���|f"�Sy/3��ɡq���M).�#�i���ˤK�7TKQa��H?�Z"���
��8*�$�tuVZ�.�,C����^�W�d3j��R��hFfbO,?�Y+�ʈg��Is�Ko[�/	��A��7<�tw��� r
1��Ş����ab,����c�i��ZH���8��=֯�_O�ιܐ-���gx;�T�������ۆ|޵�k[�vޚ_XȌ�.L^p��b?��NA���ڜ*�� 5�X��T��l�<8c)�B!��P�#kM��V�i)fΰ�m��?��?�+'�%��v~[|�K�a��A��>�����o�j�S��]&z�R��C�ҽ��.o��­L����]H~k)��X���.��zr��Ib�a[�T�����!(��5�t1�(����&Vq빎<�Pl݋�����jۗh�����$�FF�T��^ݷ���T��4�� G?!�����H!ս����^!����� p�$Ei;G����I��z�@�J�nY-oT+w���<��\)�vgؓF�VT�$ª��f���4'���'s�!-�����3(q���k=��M���u^K9�塆??H� B	C-�"����^�m�>�.��&^;���g�Y2�a���������������7��nse� �;���(��J�����m��`}�x/B����2��N�t0�z��[���iGg�D�����`g��oѸR<��41��P�=��z�H׷��;��K߮�e�BF��}-C�-��kf{-���������E��J�"|��W�j���/�53F[u$�b��Se9�ΉM*/q|qI+���t���Y�Q��^��|-�!5��m1�+	��$n��:���nl��^	�b��0���I}˺Đo���Γ\�>�]#=W-�7�����<;3��rjbH͔7�T3:|z�k�J�S�ㅠ� 2D=jF�%%g��}�aX �6q"�����P�w��j�h���>y �%�7�zD:�.2=!`�n�Ơ�')�@uy�k |pJ1 ��#KԁcN�Й��#�(�hB'��Z����a <�m�L���͵5��U��6�����o�l5u?�)&Α�DN���|�m�&��%z]��4�8����lض��4	Gf���^6ur;��Ƌ�GDP��G�1�d�S}���o����|��_�I����P�����o�%?���~_���_a���ʏj����[���q�k�ݠZ�9�����m$mio�-:�=L����mC��m�Z���>���Q�[�p^.�U/r�鳰���a�z87�0��hK���z�Xj�ŋ���mb�)U7>��/�����%uc��YH���f�%3:朅S�5�ë�-��.��%ў��.����	,�5�h��    F��\B�H�
�u>��$cCCଚe�RYU��R�?<ցM�82_⊪�o_Ջ��'�<��SPB��$>�h�P�{��C�(/�K�2���J���P7`�m�Z�S,��!Y0G�R"4�TS�09�^u/��7o3/�(�ɉ��@������=$�m^	����J 5�0;� a�5�Z}7�-횲[�n;�l��ʑ�S=,y
�tZ>�?)x���iiD�Q�$�$MYzeպ��m1=�vQ8�I��N�5
�h�uh��?$X��c�>����_��/�<1�R�1^-]5�s���iX�eh;hq��ؙ��%M��z��kbF2��,s��KC�<Z�=2��W��H!���F��=/�>mS3tl8�
! �����G��c�Fi�Z|���vK���Z_[;���i�$�,ղ=q:"skv�����N��o\�g�e���>x��ы��#|�����~� :smZ�$��dG..�v�T��f��iYL}F�ԥ�>c��f��1��̾zh��.���k��.D����D�����ͳF?���"�/eF'@i�Hr����bP���u@0V��h�}S�NA!�#Im��QF��z�CDn<�4�j���5I��Ȩ4�������2�x&�8�{wm� ;�T��7`ȧI׿.k��"��� �`?V2�;��\1�Y��j<=I���]n�Ē�D@�L�m�h7��I��+�~FR�՞��x"�	�Hl�����E/!���]6��46_!�T��|)9����ksb0�V�%jn�(c�$]�v ��rY.��L����(�&FNǨ� ��±,I��l?��(��4A�5D��Sl(��q(� K⵫�-d���L8u#�wf��n���r�w�L(n�fz0�]K�����=�'��xH�+�r�}R���cç��*Ѫ|��܌)E�(��!/E��p-�ŷ�R�h�F.1��X�)r���������d�_����K�H�^<�)V=r[KS�!0�z@^��U��?v�#e4��[(�G�x+j";��;�n��DM��9��F`Z�Z��Z������^��k��!��M��G0Ve. I/{�,]y����qM͉�<to��}�n�.��[\g� �ն�i\+�R���%�<�bޥ>�>��r��
w ����m�|�qtR��R� z�2^��W��6���0)�����t;��ݭ�q��a=�8��1.�j��y}aqiV-Uޭ���ɗ��0��� �w0��cЖ�����5g�5͕b�"���t�	%��nԲR�=�MI�7$�lv��mS��|ڦĿm��7/95l��|]�h
Ɖ�̤��1{� Ɣ��{U?��Q���Y��4��zU��mbۍ��1���Q�z�P��J�����n�(��v5���0q��6ڼF��s�bq=��B�9��d��%����C���-���Is�n�V�c{#�f�/Z$~�I���8�6ENqCDlM~�r5�X���J,T���@}�aǟ!8����N�,�?��M��z�큤2j!9P�4��P� 0�MQ���g(��FZ���Z�i��֜�Ha;��MŇSJgtѱ���L pa�Z��K�q����[�e]�hL<�l�Wp�"�aa�sI 5�@�Ǽ�c�E�rF(x�S�t�h���&��8}&S7�Q��-~˄[M��C�����$�˔:�2�A��cFn>GE�����\�����D��1N��_&2��v�m���ѱW~g0�`��/e���u�U���X���cy ��T?�G�v��8�ɞ2����g���cě��k��ZZ�S1�ذ��IW�%��8-{���Mdz��!έ$(����PF^[Q1�p��T��@��LM�g�clщ���re�v���o߮��K?/��pk$�M�j}m���s
�Eqwӄ,K���)o���P�L9��q��Y\�%5���h��I��Se����o(y����HE��0ϟtl�-����n؁�]�Y�!��d�f3lW<����L�(��9(�O���gÜ��6�R�DO�8�5�#�<N��Yj9^p�!�L�L�f*&�L5$�0/���q�>���0��?q����Ij�F0�ə7`�R3�ct���� ��ˌ��&ǰ�Mcu��B��^\Sse���s.d~?	�v	�$�ф�UF8��%����Mi�P"G�;GG����w�`��p'��"`�G�0��IK#<M|~�)��~�5 q��u�5G�\�G�޼�d<N���f��3�B�dwE*��x"�3l���� �b�qf�˅*36���9ٴxO��^�W7�U���p��w�����^,�Ô��ԍ^*����=*W�AI�����>t�m�.Q��e����h�:O�\л��@.���"�ǘeN��D�N��Z�0$��f����-	�=�1ߞ�菰����!���)z|�>Qk7նD��X�X^����ňZL��5q�r�l����Yo@�iy�H��0��<�3���w�����0='��ÌVY���C0������$����;�u>aMR'#��S�9Od���b�fu0v��z�SH�i�W�5�aք����[��dR�NA*7?��aN�%d2��w�=&Ht?�d#{������#�hB�wa{A*�1`c����\v�c����f�(R��uz���v~NC����f-,4ay3�����!��i�BV�\0R�s����;�}u0t.���^bx�R��%�ώ(��I �/�d[��8a�'g��ORi���t{����P��PX���q:��-g|����ۼĿ���[��T/�3R��c�9�)�Ayy����%l���.-��E^bl>I�Ҡԧ�5����l�V�M��3�z9:�������qKo��Ww-\�^~k7ի�&]k����sc�qiQ@3cH��!�K��� �QM����>E��)��4�7#Qʑ��,w$��Nd�K���+��9e�(�'e:X�)i������25�J�&�YRpu����������Ko������b���������ːL����Q�q�{�0�4pQ����c#��614�U�C����o��I5
iih<�K��ƇD������P��?��G��-�9�����V�8��p�B.��_�R�u�SS;P��<��Oi9���[&<n	 z��pXZW��"�������:���~��C��D��� �J�N]�j�p�.�]�5=uʱ(���Tks7#nâ����Ǽ-֛�>�E�4Q�b���C��ә�Sdq���v	-�^�9�j��bt�[���4%a�&�h2�0r�P�Si���A��ͺ��9]��'k�j�x�.��[�$���4�+{�d>�(��H;��D`�.{mν�Z����>��d�`|�<B̑솼Y�AI^�1o�+FP��c7��r��ȸ��GXi��<n��G�{Y�����p���jE].���j1�j����M�^I�(�_G����H�
�x-UV���ҭRf<G\��v��;�ؚ|#�3N�E��C��?9aeK0����3N��h)�_'^�x�x����GG�J�MP��RC�Nk��W�cRC�LfL�m/����4=\��5D���#䳁$?qe��[��f3�y\s��KNYW�w���5�
��[³|rZ~GF�M��O�B��ʾ�O��6��ұ��j��>�=R������'_����}	Pص	��>���y=4eF��:d�5�J��55�MHޫ�oQup�_��k�,X��Vo\�Z�����KR'���:�=[�_�x�T-������yb�,��������r�hg&GA޳$�b�b!�����r=�!~�Xo���5�ehO�����D�b���"�p���?���r/%۴p
�|*��g��;�vO�����9m�7_��FׯJ_��Qr򪔽��~�'Rw�
9w�9fua1�H����r��k!�R����&������啟-̪�sj��,����O�	���p��p�޸��(�˕�+I�Z����5˿}����)���&~���L):�    )j?���6�M���1�`���A�b�(<Ԗhx�������Bj����ʓ�,��y�S��2�H��#�[��Fo�}����g?F=�83>➦X�M<a�d���0�L�>�������tl9M�������h����7�33>���`|�I����<��
٠�ϥ.%n}b�P���t�gf�\�}]�Y�Y�������f��s��c�@�V�5���+���K\�qus!h�1>�B���#�Р��:_��O��z�E�~��S>��Q����w8�R��|��s�<���: W�V䍩����G5��֙�͐��׫XJ����7Ը�޷�w�C���r8l���r�0�rFLC)k�(G�+k��6lC����;)3��j�RٰEW2��2ŷ��/�.�����o���i��=ΌO��g�,�^����)'�g&�VS3)+����ÝK[O=]ʫ3ß�&>�(�+~�!�J�ܢ���(���}�M�@C^
x��sQ�����=�
S�`�޿S�(���m����8�4 �
o���˨��*ֿ[�W�1 �����X�;1�E�6Q��f&FΠ�$��#�ѻ>�ȁ5�\R�J6�.���[�3h�ޚƸ-������:����Y�>�|�U�L��E��)E|���;��#����/+v�\X���׶�(Ot�d.�`<����JÒcf�G��i����L.7�9�e��߈N�;��v)<�����A���Nr��ٴ�L��J���f֋k�Z��1�L`pb{v���2_']��L�$.(���Kj0�n3,�"�*��>�R�2o�&%H5���?$��RJ�N��³
��!uj�"U����KF� ��k�3�/��c��3D&VM����$?K�#�Cڋ�.�$�z���_AOc_�00��	�aj5�s+ۚ�k�1�}&�2�}>#w�#Br��%+"�}��EU/^'31���(b����~� >���M;��{�t����Ҟ��MO2���s���T���EE-]&�� �����_viO�K>���e.��\�l�9S���p�dK�
��ڣ��d2�+^/��p*x0B�U�o-=
��S�e8��*BU��o���yoX~F	�}��Á�Bj��C6z�q�	��Dz(��a��:����<?�~D#�d�4ݴ����*5C�'MM"H:�~�$�IV�=�t�fd^�,W�X���k�g��b��?S�:�K��21|�ђ��ŀd����I0�^�F垶�j�~q��^iU�T7�j�\�@����������v��gJ��kv������~�F���#�c���|�~3���������g���� ����8��H�j1�La�(��B�"W���+v~^����%#тq��ĩ3�'(Xd�X�{�D:���Z����A��׊��i�9@�`|�M�_�M.���EOhjnb�5�M�]�t��ϩ�	�# ������$u�%[�+6���� ��=��_mؔ�5��a����?�+=�E$�C���T���F픔i�E�F�4 lK�?��ń6���p��(����歂[3n&K>tz���R��wR���A	W,�&��Qf�4�DXg��j>�܈6��1_�o����nW+��V��_�w�wW+�k�q�m�I�a�]k��ܝR�4�t:f��rJ�0V����2˛��ZkU.��]�,����}�
���G�n�oM].T߭�����b��l�ZY�x��[���p���k���Lqv8��I����� �9)�,�@4��3� 2#���絳̆��ۦIt�r�E�Me�2�ae��O���b\<��)����:_�V6J�Y	�Ŷܰ�rr�~H�Sb����
N��㒸#��n�T�`Z���g�_{����(� �M��*��u�Vc��H�lV7*k��h`z}J]F�'Zx�����,=���#��>b�f����/�}eZ��ȍf&����c�X���N�N�6DJb˚&f�X�ү��t`�����gN��]��E��7泶l�ӷ]���k���.�{a�mŝB�2�)yX���t}���љ�LX���뚩�#�m�Ԡ�6�`)ꈑrZ��N;���.;�j���/�w�f���\�T�e�ŗ)�����skr��7܋)6�ȡ��iy��ק���=��t�e��W�W+���Ŋv��7G��u0�~��㼺'V��ڴ<�^�̀�#ŧQ�ѣ�0���FC���ؙ� y'j!���5Mi�.� E�J���1r���=����YIOH����p�8^t����rѿ����659�ΘU%E��}�Z�b4�E�`,h���)�����V@��!�*�o���h��n��t��D!R1�o���M��4/^��PQ�N!�ƭ�G��].�{��9Jr]�9��ŕv<+�P�6�#Vd�CS�i��e+	vT����<X�
Ե�+��)�|��/��|����!t�i�>"_�'w��w*J�9�5�#1��KԤ�scP:�r�PV7W�T:�8h�x���[c��-�&1<<��t�-����Ţ �O�=��J�� 3�"� �6m����(�2A��ZA�O��=�W�)�5oi`�o�;n\�X4JӑS��2r
d+9��R��$7�� s��\?�z*DT(%�����%��!d�5�����1�9� @�:)�r%8�f9�r(2�]�k��G�&5�کZ�|���n����j�t`y��zWK=�B_�����r��3w�k�yz�v�0����G�ru����tl^)�v�^�3����g�?M�p�n�����S<1Me�+�jqu�TY+`(�YxM�f��A�0�BWs"�oP&���c��;�R,��9�uajF������:}�􍏹KB߁�q��+6��Z�0b��c��{t�p3ww�+��3����q;#���O��Yw�;��X�m��K{5'/0���-��L��)=U� !Bl&�^��GO/).��W'8#m�xR��蟦�ˮ��k����)��͛��բ�Q�]Y�L�X���*�pc���h)9h;��L�������L�6�|H�w�4�+3����Z�Tw�L�t�Ά�y9�fVnJt����},-6a��)���MHa�v�p��]��S��I�tt�"�� Ӊ3d%�Fj�Y�|�2�����G4	?������,|��)�i��+�X0<�1�Z[
?z��*��<���E�z��#�=�x�wnHf��To�jj�:����a�%| ���N�~mv`ei��ʼ��E*�c3(���W�o|�p{�8�R-��R����u�ѝ� �H��#�X/�掅�`^�F-���Gs����� ��Ɨ�	�ٺ���i\&�0Q�Y��s�\[Å&θqi
�tw�.�:�|A�L�Y/%����Ia��O$M���bS�*�B~����1"%Q��ys x�����,/2$�eSe�
m��]�v�/����J����4�ڐ��>aÄґ����h��,%[Y��������u�F�R��]g�V��`���,h�7���F��sX��rim�X-�R��CCD��AG�	T�.�`z���eԯi�y���(I��R����<u��N�I�1�Mm&#z��z���������"�~'G��{�~�o�L�,.M�̸��X1��bnd 7z)39��w]�����m�ΠA9��a��
�"�x���^���O������d���u w�|s�v'(Աɿb���t�#H��=��zN�꒟:�yjF���	o�`��V	P�u J�nl3z~����}!B3ˀ������E�L8���� 5(�؁����m�Ο>��������ÛxmO[iP�$�!�R=s�Z�S@o�w͙����Rt�O��Fm˿b�'�]�9$B�n,ug��x��N?����{<��p��c��)"4����P��e����v�ѧ�X��݌^j��e���UW�k�@_��
�6Ε�-Vo����R�1��f
��Nx6LO���>� �����9tr�S�������7E�����8S9A�e�k�.*�?�S��i���f���g    �ԙqH���������8#�{�A"#��!�3|������s%��R�U��&XO�[�ȗ���2�M��LZ���NL��A�ߕϹ�Sd�\8/�1��n_/z���u ���O�#�fF��dfWx�i_��7���O�Ҳģ`�n 8ƹ�X��t���H5wk!���_�������SҪ�{��q^đ�����/�{�OCـ��-�K��[�ջ�V�`2'Yfb�Y��:u������7�Z5���̉G@�$�x�L��7�3���y+�&��ݶ��PM�����b��w+�{��C�q3jp��h�sCS#ڟ�:��B��.�D�w�t�4a����U���Z)�Go�_zQ�)�.�912�����lY�v�cL�$�;^���]��^�:��^��Z�g�W���Kg�艆�Ӎ�{[`�C��'1|n�yC�&7 ~p�
��{>�!&���=j/M���?��;&�)��9��c����^"��T���e�%ÜŻ����$��!�!����燆_�2���,�.��Gui5�$��O�R����O3G.�S2W�Z-�͍;�4xb9-: �`�CĜ��?
�S�#��i��$qtڂANOY��'�D�y�'�B�׹մ��P��8i�CS9*���@-Ez�"�C�R�$�E���I�� ����iߞ	��	���ļ?�]ό� �� %%h[�Uh�Z2�����I��R�f��i@�MQ�s���&���o���:����g3��\�u��������=u339���Ĵǧ�Ԫ,2����_ޔdo�a��G�����v�X������JB�6�f
j9L3��ϽH!�p����;�K�ހh�v��=�	'�E-�A�2^��@���
�A;�N����^B��O��������C�6�����/V��DS��8<m�ch(.����D��P`�S�ռ���;\��g~ތ_��z<W$^�Jڧ2n��(��&�+���2b��_1�a+�@|�]����kצ��3�G������Y�h�/}�o�ZZ���W�dr��a���ئ�����p�T^�W��F���P�R��՘)L� �c5k����E;��N"��R<�I�]3�4e��g���� Zo��d�F�����!מ�9Lsu]�.Y,�c�#����D��''���A�A����s�'���ƴ!�]�\j
Fܙ���`�L]9�}��(A�n��s�;�,��<Sa�ˀ{�P������v6أ��I�1V֑0-L�ԫ�����98<MZ_�"�*���~.�3`�E�)@G�_�1G U1�1�W+��E�=g�X1�ٴ2�x�4���������e	,��)���n����{�x�#L���i��b�^iC-߯�"�H�l	:����+w������t�)�M�i+�f�S�si�[��)������Q���S���Ӈ#+�L�[��>��)a-rg����)��ǣq�ҏ����*�]��V]��REȖ[�P7)8yp��t,u��Ӡi���m�>�7�^2�sa��y��9�k�d��g�������?>�I�$��$��4	2F���?��p���S�NR2hD��ܔ��&�z�J�&��<�m q�7��h3H�H���@�t{��6e�݁߷�I}��������AR-ެ �&�=3�:�Fv��荀P_J�"H��71��
#�\�I�TF�|�p��E�"uL�����[�~���%�hYA�݋���O�k�(�1����`��!:/��]�I�L�"���;k�j3\�JK��2wo�!�,�
SK��pc�	Z�]�٪T���C>��6�O�-��6k�c�VPa���.Wg��APW@����4�KcN,�jb�x�&X��L�Y�u��-.�H���&���	���RҠH�mS�{ ����&�;�Y��ȠY���~�Qݼ�#E���+�tA�,z���{��~��^0�9z䥒=k�7k4�-��,��^�z.��w�Q6��{ΐE���܈�wF(t;��9)�[�4k*��6���)i���US�����2t�}a/�[�^�<�Is�$�չ� J������jq�6'��ͰLzT������E�ߩ���=/Ի|�ǇM���B�rO��ram�N��\�
��?G��:<��(�9�i[^"/5�&�v��������8dy��M	�.�O)��qB6��y���@P���;aM��ɾ��ΠeƸI�k\��~��N�K�u�NBM�WٕL8R�m���k����󓗑Q(���M�b���-�6X|�MKٌ$l���sf<�+��X�/P��pN�:�ƥz�QyM��RҊ�{I�C���b�r��q��Oͅ���Y��2�&'���D�Q~�!��Yr�2A�`����#�r#0t)c��;B���&�Lͳ���3��_�D��i$5�r���j�l���@Z�������U����S��F5�i3��W�мV3Ut��y�Q҆G����W�W<�/���_T����^7�"���8$�B�NS�|%rK��
M�)A�q���Q��C3G4�JMB�>�X+���κDbsqxæ���p�"45��?�a,[oJ�oF����	�����9&I�7��0#�ai��C_�)Z�B�B����S���*x֟Ni�y$��Ln���sbMq禮�����U"u-ڡ��x�t�:�3�B1��$��S*7�}���u�w:�����-�LM��H"����W��S���_���ty�X�u����ӕ�Fa��yZ��׫y}4G�t4g���3u}��[*?�e��dXSU#����\/��kì���zJ��4�ݩ���''8��#�9xб���D��3�.�<
v'�fu�V&�j������`��ɴ�b̭`:1$L� ��l���G��-ײ���l9fv�L��z���t.�¤CGU��v��<��aN�����"L�	��w?°�^�T�R�^T�s�4C,��7�[� �w�Iz"�e\ERA[����VItw�EņD��fg�z�8V#�i\4��$���v8}ṫ�p�
��d��<��v��V.cgR.P�uK���o}���N�J��F�����������[�ȅIܲ�>�����`�T/�l;�"{9��L�*�߆)���L��I����,D��vSQ�|<y��v�*�!�� ��1�hH�Q�zZ�(-,��#_D���a9{o�uK��V|����T��]s^ќ���a�i� ÑF�#|���#�"}Z��N��O��
Ս׫�5���p!�AV�P�l6NR)QwM�grMn�s�zԂ��v������Ĕ��`-&N�L�sǍ��~��?���'��������X}��1���c�,��q}&�WK?/�[�T�f"��
6��x��"xΗ� ���|�9X��9�H�7��8��hYMD*c7èuӣ��\��ݑ^�m�y,�	�k4�*��GP@p�����
YA�3�%:�K�[��BY�3���_j$����n���Y�v84��:(�Ro��(�-Ң�-6��ͪʏ�'����N�&\��W:/�͝���D4o������N��\�`pq��&����Y�Մ��{���H��
��\Rz&�l���H�%�t_°h2?Ì�k��ka����P2�w��L8�δ�����s���ri�XV*�ni���g6N�A�$��pPUw�E@X��*bTa{����Ȋ��aUf_2��܋h=4C2d�x>¹J�H-�:R���e=����B�)aQ��7���iJ���mQ?�߼�o��ԶO_X���a_J���!~�=�<y�ʸ��l��=w�ygW���ԃR����+�L�T6��R-nE�1!��x`=�b��;�@6wS��H�Z���V�T�r�h�12=1]���<�"���7�����-ì0-��d����
(����C��L��{�kr�O�����_���s3&#���2M��ش�]��fIP�84L����u��v�vK�EmsE�=��?��)?   �a�x��m��b�O��;�Jf���~,
��W��z�pGY�������Diբ;�>N��#4�ؙQve�Ȱc�zClZiPO�1:���.��g�HG2��O���LփS�����^�i:e�������_�}���I>K���ϴ;�����3�����|}v�
z�y�z�7�I���Mo�~�3i�>�����(%[��OߤLO����p�Op5vX���%/;3=��0���g��/-����Y��}��i�B��gi�LS���3��U��h.v�J��u�sN���E�o���iv�����Z)FA��h'&&�,uW���I�(F$.���;���;u��H ������jZx0�����dy�����cg;x��u�p��'N����3�҂o{�����aB�)�E��9�sn������ܘ_X�V����dr�C�T<Ɛ���݇l��
N�����\���gbL�ĽΛ��POj�G0����2;ѾZ4�؋�!��L�!
�2cʅV:ZIŅ��j�Tx���Iz'.uC�
���N�l�|;�!��Tp��ӱ�5��*��r��: r]�%��AB�����?�����W�'r��a*�/@:툖Sh�e/��_�DV��̳D�b�B�N��>2J�q�� o�W&��S���1<8��w��s�AH����|��<�fu1��/��7�cR%a��tsS]D'����K�����n��bn(;A�KA�p���e~�����&��=�W�&0j�R��RW�����.��͵[N�&��MU�؋U-K���!KI�L�.߯N�K���ۆ�H�
��p��Ɲ^���h<3��z����A�D�ڣ��3���p�\k��AJ���,'I
S�n���_���P��Ж�e@7����֙�0f��@�J7#��L�jy:h�Ǵ�<H��Ͷ��ҞB_���/����(�}.6��{������+s��	6U�pH��	:�X�䫽��z�#44V���E�o3���}/��      �    	  x�}�[�$9��]��߲dYZ�@?�����az��q���P�SU�+_d�Nd�6��ǟ���������o���Z_�/����~���������ߋ�9�9<�����9�m�9L9,m�sx��l��a�amC�a����<�g[�YFZmy�^1l���j#�f��i��V�����Ռ�V㴚I��j�V������L�V㴚�Ƨ�8�F
g;�B�%c�7�*����|ϳ�bKfT��EX���ó�W \!�?�H�вI��j3�тa�D`�����L2����YL��L�i�W��U��&��9{�X=.6�Y�@�2ʽ̒!�`�`Ƚ��&���+籂��%L,^0�i�٫i:�,��݈K��M�����@2�䊙sĩ�̜��Y�3Ϥ�B��0�\M��	��5fZ������y��8�+�F^�R� ��F�'M0���!�0�=s�a\��ȴ���@hQ'��ܓ0$a��\jU�-��SX�����4A��gR}�FP�C�L�(N�F@�T"H7��A7P0p��/Z�g�����#��B�%����iM�3�,mq��q��.c7�w��aA�=*��~P�S��C�� �T��b$K'��y�*���B��aB4�U`Њ�<�j�`x'�L�fm�}|�5cƼ`�V4��<�/q.��A�D飚�&l��=���S�gw)��W�B֤�Ffy�4_iۭ��Ԭ�#�Cz!��v0�`�z���j��G�0�p���<��F*���Y2�r-X��V����X�Y�c7Vc�f`�{V�6F("�	F�g0���{C�\b;4��#ݿ�#j4�L��tE�+�+)䶈P�Y2s乴�1t��,�YMτ��ϙǲ��Jae��g�<�9C���*�������C]P0����)[͓���g��D����}&ȧ���j�-Mi�g8(B���!o���x����@�>#p�<0b5��H==�J����2������+��(��W0W��aEc���``�3<�9Gn��:�s]5�v��{TQ�Z�5D: z�
BxF�I^����ط�F�\10L��%d�YM*-A4�	��h>+]S�>:�u�!��?h�*����K�%��SAZ� �SM�v��?U�I��h�*A������S� T�6�����'�fmo�9�}�y�B�FZ�+-P�(�BZ�qs�>�=�6F�)��9Ά�Qm"8L�d^A"(H���k2r_��x0���-ׂ��y3s�\ HH�+�RR���rH7�r�/cЩ���x��p�
�܅�W�q%�j��)O�����[�u/I��]�g�J�2�A͕�갆rK����
�`T(vy���m3(o�����nF*�'AV��2#Їa�-*���A�o�~�����͠�{@��^M�ݑ},b��*���@,�5BK1b��g�˂B���eW�ͦ���Ee� �XAX.��%�?ο*�z$��=�v۵m}�c?�$������
��=Ě͗����hNk�`�$��ك#��k��j���#����3���d�B"��f������h��/�^MF���Z�{�X�X�rHƂ��ە�я�4���W��K	��٠�� @�8�6�j�� ��*�� �p 0��Ɗ�&-!��Q�X@�R� �5?|	�~��=�{�h������h���d[9����2d�74J���	?\�V6rORB}��L��v̽!m��I��κћ�d�!V�Ѐ=�0"�z`^c��}�1�J�	�ys��}c����p��{������x��v��؃�!*����	�/�Cx=��&��C��5՟`D�i�#�����-<8���9��ڭ^$�����A���?h��ب1�Q����NPȄ3�@{����'g���E/�ܜLk
���h���'�q���P�%�| �3�1��d�D��nJv.��J2��#�6~2�!�d�+8�`c[i��=W�Ԙ;�	������%KL�є�}s�C��_��`Vc�Q���!������[������5���X�ZX�!ꔎj66v��]�)��\�~g�YàP�������1�p�g6����>����6&��Vb��㳛C5G��`�X���ۥ�k�Wp|�sa��7��0��\��E����L��bC־�����,޲
D+��l�qQ�B%d+��\��-(\��I�E����.���9��(\�k����o߾�M���      �     x�͔�n1��w���FՌl_{f<�.X��@��jK��v�U�XP)b�Y��6�D���3\��NUͨ	�HHv�x���|���`���m�?���˶��@c����5�	�LS�F�~ �ŚF���r�@�x��iBg4�)�"�
�M�>�*���I�3c�	(�A�e���T�)J!eۺD�O�.�K?�ē��*�jۄ����*A���-ho`߳�w�a��+���<�:�:�Z�"Z�W�h�^�j�;��m�k�.�2܏,}B��Z��u��`$Eзёc��#F�uG b�LQ���x����s�/�8�#��
hk�1�a���#:O������,j�6��29�mjB�͇�x�a7����t�TE*_ν2��2+�q�.�Vp�b��p��"�c�;��آmc[���5�����}λZiUI���e�Ľ\��;'��{������0q��+ٮ�jW^�+��ʛv�m��y��+ߓ?��e���Ҫ�k儖�
3�c^��^ԝ7�$I~��      �   }   x�=��� D�a��C�v�N����A�� 8�[\�W'k������F�^ɈO�S.ݕ��A%���I*՚p�Q�[5K�j�K��GI[��_�w"�t[���K�琣's�w��ś)      �   �  x��W[S�F}^�
?�P�c��e���6�c&``�"lI��2�/�O\������t�R
m'}���/��Q�]��M@��,�Y��w���d��|�����
�9>t�ݟp� %g*v������KY`4�jǳ-&���1[K2�37:[��bF��	�)��Z�1�6�t��'����J���S���"���8=�(�k�5lG��S�r$��V��L�i6*͔<:^�F��b��5PbDs��f�!AD�����`�Bp��(����]sW��� �
=���
��5�l|g(�2�5���\5�*J��c*�U���|}d���̴c�3�J��>�Z�b!�gT��9W�)>�{�6<oq<�ۘD�_�H|���+����BC�􁕎f&�cm>36=�$�T,ʺ�y�+Nd[a�:����V#�N��I��.�����i��~w�|2����x���� 
����q��V�a�����6��9�j5{H��{��AI�B� IQ@W��Tȧ0��4�n�K��_Hw�ħ�Z�S��>@��������y�}��Xf�� �]�%��wf��̒Yuj���� �/�H�R�B�.2�����P�*�=5��e��=T�q_��8��<��qK0 9�xI�XyP� !N�#QF }N!R�o�F����OPôL;_�Q���UJЅ��?���$�F�+�|�ys�x�0#�!��T�'A��6�v���t�*9_E�]�ή�!�Q���J�=�&��&]xKmND��}��Rv����_]3!,H�RI��X�����]Q��@��0��5~���m�s@���:*]]E�rgY�q쥳���(�mI`�@��t��/�ל�n6���B�]#��C�kDr�3z���$����W(*D� �<�:5���i���>�O����O�՜.f��K�*�X��4>�T&�ѡ9#]��c1vr(ٜ�GH"»�K�u�;��S�e��m���i �������$�L��z��Kr@o���V�i�$ț�Pl���3
$p��Ƀiz�o�]��r�?>�R�Ȉ��Q/�iG��?p�"�g�J���"���0KR�CAU7c@/TJ�C��F@�u�SP�w&�>���;��#X�(+F�S	���J  ���=���R1m�W����x����"I�C{��k���v7P�}�ƺ���cX�g�8���,����_@/��̄�y)��O�@ �/�Ia      �   Q  x�u�MN�0������]X���JAb�W!E���9��F�LZ�N�"r�͛�7��@���z~���o��O�����-��� C���V�o���As}}T&�����0������V�H���hєNֈ�\:<�vO�a(9p���36��ɢ������90�2�(���4	|5A������Yl������s���)����A4�&^@�F��i���u-6�i?n���v�6r.(ut�F^Z��4�/�-���A2��3Ȇ�R�~�q}�y��G���������0(�g��<Ѽ��e
��(�[�>^jhW��	4�ˑ��&�wJ�?00�     