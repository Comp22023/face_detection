PGDMP      8                |            detection_face    16.2    16.2 s    B           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            C           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            D           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            E           1262    16581    detection_face    DATABASE     �   CREATE DATABASE detection_face WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE detection_face;
                postgres    false            �            1259    16608 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    16607    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    222            F           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    221            �            1259    16617    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    16616    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    224            G           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    223            �            1259    16601    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    16600    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    220            H           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    219            �            1259    16734    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    16733    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    236            I           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    235            �            1259    16592    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    16591    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    218            J           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    217            �            1259    16583    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    16582    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    216            K           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    215            �            1259    16755    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    16684    face_app_facetrimuser    TABLE     �  CREATE TABLE public.face_app_facetrimuser (
    id bigint NOT NULL,
    face_photo character varying(100) NOT NULL,
    name text,
    description text,
    age integer,
    dominant_gender character varying(10),
    dominant_race character varying(100),
    dominant_emotion character varying(100),
    face_encodings bytea,
    download_date date NOT NULL,
    users_id_id bigint NOT NULL
);
 )   DROP TABLE public.face_app_facetrimuser;
       public         heap    postgres    false            �            1259    16683    face_app_facetrimuser_id_seq    SEQUENCE     �   CREATE SEQUENCE public.face_app_facetrimuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.face_app_facetrimuser_id_seq;
       public          postgres    false    234            L           0    0    face_app_facetrimuser_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.face_app_facetrimuser_id_seq OWNED BY public.face_app_facetrimuser.id;
          public          postgres    false    233            �            1259    16675    face_app_feedback    TABLE     �   CREATE TABLE public.face_app_feedback (
    id bigint NOT NULL,
    descriptions text NOT NULL,
    email text NOT NULL,
    name text NOT NULL
);
 %   DROP TABLE public.face_app_feedback;
       public         heap    postgres    false            �            1259    16674    face_app_feedback_id_seq    SEQUENCE     �   CREATE SEQUENCE public.face_app_feedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.face_app_feedback_id_seq;
       public          postgres    false    232            M           0    0    face_app_feedback_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.face_app_feedback_id_seq OWNED BY public.face_app_feedback.id;
          public          postgres    false    231            �            1259    16650    face_app_user    TABLE     �  CREATE TABLE public.face_app_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
 !   DROP TABLE public.face_app_user;
       public         heap    postgres    false            �            1259    16661    face_app_user_groups    TABLE     �   CREATE TABLE public.face_app_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);
 (   DROP TABLE public.face_app_user_groups;
       public         heap    postgres    false            �            1259    16660    face_app_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.face_app_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.face_app_user_groups_id_seq;
       public          postgres    false    228            N           0    0    face_app_user_groups_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.face_app_user_groups_id_seq OWNED BY public.face_app_user_groups.id;
          public          postgres    false    227            �            1259    16649    face_app_user_id_seq    SEQUENCE     }   CREATE SEQUENCE public.face_app_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.face_app_user_id_seq;
       public          postgres    false    226            O           0    0    face_app_user_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.face_app_user_id_seq OWNED BY public.face_app_user.id;
          public          postgres    false    225            �            1259    16668    face_app_user_user_permissions    TABLE     �   CREATE TABLE public.face_app_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);
 2   DROP TABLE public.face_app_user_user_permissions;
       public         heap    postgres    false            �            1259    16667 %   face_app_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.face_app_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.face_app_user_user_permissions_id_seq;
       public          postgres    false    230            P           0    0 %   face_app_user_user_permissions_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.face_app_user_user_permissions_id_seq OWNED BY public.face_app_user_user_permissions.id;
          public          postgres    false    229            S           2604    16611    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            T           2604    16620    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            R           2604    16604    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            Z           2604    16737    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    235    236            Q           2604    16595    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            P           2604    16586    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            Y           2604    16687    face_app_facetrimuser id    DEFAULT     �   ALTER TABLE ONLY public.face_app_facetrimuser ALTER COLUMN id SET DEFAULT nextval('public.face_app_facetrimuser_id_seq'::regclass);
 G   ALTER TABLE public.face_app_facetrimuser ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    234    234            X           2604    16678    face_app_feedback id    DEFAULT     |   ALTER TABLE ONLY public.face_app_feedback ALTER COLUMN id SET DEFAULT nextval('public.face_app_feedback_id_seq'::regclass);
 C   ALTER TABLE public.face_app_feedback ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231    232            U           2604    16653    face_app_user id    DEFAULT     t   ALTER TABLE ONLY public.face_app_user ALTER COLUMN id SET DEFAULT nextval('public.face_app_user_id_seq'::regclass);
 ?   ALTER TABLE public.face_app_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226            V           2604    16664    face_app_user_groups id    DEFAULT     �   ALTER TABLE ONLY public.face_app_user_groups ALTER COLUMN id SET DEFAULT nextval('public.face_app_user_groups_id_seq'::regclass);
 F   ALTER TABLE public.face_app_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228            W           2604    16671 !   face_app_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.face_app_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.face_app_user_user_permissions_id_seq'::regclass);
 P   ALTER TABLE public.face_app_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    230    230            0          0    16608 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    222   ��       2          0    16617    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    224   ��       .          0    16601    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    220   Ú       >          0    16734    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    236   y�       ,          0    16592    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    218   ��       *          0    16583    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    216   �       ?          0    16755    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    237   �       <          0    16684    face_app_facetrimuser 
   TABLE DATA           �   COPY public.face_app_facetrimuser (id, face_photo, name, description, age, dominant_gender, dominant_race, dominant_emotion, face_encodings, download_date, users_id_id) FROM stdin;
    public          postgres    false    234   	�       :          0    16675    face_app_feedback 
   TABLE DATA           J   COPY public.face_app_feedback (id, descriptions, email, name) FROM stdin;
    public          postgres    false    232   Э       4          0    16650    face_app_user 
   TABLE DATA           �   COPY public.face_app_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    226   <�       6          0    16661    face_app_user_groups 
   TABLE DATA           E   COPY public.face_app_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    228   �       8          0    16668    face_app_user_user_permissions 
   TABLE DATA           T   COPY public.face_app_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    230   1�       Q           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    221            R           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    223            S           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 32, true);
          public          postgres    false    219            T           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 46, true);
          public          postgres    false    235            U           0    0    django_content_type_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);
          public          postgres    false    217            V           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);
          public          postgres    false    215            W           0    0    face_app_facetrimuser_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.face_app_facetrimuser_id_seq', 70, true);
          public          postgres    false    233            X           0    0    face_app_feedback_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.face_app_feedback_id_seq', 7, true);
          public          postgres    false    231            Y           0    0    face_app_user_groups_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.face_app_user_groups_id_seq', 1, false);
          public          postgres    false    227            Z           0    0    face_app_user_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.face_app_user_id_seq', 6, true);
          public          postgres    false    225            [           0    0 %   face_app_user_user_permissions_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.face_app_user_user_permissions_id_seq', 1, false);
          public          postgres    false    229            i           2606    16647    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    222            n           2606    16633 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    224    224            q           2606    16622 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    224            k           2606    16613    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    222            d           2606    16624 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    220    220            f           2606    16606 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    220            �           2606    16742 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    236            _           2606    16599 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    218    218            a           2606    16597 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    218            ]           2606    16590 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    216            �           2606    16761 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    237            �           2606    16691 0   face_app_facetrimuser face_app_facetrimuser_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.face_app_facetrimuser
    ADD CONSTRAINT face_app_facetrimuser_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.face_app_facetrimuser DROP CONSTRAINT face_app_facetrimuser_pkey;
       public            postgres    false    234            �           2606    16682 (   face_app_feedback face_app_feedback_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.face_app_feedback
    ADD CONSTRAINT face_app_feedback_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.face_app_feedback DROP CONSTRAINT face_app_feedback_pkey;
       public            postgres    false    232            y           2606    16666 .   face_app_user_groups face_app_user_groups_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.face_app_user_groups
    ADD CONSTRAINT face_app_user_groups_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.face_app_user_groups DROP CONSTRAINT face_app_user_groups_pkey;
       public            postgres    false    228            |           2606    16694 H   face_app_user_groups face_app_user_groups_user_id_group_id_be70f762_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.face_app_user_groups
    ADD CONSTRAINT face_app_user_groups_user_id_group_id_be70f762_uniq UNIQUE (user_id, group_id);
 r   ALTER TABLE ONLY public.face_app_user_groups DROP CONSTRAINT face_app_user_groups_user_id_group_id_be70f762_uniq;
       public            postgres    false    228    228            s           2606    16657     face_app_user face_app_user_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.face_app_user
    ADD CONSTRAINT face_app_user_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.face_app_user DROP CONSTRAINT face_app_user_pkey;
       public            postgres    false    226            ~           2606    16708 [   face_app_user_user_permissions face_app_user_user_permi_user_id_permission_id_ccebbd48_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.face_app_user_user_permissions
    ADD CONSTRAINT face_app_user_user_permi_user_id_permission_id_ccebbd48_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.face_app_user_user_permissions DROP CONSTRAINT face_app_user_user_permi_user_id_permission_id_ccebbd48_uniq;
       public            postgres    false    230    230            �           2606    16673 B   face_app_user_user_permissions face_app_user_user_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.face_app_user_user_permissions
    ADD CONSTRAINT face_app_user_user_permissions_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.face_app_user_user_permissions DROP CONSTRAINT face_app_user_user_permissions_pkey;
       public            postgres    false    230            v           2606    16659 (   face_app_user face_app_user_username_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.face_app_user
    ADD CONSTRAINT face_app_user_username_key UNIQUE (username);
 R   ALTER TABLE ONLY public.face_app_user DROP CONSTRAINT face_app_user_username_key;
       public            postgres    false    226            g           1259    16648    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    222            l           1259    16644 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    224            o           1259    16645 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    224            b           1259    16630 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    220            �           1259    16753 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    236            �           1259    16754 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    236            �           1259    16763 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    237            �           1259    16762 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    237            �           1259    16732 *   face_app_facetrimuser_users_id_id_acdebbee    INDEX     s   CREATE INDEX face_app_facetrimuser_users_id_id_acdebbee ON public.face_app_facetrimuser USING btree (users_id_id);
 >   DROP INDEX public.face_app_facetrimuser_users_id_id_acdebbee;
       public            postgres    false    234            w           1259    16706 &   face_app_user_groups_group_id_1dd844cb    INDEX     k   CREATE INDEX face_app_user_groups_group_id_1dd844cb ON public.face_app_user_groups USING btree (group_id);
 :   DROP INDEX public.face_app_user_groups_group_id_1dd844cb;
       public            postgres    false    228            z           1259    16705 %   face_app_user_groups_user_id_39b695f8    INDEX     i   CREATE INDEX face_app_user_groups_user_id_39b695f8 ON public.face_app_user_groups USING btree (user_id);
 9   DROP INDEX public.face_app_user_groups_user_id_39b695f8;
       public            postgres    false    228                       1259    16720 5   face_app_user_user_permissions_permission_id_08d47788    INDEX     �   CREATE INDEX face_app_user_user_permissions_permission_id_08d47788 ON public.face_app_user_user_permissions USING btree (permission_id);
 I   DROP INDEX public.face_app_user_user_permissions_permission_id_08d47788;
       public            postgres    false    230            �           1259    16719 /   face_app_user_user_permissions_user_id_edc84e78    INDEX     }   CREATE INDEX face_app_user_user_permissions_user_id_edc84e78 ON public.face_app_user_user_permissions USING btree (user_id);
 C   DROP INDEX public.face_app_user_user_permissions_user_id_edc84e78;
       public            postgres    false    230            t           1259    16692 $   face_app_user_username_d46bcfc7_like    INDEX     v   CREATE INDEX face_app_user_username_d46bcfc7_like ON public.face_app_user USING btree (username varchar_pattern_ops);
 8   DROP INDEX public.face_app_user_username_d46bcfc7_like;
       public            postgres    false    226            �           2606    16639 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    220    4710    224            �           2606    16634 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    4715    222    224            �           2606    16625 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    218    220    4705            �           2606    16743 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    4705    236    218            �           2606    16748 F   django_admin_log django_admin_log_user_id_c564eba6_fk_face_app_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_face_app_user_id FOREIGN KEY (user_id) REFERENCES public.face_app_user(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_face_app_user_id;
       public          postgres    false    236    226    4723            �           2606    16727 T   face_app_facetrimuser face_app_facetrimuser_users_id_id_acdebbee_fk_face_app_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.face_app_facetrimuser
    ADD CONSTRAINT face_app_facetrimuser_users_id_id_acdebbee_fk_face_app_user_id FOREIGN KEY (users_id_id) REFERENCES public.face_app_user(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.face_app_facetrimuser DROP CONSTRAINT face_app_facetrimuser_users_id_id_acdebbee_fk_face_app_user_id;
       public          postgres    false    234    4723    226            �           2606    16700 L   face_app_user_groups face_app_user_groups_group_id_1dd844cb_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.face_app_user_groups
    ADD CONSTRAINT face_app_user_groups_group_id_1dd844cb_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.face_app_user_groups DROP CONSTRAINT face_app_user_groups_group_id_1dd844cb_fk_auth_group_id;
       public          postgres    false    4715    222    228            �           2606    16695 N   face_app_user_groups face_app_user_groups_user_id_39b695f8_fk_face_app_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.face_app_user_groups
    ADD CONSTRAINT face_app_user_groups_user_id_39b695f8_fk_face_app_user_id FOREIGN KEY (user_id) REFERENCES public.face_app_user(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.face_app_user_groups DROP CONSTRAINT face_app_user_groups_user_id_39b695f8_fk_face_app_user_id;
       public          postgres    false    4723    226    228            �           2606    16714 W   face_app_user_user_permissions face_app_user_user_p_permission_id_08d47788_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.face_app_user_user_permissions
    ADD CONSTRAINT face_app_user_user_p_permission_id_08d47788_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.face_app_user_user_permissions DROP CONSTRAINT face_app_user_user_p_permission_id_08d47788_fk_auth_perm;
       public          postgres    false    220    4710    230            �           2606    16709 Q   face_app_user_user_permissions face_app_user_user_p_user_id_edc84e78_fk_face_app_    FK CONSTRAINT     �   ALTER TABLE ONLY public.face_app_user_user_permissions
    ADD CONSTRAINT face_app_user_user_p_user_id_edc84e78_fk_face_app_ FOREIGN KEY (user_id) REFERENCES public.face_app_user(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.face_app_user_user_permissions DROP CONSTRAINT face_app_user_user_p_user_id_edc84e78_fk_face_app_;
       public          postgres    false    226    230    4723            0      x������ � �      2      x������ � �      .   �  x���KN�0@��)rT'���H($�D�I���� ����� P���(Wpn�;�d<]T�&��o&�#�q�iL�I��\
%��ʮa)C@��8�hF�����ꚃ.D`��L?0l hЙ�u9˪*+r��Зc �y���c,
z�	�w�YN�b1·T=_��G/D���"��HH*- �uI�׶wA��k��#R�}��?��xTd��Dh�e쨳���� �q%�ؗ%=;��w$�Z,�A`�!�3ZT�C��ʐM ��G ��x܆��M����|4��y6����'�i�f۬��n�N���N���ODW�e�p<�A��dτRM�y3;��3���b�m�����fe�����_v�cw�8�u�͠c�S˵�`��Z�������\��j�gR��R�      >     x��Ms�6������ښ�b�ɓ�ZI�:J<�L㌆2)Y�)��$��$�+��4��R](x,v�h�8���Bl,�3��#.�gE�M�ge^�w�'�J���<GE&�=ތ�xįc%�Nf�-By'��ק��-4�xyu�E�!A�`���X�>�jA�,A�~y=%݂� �G������iA�u� Fӗ2vA���{�"��9���6'`- �� I�`�bH�	��X;�?{g�9^	�h6(0g����?����"�
L�tP����pyM����V������)�٢�,p�r�=ʋ�i���Qp�)���_]ώ^RD�G\U*u�_���ϗǔ�l���]N��X>�}}H-u���5��/�?�(i�����SA�����h*x�AA����<G�^\�D-��o���J[|	��vmK68x���a���lh1%�Ua@�;~���q)��9-�,U�Oì��X1ȑI�'�ek���P	b:�����Q�����ۻt6γ���y4�ﳅ��n��f���[����_��k�zMn�5�K���E#1X�wv��v]��*i��5*�� v���
�2e)�ka�-���r�?veZ.!�jd��Dk��X�LG�]������E�Ч|u7FiVLf��YU%/�D����⩧c�t�����Eat0��
^ϗ��eUB˵��-#�ﺘ-F�DW�,Af��]�X��d�M8K��A��!Τ�|Q����Bb"B
��	�ٍ�t��!�[!��d(�W�~��yg�0������d�:˅KA�P2�ћN��8(����cg5���Qx�i�/��1�-Y!tв��I��hDD�z�7	�mƳ�[X�"q?9Bl'S%\!�T��$���̖d���j~�����Q�ڤ[����q��O��*����������T���N�7d����#��q��@��=�Y����hw�$�jw��
���Q���^/��Q��xoo�o���      ,   q   x�M�K�0�~�A�W82�["Hb�ɢ�oU��ݼѼ#q�b�o%W�p"n�M*��{,��4ŅB�uI����+���:8ȓU��n�D���;�@����q 0DW6g      *   �  x���Ѯ� ���S����� �,�b��D�E=9}���n�M�!&8�����'�O�}0c �lo'�ۂ������ӅÉ�$Q�v�����ܧQ녊7�ם�F�Db����oKFL�
�+H�v2^�wv��Ӄ��_�5}��DUH#Jd[Q��i۾��DU���)�H��a7���ψV��j]c����6��fF�̐2��l}�F���m30t��2�6�[{Փ��׫2�;�:3��1/daI�F��qrӚ73�Ib&U?څ
f'�H�$���x7�(	x���"�y5x�uJ�{xI������,�f�^UBbE�%�������~��@\T��^;��(�A����QC1�!_����A��Aل��H���$&L�S��[�U8[���@b�`U1���B+a���?�h�=� '>@�~$	 /L��P��T�9�� t:      ?     x����r�P ��u|�컰��4"����b�.��py�6]y�l����	��n���r4G|�2X�e����Ƙ�,�3���G�y+r�6E�L����ۆ]��+VYeZ�:������l{�B0��o���,��ڀi����S�]�?��v!�����W��I2���Z�j�����褟2X�Π����:K�F;�_���l�J� ��.�oDu�F]7��(�SI�M����� ���^s�����S��!�x�A�
yc��$������J�Į� � "?ZG}��2g�Ҩ������)�[Y8�Τ���vQ�5J���K�M���c�9�^P���p	$�ۨ�j!�u� ���I/��������F��&���{`dۉI�x���!�o�p;�]��물X���~�Dȯ@T��
ώ ϣ�%�(�ՍԀEU�݈4wbX �(�yV�_i�J�B8�$�r�qײ��{Pq��������+%ٻZ�ۏ��d�6��nK�� }�].��3}�      <   �  x��XM�u7�ol ����+�u��$B�� �b�� � �"��-ܷ#��>��7;�c�����=�K��g��O��c~�٧��<�����W������������_?�������=�zy���5~�����7�o_�|����O�o^������x|��%^��壏>O?�yr�U��?�$E���?�)��Y���'���R��̎��5IV�����������zM6��U�x�o덲�����g�M�\|�o�����"ޕ��x^w]��Y{�۳�{W���$��ֿw�{�{W�������T��J�,�ɱ_ɭj�x���-�?�d߱�ρ7�?�mE|��j��=�6޷9��8߱������D>Z��lO��juY����f<�Ҥ�w�"'��7���R����������uD�����P<M7��r��Fx]qKq^g�G~ҵ�_>y���ک�n��\�_J��ߟ4򜌏i�����+�!���xv�ٝ��l2?z6���fڃ��U����+�g뻩D~��G�;�,#�K�x�,���{���W��K��h�-�s	<��q��2z
�b�ܦ+էڰߗ�r��_��y�7A�|��Vԓ���^�7y"񋝫��C>���v��DM��}x����ei�V/�U��J��C���c�z��*��ђ6#=:C�R��Gr����ȯ�ݡn9�_��X/[uk�}�����^=��L��O4�z�z����zC����k�8���o�;�b`��ֈ��z��W{�*#�EF i�,k�M�}�b�����?�UO_�Z�J�������;����J�����/�%���b�<���I�g�|z�x�nC����}��y��wC�iȇ?�N���_=�{y���x���P|���K���s�S<4q[SaA��&y�j��Oy�y�Z�z����MPT�8�g�Ĺ��i��:P�y�y쟽w���IJ��J5T�Ф��끟�g�aHQ�8�N�����'>9�wi�]���ҔAB�\Y7��y3�f��S���~��GG!
�4^g_�P�w!ME;,F���}����hs>��#3Σ]�Λo+��y��F7(�p�8��\��3Y��m69����i�X�7y�ݎ8y�'�>ٽ:c=�"F C�<�y����)��7<��<��>��B�!g�GC|VK���8i ���6�� ��>O�]�{*�/B�C �=G.OA=b{gOzvN�m>�?"i4�ܚŨ^�ɣZ⣙��UC/N�wU��y��ӣix���v����>гi�^������/�OGM��s��7���kP���cv��+M[�u�F=Q�Lk�z(gϰ6(E���=����ߞ�%<7�������������7@=GP.�?��ʪ��7�
�	�̱_�	��N8|�;���л�D3Lƍ��z]+s?��Q~���ϠC�R��v��;<���*�5#=��V9��=�S��H��`�x���if=}d�����?�4�;��S� >�}��޵ÿ�pү~��r����<iFAw���'�����3��흏g�?��%E.,@�'>[ ~�%L�Y;���P�X ��� ��� �@�E�2%jS�~�3�@�x���A�c�I����d�0b�Ґv35!�5L��r#��^u6�e�G��4�6��n����c}cN3��,N���Z���1����YH����CCs� d�� 8	��yh��׃a���:蒦�^w��a��9-QO���K��ru��(q��x69; /y�!E��w���qδX#�V"\or�T�Guψ#;�g��'���l� �
��hs�:�	$��3�A`�I����%��ى߇߾�`c���7���� }��y
o�Ps�a�K�Q�12Y �?��m*�cI?FyϝF�
znuj��d��<�L��A�)�0�Ɔc�FfA�]��%�/�/���0!�0���jS����C�R�s�B�PhȪdH�������RgM�����0=/��.I�С�;+�	�;	����4`�ލ�=Gl2��_���� ~.�;үSZ���M�WE~,�޺:�{�ٝ.���"�@�������&��=�c��K��>��0d@��ti�S!��t+���eL2l�`�&���	r<�ͶB��|�C�y���}�z�!|��@I�"J�0%c���6}��ݻ��      :   \   x�3�0�bÅ}6]�
�w]��Y�Ybff鐛���WT�yaPnÅ�\����EE%i�)霆\f@�azZ����1P���w042�c���� _� r      4   �   x�3�,H�NI3�/�H425S123 ���H�|__� �P��r����/OO�4�Ғ䔰tg���<�R��'��ʌ�L�0��,}�P[N##]3]##C3+SC+=3KKKSsmc��Ĕ��<�3.l����^�K/�2�\��d���Y:�&f������3�5��54U02�21�24 ������ :>�      6      x������ � �      8      x������ � �     