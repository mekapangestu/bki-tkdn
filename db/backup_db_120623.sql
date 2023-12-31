PGDMP     2                    {            kso_eni    14.6 (Debian 14.6-1.pgdg110+1)    14.7 �    (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            )           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            *           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            +           1262    16384    kso_eni    DATABASE     [   CREATE DATABASE kso_eni WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
    DROP DATABASE kso_eni;
                root    false                       1259    16721    activity_log    TABLE     r  CREATE TABLE public.activity_log (
    id bigint NOT NULL,
    log_name character varying(255),
    description text NOT NULL,
    subject_type character varying(255),
    subject_id bigint,
    causer_type character varying(255),
    causer_id bigint,
    properties json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
     DROP TABLE public.activity_log;
       public         heap    root    false                       1259    16720    activity_log_id_seq    SEQUENCE     |   CREATE SEQUENCE public.activity_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.activity_log_id_seq;
       public          root    false    261            ,           0    0    activity_log_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.activity_log_id_seq OWNED BY public.activity_log.id;
          public          root    false    260            �            1259    16449    ba    TABLE     �   CREATE TABLE public.ba (
    id bigint NOT NULL,
    file character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.ba;
       public         heap    root    false            �            1259    16448 	   ba_id_seq    SEQUENCE     r   CREATE SEQUENCE public.ba_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.ba_id_seq;
       public          root    false    223            -           0    0 	   ba_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE public.ba_id_seq OWNED BY public.ba.id;
          public          root    false    222            �            1259    16440    boqs    TABLE       CREATE TABLE public.boqs (
    id bigint NOT NULL,
    project_type character varying(255) NOT NULL,
    equipment character varying(255) NOT NULL,
    tag_number character varying(255) NOT NULL,
    contract_value character varying(255) NOT NULL,
    size character varying(255),
    dimension character varying(255),
    capacity character varying(255),
    po_id integer NOT NULL,
    note text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    edited_value character varying(255)
);
    DROP TABLE public.boqs;
       public         heap    root    false            �            1259    16439    boqs_id_seq    SEQUENCE     t   CREATE SEQUENCE public.boqs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.boqs_id_seq;
       public          root    false    221            .           0    0    boqs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.boqs_id_seq OWNED BY public.boqs.id;
          public          root    false    220            �            1259    16629 
   categories    TABLE     �   CREATE TABLE public.categories (
    id bigint NOT NULL,
    cat_id character varying(255) NOT NULL,
    cat_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.categories;
       public         heap    root    false            �            1259    16628    categories_id_seq    SEQUENCE     z   CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public          root    false    251            /           0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
          public          root    false    250            �            1259    16638    certifications    TABLE     ;  CREATE TABLE public.certifications (
    id bigint NOT NULL,
    cert_title character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    expired_date date NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 "   DROP TABLE public.certifications;
       public         heap    root    false            �            1259    16637    certifications_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.certifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.certifications_id_seq;
       public          root    false    253            0           0    0    certifications_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.certifications_id_seq OWNED BY public.certifications.id;
          public          root    false    252                        1259    16670    coi_activities    TABLE       CREATE TABLE public.coi_activities (
    id bigint NOT NULL,
    coi_id bigint NOT NULL,
    user_id bigint NOT NULL,
    activity character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    notes character varying(255)
);
 "   DROP TABLE public.coi_activities;
       public         heap    root    false            �            1259    16669    coi_activities_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.coi_activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.coi_activities_id_seq;
       public          root    false    256            1           0    0    coi_activities_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.coi_activities_id_seq OWNED BY public.coi_activities.id;
          public          root    false    255                       1259    16712    coi_templates    TABLE       CREATE TABLE public.coi_templates (
    id bigint NOT NULL,
    equipment character varying(255) NOT NULL,
    template text NOT NULL,
    technical jsonb,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    additional jsonb
);
 !   DROP TABLE public.coi_templates;
       public         heap    root    false                       1259    16711    coi_templates_id_seq    SEQUENCE     }   CREATE SEQUENCE public.coi_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.coi_templates_id_seq;
       public          root    false    259            2           0    0    coi_templates_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.coi_templates_id_seq OWNED BY public.coi_templates.id;
          public          root    false    258            �            1259    16611    cois    TABLE     v  CREATE TABLE public.cois (
    id bigint NOT NULL,
    coi_no character varying(255) NOT NULL,
    basic_law character varying(255),
    spk_detail character varying(255),
    detail_report character varying(255),
    equipment character varying(255),
    description character varying(255),
    location character varying(255),
    coi_date character varying(255),
    owner character varying(255),
    tag_no character varying(255),
    reference character varying(255),
    expire_date character varying(255),
    technical jsonb,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.cois;
       public         heap    root    false            �            1259    16610    cois_id_seq    SEQUENCE     t   CREATE SEQUENCE public.cois_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.cois_id_seq;
       public          root    false    247            3           0    0    cois_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.cois_id_seq OWNED BY public.cois.id;
          public          root    false    246            �            1259    16465    delivery_orders    TABLE     I  CREATE TABLE public.delivery_orders (
    id bigint NOT NULL,
    do_no character varying(255) NOT NULL,
    company_name character varying(255) NOT NULL,
    project_value character varying(255) NOT NULL,
    do_date date NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 #   DROP TABLE public.delivery_orders;
       public         heap    root    false            �            1259    16464    delivery_orders_id_seq    SEQUENCE        CREATE SEQUENCE public.delivery_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.delivery_orders_id_seq;
       public          root    false    227            4           0    0    delivery_orders_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.delivery_orders_id_seq OWNED BY public.delivery_orders.id;
          public          root    false    226            �            1259    16410    failed_jobs    TABLE     &  CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.failed_jobs;
       public         heap    root    false            �            1259    16409    failed_jobs_id_seq    SEQUENCE     {   CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.failed_jobs_id_seq;
       public          root    false    215            5           0    0    failed_jobs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;
          public          root    false    214            �            1259    16568    job_executors    TABLE     �  CREATE TABLE public.job_executors (
    id bigint NOT NULL,
    sos_no character varying(255) NOT NULL,
    inspector character varying(255) NOT NULL,
    inspection_date date,
    document_check boolean,
    job_status character varying(255),
    minutes_no character varying(255),
    minutes_note character varying(255),
    minutes_date date,
    coi_no character varying(255),
    coi_date date,
    expired_date date,
    notes character varying(255),
    pic_company character varying(255),
    bast_date date,
    plo_number character varying(255),
    plo_date date,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    template bigint
);
 !   DROP TABLE public.job_executors;
       public         heap    root    false            �            1259    16567    job_executors_id_seq    SEQUENCE     }   CREATE SEQUENCE public.job_executors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.job_executors_id_seq;
       public          root    false    240            6           0    0    job_executors_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.job_executors_id_seq OWNED BY public.job_executors.id;
          public          root    false    239            �            1259    16586 
   job_status    TABLE     �   CREATE TABLE public.job_status (
    id bigint NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.job_status;
       public         heap    root    false            �            1259    16585    job_status_id_seq    SEQUENCE     z   CREATE SEQUENCE public.job_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.job_status_id_seq;
       public          root    false    244            7           0    0    job_status_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.job_status_id_seq OWNED BY public.job_status.id;
          public          root    false    243            �            1259    16651    map_boq_coi    TABLE     �   CREATE TABLE public.map_boq_coi (
    boq_id integer NOT NULL,
    coi_id integer NOT NULL,
    status integer,
    reviewer_1 bigint NOT NULL,
    reviewer_2 bigint NOT NULL,
    approval bigint NOT NULL
);
    DROP TABLE public.map_boq_coi;
       public         heap    root    false            �            1259    16482    map_boq_dos    TABLE     ]   CREATE TABLE public.map_boq_dos (
    boq_id integer NOT NULL,
    do_id integer NOT NULL
);
    DROP TABLE public.map_boq_dos;
       public         heap    root    false            �            1259    16592 
   map_boq_je    TABLE     \   CREATE TABLE public.map_boq_je (
    boq_id integer NOT NULL,
    je_id integer NOT NULL
);
    DROP TABLE public.map_boq_je;
       public         heap    root    false            �            1259    16495    map_boq_sos    TABLE     ^   CREATE TABLE public.map_boq_sos (
    boq_id integer NOT NULL,
    sos_id integer NOT NULL
);
    DROP TABLE public.map_boq_sos;
       public         heap    root    false            �            1259    16386 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    root    false            �            1259    16385    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          root    false    210            8           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          root    false    209            �            1259    16530    model_has_permissions    TABLE     �   CREATE TABLE public.model_has_permissions (
    permission_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);
 )   DROP TABLE public.model_has_permissions;
       public         heap    root    false            �            1259    16541    model_has_roles    TABLE     �   CREATE TABLE public.model_has_roles (
    role_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);
 #   DROP TABLE public.model_has_roles;
       public         heap    root    false                       1259    16703    notifications    TABLE     `  CREATE TABLE public.notifications (
    id uuid NOT NULL,
    type character varying(255) NOT NULL,
    notifiable_type character varying(255) NOT NULL,
    notifiable_id bigint NOT NULL,
    data text NOT NULL,
    read_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 !   DROP TABLE public.notifications;
       public         heap    root    false            �            1259    16403    password_resets    TABLE     �   CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);
 #   DROP TABLE public.password_resets;
       public         heap    root    false            �            1259    16509    permissions    TABLE     �   CREATE TABLE public.permissions (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.permissions;
       public         heap    root    false            �            1259    16508    permissions_id_seq    SEQUENCE     {   CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.permissions_id_seq;
       public          root    false    233            9           0    0    permissions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;
          public          root    false    232            �            1259    16456    purchase_orders    TABLE     �  CREATE TABLE public.purchase_orders (
    id bigint NOT NULL,
    po_no character varying(255) NOT NULL,
    spk_no character varying(255) NOT NULL,
    project_name character varying(255) NOT NULL,
    project_value character varying(255) NOT NULL,
    company_name character varying(255) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    area character varying(255) NOT NULL,
    location character varying(255) NOT NULL,
    description text,
    sow text,
    status character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    lat character varying(255),
    long character varying(255)
);
 #   DROP TABLE public.purchase_orders;
       public         heap    root    false            �            1259    16455    purchase_orders_id_seq    SEQUENCE        CREATE SEQUENCE public.purchase_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.purchase_orders_id_seq;
       public          root    false    225            :           0    0    purchase_orders_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.purchase_orders_id_seq OWNED BY public.purchase_orders.id;
          public          root    false    224            �            1259    16552    role_has_permissions    TABLE     m   CREATE TABLE public.role_has_permissions (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);
 (   DROP TABLE public.role_has_permissions;
       public         heap    root    false            �            1259    16520    roles    TABLE     �   CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.roles;
       public         heap    root    false            �            1259    16519    roles_id_seq    SEQUENCE     u   CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          root    false    235            ;           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          root    false    234            �            1259    16474    sos    TABLE     H  CREATE TABLE public.sos (
    id bigint NOT NULL,
    sos_no character varying(255) NOT NULL,
    branch_name character varying(255) NOT NULL,
    value character varying(255) NOT NULL,
    sos_date character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.sos;
       public         heap    root    false            �            1259    16473 
   sos_id_seq    SEQUENCE     s   CREATE SEQUENCE public.sos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.sos_id_seq;
       public          root    false    229            <           0    0 
   sos_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.sos_id_seq OWNED BY public.sos.id;
          public          root    false    228            �            1259    16431    spks    TABLE     8  CREATE TABLE public.spks (
    id bigint NOT NULL,
    spk_no character varying(255) NOT NULL,
    project_name character varying(255) NOT NULL,
    project_value character varying(255) NOT NULL,
    company_name character varying(255) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    area character varying(255) NOT NULL,
    location character varying(255) NOT NULL,
    description text,
    sow text,
    status character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.spks;
       public         heap    root    false            �            1259    16430    spks_id_seq    SEQUENCE     t   CREATE SEQUENCE public.spks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.spks_id_seq;
       public          root    false    219            =           0    0    spks_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.spks_id_seq OWNED BY public.spks.id;
          public          root    false    218            �            1259    16577    types    TABLE     �   CREATE TABLE public.types (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    user_input character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.types;
       public         heap    root    false            �            1259    16576    types_id_seq    SEQUENCE     u   CREATE SEQUENCE public.types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.types_id_seq;
       public          root    false    242            >           0    0    types_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.types_id_seq OWNED BY public.types.id;
          public          root    false    241            �            1259    16422    uploads    TABLE     �  CREATE TABLE public.uploads (
    id bigint NOT NULL,
    request_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    path character varying(255) NOT NULL,
    "order" integer NOT NULL,
    label character varying(255),
    upload_date date NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.uploads;
       public         heap    root    false            �            1259    16421    uploads_id_seq    SEQUENCE     w   CREATE SEQUENCE public.uploads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.uploads_id_seq;
       public          root    false    217            ?           0    0    uploads_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.uploads_id_seq OWNED BY public.uploads.id;
          public          root    false    216            �            1259    16620    user_details    TABLE     b  CREATE TABLE public.user_details (
    id bigint NOT NULL,
    user_id smallint NOT NULL,
    expired_date character varying(255),
    nup bigint,
    jabatan character varying(255),
    kode_departemen character varying(255),
    sign text,
    photo text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
     DROP TABLE public.user_details;
       public         heap    root    false            �            1259    16619    user_details_id_seq    SEQUENCE     |   CREATE SEQUENCE public.user_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.user_details_id_seq;
       public          root    false    249            @           0    0    user_details_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.user_details_id_seq OWNED BY public.user_details.id;
          public          root    false    248            �            1259    16393    users    TABLE     �  CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    contact character varying(255) NOT NULL,
    role_id integer,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    status character varying(255),
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.users;
       public         heap    root    false            �            1259    16392    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          root    false    212            A           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          root    false    211                       1259    16757    vw_all_data    VIEW     �  CREATE VIEW public.vw_all_data AS
 SELECT boqs.project_type,
    boqs.equipment,
    boqs.tag_number,
    boqs.contract_value,
    boqs.size,
    boqs.dimension,
    boqs.capacity,
    boqs.note,
    purchase_orders.po_no,
    purchase_orders.area,
    purchase_orders.location,
    purchase_orders.lat,
    purchase_orders.long,
    delivery_orders.do_no,
    delivery_orders.company_name,
    delivery_orders.project_value,
    delivery_orders.do_date,
    sos.sos_no,
    sos.branch_name,
    sos.value,
    sos.sos_date,
    job_executors.inspector,
    job_executors.inspection_date,
    job_executors.document_check,
    job_executors.job_status,
    job_executors.minutes_no,
    job_executors.minutes_date,
    job_executors.minutes_note,
    job_executors.coi_no,
    job_executors.coi_date,
    job_executors.expired_date,
    job_executors.notes,
    job_executors.updated_at,
    job_executors.pic_company,
    job_executors.bast_date,
    job_executors.plo_number,
    job_executors.plo_date,
    job_executors.template,
    map_boq_coi.status AS coi_status
   FROM (((((((((public.purchase_orders
     LEFT JOIN public.boqs ON ((boqs.po_id = purchase_orders.id)))
     LEFT JOIN public.map_boq_dos ON ((boqs.id = map_boq_dos.boq_id)))
     LEFT JOIN public.map_boq_je ON ((map_boq_je.boq_id = boqs.id)))
     LEFT JOIN public.map_boq_sos ON ((boqs.id = map_boq_sos.boq_id)))
     LEFT JOIN public.map_boq_coi ON ((boqs.id = map_boq_coi.coi_id)))
     LEFT JOIN public.delivery_orders ON ((map_boq_dos.do_id = delivery_orders.id)))
     LEFT JOIN public.sos ON ((map_boq_sos.sos_id = sos.id)))
     LEFT JOIN public.job_executors ON ((map_boq_je.je_id = job_executors.id)))
     LEFT JOIN public.cois ON ((cois.id = map_boq_coi.coi_id)));
    DROP VIEW public.vw_all_data;
       public          root    false    229    229    231    227    231    227    227    240    221    221    240    240    227    227    225    225    240    221    240    240    221    240    245    229    229    229    230    240    240    221    230    221    221    240    225    225    221    225    225    240    240    221    254    245    240    240    254    240    240    247    240    221    240                       2604    16724    activity_log id    DEFAULT     r   ALTER TABLE ONLY public.activity_log ALTER COLUMN id SET DEFAULT nextval('public.activity_log_id_seq'::regclass);
 >   ALTER TABLE public.activity_log ALTER COLUMN id DROP DEFAULT;
       public          root    false    261    260    261            �           2604    16452    ba id    DEFAULT     ^   ALTER TABLE ONLY public.ba ALTER COLUMN id SET DEFAULT nextval('public.ba_id_seq'::regclass);
 4   ALTER TABLE public.ba ALTER COLUMN id DROP DEFAULT;
       public          root    false    222    223    223            �           2604    16443    boqs id    DEFAULT     b   ALTER TABLE ONLY public.boqs ALTER COLUMN id SET DEFAULT nextval('public.boqs_id_seq'::regclass);
 6   ALTER TABLE public.boqs ALTER COLUMN id DROP DEFAULT;
       public          root    false    220    221    221                       2604    16632    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public          root    false    251    250    251                       2604    16641    certifications id    DEFAULT     v   ALTER TABLE ONLY public.certifications ALTER COLUMN id SET DEFAULT nextval('public.certifications_id_seq'::regclass);
 @   ALTER TABLE public.certifications ALTER COLUMN id DROP DEFAULT;
       public          root    false    252    253    253                       2604    16673    coi_activities id    DEFAULT     v   ALTER TABLE ONLY public.coi_activities ALTER COLUMN id SET DEFAULT nextval('public.coi_activities_id_seq'::regclass);
 @   ALTER TABLE public.coi_activities ALTER COLUMN id DROP DEFAULT;
       public          root    false    256    255    256                       2604    16715    coi_templates id    DEFAULT     t   ALTER TABLE ONLY public.coi_templates ALTER COLUMN id SET DEFAULT nextval('public.coi_templates_id_seq'::regclass);
 ?   ALTER TABLE public.coi_templates ALTER COLUMN id DROP DEFAULT;
       public          root    false    258    259    259                        2604    16614    cois id    DEFAULT     b   ALTER TABLE ONLY public.cois ALTER COLUMN id SET DEFAULT nextval('public.cois_id_seq'::regclass);
 6   ALTER TABLE public.cois ALTER COLUMN id DROP DEFAULT;
       public          root    false    246    247    247            �           2604    16468    delivery_orders id    DEFAULT     x   ALTER TABLE ONLY public.delivery_orders ALTER COLUMN id SET DEFAULT nextval('public.delivery_orders_id_seq'::regclass);
 A   ALTER TABLE public.delivery_orders ALTER COLUMN id DROP DEFAULT;
       public          root    false    226    227    227            �           2604    16413    failed_jobs id    DEFAULT     p   ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);
 =   ALTER TABLE public.failed_jobs ALTER COLUMN id DROP DEFAULT;
       public          root    false    214    215    215            �           2604    16571    job_executors id    DEFAULT     t   ALTER TABLE ONLY public.job_executors ALTER COLUMN id SET DEFAULT nextval('public.job_executors_id_seq'::regclass);
 ?   ALTER TABLE public.job_executors ALTER COLUMN id DROP DEFAULT;
       public          root    false    240    239    240            �           2604    16589    job_status id    DEFAULT     n   ALTER TABLE ONLY public.job_status ALTER COLUMN id SET DEFAULT nextval('public.job_status_id_seq'::regclass);
 <   ALTER TABLE public.job_status ALTER COLUMN id DROP DEFAULT;
       public          root    false    244    243    244            �           2604    16389    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          root    false    210    209    210            �           2604    16512    permissions id    DEFAULT     p   ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);
 =   ALTER TABLE public.permissions ALTER COLUMN id DROP DEFAULT;
       public          root    false    233    232    233            �           2604    16459    purchase_orders id    DEFAULT     x   ALTER TABLE ONLY public.purchase_orders ALTER COLUMN id SET DEFAULT nextval('public.purchase_orders_id_seq'::regclass);
 A   ALTER TABLE public.purchase_orders ALTER COLUMN id DROP DEFAULT;
       public          root    false    225    224    225            �           2604    16523    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          root    false    234    235    235            �           2604    16477    sos id    DEFAULT     `   ALTER TABLE ONLY public.sos ALTER COLUMN id SET DEFAULT nextval('public.sos_id_seq'::regclass);
 5   ALTER TABLE public.sos ALTER COLUMN id DROP DEFAULT;
       public          root    false    229    228    229            �           2604    16434    spks id    DEFAULT     b   ALTER TABLE ONLY public.spks ALTER COLUMN id SET DEFAULT nextval('public.spks_id_seq'::regclass);
 6   ALTER TABLE public.spks ALTER COLUMN id DROP DEFAULT;
       public          root    false    219    218    219            �           2604    16580    types id    DEFAULT     d   ALTER TABLE ONLY public.types ALTER COLUMN id SET DEFAULT nextval('public.types_id_seq'::regclass);
 7   ALTER TABLE public.types ALTER COLUMN id DROP DEFAULT;
       public          root    false    242    241    242            �           2604    16425 
   uploads id    DEFAULT     h   ALTER TABLE ONLY public.uploads ALTER COLUMN id SET DEFAULT nextval('public.uploads_id_seq'::regclass);
 9   ALTER TABLE public.uploads ALTER COLUMN id DROP DEFAULT;
       public          root    false    216    217    217                       2604    16623    user_details id    DEFAULT     r   ALTER TABLE ONLY public.user_details ALTER COLUMN id SET DEFAULT nextval('public.user_details_id_seq'::regclass);
 >   ALTER TABLE public.user_details ALTER COLUMN id DROP DEFAULT;
       public          root    false    249    248    249            �           2604    16396    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          root    false    211    212    212            %          0    16721    activity_log 
   TABLE DATA           �   COPY public.activity_log (id, log_name, description, subject_type, subject_id, causer_type, causer_id, properties, created_at, updated_at) FROM stdin;
    public          root    false    261   w      �          0    16449    ba 
   TABLE DATA           >   COPY public.ba (id, file, created_at, updated_at) FROM stdin;
    public          root    false    223          �          0    16440    boqs 
   TABLE DATA           �   COPY public.boqs (id, project_type, equipment, tag_number, contract_value, size, dimension, capacity, po_id, note, created_at, updated_at, edited_value) FROM stdin;
    public          root    false    221   =                0    16629 
   categories 
   TABLE DATA           R   COPY public.categories (id, cat_id, cat_name, created_at, updated_at) FROM stdin;
    public          root    false    251   ]                0    16638    certifications 
   TABLE DATA           t   COPY public.certifications (id, cert_title, description, expired_date, user_id, created_at, updated_at) FROM stdin;
    public          root    false    253   �]                 0    16670    coi_activities 
   TABLE DATA           f   COPY public.coi_activities (id, coi_id, user_id, activity, created_at, updated_at, notes) FROM stdin;
    public          root    false    256   �]      #          0    16712    coi_templates 
   TABLE DATA           o   COPY public.coi_templates (id, equipment, template, technical, created_at, updated_at, additional) FROM stdin;
    public          root    false    259   5^                0    16611    cois 
   TABLE DATA           �   COPY public.cois (id, coi_no, basic_law, spk_detail, detail_report, equipment, description, location, coi_date, owner, tag_no, reference, expire_date, technical, created_at, updated_at) FROM stdin;
    public          root    false    247   �c                0    16465    delivery_orders 
   TABLE DATA           r   COPY public.delivery_orders (id, do_no, company_name, project_value, do_date, created_at, updated_at) FROM stdin;
    public          root    false    227   �d      �          0    16410    failed_jobs 
   TABLE DATA           a   COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
    public          root    false    215   gh                0    16568    job_executors 
   TABLE DATA           
  COPY public.job_executors (id, sos_no, inspector, inspection_date, document_check, job_status, minutes_no, minutes_note, minutes_date, coi_no, coi_date, expired_date, notes, pic_company, bast_date, plo_number, plo_date, created_at, updated_at, template) FROM stdin;
    public          root    false    240   �h                0    16586 
   job_status 
   TABLE DATA           H   COPY public.job_status (id, status, created_at, updated_at) FROM stdin;
    public          root    false    244   ܖ                0    16651    map_boq_coi 
   TABLE DATA           _   COPY public.map_boq_coi (boq_id, coi_id, status, reviewer_1, reviewer_2, approval) FROM stdin;
    public          root    false    254   k�                0    16482    map_boq_dos 
   TABLE DATA           4   COPY public.map_boq_dos (boq_id, do_id) FROM stdin;
    public          root    false    230   ��                0    16592 
   map_boq_je 
   TABLE DATA           3   COPY public.map_boq_je (boq_id, je_id) FROM stdin;
    public          root    false    245   ݧ                0    16495    map_boq_sos 
   TABLE DATA           5   COPY public.map_boq_sos (boq_id, sos_id) FROM stdin;
    public          root    false    231   ��      �          0    16386 
   migrations 
   TABLE DATA           :   COPY public.migrations (id, migration, batch) FROM stdin;
    public          root    false    210   ��                0    16530    model_has_permissions 
   TABLE DATA           T   COPY public.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
    public          root    false    236   ��                0    16541    model_has_roles 
   TABLE DATA           H   COPY public.model_has_roles (role_id, model_type, model_id) FROM stdin;
    public          root    false    237   ��      !          0    16703    notifications 
   TABLE DATA           x   COPY public.notifications (id, type, notifiable_type, notifiable_id, data, read_at, created_at, updated_at) FROM stdin;
    public          root    false    257   *�      �          0    16403    password_resets 
   TABLE DATA           C   COPY public.password_resets (email, token, created_at) FROM stdin;
    public          root    false    213   G�      	          0    16509    permissions 
   TABLE DATA           S   COPY public.permissions (id, name, guard_name, created_at, updated_at) FROM stdin;
    public          root    false    233   d�                0    16456    purchase_orders 
   TABLE DATA           �   COPY public.purchase_orders (id, po_no, spk_no, project_name, project_value, company_name, start_date, end_date, area, location, description, sow, status, created_at, updated_at, lat, long) FROM stdin;
    public          root    false    225   ��                0    16552    role_has_permissions 
   TABLE DATA           F   COPY public.role_has_permissions (permission_id, role_id) FROM stdin;
    public          root    false    238   ��                0    16520    roles 
   TABLE DATA           M   COPY public.roles (id, name, guard_name, created_at, updated_at) FROM stdin;
    public          root    false    235   ��                0    16474    sos 
   TABLE DATA           _   COPY public.sos (id, sos_no, branch_name, value, sos_date, created_at, updated_at) FROM stdin;
    public          root    false    229   j�      �          0    16431    spks 
   TABLE DATA           �   COPY public.spks (id, spk_no, project_name, project_value, company_name, start_date, end_date, area, location, description, sow, status, created_at, updated_at) FROM stdin;
    public          root    false    219   3�                0    16577    types 
   TABLE DATA           M   COPY public.types (id, name, user_input, created_at, updated_at) FROM stdin;
    public          root    false    242   #�      �          0    16422    uploads 
   TABLE DATA           |   COPY public.uploads (id, request_id, name, filename, path, "order", label, upload_date, created_at, updated_at) FROM stdin;
    public          root    false    217   ��                0    16620    user_details 
   TABLE DATA           �   COPY public.user_details (id, user_id, expired_date, nup, jabatan, kode_departemen, sign, photo, created_at, updated_at) FROM stdin;
    public          root    false    249   ��      �          0    16393    users 
   TABLE DATA           �   COPY public.users (id, name, contact, role_id, email, email_verified_at, password, status, remember_token, created_at, updated_at) FROM stdin;
    public          root    false    212   ��      B           0    0    activity_log_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.activity_log_id_seq', 1, false);
          public          root    false    260            C           0    0 	   ba_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.ba_id_seq', 1, false);
          public          root    false    222            D           0    0    boqs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.boqs_id_seq', 1, false);
          public          root    false    220            E           0    0    categories_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.categories_id_seq', 1, false);
          public          root    false    250            F           0    0    certifications_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.certifications_id_seq', 1, false);
          public          root    false    252            G           0    0    coi_activities_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.coi_activities_id_seq', 1, false);
          public          root    false    255            H           0    0    coi_templates_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.coi_templates_id_seq', 1, false);
          public          root    false    258            I           0    0    cois_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.cois_id_seq', 1, false);
          public          root    false    246            J           0    0    delivery_orders_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.delivery_orders_id_seq', 1, false);
          public          root    false    226            K           0    0    failed_jobs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);
          public          root    false    214            L           0    0    job_executors_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.job_executors_id_seq', 1, false);
          public          root    false    239            M           0    0    job_status_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.job_status_id_seq', 1, false);
          public          root    false    243            N           0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 40, true);
          public          root    false    209            O           0    0    permissions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.permissions_id_seq', 1, false);
          public          root    false    232            P           0    0    purchase_orders_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.purchase_orders_id_seq', 1, false);
          public          root    false    224            Q           0    0    roles_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.roles_id_seq', 1, false);
          public          root    false    234            R           0    0 
   sos_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.sos_id_seq', 1, false);
          public          root    false    228            S           0    0    spks_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.spks_id_seq', 1, false);
          public          root    false    218            T           0    0    types_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.types_id_seq', 1, false);
          public          root    false    241            U           0    0    uploads_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.uploads_id_seq', 1, false);
          public          root    false    216            V           0    0    user_details_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.user_details_id_seq', 1, false);
          public          root    false    248            W           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 8, true);
          public          root    false    211            O           2606    16728    activity_log activity_log_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.activity_log
    ADD CONSTRAINT activity_log_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.activity_log DROP CONSTRAINT activity_log_pkey;
       public            root    false    261                       2606    16454 
   ba ba_pkey 
   CONSTRAINT     H   ALTER TABLE ONLY public.ba
    ADD CONSTRAINT ba_pkey PRIMARY KEY (id);
 4   ALTER TABLE ONLY public.ba DROP CONSTRAINT ba_pkey;
       public            root    false    223                       2606    16447    boqs boqs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.boqs
    ADD CONSTRAINT boqs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.boqs DROP CONSTRAINT boqs_pkey;
       public            root    false    221            A           2606    16636    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            root    false    251            C           2606    16645 "   certifications certifications_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.certifications
    ADD CONSTRAINT certifications_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.certifications DROP CONSTRAINT certifications_pkey;
       public            root    false    253            G           2606    16675 "   coi_activities coi_activities_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.coi_activities
    ADD CONSTRAINT coi_activities_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.coi_activities DROP CONSTRAINT coi_activities_pkey;
       public            root    false    256            L           2606    16719     coi_templates coi_templates_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.coi_templates
    ADD CONSTRAINT coi_templates_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.coi_templates DROP CONSTRAINT coi_templates_pkey;
       public            root    false    259            =           2606    16618    cois cois_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.cois
    ADD CONSTRAINT cois_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cois DROP CONSTRAINT cois_pkey;
       public            root    false    247                       2606    16472 $   delivery_orders delivery_orders_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.delivery_orders
    ADD CONSTRAINT delivery_orders_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.delivery_orders DROP CONSTRAINT delivery_orders_pkey;
       public            root    false    227                       2606    16418    failed_jobs failed_jobs_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_pkey;
       public            root    false    215                       2606    16420 #   failed_jobs failed_jobs_uuid_unique 
   CONSTRAINT     ^   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);
 M   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_uuid_unique;
       public            root    false    215            4           2606    16575     job_executors job_executors_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.job_executors
    ADD CONSTRAINT job_executors_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.job_executors DROP CONSTRAINT job_executors_pkey;
       public            root    false    240            8           2606    16591    job_status job_status_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.job_status
    ADD CONSTRAINT job_status_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.job_status DROP CONSTRAINT job_status_pkey;
       public            root    false    244                       2606    16391    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public            root    false    210            ,           2606    16540 0   model_has_permissions model_has_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);
 Z   ALTER TABLE ONLY public.model_has_permissions DROP CONSTRAINT model_has_permissions_pkey;
       public            root    false    236    236    236            /           2606    16551 $   model_has_roles model_has_roles_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);
 N   ALTER TABLE ONLY public.model_has_roles DROP CONSTRAINT model_has_roles_pkey;
       public            root    false    237    237    237            J           2606    16710     notifications notifications_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_pkey;
       public            root    false    257            #           2606    16518 .   permissions permissions_name_guard_name_unique 
   CONSTRAINT     u   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_guard_name_unique UNIQUE (name, guard_name);
 X   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_name_guard_name_unique;
       public            root    false    233    233            %           2606    16516    permissions permissions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
       public            root    false    233                       2606    16463 $   purchase_orders purchase_orders_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.purchase_orders DROP CONSTRAINT purchase_orders_pkey;
       public            root    false    225            1           2606    16566 .   role_has_permissions role_has_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);
 X   ALTER TABLE ONLY public.role_has_permissions DROP CONSTRAINT role_has_permissions_pkey;
       public            root    false    238    238            '           2606    16529 "   roles roles_name_guard_name_unique 
   CONSTRAINT     i   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_guard_name_unique UNIQUE (name, guard_name);
 L   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_name_guard_name_unique;
       public            root    false    235    235            )           2606    16527    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            root    false    235            !           2606    16481    sos sos_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.sos
    ADD CONSTRAINT sos_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.sos DROP CONSTRAINT sos_pkey;
       public            root    false    229                       2606    16438    spks spks_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.spks
    ADD CONSTRAINT spks_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.spks DROP CONSTRAINT spks_pkey;
       public            root    false    219            6           2606    16584    types types_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.types DROP CONSTRAINT types_pkey;
       public            root    false    242                       2606    16429    uploads uploads_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.uploads
    ADD CONSTRAINT uploads_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.uploads DROP CONSTRAINT uploads_pkey;
       public            root    false    217            ?           2606    16627    user_details user_details_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.user_details
    ADD CONSTRAINT user_details_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.user_details DROP CONSTRAINT user_details_pkey;
       public            root    false    249            
           2606    16402    users users_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
       public            root    false    212                       2606    16400    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            root    false    212            M           1259    16731    activity_log_log_name_index    INDEX     X   CREATE INDEX activity_log_log_name_index ON public.activity_log USING btree (log_name);
 /   DROP INDEX public.activity_log_log_name_index;
       public            root    false    261                       1259    16750    boqs_id_index    INDEX     <   CREATE INDEX boqs_id_index ON public.boqs USING btree (id);
 !   DROP INDEX public.boqs_id_index;
       public            root    false    221            P           1259    16730    causer    INDEX     Q   CREATE INDEX causer ON public.activity_log USING btree (causer_type, causer_id);
    DROP INDEX public.causer;
       public            root    false    261    261            ;           1259    16752    cois_id_index    INDEX     <   CREATE INDEX cois_id_index ON public.cois USING btree (id);
 !   DROP INDEX public.cois_id_index;
       public            root    false    247            2           1259    16751    job_executors_id_index    INDEX     N   CREATE INDEX job_executors_id_index ON public.job_executors USING btree (id);
 *   DROP INDEX public.job_executors_id_index;
       public            root    false    240            D           1259    16755    map_boq_coi_boq_id_index    INDEX     R   CREATE INDEX map_boq_coi_boq_id_index ON public.map_boq_coi USING btree (boq_id);
 ,   DROP INDEX public.map_boq_coi_boq_id_index;
       public            root    false    254            E           1259    16756    map_boq_coi_coi_id_index    INDEX     R   CREATE INDEX map_boq_coi_coi_id_index ON public.map_boq_coi USING btree (coi_id);
 ,   DROP INDEX public.map_boq_coi_coi_id_index;
       public            root    false    254            9           1259    16753    map_boq_je_boq_id_index    INDEX     P   CREATE INDEX map_boq_je_boq_id_index ON public.map_boq_je USING btree (boq_id);
 +   DROP INDEX public.map_boq_je_boq_id_index;
       public            root    false    245            :           1259    16754    map_boq_je_je_id_index    INDEX     N   CREATE INDEX map_boq_je_je_id_index ON public.map_boq_je USING btree (je_id);
 *   DROP INDEX public.map_boq_je_je_id_index;
       public            root    false    245            *           1259    16533 /   model_has_permissions_model_id_model_type_index    INDEX     �   CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);
 C   DROP INDEX public.model_has_permissions_model_id_model_type_index;
       public            root    false    236    236            -           1259    16544 )   model_has_roles_model_id_model_type_index    INDEX     u   CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);
 =   DROP INDEX public.model_has_roles_model_id_model_type_index;
       public            root    false    237    237            H           1259    16708 1   notifications_notifiable_type_notifiable_id_index    INDEX     �   CREATE INDEX notifications_notifiable_type_notifiable_id_index ON public.notifications USING btree (notifiable_type, notifiable_id);
 E   DROP INDEX public.notifications_notifiable_type_notifiable_id_index;
       public            root    false    257    257                       1259    16408    password_resets_email_index    INDEX     X   CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);
 /   DROP INDEX public.password_resets_email_index;
       public            root    false    213                       1259    16749    purchase_orders_id_index    INDEX     R   CREATE INDEX purchase_orders_id_index ON public.purchase_orders USING btree (id);
 ,   DROP INDEX public.purchase_orders_id_index;
       public            root    false    225            Q           1259    16729    subject    INDEX     T   CREATE INDEX subject ON public.activity_log USING btree (subject_type, subject_id);
    DROP INDEX public.subject;
       public            root    false    261    261            ]           2606    16646 -   certifications certifications_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.certifications
    ADD CONSTRAINT certifications_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.certifications DROP CONSTRAINT certifications_user_id_foreign;
       public          root    false    212    253    3340            c           2606    16676 ,   coi_activities coi_activities_coi_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.coi_activities
    ADD CONSTRAINT coi_activities_coi_id_foreign FOREIGN KEY (coi_id) REFERENCES public.cois(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.coi_activities DROP CONSTRAINT coi_activities_coi_id_foreign;
       public          root    false    256    3389    247            d           2606    16681 -   coi_activities coi_activities_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.coi_activities
    ADD CONSTRAINT coi_activities_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.coi_activities DROP CONSTRAINT coi_activities_user_id_foreign;
       public          root    false    3340    256    212            Z           2606    16744 ,   job_executors job_executors_template_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.job_executors
    ADD CONSTRAINT job_executors_template_foreign FOREIGN KEY (template) REFERENCES public.coi_templates(id) ON DELETE SET NULL;
 V   ALTER TABLE ONLY public.job_executors DROP CONSTRAINT job_executors_template_foreign;
       public          root    false    240    259    3404            b           2606    16698 (   map_boq_coi map_boq_coi_approval_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.map_boq_coi
    ADD CONSTRAINT map_boq_coi_approval_foreign FOREIGN KEY (approval) REFERENCES public.users(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.map_boq_coi DROP CONSTRAINT map_boq_coi_approval_foreign;
       public          root    false    254    212    3340            ^           2606    16654 &   map_boq_coi map_boq_coi_boq_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.map_boq_coi
    ADD CONSTRAINT map_boq_coi_boq_id_foreign FOREIGN KEY (boq_id) REFERENCES public.boqs(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.map_boq_coi DROP CONSTRAINT map_boq_coi_boq_id_foreign;
       public          root    false    3352    254    221            _           2606    16659 &   map_boq_coi map_boq_coi_coi_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.map_boq_coi
    ADD CONSTRAINT map_boq_coi_coi_id_foreign FOREIGN KEY (coi_id) REFERENCES public.cois(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.map_boq_coi DROP CONSTRAINT map_boq_coi_coi_id_foreign;
       public          root    false    3389    247    254            `           2606    16688 *   map_boq_coi map_boq_coi_reviewer_1_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.map_boq_coi
    ADD CONSTRAINT map_boq_coi_reviewer_1_foreign FOREIGN KEY (reviewer_1) REFERENCES public.users(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.map_boq_coi DROP CONSTRAINT map_boq_coi_reviewer_1_foreign;
       public          root    false    212    254    3340            a           2606    16693 *   map_boq_coi map_boq_coi_reviewer_2_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.map_boq_coi
    ADD CONSTRAINT map_boq_coi_reviewer_2_foreign FOREIGN KEY (reviewer_2) REFERENCES public.users(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.map_boq_coi DROP CONSTRAINT map_boq_coi_reviewer_2_foreign;
       public          root    false    212    3340    254            R           2606    16485 &   map_boq_dos map_boq_dos_boq_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.map_boq_dos
    ADD CONSTRAINT map_boq_dos_boq_id_foreign FOREIGN KEY (boq_id) REFERENCES public.boqs(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.map_boq_dos DROP CONSTRAINT map_boq_dos_boq_id_foreign;
       public          root    false    221    230    3352            S           2606    16490 %   map_boq_dos map_boq_dos_do_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.map_boq_dos
    ADD CONSTRAINT map_boq_dos_do_id_foreign FOREIGN KEY (do_id) REFERENCES public.delivery_orders(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.map_boq_dos DROP CONSTRAINT map_boq_dos_do_id_foreign;
       public          root    false    227    3359    230            [           2606    16595 $   map_boq_je map_boq_je_boq_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.map_boq_je
    ADD CONSTRAINT map_boq_je_boq_id_foreign FOREIGN KEY (boq_id) REFERENCES public.boqs(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.map_boq_je DROP CONSTRAINT map_boq_je_boq_id_foreign;
       public          root    false    245    3352    221            \           2606    16600 #   map_boq_je map_boq_je_je_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.map_boq_je
    ADD CONSTRAINT map_boq_je_je_id_foreign FOREIGN KEY (je_id) REFERENCES public.job_executors(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.map_boq_je DROP CONSTRAINT map_boq_je_je_id_foreign;
       public          root    false    240    3380    245            T           2606    16498 &   map_boq_sos map_boq_sos_boq_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.map_boq_sos
    ADD CONSTRAINT map_boq_sos_boq_id_foreign FOREIGN KEY (boq_id) REFERENCES public.boqs(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.map_boq_sos DROP CONSTRAINT map_boq_sos_boq_id_foreign;
       public          root    false    231    3352    221            U           2606    16503 &   map_boq_sos map_boq_sos_sos_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.map_boq_sos
    ADD CONSTRAINT map_boq_sos_sos_id_foreign FOREIGN KEY (sos_id) REFERENCES public.sos(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.map_boq_sos DROP CONSTRAINT map_boq_sos_sos_id_foreign;
       public          root    false    231    229    3361            V           2606    16534 A   model_has_permissions model_has_permissions_permission_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;
 k   ALTER TABLE ONLY public.model_has_permissions DROP CONSTRAINT model_has_permissions_permission_id_foreign;
       public          root    false    3365    236    233            W           2606    16545 /   model_has_roles model_has_roles_role_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.model_has_roles DROP CONSTRAINT model_has_roles_role_id_foreign;
       public          root    false    3369    235    237            X           2606    16555 ?   role_has_permissions role_has_permissions_permission_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.role_has_permissions DROP CONSTRAINT role_has_permissions_permission_id_foreign;
       public          root    false    233    3365    238            Y           2606    16560 9   role_has_permissions role_has_permissions_role_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.role_has_permissions DROP CONSTRAINT role_has_permissions_role_id_foreign;
       public          root    false    235    3369    238            %   �  x��R�n�0���8d��")Q[�d(���,� �UbS&�HPT�"��ɎQɞ�����=�ت�B�F�lBg�j�Dӭ>x�47�3��4g�I��%o�#�L �`�Mь�z&��G*�W^2M.��Oh�܃i�n��A�	�~��0ڤ��I.���O�U]�&7S� ����?�8Wr�J!��k�����lZo��Fc��a������=��Dq7�;{PNS�S&�1C��yJYJg����w-D�y���'3ZD;3���bztO�q§"׿����G|����yJ�r��E�qӌ�J_rZJUJ�-��iԤ*�R0�\r���Ǯ�{�-�BqEu�d�����%q}�?�w��J�f����fZ�Bj���*I2�i�%ƥx^��a��69�oa�&[�� ){      �      x������ � �      �      x����r%7v���"�I���׊jE���jJ�NٔǗ�[��V��`���G�{̼��d�r���q�z<�6-}� 3����:Q'�������>[|}Z>��'�)�������T��u�M^輨��yYV/u���?�A�蓳��X�/���ߗ���m��x�}Udw&jR@˽��x����������P'�T�v��s�׶�X�m0�Db��_��|��9[������o�����s�V�1{���]����c�Do���1�]׼���a�����cj�ۮ=yUzGY���M<�\C0�� �d��|�������6����k�>��݇��U�N�j�9Ԟ��Eױ��E7�t]��e,]��U,]��u,ݸ�M,�t��Xz�w����"�6k�[�ӭ*�PN��XG�_U���Ӱ*��7�c�U��>it�@�i$�D+.uI��oU��Qu�h 5�
��zI��D^�����+P*H��%�V{����+PBj��_tu�����rqT�*����
\���_&�q;xe#����������r�)���}�m><o���==<f:�_e�k���qy��O��L���|c��{Yv/�
�mX��'����/O���r{�������z��v�V7_���|�����qyҮ?E����^��e����������'�(*�]&��U�^��7)�mJxJ;�EJ�J	��Ʉ[�d�S:�N��:�C��S:�Ii�f0���ٯ�i�Z�����W�o��L}7
��
���LU�E�@����
�<�

T��SCvMa7���.LZ�@:��i���l��~�;h��B���о���n'M�b�3�,�1�H��l#�B��Ģ�[Gb�wo�O�a;��B]qX%ň�Z
��a�(��⌁�oށ�_v���kG��_�OB��5�?XH�c���?y��)$^y�;	����S�܁I@�ā!���.�%2����K��r���ϸ����<���CBe�)AB42�)��L�RP��E��R��g�~��%g ���/�T�x���緋��~����|�!��6f	&�~���$�x��Q-�����[(/xx���`�_���|M���-��O4^�����^�Lѹ��|��[��j�����_�����ߦ�?	K #��h�=0�xT �#��K� ątI���:�sq�WpM�8��kʯ<�����A&�^����D����<r�5��/�}����-~��_� _�f	���JFe����K�h��W2���~�Ր��O]̵F�X�n/h󟲷W��^�c�����D���{"uV�Z��8���1Ej>��aE=�LW����k=�T�r8��6�F��_Q~��3~%�K
�v��	�F⫖r�[�q}:�_���p	�P-:X՜�#�=�qF ���@t�2��.����/�xw�^��:��˝q��Ȯnr���M�Q#��5WH~ak�\?��#�?	1G$�c�OE�����Ia�~�� aVX��x*��q��dZaF�̋�
{8�t0�h��4�88��S���/������5�%�5敔W�+(��cW��J�P;q��|�:y�@]cu�B��^5��`Lae�ȟQE��'�:4\O��>hX��U��:�'��.;����Wl�����:���4�uxwGh���k�@3�Z�y��\��a^7q6R_h*�\PUę d�����:�L��:J��|��8h�7�CEX��(q1����#.z� ov����u<�g��G��'�CM�8��+#��x�4�r"^8]�S$KUw�:v�3N�2���j�2�����2�Х�)pգ����@��T�T��W[>����y��z�9�|Z>�>ܟ��Y����*�z�Ӫ��/�����g�N��bֿ,����9y��O]���V��tή>�w��3;"�s����X��e�^�м.�����s�2���Ʉ��
v����*��iT�Ҩ�K$Q�7�9�I��S̈�˪~ij���҉���i�Z�� ��H�CD:H"�Avz�gm�H
�*��|��$+��@��$+8=LQp���0x�⦟(o����:r^�򙼖�븼qm��)2O�y��+ɼ��#�Ð�a��0d�d�d�����A }�{5K��� ��Wٯ���V0�q�>��V��c֎�;���p�1^9����֊m0���b8��F���h�<�͟�~����o4�����s�Ѽy�����s���y��?�쏚쏺:�1�D�C�yn��������k�����s;ğ�v�?���U�5���CY����6�����]_�6�JMS���nU��q���\�O�X�y�[�u�?ܹ���;u�p��_,�w��_�w��_���OQp~�Q|7��|7�:ߍ|ߍ|ߍ|ߍ|�ן��d����<��ԟ�^����R_�)�R�{A��s/H�y��?��Sp�a
�?L���)��0���E��"�C�����Pd(\������B���.c���bΓx3�|Q��`o�1_4���U��`:jCΣ)�T�=4����׻?�K_��p��̓��o$x�� ��7�l�X88����s<88����C<xJ���5)jR:Ԥth�ҡeJ��)Z�th�ҡeJ��)Z�th�ҡe'-���QU$#㮰�NFvH�����<�Ԝ1�:5_fpQks57'pk�ޜ�E�\�E�EM�\܋�ڷ���m�FT��\ɲ�&:79x�M� �s�ӟ��J	�979x�M� ����s��x�M� �3�#��!��!��%��%��%��%��%��%��%��%��%��%�c�Tz��{�{�i᭴��cK�'b�C��EԪf��`	P��)�rĆNt�Ml�Y��;����x"�s��*� �̟
��%jJ���|�p�;a �S��T�v>���K���e���򻟲�3���,����y�mN�j�
�o��jxWq�9=����x_q��6p�15�.�������F����q��^���C�L�P��E�w�o�D�
B��QA3P�����(E�G��� �;*��P�pT�)
B��Q��(�G��� s��� �4|�W�;F@�� �����E���c�%P��FBs$O��#!�z�(9���{zH���GB��t/8���{���=,���(=f�@�6ʑ�(Pޥ(Qf�@y��l���]�Rf6
�w)ʛ�(Pޥ(yf��wZ!�(�(~@i4�P.�*�|PQgG)5;���|�)k�JZ��,�yܭ#"�ZQ&��(gy/�������e��S���-��F y�A���[t�Ay����+W�K����\)�ɨ��x����'�]|$=�R{��Ni1��)3��[t�zg�#��RgQ��Wj(JZ�J}DI�^�{(i�+�%�x�N���.��]dqv-Pk��Bu�jp�FPO��8�k��������u\T�q�&�;�q��[��3`��8�1(�I�y{1,�ShLb�%�ߦ��;εq��;玖3���r��;:�E'��Ŝ�H��E�I���C:������o?�d�n�&����9ص4BʱG�FH	���V�JR�����J-�ۤ$|'�z�yy����`K��)�e�H(�z
s����N� �F�(y� �y� �XUQ ���1&��~^��?���YU���P����*�p��mt�u#ZG����1�6+��FIjc�-��Ӎ��x4:Q7����FµF���.B4�[�;�h�N�-�݃h4:`�w����b�5�Fnޠ�h�Ʊr,�Q���n�Ǣ���Ʊh�Ʊ�q,�q�b����*���J,�g+���Z`w���!��.�"�+��	����s.N�z\�����qD&��ߺ�:��k=��&�?��m7����y�_��͠��fسK
V#�|��kf���זs�?q��ť`�q
�L��.�������Evvv1����v�ro`Y��=z��r}��P�?mM|����G;C+>�
    ����������hhŧ�~.��h[ݟ���+>������G���|���3~?Lܚ���Ü������������|�������x��=����.`�?^0o�)�xٻ(������yB�x��5�A.�?^p�f�����x���=o-��ԡ*���
��� O*(��<�tL`��wV  � ��(����+���G�/���-	8.�=�����Ҏy-^��?��A{��TVh�P��t�t����D�Z5C�W�.>�e�y��M�����������yv��]>|Z>&�l,�ӿ?}M����������]2��)��%M��1+��+���+���+ �Ʊ+��Ƒ+���q�b���(O�ŅLc���i$uL��w'_�Wʧ\U�*(��y
+���
%O��
O��
5O��
O��
-O��
����S��?��M��Cu:�3l�pu��*�s~��rX����:o�U�����>?%��*x����j߽͇�醀ޏ]�V$'�Y͙Vz�?��3M<��3�xf;gV�L+]��f�b�l�j�l�z�������g�G��
_�k1$xG����Δd!i�x��EH���c�JY���̚��#���G�(BR$w�EH
��F�)BRlw74M������(BR�w��EH�j�ę����Z�`٭I�<"qfp�g��0!)ܤ����u���r1�בBN�y��_L����O
L)�Ӏ���qѰ�������P�(�Ih*Z� �F��$��?�Њ(�����q�jP��}CD�����/Q��CMcH�n�_S짪V:BL&@�@�)��mډ������vy��aM!"e���'!)���?Y�IY�m��BP�:n�O�R�i������q\�
x�[8^��1�VhO�K򗨅p�L
��Ub4)@BX�� 	!b%Ɠ$���P
�bVbD)@BZ��&��Fb�`)!z�%��a���I
�~��fK5����6]
�Î7]J�|9)d��P�p����~Y����~�H�w�o�Z�M<��Z��x>~���U<���^r{�Ƕ������?�@�����#SΰK��|x�w	P��Q9/J�*g�%@I�l7yL�n���c��[9�/�J��u0��$�r�_��Ô��K��<G80J���1�s�3`�$����2, �����! ��^C�q"�k,������D`����j��L� v�(��hrUqF z[U���Vg��U����3�ɔ��)D'�"�p�,�;k�
P�q�^a��E���
Z�,��4p�l�8#i GO�6d�k�ףFKr�J�5
��Q�&	��`��u�`��Z�t�`�ܤQ��˺W��B��=
��r*�_��U�Ԇ��w���Ӆ������U��f�b��Ng�O��nB��^�F�(���r�.#FT0Er��fyе���o4�M
F �$��V�wS������g_/??��,R(ڇ�/���N�P�L
��2)$��2	K;_������?��<2]&�|d�L ��t� ��.3O=	 �2�ԓ ��.3?m@�e�x2:Ƚ��d�pv�SWIu���B��y�V Y��=O�
 E��"���x�)k*�)Bʚ�w�����R!ˢ�w�Ñ{x���hx��8���X#3N�x?�ȏ<ޒ5�d�E~$`�T��_���,����k\\�V~z���{�N:���	��E��M&]��P:A%�SÓr̊r#��2�i�[G�5��:B�i���N[���zڱup�i��$��	@)���y��:Bک!�B�){>h��S�|���@����=�x>P�����b�-�4{>h�|���A��͞Z<h�:�A>,֮>���W���?��_
vV}�|[��U�ݙ���Vu%�L�R��T`����v����8�D�ޖ��v���(��v���4"�0�8s� ���4�Y�;RF8`��5����,��"`�&{��U -c��m��)G<Z��h�Jċ/=��k���������n�������j��'�k��$q�Z��KM
�4)\�Фp�:��=r��>��͟����׳?��e�?��e�?��e�?��e�?��e�?��e�?��e�?��e�?��<o0*��������������)����,�h�3ˊ��Ѷ'���;��J�6q��
oo�G����#�!��[_� ��|��k�/B���"��F����P@��
����u��m��>S�G�uF����!�o(xt4gė<:�s9��
�@����N�Mm��V�3��F�ꋸ�A�x��s/@Dp��FC�X��W��%x|<��h�Q�3�u�wӇ4�I��֎C;_�qh�{ڥ�R��N�#��F(87�(
Ν&��sˉ�`�m���
`Zm�歠�Vۦy+� �նi�
*���t��g�<��` ��k ���� �pnm~�"�,�[��� ���-�¹��)� 2:33��
��}�����Y3�C��{�����ӿ�^��o�JXH`+���h���<(e*��o�o�����EȇK$H��b�� 	�
sG������z@z3���V�F&~1��}�l�Z/� �1;�X��� �Xv��e�P]� >n(��їW _,�Vs�ڱ����#��Qٻ �X�U���o���6��+��[�����#�w�;���>^��Fd�:�N�p*��#�z8�L��ܹ�Wp'Q<wn<wn<wn<wn<��
�Q� 1uo]�k[�+P�`��h��;�y�A��Y���=��5�|>�q����$?�<>|�I�v�Q ��]� �F�#w���޸��?]�� ���j8�m��%*����6�_B(� �H��/��SF�R.��3�0�?��3�0�?��3�0�?��3�xf3g���v�l�ݜ�F3g��\a��Ce�e����|>�����_��s�~���r{>J=��_�=�a��q���0}���� v���\[�_ &MCМ��Ҋ6
���r���uHE��^O1C��y�{=�b`S�l�Ŕq�����t�dC�����g�>����w���s�PN�F�r�PN�t�����T�H>�\$��5�"ɆnHc�
�
�1���l��ĸѲ�[�E���-�"�o�s��Ny٘�J�HB��I�r�Pg��"u��$z��P�|�B������`����"$���/=�����"$�~1�(����bw��2#�+A�_�7Q�_�7Q�_�7Q�_�7Q�_�������!=�Cz�
����|���P�<�BrO��yd��F=��
�=���
�=-^©����P��E͟��y�~Y>�<jj;��n6D��cʳ8�1tM�]�u8��,����d!�l�'d�p�?Y ��/��v9�(d�.�j@�� 0��O7B�X����B�X%�s�S^���M��]e�%��`)�XC�@J8�P%��9�	���M)��G�@JH�H	������/�7�(S�r�e�?����U�p���xkHp���x3H�Lx�՟YΙVv�?�:�ke��3�øVv�?�u��v{Lƃ?���x�Wh+|*전��Be���|�א�W̆��%�/"W�д�%V�58��a�],�ލ�],�ލ�],��MI�\�d�U�ZiT�qH5�V�q�N�x�T��Q�_Cv�T�_C.l�P���[
_6xG��>��~(��-$��:�����r����+���+���+���+��c�6)��&w�ه����n�)|w��p��q,@����?�>$�w.+@�ڶO�)l�[���da�ڶ�'[�ֶ�?Y���������m�OF=}ж�7yVK(�=��z ��Z�Xga���ÿRvʱ]�/%�b�R�.�I %�b�	��#�|)�($[J�.�����\�o��h��v�G����]�n8p���/9pk;��"�gZ����?��ζ����VmIk�ܟ��FT����}�П���+��    ��W�1���X��O߸�k�,ܛ�j�{wW͹#��}w՜��j����
����
��a�
�Kx������"�sx#rU��l�"�0خ:l�/��F��Q�9���怫�iqY��\.����I�}g$�,\�����r�o/>�/�r�U������J����Ba�˅����H��F�Q.*�+¹\���˅������W��\.��U��\���F��?�Dq.���Jq.�c5�7��%�C9�7r�%�:be��5�=r�kM�>=#{������xk���6��xk���v��xk�Taz���>�p���!����%��brMw	![\���/!d��5��%�,q�����Ww�t�������ֽ�T���uOz��}�x���Ӌ��@�${��O����6�޻�tZ����������������.b]ЉjFTuI����M���Bv��/�! �����JB^�en��#!��M��$�L�	!夗��^�e��BIIe��B5��Hd�����V'�j���Pd��E��9\�W��_��9E��G���uC��"���$���T*�r�Ph[aL�օʾQ��g/�S�0�VL�g+5��Z�앚��RӜ��oնcӜ������gl`Bت��Cb8Cs�J��F� ��VCs4��0iT�60?l5(��کmB�?]d���~FA�Bh�6��N�v*ͺ8�8�T�u�;q��m��R�8�|2�X?��;�5��bx}���2��Rc�Qc�	���3��ۇ�)�W";O!OL`vĦ���ҹ�ۊ:B]்�R(˳�5W��g�
��5�Z�e�68D�G�����p��E��Q���ˡQ���ʳ�j��f�����o�߼�~��~����(�0����O^�ξ�s���P��3��x~��b�����������~+�>�W�U=�v�%���!�a�[3@����PI��y%�R�+������
l��zLg%�w�����N����ժ��\�X���n�9V�\Jj�t�P�J+!��i\w���j|��Z��ZKQ�S�~�VR�)] �Ű�!������O��=�o���6S��8�������B�p�S�¡(���?�CQP��������"]��>U�+�}j`�Y�8o%���ZJ:^I���������΃�������qh��8��lB�y(!��=�vɏB��j�qh�}�B;�iġӹ�L��2��tn,ӹ�L��2�Q!;:�Q�::�Q�::�QA:�7���f���iT܎u)�Y��#�Q;:��Q6!���u9Ϫ4������� �P�/�\JN��W&}�2�(]��oP�>���ю�������:h�*�ڣJ��}��c6��t��[d V(�F ��[`V�"�hf�.��YZ1@���D��gI� ϒ
��<��+�Ơd�B���Y.5@��\j�BrO�^�d��F�?�
�=��}R��\�R{��6�PH�i���3@!���o�� �Ԟ6��>�{ڷ�g�BrO�6�PH�i�F�
�=�[�-@!��Q97�BrO�Bnd��F%��
�=�����{�m#+$�4*�FVH�iT�����ӨHY!����L��v�6Q�{ڝ�DQH�iw����p��c�S��.�����~_>��n@X~��b?W�!
&�B�\�J�0V۫t���ݪ��"�SV���w���9�/#�mZ|�M�����]J1?iۢ-꺞�,��|t�(��	�Ӎ$ �����!�����!{Lu� ,��C���?�����?�4.�Ӹ�N�:���4.�Ӹ�N�:���4.kҸ�I�&�˚4.kҸ�I�&�ˤ��VOKbSg��"]=58p�Ӑtp>�V���8/p�ӑtp~�F�_�rtp��VG�t�|���&���C��7:%IG���T$��AI���AI�Z�@��J4���D���֩���%\��� �S�q�m���)#wK.�ɸM<������煶�C=��v��j�N�a?����,��4ɵ�6L� �����
�*��T"�B��R�݌Wu�\���{`����� d�G��0���J �!p����D\���
<1������81��d��J41����/������o:��t"��D~Ӊ���M'�N�7�w����Mݖe�l�b5h���L�.@�^$�׳Zo��T�#S?�L�<2���t�"S�#��GF?��y������������*<TU[m�h����}��{���_�c�DԱ��u�:���� Դm��DԷm�0DԸm�(��s۠Q5P붡u2s�wۤ�Y�l��רy�@���q05���5����|��<`�k"_���th'�I>�	f�&��#4�35`2Ԣ���J��Q:ԢwE4%D-r��?�D-r�s�?%E-�*,tA�KQ�V]��wɔ��As�p	\�4��=�����B�����P���<�����q��wÜ02�^��mbk��	�y��y�ٟ�:����W��͸j� �:�W�4�!h�����n@�u<M�5\�{���"�{���D4O�-���/�9�� '	�uP���Uţ�E�<b�OF�aUOF1�aYOFQ�a]O�yR�{l�X&�����������]�NU�����nuj������V��蠍�aɷ�i):b���v^���"�o��+:q�O��E�=O�(x�>�W����YQ"@ld�<+J(xV�P�(��YQ"@���D�BrO�V~�W�����Ӿ���{ڷ�S�BrO�V~
PH�i��O
�=�[�)@!��}+?($��o� ����������#��c���c�c��`�9R�=�H} ��#��c��`�9R�=�H} ����4.+���=-r���wZ5�f'w�y& �O����@<��������C{�"��;Y|'���g7���_fW7�/ǽ��Y��@�ݙ^���S6��3�X��Z$�O(uP��D����+UE�Ҭ�6P:l�m�����Ȟ��8���\�(ϫu����#\3� �;���#�d�A�v�W8ڎ����OK��#��4 8;�OK��#��4�C5�Քk.8TS���PM��C�5�k.8�0�y+8�0�y+8�d\�Vphɸ��Вr����k.8��\s���m(�\phC��C[�5G�N����v���F8�v�a��������짇���f��U��0�ҡ�i*h3i1��OO����L��P�g�h��4�ϣ�hciD��F�-���E��,���IƇ�����.�q��|Գ�zX�F��Cm%���3�;?^痿�����������@d)|4`x��R�����ӥ�Q��C�-��>���q#��l$�
�ر�X2jo�-��ia����eC>?�@.�����:y��8k�@����^?!V6@,��
���
`yLV kd���%+��Y���%+�/[���%+$��N�i���&��MrO��6�=m�{�$��I�i���&����.�{�L��2����.�{�L��2����.�{�J��*���䞮�{�J��*���䞮�{�J��*���䞮�{�N�i�^EVH�i�hEVH�i�rEVH�i�|�U@Xd��F�Xd��FYYd��F�Yd��F�Zd��F9[d��K��I��i���.��]
O�8�v)p<�R�xڥ��Cey����=�[J ��n)ܣ��p���=�[J ��n)ܣ��p��N�����D�4~k�4~k�4~k`����oM��oM��o�q�����v\�� n"��}/���o�u��&��q�����v\�� n"��}/���oګ��]��W�`�6B�*^]��U���x�
V�j!���A(T�x�V��"��,�7��}�F�a*eQ�C/>^��Y�pϨ
�m³L,~=
�U�eb��P��,�_�`|"�� �n	�x�!�,{�&^�;����l8��Lgڡe�Mi���苯1^��V5�	oHx    �΄/Ix��̈́�8�1�k^a|C�[G���	(x���~̿x�s_a��~=v-��c�*�k��U��Z�\��w?e�t��e(ԖqO�i��a�l+�EIrBm�x��gӽ ݑ���V�tWj���5{{9���HX��J��Q[��J���WͪA!A�r�V�܈�Ffy�x���mUA�e�=�X��U!���f�=�o��^D�g�(����Xw���?N�e[��"����EjI��WchI���r�x��X#@Xw�2wN[~&�[��,��Z��-����7Y`ˑ,��D�r <�ݹ��6|����u,�lTYwfHC2ه�Pt��e�FW�h�
��:�����>{��mJ���_
$F���Ϯ�jM,���9�ɀɍ���Inex�ɒ�Ș���F�&72%o4 wr+�H���T�Ѵ�	�2�Ѵ�k�y�q�5o4�Y���54�Ѹf��7�,��F�:�hP�j�IVV�n�;���5�~���i(�Kt�B���}D��c<�Ct('��@Q𫱪8O�������ԃFK�@!�A�#j�E����7�*�m�W��e{�z�g�lD0<�mI��ǜ��lS<h���SL�Xxt)�+�c�!�x,<���e��i\�n�cӸ�֊Ǧq.��M�2\.+��e�0V<6��p	,�kc,p�o��/p����/p���/����u
�ĵ��[{VR
d4Xʀ�K	��`)�1<8�������������o.��5{e��։�M"n��ۥ�)R)�*W'�D�2���H���Â�X|V0��
Fc�I�Xl�
Fc�9�h,>��ŧr���Pn4V�e0��Ov���mv��Qg"u#!�Q�uw�����Eܽ�I"��$+��u>�kY�˶1�����ut9�Fp�v2����ۙ�S&�n�N	���;�=O�6����;�;P蝝�;��It;�w��&���1�ȁ[N��U�>n9���~�����?]d�5Y���PhmA�xhcA�XhWs���PeA�x��Cu5T�CKJ���s�M<t�蚥n�.�*4��/��]Vo�lh�*�������2�tt�3����
��x�$��Nt�<i@�_!O����������O���]��f�kF��>��X��_����O��p�gxd���M�+�I��F���%	���w7��]>=<�[�(t��zmI����<��u�X�cb��8��D���5�_�~����_b�Ք��P�
g�ZV�g�K�3
�[�i�<�B}+>h���GY0��3��y�@�~�����.B�������b�k%�JP	��bx���Y�(�q5ͷ����(���Fa���//��H��������f�E/�~ʭ�XhYX�.��P5���j:���:�������Vt�� �͙���O��3�o��/ g�� !Thl:I��~| @�֘�Q�:���J���(ׯ(R�U*0X������U����5X,��$t�X�J��Q�E�a`U�#�
�(��xO�0�V�N�D�;��h�P�O�]	#j�'A�kׄQ�vM�k7�Q�v;��(��}�cZ��1���a���9�v��0oԎyCO[�Q��1i�h[�1cM�wLZ���B�:��(��1K0^͍�Ŋ�|�-\t�K�|�!��������a��Po4�a��m4����J�o�*�)j��5a���0
��5�Yu�Y^ǭ�u�^��|ݿ���p'Yy��_�Nr򀏟�:��>�U�I&��+�N2���r:ɼ>~��I���st'��zx��%�x­u�6z�X��;g�x�k����x��h_�|ǻw�cf���^���%�?�ǻw����z	�q�.����X��
�0�yr,���P�5㫩���
�ϫr�z��H����\��� �06���Wp��	x׫�p}\�f�C�z5�OGZm��TYh1�����.^���tg��=�?�()�r��
���T�ޣ~|�)�f�[9�v�zIz�}(嗚bJ�UF�_�����_�z�P.���C�q�L�ܨ�K��:7E����k�zA 7�����'����ɝp��hvY ����$���W��"|� �O��x۔��~����&\
�\�F?���G;��V�&`��L��'��E�C	X�N!`��X�7���E^#`Ӹ�N�Z�"����'�ddK!��N�C�s��CX�z�)�I�z&\����+��upi��QB�ip���W���%K�:�44�44�0s��R5u*p#��R��k�nS��f���91���/ �{��=� ��X�+(� � �"6V�s� 
Dl#@a���u @ E!���8�F�J�
@��� aN'�*�V��=[��!�����u ല�s ലpZ�:�  Y��:'LE0�g�'�z��	?���#�6�&���
&�l��� �����C�;lX�;���L� �þ��r�ob}�r��w���� ����X���x+��C������70������I|���t� �d���?�5�p�]/_��?�7 ��J ��нL���Fa� �^.��۟Q�����	^��Y*X5���翶�`���6�^�·7~�R�{�:oO/�P�{�:g��������� ������ ������M>ѣ�c�μ�dUEBU
�N5)�8�:+���Q�x.��sq�5����\i���4g4�sqJC<�4�s��1������D~�KE.�+�*����Q�s�F�͡Tk4�2��:���Wy���Xwה`��[J0V�S�Zc��^A��\�"?�ZLo����X^�p�Q���ݛ|<��P@uv/� �f�`
˯ZvH�R��DI�@�vG��&6Z&��&���M��%Z��/�$:��2$zS�%�j�dJ�*���;�����?<�}~����Ҥ�o��hR��R�4)��������Q��u�� `x�����>�ҍxp�m��>���sypg���QvS�l}�vv��d;^G�����؝�9}$�١>��lS�F�K�'�bw�k��-�}~.��6�V��� :�nZ��G��hӉGG[O+zOG�+zK���]��x:�ݻ�~�u���.���1�
�D�
 ����|~�1 �ZK��83��G�%�_́����}<�0��>���x����V��Ib�&�_�$���h־��-
\�R"���,���������竬��7{��q�=���cѹ��|��k�zX���^�+�k�f?MA�MKT�������8c6*K�s�l�����p�g07]
�|���2���\4з[&E�T}b��:͞��ie�R�+�S�t��j����!��*��sbpCX�XMUx�z�����k��U�j�*��:n�O�M���-��x{:Y-���Yܤ��6���{K�qxyxs)~xw)��^���@�D�By�}?�?�	?�?�?��x��71�g����ɼi���?�O�i��Y>�t�Ş/?sH�]=܇(��I��`S�ug6T|����:%�I	oS»��H	W������'�Z?��y&����v3G簱9:�=��A݉�]��2*��PwI�M������u2�IF.�,���w���E��?��n�FY��ʖi_)��o��1ޗ1�2��K���� �<���˹���Ȓ��/���ϗWo>fV'u�tO��z ������Uvy��2|ݗ��7?���[� ]��q�[bх������˻W��� tj`8�թ):��Unvt����0�vt:�N��F�VG<jvtEG!m�4E�p I��Fڱ�.)B��!M�:aN��L
��[5eV�Ь�����/O�=+T�]6�mߨR��C�q?v5
m"W�B�����%�|��PK��fG��	�D�*��0Mt;B�"���!;`#�)B�4�w�E�����0����8���oI�������S����쇛����b Z�E�� �  H�u:��|a�7�g�8�ͮ������s�O#�eU[�u��<��_�N�2�ύﲋ��I�	��Z���JK�j��uh�> ��i5�єRڨ�J(�zR��J��;��J�VI3�`�Ai\�]���҂�U`{�A�_���Q]ѝ�;���h�)g���ʝ�W�-s�K6<p]gjS~g�<���B�FY���W�S�T��D�*��!~�;��cS�Xq.0�C/*�B��J��בg��A�c�Xy�+�HD���yx�U�ք�/N ��8���zx����h�VQ�h��e�z]7E��ڈ�_�x��iv^���aJ��<���E�_8��Vw�ĹZ�qM`��W�bXR����5G@4�^?euGx�����h�j���~ɮ*��M��g�[_�6�z�����=0>ȵ���͹ʻ�hG��A�C}[�a5���Rfl+-��[�Ճ����5T� ίVLV9�C>}v����It�u(��/���Gd-z(��/*�vFjvG�v�E�xC�-w��a��_o,�;#-wG�"��e��l}��)]B��ܵ/U�RU�o�h�bf���R�[�ޗp�����|�����§�n�ĿϪb]�i~��}���x���M��q��hd�s�F+k�fi�{d+	u�m����]�3���44oZ����H�7�R��������c���7��y���zد�˼��p1��ؠ�9j���%�f#y g��鐋�ѱ����	t�) /�NY�)�'�R^����4��>��Y��6���פ�i��פah�zפQ�4PѾI��i��]+������MM��4Z��P���dg4���'k�CPד��"��	_�+y�����>���z{�[�}���"�����/���r�F��'h�z&�V�PDP]��oBAi����/�}�ߴ�"�V�0G���d'��ǿ.?�%��Y����
8��O`�Va�ů��A��T�:�InS�AA
C��A!A��A8��p��9��[s�o� `B�0$_U+a����%�o+��Q�
X:�4) l�E.��J�ꥻ
B�Y!�~vV>�;�D�+gu�p��MY9��Ā��Hb���W�r^��yU*�U��W�r^��yu*�ԩR�2H�� u*�ԩR�2H�4��u0�q$�|5ŀ�΋;�v:/�t^��p㬅��O�H�t�H�n�\ V*���5 X��I��LmY�(4A��h��,�8�i\6��K®��!�Ǐ�Gd<�
 ��GF?��y��*��ł��`��kX�Sw��zVg���ç�c/s�i��*�Ň���/���=>|��u���ɿ������D���P���_�r�
��y?�����_It�u���5�=��/��ړ��e��IF!s���a���;:L,�?���az*�{;:,�ʗ{;:,҈"Ŏ˴�e�-vtX�����rD�u���A�w�"D�u��-BtX��:�E�&�Щ��o��:5��-BtX��:�E�렎E�uXȷ�A���B�E�),�[�谐0'�!:,�'�"D��Ь[��*�#����-BtX��E�	ӄo��B�4�[��P+L�E��i»�a!a��-BtX��бE������"D�_E���/EV+ϣ
JZk3|�i�Ҭ2��a�������o�i?��˧��o�����w�__�����<H�         �   x�u�;
�0�zt
] ��$�.��n� �b[iE��#�l��������4k��uEV��,^#�-붬0�E	k:�6L,���R��l� Vv�L�R2��ȸ����Ӱ�����ۯ��=ŭ
�����h	ɥ�e�j!&#�ڳ�sJ�����x���+�*�K�r�L)5��5`�            x������ � �          :   x�3�4�4�t.JM,IU�K-Wp���4202�50�50Q04�2��2���"�=... AE      #   �  x��Y�N�F����T)�(f���t�R)�hIR䪩�c{�lϸ3c�VU���7��;c�5h�E*�,-�؞=�;���N�NTM�D���n�j��%^�������FN�'��PY#�Krj�
�?��h��g'�:i�sK��#[�3W�-�G"�J���#br2�eE,l>���̔C8g����9�o�P��MV��ZfJ��s�T )��%�Vi�,ũ���TE�;�+^�s�-�����Ys*�+������0��֙ ��r��+-	?��h'���)�9g0ŋcYQU7���Q�����gg��O�CcF.țN_L��7�{_EGo����׃�G�f�ǈ��B���粀w��m*c?��5��#^Ւ��8y䯍�+�o��Ax�r�R%�d�M���NL�4��n�|@�%d�.G@p,�,�
�:o`�e{���XdC��П�B�-2��2	i��G�_ȕ�IoH�52�|�Z��΀	(`(\�3�ǘ�%L�o){X�C@I�_S$s�����R�{���W<�jK�<G
��H��j�
�#��*���/m}7�\��)K���끻�?����-�l�R����bDe�]	>�j��]ה���M��&m�f�v��R�N"��,k�`^��D|��=��e��������2
��՝S�?g��ش�ӊ=eu��S�`yr��J�S�ޡ&�޶A��1��IB�CCy�m�+�J=��ې�g����jkOSt�%QȝOT�ao�"�U��R�DM��B'c��`Uy�Uw���Jϕ��n�ź�6b�[��.<��B���W��7Ǎ��9���ǁkч���0f�䞬=6���U�D��*U�4����09)�}:4��%���4扩j�o4��\J��c�>����T��g��A�1�L����n#
Y�T*���*�=tA�<*�����e�"�����yT��%N;EpWw�1�E�}�����u@������a+ԐKU��;X
�9���tG�Ё��O����fBg!��P��Ƌ����F;�Hv14t����[�E�`�5��ؿ��������=�vQ�++���z׬B5�T�/yu�V:p�X�"�7_i���7T>�W�
ׇx�,Q+{���)���5Up#�B	;�F���� ���{�VH�$1�9,a�|d��'8��* �$����'�*99?O�!�&;br����,�=�G2<j��[�u��[|�3��v�d� #)�HAF
2R����d� #����S���+2�|`����Fz$#!	�HFB�	��LWL!|��?�a`}&1���0�5���c���#8}<B2��Tn#	�-�2�����}���|��_E�)��9��7���f�ᷚ�o4v����O�p�         �   x�u���0���)��b�� �����M��i����F»[�Mn�|��_.!Q,H~���P�&9�������a,�p��w�ZY4S}�{��A�1�_1�Z�
�����0ү��_|�`�]�1^���𪰴u��^��ցZ��X<[#k}�:;��Y$2�fq���|M)}x�P�         �  x��WMo[7<k���A�.����@ $��|�%-|�@���._T�zZ2�!������]�~=|z���t�=��������xH�jsz�o�����������u���h���_���G�aڡn17�M1� 9E|_�a
s����eE���kK��F�)�|#��sa�W��G�-RnD�tr��Z�%]j���ܷ��۶S���п���EnB���K#nhP6��%aMŪ��Jm�"�����@Ί�LiJ(k������?�ϧ���?�79�C���I0�	�5
1p#!��O%k�0�c����b��9,p+(�frrӫ���Q���̵�	ci\#�\^�؞����}����	K�yIs\ғ�)��8�`m��noE˫�x ��j�0��#�k��B�T�N�P���.�%HoE����ŋx'��mi�N�~be��?B*�H26�ܘ�K���)eQ	?���*�ܔZ��^��� 	����(�C����Op������D�/U�g<ڐ�V�J���f����ѕ���4�̆F&�ǔ	��r�@}<a�Q�!W%.��_V�h/���p��@�j�,3Bit%�c�}»�+�_���O��f�I�Q�hϷ�9C���}d��O�yC�&B�E������r��z�P���f�4�+��&J�p����jƅd��TYf��΍��悁���u�J�<J�;���]a���ޭ��o��&<�t��֓%v�d(���᫋o]��ɻ�я��hS�00����7j�����FP��B�:�` 1z@�J�\z��ua���%r2JΖi|)�˕qm��#L������ds��P�{߂��w����z�2;�����샋F��4��,XQ�GWֳ��왢��2��Rݚ,�JWo�!������������C�l�����������M���_�v��<nQ{�j��{ �p���      �      x������ � �            x�՝[�7����_яg㠧�֛<��%H�o@/=#m۲���?���V_�X�*25���TW�����`�f]xb٫�޾����=�|����ϯ޾z{���+6l��'ӿ�����=�'_?�|�������?���w߯�Y~�/�/HvdvBw�1��ّL���uqLcq�E�f�_�-�c��d��>�7��P�7��5�ǹ\��(��;��	�Wܷ�I��&ɽ�ݻ�K/)Mwr����������������D)���_�p����DW�i�����/y�Ұ��Pa��vlw�n���0�3qGay�R�K�ox�O:/��DvK��ـF�̕��Kf^2�x.L���$���%���l)ҫ\m>��g���c�_~��� �<�N���-/��� s�Р0�� ]Î�&��-�i�
3$0e6�N�\:���7�|\.��-�Pӟ���6�uPh�&�n)̚PQ�Ҧ0�v^oB���t�MkM*��j���=��\Na����q���O__�|��+f����#{s�������f��>����r�S�����������w7���ߤ�:��%2��?���m����+O`*��󏛟�t+Kot��5xk��[��2��9����Ι���Tbi�tL���r�*�l��o��W)g����֦���B9�=7|����7�]��϶I9'�R��x�m��j��	�鲛�D�>U�"�HNM�y�3��h���d�����ڌ���c"7E斷�a��Mpf�g7}g3{����&7l��Y7E���X��r�Q2�"�}��r��h�q�v���?�)dr�CӰx�����d�&���P�SH';�921�"�Y�>�N�B�dSOoI�c��y�bν���M	K���ݬ`K]���)������m�Kf�3#o|2��<�@��M �s�r�����?W��'N;	�B�V��@E��j��5�m��87٫9���s�cc�5�N.����ى]��o���������	�/�O`}0��?��/��:�SG�����O�<h�ɥ|-[�Z��rd���e��b��T�dY��#���,/���3y�e�- md���S0w��<��r5�,��>�sȞIų�{vgz�@6y�
��j/��gЅ��{�6�s����T�&����f��1}ጺ��s��������e�¹4�=����:�mfj��gs�C�(���n��B����n�n��G�G�gw��9�����O��������┴��HN8Q �D��N�
�ˣ;���[�A�[�1�[�!�[��.�\�[��.��[����"��Eë��#�d�M�p�Kӑ���:mv�9>7��ðd�L�i�yK;/���K���cxɡ�z�I�#?��փ���s�zP��AѪE���֗����k�?������K�A���&ԚxPk�A�I E��A7�b���g�M����{�ϫ�nf����t9�ydEa�X�v-��s=�<8�
��ty�l���g|Q�|3�s����HGVn6���Ј���y���&�<��nй�ڜ�ӑEE�<���s� �:���k�y
f�ӹu�sL��y�2ѹcP�Ǡ�xv������ӑ�M<����G�:�k2b�}M�M��|7�q7��䕩w���������t?vf6s����s4ߍ�y:��t��ӱ��H��GsF�v�h�=O����~7n?��}��a�l�#s]�cO�7�<���������ݼ~���$|y;'�tkN�!���X+t�X��&U4�\�f���}�����e�6>��>͞��Q�f��}�ɳ�^��s���b���f��\K)��S����F����R�p���R�~ IyǛj�GRJ�</��R�r���)��</�R�����M<�-;[l�t���o����;�s�n���V�
n�t�L����lH�Ά��q��P7O�:�$ߝ��F�	�y�U����4��S���)W��P�pBR��{�A�����AU=�꠪�wuPU�:���]���]BG-nY�u gbB31��B|��ͫ���)�2rX6Ad�  KY��
F�bdF�cdF�'��aٞ�:(MOJd{R� [I��;]�e+)�Z��R�e{R� ۓRٞ�*�B(�R��a(E=c��l�X� �3�*�b(EJ�R��a(�J1�R��c(�J1�R��c(�J1�R���`(%J	�R���`(%J	�R���`(e!�r>Lc��i޵���A���8ϗ�7��_�K=���k�2Ô�la���a��,9���SN(� +� �g��3��`�t�w�퀢'��9G�"�aưcX�1,�Ha`�1,�aK0�%��a	ưcXB1L�9��`K(��A�*1�Z%W�P��\nU���j�"!Td �j1�`#��0�1�`#��0�1�ac��0�1�acIF��D`$IF��D`$I	�a�˓��V�fa$�0�XI,�$F#��EC9I,r0�9��a�0c���6WJp1	l��fQl��fQl��fQn5l.���2l.���2l.���2l.��fK�16�Y`s�6�Y����W>_ٹ�k�2���la���a��a�	��`$I0�,3�!�0�%��a	ưcX�1,�f�a֠f�a֠f�a֠f�a֠Hb�$#	�HB0��$#	�HB0�*�c�zt7o�߶#	�H�0�0�$#	�H°hH`ѐ��!�EC#��H"0��$#��Hba$�0�XI,,�0�Y�,�a�0c��1���`�gQ��K}�Z�9�zmVU��gn�Pm͟>���<�#/�f�L��`Ñ��l82���G�vr�a/�N6���A�p�t'���� N����N�L�p&F8#����gb�31����LLp&&8��	��gb�31����HΠ���HΠ���HΠ���HΠ���H�����Hp&���f�eXV�Q#k��bx�gx�gx�gx�gt�w��1<&b<��1���(p&
��g���(p&
��g���(p&Z8-���Dg��3�U��I��S��m2y�X�r��O=t����-���K;k��@DH`�Ì5@h�6 P�n�[�n:��� ���f0��h����@s����+��z�G�������}�+�waG𮾫��k߰:W���\յ�쫺�]����]����]����]�Q��U��.ʨ$��0�y�<�auK��(�V����2�au��(��s�ª�d��w�|�i�:�SK�\[�Qur�a����#��l�ur��.tq�1��P��WgC�������	�w=���"��G�"��G�ъ��VT�h�^X=�u#��Ѻ��TwN� �Vȍ�:@n��s�7���V'׍0�\	E��"W���\d@�""��`��	t��|�g�d-F�ad=F6`d#F6Ad�VuYH�?:��RC)����P�a(�0�rJy�<�R�#���v�TI�#�Ve�"ۑR%َ�*�v�TI�#�J�)U�)U��H���6���ڔ��b(0�
����e+)�V�LP��-s!���=��ݰ���o�P+b�1ԊjE�"&����*bb����&�JJ%��R	C���T�P*a(�0�JJ%�T2J%�T2J%�T2J%�T2J%�T2J�R��a(EJ�R��a(EJ�R��c(�J1�R��c(�J1�R�T�q���?z�;���7ײ���<a�+/Xy��wXy��X����RO4��pa�rm�נ^A^�zy��5�W�נ^A^�zy��5�W�נ�ay����R�b�g�ԳP�� I��F91Br2�b)g��sX�9,��rK9���6�s���ac;����R�c����X�y,�<;��Ŏ�b�c���	X�,v;l,��zK���^�R/b��ԋX�E,�"�zK���^�R/��6������"�V����k����0�α��dR���������˜��)���8���t��,h�/m/x?W{W0�)�Myl
k ���)�B`�A�h    m ��$��E�ȡA�� rh94�D"��C�dMB�&�G�УI��$̃KL�]�u�Aďf���fm��x���ߏ��>Xl��b�=yt����-�F@�/��������h	l �A� �hE4�"D��RD�0�I�$Lh&4	��	M&aB�0�;�sX�88wuKرܻvo���*��_E0��f��"��U���<���I�t�I'���kIN�q҂�F�#�4�fG���Y��,�h�p4K8�%��f��f��4�f	G���Y��,�h�F360�q�^�1���w������/��__���oz���O�<���o<ɀ�쀞\��ϯ͛?���O���x���Ӌ�ן.�<�|�Ғ�R����X��tb�v�<"B�7�?�������͞;�H��&NDY['����*X�6Q���&����D�D�D�oobb���*b�;��Y���d��P��t}��L:���C���U��#]E�.�Rź>�U��#]ŵ>��4����tb4�a��Q�ډ�����ɧ�/���ׇ?'K��ş��~���?�t��o��~���ᦪ��QM���`U�c=鵘gO�l5���!���/�/��I*^������/>�����\��c;�'6S{b�����?�r������ש:����T~��_?L�����t�����?~��ß��#�k�?�W;��9���U1�n�[�0�|�R�R�R�b4K4�%�Yܸ�ō�Z�,����p�Tn����Rq�9w7K���R9e��(]O���8�9�<�f��f����z�5���Ysi�<�fl$���4�x$y�.h
��)��&���X�$�q�h��x���Iۃ�#��y������x�!?^~ȏ����؏Gc?��x4���~��x�}?���ʾ��w��w��L;�{!�%䴄��P�Z9U��PRJFK����*l-!-2$-2$-2$-2$-2$%2�Q"�%2��=}��� F�b�� F�b�� F�b��@Zd -2�H��V="�zDZ����k�#֪G�U�X��e�����Zd`-2�X��E�!��Ml���@S�j�PtxHP3�����J��7���ٱw{�[\)ʾ�+�h_��洯�J��Wp�y�+�r��]��涫`Xiv�
j�&h�&�C�����z��Ah=P� ��wZ�;������Bq=P� ��wZY;i����z!-2X� �E��nY�� ��3�qo���qoi:�-� �2�Vj�{+
�̽�Z�ފB-	Q�Mǽ�B-�PjYa���
����)Ҵ��zm��8i���8逓�8����샤	'�8i�<�fE3�k�ZC�V뎜�����X�^��x�j��Z/�S�Ԫ�Nk΂S{���8�z�$jV��Ska���fʨ��jV-
�i&(oJv=t��3��;c�l�4��p>Z宾\����{��θ���uL�cpӀ�\�4�:��f�4[����fG���Y��,�hq4�8�DR")���CJ�!%ᐒpHI8�$\��p4K8�%��f	F3o`4�F3o`4�F3o`4�F3o`4�F3o`4�C
�B8�)�C
�B8�)D
.@b�G3�ьq4c�G3�ьq4c�G3��Lp4��4K����4+IwFJI�3RJҝ�R��tg��mg���;#�$�C��!�v�J�8�Y͜�H��C��!���{�_I���K�JҸ(��z��4)��ە�qH�ޮ$�CJ��v%iR<���;J)I�h�f����^�M
y:�,x�6��iw֬^˷�a����hG}��o��d�;^,�w�X�x�0��ba����xǋ�ю�,�w8d�ň���q<z���ǣw��q<z���ǣw��i<z���ƣw�ީ�ޮ$z�t=��K�Ӹ�t=u�K�ӵ�t=EK���es�z*6���_s�z�5���L�fb`4����1�(i���[\Vݩ�n'Mh2@S ��� �^����a��A}P�� ���T_��P}�z��4@34L &@ 
  ��C�� �P p( 8� E �"�C��`B0!�LH��� �3�g�		��`B0!����@F?N ��!2�"��!2�"��!2�"��2 &�	`�@ &�	`�@��	�C�8� 1�C�8� 1�C�8� 	�	`� �  &�	`� �  &���h���7�_h��[l��:n�6�Kh�XB�Mh����V`	�Kx<�x��0<Yn���p�g�ǣ7�Go��2�e<z�x����-��\eɖDW�ӎBA��}������t�IG�t�I[��&�4�H/�K�N�-���џ�v;ǫז{�N�0��BN�Z��j_Ux�k�
�}-TᶫW�ݾ����Ó<��OG�������P�B=.�� �Wѯ�t��H�w��K�w��Ko�7����^u����t8�J���^���DK�j	9-!�%����PR�%�E�"�h�A�� Zd-2�D��E�E�E�����(���;'DCӗ�=ǘw�e�ϊ�h#�Sak��j��j��jUq�UŝVwZU�i5�N��wZ�iUX�Ua�V����������������������*lЪ�a��:��a�}[>�GBL;��Pl�̊B-![jɾ��5:[&!�%����PR"�#$Բ�-��V��HK���DKH�i!��DZ"-������?M�^������^��WK�Ϝ.�wS��][�	)�HqA�[��C�{�x@�G�x��p�$� 	'H�	�p�$� 	'H�	�p�$�E�"	g���H�Y$�,�pI8�$�E�"	琄sH�9$��pl��#�C�!��@qH�x$P<(	��<2d򸐉�o_U�v}�da������U��-l_U����U��-����j�_M�~5q��&���O���`�S0n�[����4lna;�[@�>�,l�as�1f*J�������N'M8i�IN��N��C��)�5�#NF3k`4�F3k`4�F�<�&�Y�����Ys�z�5��ьp4#�G3�ьp4#�G3�ьp4#�G3���)YǢt=͚K�Ӭ�t=͚K�Ӭ�4�flt��ĳ���&�(MpQ��4�Ei����	.J\�&�4k݆�z�5��EiG3�������hfq4�8�Y��s5li1;�����4@҄�f���-N��=N:�#NG3�������h�q4�8�y�<�fG3�����,�hp48���fG���Y��,�hp4�8�E�b=�6�2< Mf/�O�[i}��J���VZ�f���4��֧٭�>�n��>�n��iv+���J�h�p4K8�ͫ\�9���,0ŕ}>n��m���aw��?�=s�@��yM���~wj�p����k�}ki�I3NZpҶ�t*H;���J�B�[��\WTE������B��Z��`_U4�k���}-��Hx:����#���x:2����#���x:2����#���x:
�������(x:
�������(x:
����������h�t�x:Z<-��OG�����q^a�+r�y��������6}z� ������O`}���y*e��
�'/_��|���<�xy��1�I�Ͼ~E|�̄�DW�%����G��������[�u��#ҹ������?~���͋���͇�g����R>7���0W�e���
WY���|���w}���\�|62�;�7���Ǳ��dWΪ?3
q;s_����T�����q�I�@�꠩b���*V�����8,��Yھt�fj{Kq<Kㅲ|6��[:���-�M���Φu{K�Q�Ϧv{K�ћǣ7�Go��2�e<z�x����-��[ƣ��Go��2�e<z���mǣ���v<z���mǣ���v<z���mǣ���n<z������s������8�m7��x�vgS������̊g�џJ��mN�oK�E��T�,�S���é�m���S�4,�p*�Zz�\a r�S���C���y��_���U��=��O�[���c�~�7�h�� >  A�3���t�Or:�A�	��LX�.Aޫ��Bt�kA����U4��j�[ɫ溕�j�K��j�K{]m^��j��FW�W7�ڼ����Ս�6�nt�yu��ͫ]m^�u�+�A�b��+�A�b��+�J@���+�J@���+�J@��,�W�+�=�+���n��[}����q���?γ��ǹ�W�8ߺ���j���'߼�������CA�@�����:����.�/<�(�D���3�,��̺�A���d�)c�E����{���W�8�z���(��)f|��j��*h�U���������J�>���/`}��/�����`�E0��	̿�¿�.�^_�}��U�S�W�OA_�?}��g���

�X����J�U����l��c��0��?���#0��?���#0��?���c0��?���a0����0��G��p�%`�	�柀�'`�Y0�,��nJ��M;���=�sς�g�ܳ`�90�\�N��q]p����sρ�����x߁�A��o>��ۯ>�����3���Oo�mۜ�e�dŏ[��`~x0?2�;�W�g��#��@����z�h0~�`����I���'��S�O-W����V�O-����g��<�y0>�`|���̃��3�g��<�e0>�`|���,��Y��g��2�e0>�`|�����g;��`|�����g;��`|�c�m�x�����!Eݣ�tn0������{n0����㞫��6�׭�?����L?o�`������[?o�`���]>{wޓ��
�B|Up�+Tp⫂�_����9�W�!�*��U�y��Ay�}��qP��Ay�}��qP��Ay�}��qP�GP�%��]Z���4(�Ӡ�N��:��4(�Ӡ�N��:�����|_c�>Ԭ�����f��נ�wc�k���s��W���kPnլ��"�'T�t[О��+�b ϼ�ph����9��p@	W�t}�H8ϗ�J�Q���M4�&�� �=�w;f��l}lmV�� ]W��x}T����
�4@fk-h�2�����Z�� m��l��l����"l<��������S󹼼"8��j6�tv-��e�2�0�`�UT�>ϼ"
�#�.rAU3A�|����u�mG%�,*�ea�ܟ0�J�YtNɠ��fk�p��8p���0�z����غR��J�}[��+1��P�-'��j�/��s�E���9 B�R	�J%t*�ѩTF�R�6�oK�I�C!�h�����Ġ�	1�M�G�z�$�� T��#JYPM��GE��D\�V�&��� �d蹔T��j ����q������T%���Hm�M.��vS�,ϛ�HX~�~����W//�>�:�_���h̬����W�W�L�|At�Z����ߜ~t���'�v����'s{�k�e�Y��wdi��麷m�{U�y�cK��[������޷uu݇����=]�mk-��ڼ�NK���m�B��ʼKOK���Bl)�n��F
�)Ķm-鶵�m[K�mml�֒n[۶����ƶm-붵�m[˺mmj�ֲn[�ڶ���֦�m-붵�m[˚m-�Th�e'kgn��N�D����K;k�ϩm�ƪ-[�s?���_j�睵��v�h��v��d�s���uOM�7ϖq�mݷn������[����o�Z5�7q�E�Vs���u�E���nk��֦/��Mm�Zm�m�Zm�m�Zm�_t�0mmkO�8_��y2�f
���+eA�-���`�Lʂ�h���n�s�&��&��&��&��B���4M�]HS�B����B��`Ҕ���$؅4%A���&�.�)	v!MIP�4^�4^�4A�4A�4A�4A�4A�4A�4A�4A�4A�4a�4�w������M��M��K���j9qCsB�T\ڕ9jW�]��vؐ�+uҮ�I;lH+aC ��p���J��Gh�(}�J$9iq�1�I��H�A�M�$]K$�"X"I�R��`��E���"X�Y�*���
iޝ�3�1���G{!Z!K���Z!ɻ��R,¤�0��"��z,�Ah�}���@Zd`2L=ݩ��m�ͫ����$}����I�Τ�^?��#X?a��ibP}�3X_������`�0��̿�_�/�����`�E0�"�̿�_�/����Px�6P���q�w���egSA��O�碲��-L���}���E
G��#L9���10�J�uPF1,Ò1�)�N*���a2(�%��0B0�#��B�D�P(Qu(�\FB�B�`c��0�1�ac��0�1�acø+Ü9�,]VT�ʰ�rW���2��ܕaE�+*weXQ�+Ê�]VT�1��fa�0�Y�,�a�0c��1��fas0�9��a�0c��1���`s0�9�<�a�0c��1���a�0�y�<�aư cX�1,�`0�Xf����ư cX�1,�a�0�E�"�a�EXa�0�E��a�S�;(��w�|Qư�S��0���*_T�1��T���l�N�/*�6)�6)�6)�6)�6)�6)�6)�6)��w�~Qư����0����_T�1��<��2�a}���a�;O��cX�y�Ee��y����=P^>}�މv7ՠ�܁�;p� �������� �D�3Q�L8e}��:8���{8������&N���0�N��ሃ-L$��`I�;�`}_[��Y���2g���lCb�z��7)��Ef�˷a�<e�+��f�ڬ��&��;v�|�q�R��Zߴ������ybѹߛ�ļcڱ����T�^��������o/�~�학��|����tq�����6��<���z�j���Oq@��כk���Ɂ��?)J1S��;^;Av)~�������#ZE�V����Ͽ������??^�y�������7�.�}���}���k'te�~%9�`�����u�ĝ<|�kY9��d����c{);�z-���rN�b�s���bZU�񶁹��\�|����ӗ�y`�Ώw~���/���Y��"�ɘ�����cA`	� �ǵNMLj���0;Ue��@�������;����_�G�l~��+��q˰\����|�����P����Y�z-�k��
�|d`�+�~��4˵l wW��2��@XЦRNb.���~1�W�q:Pg�JSX��sǄ�`FV���7o�;IO��CҒ�]=�^Aq��Ŋ�e�P���P�x�H;�J�<H���)�SZ�ҾsJ>$��N��f�~$�'	�<`9d��)��6h�K�?���߹�l(H~س]28>CnAN���a�<0�R��ő����x:�͵Eh���B~���Bd�y9�j���\A��:"y?{���t�x��!r�sCQhs��i�R�I��e����vː>��CxyH��,)�W�@�C�q���Oo�X�wZ�����@�gV��q���
�_��@�\�1�´�=�z���m�m��o�Ӄk�U�GA(o�qL�澧���l��c�.v��nF�;~N��<=|��S��I�����W_}����            x�u�1�@��z�{�3�kh��(����l���^_[�����!�����yzeQ�=Q�X��cYW�� �������Y}��Ȧ.��YVI�y�軫+hX~���#�h� ͜�$�Xb�9�3�A            x�35�4�440�4�4�4����� =�            x�5�Ar9�E�qy1"�^z���O���N����J�\����������[�����o��6��c�������q�?z�>���o��8�����q�>�>�>�}�}܋y/潈{�"�E܋�q/�^Ľ�{�"�Eދ�y/�^��{��"�Eދu/ֽX����>�>�}�}�}��8�G��Ǹ�{Q���E݋�u/�^Խ�{�����>�>�>�}�}�}��8�����{��ž�^�{��ž�^�{q�Ź�^�{q�Ź�^�{q���9����{���=�=�=�{�{�{��|��ݎw;��x��ݎw;��x��ݎw;��|����w;��|����w;��|��n��ƻ�w�6�m��x��n����w��6�m��|��n����w�{���9�3�3�s�g�g��~�s����}��z��n��ֻ�w[��m��~��n�����w���m��~��n����v���n����v���n��������nϻ=�����nϻ=����so���{������޳޳�s���v���nǻ�v���nǻ�v���n绝�v���n绝�v���n绍w�6�m��x��{G��%������������=�2��/�%��/��*q�ynƗ�%��������弌O�2>e|����)�SƧ�O�2?e~����)�S��O��2?e~J|J|J|J|J|J|J|J|J|J|J~J~J~J~J~J~J~J~J~J~����)�S֧�OYW����~�_�NM]Zں����%/y�K^򒗼�-��-��-��-��-���x�+^�W���x�k^��ϛ�����|��f�������7x�7y�7y�7y�7y�7y�^����/x�^򒗼�%/y�K^�x�yy?�����}��.-m�z�����Щ�ɛ�ɛ��������:54uii���u�o�o�o�o��x�+^�W���x�k^�׼�5�y�k^�6o�6o�6o�6o�6o����������</��;o������:tjh��R��m����������ϻ���:tjh���֭�����������ɛ�ɛ�ɛ�ɛ�ɛ��/x�^����/y�K^򒗼�%/y�[��[��[��[��[��+^�W���x�+^�׼�5�y�k�}��1�c�ǰ�a�>�}��1�c�ǰ�a�>�}��1�c�ǰ�a�>�}L���1�c�Ǵ�i�>�}L���1�}���j�NM]Zں�|���W^򒗼�%/y�K��-��-��-��-��-^�W���x�+^�׼�5�y�k^��������u������u+�x�+^�W���x�k^�׼�5�y�k^�6o�6o�6o�6o�6o����������<����?:54uii�V������������M��M��M��M��M^����/x�^�����%/y�K^򒗼�-��-��-��-��-���x�+^�W���x�k^�׼�}�ȼ�O}���u��z�^�N�/x�^𒗼�%/y�K^򒗼�[��[��[��[��[���x�+^�W���y�k^�׼�5�y�ۼ�ۼ�ۼ�ۼ�ۼ�;��;��;��;ϋ}?N�ۭ���8�:tjh��R��M^����/x�^�����%/y�K^򒗼�-��-��-��-��-���x�+^�W���x�k^�׼�5�y�k��m�����}9���KK[����u�:�7y�7y�7y�7y�^����/x�^򒗼�%/y�K^�x��x��x��x��x�W���x�+^�W��5�y�k^�׼�5�y��y��y��y��y��y�wx�wx�wx�wx�w>���t���ԥ��[y�7x�������������������������������������������������������������������w�nS���n=_��!_�N�������M��M��M��M��M��/x�^����/x�K^򒗼�%/y�K��-��-��-����]�5n���>�סSCS���n�����������M��M��M��M��M��/x�^����/x�K^򒗼�%/y�K�����x��_��}�}�}��:tjh���V���������������ӡSCS���n�����������M��M��M��M��M��/x�^����/x�K^򒗼�%/y�K��-��-��-��-��-^�W���x�+^�׼�5�y�k^�gaaaaaaaaaaaaaaaaaaa���+n[������:tjh�R^�W��5�y�k^�׼�5o�6o�6o�6o�6o�6������������ݯk:54uii�V������������M��M��M��M��M^<oޯ뮼M]Zں�|���ס���x�+^�׼�5�y�k^�׼�m��m��m��m��m�����������y^ܯ�~:54uii�V������������M��M��M��M��M^����/x�^�����_WZ����|:54uii�V^����/x�^�����%/y�K^򒗼�-�����z���ԥ��[�뾯�סSCS���n����������ϻ_OX}���u��zw�:tj(o�6o�6o����������|��z�סSCS���n�����������M��M��M��M��M��/x�^����/x�K^򒗼�%/y�K��-��-��-��-��-^�W���x�+^�׼�5�y���������������������������������������޷C���.-m�z�����������M��M��M��M��M��/x�^����/x�K^򒗼�%/y�K��-��-��-��-��-^�W���x�+^�׼�5�?�}��������u�����%/y�K^򒗼�-��-��-��-��-���x�+^�W���x�k^�׼�5�y�k��m��m��m��m��m����������ϻ_/���֭�����u���ԥ��5�y��y��y��y��y��y�yq�o]��xSCS���n=_������x�+^�W��5�y�k^�׼�5o?o�?���~Ͽ.-m�z��>�:�7y�7y�7y���/x�^����%/y�K^򒗼�%/y��x��x��x��x��x�+^�Wϋ��
*n���.-m�z����+���������筿?��y��\�mi������_�N�����Z�����C���.-m���M��M��M��M��M^����/x�^�����%/y�K^򒗼�-��-��-��-��-���x�+^�W���x�k^�׼�5�y�k��m��m��m��m��m�����������{;z:54uii�V�},�X���c�ǲ�e�>�},�X���c�ǲ�e�>�},�X���}���a�mi�����N_�NM�-��-���x�+^�W���x�k^�׼�5�y�k��m��m��m��m��m����������ϻ_��:tjh���֭��������y�W�m���֭����:�W���x�+^�׼�5�y�k^�y��y��y��y��y�wx�wx�wx�wx�wx���ߟ�����yy��{���֭��}?����ۼ�ۼ�;��;��;��;��;��y���_�NM]Zں�7x�7x�7x�7x�7x�7y�7y�7y�7y�7y���/x�^����%/y�K^򒗼�%/y��x��x��x��x��x�+^�W���x�+^�׼�5�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>�>���|��mi�����>����ۼ�ۼ�;��;��;��;��;��y����Щ��KK[��o�o�o�o�o�&o�&o�&o�&o�&o���/x�^����%/y�K^򒗼�%o�o�o�o�o��x�+^�Wϋ�������z�ՏסSCS����o�&o�&o�&o�&o�&/x�^����/x�K^򒗼�%/y��ϻ_?�q��|�����Щ��KKy�+^�׼�5�y�k^�y��y��y��y��y�wx�wx�wx�wx�wx�����������u+o����ϣ���U� 1   �����u��z��C�������|��<��Щ��KK������߿��M@p            x�-�K�-)�7�������v�|���Tg����d0u�����_���z|����_�W����~=��_���������j��~���:?���O�����?���i~�?�����z�t�^?ݯ�O������������4~S��7����I��?��<��o�O�7ߧ�[������~��9~K߬ߚ���Z��o�o��:�\�u���}��������������m}�~{~�g}K���5�ô~�~k�����������������v���v����~w{�����]�������{���������;�������������������{�;����ί����������?���c~��Xߕ��ӏ�]�q��<�wm���m�껶R�=[)}�Vj~�Vj}�Vj�V�(�V�*�V�,�V�.�Vp[���N3l�6��[�u�M�<öp�ac8а5\h�N4l�n���'�=����O۳'��������.�����e����i{�ʲk����={fM����`~g?m��Yv2����g-;���Wv5����gO-����O۳��]���'B�=����O۳ז]�����s���w����e�;�i{������={qm�g{���ɵmϾ\����ul��\����ul��\�v��e����i;��:��v��~W?mǞ]vm����c�.����O��=���~W?m�^^vs������M�l���w��b{�����]��=�|����~ڞ����e�/����O۳������'s��Ym	����=��-����g�e�w���,����~ڞ�Ж����SӞ�Ym5����=롭����gE��w������&��~ڞU�V���O&CfR�C۳.��~zJ�.ں�;��iѺh���짧F뢭���`O��E[~g?m/s3��1�2?3�2C3�2G3�2K3�2O3�Z�tk]4�u�օ��O۳z2eێu�w������.��~�^c�����.��~ڞ��օ��O�q����^�[�~����-M~�%��[k�������nY����.��m�ˬ7lyc�߶�l���2��`��y���<X�,�K�����փe~��2��`��{���X�_,�/����"bbٓ@_,{�eO}��y�/�=�òg�~X�T�˞�aٓA?,{6��I8Ʋ�~X���˞�a�aN˞4���A˞4���A˞4��	BˋX�eOX���eO*,{�Pa�ӄ
˞'TX�D�²g
�=U���B���B˞-TX�t�Ʋ�5�=aaM�BY�S�����!�5=iqM�B]�ӆ��<�R�|Y�`�3�P���!$6=w�MOBdӳ�P�����f<�MO Bh�3�P��"�6� ,{b��E�ڦ�!��yD�mz"���I�⦧!��Dhny2�[�M���`��4l�-O(Bx�3�P��"��<�h����5(4��A��e
.kPhp�7,[�B��\֠��b�KA4�X��ł.քhp�,D���!\Yb��!\,����5(4��A������?���[�n���A7��֠��5�A7�֠~k���5�_�b�X���q��e��a�X���q��e��a�X�����s`��?�7�`,������,������,�������3)������Ii�ra��kl,��=��a��LJÖ�v~Ϥ4l��l��LJÖ�v~Ϥ4l��l��LJ�<����Ii�rc���-7����Iiز�l��LJÖ�e;�gR�l�K�;X4l�tÖ�A7l�tÖ�A7ly�C��{&�a��1���͸v��N���'��[l=�l�l9����v������g�v�Ɋ���3�������	z�v�'~;���ߎ��oGz�#=�ۑ���	���?~{��=�ߞ��oO��'�������$�y�῱�&��(�f�p�2Ko�<��p��$�y���/�٣],g��evj�v�@i��Ų��'P7�<�Ұ�e;O�4l�a���([~X���l�{�a��ֻ'P7�wO�4l�a�z�J�Áe��(o��wO�4�`b�z�J��́e��(o6��wO�4l��l�{�a˅e��([.,ov�X��=��a�{�a˅e��([n,[�@i�rc�z�JÖ�ֻ'Pl��l�{�aˍe�}	������%,[�KX�ޗ�l�/a�z_²����Ǿ���%,���Ĳ}~M,���Ĳ}~M,���[�3�[�3�[�sv��3�[�3�[�3�[�3;��8[}n�2\���2㼰�8/,3�ˌ��2㼰�8o,3�ˌ��2㼱�8o,3�ˌ��2㼱�8o,3�ˌ��2�|��8,3�ˌ��2�|��8,3�ˌ��2�L�[�3�o1΄��8��L�[�3�oynY���e���E�۞[�o{nY����e���E�۞[�o{nY��=ȥL�L�۞W�o{^]���yu�����t{T7K��Q�,A�Gu�݇��h\7&����Q�,A�Gu����t{T7K��Q�,A�Gu����t{T7K�}��`٣�Y�n��f	�=��%���n��ۣ�Y�n��f	�=��%���n��ۣ�Y�n��f	�	%[>���xT7K��Q�,A�Gu�=���xT7K��Q�,A�Gu�=���xT7K�Sd���Q�,A���f	z�v2k�V�%�q��,A���f	z�T�,A��j�%��Rm�=^�m���I�a�K���x��Y�G���8�l���d�#�f	zA6q�8�l��q��������d�#�&G�M<� �8xA6q�8�l��q��������d�#�&G�M<� �8xA6q��f	ʊq�eŸY��b�,AY1n���7KPV��%(+����fȊq�dŸ��b�lY1n���7�@V��m +��6��fȊq�dŸ��b�lY1n���7�@V��m +��6��fȊq�dŸ��b�lY1n4Ȋ�AV��b<h��A��d�x� +ƃY14Ȋ�AV��b<h��A��d�x� +ƃY14Ȋ�AV�:.��R_�6�����`ao9h�q�6�����`ao9h�q�,�[t\r����������A�%7�lo9h�q�,�[t\r�������2�d4�H&��E>.R�hp�UF������$4H<�nr�X���l�-'�@{��6��r����l�-'�@{��6��r����l�-'��C�xK��xK��xK��xK��xK��xK��xK��xK��xK��xK��xK��xK��xK��xK��xK��xK��xK��x$4H<h�8x� q�A��A������$4H<h�8x� q�A��A������$4H<h�8x� q�$zƾ����o�g�8��&zƾ��E�˞�o�g�8��&zƾ����o�g�8��&zƾ����o�g�8�T4���&Z�7q������M�o�5x���8h��Ak�A�%7�,�%X�/t\r���E��Kn`��h�q�,[�:.��ek�A�%7����`��h�q�wѠ�X�/t\r���E�����w��ă7U4�S��rj=X�܃74�)���M�:.��ek�A�%7�l^4��F�H���F��T�yw�y����̻�g޽�<����w�?ϼ��y����3��yO�y�=����g���3���g���s�y��<��y�?ϼ��3o��̫�y�?ϼ�g���3�A<3�3�A<3�3�A<3�3�A<3�3�A<3�3�A<3�3�A{��/�g�hО��A{��/�g�hО��A{�'���/�g�hО��A{��/�g�hО��A{��/�g�hО���E��<�E����3_4h�|Ѡ=�E����3_4HQ2�.R��S��?�|� 5�h�2e֢���ͿaU��e-��e-��e-��e-��e-���Ar;��yh���C��v$��� �����<4Hn�Ar;��yh���C��v$��� �����<4Hn�Ar;z.t��    ��=��e{�C�����=��Aυn`��Р�B7�lh�s�X��?4��,���\����z.tˢF�e{�C��z.t�x8�x8�x8�x8�x8�x8�x8�x8�x8�x8�x8�x8�x8�x8�x89���MN�S˾4��hP�&)өi��锵I�t*��e:�m3��6��N���L��Mn�S�&9�7s��)���A~�)z4M�{��iJ߃MS��h�� I���Y��>H�4��A��)�5�R�w�">HՈ�� W#��d����5�2>H׈�� _#�ツ���26�B>Hو� g�
@��YQ)�mD�|����A�F���Q1�nD�|��U�A�F���Q9�o�!�����A�|L���>&}PC�>���I��Ǥ*�c�����j������!h�j�#DU��!���CT�t���Q]P��> =D�}l���>6}Pe�>f�	���>6}Pk�>���M��Ǧ*���5�A~U�>H���� �**�����r�Z�3�:� �**�4����?H��z� �**�T���r��*?H���� �**�t�v(��:?H���� �**􃔫��r��J?H��:� �**�������Z?���T�؄>B��s�s ��Nй�9�[�'�\���-t.t��
::lq+L}�a-���+p:W�t� .�\�\й��s�uA�
��I���$3_�/��|U2�輒�E畜,:�$e�y%+��+iYt^�ˢ�Jb�W2�輒�E��lҡt^�΢�Jz�W�輒�E�-:��h�y%G��+IZt^�Ң�J����:@3�� S�dFa}�f�lF�} g�tFa~�g�|F�~ h��Fa�h��F� i�Fa��i
�F� j�Fa��j�F� k"�Fa��k*�F� l2�Fa��l:�F჊,n!���Q(!���QH!���Qh!���Q�!��Q�!0��Q�!P��Q�!p��Q"��!�Q("��#�QH"��%�qР��� t�DGa��t�LG� uj�XV?�/���.�����qb�������{�V�=Z�c,��xǭ�h����q8��؏���}��~|_@��e����E,����-�`��:�}�}��<�o���������{�7x����y|� >�����}��<�o@�7C���7�����y|� ?�����}�<�o��������A�7�����y+�}�}� =�o ����"����
ĭ�@�����=�V��G�
�[���%Hĭf5��[!�q+��#n�zĭ@B��J���	=�V8�G�
(�[!��	�Hĭ�B��X��B=�Vp�G�
/�[�q+��#nzĭ0C��h����A�
6�[�q+��#n�zĭ�C��v��=�V�G�
>�[��WI/d%}��d��k�`�5�����G�Mt>Bm��n�����|��D�y����Y� 8!FNP���a��f!9�FXNp���a��h!:!:+r+�(}�s�"�HP���Ep��E����E���E��â�:�1r�> :�2r�>@:�3r�>�:�4r�>�:�5r�>�V�-V�=V��]���l�
�+��PY�����r�M*vtQY����]T�袲�G��=��,��Ee��.*~tQY��{���*�tQY���� ]T颲PH�C��,�Ee�.*�tQYP�{C�*�tQYh��ʂ#]T颲 I��H��,H�Eea�.*�tQY�����*�tQY����B&]T���Q��sT���):Ge��Q��sT��|�hF�QYt��ǌ=��hJi�)�A8�A4�4�!��#���*�A`�A4�4���� �� X�i����Y�i����Z+$6}���~ni��~ri�A�~viু�~zi���~~i���􁟆`�i����a�i ����b�i0����c�i@����d�iP�qB��~�iৡ�~�i��~�i�!�~�i�a�~�iৡ���N/�:}��~�i�A�~�iু�~�i���~�	n�8A�V'��q�n�9��e��ͼ���Y�7���[Xf��x,ȓ[�����X�'������}�no<��-�`��x,�[�����X�'��u{�cY�w<�u{�cY�w<�u{�cY�w<�u{�cY�w<�u{�cY�w<�u{�cY�w<�u{�cY�w<�u{�cY�w<�u{�cY�w<�u{�c�y�c�y�c�y�c�y�c�y�c�y�c�y�c�y���Q�~2Jٯ�F)�U�(e�
��W����*x��_��R�� R�~BJٯ�H)�U)e�
$��W����*���_��R���R�~RJٯ�J)�UX)e�
,��W����*���_��R�� S�~bJ0o2%�����[Mi�|:�9������)t>s��Ϝ�@�3g=���it>s��Ϝ�@� p?%��\AP	�@�W0T��+ *�����
�J�pG%H�
H
W!�`�*(0\������Tɸ��J�58U2�ᩒqP��k��d\�T%��*�@Uɸ��J�5XU2�᪒qX��kȪd\�V%��*��Uɸ��J�5xU2�᫒q`��k�d\�X%��*�@Vɸ��J�5�U2�ᬒqh��kH�d\�Z%��*��Vɸ��J�5�U2�᭒qp��k��d\�\%��*�@Wɸ��J�5�U2�ᮒqx��kȫd\�^%��*��Wɸ��J�5�U2��WJ� KɸB`)W,%�
��d\����+��q�R2�pX��i&��y&t��+(��q��R2��XJ�Kɸ�c)Wx,%�
��d\!���+H��q��R2�@YJ�*Kɸ�e)W�,%�
��d\!���+h��q��R2��YJ�:Kɸ�g)W�,%�
��d\!���+���q��R2�@ZJ�JKɸ�i)W8-%�
��d\!���+���q��R2��ZJ�u�d$3?���q��R2� [J�bKɸ�l)W�-%�
��d\����+ؖ�q��R2��[J�rKɸ�n)W�-%�
��d\����+���q��R2� \J��Kɸ�p)W.%�
ĥ����g�*:����|櫢󙯊�g�*:����|櫢󙯊�g�*:����|櫢󙯊�g�*:����|櫢󙯊�g�*:����|櫢󙯊�g�*:����|櫢󙯊�g�*:����|櫢󙯚x�������<\N&ǹ@t�}`^ʙ>8/�T��r��K9�꥜��RN�{)�����~�^�?x/���r��K9�����RN�})�����`_ʙ?�/q� �Ĺ���'�
�K��+�/q���������' �K�,�/q
� ��9�� 'L�,0q����y��'L�	,80q*� �Ĺ��'L�,X0q:�������'L�,x0qJ�NN?� ��I�	g&L���xN�:��ĭ�xN�:��ĭ�xN�:��ĭ�x^9Jĭ�xN�:��ĭ�xN�:��ĭ�xN�:��ĭ�xN�:��ĭ�xN�:����A�:��ĭ�xN�:��ĭ�u;q�d�N�:Y��Nt�o��G����y�yt�o��G����y�yt�o��G����y�yt�o��G����y�yt�o��G����|団�o��W�9:_���|団�o��W�9:�DW��#]I&�t(�8�U�d�TW��c]M&�u8�8�U�d�dW���]Q&�vH�8�U0e�tW���]U&�wX�8�Upe�W��#^Y&�xh�8�U�e�W��c^]&�yx��A�L �`&�Ђ0Hh��	&�`�Z@f�
-(3�����B�L��h&�Ђ4hh��	6�`�Z�f�-h3�����C�L �p&т8�h��	F�`�$Z�� }������#��3D��C��gJ=�L���܀�/��SO�>S� �  )�gJ=�L�� �)�4�����S`Дz
�RO�BS�)`hJ=M�� �)�H4�����S`єz
0�RO�FS�)�hJ=M�� �)��4�����S`Ҕz
P�RO�JS�)`iJ=.M�� �)��4�����S`Ӕz
p�RO�NS�)�iJ=>M�� �)�5��rs\"#����Ȉ��DF<G&2�93�ϡ���ߩ	�4�&2������EW�j�+p5���� �
`M�t�&P�Y,]��	����MWPk�+�5��ܚ �
pMu�&��]L]��	����UW�k�+�5���� �
�M�u�&кal]��	����]WPl�+06��� �
�Mv�&�e�]��	Ȯ��eW�l�+p6��<� �
�M�v�&P�i�]��	خ��mWPm�+�6��\� �
�Mw٦�������|�v��n�����	�|�ݑ@�%��ܓ��wnJ@�;w%�s���8MSPn�8M����4�&���8QS�n�HM���35�&���8US�n�XM���s5�&���8YSo�hM����5�&�Л8]SPo�xM����5�&���8aS�o�M���36�r��r��r��r��rx�V	ΩC_C_N3��	ff}9���r(����T0:9��_�������dp��
�@�/g�����`t�r:��枂���\T0r@��
FNsU��a�*9#�e#��;7d���澂�s�\X0rP�FN
se��Qa�,9+̥#����`�0���ނ����=���#'���`��0w����C��^0rj����tsK:������ԁ�o��@��qN�qN�qN�qN�qN�qN�qz�1ww�!����3���1r��<FNs���1bn�u���u���u���u���u���u���u���u��h���"�����4r�	u��-'��:��PW��tB]�s�	u����k:2���:#I]�3�+�u�u��HRW�$u��HRW�$u��HRW�$u��HRW�$u��HRW��ɕ �A]�3���:#I]MI�j�HRWSF���2��Ք�����$u5e$��)#ys�}PW#K��pM����,]��5Y���k�t�d����5<\��kx�&K��pM����,]��5Y���kE�0��j��B�+�=WT{N����,]��5Y���k�t�d����5<\��kx�&K��pM����,]��5Y���k�t�d����5<\��kx�&K��pM����,]��5Y���k�t�d����5<\��kx�&K��pM����,]��5Y���k�t�d����5<\��kx�&K��pM����,]��5Y���k�t]�yl��s�t�d����ux8j|�_��������ux8j|�_��Mj|7��5<ܤ���p�_��͑��^G��{�u(����!�ב���^���C��ۇ�^G��{���u�"�Wj|7��5<ܤ���pr���&�^��MȽ����{7!�nB�5<܄�kx�	���pr���&�^��MȽ����{7!�nB�5<܄�kx�	���pr���&�^��MȽ����{7!�nB�5<܄�kx�	���pr���&�^��͊��^+ʃ{�(<�׊��^+ʃ{�(<�׊��^+ʃ{�(�r���&�^��MȽ����{7!�nB�5<܄�kx�	���pr���&�^��MȽ����{7!�nB�5<܄�kx�	���pr���&�^��MȽ����n�Olx�I>���&�Ć���n�Olx�I>���&�Ć���n�Olx�I>���&�Ć���n�Olx�I>���&�Ć���n�Olx�I>���&�Ć���n�1x��{���fn����Kn�61x������fn����Sn�V1x��{���fn����[n�v1x����:7�sx��;���fn����gn�1x��������mc���1t�w�:��s���:����C��n�LC�C��������yn �����n�2x��{���fn"�������?��e���<���y�/���_������ٟ���?��e���<���y�/���_��������_��u����n�?��/�Ǻ���X������c�����_��u;da���,��p������Avx8��Y��� ;<da���,��p������Avx8��Y��� ;<da���,��p������Avx8��Y��� ;<da���,��p��,lq�?x�	Y�}�s�B6���C���E�|�<t>r:����{��#7����s^�y��K<ύx��/�8��s�ω3J<�ܱ�e��ŉ.J'�(Q��Dq��ŉ.J'�(Q��Dq��ŉ.JWn��.?� �(Q��7�	Y�Т�O�r�}�nH�����b7!�
nB�5܄k(�	)�PpR���&�XC�MH�����b7!�
nB�5܄k(�	)�PpR���&�XC�MH�����b7!�
nB�5܄k(�	)�PpR���&�XC�MH1n^�EDqH1�^�EDqH1n_�EDqH1�_�EDqH1n`�ŝ�#�CnEYr/"QR�[����w�	�w̶��c������]�̶��1��rcN����9���sJ-�3�Z�g�)��ИSj��1��rKcN��ƜR���H�;�������
n��F(��;��fnm���p_܌H�>P7�w#Ң����n�Pp��i����DZ�Ᾰ#�}�n�/nI�E��{�����&�7%��M���A�M�/.K�E���i�:����DZ��Ᾰ2�}�s�/.M���2�����p_ܛH�>�9�7'Ңt��݉�~�t��퉴�#Q<��(�������}����           x�5�]��9έ���`R$%Js��?���7�"��f�r�Uix��������}����}��c�>��c��g��~�q����x�o=�7�_��>����}�}�>y��ϼϺϽ�{�"�Eދ�y/�^��{��"�Eދ�u/�^Խ�{Q���E݋�u/潘�b�������}�}�}�>�>�ۭ����܋u/ֽX�b݋u/ֽ���{���u�'�S���Y������߳��s/����bߋ}/����bߋ}/ν8��܋s/ν8��܋s/������{���{�{���z�|�zo�w��ݎw;��x��ݎw;��x��ݎw;�m��x��n��ƻ�w�6�m��x��n����w��6�m��|��n��ֻ�w[��m��z��n��ֻ�w��9�7ޛ�������{�{�}�%�}��ݮw���z��ݮw���z��n�����w���m��~��n���w���~����w���~����w���y��ݞw{��y��ݞw{��y������{�{���z�|�zo�w��ݎw;��x��ݎw;��x��ݎw;�m��x��n��ƻ�w�6�m��x��n����w��~��1n���w�����ҩK[y���/x�^����%/y�K^򒗼�%/y�+^�W���x�+��M��M��M��M��M��-��-��-��-��-^�׼�5�y�k^�y��y��y��y��y�wx�wx�wx�wx�wx���ߟM-���u+�>�}L���1�c�Ǵ�i�>�}L���1�c�Ǵ�i�>�}L���>���i�.m�z����ס����ɛ�ɛ��[��[��[��[��[��5�y�k^�׼�5o�6o�6o�6o�6o�6��������������?�Z:ui�V�������x^����y�?���ҩK[��׺?�ס���S�>���u;ui�������:44����%/y�+^�W���x�+^�&o�&o�&o�&o�&o�o�o�o�o�o�׼�5�y�k^�׼�ۼ�ۼ�ۼ�ۼ�ۼ�;��;��;���0�����ҩK[����7x�7x�7x�7x�7x�^����/x�^򒗼�%/y�K^�W���x�+^�W��M��M��M�|^���n�����:44�t��V��/x�^����/x�K^򒗼�%/y�K^�W���x�+^�7y�y�w���Z:ui���u�&o�&o�&o�&o�&o�o�o�o�o��y�k^�׼�5�y�ۼ�ۼ�ۼ�ۼ�ۼ�;��;��;��;��;��y�?�ƾM-���u��z?O^y�+^�W���x�7y�7y�7y�7y�7y��x��x��x��x��x�k^�׼�5��W�?�K[������uhhj)o�6o�6�������������ߟM-���u+o�o�o�o�o�/x�^����/x�K^򒗼�%/y�K^�W���x�+^�W�ɛ�ɛ�ɛ�ɛ�ɛ��[��[��[��[��[��5�y�k�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}Է���=����S��n=_�G_y��x��x��x��x�k^�׼�5�y�k���>�b܆��N]ں�|�}}�����������u��C�����ۥ�[����{�Z�ۼ�ۼ�;��;��;��;��;��y����CCSK�.m������������^����/x�^𒗼�%/y�K^򒗼��x�+^�W��o�&o�&o�&o�&o�&o�o�o������t�?ϼ�ǯ���<~�Z:u)o�6������������ݯ'|�Z:ui�V����������^����/x�^�����%/y�K^򒗼��x�+^�W���x�7y�7y�7y�7y�7y��x��x��x��x��x�k^�׼�5�>�}��1�c�ǰ�a�>�}��1�c�ǰ�a�>�}��1�c�ǰ���������������������������������^�CCSK�.m�z��x�+^�W���x�7y�7y�7y�7y�7y��x��x��x��x��x�k^�׼�5�y�k��m��m��m��m��m�����������[��r�M-���u��:x�7x�7x�7x�7x���/x�^����%/y�K^򒗼�%/y�+^�W���x�+��M��M��M��M��M��-��-��-��-��-^�׼��}�۩K[���w�CCSy��y��y�wx�wx�wx�wx�wx����O����N]ں�7x�7x�7x�7x�7x���/x�^����%/y�K^򒗼�%/y�+^�W���x�+��M��M��M��M��M��-��-��-��-��-^�׼��G�G�G�G�G�G�G�G�G�G�G�G�G�G�G�G�G��������ҩK[������_����N]ں�7x�7x�7x�7x�7xw�׻�ס���S��n�%/y�K^򒗼�%/y�+^�W���x�+��M���}��ҩK[���w�CCy��x��x��x�k^�׼�5�y�k��m��m��m��m��m�����������������S����������~���6�t��֭������P��-��-��-��5�y�k^�׼�5�y��y��y��y��y��y�wx�wx�wx�wx�w��:44�t��֭������������/x�^����/y�K^򒗼�%/y�y��
9n[������uhhj�T��-��5�y�k^�׼�5�y��y��y��y��y��y�wx�wx�wx�wx�w>�~]�����ҩK[��o�o�o�o�o����/x�^�����_��=_������ҩK[y�wx�wx�wx�wx�wx������M-���u+o�o�o�o�o�/x�^����/x�K^򒗼�%/y�K^�W���x�+^�W�ɛ�ɛ�ɛ�ɛ�ɛ��[��[��[��[��[��5�y�k^��<�H�H�H�H�H�H�H�H�H�H�H�H�H�H�H�H�H�H�H��^���v�}ܿ�u��:44�t��֭������������/x�^����/y�K^򒗼�%/y�+^�W���x�+^���ݿ�u[:ui��������������/x�^����/x�K^򒗼�%/y�K^�W���x�+^�7y�7y�7y�7?�~�5�mj�ԥ�[�����:���/x�^𒗼�%/y�K^򒗼��x�+^�W��o�&o�&o�&o�&o�&o�o�o�o�o��y�k^�׼�5�y�ۼ�ۼ�ۼ�ۼ�ۼ�;��;��;��;��;��y��_����N]ں�7x�gmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm���r�n=_�������ҩKy��x�k^�׼�5�y�k��m��m��m��m��m����������ϻ��uhhj�ԥ�[y�7>�~]+��t��֭���q�������������CCSK�.m�y��|�?�ס���S���/x�^����/x�K^򒗼�%/y�K^�W���x�+^��yu�>B��������uh�ow?{���u+o�o�o��������������6���i���5�y�ۼ�ۼ�ۼ�ۼ�ۼ�;��;��;��;��;�s����?�Z���oi�V����������^����/x�^�����%/y�K^򒗼��xū�}޹/���O���t?}����M��M��-��-��-��v�x��x�׼�5�y�k޷��_����ҩK[����_�CCy�^���߯w�_��_����N]ں�W���x�+^�W��M��M��M��M��M��-��-��-��-��-��5�y�k^?���߿��?�\t�      �   �  x�}T�n�0|^>f�Dɱ�e ��j�α<KIۿ�ؒ+Z�w�y�����(J�b��~q69�G�DL�2��j�< g�gX\\t�P�)��{��Y?�?¥�5��b�:�h(�R�1ء@�JbI2��C������@�w�%�)�s�u��s��ͨvCI��J��܂�ҿ���Pw�+�Կ3�;ep�����"Ł��kM6*�,��� �����f��OW����p���V4�Z8g�n��}��J"�u�K�%d�4bt_���P�4�A&;	�'��gW�M��
�M�֌ɦ{Up!P�QPz�8�,����*��/�.?>ю#6YFvRq.���a@7�D~�SX��wEl��d�݊�>xV�dj^�e�~�D�Rm�*��8 tTO�kX����ἵZ�2��ݒ��'Ͳ��Ő[���o���΁��i4ԙ"�U�TsD�.���ݡ��\��-HQ\RU�'��黈n3������RB$Fu/��bͨ)$��z�!�Q�t>Ċ^���i@�-�a方���Pgrk�����60�_���f���٧i8���᣶%�Beܸ�
�MW�[��4�O��㸿�K�2hE�aO��Y��"��6�~��M&K�+�s��D�p-��B��ґ&w/z��O�>Q_v\���WBZ�\�F�@ܕW^��GӅk���o��"���:����
�Y��n�������Ѭ�n��)��|<"�~�N���}G'            x������ � �         G   x�3�t,(����OI�)��	-N-�4�2�"j�e�EԘ���	�)QS.3,�f\�XD͹,��Zp��qqq �19q      !      x������ � �      �      x������ � �      	      x������ � �         	  x��Z�n�H}���O���_�Oq��ȱ!��`�yi�9
G%H��d�~O�.ʺql;F@�R�OWթS�da�jx��Z�\1�ho�A%�\[k��v�h�6���ԭ�0F+7s���c~J�Y8�V�8q��W��ͣ���?,�@3��&�p|鿸q�s��mV.�����S��Q�/Uq�i\�
�n�:X�s�t�=�����G�i�#�GdHt_�>�O�����\��h�l<�����_k�W�d������Ñ{p�$��i�Y,�V1J���拢ť�an.��7I7O`c,$��h�ɭ{�c����Kh���e'�Ŷ+5�북����Ca}"������<�'N;:��[�+,_	ìz"�j�_��b���XY9)>m_�>m��cE|�*>��m+�,fn�|.ͭ�]⳰1Jg��h�O������k�M��������n�ĉ�ϩ%A�\P]�������%eS&	(c��%0��g�Ѵpڨ�w����u�K��)���Q�ܭ��x���q��1Mi�p�]�G��!n��W�#h�
U�<��H�n��$�)ىNv��,��9T֔J+"�=������(;,�G��Զ=���ڃ��]��M\pN�Z�.�J#Gб����F'����]G��m�g:�����N�rG�����M�@-O�n�πl�f��"P�[I�1]�6����l��P ^w2B��������p�/���7E�ЂX"��*���S�d}�Mڣ��D��3�9������U�0N���ȱ�r�S����j����UA�u��jj0��t�JNY��E���	]4�Fm��`B��%���hRi�Ε��k��?	k��Juʹ;�X7���.T�������@M�������f�噲��n�,��n��}~�i�y�6�J()ؙ�B#����ދ�f�����L��e�B7���Qjͅ����Η	���.HQ������O�ѱ�,(o{>H`�2���Y:*,�>�m,��E�X��Xҥ{�[]��H.-�Ϯ��&�l�O�BC�ڠ���\kh��(��w��WH�.��Y8Z(iw.)Jg�+��-H�Kw����������yh��SK7n� $I��#��_-P�V����9* ��q�� ��rɹ>upYn����$\׆mYBd��qt��I�����=R,�L!��
���}��2��\E�S\I݅RJ3���q�b�6V��#9V����(AԤ���:�5���ԡ��	�3.��#K�NQa��j�3�3%%&.�;!zNx��t�i2	�ccЦ���G�{bt��i�
_�c�Q�-c�X�Ӆ�ˉ���c�-c�K,#��9Z]�:Fem����'��hv����ͼsK/�`<�$�W�ß{׷?_�(���3�0�F�?\+NK�>^��ŏhf��e���J����~��&�X��x>���*�_���ccû��������%(��C����&���n���:��A��I��3��{�ӪG��gH���V~Z�]sq��o����eG�}���{��ySLHc!��8��2zlЏ�0�!��|^i9y��L��;��1�\۸9��̊,�w��/X�ׁFu��M�'Lp�o��q
?x,�׍�~�2��cB"���n���^L��\��-� ����N�~�O㞀:���<
?�3��D��,&?��|�7}�����_#�}5x����'�ۃ[�Q�Փ�
2��׷��첇`����?����v+��I�W�n��>�&�Fn=�����G���V=\$��%n0j��;[fN8}�ҫ�lU��Q�����v��$�h�rȀ���9|s�V%P��=u*z���Q����Q�:Q���v�,���-?B7��~���i�vd���2]}��>I�r�zg���O�~�G���	H���>�e��,�/Q\�ea���w�-��4h�m���N��k��|�A5��n���-�Y�@)�����e�xr�=���Vy�q����xPE���x�m�v�w��y��Lyb#́c�U6S�c�����;AH�vV���ғ����:��>��(��Q�i�S	+�al<�u!��>��1���#5��5	h^4�"΍��|W%	�P�
�zq���6�.���ԅ��wi������S6~��=���Fs������+cb�Sn[;o7�z��ԳP�_�2qС���oU��򉅩�:��N��f��3�!�?e���D�R�ԕ_�,ESH/m���Ofi6��^�BA޵�����2^E��7����`�#:�$����.���']�}�p���
"�r%7�]�vyqq���            x������ � �         �   x���K
!E�q��l��e��k��`!bZ��~�i�8�pxOB����{��'�@�Rrċ�V��Qc�k�F́�i-�6�-J���VG,�\K����6��WJ��%������n�Ji>f��w�Dս����z\�¤>����� 2l         �  x����nG���O����/���46���Eo�EPNU�iQ���QdE�;3v�5 ����O.��پ�m����a��02&�ތ���?V?��/���JQ]H~���y����
c��Yj�q���o^��q7N�����$Vʬ����x�~{c!��7���K��!DA�o��*�Bʮ<5����$�����iN�4\4�JVΪ���&9?�ޔĥR�Br�H�$M�)�+�}a�S����;�h�4D�!&m�Rv��!�4 .�F�f ��r'%�2���������Cq�$�`��h{��95���]n����U3�h6d�5����Є�ipܡ�,��Y�K�5j4%���4+�K5(����"Y!;�$�Nk�]1����"3&��pRFWӀѲ
���ƾ��y�w<�<I��eΡ�3;i`�%~O-��S-y~yj'J�n�b��}|�B�s����yj���������`���h���R��fY��?��`W�t�?�9>YB�GWl��g���4����z{;��K��/H�[�QJ�[|ր��Z�Q�*�ktP%��\��	/,B�As�^	U�,�*��_����3���1��x<Z��fT]��g^4�*����	������q|(&�|�؁��J5l��4��[i>�h�B+Hq�V�����Hb�f���i �CBc~�f�<z��A�$g�^����ўs%'}�I�FX�@l��J� E�(]#q�yn$'ČD��q�b4�
w�ީ�zMs1��M�0���?O��q����k���|�i ���93�m���
6�k�2�����A	ҋ	���v��L݂c.|�Q4(&�(˾���Kݑ�J���T2����(Nc�il�Ak�H��:�[�(�b�tw�d���ݻ��û��5�{�׃�o& j�&���º�XӀʻh���0�]��o���&Yb�9�g��� �oA@�      �   �   x����J�0���S��8���;7/E�n�̡Q�I���·7����8������If�E�������1,a��5�i� ]�)Q�	`�p\C�>�c�(�3}�@��xz��S�`-�������AGy&���FL��!}���<����c��xGi=�L�~��z�*�еƴ�f\3�jg�4������zZr�uW �h���M�@n�
-�C��jѴ����ˁs���p�         z   x�3�tN-*�L�LN,����v
�t��v��4202�54�52R00�2��25����2�JMF��J�6c� G0ơ�hnj^zf^jjQf^:�TW?wO?W� O?w\�L9|����=... �}7A      �      x������ � �            x������ � �      �   T  x���M��0�s�s��$@DO�
(��8�\@�F�?�����֔s�*��{�z��!p���a��@$�[�3i*��|��+��B�uX]�Y?:�l�p�Q�\���ޤ�7�u�QqD�i�O]ڭ�	��G����A��Ћےz}_2�%�@`�	a4߼hed��ΘuTr�L	A.�ց�r��l��	)��~�lj#���~�SP[�_3�-K	8�c����I����pQ���w���Bu�ad�0��~�����F�ց��h {�(�2r��Im��5��Pm�`�W{�����d@��#��\T�8�#��UX�<� �T>�,Mi����8h�[��'�'X�u�y�!�Q�u���ɨ�Y�SV��Y_�t����`y����f��A����a������$�EQ�4�� ��<��� ��Ѱ�cu�f�jgK����t�
���z�m60�;���X��'hM0$�0_&e�7^$��O�H���?tu�zڦAt�x�T�lUvQw9�e_-�i��DD��7#�	�
LN*v3�`������F�sF�$X�GsA\B���zk��~��y�l�h�sq�X6{��!4�_=W     