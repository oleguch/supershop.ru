PGDMP     !                    u            osamylov_db    9.6.2    9.6.2 (    ~           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
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
                       false    1            M           1247    32810    badge    TYPE     L   CREATE TYPE badge AS ENUM (
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
       public       osamylov    false    3    188            �           0    0    cart_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE cart_id_seq OWNED BY cart.id;
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
       public       osamylov    false    192    3            �           0    0    cats_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE cats_id_seq OWNED BY cats.id;
            public       osamylov    false    191            �            1259    32824    goods_id_seq    SEQUENCE     n   CREATE SEQUENCE goods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.goods_id_seq;
       public       osamylov    false    3            �            1259    32801    goods    TABLE       CREATE TABLE goods (
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
       public         osamylov    false    194    589    589    3            �            1259    24578    users    TABLE     �   CREATE TABLE users (
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
       public       osamylov    false    3    190            �           0    0    sold_goods_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE sold_goods_id_seq OWNED BY sold_goods.id;
            public       osamylov    false    189            �           2604    32778    cart id    DEFAULT     T   ALTER TABLE ONLY cart ALTER COLUMN id SET DEFAULT nextval('cart_id_seq'::regclass);
 6   ALTER TABLE public.cart ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    188    187    188            �           2604    32793    cats id    DEFAULT     T   ALTER TABLE ONLY cats ALTER COLUMN id SET DEFAULT nextval('cats_id_seq'::regclass);
 6   ALTER TABLE public.cats ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    192    191    192            �           2604    32787    sold_goods id    DEFAULT     `   ALTER TABLE ONLY sold_goods ALTER COLUMN id SET DEFAULT nextval('sold_goods_id_seq'::regclass);
 <   ALTER TABLE public.sold_goods ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    189    190    190            �           2604    24586    users id    DEFAULT     V   ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('names_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       osamylov    false    186    185            u          0    32775    cart 
   TABLE DATA               b   COPY cart (id, id_user, id_good, number, delivery, city, street, house, app, comment) FROM stdin;
    public       osamylov    false    188   �&       �           0    0    cart_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('cart_id_seq', 1, false);
            public       osamylov    false    187            y          0    32790    cats 
   TABLE DATA               +   COPY cats (id, name, descript) FROM stdin;
    public       osamylov    false    192   �&       �           0    0    cats_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('cats_id_seq', 22, true);
            public       osamylov    false    191            z          0    32801    goods 
   TABLE DATA               T   COPY goods (id, id_cat, descript, url_img, price, variant, badge, name) FROM stdin;
    public       osamylov    false    193   r+       �           0    0    goods_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('goods_id_seq', 4, true);
            public       osamylov    false    194            �           0    0    names_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('names_id_seq', 62, true);
            public       osamylov    false    186            w          0    32784 
   sold_goods 
   TABLE DATA               <   COPY sold_goods (id, id_order, id_good, number) FROM stdin;
    public       osamylov    false    190   +,       �           0    0    sold_goods_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('sold_goods_id_seq', 1, false);
            public       osamylov    false    189            r          0    24578    users 
   TABLE DATA               p   COPY users (id, name, email, pass, address_city, address_street, address_house, address_app, phone) FROM stdin;
    public       osamylov    false    185   H,       �           2606    32798    cats cats_pkey 
   CONSTRAINT     E   ALTER TABLE ONLY cats
    ADD CONSTRAINT cats_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cats DROP CONSTRAINT cats_pkey;
       public         osamylov    false    192    192            �           2606    32808    goods goods_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY goods
    ADD CONSTRAINT goods_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.goods DROP CONSTRAINT goods_pkey;
       public         osamylov    false    193    193            �           2606    32800    users users_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (email);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         osamylov    false    185    185            �           2606    32819    goods fk-good-cat    FK CONSTRAINT     b   ALTER TABLE ONLY goods
    ADD CONSTRAINT "fk-good-cat" FOREIGN KEY (id_cat) REFERENCES cats(id);
 =   ALTER TABLE ONLY public.goods DROP CONSTRAINT "fk-good-cat";
       public       osamylov    false    2041    193    192            u      x������ � �      y   �  x��V��G�9_ѡ^'>~é'`N��֔��++p�3q:�h�3����_��z=I-��뽪zG�����������/��b*u�3��x�������/����_����Ͽs�4w�ڏXs�ݼua��}5Z�1��p�=�Ϯl�G{��F}��Cm�t�������>Ky0�z���g���΄5�koX�B��vGh��9�CX�[�܂:N�.&2sX��a8��;���8� S���S��Sn\���~�W���d�Z��aE"�}�s�(a�fWNz�@VQ<G���2�:L�0����KX��]O��͋�L�/��0|����_�&��4�t�� �����DL�r~�j�^r5��m��Kq��!fB	���)�fWN�
*t�X�G�p��C��TC�F3���h�\9�9"M�?� h��atM8BFj�S��F�3fV��qHe��^��(�T�����३�i�������re���`�ߺ��~�a	�sx�5����
L B�Ψ����S�����zT����2�*lc) e�-���OȌ�Sy^)1e�#�RW*�Y_p��I�`,�m��z@e��$3��X�J��60AA�V!��ɚ
��a�^(X���}j�ioKc�a(��Ӽ`~�8���.���k3cr����ͺfq�ɂ���Y׵���׊�ɔ[���݁Ge[�I�2����[̀�6�!���5VTd�D����)��*&<���O�1���:�A�<;�xԢO�1��������"���>P�L@��M�2��&��e:F�Q}���ǼdY��]�uG.�l���E5j!�ӹ���j�I�T��e4���M�
�FS	B)�������(𽋨��+��Aꆚ+�k�ͺj�N�ba;k�&,�!�ƀ���{g�S��4f�ڝ"�M�g�v̚M�+��]R��9C̵���XhxB�#+gؖvO�=C~�����3W{�b�ݝ<Px��>Y�ūG�!���e�n&��-�kڱ<�a���\l��V�&R�VPsf��o�t��񒁷����ZVF�bԡ>!qZ���u�m�o�yW�v�8�Ab��V�����k�Ƃї|�d%uoK-[T]3�調s�3�@�-��B�^}��[N���I�����      z   �   x�3�44�0���;.6^�pa��rV���g��g����''����e��r��p��q;��r�����*(�(��q�pZ�h���%�����!P#�2�K�sR����$��i�@�!������K�ts+��(�V02Q0����� 4	R�      w      x������ � �      r   �  x��W[S�F}^�
?�P�c��e���6�c&``�"lI��2�/�O\������t�R
m'}���/��Q�]��M@��,�Y��w���d��|�����
�9>t�ݟp� %g*v������KY`4�jǳ-&���1[K2�37:[��bF��	�)��Z�1�6�t��'����J���S���"���8=�(�k�5lG��S�r$��V��L�i6*͔<:^�F��b��5PbDs��f�!AD�����`�Bp��(����]sW��� �
=���
��5�l|g(�2�5���\5�*J��c*�U���|}d���̴c�3�J��>�Z�b!�gT��9W�)>�{�6<oq<�ۘD�_�H|���+����BC�􁕎f&�cm>36=�$�T,ʺ�y�+Nd[a�:����V#�N��I��.�����i��~w�|2����x���� 
����q��V�a�����6��9�j5{H��{��AI�B� IQ@W��Tȧ0��4�n�K��_Hw�ħ�Z�S��>@��������y�}��Xf�� �]�%��wf��̒Yuj���� �/�H�R�B�.2�����P�*�=5��e��=T�q_��8��<��qK0 9�xI�XyP� !N�#QF }N!R�o�F����OPôL;_�Q���UJЅ��?���$�F�+�|�ys�x�0#�!��T�'A��6�v���t�*9_E�]�ή�!�Q���J�=�&��&]xKmND��}��Rv����_]3!,H�RI��X�����]Q��@��0��5~���m�s@���:*]]E�rgY�q쥳���(�mI`�@��t��/�ל�n6���B�]#��C�kDr�3z���$����W(*D� �<�:5���i���>�O����O�՜.f��K�*�X��4>�T&�ѡ9#]��c1vr(ٜ�GH"»�K�u�;��S�e��m���i �������$�L��z��Kr@o���V�i�$ț�Pl���3
$p��Ƀiz�o�]��r�?>�R�Ȉ��Q/�iG��?p�"�g�J���"���0KR�CAU7c@/TJ�C��F@�u�SP�w&�>���;��#X�(+F�S	���J  ���=���R1m�W����x����"I�C{��k���v7P�}�ƺ���cX�g�8���,����_@/��̄�y)��O�@ �/�Ia     