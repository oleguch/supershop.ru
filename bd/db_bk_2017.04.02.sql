PGDMP     "    +                u            osamylov_db    9.6.2    9.6.2 8    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
                       false    1            Q           1247    32810    badge    TYPE     L   CREATE TYPE badge AS ENUM (
    'none',
    'NEW',
    'HOT',
    'SALE'
);
    DROP TYPE public.badge;
       public       osamylov    false    3            �            1259    32775    cart    TABLE     �   CREATE TABLE cart (
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
       public         osamylov    false    3            �            1259    32773    cart_id_seq    SEQUENCE     m   CREATE SEQUENCE cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.cart_id_seq;
       public       osamylov    false    188    3            �           0    0    cart_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE cart_id_seq OWNED BY cart.id;
            public       osamylov    false    187            �            1259    32790    cats    TABLE     Z   CREATE TABLE cats (
    id integer NOT NULL,
    name text NOT NULL,
    descript text
);
    DROP TABLE public.cats;
       public         osamylov    false    3            �            1259    32788    cats_id_seq    SEQUENCE     m   CREATE SEQUENCE cats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.cats_id_seq;
       public       osamylov    false    3    192            �           0    0    cats_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE cats_id_seq OWNED BY cats.id;
            public       osamylov    false    191            �            1259    32824    goods_id_seq    SEQUENCE     n   CREATE SEQUENCE goods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.goods_id_seq;
       public       osamylov    false    3            �            1259    32801    goods    TABLE     �   CREATE TABLE goods (
    id integer DEFAULT nextval('goods_id_seq'::regclass) NOT NULL,
    id_cat integer NOT NULL,
    descript text,
    price integer NOT NULL,
    variant text[],
    badge badge DEFAULT 'none'::badge,
    name text NOT NULL
);
    DROP TABLE public.goods;
       public         osamylov    false    194    593    593    3            �            1259    40962    images    TABLE     k   CREATE TABLE images (
    id integer NOT NULL,
    id_good integer NOT NULL,
    img_path text NOT NULL
);
    DROP TABLE public.images;
       public         osamylov    false    3            �            1259    40960    images_id_seq    SEQUENCE     o   CREATE SEQUENCE images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.images_id_seq;
       public       osamylov    false    196    3            �           0    0    images_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE images_id_seq OWNED BY images.id;
            public       osamylov    false    195            �            1259    24578    users    TABLE     �   CREATE TABLE users (
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
       public         osamylov    false    3            �            1259    24584    names_id_seq    SEQUENCE     n   CREATE SEQUENCE names_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.names_id_seq;
       public       osamylov    false    3    185            �           0    0    names_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE names_id_seq OWNED BY users.id;
            public       osamylov    false    186            �            1259    32784 
   sold_goods    TABLE     t   CREATE TABLE sold_goods (
    id integer NOT NULL,
    id_order integer,
    id_good integer,
    number integer
);
    DROP TABLE public.sold_goods;
       public         osamylov    false    3            �            1259    32782    sold_goods_id_seq    SEQUENCE     s   CREATE SEQUENCE sold_goods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.sold_goods_id_seq;
       public       osamylov    false    190    3            �           0    0    sold_goods_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE sold_goods_id_seq OWNED BY sold_goods.id;
            public       osamylov    false    189            �            1259    41004    var_good    TABLE     c   CREATE TABLE var_good (
    id integer NOT NULL,
    id_good integer NOT NULL,
    variant text
);
    DROP TABLE public.var_good;
       public         osamylov    false    3            �            1259    41002    var_good_id_seq    SEQUENCE     q   CREATE SEQUENCE var_good_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.var_good_id_seq;
       public       osamylov    false    198    3            �           0    0    var_good_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE var_good_id_seq OWNED BY var_good.id;
            public       osamylov    false    197            �           2604    32778    cart id    DEFAULT     T   ALTER TABLE ONLY cart ALTER COLUMN id SET DEFAULT nextval('cart_id_seq'::regclass);
 6   ALTER TABLE public.cart ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    188    187    188                       2604    32793    cats id    DEFAULT     T   ALTER TABLE ONLY cats ALTER COLUMN id SET DEFAULT nextval('cats_id_seq'::regclass);
 6   ALTER TABLE public.cats ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    191    192    192                       2604    40965 	   images id    DEFAULT     X   ALTER TABLE ONLY images ALTER COLUMN id SET DEFAULT nextval('images_id_seq'::regclass);
 8   ALTER TABLE public.images ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    196    195    196                        2604    32787    sold_goods id    DEFAULT     `   ALTER TABLE ONLY sold_goods ALTER COLUMN id SET DEFAULT nextval('sold_goods_id_seq'::regclass);
 <   ALTER TABLE public.sold_goods ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    189    190    190            �           2604    24586    users id    DEFAULT     V   ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('names_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    186    185                       2604    41007    var_good id    DEFAULT     \   ALTER TABLE ONLY var_good ALTER COLUMN id SET DEFAULT nextval('var_good_id_seq'::regclass);
 :   ALTER TABLE public.var_good ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    198    197    198            �          0    32775    cart 
   TABLE DATA               b   COPY cart (id, id_user, id_good, number, delivery, city, street, house, app, comment) FROM stdin;
    public       osamylov    false    188   �6       �           0    0    cart_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('cart_id_seq', 1, false);
            public       osamylov    false    187            �          0    32790    cats 
   TABLE DATA               +   COPY cats (id, name, descript) FROM stdin;
    public       osamylov    false    192   �6       �           0    0    cats_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('cats_id_seq', 23, true);
            public       osamylov    false    191            �          0    32801    goods 
   TABLE DATA               K   COPY goods (id, id_cat, descript, price, variant, badge, name) FROM stdin;
    public       osamylov    false    193   x;       �           0    0    goods_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('goods_id_seq', 35, true);
            public       osamylov    false    194            �          0    40962    images 
   TABLE DATA               0   COPY images (id, id_good, img_path) FROM stdin;
    public       osamylov    false    196   aO       �           0    0    images_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('images_id_seq', 182, true);
            public       osamylov    false    195            �           0    0    names_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('names_id_seq', 62, true);
            public       osamylov    false    186            �          0    32784 
   sold_goods 
   TABLE DATA               <   COPY sold_goods (id, id_order, id_good, number) FROM stdin;
    public       osamylov    false    190   :P       �           0    0    sold_goods_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('sold_goods_id_seq', 1, false);
            public       osamylov    false    189            �          0    24578    users 
   TABLE DATA               p   COPY users (id, name, email, pass, address_city, address_street, address_house, address_app, phone) FROM stdin;
    public       osamylov    false    185   WP       �          0    41004    var_good 
   TABLE DATA               1   COPY var_good (id, id_good, variant) FROM stdin;
    public       osamylov    false    198   UU       �           0    0    var_good_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('var_good_id_seq', 22, true);
            public       osamylov    false    197            	           2606    32798    cats cats_pkey 
   CONSTRAINT     E   ALTER TABLE ONLY cats
    ADD CONSTRAINT cats_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cats DROP CONSTRAINT cats_pkey;
       public         osamylov    false    192    192                       2606    32808    goods goods_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY goods
    ADD CONSTRAINT goods_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.goods DROP CONSTRAINT goods_pkey;
       public         osamylov    false    193    193                       2606    40970    images images_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.images DROP CONSTRAINT images_pkey;
       public         osamylov    false    196    196                       2606    32800    users users_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (email);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         osamylov    false    185    185                       2606    41012    var_good var_good_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY var_good
    ADD CONSTRAINT var_good_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.var_good DROP CONSTRAINT var_good_pkey;
       public         osamylov    false    198    198                       2606    32819    goods fk-good-cat    FK CONSTRAINT     b   ALTER TABLE ONLY goods
    ADD CONSTRAINT "fk-good-cat" FOREIGN KEY (id_cat) REFERENCES cats(id);
 =   ALTER TABLE ONLY public.goods DROP CONSTRAINT "fk-good-cat";
       public       osamylov    false    192    193    2057                       2606    40981    images id_good    FK CONSTRAINT     q   ALTER TABLE ONLY images
    ADD CONSTRAINT id_good FOREIGN KEY (id_good) REFERENCES goods(id) ON DELETE CASCADE;
 8   ALTER TABLE ONLY public.images DROP CONSTRAINT id_good;
       public       osamylov    false    196    193    2059                       2606    41013    var_good id_good_var    FK CONSTRAINT     w   ALTER TABLE ONLY var_good
    ADD CONSTRAINT id_good_var FOREIGN KEY (id_good) REFERENCES goods(id) ON DELETE CASCADE;
 >   ALTER TABLE ONLY public.var_good DROP CONSTRAINT id_good_var;
       public       osamylov    false    2059    193    198            �      x������ � �      �   �  x��V��G�9_ѡ^'>~é'`N��֔��++p�3q:�h�3����_��z=I-��뽪zG�����������/��b*u�3��x�������/����_����Ͽs�4w�ڏXs�ݼua��}5Z�1��p�=�Ϯl�G{��F}��Cm�t�������>Ky0�z���g���΄5�koX�B��vGh��9�CX�[�܂:N�.&2sX��a8��;���8� S���S��Sn\���~�W���d�Z��aE"�}�s�(a�fWNz�@VQ<G���2�:L�0����KX��]O��͋�L�/��0|����_�&��4�t�� �����DL�r~�j�^r5��m��Kq��!fB	���)�fWN�
*t�X�G�p��C��TC�F3���h�\9�9"M�?� h��atM8BFj�S��F�3fV��qHe��^��(�T�����३�i�������re���`�ߺ��~�a	�sx�5����
L B�Ψ����S�����zT����2�*lc) e�-���OȌ�Sy^)1e�#�RW*�Y_p��I�`,�m��z@e��$3��X�J��60AA�V!��ɚ
��a�^(X���}j�ioKc�a(��Ӽ`~�8���.���k3cr����ͺfq�ɂ���Y׵���׊�ɔ[���݁Ge[�I�2����[̀�6�!���5VTd�D����)��*&<���O�1���:�A�<;�xԢO�1��������"���>P�L@��M�2��&��e:F�Q}���ǼdY��]�uG.�l���E5j!�ӹ���j�I�T��e4���M�
�FS	B)�������(𽋨��+��Aꆚ+�k�ͺj�N�ba;k�&,�!�ƀ���{g�S��4f�ڝ"�M�g�v̚M�+��]R��9C̵���XhxB�#+gؖvO�=C~�����3W{�b�ݝ<Px��>Y�ūG�!���e�n&��-�kڱ<�a���\l��V�&R�VPsf��o�t��񒁷����ZVF�bԡ>!qZ���u�m�o�yW�v�8�Ab��V�����k�Ƃї|�d%uoK-[T]3�調s�3�@�-��B�^}��[N���I�����      �      x��[[S[W�~�b���JP�1y����x���E1j�
�<w��0�<8x�Nw�gbwb�T?t�Ft�*���/�/鵾��>�$�<�TM�<���s��{]�����'2S��c#�qw+�E'�jw;jG��5�N��nww�[�j��>�B�<3�b�#����Ga�6����>t�f�Etw�����M_�=zp����=��3|��t�{B׶x���j�T�v����w�[$����AtΗx���^�0��G�2=MK�d��rL�>�>����E-:��ء5������G�ܻ�V�/��zI����OC�}��u����?遭�Ň�5�s��.�I�'�b�ċ���ִ�z�=J/�Z�i��(�B'�^rHK���3�]M���J짿����/�S�D!i�{���bm�"���ֶ��V锯q�#Q��>�r��Jj���^���
�B�|��^KE�����m�6࣓���%�eZ��ֻC5����"���������g�3�r����N��|��a��^�,��66r׆Ư��D?�{Y�Ȋ�a5e���C��!�TB��	���qw��m�ϗ5�j����ߑ�q�k���Y��j[�
�9�mӓ�$�Q31��łt�ƺACXǴ�#��ĺ��;�Qas�=��YDL��]�e:��@y}�XȊ��EMaҚ�5��Ȣ�jǇs��'�ժH�E<0{V�k�GVH-��n^�I	�D������nT���Y)����ov�%�O} g��`y�����Y�7#&�!u��I(�a�����b�#�0. 8k�-�bi5#�H6��2��\��ec��o�D/�n�sXF��6|��d��9��'��u�gRY&7155�Y�����j~[��+��`�f|��&7�N�UN��J��ū.(��^$��%�)��b��|o���$��)�d?�U�S@Z�'xɎ��alu"}\�оȁD�'�)�>�-��.,�m�f�b \մq<�jO]��ٯ���I(�Q#1Hl�|P
�a��� �Rr���h��+?�|�`n�K��+�/��kf~�>]Y˗J��v�o���f�yi�TgdTg���E!/�X��fa��&_)��Xt9_\�_",�K�Oq
rs�.��2�߱8�����(���輋��re���7h+��W韅��U,m���"�#H��$�����,=h���);�z-���A/\(�j�M��$�&�l���\D�%Y����r�v�R�?�n���l���*���M#Z&7y���#����=�cc�#-�d��4����8\n9��kgB��8����F�,dݳ��$�	�pnz����l߁�C�ô�����\Y�V7�_��>�n��v�хO�WkW����>�j�l��N2"�TV�`pB�����(��M�\��c<������,�m[H�-W��|0�j�7�}$����d��L��S���	"�b���2��7X��z�tc���)�,j¼������g������͈M��U�R�m!G��5� 8]w1�\�9U���Wyb760}�'UҶ&�$s��}\ɗ6�߷�`) �]��Z�n�b�;�n��=Guh/;а�P�=�7$��W1�ǁ���Pn�=z�|̝��������D'HG�:�p@@�O��ր��<�l�-~V0����eʳ��!���\�}l�ܑlK3M�����i?G�wQ3n��0<�U�94>I�������M��џi�������3s����O��[h􃡯��[����������o�Ư�վL$�b�D�~�I����S,�D|�t���X>�gᰊR'Hغ,tv�^(�M��a>�K��rE����΁;#u�Ś(0k a�;�����aӫ00U��4>�����铅9ski�漙[���X����)����N�	������M�W��]x��>�K�ގ� &�׿$٧�hBƆD�(d�A>��� �+!>X������D��S���O�j� C:��i�o���E}E�f1��ӆZ�,K�G^���58 �1�X��+�Q�X��¡�fX}B`?����t�v\�h.�v#M6n$�$�S�$	�l�t�뵞�P��`���/j��"�A�Z���͝ ���6��AhLVJ���*�#2u�����;�Q��25�4�����-�f���t6�#��_vu�*�r� ����Q�����B;na;������Ài����[�/S,�c��kc���۷tb���wD'nHuA�n��0ssB_[�|>xy%�	���Y���>��j�K��b�~y��^I�;�V�	��^l1K�E3W���"�e{}*��j��I%�^��?X*M����̷/#T�R���@=�b�w�vU#�1��ڀ-.'a��n
N�3��ӃԺ��p�����M>�\�\�xX.m8ݶ�]�����@��6�&,*����acs܆ܶ��d揱�	>��/9�CZ>�W�'�� |F�"|r�A��+4�6CBqgǚc�V\�΀b��=k�x�� ۳��)�a�@� �ЦW���<�@�{�!��Hv����"��8]�&b�x�+}\hW&�yd%�w����k���=�;{�%�w@���GlH:��]ͭg~EƜ����1/ϯ�Y��2/=�ڊp���&0��Q�Gg���`ZZ� _�9{\B� ^�m��Z-�P=JƱ@�ˎ��s[��cw�D��O�!Q>>� Q�Ҍ�k�����N5�n`g	���;>��h.�1'UuC�(!'���`)^5tW��x�����(0O�#��\ڥ2�߈��;�� ��oHEN�@��A�3��M�̍a*.�~ohŚT�O�`�p���z��c��v|����5�u1\�C�+%=/�h���̹�:h�@����-��*%=���r���o=�%�7�{r�T�M?�@�������Vf%Yi~yl�˅{��:e�~9�-�9����w�H���8��~�h��Z�2�K�,���%<�5P�?�!��������Ĵ�ʹ��۫�g�H�]�$��H�Rqu܀	��	�+���@|�q_A�ڵ��/��-�:4�ٜ tN��Xx������=RRs��^��%�P�}I#�F��$����=9獱+���KK��:4�"�۸���,��a�i��,jO�
�8����I�?�A�d�{<� �N���U��W���_᦮���R��9�J�Ȫ�*��+�*TsW�m��U�D�=�O�G/wR�WЅ���}Q���qw�Rz� ��`*�"��c^��R���"Cծ��XJ����tU��Ϩ\�VFNf�߇��{��Z5���ibh�����+����V��Q2��a NOFRM�x�[�]�@� /���G�9*�A�1 YL07�N���i��b\��>ʽ8��;��4��\H����7w��F����~{�3��4�%��yz��)j�]�E�z��c%+������M
$��Xɶd� �#��&���6L]C4��Ӆ'7��w����+B�+q��u):��m�ӟp��;�Ԑl����E$/�:dg�U�k�kyR��eVw��j����y�X(���]�UG�j~֓R�{	z�Y��`�;"B��F���Ͱ
�&�r=���]�^`/����;��������vPDjJ'Az4fl����65h�1w;i']R���h���m��+��OćR�7!M�>Z]���nx�џ�/�_iS$��{�Ű��Pi���k�v����%�K�ç�۸�����1���q�R��x��w_E�;_A�[i �Q:�t)g���eK���͝�噹�>ք��&���&����p��8��Sӵ%��T�o�A+2#�-hߌk�[��N_��p�Ġ��t�͂�޹�N�s���¼�Od��-��Wz��0H;�q��%
J�e�����%�w�u3;E�T]�Tj$��)�+�=��`���;����;���o��qt�g6�����r���X�� %��BW��zae����'ol<+�Ɩ�����������/�9.̋��k�1�]�% �  �ϡ�I���Ln�� ���ǝ���E!�9���t5�Ύp��)���*#I+k��(Q~w�ԒD��M���/1Ոd6ȯ��J�ZIz�cP˸���[���0Kf�Px�57�%�Z,����7��
֭���D1�Q$��Zr]a4��E@>ؚ�W�8�؍A���(�����a�<�C#������Ěb%F�8UI�ܓ>�!��[��,�J#�)`w�u�^qj��Uy�}���0h}V�-MA������}�ݽ�R_�GEup���c�0����&��IpE
-�ٌ45<�*�ݻ$H�W�"Q�mT����T�ý�%J?d+����X����u*I�����[��o���e��������u2.�|O�����"/��p��Ag]u e�D�=3_�Sz�])��ƅ�T����F2!��xpy�8��>51h
�d�Y�;�����K�������({�V~\EB��F_4��C�����|d�-��Y^J���Ĉ7Z %��iAK;�U:�G�z�թ�A�u?��]hU��У���#�$��]u�T��|��j���,[�|M��U��R����JG���)���kۑ���.͚���
�l��)Hd��t[��X�`:ۉ�N[U���t�r|7ͧ�Sb�uɒHE�T%��GBδ�ܶp\�E��89rHN�>�Ո��D�a\���Oad&6t��HY����>�QL�;l`��td�%�� ��Z;� ��zl7Ko�ڠF{˺}��;Tk󑪝��Dg�&o�ͅxP���^��9l�Ph�dyfa�$~x��1�Ǚ]�Mv`���P�JF�?�����8�g$���꾻�?��W���y�6-����`0	l�&��M�a����׊�B���E�Zj|�$��R��I\� ���������v���}u� �?�5
;��� ��^����I�4�RCLZ��%F3�c������6}6:44�?i�      �   �   x�u�Aj�P����0�5z��L)%�(4��!�V��yo�X�r=ϗ���o����9[�v��=O�����4��ulӼu&�H���A�l�H�켂��;84��	����*[-705�+��[�T5�Z�j�j�pU�V�W5o�Z��VW5o�J��y�Y܏M],�A�s�G�X�������K���h�X|��i�y��?      �      x������ � �      �   �  x��W[S�F}^�
?�P�c��e���6�c&``�"lI��2�/�O\������t�R
m'}���/��Q�]��M@��,�Y��w���d��|�����
�9>t�ݟp� %g*v������KY`4�jǳ-&���1[K2�37:[��bF��	�)��Z�1�6�t��'����J���S���"���8=�(�k�5lG��S�r$��V��L�i6*͔<:^�F��b��5PbDs��f�!AD�����`�Bp��(����]sW��� �
=���
��5�l|g(�2�5���\5�*J��c*�U���|}d���̴c�3�J��>�Z�b!�gT��9W�)>�{�6<oq<�ۘD�_�H|���+����BC�􁕎f&�cm>36=�$�T,ʺ�y�+Nd[a�:����V#�N��I��.�����i��~w�|2����x���� 
����q��V�a�����6��9�j5{H��{��AI�B� IQ@W��Tȧ0��4�n�K��_Hw�ħ�Z�S��>@��������y�}��Xf�� �]�%��wf��̒Yuj���� �/�H�R�B�.2�����P�*�=5��e��=T�q_��8��<��qK0 9�xI�XyP� !N�#QF }N!R�o�F����OPôL;_�Q���UJЅ��?���$�F�+�|�ys�x�0#�!��T�'A��6�v���t�*9_E�]�ή�!�Q���J�=�&��&]xKmND��}��Rv����_]3!,H�RI��X�����]Q��@��0��5~���m�s@���:*]]E�rgY�q쥳���(�mI`�@��t��/�ל�n6���B�]#��C�kDr�3z���$����W(*D� �<�:5���i���>�O����O�՜.f��K�*�X��4>�T&�ѡ9#]��c1vr(ٜ�GH"»�K�u�;��S�e��m���i �������$�L��z��Kr@o���V�i�$ț�Pl���3
$p��Ƀiz�o�]��r�?>�R�Ȉ��Q/�iG��?p�"�g�J���"���0KR�CAU7c@/TJ�C��F@�u�SP�w&�>���;��#X�(+F�S	���J  ���=���R1m�W����x����"I�C{��k���v7P�}�ƺ���cX�g�8���,����_@/��̄�y)��O�@ �/�Ia      �   Q   x���44��xaǅ�@���� $pa�ņ��{/v����.l���bX��Μ3-%����JIKO�22�2+�b���� �p$�     