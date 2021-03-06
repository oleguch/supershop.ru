PGDMP                          u            osamylov_db    9.6.2    9.6.2 B    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    16394    osamylov_db    DATABASE     �   CREATE DATABASE osamylov_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE osamylov_db;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            A           1247    16407    badge    TYPE     L   CREATE TYPE badge AS ENUM (
    'none',
    'NEW',
    'HOT',
    'SALE'
);
    DROP TYPE public.badge;
       public       osamylov    false    3            �            1259    16415    cart    TABLE     �   CREATE TABLE cart (
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
       public         osamylov    false    3            �            1259    16421    cart_id_seq    SEQUENCE     m   CREATE SEQUENCE cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.cart_id_seq;
       public       osamylov    false    3    187            �           0    0    cart_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE cart_id_seq OWNED BY cart.id;
            public       osamylov    false    188            �            1259    16423    cats    TABLE     Z   CREATE TABLE cats (
    id integer NOT NULL,
    name text NOT NULL,
    descript text
);
    DROP TABLE public.cats;
       public         osamylov    false    3            �            1259    16429    cats_id_seq    SEQUENCE     m   CREATE SEQUENCE cats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.cats_id_seq;
       public       osamylov    false    3    189            �           0    0    cats_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE cats_id_seq OWNED BY cats.id;
            public       osamylov    false    190            �            1259    16431    goods_id_seq    SEQUENCE     n   CREATE SEQUENCE goods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.goods_id_seq;
       public       osamylov    false    3            �            1259    16433    goods    TABLE     �   CREATE TABLE goods (
    id integer DEFAULT nextval('goods_id_seq'::regclass) NOT NULL,
    id_cat integer NOT NULL,
    descript text,
    price integer NOT NULL,
    badge badge DEFAULT 'none'::badge,
    name text NOT NULL
);
    DROP TABLE public.goods;
       public         osamylov    false    191    577    577    3            �            1259    16459    images    TABLE     k   CREATE TABLE images (
    id integer NOT NULL,
    id_good integer NOT NULL,
    img_path text NOT NULL
);
    DROP TABLE public.images;
       public         osamylov    false    3            �            1259    16465    images_id_seq    SEQUENCE     o   CREATE SEQUENCE images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.images_id_seq;
       public       osamylov    false    3    195            �           0    0    images_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE images_id_seq OWNED BY images.id;
            public       osamylov    false    196            �            1259    16397    users    TABLE     �   CREATE TABLE users (
    id integer NOT NULL,
    name text,
    email text,
    pass text,
    address_city text,
    address_street text,
    address_house text,
    address_app integer,
    phone text
);
    DROP TABLE public.users;
       public         osamylov    false    3            �            1259    16395    names_id_seq    SEQUENCE     n   CREATE SEQUENCE names_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.names_id_seq;
       public       osamylov    false    186    3            �           0    0    names_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE names_id_seq OWNED BY users.id;
            public       osamylov    false    185            �            1259    16502    orders    TABLE       CREATE TABLE orders (
    id integer NOT NULL,
    email text NOT NULL,
    name text,
    phone text,
    comment text,
    city text,
    street text,
    house text,
    app integer,
    delivery integer,
    id_user integer,
    "time" timestamp with time zone
);
    DROP TABLE public.orders;
       public         osamylov    false    3            �            1259    16500    orders_id_seq    SEQUENCE     o   CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public       osamylov    false    3    200            �           0    0    orders_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE orders_id_seq OWNED BY orders.id;
            public       osamylov    false    199            �            1259    16441 
   sold_goods    TABLE     �   CREATE TABLE sold_goods (
    id integer NOT NULL,
    id_order integer NOT NULL,
    id_good integer NOT NULL,
    numbers integer DEFAULT 1 NOT NULL,
    id_variant integer
);
    DROP TABLE public.sold_goods;
       public         osamylov    false    3            �            1259    16444    sold_goods_id_seq    SEQUENCE     s   CREATE SEQUENCE sold_goods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.sold_goods_id_seq;
       public       osamylov    false    3    193            �           0    0    sold_goods_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE sold_goods_id_seq OWNED BY sold_goods.id;
            public       osamylov    false    194            �            1259    16467    var_good    TABLE     c   CREATE TABLE var_good (
    id integer NOT NULL,
    id_good integer NOT NULL,
    variant text
);
    DROP TABLE public.var_good;
       public         osamylov    false    3            �            1259    16473    var_good_id_seq    SEQUENCE     q   CREATE SEQUENCE var_good_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.var_good_id_seq;
       public       osamylov    false    3    197            �           0    0    var_good_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE var_good_id_seq OWNED BY var_good.id;
            public       osamylov    false    198                       2604    16475    cart id    DEFAULT     T   ALTER TABLE ONLY cart ALTER COLUMN id SET DEFAULT nextval('cart_id_seq'::regclass);
 6   ALTER TABLE public.cart ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    188    187                       2604    16476    cats id    DEFAULT     T   ALTER TABLE ONLY cats ALTER COLUMN id SET DEFAULT nextval('cats_id_seq'::regclass);
 6   ALTER TABLE public.cats ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    190    189                       2604    16477 	   images id    DEFAULT     X   ALTER TABLE ONLY images ALTER COLUMN id SET DEFAULT nextval('images_id_seq'::regclass);
 8   ALTER TABLE public.images ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    196    195                       2604    16505 	   orders id    DEFAULT     X   ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    200    199    200            
           2604    16478    sold_goods id    DEFAULT     `   ALTER TABLE ONLY sold_goods ALTER COLUMN id SET DEFAULT nextval('sold_goods_id_seq'::regclass);
 <   ALTER TABLE public.sold_goods ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    194    193                       2604    16479    users id    DEFAULT     V   ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('names_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    185    186    186                       2604    16480    var_good id    DEFAULT     \   ALTER TABLE ONLY var_good ALTER COLUMN id SET DEFAULT nextval('var_good_id_seq'::regclass);
 :   ALTER TABLE public.var_good ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    198    197            �          0    16415    cart 
   TABLE DATA               b   COPY cart (id, id_user, id_good, number, delivery, city, street, house, app, comment) FROM stdin;
    public       osamylov    false    187   �B       �           0    0    cart_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('cart_id_seq', 1, false);
            public       osamylov    false    188            �          0    16423    cats 
   TABLE DATA               +   COPY cats (id, name, descript) FROM stdin;
    public       osamylov    false    189   �B       �           0    0    cats_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('cats_id_seq', 23, true);
            public       osamylov    false    190            �          0    16433    goods 
   TABLE DATA               B   COPY goods (id, id_cat, descript, price, badge, name) FROM stdin;
    public       osamylov    false    192   9G       �           0    0    goods_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('goods_id_seq', 133, true);
            public       osamylov    false    191            �          0    16459    images 
   TABLE DATA               0   COPY images (id, id_good, img_path) FROM stdin;
    public       osamylov    false    195   ��       �           0    0    images_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('images_id_seq', 476, true);
            public       osamylov    false    196            �           0    0    names_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('names_id_seq', 62, true);
            public       osamylov    false    185            �          0    16502    orders 
   TABLE DATA               o   COPY orders (id, email, name, phone, comment, city, street, house, app, delivery, id_user, "time") FROM stdin;
    public       osamylov    false    200   ��       �           0    0    orders_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('orders_id_seq', 1, true);
            public       osamylov    false    199            �          0    16441 
   sold_goods 
   TABLE DATA               I   COPY sold_goods (id, id_order, id_good, numbers, id_variant) FROM stdin;
    public       osamylov    false    193   ,�       �           0    0    sold_goods_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('sold_goods_id_seq', 4, true);
            public       osamylov    false    194            �          0    16397    users 
   TABLE DATA               p   COPY users (id, name, email, pass, address_city, address_street, address_house, address_app, phone) FROM stdin;
    public       osamylov    false    186   j�       �          0    16467    var_good 
   TABLE DATA               1   COPY var_good (id, id_good, variant) FROM stdin;
    public       osamylov    false    197   ҫ       �           0    0    var_good_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('var_good_id_seq', 67, true);
            public       osamylov    false    198                       2606    16451    cats cats_pkey 
   CONSTRAINT     E   ALTER TABLE ONLY cats
    ADD CONSTRAINT cats_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cats DROP CONSTRAINT cats_pkey;
       public         osamylov    false    189    189                       2606    16453    goods goods_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY goods
    ADD CONSTRAINT goods_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.goods DROP CONSTRAINT goods_pkey;
       public         osamylov    false    192    192                       2606    16482    images images_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.images DROP CONSTRAINT images_pkey;
       public         osamylov    false    195    195                       2606    16405    users names_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY users
    ADD CONSTRAINT names_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT names_pkey;
       public         osamylov    false    186    186                       2606    16510    orders orders_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public         osamylov    false    200    200                       2606    16484    var_good var_good_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY var_good
    ADD CONSTRAINT var_good_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.var_good DROP CONSTRAINT var_good_pkey;
       public         osamylov    false    197    197                       2606    16454    goods fk-good-cat    FK CONSTRAINT     b   ALTER TABLE ONLY goods
    ADD CONSTRAINT "fk-good-cat" FOREIGN KEY (id_cat) REFERENCES cats(id);
 =   ALTER TABLE ONLY public.goods DROP CONSTRAINT "fk-good-cat";
       public       osamylov    false    192    189    2066                       2606    16485    images id_good    FK CONSTRAINT     q   ALTER TABLE ONLY images
    ADD CONSTRAINT id_good FOREIGN KEY (id_good) REFERENCES goods(id) ON DELETE CASCADE;
 8   ALTER TABLE ONLY public.images DROP CONSTRAINT id_good;
       public       osamylov    false    192    2068    195                        2606    16490    var_good id_good_var    FK CONSTRAINT     w   ALTER TABLE ONLY var_good
    ADD CONSTRAINT id_good_var FOREIGN KEY (id_good) REFERENCES goods(id) ON DELETE CASCADE;
 >   ALTER TABLE ONLY public.var_good DROP CONSTRAINT id_good_var;
       public       osamylov    false    197    2068    192                       2606    16518    sold_goods sold-id_good    FK CONSTRAINT     |   ALTER TABLE ONLY sold_goods
    ADD CONSTRAINT "sold-id_good" FOREIGN KEY (id_good) REFERENCES goods(id) ON UPDATE CASCADE;
 C   ALTER TABLE ONLY public.sold_goods DROP CONSTRAINT "sold-id_good";
       public       osamylov    false    192    2068    193                       2606    16513    sold_goods sold-id_order    FK CONSTRAINT        ALTER TABLE ONLY sold_goods
    ADD CONSTRAINT "sold-id_order" FOREIGN KEY (id_order) REFERENCES orders(id) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.sold_goods DROP CONSTRAINT "sold-id_order";
       public       osamylov    false    2074    200    193                       2606    16523    sold_goods sold-var    FK CONSTRAINT     ~   ALTER TABLE ONLY sold_goods
    ADD CONSTRAINT "sold-var" FOREIGN KEY (id_variant) REFERENCES var_good(id) ON DELETE CASCADE;
 ?   ALTER TABLE ONLY public.sold_goods DROP CONSTRAINT "sold-var";
       public       osamylov    false    2072    193    197            �      x������ � �      �   �  x��V��G��_1�X>'~��S'6N$��I�)��#NV�����p��[r��/����DUճ�%���;r^����ݼ����>�qV�ʸ�����N��^�g��34c���?}�������w���x�#��7o]�`���P��L�0���6�+[?���각��hy�R״]ࣤ���i�9z�7�>΃��_�M\��ƙ,TX�v������x�t��[��Wļ��o��3{8�ӭ���c�`�c�C���)/Ώ����P\��2
|В���:l�.*X�م���$ϑ|:*q�P6+pp��%.a����+��_p�|����^�
�j�}:
o�b����b#���\�����O�6���b�Ր�P���kd
�مi��
A��;<i萤Ij`�0C�j�f����2E��Ԓ���%�C#��l�����}�C,��2-�L�>����46�g���_��詐j�u� ��έ&�+,+�9U� NE��@�`�H@��IΨ����_��z���C{LDʈ��M}�����:@����>�8���e�#NrW)��/�T��dL�v��P�>����,)ׅ��
A�*%;YS��勒Նw�.��� MHkx�[��r�Q�%��✊Tԋ�P�7�A�P������d���?�p��JݧUW�x��rٚ"/�>g�\�ݼ�����J&J����b�P����BXf]5�NE�Vf}����&�Ȣ��by#�)���a1ξP;�o���>�T�2.e����a�Tdך��$��s���&`��U�+�?+����F�,��i4���3O�x�T͛��j���Y�z��1+J��S�Pmi�t�Ҁ���SI�I9wk�9����D�������_Fl��Q}xzUD��NKw7��S�}�(�tm�q�X��ᱟ�'�5Icu���)`�x7`RCBl١���H��׿�il����
)�bt��gן��?]DG���^j�ǥ�~�t�aݤ��aQ��;��]U���iI�������������N��V�y0\S��S��*4$�y��C��vD(�����I�����?���M��]�D4��M�탕4 �R�0��LMlGM�C�+K`��8˲��U�n      �      x��}�r[ו�o�)�\5SR7H ��H��iS���-����`
�P�5H�V~LQ�d�-G�;�8�#����d�� T�'8x�<��u۷sH*��tO��c �ٗ���[�Z;_ȌgƆ���fT��z۽{Q'�����0�F�޽�Vo���>�Z���%����FԊ:*z������nt�{5{[J����{��f��í�'J�����c[�B�L?wO�	�ʪ�N�:�#��?�=Q�!M�q��8:���e�D/������ZU��~TS?�H�eW�?��H�Q�U=j�>�v�3;��8����ũ5��ء���!M��~I����H��#������dHE����a2�с�~�g��Y-WW�!�`�|��O�Ư_�X��~q�V�6��a������i��*��9ï��J?���wz�z���~<RQK�b�1o/>�Ë���K����vh:�7�m=�oq;�)f�`l�?as@J�z'�G���S�J�[K�Į
=�LG��Pۄ�����<Ʊ�J��1���Yz���(\&x��ރ!��OgV���L���W�ͻwJ�Jy��{���ȏ���^
[�Ņ�n���Q";��xO� ��߃�+�4���e�L.��}���eA��w�q�m�j�YӜ��^���e���K8�z��Ta�� �?x���WWjW�eOΗ:�Vi}�)�2��^>��K�������j�R.eI��`���|Q�-�sDkq�{��q��j��QdyIwiyPBd� �ZaC�ކhц��U�w6iy+���<��C_�����ZR�ϏzO�K�0�h����Ź����ҬT�w��HZ��8�r؁m�AG=��x�k���Ʒ�ʫ׳V���4PF>���t)��9�VE�o^о���ck�G��I�_��l�	k�砛��er���2_����u�~��R"y�q���>1�I81���da5y�QjA�y#�}q�m�sT��a��0w��{��Vp����	�
Y�ō�]0iR��}|ɖXÖ9Zz���ǥO-ex�u��� Ź#�ˠ52�K�����}�^:tFZ�1�z��U�OT�i0�(�t]`��>U���(�p���^���WWW�?-���7���������Re����Ќ�:�G��H�Æ��E-x�|����u�n�V.���r��OV�=��,�Wg����4�.�:��9#QFs�������X�Y�����ʥj���ܪ�X^]���[����@�1���������,��������K���dPi
����5��=�T�C��ZD�/fr�\>��^��������i��M�#zN���2�e�����1��b����@���:q�]�$}
;  ���XF$��$��oY�s�U$d-�xX��d�ȷn����ij]��[x�qE��!y*��_�ſ\�Y+]_�~���O�ȟn�����#N>�v�Y��W��L����F�v}C�r�PӘ1TKhP\�����,0g�]��-<;�{%���6}�'3�<��{�zz��P�aD ��Ю	��:�z�,Dx H>ɨ�Q��&&'�Dj�R^��v������:�+L�p���y�������8�6�V�(v`0�`�o�zn�x@�� g�7�r_vu�7�{��zX���7.߭W��7!�׺��kۍ͒,n���l�sD�����e%��o|�ǉ�X�m��A��ܸ��� �̣��D�"+�M34>xa;�@��"=; ��$ػG��AjP�u��Y�t��0������h�qh`�vhXZj��4A�W���a�ʪ��M��ȏj9�L�O�a�"��~̳���y���^^�[~�¬ٌ�S����'��~���-�����ȏ��>��c�C���:�~i!�zk��$g|hE'����iO�ȕh�.i_�&�����30Km�m�E.���-�b��.�P+���0�?�q4A[:`�F�����o���~g��x~V]X���D��@~��������u������ �pV��U�d�p�v�b��c���tv�?P	^�H��K4xT�f�Z�p�����p�
�s����&���}P�����p`�и������E���l�P�\c��E0hBK$҆�m��z�D�RS��%�����#���;�)��K��xIK�&�#9��XZ��>R/¿�4��l¾6<���u���)8"-|Qۊ�䞵q�u��~[�:Q�\4pP�Q�ا�S_����y��}��'�;;�	���[s�Ϊ�Wg�3�o��Q���m��6Zҷ�:���Ѣ�O@Nۥg3F�?�}y�꿏`�w�nI�0d������.�	lh��G7
���6�<Wm9P}Zc��Y�p�pј����]5_�Q]���;c� ���c��B��.�j��%-�_��~D����n0D3��!wbADN�}���������⮡��ĵ��VΩ"?��b�鼑�� Хg2��d�.��]~c�ͅe�0?ǡ�B���;�յ�������{��*7��:��:��7 ����p��Q�{�ydI������ȧp��ѱ0ٟ���w7сa��M֧J�逬�C�l�,6�]K��YI�Y�,!{�DlݑQH��@�a��%�����Ե�ÁV��]u�\�z�RƆE���J�2{��h��(��%�]�8#K�˹G�Z}������A7�A�1F/p���MiI΍O/ɋ�KW./͒8C!����u��F����iT�/��\1��O��cpּD}���1D<[��u��|�դ8��B�@0�.�!��ڵ���{l�8��뱜"�ϡ�!��sN�(�]�w�r��8L�χ$A�:����Hu乸dЋ��o���dP�}|��l&����� �[9 ��!~H�A+��n�3��d�d�0ʉ����	�{��Jl�.M=�J�6��_�a�|��~��%��1"�4|9 LC?j�1�wx۠|ڈ�$�7��[`p�3ۘ����Ir0�n���/BÍ��Rtr���V�K+�rl1�{��Wz�z�0u�B�w :
,S��.y�|�,
���!�UJ�uq��6q:t��M��=$�Sj��V�G�lJM��yR�>�鄇���y��U1`m�v�~���C'���P���R��ɩ5_5�`8��C���_�X^9����a�����N*�%�1�{��J��Y�{,{: ��dN���\Xx��ҁ�Y?X �BB⹡T>d�a�C�(��XK>�<�AO������0ʗ�r �E7>��hW��^@ +�Q�+t�!�b�%h��~m���4�o>��B������_ų��K�d!�wG^d:�_�<��C(�]�L��Ԯ�q�Ɛ�ɵbȅ��6�p���3����>�i�K��8|߲˞72ԩ��Mh�e
�����չ��( ��� �Æ�����xO`�);U�E�0��f��b��߇�I���)�ـ����7��A��H<]:�Fw�9������JQ-�Vn�!�$}��t�)2͘r��<�7i���ǋk�Y*_/}P�T��F����.;���AK� �P�%j��6�a&C۲�\�:rr�q���躣��K]��TH9�:B�Tt�cb�N�c��uB؎��$��R���o�V��ʥ� �<�����aN���̓��ȉ@�E��N��)�P;��dp6���
��$
E�ԯc�[q'��2��B�}Rc��^$�:l-6A�]_6��9޺��(*�-�Ş�a"�Z��q�P��m�QEMI�58�ȧ��ѐ������*N{X�@��C����t�]��G��u�B-��F�e/�*�50J��tqKIiZ�����	a9?�m��%mR0Z������ӎ������euezq����8B�̈6�G��V��N�>9�?�T!�98~�ȮCf`�e�"N�F�i�s�5&^`0�1�tq+8�u��tnZ��O� �Cdۦ�y�.��'P�ٸLM�Md�z6��� Cd�2    T���h�����Jbx�W�p������7X�w��MϪ�l�W������u�Z>�c�2@̢����Ji�fu����KF"���R"l̀��k���-�w ��bqj�q��4isЍ�T����ɍO�ʴ5Wf����a��[��t�t�0K�/��P��zT��&<��!DcN�K��?��erC߀?�]�o��:�Z�Ae��I�n����Ak�2<�N�zL@���d��DT�|�TYҭ�qc9c�F �l�p���L�'��%�ޑ�G��X[�����#Z��g��M���TC�4[�><B�r_��8ŉ�<�U��|�oή��w*Z��(w�"�Uw�Ƈ<K?�I�&�9K��(0�="|b���,'H!z�m%XϬC�#P2�5���Lnl����ֺ�tW�/_`r)䄼s<3�043Ǐ��":N�N��#�~ɜ��p�Q]�_Y\�h65�~�F���-םls�l���'�5Yf��3&w(���W��q���;�4��0i������('B`04#>�Ueǆ�h�`a=J�����>�%kpr
��Y�QK՟�V�������s�a��%��~�wx��'i�ohH^̬!�lPh�������!k�#�!FH��P<���'�ǁ� ���R)�qЕ�"�'�2)�.��0R~��3���D�5�G�Y&��$�jǽ���8JY�F'_�8�ç߼&DK�c����D��8���&>4�Հ�1&���#�i_���W�J@�ۈ�k���K��$���4��ئz���9h�����Ǡ�'̰���e��:�26���H
��w��'	 y߲N�AwƉw;����bp�/:j���P����{@�ӯ},�I�J��C�N�ڊ\��
�����yZI0A:���)�\%�Ge�ã��aV��q#/��^?"\_6��Ud����f������2�:.F�?�<�A��+EQ�ݼ[j]9|!�>����:��P*�ɪ��U�T�����J��L��7LZ��`^��`�Bs>�eXxJ��!�#��O�2s�o�ԝb햺S��2@����s �c���H��P+��a�L�X���6j﫷6V�՚ϔeH̥뺇��i6�Bz�\�g,���E�� �sFu��J�{b4��<3wݘO�W�q6C(l)9[	���E�ySd�L�$R�%��vv6�Rk���G��A��j�n�N��{���?xŴvQ�N�&?2kp L���Z��W�⠈&�rW"��`��q�0�n��������?�x,����`B[��IEL��î���7��I+���7�g�2{��l�^!ǀ�n��'EWG��#k���g��E��:q�(��qZ��i�0�*r�V4���U�8:�q/���C�IK8�	��]��$������z��_��➣HbB������,���oLK��@����"�zS�+��mt-�MqC�e+�%oS�!}E�ค�{���mcn�L�([�uSD��X���KM��bXt��j�Jm�U%L���)D[�l�0�*�}�T�~S��:�f6V�k3ڷ*�x�Nᇛ�n�c�/<>5,�H�`8���P��<Y�F[�v�]&��B��2�Ȧ�j p��$ ���s�=S�%��2A�7!Rǟ�a�\}j� �<�wW�%ejۮ9$V��t�Or����!m��pӏ��
��#&��I��m{���2�������W9|?�n����.��hc���������ZV�' ����-u�|��m�%��[�	y�(펋n���̉�},���f6W��i���x�ҡ�no 8�#4�;9�ɾy2�-y��`�9���bT�K��ԕ�|��8N'k$#:T|�H"y])�&�qONCj��Ig�6��˶����/�����hlO>��X�l��0SO"s���簹C�FA(U6YpZ�n��_�m-[( b��x�z��~���[ջ�-In�Z��j����Z����rS]�U�%kŻ#9����t٦��a�� \ǊЕ��e�˹�IEYHT����&���I��Sd��>�ѵ0�G�	�E�	�0�1L��%���M�ᛦ�?��MN1���7��%���f��H�/d^�j�P����1yK��
��GT���-�}"�}<��	�%�v��/�/Y�1?.7�W�ߺ0�q#��#y���h�������+jxbpX��@��<���jS�j��o}F�ϝ��}�+P������}���R���K�,^�]T�秗���S�kd$6��bu�Vi���
�t{W�rq��+���䍬�1�is2���p���yI�ޥ�����5�ڔYjH�KA���!�WI(���z�	A�z0;~)�b:���KݨkM�K<&Ȃ�=Ό�2ߙ��~�ӻs���e5�0�xa`d̗#�����ɈBƉ�E� "��8�>+;�8UR�aR�`��Q�i��&�,�^�2%_l��[9��so������U�M���6F���|Y����N�Ѿ�ΐc��S�a����^����5=�U�j���j�����n0�6Llw���TI��o��+�@Й������!yvHQ���٤�Q��\x5����x�=W�J�-q�MX������iD[`d�m=b�٦p�Z%d
K��*{ׇPxw}.p�)�3՛;d&�Ӭ3$*W@�
�/�wP-;4���6�H��$`��� ��I�L��'w�@�� �S,�#�%�1�s'd(S�4*.tg�U �ɂ�7p��d���͸Uq�d`�GA^�sj�q�p���Lb��ز�]�<_C�����m�����[� D`]~)�a�������ac7�ň���'<C@��E����7�cH93f�a��Z,�Y}���(DG�|�؀��lo�����2�w-,TJm�ؓV��������M��x�>��P�"��#���"�aB�{���T�,�%�)޴��c�9�^�uj�	�AC�i�<�&��{�?ݥ;/(�w>;B4��JQ�%��U5]�P���w�g�ê?w"�ְ7�d横��+#��8�89�ó|m�R������I���W�xy�F����J&�5=U)��e"a�BQ�?ߏ�X�<C���1�:��^�-�&a���ڑ�@Y5�ۂ%��p��m��he����`)�w��^o�+�$���9u�f�TQ���Wo���k��	$2�n^"g���X������؎�@Lk:�<9Ge�=a��g�.���)��r���>Sx�X��'�S�@��=���6�	XKC6�s}��5p�3�i��p�L�zǘ�M�E�A��pR-������_�22:[�D�D��de9B���-*�q'I��	~�r�w�T�n�Y_l�/U2�<T�/����`F�������ĭ��~<��:r>��x�G���s-��#����&v��R0	�ܸѱk�����Jɷ/K�3���bNM���F�
{F'W����6ʁ�6�blK��u#�z���j/,e �SyX�vV�D��WZQ�D�O` aq�cź\n�I�"ן���v�ڋ�����Z��c�PBjpOTY"G2�N���T���e&�L��oqb�z�;S)jrcu�T���mY�"^�M�M��,�9!q�9���)�pFf<��q�+�X��W�����!f���Wa�6ȍ�92UEW�yYZ@�[!�/�fr�������I6�R{|��w�.�B�~�/��/�����?�g�F���Ǿc\}��_������j����ۃs�a��=R�f�FG�c�J[��r�$i�b��7ɖ �^ǫ�%ݱ����P�/������H��x��9����]���sqn~�ϖ[;��,Eִ�GO�g%`��I��/ե���Euu��Y@g�~9��s���J��"�vao��.�/����9�ӟ:����g\�L�/�������)z K216<N�Y�,���=h�����d&��ɗ�����;����z�����BP�;��@g��O:2I�[僊����R���1�ƥ��j��$�aٱ�Z�Y�T�=    Y0;�·"p�T~�
��^2��6�`o1τ�ёE@��gd�4SBOj�7�R�Hm/�^!ft2��Mr<{�8X�c�1DN�����KC���S�Or�_�Iw,Q��I�9���QLZ�'�vb1�����.qf�]w��u�AA(�9`��E1�τz �_�9<b��&��Z�mpK5ǁ�;���v��d��t2��� � ,��&(��B\�Om�A��(����dDM�:%�@$WR����w�{�M�Ё�T=dtXb��'��ܛ��Z�*�&���������Lp�}k9]���;�<l�Θ�b�xS���I�h�cl� g��Z�]�Q�o�dC�������NJ�/N�D�=	�̘����K�}��%&-ħ�`�E}E!E|�m.��Rq����ݗ�����챛9g�fPg��͟� u�u$��I �\�cG,���Ѓl�B����=S�O���"m����P:��z[�������Ұ�9�����
[�������g�u�|��31���g+ؽ�:r|�9-���dC\���_�R.i�!�3�9������S�ɰ�7�b�l!X�H?���M�uC�s��|	��� �d��Y
��$��倽ec��s��~��%1#hZ�H^!�����	K��r�z��u8Ck~�RN7�q V�.�<dtI2�$cji�N;abK.����^�u �$}�j>�#�9E�)!B@��I�P�.;E��~^���D`��v��}-�����n$#(�~���uu�X)�Δ�M�m�L��ͤk\�[q*�8�'q:�΋�b����7��ya�p2m�N���VⓄ��6L)*����D ���Z�Ｍ
h�F�1��X�)r���������d�_����K�!iĂ)V:� 1��S�0��O���L�'v��eU3��1(�;�y�"5�Ky�H����[���˵[j�:�-+�^�V*���>�s�sN�X}��v 7�,=�樯܌�qD�)�,tf��k�x���\�gܻ �����y];6)�a	�NP���O\��S��ۊu ���6j~�	7��������㘝�T�p��~W-݁��j*KkN϶W�s5�	�ߣ��ݢ��]��yz�W��<!�-�E~�?=��=��Æ��63B(��B�ea���\f��쩣4` OhjbS��#������7y���bt�b�!�Dt�4c�R Fg/�E�	̌R��s׻(@r�+i8G�}���II�9m�E�)v2>ۡ�=N]��Z=�z#��\/����s�M��5S��e���T�C���`�$JC�nf�0���h�?���&ݴg�`.��S轄:w�����۴�k�X=i�p�$z��K�|�9"����o�ɵ8y���#j@�^x��e$�A����-q��9Nj�w�\A+�S��y�,�*����H+������fW�A!\k���)��>�O�sa�XZ]/V���`����
�/��N��W�U/���*��ɂIu=s��u]�W؇��h;Q�<���UkB�����׬��rϢ]����W7nkj�ƍZim��Ӓ��v���i�q;�z_�����_Q���4��RY.|8��)q覄@h(� ��Gcq�>Ԟ�7�+0@��+2O�a}��H���~��p�Cn��ɨk A�?�֮LH��=Ό$�o�A������������_������gÜv�9�3h�5Qh��Ers��m*�/��M�"m�u�=�9��n��(��K���6#C���P>N�3��Yܠ��s7W�B�zt��6&�胲����fƐ�L�j|�|��VZU+P2�'\�~�����P�����m�f����L�ڍ
�F.�!���)�H/?er�{�B=�Ӷ,q�}9i��߲ �g�E(an�O����^�eo	3�>I3�2i��zѡ�3`�8���;�
�3�[~7:��x�xq�@ÜR\���g/ͩk��F�Tt��!��9KN;<n��^��xI�f�Z'K�.dJ���|�L�b8b.���EθKnp�D2 ��M1�Ŵ�I��W�:r��&�J��C�>� Cnz�TY�Ud��@�~�j����1�_���GؾH:������G�l�贗\����)O�}����I�FnK�����թbT?M���F|�����$@��;C�+ո?	��rĭ���_/�hj�Ec�6\�bG�!il�HF�'�m�
;�)��A׍����#�����h�����ZI�
��rj��ՙqr�5쐭H��"|���a'�d��b�I�vy$��5]�֍n�3pL�(U�$�9(���E8׭`(R���ӦN��N��<=�G�䲉������s��:�[��)8u�d^	(�O�Lp.�b@sg//�;�����F������{DY�5�������"I���U���%�=�A�u8ǓI	'9�c@w2^Bq��z�i�������&����ro�&�=NĎI�0
�u�@�2�I6�����V���!f�o`>�Z�ҧ�4��N6�6��ƺ�&�#Ҝ� ��lg�fl�jr�=�KM�b�$y��X_d�:�3��5�;���90�t���,�)Hm w���i��N���WOcyao+!90M�1��^�ķ�mErMˬ�KWj�91���2,��z����F��ɇ��t�K����-�D-]�^|[E�տ�k�����j`2�Zb�C2����z���N��#r�qB�?��C�c#�o�>1<�U������oꬽ���]i"g��s'�#����ҳ�A���ϐ��ˈs&?|ZI������E�@������Q�	�H���*m�0F���V�P���[�����~%՜�allˌ����H.R�����./�+V�j�J>�60u�B8@5.�@�N�,�pҴ�)����Ur�y+��j�.�|���o�R�r�7������c`�n}m[ �C��t�+��=���$[	�[�tv�otφp� &��<@ޫM��	�o�rJn� 'k�Q0BW�.��D�19qT>����,�(�Eq�������k ��S�]�\^Co����@���I���m���JG�tW��x�y�&��{�`8���84p���CO��8���x`��]�VU�+�b���RJ�Z=�o6MK<0+J,��F݂��iE���`-VWJk������x.�������\��Q�|#�~'�"�!{`d����%��n:��N$�)��#���d�ˢ��GG�F�JP��.C�5�t����T�9��2��c���:I���"�������� ��d.̞{~����xW[j��V�%�\I�ɚ�*�����;QrZfGFy��'G!�6_�}���/t�+�7}������'��3���Wwp���}L� y-Ӥ��[���a1o����j�u��v��j��Pf��}����ʩ八��:�qd_sA��0I��+b� �H�n-�)��_���	�����4�`Eԇ�?{~�cC{29
2�%QC��HӔ=.B��$�ѓ�O��A,�yL /n����D�	� �^p�p�F_/���4�[m��US�Ҁ�8��L>�'���{B����I�����7~M�G��DG�I�]8���|_��Tܔ#N��G{&3�O9&R`�[-�_��Ǔ���Suqqvvi�'���E�py����[�Q�19P�S�7��7K�J��j����j�Ny��	.����w�~y~��}�GS�Na�d�kた-�<e�	x��e���W�Ft��i�S��ɝZ7!��8��d5��jfz���S����֗<���5ᴉ*E�щS���qOP�?9�r̡1��%iS�U�nnh��*�s��T��=�z&3�fb�ώ�Z:'��/zc�'�o��qci+XC*/l�����(Bq�:i�_M��M�֠uq������7Z�?�ǹ�Gn�r�V䴨
���X?�c\]�����\!�5	p���0��+���E���L���/6{���s0G!��.�Rj��R�z&3~z1��(~OBanqY�:�s�|���JSG�y�(ئ*�E�y    �'��.R�j���[��{Ϡ��S��[$�@',���Pb�"�!�Eh�MZw}�

����2S��.V��������+�냋��g�������jl��[ow�'_��,�^����;�ws&�V/3E.?l��Ԧ�\:w�wH��엱@�f(�*�S�U\�(tm,�C<��d����P�Co������+��
 ��t��|p��^R��Xk7��I@ �V�Z���P��URh~,&֯�a��)Ѱ�8*�/A��z�rk`b��K��|�4��/$`}СQb2I��.�|�-�)�[�^1�ɤ�v���b�tz5C�&¯�^��?�Xo�&�N���J����ˊ�{%�O��[ۑ�/�8g�|5���:�8�h�G_ُ_����py`b�4��+���j��^-J<3�/�dň�Ca�WW��3���I?�V���[���ֻқ�J�Y�솹�a�/J�����%]3�q��=d��yι�$��n��6�&.�X�z��*�y8{O�r)��^��da��2MU�E#��n���<w/V1���ɩ��G����.D	��pܴ}�4Ω�C*���c#��ۡL!���N'��-9;}A����k�UhΥ�D�^;ǔ�4��X�F�c��� �_���=@ID9�ma#.Q���)��2��~O�zM�[b� t�T@o�Ɨ�����!8�] 
p_��Ȼ@:�=u���Z�>��$�w��U�?��o�[��EA8B.�ڞP|�Gع��vJ�byLx��J}�f�c�6k�/O �|�ʌ���}.�J��������2!ӐU�I��uG��5���3�f�����bdD��VE&�9)e�ѧe��V+��%EF&�ك�GgI.̟�봋zB���;i�֟D)8�S�*̂�i}~���❊vF)���er����2^���gT�.��Q�)��j�����z�P1���-b3�+4��Lx��ǉW�k=�E�w+,�����3rO�θ��I��OM=c��.��DM!D�ȕ��[�:�����aER>i��}ԥ�c�������θV­-�\]cS�-r����}�*"�Y=���pe�p����*͠E<j��wQp7��������Z�SZ)�_^Q˵���X)}�������
�"[���?S.~�?�w#�;3�?(�er���1#��D�j�T�ØygQ;����s��l�0M�&� �PL�%��`l�������%x"-���e�t;�Q'@�z=�ފ�S��ԣ `m�5�7D�lVQ����;{o�"	u�LR��f�n�C�k��]L�_F�M`ôy��v�ow�G����f�SLßd۝b3��I�$˧���C[BV�&�t�3��'�tV�5OD�w��yI2>��N9�&�?��Mm*��"���R� c-��Z���q����[��9M5Ϩ؝+������٠��ML���ԈDMa�6�}���w>�~L��;a3���>��5���=�q�T7V�kw�A�)'��_���XjgJ-�q��i���K1�f�\��W�,m@�d�KT�{wa�X��Vj���e|��4w+���|��^uU�Δ���ekյ�� ĝ�~��G��������ч�)03��p]$�G�ƪ�f�qݚ�P���6�.��0�@��t%Nf�sp˸̤FX��}c�����?jj#鵴�Wj����VB��M�!��/�uZ�H{yS�p�*��?"{�K�����߸�jJLO��,`�s��WaS��K=#����bCp�$ ���Fm��z���Ť�#bx��W(ٱ;~����'�G���;b�f��ϿsaZ]���,�U��M��Ny�sϵX��"��z�����4ȁ6�ۺ��N�h�l�F��7滎l��"\���g7���|��w��)��]Z�����Xwa'*Q�V+L���bM2�[&Zqa_����'�{X�t[j*�ÕGl9�S��%o��_]��K�m\x�*�S��zeN���(�SlX��Py�>���Օ>zs���y��O�V��;�%UY;�o�x�3	�7�/�AI�>�30}���6ɎRwmn[q�ԧ�S4��*R:�b��}[1�ۉ�k"NGR�D��iIwpqZ ��7g���6n�U<_|�RZ�JKZ6W/�ǛHp�O�?�����mʪ1�J*7� ��d��\[�o�Ldr#������;��A��0#��2�%�N3g�Eu��ƪ靈�g	"�(N!��O�";���C���o���\`�Y�����^�%�h�S	l,�mIR��6��L�� l�^U�)	�v
��&H;j�����.�C����fZ(��:��h.�vJ��!H��4�$*Y�ZS�j �F�Ŋ����aB��B���]�nBˏBa������n�r��/Y�R��N����q6�;�F�fN�cָ!4~���Z#�	_W˨��`�WQ��1�LԶ�þ4 \�ى�k�q��1���EZ��r��P����|un�/��Q_��˅�V���5�HP�����V�$���"���xd�Đ?��,�'8�f9��r(2�=�Rw߅���GFOT�f�ҭ�xACBu>��;w)Ŵ�[�v�.��/�\Z/���Aq��1���u��i��"���?�ᚼ{�~/���e�Պ>����@�G�pOF�\�o��Z���uu�|^�,_״#�%ucy$�!��W���N�g����=���o_��4ҿF��]�s"�%~x�Q�(�p���.�K� u(�ߓ�P�$D3Be[L��#F����#�ܲSKF���oY��.Zaѧx]*5���Q����!S��9� Դ���)F�}�)BH��/.M�qyvpYGy�s������3̅6���^��R��jip�V\Y��K/�$ZÜ'��!Y6���������Ī��{qW��:�&ہ{܃�9�όs=:q��׷���6h_�F�;�Xf�8p���MG�~���;�JKD8�۸��OMr��1��!��q�,+�}��{K����&M�q����Ikv4��kL�D|�	��fy�˼�a�)t�#.v��I�,�&b.'w�*ӥ�H�?m�]��I�1,�Dg�iL��v��z�O����;t�r���s5J��Prp9��h�7K��z�:��4Ջ��T^]/�J�����0ѝEr@�`2�j�*S��4��-�[�����|�m�-���k6]ԉ4&:�P���/;�RoWW��r��V�d��H���,Y\�����8�&���xs�ؙ�����蹁�Q4���y���o!����@�W`!�������'���,ٶi&F]��x�}]�3'%�n?z<V/�Ok�)E�����X/g��
���ԍ�O�(f�d�5�\t��cI�al�x ��ܜ������b�/�`L-�wJ>�.�&�p�r.�~�����9'ngbM�����4�c�M)Hi�9mm���O��]s&u��P2_r0�Y�ч��+��q�B~�U�"�@�.t6�E�����u V\b�t'b#\���X����x����͒:S��R�	v3��Id� ��.�V׀|�\+?�m�X����Jqm�/QGW/.���:���	%�����`����(�{n�]��5�E	ͯM��$>��� �r!_�"*�<z�bX�i�Y�C�c��?1r9)Z7Μ��Y66IS#��"�����&����a
�ruRW�� ���>mF���<��/��R?�ΠqΞ�xd�wVuW>�Z8�1r޼��� 7�Q��t�: 1�GOݫ�z�KjbC�2w��*��}`�l,K<
f��1n-�7?��'d�X[�6bM�kc �CIi����L67�z���KN$X���=�q�.�	�5[��嘆�+�p��䁡�x��J"L��q����z�k��zs�o�ظ�������Xjnti9lV�ʆ��i���3�,48��Q*���^��~��"�QQ;O�O��tM�hOZ����ʚP�0o�/�hº�ֹ��i�\���P?l^��1\Q9�������*Ps���q�䜺L�ɏ�Ǝ�8�N/�D�Ͻ;    w�3�c����a�DU�+��X� ��dR^9�H~�໧MƳ��\�oTW����IB�{�zDӤ3�F�H��ݫ�Z�%�>��Oi<�����1b��5�4yL7�oHf�6�l��j���e��Av2���X1��p�e9}yy~v��8*J���\%1[�N?_�z��B"%�@tx�V�ʵ�)��6��&�'�����w���������,�T�u��b�P?��М�����M��}vE��o�*�
���4�8�v�6���r��Z7�BJ���1�0lS�-����
�pȌ���=�`�Xa[7���?KܐrX)ʵ�:&DJyϻ�YZr���8ͷ���{29�V���5�f7�}��6΄�3��[�Y"�ZZ�(vF?�|ˋ~/�q��_�tACj���{�7�֫�յ��	<�_E�8E�VM���d�����y��ɖ&UՓڮ.U�N�@ű��{�8�����2�Lsz8�qr/.��Z�|����_�1�_V�dO�;�����>��1���@��\,�D�xW�$0����La$=%����>��Ė��<����`%�;ALt�i�p������˱�Q�	x���]��Ɏ�%��͙�d���WR�E{T�(��:�oez���go)r���u���x��2X�e3�vZ;�1���b�5�\g���P&?��qb�[��Wn�+�ջ��vr7l�l�v��I�r���6;�Z���_V#�ln8w.n��L�#��/;b�j.�:@����	h�H��	���n���|L�-�tp���z� ��1�\����\xZ�0�����J�$i�E����nU��1��%���4���l*�����*�,[�ۺ�Zy{�df�^��iwx 7Lec_��p��
1'4�|�^b�rA�R�y�xF�VQ�G�k�5��ru�V���j�װ-1%��O�.���Gdx��z��dch��'��������;z(ڦ�{��Z��K����'ұ��n� �1x=�]>���Q�H�p�}�d���Rq�f���:�Lbډo[L*��|�C뷑�aS�#F�8HN���ӆ�#	{V�v:{
�(�B)�1��X��c����N׹0�5�E*XZfnd5�-N�?2s�&1��/ё歍�JI]4T��)^�rq��ʋ͑�=ʩ�+�А/��<2�D���u��#�g��+����t]�td>�7�
�����w�I.�\�#�Z"l;��X����f�K8�FI[C��L�@�9C��p��!��6�JZh��o��и&�{Z>2�h��W��[j�f�N�c�&Gƒ'1��l�;f�)t���%F2GN?�����	�>�>�>w�ĺ������k=�J
h1�`Q�R��_��]h��I)Rә�+�ˍ�-�����.�I�Y2���s�4j�~T�[�xTY-}�T�[.�n���ҝZQ���c�����&nӤ��ԑ���tX}�C�1�g��ܻZ� ����l��v�qw�75��,���xь�F�
��Իe�G��UW!��1�"t���� �Vr��˫��|���gӤ͕�R]��;=@�s(���(�;ّ�8��,�ԑ�����ְ���Dlnr�ׄ���n`b���w�~�	���Dv&�4l��0�6�X�o0� v��������X|���2Zݫ���jA�N�@�tR5��_��'֨==�]����>�}��R���o"P��/�<$�HΏ�$GN�u��b�Nx��5e~j*&d	�}��Brl!Y&���b[y�xL%��A��@|�ײJ� �A�Z��`R�	x�>�H��2����E}Bjp	�w����>�ufx?���VJr�}]��8�G�x��-w�[�Y�Xߝ.�J~"{l��d�������)OB%�Q�SO~��m� �}RLq�;�G�0G�Op0bw͑Ɍ;U��^.W¹q��I���ӥ�I(��u��7���g���E��_"��	����k�KוQ�#i�S��`D�y{��DC8WiDMo�Q�� �J��B�)���U�R/x���ʭJ	J0	���\�Txm�ő�e��|���'B�v��PB��qLc�`Zv,LI-V7��	µ�Ґ�Z߷Xi����P1R�q~�ur���=ٕriu�4E��C�f8�)X@Ғ��H�c1US�^W�M���R�R���p���r����\��٩�c��{��@I�"l�ڵ��Lb7�PP��J��ײ�<hU���,�v��\|>�؋�	ʌr盦����j�����������j:םs6��<�fa��wݦ�1�&���#q�*��)���);���",g���}�,]g}jM�eF0n=�}A����(9k���ű���W;�]�1"%������UŮ�	��Q�gbc���_{yL$C�ߥR�z�G9�%_{�ibN��#�#��O_�U��ln�� ?|Δ&�)ry�Лp��Ĩ���}z��q� ���kF��vnH�p��@��wK�>Գ�%����:<n5�2�N�ĖN�D>a'����]Z/����O�<�'u��y}�L�+}�qҀ�\a��3t��'W�ɝ�ϗK��U��U�R��f�'���өpv�����R��Z��|�,۽g��"NC��o�d!�o�dͺ D�v�Ć�]J��ΆjXѰ�!~O���%U{s�8i�n)�K��恎�Bw7��k��4ɨ�O�m�&5��~����Ť��ǣ����e����\���3>Mqí�����x�H�*��69�����R��%��LK2 S*7�{��L��i�;�|;ƷT�;��#��ua.rџ�>|˹�`�5}�iϛ���W���t��^\-o܆���Z^��S�����D]����ʏz|�>l���Ԍ��k���m�G#lT{M�&=�0��d�^��|Ѹ��Q$�"���&�Im�
p��#�����E��1񣷕��I���m_�(j�=�t3>��F��n�d�m���e���Mj��oӹ�]1K�����e,��i9�Ӧ����d�A?�}��0��F�6O� ����=&�i����(֮g�ޑ'�R�c�]dD�9� �pw�1qw�E�>R[�fg�bl;�"˩\4��1�Na8��� �mF �/��
�yjM�j�V�N�V���q[���G���5�/�(��Ź��şn�=�r/�Ɛ֟ m�i�f)%8����[�^�7+�����I��5B���ێL��ڡ��Ɛ:!<��P�,)I�_���ک^���QW���k�0o�=w.�l�ny�ӌ��1 ������C�+�8��a8L��}�cl���B+r��@��8��n���0'6ň�V'ji��Oƻ�����߫z5;�VZ]+���zIxBY�/�t�X[������!��+�7a���l�O�7M��-�d�����R�늕�->׃|md*;�B��N�U�ȭ˲~K����w�LI.z�lg�線�b[W.L�.��Z'eY���F��.��?-����j-#$�ۿ������;@����!���&��\� N� Z0��2VǴ�q(W�h_侅��j\<UI藨���߃���|Qo��V��|���C/y�x��R��|a �ƙ�mhz[���ض�r�L�!N�w�o��B�����ʏ��X?���s4&?�U��n��,^���� K��VKjR��|��\]�����?�Y&w�qJ�קK��&�m��I>'1��C�h1�����f��ư瞗-�H�;c���V�Ht�
�D�0}�N�|�T�r���x���$'4�����a�� *.��lE�3��2r���"��qGY�E|�:-���$���{ᕢA3&D6	n�8�w��%T�y¯��58k�ŏ���^䈉���'oEKzg��Kt*����5
{M��'�p�MY���1�(�Iʓ����\�&W(]����4�26P���7�W�Z�n��C�֒��� �CJ!H���TC��ӓ��;�!�xM��H��ZH�`e�4�`�{�%�=��A���W�0]���߅��l��<b7d��K�*���0�.�G4V?�V�G��$$,]]�y|�`=RS�mLCXy�Ì�� 2  ����GY�J�#��@��I���7�N���qR�n�Q<[\4�g�DBj˿��	��PW<�EG;�(!��}��[Z�$ə�G����!{�<�_~'4���]�!ʩ�1�b�P�7����$rG:�7}B12�tMTj	���5.��Bv@��q�����T�I�p���������"y���]�/�Ͽ�C���F ��S�d~���*�T�9;}A-]�����w��V��[X>��yۤ���&�ڇ�U�xYc�闔��;���k��G�@����c�93=�0?���g�,.����Y=ۉ>�����<������^�����7�a��	2F����SM�%��V��L���g�;�9!69�����KӋs�$i�	ω'�����F�I�[�"����R�h�,�*�{��"�zbk=�I2�p��!dϺ9��鸛�����1!�*��7��BN�/�MNo�\nMe&�O~X���/���M���
�I�|����{�ض�������-=#b"��bw�.q���x�؉!-�l���?����8�`]Q�Z��H�B"�8/���N-)��u�<k����P��GS�i��W6X�mڐ-r8�[Ғ���5ܧm$�5_s0���d�@B��ˏ���!�MH���+%$c� 	��G@�@���UNvl�d�v�;6p�,��/��GF�S��: �����dl�2�8*�����i��9���a����.����l���>���u���y5�ho��-uV0\���g�������vS�gs��	Z]��N
Z"s+�S�E�������2ѷ      �    	  x�}�[�$9��]��߲dYZ�@?�����az��q���P�SU�+_d�Nd�6��ǟ���������o���Z_�/����~���������ߋ�9�9<�����9�m�9L9,m�sx��l��a�amC�a����<�g[�YFZmy�^1l���j#�f��i��V�����Ռ�V㴚I��j�V������L�V㴚�Ƨ�8�F
g;�B�%c�7�*����|ϳ�bKfT��EX���ó�W \!�?�H�вI��j3�тa�D`�����L2����YL��L�i�W��U��&��9{�X=.6�Y�@�2ʽ̒!�`�`Ƚ��&���+籂��%L,^0�i�٫i:�,��݈K��M�����@2�䊙sĩ�̜��Y�3Ϥ�B��0�\M��	��5fZ������y��8�+�F^�R� ��F�'M0���!�0�=s�a\��ȴ���@hQ'��ܓ0$a��\jU�-��SX�����4A��gR}�FP�C�L�(N�F@�T"H7��A7P0p��/Z�g�����#��B�%����iM�3�,mq��q��.c7�w��aA�=*��~P�S��C�� �T��b$K'��y�*���B��aB4�U`Њ�<�j�`x'�L�fm�}|�5cƼ`�V4��<�/q.��A�D飚�&l��=���S�gw)��W�B֤�Ffy�4_iۭ��Ԭ�#�Cz!��v0�`�z���j��G�0�p���<��F*���Y2�r-X��V����X�Y�c7Vc�f`�{V�6F("�	F�g0���{C�\b;4��#ݿ�#j4�L��tE�+�+)䶈P�Y2s乴�1t��,�YMτ��ϙǲ��Jae��g�<�9C���*�������C]P0����)[͓���g��D����}&ȧ���j�-Mi�g8(B���!o���x����@�>#p�<0b5��H==�J����2������+��(��W0W��aEc���``�3<�9Gn��:�s]5�v��{TQ�Z�5D: z�
BxF�I^����ط�F�\10L��%d�YM*-A4�	��h>+]S�>:�u�!��?h�*����K�%��SAZ� �SM�v��?U�I��h�*A������S� T�6�����'�fmo�9�}�y�B�FZ�+-P�(�BZ�qs�>�=�6F�)��9Ά�Qm"8L�d^A"(H���k2r_��x0���-ׂ��y3s�\ HH�+�RR���rH7�r�/cЩ���x��p�
�܅�W�q%�j��)O�����[�u/I��]�g�J�2�A͕�갆rK����
�`T(vy���m3(o�����nF*�'AV��2#Їa�-*���A�o�~�����͠�{@��^M�ݑ},b��*���@,�5BK1b��g�˂B���eW�ͦ���Ee� �XAX.��%�?ο*�z$��=�v۵m}�c?�$������
��=Ě͗����hNk�`�$��ك#��k��j���#����3���d�B"��f������h��/�^MF���Z�{�X�X�rHƂ��ە�я�4���W��K	��٠�� @�8�6�j�� ��*�� �p 0��Ɗ�&-!��Q�X@�R� �5?|	�~��=�{�h������h���d[9����2d�74J���	?\�V6rORB}��L��v̽!m��I��κћ�d�!V�Ѐ=�0"�z`^c��}�1�J�	�ys��}c����p��{������x��v��؃�!*����	�/�Cx=��&��C��5՟`D�i�#�����-<8���9��ڭ^$�����A���?h��ب1�Q����NPȄ3�@{����'g���E/�ܜLk
���h���'�q���P�%�| �3�1��d�D��nJv.��J2��#�6~2�!�d�+8�`c[i��=W�Ԙ;�	������%KL�є�}s�C��_��`Vc�Q���!������[������5���X�ZX�!ꔎj66v��]�)��\�~g�YàP�������1�p�g6����>����6&��Vb��㳛C5G��`�X���ۥ�k�Wp|�sa��7��0��\��E����L��bC־�����,޲
D+��l�qQ�B%d+��\��-(\��I�E����.���9��(\�k����o߾�M���      �   x   x�3�,-N-r�M���+*�0����9��5,�4�X�8c�8/̹��b�]6]��ya��}6^�za��nNcc �1��4204�50�50S04�22�20�362���60����� ��(�      �   .   x�3�4�41�4���2�M-��mb�r��& 5��=... ��	      �   X  x��X[s�F}���y�Ԗ��jc��s��7I ���lvvkR��ImU*�dvfw+�H<vֱ��_���~�O����M��u�|���O�@8��'Εs�:~�3w�ω�d���R�G6�>q�����==���Y�QxfR�s=ӌĲB;IM��d��v�d2��d��(��|�"�o�K���ș�������9q��-���>�\:�p���&� ~B��}?�0;,�r>�'`�F��(4����y���i/�c���q�>%dEz+Z��5���ՕI6h������Y��<��fFIW���PüT�S�ь��=�!������������	�;��-�D+�t޺Oܿ��~"�f���푼��P����aF3R��©��ʐ�0Y��c�~�,ӵI���j4��h�O|z��룉�DƯŬռݢ��I��ӅR��`�-r5Cu{?�L��H�(	LifO��$+�w�"q��fsL�b-۬OT�a���e�[���v���B ��}�K��z�H'y4��**Fc����&���a7�T%Պ�1C!��ٓ��G"��<��r��R��T�-��'����ф�V���5 |Z8��cI�V!T�E��r�ZN4�����d�sИ	�Q)���F0g�f-��UDEX��
{�>h�x����$�K� -�3�z�]}��m��6>'�h;��3\E�a<���~��a/�c�Ձh� !��dso#�e�ݶ�-����g��OM�^? ���r5@�?#bY�h�2Ey��c��X�r��lk���=��`;PMX���-����������TT{l
ݡ�E`�Ê��稆�1q;���{�"�$��XP*��͉A��3_���R�_S�X1�>�M��E�~>�]���ǀ��	�q�.��!�4��qA��as?�����|�;q�L��w��E��.V��1��B����A��"]y[�%�=�vsX��J=[2���n��3`@z���c���ϼ����e��uu{��>uN�1���vT�;���NQMS��*�ǁm�`���$��ӵ���5�-E�zOV~"��y5D.�I��~�/_�Q,K��5��g'ĆX�<�l7�@��[*�JXcr�����T�vi��2?��a��2R.
T�-�'�T.���!x�p޸_ �O�C�fmk�P�M|$ԭ�����֓`�+���#a����[��D;��$P�>	��ma�c�ય�!�Y^s4�{���y��CHF�D��1�
W���^g�3����w��/�@��:ǃp�s3����췶`�o`�o>�[#ࣉ�Kp��({V|#zR��Pl�ǻ$ ZkW����M�w솤٫kH��h	t�[�,>2�{BV�"��2Y�>�K���dvUz"M�r[�֛G�Zk�>����[��ù���ft>dR����j����f/�N�{fT
ja��fc�_���
���shǂ���'Q��n��-iMy�
&L�u:�lZ��j*�ۏ׬�V�ڬ���R�n��Bծi�n>��0�0�����D����'
d*�`x2\cͽ��������`�@�kL��JS:W7�{ӌҨ�$*������}�� !s8�,�j�zqd�(�#R®UZ55��i���do�ϊ�|�RW{9-=�2�R/��X�4�r)�5�B�[�p�	x��E�ͥR��+Rl 7f!�o���-嚖�ً��,$��ԾȤ�]>�%�x^Kv�u,<s����f��n�Ռ��~pm��<������[��J�n���q y�=W��#r{�N����f�����U^ǼR�-7ӿ����Qa      �   Q  x�u�MN�0������]X���JAb�W!E���9��F�LZ�N�"r�͛�7��@���z~���o��O�����-��� C���V�o���As}}T&�����0������V�H���hєNֈ�\:<�vO�a(9p���36��ɢ������90�2�(���4	|5A������Yl������s���)����A4�&^@�F��i���u-6�i?n���v�6r.(ut�F^Z��4�/�-���A2��3Ȇ�R�~�q}�y��G���������0(�g��<Ѽ��e
��(�[�>^jhW��	4�ˑ��&�wJ�?00�     