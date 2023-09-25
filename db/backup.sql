--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6
-- Dumped by pg_dump version 14.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: activity_log; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.activity_log (
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


ALTER TABLE public.activity_log OWNER TO root;

--
-- Name: activity_log_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.activity_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activity_log_id_seq OWNER TO root;

--
-- Name: activity_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.activity_log_id_seq OWNED BY public.activity_log.id;


--
-- Name: ba; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.ba (
    id bigint NOT NULL,
    file character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.ba OWNER TO root;

--
-- Name: ba_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.ba_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ba_id_seq OWNER TO root;

--
-- Name: ba_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.ba_id_seq OWNED BY public.ba.id;


--
-- Name: boqs; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.boqs (
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


ALTER TABLE public.boqs OWNER TO root;

--
-- Name: boqs_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.boqs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boqs_id_seq OWNER TO root;

--
-- Name: boqs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.boqs_id_seq OWNED BY public.boqs.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    cat_id character varying(255) NOT NULL,
    cat_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.categories OWNER TO root;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO root;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: certifications; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.certifications (
    id bigint NOT NULL,
    cert_title character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    expired_date date NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.certifications OWNER TO root;

--
-- Name: certifications_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.certifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.certifications_id_seq OWNER TO root;

--
-- Name: certifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.certifications_id_seq OWNED BY public.certifications.id;


--
-- Name: coi_activities; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.coi_activities (
    id bigint NOT NULL,
    coi_id bigint NOT NULL,
    user_id bigint NOT NULL,
    activity character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    notes character varying(255)
);


ALTER TABLE public.coi_activities OWNER TO root;

--
-- Name: coi_activities_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.coi_activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coi_activities_id_seq OWNER TO root;

--
-- Name: coi_activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.coi_activities_id_seq OWNED BY public.coi_activities.id;


--
-- Name: coi_templates; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.coi_templates (
    id bigint NOT NULL,
    equipment character varying(255) NOT NULL,
    template text NOT NULL,
    technical jsonb,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    additional jsonb
);


ALTER TABLE public.coi_templates OWNER TO root;

--
-- Name: coi_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.coi_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coi_templates_id_seq OWNER TO root;

--
-- Name: coi_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.coi_templates_id_seq OWNED BY public.coi_templates.id;


--
-- Name: cois; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.cois (
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


ALTER TABLE public.cois OWNER TO root;

--
-- Name: cois_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.cois_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cois_id_seq OWNER TO root;

--
-- Name: cois_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.cois_id_seq OWNED BY public.cois.id;


--
-- Name: delivery_orders; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.delivery_orders (
    id bigint NOT NULL,
    do_no character varying(255) NOT NULL,
    company_name character varying(255) NOT NULL,
    project_value character varying(255) NOT NULL,
    do_date date NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.delivery_orders OWNER TO root;

--
-- Name: delivery_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.delivery_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.delivery_orders_id_seq OWNER TO root;

--
-- Name: delivery_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.delivery_orders_id_seq OWNED BY public.delivery_orders.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO root;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO root;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: job_executors; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.job_executors (
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


ALTER TABLE public.job_executors OWNER TO root;

--
-- Name: job_executors_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.job_executors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_executors_id_seq OWNER TO root;

--
-- Name: job_executors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.job_executors_id_seq OWNED BY public.job_executors.id;


--
-- Name: job_status; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.job_status (
    id bigint NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.job_status OWNER TO root;

--
-- Name: job_status_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.job_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_status_id_seq OWNER TO root;

--
-- Name: job_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.job_status_id_seq OWNED BY public.job_status.id;


--
-- Name: map_boq_coi; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.map_boq_coi (
    boq_id integer NOT NULL,
    coi_id integer NOT NULL,
    status integer,
    reviewer_1 bigint NOT NULL,
    reviewer_2 bigint NOT NULL,
    approval bigint NOT NULL
);


ALTER TABLE public.map_boq_coi OWNER TO root;

--
-- Name: map_boq_dos; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.map_boq_dos (
    id bigint NOT NULL,
    boq_id integer NOT NULL,
    do_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.map_boq_dos OWNER TO root;

--
-- Name: map_boq_dos_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.map_boq_dos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.map_boq_dos_id_seq OWNER TO root;

--
-- Name: map_boq_dos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.map_boq_dos_id_seq OWNED BY public.map_boq_dos.id;


--
-- Name: map_boq_je; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.map_boq_je (
    id bigint NOT NULL,
    boq_id integer NOT NULL,
    je_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.map_boq_je OWNER TO root;

--
-- Name: map_boq_je_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.map_boq_je_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.map_boq_je_id_seq OWNER TO root;

--
-- Name: map_boq_je_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.map_boq_je_id_seq OWNED BY public.map_boq_je.id;


--
-- Name: map_boq_sos; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.map_boq_sos (
    id bigint NOT NULL,
    boq_id integer NOT NULL,
    sos_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.map_boq_sos OWNER TO root;

--
-- Name: map_boq_sos_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.map_boq_sos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.map_boq_sos_id_seq OWNER TO root;

--
-- Name: map_boq_sos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.map_boq_sos_id_seq OWNED BY public.map_boq_sos.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO root;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO root;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: model_has_permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.model_has_permissions (
    permission_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_permissions OWNER TO root;

--
-- Name: model_has_roles; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.model_has_roles (
    role_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_roles OWNER TO root;

--
-- Name: notifications; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.notifications (
    id uuid NOT NULL,
    type character varying(255) NOT NULL,
    notifiable_type character varying(255) NOT NULL,
    notifiable_id bigint NOT NULL,
    data text NOT NULL,
    read_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.notifications OWNER TO root;

--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO root;

--
-- Name: permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.permissions OWNER TO root;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO root;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: purchase_orders; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.purchase_orders (
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


ALTER TABLE public.purchase_orders OWNER TO root;

--
-- Name: purchase_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.purchase_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_orders_id_seq OWNER TO root;

--
-- Name: purchase_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.purchase_orders_id_seq OWNED BY public.purchase_orders.id;


--
-- Name: role_has_permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.role_has_permissions (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.role_has_permissions OWNER TO root;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO root;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO root;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: sos; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sos (
    id bigint NOT NULL,
    sos_no character varying(255) NOT NULL,
    branch_name character varying(255) NOT NULL,
    value character varying(255) NOT NULL,
    sos_date character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.sos OWNER TO root;

--
-- Name: sos_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.sos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sos_id_seq OWNER TO root;

--
-- Name: sos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.sos_id_seq OWNED BY public.sos.id;


--
-- Name: spks; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.spks (
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


ALTER TABLE public.spks OWNER TO root;

--
-- Name: spks_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.spks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spks_id_seq OWNER TO root;

--
-- Name: spks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.spks_id_seq OWNED BY public.spks.id;


--
-- Name: types; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.types (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    user_input character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.types OWNER TO root;

--
-- Name: types_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.types_id_seq OWNER TO root;

--
-- Name: types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.types_id_seq OWNED BY public.types.id;


--
-- Name: uploads_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.uploads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.uploads_id_seq OWNER TO root;

--
-- Name: uploads; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.uploads (
    id bigint DEFAULT nextval('public.uploads_id_seq'::regclass) NOT NULL,
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


ALTER TABLE public.uploads OWNER TO root;

--
-- Name: user_details; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_details (
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


ALTER TABLE public.user_details OWNER TO root;

--
-- Name: user_details_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.user_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_details_id_seq OWNER TO root;

--
-- Name: user_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.user_details_id_seq OWNED BY public.user_details.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.users (
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


ALTER TABLE public.users OWNER TO root;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO root;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: vw_all_data; Type: VIEW; Schema: public; Owner: root
--

CREATE VIEW public.vw_all_data AS
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


ALTER TABLE public.vw_all_data OWNER TO root;

--
-- Name: activity_log id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.activity_log ALTER COLUMN id SET DEFAULT nextval('public.activity_log_id_seq'::regclass);


--
-- Name: ba id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ba ALTER COLUMN id SET DEFAULT nextval('public.ba_id_seq'::regclass);


--
-- Name: boqs id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.boqs ALTER COLUMN id SET DEFAULT nextval('public.boqs_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: certifications id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.certifications ALTER COLUMN id SET DEFAULT nextval('public.certifications_id_seq'::regclass);


--
-- Name: coi_activities id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.coi_activities ALTER COLUMN id SET DEFAULT nextval('public.coi_activities_id_seq'::regclass);


--
-- Name: coi_templates id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.coi_templates ALTER COLUMN id SET DEFAULT nextval('public.coi_templates_id_seq'::regclass);


--
-- Name: cois id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cois ALTER COLUMN id SET DEFAULT nextval('public.cois_id_seq'::regclass);


--
-- Name: delivery_orders id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.delivery_orders ALTER COLUMN id SET DEFAULT nextval('public.delivery_orders_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: job_executors id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.job_executors ALTER COLUMN id SET DEFAULT nextval('public.job_executors_id_seq'::regclass);


--
-- Name: job_status id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.job_status ALTER COLUMN id SET DEFAULT nextval('public.job_status_id_seq'::regclass);


--
-- Name: map_boq_dos id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.map_boq_dos ALTER COLUMN id SET DEFAULT nextval('public.map_boq_dos_id_seq'::regclass);


--
-- Name: map_boq_je id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.map_boq_je ALTER COLUMN id SET DEFAULT nextval('public.map_boq_je_id_seq'::regclass);


--
-- Name: map_boq_sos id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.map_boq_sos ALTER COLUMN id SET DEFAULT nextval('public.map_boq_sos_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: purchase_orders id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.purchase_orders ALTER COLUMN id SET DEFAULT nextval('public.purchase_orders_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: sos id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sos ALTER COLUMN id SET DEFAULT nextval('public.sos_id_seq'::regclass);


--
-- Name: spks id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.spks ALTER COLUMN id SET DEFAULT nextval('public.spks_id_seq'::regclass);


--
-- Name: types id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.types ALTER COLUMN id SET DEFAULT nextval('public.types_id_seq'::regclass);


--
-- Name: user_details id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_details ALTER COLUMN id SET DEFAULT nextval('public.user_details_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: activity_log; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.activity_log (id, log_name, description, subject_type, subject_id, causer_type, causer_id, properties, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: ba; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.ba (id, file, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: boqs; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.boqs (id, project_type, equipment, tag_number, contract_value, size, dimension, capacity, po_id, note, created_at, updated_at, edited_value) FROM stdin;
1	1	Peralatan Putar	-	17000000	-	-	-	1	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
2	2	Bejana Tekan	-	3770000	>50 m3	-	-	1	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
3	2	Bejana Tekan	-	3770000	>50 m3	-	-	1	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
4	1	Peralatan Listrik	MCC-01	23500000	-	-	-	1	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
5	1	Peralatan Putar	P-02	17000000	-	-	-	1	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
6	1	Peralatan Putar	P-01	17000000	-	-	-	1	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
7	1	Peralatan Putar	P-03	17000000	-	-	-	1	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
8	1	Katup Pengaman	PRV-01	6000000	2" < Dia < 6"	-	-	1	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
9	1	Peralatan Listrik	G-01	24000000	-	-	-	1	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
10	1	Katup Pengaman	PRV-02	6000000	2" < Dia < 6"	-	-	1	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
11	1	Katup Pengaman	PRV-03	6000000	2" < Dia < 6"	-	-	1	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
12	2	Bejana Tekan	T-01	3632898	<5 m3	-	-	1	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
13	2	Bejana Tekan	T-02	3632898	<5 m3	-	-	1	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
14	2	Bejana Tekan	T-03	3770000	>50 m3	-	-	1	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
15	2	Bejana Tekan	T-04	3770000	>50 m3	-	-	1	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
17	2	Tangki Penimbun	TANGKI T-1	45000000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
18	2	Tangki Penimbun	TANGKI T-2	45000000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
19	2	Tangki Penimbun	TANGKI T-3	45000000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
20	2	Tangki Penimbun	TANGKI T-4	45000000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
21	2	Tangki Penimbun	TANGKI T-5	45000000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
22	2	Tangki Penimbun	TANGKI T-6	45000000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
23	2	Tangki Penimbun	TANGKI T-7	45000000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
24	2	Tangki Penimbun	TANGKI T-8	45000000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
25	2	Tangki Penimbun	TANGKI T-9	45000000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
26	2	Tangki Penimbun	TANGKI T-10	45000000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
27	2	Tangki Penimbun	TANGKI T-11	45000000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
28	2	Tangki Penimbun	TANGKI T-13	45000000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
29	2	Tangki Penimbun	TANGKI T-14	45000000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
30	2	Tangki Penimbun	TANGKI T-15	45000000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
31	2	Tangki Penimbun	TANGKI T-17	45000000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
32	2	Peralatan Putar	P14	2720000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
33	2	Peralatan Putar	P1A	2720000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
34	1	Peralatan Putar	P1B	2720000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
35	2	Peralatan Putar	P11	2720000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
36	2	Peralatan Putar	P2A	2720000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
37	2	Peralatan Putar	P2B	2720000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
38	2	Peralatan Putar	P2C	2720000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
39	2	Peralatan Putar	P3A	2720000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
40	2	Peralatan Putar	P3B	2720000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
41	2	Peralatan Putar	P3C	2720000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
42	2	Peralatan Putar	P4A	2720000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
43	2	Peralatan Putar	P4B	2720000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
44	2	Peralatan Putar	P4C	2720000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
45	1	Peralatan Putar	P6A	2720000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
46	2	Peralatan Putar	P10	2720000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
47	2	Peralatan Putar	P5A	2720000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
48	1	Peralatan Putar	MFO-3	2720000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
49	1	Peralatan Putar	P6B	2720000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
50	1	Peralatan Putar	MFO Diesel-1	2720000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
51	2	Peralatan Listrik	Generator 2	2720000	-	-	-	2	-	2023-02-05 07:45:28	2023-02-05 07:45:28	\N
69	1	Bejana Tekan	Strainer	13938400	<5 m3	-	-	3	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
16	5	Instalasi	Depot Pengisian Pesawat Udara	86000000	-	-	-	1	-	2023-02-05 07:45:28	2023-02-05 09:18:14	\N
52	1	Bejana Tekan	Filter	13938400	<5 m3	-	-	3	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
53	1	Bejana Tekan	Filter	13938400	<5 m3	-	-	3	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
54	1	Bejana Tekan	Strainer	13938400	<5 m3	-	-	3	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
55	1	Bejana Tekan	Strainer	13938400	<5 m3	-	-	3	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
56	1	Bejana Tekan	Strainer	13938400	<5 m3	-	-	3	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
57	1	Bejana Tekan	Strainer	13938400	<5 m3	-	-	3	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
58	1	Bejana Tekan	Strainer	13938400	<5 m3	-	-	3	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
59	1	Bejana Tekan	Strainer	13938400	<5 m3	-	-	3	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
60	1	Bejana Tekan	Strainer	13938400	<5 m3	-	-	3	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
61	1	Bejana Tekan	Strainer	13938400	<5 m3	-	-	3	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
62	1	Bejana Tekan	Strainer	13938400	<5 m3	-	-	3	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
63	1	Bejana Tekan	Strainer	13938400	<5 m3	-	-	3	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
64	1	Bejana Tekan	Strainer	13938400	<5 m3	-	-	3	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
65	1	Bejana Tekan	Strainer	13938400	<5 m3	-	-	3	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
66	1	Bejana Tekan	Strainer	13938400	<5 m3	-	-	3	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
67	1	Bejana Tekan	Strainer	13938400	<5 m3	-	-	3	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
68	1	Bejana Tekan	Strainer	13938400	<5 m3	-	-	3	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
70	1	Bejana Tekan	Strainer	13938400	<5 m3	-	-	3	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
71	1	Tangki Penimbun	T-1	13856188	15m<Dia<36m	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
72	1	Tangki Penimbun	T-2	13856188	< 15 M	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
73	1	Tangki Penimbun	T-3	13856188	15m<Dia<36m	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
74	1	Tangki Penimbun	T-4	13856188	15m<Dia<36m	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
75	1	Tangki Penimbun	T-5	13856188	< 15 M	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
76	1	Tangki Penimbun	T-6	13856188	< 15 M	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
77	1	Tangki Penimbun	T-7	13856188	15m<Dia<36m	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
78	1	Tangki Penimbun	T-8	13856188	15m<Dia<36m	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
79	1	Tangki Penimbun	T-9	13856188	< 15 M	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
80	1	Tangki Penimbun	T - 10	13856188	15m<Dia<36m	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
81	1	Tangki Penimbun	T - 11	13856188	15m<Dia<36m	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
82	1	Tangki Penimbun	T - 12	13856188	< 15 M	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
83	1	Tangki Penimbun	T - 13	13856188	15m<Dia<36m	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
84	1	Peralatan Putar	P - 10	2720000	-	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
85	1	Peralatan Putar	P-09	2720000	-	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
86	1	Peralatan Putar	P-08	2720000	-	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
87	1	Peralatan Putar	P-07	2720000	-	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
88	1	Peralatan Putar	P-06	2720000	-	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
89	1	Peralatan Putar	P-05	2720000	-	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
90	1	Peralatan Putar	P-04	2720000	-	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
91	1	Peralatan Putar	P-03	2720000	-	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
92	1	Peralatan Putar	P-02	2720000	-	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
93	1	Peralatan Putar	P-01	2720000	-	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
94	1	Peralatan Listrik	DEG-01	23500000	-	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
95	1	Peralatan Listrik	G-02	23500000	-	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
96	1	Peralatan Listrik	DEG-02	0	-	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
97	1	Peralatan Listrik	DEG-03	23500000	-	-	-	4	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
98	1	Katup Pengaman	PRV-T-5-01	1400000	<2 "	-	-	5	-	2023-02-05 09:49:55	2023-02-05 09:49:55	\N
99	1	Katup Pengaman	PRV-T-13-01	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
100	1	Katup Pengaman	PRV-T-13-02	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
101	1	Katup Pengaman	PRV-T-11-02	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
102	1	Katup Pengaman	PRV-T-11-01	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
103	1	Katup Pengaman	PRV-T-2-01	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
104	1	Katup Pengaman	PRV-T-8-01	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
105	1	Katup Pengaman	PRV-T-8-02	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
106	1	Katup Pengaman	PRV-T-9-02 -B	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
107	1	Katup Pengaman	PRV-T-9-01 -A	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
108	1	Katup Pengaman	PRV-T-1-01	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
109	1	Katup Pengaman	PRV-T-1-02	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
110	1	Katup Pengaman	PRV-T-3-01	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
111	1	Katup Pengaman	PRV-T-3-02	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
112	1	Katup Pengaman	PRV-T-14-01	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
113	1	Katup Pengaman	PRV-T-14-02	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
114	1	Katup Pengaman	PRV-P-10	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
115	1	Katup Pengaman	PRV-P-02	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
116	1	Katup Pengaman	PRV-T- 6-2-Spare	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
117	1	Katup Pengaman	PRV-T-Spare	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
118	1	Katup Pengaman	PRV-VF-002	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
119	1	Katup Pengaman	PRV-VF-001	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
120	1	Katup Pengaman	PRV-P-003	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
121	1	Katup Pengaman	PRV-P-004	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
122	1	Katup Pengaman	PRV-P-005	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
123	1	Katup Pengaman	PRV-P-006	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
124	1	Katup Pengaman	PRV-P-007	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
125	1	Katup Pengaman	PRV-P-008	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
126	1	Katup Pengaman	PRV-P-001	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
127	1	Katup Pengaman	PRV-T-10-1	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
128	1	Katup Pengaman	PRV-T-10-2	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
129	1	Katup Pengaman	PRV-T-7-1-A	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
130	1	Katup Pengaman	PRV-T-7-2-B	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
131	1	Katup Pengaman	PRV-T-7-12-1	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
132	1	Katup Pengaman	PRV-T-7-12-2	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
133	1	Katup Pengaman	PRV-T-4-1	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
134	1	Katup Pengaman	PRV-T-4-2	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
135	1	Katup Pengaman	PRV-T-2-2	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
136	1	Katup Pengaman	PRV-T-6-1	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
137	1	Katup Pengaman	PRV-T-6-2	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
138	1	Katup Pengaman	PRV-P-08-Soare	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
139	1	Katup Pengaman	PVV-T-14-1	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
140	1	Katup Pengaman	PVV-T-3-1	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
141	1	Katup Pengaman	PVV-T-4-1	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
142	1	Katup Pengaman	PVV-T-5-1	1400000	2" < Dia <6"	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
143	1	Katup Pengaman	PVV-T-7-1	1400000	2" < Dia <6"	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
144	1	Katup Pengaman	PVV-T-7-2	1400000	2" < Dia <6"	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
145	1	Katup Pengaman	PVV-T-9-1	1400000	2" < Dia <6"	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
146	1	Katup Pengaman	PVV-T-9- 1-Spare	1400000	2" < Dia <6"	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
147	1	Katup Pengaman	PVV-T-5-1-Spare	1400000	2" < Dia <6"	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
148	1	Katup Pengaman	PRV-T-5-02	1400000	<2 "	-	-	5	-	2023-02-05 09:49:56	2023-02-05 09:49:56	\N
149	5	Instalasi	Instalasi FT Jayapura	185000000	-	-	-	5	-	2023-02-06 02:21:37	2023-02-06 02:21:37	\N
151	2	Katup Pengaman	PSV-T-06-A	1395000	<2 "	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
152	2	Katup Pengaman	PSV-T-06-B	1395000	<2 "	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
153	2	Katup Pengaman	PSV-T-05-A	1395000	<2 "	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
154	2	Katup Pengaman	PSV-T-05-B	1395000	<2 "	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
155	2	Katup Pengaman	PSV-T-04-B	1395000	<2 "	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
156	2	Katup Pengaman	PSV-T-04-C	1395000	<2 "	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
157	2	Katup Pengaman	PSV-T-18-A	1395000	<2 "	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
158	2	Katup Pengaman	PSV-T-18-B	1395000	<2 "	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
159	2	Katup Pengaman	PSV-T-15--B	1395000	<2 "	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
160	2	Katup Pengaman	PSV-T-15--A	1395000	<2 "	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
161	2	Katup Pengaman	PSV-T-16--B	1395000	<2 "	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
162	2	Katup Pengaman	PSV-T-16--A	1395000	<2 "	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
163	2	Katup Pengaman	PSV-T-09--B	1395000	<2 "	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
164	2	Katup Pengaman	PSV-T-09--A	1395000	<2 "	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
165	2	Katup Pengaman	PSV-T-13-B	1395000	<2 "	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
166	2	Katup Pengaman	PSV-T-13-A	1395000	<2 "	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
167	2	Katup Pengaman	PSV-T-14-B	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
168	2	Katup Pengaman	PSV-T-14-A	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
169	2	Katup Pengaman	PSV-T-17--B	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
170	2	Katup Pengaman	PSV-T-17--A	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
171	2	Katup Pengaman	PSV-T-02--A	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
172	2	Katup Pengaman	PSV-T-02--B	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
173	2	Katup Pengaman	PSV-P-06--A	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
174	2	Katup Pengaman	PSV-P-06--B	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
175	2	Katup Pengaman	PSV-P-08	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
176	2	Katup Pengaman	PSV-P-06--C	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
177	2	Katup Pengaman	PSV-P-05--A	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
178	2	Katup Pengaman	PSV-P-14	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
179	2	Katup Pengaman	PSV-PL-01	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
180	2	Katup Pengaman	PSV-P-02-A	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
181	2	Katup Pengaman	PSV-PL-01	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
182	2	Katup Pengaman	PSV-PL-02	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
183	2	Katup Pengaman	PSV-PL-03	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
184	2	Katup Pengaman	PSV-Discharge-01	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
185	2	Katup Pengaman	PSV-Discharge-02	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
186	2	Katup Pengaman	PSV-Discharge-03	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
187	2	Katup Pengaman	PSV-T-11	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
188	2	Katup Pengaman	PSV-T-03	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
189	2	Katup Pengaman	PSV-T-06-C	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
190	2	Katup Pengaman	PSV-T-01	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
191	2	Katup Pengaman	PSV-T-04-A	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
192	2	Katup Pengaman	PSV-T-09-C	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
193	2	Katup Pengaman	PSV-T-10	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
194	2	Katup Pengaman	PSV-T-07	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
195	2	Katup Pengaman	PSV-T-08	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
196	2	Katup Pengaman	PVV-T-03-A	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
197	2	Katup Pengaman	PVV-T-03-B	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
198	2	Katup Pengaman	PVV-T-03-C	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
199	2	Katup Pengaman	PVV-T-17	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
200	2	Katup Pengaman	PVV-T-02-A	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
201	2	Katup Pengaman	PVV-T-02-B	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
202	2	Katup Pengaman	PVV-T-02-C	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
203	2	Katup Pengaman	PVV-T-04-A	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
204	2	Katup Pengaman	PVV-T-04-B	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
205	2	Katup Pengaman	PVV-T-04-C	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
206	2	Katup Pengaman	PVV-T-16	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
207	2	Katup Pengaman	PVV-T-05	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:12	2023-02-22 02:17:12	\N
208	2	Katup Pengaman	PVV-T-14-A	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:13	2023-02-22 02:17:13	\N
209	2	Katup Pengaman	PVV-T-14-B	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:13	2023-02-22 02:17:13	\N
210	2	Katup Pengaman	PVV-T-19	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:13	2023-02-22 02:17:13	\N
211	2	Katup Pengaman	PVV-T-20	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:13	2023-02-22 02:17:13	\N
212	2	Katup Pengaman	PSV-07A	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:13	2023-02-22 02:17:13	\N
213	2	Katup Pengaman	PSV-T-20 A	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:13	2023-02-22 02:17:13	\N
214	2	Katup Pengaman	PSV-T-20 B	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:13	2023-02-22 02:17:13	\N
215	2	Katup Pengaman	PSV-T-19 A	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:13	2023-02-22 02:17:13	\N
216	2	Katup Pengaman	PSV-T-19 B	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:13	2023-02-22 02:17:13	\N
217	2	Katup Pengaman	PSV-Discharge-04	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:13	2023-02-22 02:17:13	\N
218	2	Katup Pengaman	PSV-PL-04	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:13	2023-02-22 02:17:13	\N
219	2	Katup Pengaman	PSV-P-1A	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:13	2023-02-22 02:17:13	\N
220	2	Katup Pengaman	-	1395000	2" < Dia <6"	-	-	7	-	2023-02-22 02:17:13	2023-02-22 02:17:13	\N
221	1	Tangki Penimbun	T-16	45000000	15m < Dia < 36m	-	-	7	-	2023-02-22 02:17:13	2023-02-22 02:17:13	\N
222	1	Tangki Penimbun	T-18	45000000	15m < Dia < 36m	-	-	7	-	2023-02-22 02:17:13	2023-02-22 02:17:13	\N
223	1	Tangki Penimbun	T-19	45000000	15m < Dia < 36m	-	-	7	-	2023-02-22 02:17:13	2023-02-22 02:17:13	\N
224	1	Tangki Penimbun	T-20	45000000	36m < Dia < 60m	-	-	7	-	2023-02-22 02:17:13	2023-02-22 02:17:13	\N
225	1	Pesawat Angkat	OHC-Pump Station	14700000	<= 25 Ton	-	-	7	-	2023-02-22 02:17:13	2023-02-22 02:17:13	\N
226	1	Pesawat Angkat	OHC-Workshop	14700000	<= 25 Ton	-	-	7	-	2023-02-22 02:17:13	2023-02-22 02:17:13	\N
227	5	Instalasi FT Wayame	IT Wayame	90000000	-	-	-	7	-	2023-02-22 02:17:13	2023-02-22 02:17:13	\N
228	1	Bejana Tekan Vol < 5m3	IT Wayame	13938400	< 5m3	-	-	7	-	2023-02-22 02:17:13	2023-02-22 04:01:23	\N
229	1	Bejana Tekan Vol < 5m3	Strainer 	13938400	< 5m3	-	-	7	-	2023-02-22 02:17:13	2023-02-22 04:01:23	\N
230	1	Bejana Tekan Vol < 5m3	Strainer 	13938400	< 5m3	-	-	7	-	2023-02-22 02:17:13	2023-02-22 04:01:23	\N
231	1	Bejana Tekan Vol < 5m3	Filter	13938400	< 5m3	-	-	7	-	2023-02-22 02:17:13	2023-02-22 04:01:23	\N
232	1	Bejana Tekan Vol < 5m3	Filter	13938400	< 5m3	-	-	7	-	2023-02-22 02:17:13	2023-02-22 04:01:23	\N
233	1	Bejana Tekan Vol < 5m3	Filter	13938400	< 5m3	-	-	7	-	2023-02-22 02:17:13	2023-02-22 04:01:23	\N
234	1	Bejana Tekan Vol < 5m3	Filter	13938400	< 5m3	-	-	7	-	2023-02-22 02:17:13	2023-02-22 04:01:23	\N
2213	5	Instalasi	-	80000000	-	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2214	1	Katup Pengaman	-	1395000	Dia < 2 "	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2215	1	Katup Pengaman	-	1395000	Dia < 2 "	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2216	1	Katup Pengaman	-	1395000	Dia < 2 "	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2217	1	Katup Pengaman	-	1395000	Dia < 2 "	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2218	1	Katup Pengaman	-	1395000	2" < Dia < 8"	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2219	1	Katup Pengaman	-	1395000	2" < Dia < 8"	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2220	1	Katup Pengaman	-	1395000	2" < Dia < 8"	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2221	1	Katup Pengaman	-	1395000	2" < Dia < 8"	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2222	1	Katup Pengaman	-	1395000	2" < Dia < 8"	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2223	1	Katup Pengaman	-	1395000	2" < Dia < 8"	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2224	1	Katup Pengaman	-	1395000	2" < Dia < 8"	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2225	1	Katup Pengaman	-	1395000	2" < Dia < 8"	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2226	1	Metering	-	6000000	-	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2227	1	Metering	-	6000000	-	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2228	1	Metering	-	6000000	-	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2229	1	Metering	-	6000000	-	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2230	1	Metering	-	6000000	-	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2231	1	Metering	-	6000000	-	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2232	1	Metering	-	6000000	-	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2233	1	Metering	-	6000000	-	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2234	1	Metering	-	6000000	-	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2235	1	Metering	-	6000000	-	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2236	1	Metering	-	6000000	-	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2237	1	Metering	-	6000000	-	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2238	1	Metering	-	6000000	-	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2239	1	Metering	-	6000000	-	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2240	1	Metering	-	6000000	-	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2241	1	Metering	-	6000000	-	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2242	2	Peralatan Putar	-	2720000	-	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2243	1	Tangki Penimbun	-	13856188	15m < Dia < 36m	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2244	1	Tangki Penimbun	-	13856188	15m < Dia < 36m	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2245	2	Peralatan Listrik	-	1340000	-	-	-	30	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2246	5	Instalasi	-	80000000	-	-	-	31	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2247	1	Katup Pengaman	-	1395000	Dia < 2"	-	-	31	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2248	1	Katup Pengaman	-	1395000	Dia < 2"	-	-	31	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2249	1	Katup Pengaman	-	1395000	Dia < 2"	-	-	31	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2250	1	Katup Pengaman	-	1395000	Dia < 2"	-	-	31	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2251	1	Katup Pengaman	-	1395000	2" < Dia 8"	-	-	31	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2252	1	Katup Pengaman	-	1395000	2" < Dia 8"	-	-	31	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2253	1	Metering	-	6000000	-	-	-	31	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2254	1	Metering	-	6000000	-	-	-	31	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2255	1	Metering	-	6000000	-	-	-	31	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2256	1	Metering	-	6000000	-	-	-	31	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2257	1	Metering	-	6000000	-	-	-	31	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2258	1	Metering	-	6000000	-	-	-	31	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2259	1	Metering	-	6000000	-	-	-	31	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2260	1	Metering	-	6000000	-	-	-	31	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2261	1	Metering	-	6000000	-	-	-	31	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2262	1	Metering	-	6000000	-	-	-	31	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2263	1	Metering	-	6000000	-	-	-	31	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2264	1	Metering	-	6000000	-	-	-	31	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2265	5	Instalasi	-	80000000	-	-	-	33	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2266	1	Metering	-	6000000	-	-	-	33	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2267	1	Metering	-	6000000	-	-	-	33	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2268	1	Metering	-	6000000	-	-	-	33	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2269	1	Metering	-	6000000	-	-	-	33	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2270	1	Metering	-	6000000	-	-	-	33	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2271	1	Metering	-	6000000	-	-	-	33	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2272	1	Metering	-	6000000	-	-	-	33	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2273	1	Metering	-	6000000	-	-	-	33	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2274	1	Metering	-	6000000	-	-	-	33	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2275	1	Bejana Tekan	-	3632898	25 m3 < Vol < 50 m3	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2276	1	Bejana Tekan	-	3632898	26 m3 < Vol < 50 m3	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2277	1	Bejana Tekan	-	3632898	Vol > 50 m3	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2278	5	Instalasi	-	80000000	-	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2279	1	Katup Pengaman	-	1395000	Dia < 2"	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2280	1	Katup Pengaman	-	1395000	Dia < 2"	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2281	1	Katup Pengaman	-	1395000	Dia < 2"	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2282	1	Katup Pengaman	-	1395000	Dia < 2"	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2283	1	Katup Pengaman	-	1395000	Dia < 2"	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2284	1	Katup Pengaman	-	1395000	2" < Dia < 8"	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2285	1	Katup Pengaman	-	1395000	2" < Dia < 8"	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2286	1	Katup Pengaman	-	1395000	2" < Dia < 8"	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2287	1	Katup Pengaman	-	1395000	2" < Dia < 8"	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2288	1	Katup Pengaman	-	1395000	2" < Dia < 8"	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2289	1	Katup Pengaman	-	1395000	2" < Dia < 8"	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2290	1	Katup Pengaman	-	1395000	2" < Dia < 8"	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2291	1	Katup Pengaman	-	1395000	2" < Dia < 8"	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2292	1	Katup Pengaman	-	1395000	2" < Dia < 8"	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2293	1	Katup Pengaman	-	1395000	2" < Dia < 8"	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2294	1	Metering	-	6000000	-	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2295	1	Metering	-	6000000	-	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2296	1	Metering	-	6000000	-	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2297	1	Metering	-	6000000	-	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2298	1	Metering	-	6000000	-	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2299	1	Metering	-	6000000	-	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2300	1	Metering	-	6000000	-	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2301	1	Metering	-	6000000	-	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2302	1	Metering	-	6000000	-	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2303	1	Metering	-	6000000	-	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2304	1	Metering	-	6000000	-	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2305	1	Metering	-	6000000	-	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2306	1	Metering	-	6000000	-	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2307	1	Metering	-	6000000	-	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2308	1	Metering	-	6000000	-	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2309	1	Metering	-	6000000	-	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2310	1	Metering	-	6000000	-	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2311	1	Metering	-	6000000	-	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2312	1	Metering	-	6000000	-	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2313	1	Metering	-	6000000	-	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2314	1	Metering	-	6000000	-	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2315	1	Metering	-	6000000	-	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2316	1	Peralatan Listrik	-	1340000	-	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2317	1	Peralatan Listrik	-	1340000	-	-	-	36	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2318	1	Bejana Tekan	-	3632898	-	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2319	2	Bejana Tekan	-	3632898	25 m3 < Vol < 50 m3	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2320	2	Bejana Tekan	-	3632898	25 m3 < Vol < 50 m3	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2321	2	Bejana Tekan	-	3632898	Vol > 50 m3	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2322	2	Bejana Tekan	-	3632898	Vol > 50 m3	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2323	2	Peralatan Listrik	-	1640000	-	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2324	5	Instalasi	-	80000000	-	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2325	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2326	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2327	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2328	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2329	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2330	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2331	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2332	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2333	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2334	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2335	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2336	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2337	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2338	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2339	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2340	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2341	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2342	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2343	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2344	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2345	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2346	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2347	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2348	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2349	2	Peralatan Listrik	-	17000000	-	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2350	2	Peralatan Listrik	-	17000000	-	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2351	2	Peralatan Listrik	-	17000000	-	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2352	2	Peralatan Listrik	-	17000000	-	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2353	1	Metering	-	6000000	-	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2354	1	Metering	-	6000000	-	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2355	2	Peralatan Putar	-	17000000	-	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2356	2	Peralatan Putar	-	17000000	-	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2357	2	Peralatan Putar	-	17000000	-	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2358	2	Peralatan Putar	-	17000000	-	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2359	2	Peralatan Putar	-	17000000	-	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2360	2	Peralatan Putar	-	17000000	-	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2361	2	Peralatan Putar	-	17000000	-	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2362	2	Peralatan Putar	-	17000000	-	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2363	2	Peralatan Putar	-	17000000	-	-	-	37	-	2023-02-22 07:56:36	2023-02-22 07:56:36	\N
2364	1	Peralatan Listrik	-	1340000	-	-	-	37	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2365	1	Peralatan Listrik	-	1340000	-	-	-	37	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2366	5	Instalasi	-	80000000	-	-	-	45	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2367	1	Metering	-	6000000	-	-	-	45	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2368	1	Metering	-	6000000	-	-	-	45	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2369	1	Metering	-	6000000	-	-	-	45	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2370	1	Metering	-	6000000	-	-	-	45	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2371	1	Metering	-	6000000	-	-	-	45	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2372	1	Metering	-	6000000	-	-	-	45	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2373	1	Metering	-	6000000	-	-	-	45	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2374	1	Metering	-	6000000	-	-	-	45	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2375	1	Metering	-	6000000	-	-	-	45	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2376	1	Metering	-	6000000	-	-	-	45	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2377	1	Metering	-	6000000	-	-	-	45	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2378	1	Metering	-	6000000	-	-	-	45	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2379	1	Metering	-	6000000	-	-	-	45	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2380	1	Metering	-	6000000	-	-	-	45	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2381	1	Metering	-	6000000	-	-	-	45	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2382	1	Metering	-	6000000	-	-	-	45	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2383	1	Metering	-	6000000	-	-	-	45	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2384	1	Metering	-	6000000	-	-	-	45	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2385	1	Metering	-	6000000	-	-	-	45	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2386	1	Metering	-	6000000	-	-	-	45	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2387	1	Metering	-	6000000	-	-	-	45	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2388	1	Metering	-	6000000	-	-	-	45	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2389	1	Metering	-	6000000	-	-	-	45	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2390	1	Peralatan Listrik	-	1340000	-	-	-	45	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2391	2	Bejana Tekan	-	3632898	5 m3 < Vol < 25 m3	-	-	12	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2392	2	Bejana Tekan	-	3632898	5 m3 < Vol < 25 m3	-	-	12	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2393	2	Bejana Tekan	-	3632898	5 m3 < Vol < 25 m3	-	-	12	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2394	2	Bejana Tekan	-	19000000	5 m3 < Vol < 50 m3	-	-	12	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2395	2	Peralatan Listrik	-	1640000	-	-	-	12	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2396	5	Instalasi	-	80000000	-	-	-	12	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2397	5	Instalasi	-	80000000	-	-	-	12	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2398	2	Katup Pengaman	-	1395000	<2 "	-	-	12	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2399	2	Katup Pengaman	-	1395000	<2 "	-	-	12	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2400	2	Katup Pengaman	-	1395000	<2 "	-	-	12	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2401	2	Katup Pengaman	-	1395000	2" < Dia <6"	-	-	12	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2402	1	Katup Pengaman	-	1395000	-	-	-	12	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2403	1	Katup Pengaman	-	1395000	-	-	-	12	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2404	2	Peralatan Putar	-	17000000	-	-	-	12	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2405	2	Peralatan Listrik	-	1340000	-	-	-	12	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2406	2	Peralatan Listrik	-	1340000	-	-	-	12	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2407	2	Peralatan Listrik	-	1340000	-	-	-	12	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2408	2	Bejana Tekan	A237-FS-122 S/N 	3632898	5 m3 < Vol < 25 m3	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2409	2	Bejana Tekan	A237-V-107	3632898	5 m3 < Vol < 25 m3	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2410	2	Bejana Tekan	A237-V-108	3632898	5 m3 < Vol < 25 m3	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2411	2	Peralatan Listrik	G-01	1640000	-	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2412	2	Peralatan Listrik	G-02	1640000	-	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2413	1	Peralatan Listrik	G-03	24000000	-	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2414	1	Peralatan Listrik	G-04	24000000	-	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2415	5	Instalasi	-	80000000	-	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2416	5	Instalasi	-	80000000	-	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2417	5	Instalasi	-	80000000	-	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2418	2	Katup Pengaman	PSV-HP-201	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2419	2	Katup Pengaman	PSV-HP-202	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2420	2	Katup Pengaman	PSV-HP-203	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2421	2	Katup Pengaman	PSV-HP-204	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2422	2	Katup Pengaman	PSV-HP-205	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2423	2	Katup Pengaman	PSV-HP-206	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2424	2	Katup Pengaman	PSV-HP-207	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2425	2	Katup Pengaman	PSV-HP-208	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2426	2	Katup Pengaman	PSV-HP-209	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2427	2	Katup Pengaman	PSV-IT-01	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2428	2	Katup Pengaman	PSV-IT-02	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2429	2	Katup Pengaman	PSV-SP-111A	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2430	2	Katup Pengaman	PSV-SP-112A	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2431	2	Katup Pengaman	PSV-SP-113A	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2432	2	Katup Pengaman	PSV-SP-114A	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2433	2	Katup Pengaman	PSV-SP-111B	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2434	2	Katup Pengaman	PSV-SP-112B	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2435	2	Katup Pengaman	PSV-SP-113B	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2436	2	Katup Pengaman	PSV-SP-114B	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2437	2	Katup Pengaman	PSV-FS-131	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2438	2	Katup Pengaman	PSV-FS-132	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2439	2	Katup Pengaman	PSV-FS-133	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2440	2	Katup Pengaman	PSV-FS-134	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2441	2	Katup Pengaman	PSV-FS-135	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2442	2	Katup Pengaman	PSV-FS-136	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2443	2	Katup Pengaman	PSV-FS-137	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2444	2	Katup Pengaman	PSV-FS-210	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2445	2	Katup Pengaman	PSV-FS-211	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2446	2	Katup Pengaman	PSV-FS-212	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2447	2	Katup Pengaman	100-PSV-104A	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2448	2	Katup Pengaman	100-PSV-104B	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2449	2	Katup Pengaman	PSV-29	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2450	2	Katup Pengaman	PSV-Header-16	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2451	2	Katup Pengaman	PSV-14	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2452	2	Katup Pengaman	PSV-04	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2453	2	Katup Pengaman	PSV-01	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2454	2	Katup Pengaman	PSV-06	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2455	2	Katup Pengaman	PSV-Avgas-01	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2456	2	Katup Pengaman	PSV-Avgas-02	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2457	2	Katup Pengaman	PSV-Avgas-03	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2458	2	Katup Pengaman	100-PSV-151	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2459	2	Katup Pengaman	100-PSV-152	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2460	2	Katup Pengaman	PSV-17	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2461	2	Katup Pengaman	PSV-18	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2462	2	Katup Pengaman	PSV-PR-01	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2463	2	Katup Pengaman	PSV-PL-01	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2464	2	Katup Pengaman	PSV-04	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2465	2	Katup Pengaman	PSV-424	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2466	2	Katup Pengaman	PSV-131	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2467	2	Katup Pengaman	PSV-132	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2468	2	Katup Pengaman	PSV-133	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2469	2	Katup Pengaman	PSV-134	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2470	2	Katup Pengaman	PSV-135	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2471	2	Katup Pengaman	PSV-136	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2472	2	Katup Pengaman	PSV-137	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2473	2	Katup Pengaman	100-PSV-101A	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2474	2	Katup Pengaman	100-PSV-101B	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2475	2	Katup Pengaman	100-PSV-102A	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2476	2	Katup Pengaman	100-PSV-102B	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2477	2	Katup Pengaman	100-PSV-103A	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2478	2	Katup Pengaman	100-PSV-103B	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2479	2	Katup Pengaman	100-PSV-105A	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2480	2	Katup Pengaman	100-PSV-105B	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2481	2	Katup Pengaman	100-PSV-106A	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2482	2	Katup Pengaman	100-PSV-106B	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2909	2	Metering	FM-02	6000000	-	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2483	2	Katup Pengaman	100-PSV-107A	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2484	2	Katup Pengaman	100-PSV-107B	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2485	2	Katup Pengaman	100-PSV-108A	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2486	2	Katup Pengaman	100-PSV-108B	1395000	<2 "	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2487	2	Katup Pengaman	100-PSV-109A	1395000	2" < Dia < 6"	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2488	2	Katup Pengaman	100-PSV-109B	1395000	2" < Dia < 6"	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2489	2	Katup Pengaman	PSV-Header- 17	1395000	2" < Dia < 6"	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2490	2	Katup Pengaman	PSV-pipe line-03	1395000	2" < Dia < 6"	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2491	2	Katup Pengaman	PSV-FS-101	1395000	2" < Dia < 6"	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2492	2	Katup Pengaman	PSV-FS-102	1395000	2" < Dia < 6"	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2493	2	Katup Pengaman	PSV-DT-01	1395000	2" < Dia < 6"	-	-	15	-	2023-02-22 07:56:37	2023-02-22 07:56:37	\N
2494	2	Katup Pengaman	PSV-DT-02	1395000	2" < Dia < 6"	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2495	2	Katup Pengaman	PSV-depan IT 04	1395000	2" < Dia < 6"	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2496	2	Pesawat Angkat	OHC 03	16800000	<=25 Ton	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2497	2	Pesawat Angkat	OHC 04	16800000	<=25 Ton	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2498	2	Pesawat Angkat	OHC 02	16800000	<=25 Ton	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2499	2	Pesawat Angkat	OHC 01	16800000	<=25 Ton	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2500	2	Pesawat Angkat	OHTC-01	16800000	<=25 Ton	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2501	2	Pipa Penyalur	-	55969300	3,5 KM	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2502	2	Pipa Penyalur	-	53269900	3,2 KM	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2503	2	Peralatan Putar	P-111	2720000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2504	2	Peralatan Putar	P-112	2720000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2505	2	Peralatan Putar	P-113	2720000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2506	2	Peralatan Putar	P-114	2720000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2507	2	Peralatan Putar	P-131	2720000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2508	2	Peralatan Putar	P-132	2720000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2509	2	Peralatan Putar	P-133	2720000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2510	2	Peralatan Putar	P-134	2720000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2511	2	Peralatan Putar	P-135	2720000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2512	2	Peralatan Putar	P-136	2720000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2513	2	Peralatan Putar	P-137	2720000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2514	2	Peralatan Putar	P-201	2720000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2515	2	Peralatan Putar	P-202	2720000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2516	2	Peralatan Putar	P-203	2720000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2517	2	Peralatan Putar	P-204	2720000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2518	2	Peralatan Putar	P-205	2720000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2519	2	Peralatan Putar	P-206	2720000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2520	1	Peralatan Putar	P-207	17000000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2521	1	Peralatan Putar	P-208	17000000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2522	1	Peralatan Putar	P-209	17000000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2523	1	Peralatan Putar	P-210	17000000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2524	1	Peralatan Putar	P-211	17000000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2525	1	Peralatan Putar	P-212	17000000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2526	1	Peralatan Putar	-	17000000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2527	2	Peralatan Listrik	Trafo-01	1340000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2528	2	Peralatan Listrik	Trafo-02	1340000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2529	2	Peralatan Listrik	Trafo-03	1340000	-	-	-	15	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2530	2	Metering	FI-AV-001	6000000	-	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2531	2	Metering	FI-BS-001	6000000	-	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2532	2	Metering	FI-BS-002	6000000	-	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2533	2	Metering	FI-PT-001	6000000	-	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2534	2	Metering	FI-PXT-001	6000000	-	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2535	2	Metering	FI-PX-001	6000000	-	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2536	2	Peralatan Listrik	G-01	1640000	-	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2537	2	Peralatan Listrik	G-02	1640000	-	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2538	5	Instalasi	PP BBM	80000000	-	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2539	5	Instalasi	-	80000000	-	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2540	5	Instalasi	Instalasi BBM	80000000	-	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2541	2	Katup Pengaman	PRV-T-02A	1395000	<2 "	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2542	2	Katup Pengaman	PRV-T-04A	1395000	<2 "	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2543	2	Katup Pengaman	PRV-T-04B	1395000	<2 "	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2544	2	Katup Pengaman	PRV-T-06A	1395000	<2 "	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2545	2	Katup Pengaman	PRV-T-06B	1395000	<2 "	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2546	2	Katup Pengaman	PRV-T-07A	1395000	<2 "	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2547	2	Katup Pengaman	PRV-T-07B	1395000	<2 "	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2548	2	Katup Pengaman	PRV-T-08A	1395000	<2 "	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2549	2	Katup Pengaman	PRV-T-08B	1395000	<2 "	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2550	2	Katup Pengaman	PRV-T-09A	1395000	<2 "	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2551	2	Katup Pengaman	PRV-T-09B	1395000	<2 "	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2552	2	Katup Pengaman	PRV-H-10A	1395000	<2 "	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2553	2	Katup Pengaman	PRV-H-10B	1395000	<2 "	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2554	2	Katup Pengaman	PRV-P-04	1395000	<2 "	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2555	2	Katup Pengaman	PRV-P-05	1395000	<2 "	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2556	2	Katup Pengaman	PRV-P-06	1395000	<2 "	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2557	2	Katup Pengaman	PRV-P-07	1395000	<2 "	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2558	2	Katup Pengaman	PRV-T-02B	1395000	<2 "	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2559	2	Katup Pengaman	PRV-P-01	1395000	<2 "	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2560	2	Katup Pengaman	PRV-P-02	1395000	<2 "	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2561	2	Katup Pengaman	PRV-P-03	1395000	<2 "	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2562	2	Katup Pengaman	PRV-P-08	1395000	<2 "	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2563	2	Katup Pengaman	BV-T-01	1395000	2" < Dia <6"	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2564	2	Katup Pengaman	BV-T-04	1395000	2" < Dia <6"	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2565	2	Katup Pengaman	BV-T-07	1395000	2" < Dia <6"	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2566	2	Katup Pengaman	BV-T-09	1395000	2" < Dia <6"	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2567	2	Katup Pengaman	-	1395000	2" < Dia <6"	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2568	2	Katup Pengaman	-	1395000	2" < Dia <6"	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2569	2	Katup Pengaman	-	1395000	2" < Dia <6"	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2570	2	Katup Pengaman	-	1395000	2" < Dia <6"	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2571	2	Katup Pengaman	-	1395000	2" < Dia <6"	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2572	2	Peralatan Listrik	MCC-01	1340000	-	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2573	2	Peralatan Listrik	MCC-02	1340000	-	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2574	2	Pesawat Angkat	PDC-LWK-01	16800000	<=25 Ton	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2575	2	Pipa Penyalur	Pertalite Line	11617325	< 20Km Above Ground	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2576	2	Pipa Penyalur	Bio Solar Line	11617325	< 20Km Above Ground	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2577	2	Pipa Penyalur	Avtur Line	11617325	< 20Km Above Ground	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2578	2	Pipa Penyalur	Premium Line	11617325	< 20Km Above Ground	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2579	2	Pipa Penyalur	-	33469300	< 20Km Above Ground	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2580	2	Peralatan Putar	P-01	2720000	-	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2581	2	Peralatan Putar	P-02	2720000	-	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2582	2	Peralatan Putar	P-03	2720000	-	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2583	2	Peralatan Putar	P-04	2720000	-	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2584	2	Peralatan Putar	P-05	2720000	-	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2585	2	Peralatan Putar	P-06	2720000	-	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2586	2	Peralatan Putar	P-07	2720000	-	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2587	2	Peralatan Putar	P-8	2720000	-	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2588	2	Peralatan Putar	-	2720000	-	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2589	2	Peralatan Putar	-	2720000	-	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2590	2	Tangki Penimbun	T-01	13856188	Dia < 15m	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2591	2	Tangki Penimbun	T-02	13856188	Dia < 15m	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2592	2	Tangki Penimbun	T-03	13856188	Dia < 15m	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2593	2	Tangki Penimbun	T-04	13856188	Dia < 15m	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2594	2	Tangki Penimbun	T-05	13856188	Dia < 15m	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2595	2	Tangki Penimbun	T-06	13856188	Dia < 15m	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2596	2	Tangki Penimbun	T-07	13856188	Dia < 15m	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2597	2	Tangki Penimbun	T-08	13856188	Dia < 15m	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2598	2	Tangki Penimbun	T-09	20491639	15m < Dia < 36m	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2599	2	Tangki Penimbun	H-10	20491639	15m < Dia < 36m	-	-	8	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2600	2	Bejana Tekan	CCDS	13938400	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2601	2	Bejana Tekan	Drain-A	13938400	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2602	2	Bejana Tekan	Drain-B	13938400	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2603	2	Bejana Tekan	F-FM-07	13938400	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2604	2	Metering	FM-01	6000000	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2605	2	Metering	FM-02	6000000	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2606	2	Metering	FM-03	6000000	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2607	2	Metering	FM-04	6000000	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2608	2	Metering	FM-05	6000000	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2609	2	Metering	FM-06	6000000	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2610	2	Metering	FM-07	6000000	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2611	2	Metering	FM-08	6000000	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2612	2	Metering	FM-09	6000000	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2613	2	Peralatan Listrik	G-01	1640000	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2614	5	Instalasi	PP BBM	80000000	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2615	5	Instalasi	-	80000000	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2616	5	Instalasi	Instalasi BBm	80000000	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2617	2	Katup Pengaman	PRV-P-04	1395000	2" < Dia < 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2618	2	Katup Pengaman	PRV-T01A	1395000	2" < Dia < 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2619	2	Katup Pengaman	PRV-T01B	1395000	2" < Dia < 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2620	2	Katup Pengaman	PRV-T02A	1395000	2" < Dia < 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2621	2	Katup Pengaman	PRV-T02B	1395000	2" < Dia < 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2622	2	Katup Pengaman	PRV-T03A	1395000	2" < Dia < 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2623	2	Katup Pengaman	PRV-T03B	1395000	2" < Dia < 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2624	2	Katup Pengaman	PRV-T04A	1395000	2" < Dia < 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2625	2	Katup Pengaman	PRV-T04B	1395000	2" < Dia < 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2626	2	Katup Pengaman	PRV-T05A	1395000	2" < Dia < 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2627	2	Katup Pengaman	PRV-T05B	1395000	2" < Dia < 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2628	2	Katup Pengaman	PRV-T06A	1395000	2" < Dia < 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2629	2	Katup Pengaman	PRV-T06B	1395000	2" < Dia < 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2630	2	Katup Pengaman	PRV-T08A	1395000	2" < Dia < 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2631	2	Katup Pengaman	PRV-T08B	1395000	2" < Dia < 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2632	2	Katup Pengaman	PRV-T09A	1395000	2" < Dia < 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2633	2	Katup Pengaman	PRV-T09B	1395000	2" < Dia < 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2634	2	Katup Pengaman	BV-T-11	1395000	2" < Dia < 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2635	2	Katup Pengaman	BV-T-12	1395000	2" < Dia < 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2636	2	Katup Pengaman	BV-T-13	1395000	2" < Dia < 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2637	2	Katup Pengaman	BV-Drain-A	1395000	2" < Dia < 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2638	2	Katup Pengaman	BV-Drain-B	1395000	2" < Dia < 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2639	2	Katup Pengaman	PVV-T01	1395000	≥ 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2640	2	Katup Pengaman	PVV-T02	1395000	≥ 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2641	2	Katup Pengaman	PVV-T08	1395000	≥ 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2642	2	Katup Pengaman	PVV-T09	1395000	≥ 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2643	2	Katup Pengaman	PVV-T10	1395000	≥ 6"	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2644	2	Peralatan Listrik	MCC-01	1340000	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2645	2	Peralatan Listrik	MCC-02	1340000	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2646	2	Pesawat Angkat	PDC-KDI-01	14700000	<=25 Ton	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2647	2	Pipa Penyalur	Pertamax Line	5500000	< 20Km Above Ground	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2648	2	Pipa Penyalur	Premium Line	5500000	< 20Km Above Ground	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2649	2	Pipa Penyalur	Avtur Line	9000000	< 20Km Above Ground	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2650	2	Pipa Penyalur	Bio Solar Line	9000000	< 20Km Above Ground	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2651	2	Peralatan Putar	P-01	2720000	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2652	2	Peralatan Putar	P-02	2720000	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2653	2	Peralatan Putar	P-03	2720000	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2654	2	Peralatan Putar	P-04	2720000	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2655	2	Peralatan Putar	P-05	2720000	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2656	2	Peralatan Putar	P-06	2720000	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2657	2	Peralatan Putar	P-07	2720000	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2658	2	Peralatan Listrik	SWG-01	1340000	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2659	2	Tangki Penimbun	T-01	13856188	Dia < 15m	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2660	2	Tangki Penimbun	T-02	13856188	Dia < 15m	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2661	2	Tangki Penimbun	T-03	13856188	Dia < 15m	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2662	2	Tangki Penimbun	T-04	13856188	Dia < 15m	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2663	2	Tangki Penimbun	T-05	13856188	Dia < 15m	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2664	2	Tangki Penimbun	T-06	13856188	Dia < 15m	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2665	2	Tangki Penimbun	T-07	13856188	Dia < 15m	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2666	2	Tangki Penimbun	T-08	20491639	15 m < Dia < 36 m	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2667	2	Tangki Penimbun	T-09	20491639	15 m < Dia < 36 m	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2668	2	Tangki Penimbun	T-10	20491639	15 m < Dia < 36 m	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2669	2	Tangki Penimbun	T-11	20491639	15 m < Dia < 36 m	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2670	2	Tangki Penimbun	T-12	20491639	15 m < Dia < 36 m	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2671	2	Tangki Penimbun	T-13	20491639	15 m < Dia < 36 m	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2672	2	Peralatan Listrik	-	1340000	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2673	2	Peralatan Listrik	-	1340000	-	-	-	19	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2674	2	Peralatan Listrik	MKS-G-01	1640000	-	-	-	44	-	2023-02-22 07:56:38	2023-02-22 07:56:38	\N
2675	2	Peralatan Listrik	MKS-G-02	1640000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2676	2	Peralatan Listrik	MKS-G-03	1640000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2677	2	Peralatan Listrik	MKS-G-04	1640000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2678	2	Peralatan Listrik	MKS-G-05	1640000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2679	5	Instalasi	PP-BBM	80000000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2680	5	Instalasi	PP-LPG	80000000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2681	5	Instalasi	Instalasi BBM	80000000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2682	5	Instalasi	Instalasi LPG	80000000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2683	2	Katup Pengaman	PRV-T-01A	1395000	2" < Dia < 6"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2684	2	Katup Pengaman	PRV-T-01B	1395000	2" < Dia < 6"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2685	2	Katup Pengaman	PRV-T-02A	1395000	2" < Dia < 6"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2686	2	Katup Pengaman	PRV-T-02B	1395000	2" < Dia < 6"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2687	2	Katup Pengaman	PRV-T03 A	1395000	2" < Dia < 6"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2688	2	Katup Pengaman	PRV-T03 B	1395000	2" < Dia < 6"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2689	2	Katup Pengaman	PRV-T-04A	1395000	2" < Dia < 6"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2690	2	Katup Pengaman	PRV-T-04B	1395000	2" < Dia < 6"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2691	2	Katup Pengaman	PRV-T-05A	1395000	2" < Dia < 6"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2692	2	Katup Pengaman	PRV-T-05B	1395000	2" < Dia < 6"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2693	2	Katup Pengaman	PRV-T-06A	1395000	2" < Dia < 6"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2694	2	Katup Pengaman	PRV-T-06B	1395000	2" < Dia < 6"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2695	2	Katup Pengaman	PRV-T-09A	1395000	2" < Dia < 6"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2696	2	Katup Pengaman	PRV-T-09B	1395000	< 2"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2697	2	Katup Pengaman	PRV-T-12A	1395000	< 2"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2698	2	Katup Pengaman	PRV-T-12B	1395000	< 2"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2699	2	Katup Pengaman	PRV-T-13A	1395000	< 2"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2700	2	Katup Pengaman	PRV-T-13B	1395000	< 2"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2701	2	Katup Pengaman	PRV, T14A	1395000	< 2"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2702	2	Katup Pengaman	PRV, T14B	1395000	< 2"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2703	2	Katup Pengaman	PRV-T-15A	1395000	< 2"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2704	2	Katup Pengaman	PRV-T-15B	1395000	< 2"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2705	2	Katup Pengaman	PRV-T-17A	1395000	< 2"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2706	2	Katup Pengaman	PRV-T-17B	1395000	< 2"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2707	2	Katup Pengaman	PRV-T-19A	1395000	< 2"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2708	2	Katup Pengaman	PRV-T-19B	1395000	< 2"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2709	2	Katup Pengaman	PRV-T-20B	1395000	< 2"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2710	2	Katup Pengaman	PVV T-01	1395000	≥ 6"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2711	2	Katup Pengaman	PVV T-14	1395000	≥ 6"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2712	2	Katup Pengaman	PVV T-21 A	1395000	≥ 6"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2713	2	Katup Pengaman	PVV T-21 B	1395000	≥ 6"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2714	2	Katup Pengaman	PVV T-22 A	1395000	≥ 6"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2715	2	Katup Pengaman	PVV T-22 B	1395000	≥ 6"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2716	2	Katup Pengaman	PVV T-8 A	1395000	≥ 6"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2717	2	Katup Pengaman	PVV T-8 B	1395000	≥ 6"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2718	2	Katup Pengaman	PVV T-6	1395000	≥ 6"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2719	2	Katup Pengaman	PVV T-10 A	1395000	≥ 6"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2720	2	Katup Pengaman	PVV T-10 B	1395000	≥ 6"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2721	2	Katup Pengaman	PVV T-15	1395000	≥ 6"	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2722	2	Katup Pengaman	PRV T1C-A	1395000	2" < Dia < 6	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2723	2	Katup Pengaman	PRV T1C-B	1395000	2" < Dia < 7	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2724	2	Katup Pengaman	PRV T4-A	1395000	2" < Dia < 8	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2725	2	Katup Pengaman	PRV T4-B	1395000	2" < Dia < 9	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2726	2	Peralatan Listrik	K-MKS-016A	17000000	-	-	1/2 Stage	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2727	2	Peralatan Listrik	K-MKS-016B	17000000	-	-	1/2 Stage	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2728	2	Peralatan Listrik	-	17000000	-	-	1/2 Stage	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2729	2	Peralatan Listrik	-	17000000	-	-	1/2 Stage	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2730	2	Peralatan Listrik	-	17000000	-	-	1/2 Stage	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2731	2	Peralatan Listrik	MCC-01	1340000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2732	2	Pesawat Angkat	-	16800000	-	-	<=25 Ton	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2733	2	Pesawat Angkat	-	16800000	-	-	<=25 Ton	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2734	2	Pipa Penyalur	LPG Line	35469300	< 20Km Above Ground	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2735	2	Pipa Penyalur	Vapour Line	35469300	< 20Km Above Ground	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2736	2	Pipa Penyalur	MFO Line	35469300	< 20Km Above Ground	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2737	2	Pipa Penyalur	Pertamax Line	35469300	< 20Km Above Ground	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2738	2	Pipa Penyalur	Premium Line	35469300	< 20Km Above Ground	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2739	2	Pipa Penyalur	Avtur Line	35469300	< 20Km Above Ground	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2740	2	Pipa Penyalur	Dexlite line	35469300	< 20Km Above Ground	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2741	2	Peralatan Putar	P-01	2720000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2742	2	Peralatan Putar	P-02	2720000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2743	2	Peralatan Putar	P-03	2720000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2744	2	Peralatan Putar	P-06	2720000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2745	2	Peralatan Putar	P-07	2720000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2746	2	Peralatan Putar	P-08	2720000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2747	2	Peralatan Putar	P-09	2720000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2748	2	Peralatan Putar	P-10	2720000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2749	2	Peralatan Putar	P-12	2720000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2750	2	Peralatan Putar	P-13	2720000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2751	2	Peralatan Putar	P-14	2720000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2752	2	Peralatan Putar	P-15	2720000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2753	2	Peralatan Putar	P-16	2720000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2754	2	Peralatan Putar	P-17	2720000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2755	2	Peralatan Putar	P-18	2720000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2756	2	Peralatan Putar	P-19	2720000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2757	2	Peralatan Putar	P-20	2720000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2758	2	Peralatan Putar	LPG P-1	2720000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2759	2	Peralatan Putar	LPG-P-2	2720000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2760	2	Peralatan Putar	LPG-P-3	2720000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2761	2	Peralatan Putar	LPG-P-4	2720000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2762	2	Peralatan Putar	LPG-P-5	2720000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2763	2	Peralatan Putar	-	2720000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2764	2	Peralatan Putar	-	2720000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2765	2	Peralatan Listrik	MKS-SW-LV-01	1340000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2766	2	Peralatan Listrik	MKS-SW-MV-02	1340000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2767	2	Tangki Penimbun	T-01	9217500	Dia <= 15m	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2768	2	Tangki Penimbun	T-02	9217500	Dia <= 15m	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2769	2	Tangki Penimbun	T-03	9217500	Dia <= 15m	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2770	2	Tangki Penimbun	T-04	9217500	15m < Dia < 36m	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2771	2	Tangki Penimbun	T-05	9217500	15m < Dia < 36m	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2772	2	Tangki Penimbun	T-06	9217500	15m < Dia < 36m	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2773	2	Tangki Penimbun	T-07	9217500	15m < Dia < 36m	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2774	2	Tangki Penimbun	T-08	9217500	15m < Dia < 36m	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2775	2	Tangki Penimbun	T-09	9217500	15m < Dia < 36m	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2776	2	Tangki Penimbun	T-10	9217500	15m < Dia < 36m	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2777	2	Tangki Penimbun	T-11	9217500	15m < Dia < 36m	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2778	2	Tangki Penimbun	T-12	9217500	15m < Dia < 36m	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2779	2	Tangki Penimbun	T-13	9217500	15m < Dia < 36m	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2780	2	Tangki Penimbun	T-14	9217500	15m < Dia < 36m	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2781	2	Tangki Penimbun	T-15	9217500	15m < Dia < 36m	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2782	2	Tangki Penimbun	T-16	9217500	15m < Dia < 36m	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2783	2	Tangki Penimbun	T-17	9217500	15m < Dia < 36m	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2784	2	Tangki Penimbun	T-18	9217500	15m < Dia < 36m	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2785	2	Tangki Penimbun	T-19	9217500	15m < Dia < 36m	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2786	2	Tangki Penimbun	T-20	9217500	15m < Dia < 36m	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2787	2	Tangki Penimbun	T-21	9217500	15m < Dia < 36m	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2788	2	Tangki Penimbun	T-22	9217500	15m < Dia < 36m	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2789	2	Tangki Penimbun	T-25	9217500	15m < Dia < 36m	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2790	2	Peralatan Listrik	MKS-TRF-1	1340000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2791	2	Peralatan Listrik	MKS-TRF-2	1340000	-	-	-	44	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2792	2	Bejana Tekan	-	13938400	<5 m3	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2793	2	Bejana Tekan	-	13938400	<5 m3	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2794	2	Bejana Tekan	-	13938400	<5 m3	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2795	2	Bejana Tekan	-	13938400	<5 m3	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2796	2	Bejana Tekan	-	13938400	<5 m3	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2797	2	Peralatan Listrik	-	1640000	-	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2798	5	Instalasi	-	80000000	-	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2799	2	Katup Pengaman	-	1395000	<2 "	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2800	2	Katup Pengaman	-	1395000	<2 "	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2801	2	Katup Pengaman	-	1395000	<2 "	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2802	2	Katup Pengaman	-	1395000	<2 "	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2803	2	Katup Pengaman	-	1395000	<2 "	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2804	2	Katup Pengaman	-	1395000	<2 "	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2805	2	Katup Pengaman	-	1395000	<2 "	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2806	2	Katup Pengaman	-	1395000	<2 "	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2807	2	Katup Pengaman	-	1395000	<2 "	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2808	2	Katup Pengaman	-	1395000	<2 "	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2809	2	Peralatan Putar	-	2720000	-	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2810	2	Peralatan Putar	-	2720000	-	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2811	2	Peralatan Putar	-	2720000	-	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2812	2	Peralatan Putar	-	2720000	-	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2813	2	Peralatan Putar	-	2720000	-	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2814	2	Tangki Penimbun	-	9217500	Dia < 15m	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2815	2	Tangki Penimbun	-	9217500	Dia < 15m	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2816	2	Tangki Penimbun	-	9217500	Dia < 15m	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2817	2	Peralatan Listrik	-	1340000	-	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2818	2	Peralatan Listrik	-	1340000	-	-	-	14	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2819	2	Bejana Tekan	-	3632898	<5 m3	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2820	2	Bejana Tekan	-	3632898	<5 m3	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2821	2	Bejana Tekan	-	3632898	<5 m3	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2822	2	Bejana Tekan	-	3632898	<5 m3	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2823	2	Bejana Tekan	-	3632898	<5 m3	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2824	2	Bejana Tekan	-	3632898	<5 m3	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2825	2	Bejana Tekan	-	3632898	<5 m3	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2826	2	Bejana Tekan	-	3632898	<5 m3	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2827	2	Peralatan Listrik	-	1640000	-	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2828	2	Peralatan Listrik	-	1640000	-	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2829	5	Instalasi	-	80000000	-	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2830	2	Katup Pengaman	-	1395000	<2 "	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2831	2	Katup Pengaman	-	1395000	<2 "	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2832	2	Katup Pengaman	-	1395000	<2 "	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2833	2	Katup Pengaman	-	1395000	<2 "	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2834	2	Katup Pengaman	-	1395000	<2 "	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2835	2	Katup Pengaman	-	1395000	<2 "	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2836	2	Katup Pengaman	-	1395000	<2 "	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2837	2	Katup Pengaman	-	1395000	<2 "	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2838	2	Katup Pengaman	-	1395000	<2 "	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2839	2	Katup Pengaman	-	1395000	<2 "	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2840	2	Katup Pengaman	-	1395000	<2 "	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2841	2	Peralatan Putar	-	2720000	-	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2842	2	Peralatan Putar	-	2720000	-	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2843	2	Peralatan Putar	-	2720000	-	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2844	2	Peralatan Putar	-	2720000	-	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2845	2	Peralatan Putar	-	2720000	-	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2846	2	Peralatan Putar	-	2720000	-	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2847	2	Tangki Penimbun	-	13856188	Dia < 15m	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2848	2	Tangki Penimbun	-	13856188	Dia < 15m	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2849	2	Tangki Penimbun	-	13856188	Dia < 15m	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2850	2	Peralatan Listrik	-	1340000	-	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2851	2	Peralatan Listrik	-	1340000	-	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2852	2	Peralatan Listrik	-	1340000	-	-	-	16	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2853	5	Instalasi	PP-BBM	80000000	-	-	-	27	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2854	5	Instalasi	Instalasi BBM	80000000	-	-	-	27	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2855	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	27	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2856	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	27	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2857	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	27	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2858	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	27	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2859	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	27	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2860	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	27	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2861	2	Katup Pengaman	PSV-P01	1395000	< 2"	-	-	27	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2862	2	Katup Pengaman	PSV-P02	1395000	< 2"	-	-	27	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2863	2	Katup Pengaman	PSV-P03	1395000	< 2"	-	-	27	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2864	2	Katup Pengaman	PSV-P04	1395000	< 2"	-	-	27	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2865	2	Katup Pengaman	PSV-T-06 001	1395000	< 2"	-	-	27	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2866	2	Katup Pengaman	PSV-T-06 002	1395000	< 2"	-	-	27	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2867	2	Katup Pengaman	PSV-T-07 001	1395000	< 2"	-	-	27	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2868	2	Katup Pengaman	PSV-T-07 002	1395000	< 2"	-	-	27	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2869	2	Katup Pengaman	PSV-T-08 001	1395000	< 2"	-	-	27	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2870	2	Katup Pengaman	PSV-T-08 002	1395000	< 2"	-	-	27	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2871	2	Katup Pengaman	BV-T-08 001	1395000	≥ 6"	-	-	27	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2872	2	Katup Pengaman	PSV-T-09 001	1395000	< 2"	-	-	27	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2873	2	Katup Pengaman	PSV-T-09 002	1395000	< 2"	-	-	27	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2874	2	Katup Pengaman	PSV-T-10 001	1395000	< 2"	-	-	27	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2875	2	Katup Pengaman	PSV-T-10 002	1395000	< 2"	-	-	27	-	2023-02-22 07:56:39	2023-02-22 07:56:39	\N
2876	2	Katup Pengaman	BV-T-10 001	1395000	≥ 6"	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2877	2	Katup Pengaman	-	1395000	≥ 6"	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2878	2	Katup Pengaman	-	1395000	≥ 6"	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2879	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2880	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2881	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2882	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2883	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2884	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2885	2	Metering	FM-01	6000000	-	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2886	2	Metering	FM-02	6000000	-	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2887	2	Metering	FM-03	6000000	-	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2888	2	Metering	FM-04	6000000	-	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2889	2	Peralatan Listrik	G-01	1640000	-	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2890	2	Peralatan Listrik	G-02	1640000	-	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2891	2	Peralatan Listrik	MCC-01	1340000	-	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2892	2	Peralatan Listrik	-	1340000	-	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2893	2	Peralatan Putar	P-01	2720000	-	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2894	2	Peralatan Putar	P-02	2720000	-	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2895	2	Peralatan Putar	P-03	2720000	-	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2896	2	Peralatan Putar	P-04	2720000	-	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2897	2	Peralatan Putar	-	2720000	-	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2898	2	Peralatan Putar	-	2720000	-	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2900	2	Pipa Penyalur	Pertalite Line	5500000	< 20Km Above Ground	-	-	27	[null]	2023-02-22 07:56:40	2023-02-22 09:26:45	\N
2902	2	Tangki Penimbun	T-05	13856188	Dia < 15m	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3278	2	Peralatan Listrik	-	1640000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
2903	2	Tangki Penimbun	T-06	13856188	Dia < 15m	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2904	2	Tangki Penimbun	T-07	13856188	Dia < 15m	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2905	2	Tangki Penimbun	T-08	13856188	Dia < 15m	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2906	2	Tangki Penimbun	T-09	13856188	Dia < 15m	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2907	2	Tangki Penimbun	T-10	13856188	Dia < 15m	-	-	27	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2908	2	Metering	FM-01	6000000	-	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2910	2	Metering	FM-03	6000000	-	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2911	2	Peralatan Listrik	G-01	1640000	-	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2912	2	Peralatan Listrik	G-02	1640000	-	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2913	5	Instalasi	PP-BBM	80000000	-	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2914	5	Instalasi	Instalasi BBM	80000000	-	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2915	2	Katup Pengaman	PRV-T-5A	1395000	< 2"	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2916	2	Katup Pengaman	PRV-T-5B	1395000	< 2"	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2917	2	Katup Pengaman	BV-T-5	1395000	≥ 6"	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2918	2	Katup Pengaman	PRV-T-6A	1395000	< 2"	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2919	2	Katup Pengaman	PRV-T-6B	1395000	< 2"	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2920	2	Katup Pengaman	PRV-T-7A	1395000	< 2"	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2921	2	Katup Pengaman	PRV-T-7B	1395000	< 2"	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2922	2	Katup Pengaman	BV-T-7	1395000	≥ 6"	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2923	2	Katup Pengaman	PRV-T-8A	1395000	< 2"	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2924	2	Katup Pengaman	PRV-T-8B	1395000	< 2"	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2925	2	Katup Pengaman	PRV-P-1	1395000	2" < Dia < 6"	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2926	2	Katup Pengaman	PRV-P-2	1395000	2" < Dia < 6"	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2927	2	Katup Pengaman	PSV-P-3	1395000	2" < Dia < 6"	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2928	2	Katup Pengaman	PRV-P-4	1395000	2" < Dia < 6"	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2929	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2930	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2931	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2932	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2933	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2934	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2935	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2936	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2937	2	Peralatan Listrik	-	17000000	1/2 Stage	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2938	2	Peralatan Listrik	-	17000000	1/2 Stage	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2939	2	Peralatan Listrik	MCC-01	1340000	-	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2940	2	Pipa Penyalur	Bio Solar Line	5500000	< 20Km Above Ground	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2941	2	Pipa Penyalur	Pertamax Line	5500000	< 20Km Above Ground	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2942	2	Pipa Penyalur	Kerosene	5500000	< 20Km Above Ground	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2943	2	Peralatan Putar	P-01	2720000	-	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2944	2	Peralatan Putar	P-02	2720000	-	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2945	2	Peralatan Putar	P-03	2720000	-	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2946	2	Peralatan Putar	P-04	2720000	-	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2947	2	Peralatan Listrik	SWG-01	1340000	-	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2948	2	Tangki Penimbun	T-05	13856188	Dia < 15m	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2949	2	Tangki Penimbun	T-06	13856188	Dia < 15m	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2950	2	Tangki Penimbun	T-07	13856188	Dia < 15m	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2951	2	Tangki Penimbun	T-08	13856188	Dia < 15m	-	-	17	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2952	2	Metering	MA-01	6000000	-	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2953	2	Metering	MA-02	6000000	-	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2954	2	Metering	MA-03	6000000	-	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2955	2	Metering	MA-04	6000000	-	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2956	2	Metering	MA-05	6000000	-	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2957	2	Metering	MA-06	6000000	-	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2958	2	Metering	MA-07	6000000	-	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2959	2	Metering	MA-08	6000000	-	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2960	2	Peralatan Listrik	G-01	1640000	-	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2961	2	Peralatan Listrik	G-02	1640000	-	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2962	5	Instalasi	PP-BBM	80000000	-	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2963	5	Instalasi	Instalasi BBM	80000000	-	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2964	2	Katup Pengaman	PRV-MD-1	1395000	< 2"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2965	2	Katup Pengaman	PRV-MD-2	1395000	< 2"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2966	2	Katup Pengaman	PRV-MD-3	1395000	< 2"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2967	2	Katup Pengaman	PRV T-01 A	1395000	< 2"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2968	2	Katup Pengaman	PRV T-01 B	1395000	< 2"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2969	2	Katup Pengaman	BV T-01	1395000	≥ 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2970	2	Katup Pengaman	PRV T-02 A	1395000	< 2"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2971	2	Katup Pengaman	PRV T-02 B	1395000	< 2"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2972	2	Katup Pengaman	BV T-02	1395000	≥ 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2973	2	Katup Pengaman	PRV T-03 A	1395000	< 2"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2974	2	Katup Pengaman	PRV T-03 B	1395000	< 2"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2975	2	Katup Pengaman	BV T-03	1395000	≥ 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2976	2	Katup Pengaman	PRV T-04 A	1395000	< 2"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2977	2	Katup Pengaman	PRV T-04 B	1395000	< 2"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2978	2	Katup Pengaman	BV T-04	1395000	≥ 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2979	2	Katup Pengaman	PRV T-05 A	1395000	< 2"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2980	2	Katup Pengaman	PRV T-05 B	1395000	< 2"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2981	2	Katup Pengaman	BV T-05	1395000	≥ 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2982	2	Katup Pengaman	PRV T-06 A	1395000	< 2"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2983	2	Katup Pengaman	PRV T-06 B	1395000	< 2"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2984	2	Katup Pengaman	PRV T-07 A	1395000	< 2"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2985	2	Katup Pengaman	PRV T-07 B	1395000	< 2"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2986	2	Katup Pengaman	BV T-07	1395000	≥ 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2987	2	Katup Pengaman	PRV T-08 A	1395000	< 2"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2988	2	Katup Pengaman	PRV T-08 B	1395000	< 2"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2989	2	Katup Pengaman	BV T-08	1395000	≥ 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2990	2	Katup Pengaman	PRV T-09 A	1395000	< 2"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2991	2	Katup Pengaman	PRV T-09 B	1395000	< 2"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2992	2	Katup Pengaman	BV T-09	1395000	≥ 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2993	2	Katup Pengaman	PRV P-01	1395000	2" < Dia < 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2994	2	Katup Pengaman	PRV P-02	1395000	2" < Dia < 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2995	2	Katup Pengaman	PRV P-03	1395000	2" < Dia < 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2996	2	Katup Pengaman	PRV P-04	1395000	2" < Dia < 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2997	2	Katup Pengaman	PRV P-05	1395000	2" < Dia < 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2998	2	Katup Pengaman	PRV P-06	1395000	2" < Dia < 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
2999	2	Katup Pengaman	PRV P-07	1395000	2" < Dia < 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3000	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3001	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3002	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3003	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3004	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3005	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3006	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3007	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3008	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3009	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3010	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3011	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3012	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3013	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3014	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3015	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3016	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3017	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3018	2	Peralatan Listrik	MCC-01	1340000	-	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3019	2	Pipa Penyalur	Pertalite Line	35469300	< 20Km Under Water	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3020	2	Pipa Penyalur	Pertamax Line	35469300	< 20Km Under Water	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3021	2	Pipa Penyalur	Bio Solar Line	33469300	< 20Km Under Water	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3022	2	Peralatan Putar	P-01	2720000	-	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3023	2	Peralatan Putar	P-02	2720000	-	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3024	2	Peralatan Putar	P-03	2720000	-	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3025	2	Peralatan Putar	P-04	2720000	-	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3026	2	Peralatan Putar	P-05	2720000	-	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3027	2	Peralatan Putar	P-06	2720000	-	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3028	2	Peralatan Putar	P-07	2720000	-	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3029	2	Peralatan Listrik	SWG-01	1340000	-	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3030	2	Tangki Penimbun	T-01	13856188	Dia < 15m	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3031	2	Tangki Penimbun	T-02	13856188	Dia < 15m	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3032	2	Tangki Penimbun	T-03	20437639	15 m < Dia < 36 m	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3033	2	Tangki Penimbun	T-04	20437639	15 m < Dia < 36 m	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3034	2	Tangki Penimbun	T-05	20437639	15 m < Dia < 36 m	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3035	2	Tangki Penimbun	T-06	20437639	15 m < Dia < 36 m	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3036	2	Tangki Penimbun	T-07	20437639	15 m < Dia < 36 m	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3037	2	Tangki Penimbun	T-08	20437639	15 m < Dia < 36 m	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3038	2	Tangki Penimbun	T-09	20437639	15 m < Dia < 36 m	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3039	2	Tangki Penimbun	T-10	20437639	15 m < Dia < 36 m	-	-	25	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3040	2	Bejana Tekan	T-07	3424721	≤ 15m	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3041	2	Bejana Tekan	T-08	3424721	≤ 15m	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3042	2	Bejana Tekan	T-09	3424721	≤ 15m	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3043	2	Metering	FM-01	6000000	-	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3044	2	Metering	FM-02	6000000	-	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3045	2	Metering	FM-03	6000000	-	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3046	2	Metering	FM-04	6000000	-	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3047	2	Peralatan Listrik	G-02	1640000	-	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3048	5	Instalasi	PP-BBM	80000000	-	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3049	5	Instalasi	Instalasi BBM	80000000	-	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3050	2	Katup Pengaman	PSV-T-01 001	1395000	< 2"	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3051	2	Katup Pengaman	PSV-T-01 002	1395000	< 2"	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3052	2	Katup Pengaman	BV-T-01 001	1395000	≥ 6"	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3053	2	Katup Pengaman	PSV-T-02 001	1395000	< 2"	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3054	2	Katup Pengaman	PSV-T-02 002	1395000	< 2"	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3055	2	Katup Pengaman	BV-T-02 001	1395000	≥ 6"	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3056	2	Katup Pengaman	PSV-T-03 001	1395000	< 2"	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3057	2	Katup Pengaman	PSV-T-03 002	1395000	< 2"	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3058	2	Katup Pengaman	PSV-T-04 001	1395000	< 2"	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3059	2	Katup Pengaman	PSV-T-04 002	1395000	< 2"	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3060	2	Katup Pengaman	PSV-T-05 001	1395000	< 2"	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3061	2	Katup Pengaman	PSV-T-05 002	1395000	< 2"	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3062	2	Katup Pengaman	BV-T-05 001	1395000	≥ 6"	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3063	2	Katup Pengaman	PSV-T-06 001	1395000	< 2"	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3064	2	Katup Pengaman	PSV-T-06 002	1395000	< 2"	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3065	2	Katup Pengaman	PSV-T-07	1395000	< 2"	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3066	2	Katup Pengaman	PSV-T-08	1395000	< 2"	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3067	2	Katup Pengaman	PSV-T-09	1395000	< 2"	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3068	2	Katup Pengaman	PSV-P-01	1395000	2" < Dia < 6"	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3069	2	Katup Pengaman	PSV-P-02	1395000	2" < Dia < 6"	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3070	2	Katup Pengaman	PSV-P-03	1395000	2" < Dia < 6"	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3071	2	Katup Pengaman	PSV-P-04	1395000	2" < Dia < 6"	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3072	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3073	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3074	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3075	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	21	-	2023-02-22 07:56:40	2023-02-22 07:56:40	\N
3076	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	21	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3077	2	Katup Pengaman	PSV-P-05	1395000	< 2"	-	-	21	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3078	2	Katup Pengaman	PSV-P-06	1395000	< 2"	-	-	21	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3079	2	Katup Pengaman	-	1395000	< 2"	-	-	21	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3080	2	Peralatan Listrik	-	17000000	1/2 Stage	-	-	21	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3081	2	Peralatan Listrik	MCC-01	1340000	-	-	-	21	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3082	2	Pipa Penyalur	Pertamax Line	5500000	< 20Km Above Ground	-	-	21	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3083	2	Pipa Penyalur	Bio Solar Line	5500000	< 20Km Above Ground	-	-	21	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3084	2	Peralatan Putar	P-01	2720000	-	-	-	21	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3085	2	Peralatan Putar	P-02	2720000	-	-	-	21	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3086	2	Peralatan Putar	P-03	2720000	-	-	-	21	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3087	2	Peralatan Putar	P-04	2720000	-	-	-	21	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3088	2	Peralatan Putar	P-05	2720000	-	-	-	21	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3089	2	Peralatan Putar	P-06	2720000	-	-	-	21	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3090	2	Peralatan Putar	-	2720000	-	-	-	21	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3091	2	Peralatan Putar	-	2720000	-	-	-	21	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3092	2	Peralatan Putar	-	2720000	-	-	-	21	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3093	2	Peralatan Listrik	SWG-01	1340000	-	-	-	21	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3094	2	Tangki Penimbun	T-01	20491639	15 m < Dia < 36 m	-	-	21	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3095	2	Tangki Penimbun	T-02	20491639	15 m < Dia < 36 m	-	-	21	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3096	2	Tangki Penimbun	T-03	20491639	15 m < Dia < 36 m	-	-	21	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3097	2	Tangki Penimbun	T-04	20491639	15 m < Dia < 36 m	-	-	21	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3098	2	Tangki Penimbun	T-05	20491639	15 m < Dia < 36 m	-	-	21	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3099	2	Tangki Penimbun	T-06	20491639	15 m < Dia < 36 m	-	-	21	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3100	2	Bejana Tekan	STR-01	3424721	<5 m3	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3101	2	Bejana Tekan	STR-02	3424721	<5 m3	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3102	2	Bejana Tekan	STR-03	3424721	<5 m3	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3103	2	Bejana Tekan	STR-04	3424721	<5 m3	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3104	2	Metering	FM-01	6000000	-	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3105	2	Metering	FM-02	6000000	-	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3106	2	Metering	FM-03	6000000	-	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3107	2	Metering	FM-04	6000000	-	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3108	2	Peralatan Listrik	1429-G01	1640000	-	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3109	2	Peralatan Listrik	1429-G02	1640000	-	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3110	5	Instalasi	PP-BBM	80000000	-	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3111	5	Instalasi	Instalasi BBM	80000000	-	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3112	2	Katup Pengaman	1429-PRV-PP01	1395000	2" < Dia < 6"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3113	2	Katup Pengaman	1429-PRV-PP02	1395000	2" < Dia < 6"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3114	2	Katup Pengaman	1429-PRV-PP03	1395000	2" < Dia < 6"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3115	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3116	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3117	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3118	2	Katup Pengaman	1429-PRV-PP04	1395000	< 2"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3119	2	Katup Pengaman	1429-PRV-T05A	1395000	< 2"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3120	2	Katup Pengaman	1429-PRV-T05B	1395000	< 2"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3121	2	Katup Pengaman	1429-BV-T05	1395000	≥ 6"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3122	2	Katup Pengaman	1429-PRV-T06A	1395000	< 2"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3123	2	Katup Pengaman	1429-PRV-T06B	1395000	< 2"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3124	2	Katup Pengaman	1429-BV-T06	1395000	≥ 6"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3125	2	Katup Pengaman	1429-PRV-T07A	1395000	< 2"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3126	2	Katup Pengaman	1429-PRV-T07B	1395000	< 2"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3127	2	Katup Pengaman	1429-BV-T07	1395000	≥ 6"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3128	2	Katup Pengaman	1429-PRV-T08A	1395000	< 2"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3129	2	Katup Pengaman	1429-PRV-T08B	1395000	< 2"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3130	2	Katup Pengaman	1429-BV-T08	1395000	≥ 6"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3131	2	Katup Pengaman	1429-PRV-T09A	1395000	< 2"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3132	2	Katup Pengaman	1429-PRV-T09B	1395000	< 2"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3133	2	Katup Pengaman	1429-BV-T09	1395000	≥ 6"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3134	2	Katup Pengaman	1429-PRV-T10A	1395000	< 2"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3135	2	Katup Pengaman	1429-PRV-T10B	1395000	< 2"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3136	2	Katup Pengaman	1429-BV-T10	1395000	≥ 6"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3137	2	Katup Pengaman	1429-PRV-T11A	1395000	< 2"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3138	2	Katup Pengaman	1429-PRV-T11B	1395000	< 2"	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3139	2	Peralatan Listrik	1429-MCC-01	1340000	-	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3140	2	Pipa Penyalur	Pertamax Line	5500000	< 20Km Above Ground	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3141	2	Pipa Penyalur	Pertalite Line	5500000	< 20Km Above Ground	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3142	2	Pipa Penyalur	Bio Solar Line	5500000	< 20Km Above Ground	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3143	2	Peralatan Putar	1429-PP01	2720000	-	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3144	2	Peralatan Putar	1429-PP02	2720000	-	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3145	2	Peralatan Putar	1429-PP03	2720000	-	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3146	2	Peralatan Putar	1429-PP04	2720000	-	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3147	2	Peralatan Putar	-	2720000	-	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3148	2	Peralatan Listrik	14429-SWG-01	1340000	-	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3149	2	Tangki Penimbun	T-05	13856188	Dia < 15m	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3150	2	Tangki Penimbun	T-06	13856188	Dia < 15m	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3151	2	Tangki Penimbun	T-07	13856188	Dia < 15m	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3152	2	Tangki Penimbun	T-08	13856188	Dia < 15m	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3153	2	Tangki Penimbun	T-09	13856188	Dia < 15m	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3154	2	Tangki Penimbun	T-10	13856188	Dia < 15m	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3155	2	Tangki Penimbun	T-11	20491639	15 m < Dia < 36 m	-	-	22	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3156	1	Bejana Tekan	TANGKI PENDAM	26000000	5 m3 < Vol < 25 m3	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3157	2	Peralatan Listrik	G-602	1640000	-	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3158	2	Peralatan Listrik	G-603	1640000	-	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3159	5	Instalasi	-	70000000	-	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3160	5	Instalasi	-	70000000	-	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3161	5	Instalasi	-	16500000	-	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3162	2	Katup Pengaman	PSV-102 A	1395000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3163	2	Katup Pengaman	PSV-102 B	1395000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3164	2	Katup Pengaman	PSV-103 A	1395000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3165	2	Katup Pengaman	PSV-S-302-A	1395000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3166	2	Katup Pengaman	PSV-S-302-B	1395000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3167	2	Katup Pengaman	PSV-S-302-C	1395000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3168	2	Katup Pengaman	PSV-S-351 A	1395000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3169	2	Katup Pengaman	PSV-S-351 B	1395000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3170	2	Katup Pengaman	PSV-S-351 C	1395000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3171	1	Katup Pengaman	PSV 522-V-105	5000000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3172	1	Katup Pengaman	PSV-103 B	5000000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3173	1	Katup Pengaman	-	5000000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3174	1	Katup Pengaman	-	5000000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3175	1	Katup Pengaman	PSV S-102C	5000000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3176	1	Katup Pengaman	PSV S-103C	5000000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3177	1	Katup Pengaman	PSV-S-102 D	5000000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3178	1	Katup Pengaman	PSV-S-103 D	5000000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3179	1	Katup Pengaman	PSV 4111-1	5000000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3180	1	Katup Pengaman	BV-T-201 (1)-BRV-101A	5000000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3181	1	Katup Pengaman	BV-T-201 (2)- BRV-101B	5000000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3182	1	Katup Pengaman	BV-T-202 (1)- BRV-102A	5000000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3183	1	Katup Pengaman	BV-T-202 (2)- BRV-102B	5000000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3184	1	Katup Pengaman	BV-T-203 (1)- BRV-103A	5000000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3185	1	Katup Pengaman	BV-T-203 (2)-BRV-103B	5000000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3186	1	Katup Pengaman	BV-T-204 (1)	5000000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3187	1	Katup Pengaman	BV-T-204 (2)	5000000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3188	1	Katup Pengaman	BV-T-251 (1)	5000000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3189	1	Katup Pengaman	BV-T-251 (2)	5000000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3898	1	Metering	HNM 09	6000000	-	-	-	48	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3190	1	Katup Pengaman	BV-T-252 (1)	5000000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3191	1	Katup Pengaman	BV-T-252 (2)	5000000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3192	1	Katup Pengaman	BV-T-253 (1)	5000000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3193	1	Katup Pengaman	BV-T-253 (2)	5000000	<2 "	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3194	1	Katup Pengaman	PSV-T-251 (1)	6000000	2" < Dia <6"	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3195	1	Katup Pengaman	PSV-T-251 (2)	6000000	2" < Dia <6"	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3196	1	Katup Pengaman	PSV-T-252 (1)	6000000	2" < Dia <6"	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3197	1	Katup Pengaman	PSV-T-252 (2)	6000000	2" < Dia <6"	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3198	1	Katup Pengaman	PSV-T-253 (1)	6000000	2" < Dia <6"	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3199	1	Katup Pengaman	PSV-T-253 (2)	6000000	2" < Dia <6"	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3200	1	Katup Pengaman	PSV-522-V-203 (S-851)	6000000	2" < Dia <6"	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3201	1	Katup Pengaman	PSV-T-201 (1) - RV-005	6000000	2" < Dia <6"	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3202	1	Katup Pengaman	PSV-T-201 (2) - RV-008	6000000	2" < Dia <6"	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3279	2	Peralatan Listrik	-	1640000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3203	1	Katup Pengaman	PSV-T-202 (1) - RV-006	6000000	2" < Dia <6"	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3204	1	Katup Pengaman	PSV-T-203 (1)- RV-007	6000000	2" < Dia <6"	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3205	1	Katup Pengaman	PSV-T-204 (1)	6000000	2" < Dia <6"	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3206	1	Katup Pengaman	PSV-AIR RECEIVER(RV-D-531	6000000	2" < Dia <6"	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3207	1	Katup Pengaman	PSVCY-6-16 (U-17-011)	6000000	2" < Dia <6"	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3208	1	Peralatan Listrik	KOMPRESSOR 1 (K-531A)	17000000	1/2 Stage	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3209	1	Peralatan Listrik	KOMPRESSOR 1 (K-531B)	26000000	1/2 Stage	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3210	2	Peralatan Putar	522-P-2011 (P-301 A)	2720000	-	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3211	2	Peralatan Putar	522-P-2012 (P-301-C)	2720000	-	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3212	2	Peralatan Putar	522-P-2013 (P-301 B)	2720000	-	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3213	1	Peralatan Putar	522-P-2032 	23500000	-	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3214	1	Peralatan Putar	522-P-3022 (P-502B)	17000000	-	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3215	1	Peralatan Putar	522-P-3021 (P-502A)	17000000	-	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3216	1	Peralatan Putar	522-P-301 (P-501)	17000000	-	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3217	1	Peralatan Putar	522-P-2030 (P-351 A)	17000000	-	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3218	1	Peralatan Putar	522-P-2031 (P-351 B)	17000000	-	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3219	1	Peralatan Putar	522-P-2032 (P-351 C)	17000000	-	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3220	1	Peralatan Putar	P-851	17000000	-	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3221	1	Peralatan Listrik	Panel Distribusi 1	23500000	-	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3222	2	Tangki Penimbun	T-201	20491639	15m < Dia < 36m	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3223	2	Tangki Penimbun	T-202	20491639	15m < Dia < 36m	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3224	2	Tangki Penimbun	T-203	20491639	15m < Dia < 36m	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3225	2	Tangki Penimbun	T-204	20491639	15m < Dia < 36m	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3226	2	Tangki Penimbun	T-251	20491639	15m < Dia < 36m	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3227	2	Tangki Penimbun	T-252	20491639	15m < Dia < 36m	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3228	2	Tangki Penimbun	T-253	20491639	15m < Dia < 36m	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3229	2	Peralatan Listrik	Panel Distribusi 1	1340000	-	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3230	2	Peralatan Listrik	Panel Distribusi 2	1340000	-	-	-	11	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3231	2	Peralatan Listrik	-	1640000	-	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3232	2	Peralatan Listrik	-	1640000	-	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3233	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3234	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3235	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3236	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3237	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3238	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3239	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3240	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3241	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3242	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3243	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3244	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3245	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3246	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3247	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3248	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3249	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3250	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3251	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3252	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3253	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3254	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3255	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3256	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3899	1	Metering	HNM 10	6000000	-	-	-	48	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3257	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3258	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3259	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3260	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3261	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3262	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3263	2	Katup Pengaman	-	1395000	≥ 6"	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3264	5	Instalasi	-	135000000	-	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3265	2	Peralatan Listrik	-	1340000	-	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3266	2	Tangki Penimbun	-	13856188	Dia < 15m	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3267	2	Tangki Penimbun	-	13856188	Dia < 15m	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3268	2	Tangki Penimbun	-	13856188	Dia < 15m	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3269	2	Tangki Penimbun	-	13856188	Dia < 15m	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3270	2	Tangki Penimbun	-	13856188	Dia < 15m	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3271	2	Tangki Penimbun	-	13856188	Dia < 15m	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3272	2	Tangki Penimbun	-	13856188	Dia < 15m	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3273	2	Tangki Penimbun	-	20491639	15 m < Dia < 36 m	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3274	2	Tangki Penimbun	-	20491639	15 m < Dia < 36 m	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3275	2	Tangki Penimbun	-	20491639	15 m < Dia < 36 m	-	-	18	-	2023-02-22 07:56:41	2023-02-22 07:56:41	\N
3276	2	Tangki Penimbun	-	20491639	15 m < Dia < 36 m	-	-	18	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3277	2	Tangki Penimbun	-	20491639	15 m < Dia < 36 m	-	-	18	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3280	2	Peralatan Listrik	-	1640000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3281	2	Peralatan Listrik	-	1640000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3282	5	Instalasi	-	80000000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3283	5	Instalasi	-	90000000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3284	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3285	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3286	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3287	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3288	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3289	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3290	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3291	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3292	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3293	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3294	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3295	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3296	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3297	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3298	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3299	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3300	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3301	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3302	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3303	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3304	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3305	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3306	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3307	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3308	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3309	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3310	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3311	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3312	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3313	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3314	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3315	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3316	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3317	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3318	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3319	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3320	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3321	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3322	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3323	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3324	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3325	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3326	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3327	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3328	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3329	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3330	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3331	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3332	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3333	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3334	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3335	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3336	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3337	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3338	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3339	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3340	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3341	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3342	2	Pesawat Angkat	-	16800000	-	-	Kap < 25 Ton	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3343	2	Pesawat Angkat	-	16800000	-	-	Kap < 25 Ton	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3344	2	Pesawat Angkat	-	16800000	-	-	Kap < 25 Ton	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3345	2	Pesawat Angkat	-	16800000	-	-	Kap < 25 Ton	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3346	2	Pipa Penyalur	-	69469300	P = 4.5 Km	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3347	2	Pipa Penyalur	-	69469300	P = 4.4 Km	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3348	2	Pipa Penyalur	-	69469300	P = 4.4 Km	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3349	2	Pipa Penyalur	-	78469300	P = 6 Km	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3350	2	Pipa Penyalur	-	880806660	P = 140 KM	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3351	2	Peralatan Putar	-	2720000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3352	2	Peralatan Putar	-	2720000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3353	2	Peralatan Putar	-	2720000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3354	2	Peralatan Putar	-	2720000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3355	2	Peralatan Putar	-	2720000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3356	2	Peralatan Putar	-	2720000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3357	2	Peralatan Putar	-	2720000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3358	2	Peralatan Putar	-	2720000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3359	2	Peralatan Putar	-	2720000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3360	2	Peralatan Putar	-	2720000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3361	2	Peralatan Putar	-	2720000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3362	2	Peralatan Putar	-	2720000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3363	2	Peralatan Putar	-	2720000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3364	2	Peralatan Putar	-	2720000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3365	2	Peralatan Putar	-	2720000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3366	2	Peralatan Putar	-	2720000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3367	2	Peralatan Putar	-	2720000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3368	2	Peralatan Putar	-	2720000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3369	2	Peralatan Putar	-	2720000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3370	2	Peralatan Putar	-	2720000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3371	2	Peralatan Putar	-	2720000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3372	2	Peralatan Putar	-	2720000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3373	2	Peralatan Putar	-	2720000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3374	2	Peralatan Putar	-	2720000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3375	2	Peralatan Putar	-	2720000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3376	2	Peralatan Putar	-	2720000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3377	2	Tangki Penimbun	-	28200000	36 M < Dia < 60 M	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3378	2	Tangki Penimbun	-	28200000	37 M < Dia < 60 M	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3379	2	Tangki Penimbun	-	28200000	38 M < Dia < 60 M	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3380	2	Tangki Penimbun	-	28200000	39 M < Dia < 60 M	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3381	2	Tangki Penimbun	-	28200000	40 M < Dia < 60 M	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3382	2	Tangki Penimbun	-	28200000	41 M < Dia < 60 M	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3383	2	Tangki Penimbun	-	28200000	42 M < Dia < 60 M	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3384	2	Tangki Penimbun	-	28200000	43 M < Dia < 60 M	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3385	2	Tangki Penimbun	-	28200000	44 M < Dia < 60 M	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3386	2	Tangki Penimbun	-	28200000	45 M < Dia < 60 M	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3387	2	Tangki Penimbun	-	28200000	46 M < Dia < 60 M	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3388	2	Tangki Penimbun	-	28200000	47 M < Dia < 60 M	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3389	2	Peralatan Listrik	-	1340000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3390	2	Peralatan Listrik	-	1340000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3391	2	Peralatan Listrik	-	1340000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3392	2	Peralatan Listrik	-	1340000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3393	2	Peralatan Listrik	-	1340000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3394	2	Peralatan Listrik	-	1340000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3395	2	Peralatan Listrik	-	1340000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3396	2	Peralatan Listrik	-	1340000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3397	2	Peralatan Listrik	-	1340000	-	-	-	35	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3398	1	Peralatan Listrik	-	24000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3399	1	Peralatan Listrik	-	24000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3400	5	Instalasi	-	80000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3401	5	Instalasi	-	80000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3402	1	Pipa Penyalur	-	29628000	-	P = 800 M (Dia < 8")	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3403	1	Pipa Penyalur	-	32313000	-	P = 1.1 KM (Dia < 8")	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3404	1	Pipa Penyalur	-	30127000	-	P = 800 M (8" < Dia < 16")	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3405	1	Pipa Penyalur	-	33311000	-	P = 1.1 KM (8" < Dia < 16")	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3406	5	Instalasi	-	135000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3407	5	Instalasi	-	135000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3408	1	Peralatan Putar	-	17000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3409	1	Peralatan Putar	-	17000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3410	1	Peralatan Putar	-	17000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3411	1	Peralatan Putar	-	17000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3412	1	Peralatan Putar	-	17000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3413	1	Peralatan Putar	-	17000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3414	1	Peralatan Putar	-	17000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3415	1	Peralatan Putar	-	17000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3416	1	Peralatan Putar	-	17000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3417	1	Peralatan Putar	-	17000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3418	1	Peralatan Putar	-	17000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3419	1	Peralatan Putar	-	17000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3420	1	Peralatan Putar	-	17000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3421	1	Peralatan Putar	-	17000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3422	1	Peralatan Putar	-	17000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3423	1	Peralatan Putar	-	17000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3424	1	Peralatan Putar	-	17000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3425	1	Peralatan Putar	-	17000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3426	1	Peralatan Putar	-	17000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3427	1	Peralatan Putar	-	17000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3428	1	Peralatan Putar	-	17000000	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3429	1	Metering	-	23684400	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3430	1	Metering	-	23684400	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3431	1	Metering	-	23684400	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3432	1	Metering	-	23684400	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3433	1	Metering	-	23684400	-	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3434	1	Tangki Penimbun	-	45000000	15m < Dia < 36 M	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3435	1	Tangki Penimbun	-	45000000	15m < Dia < 36 M	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3436	1	Tangki Penimbun	-	45000000	15m < Dia < 36 M	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3437	1	Tangki Penimbun	-	45000000	15m < Dia < 36 M	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3438	1	Tangki Penimbun	-	45000000	15m < Dia < 36 M	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3439	1	Tangki Penimbun	-	45000000	15m < Dia < 36 M	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3440	1	Tangki Penimbun	-	45000000	15m < Dia < 36 M	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3441	1	Tangki Penimbun	-	45000000	15m < Dia < 36 M	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3442	1	Tangki Penimbun	-	45000000	15m < Dia < 36 M	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3443	1	Tangki Penimbun	-	45000000	15m < Dia < 36 M	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3444	1	Tangki Penimbun	-	45000000	15m < Dia < 36 M	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3445	1	Tangki Penimbun	-	45000000	15m < Dia < 36 M	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3446	1	Tangki Penimbun	-	45000000	15m < Dia < 36 M	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3447	1	Tangki Penimbun	-	45000000	15m < Dia < 36 M	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3448	1	Tangki Penimbun	-	45000000	15m < Dia < 36 M	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3449	1	Tangki Penimbun	-	45000000	15m < Dia < 36 M	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3450	1	Tangki Penimbun	-	55806000	36 M < Dia < 60 M	-	-	34	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3451	2	Peralatan Listrik	G-2	1640000	-	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3452	5	Instalasi	-	80000000	-	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3453	2	Katup Pengaman	PRV-P1-1	1395000	Dia < 2"	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3454	2	Katup Pengaman	PRV-P2-1	1395000	Dia < 2"	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3455	2	Katup Pengaman	PRV-P3-1	1395000	Dia < 2"	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3456	2	Katup Pengaman	PRV-P4-1	1395000	Dia < 2"	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3457	2	Katup Pengaman	PRV-P5-1	1395000	Dia < 2"	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3458	2	Katup Pengaman	PRV-T4-1	1395000	Dia < 2"	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3459	2	Katup Pengaman	PRV-T4-2	1395000	Dia < 2"	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3460	2	Katup Pengaman	PVV-T6-1	1395000	Dia < 2"	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3461	2	Katup Pengaman	PRV-T6-1	1395000	Dia < 2"	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3462	2	Katup Pengaman	PRV-T7-1	1395000	Dia < 2"	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3463	2	Katup Pengaman	PRV-T7-2	1395000	Dia < 2"	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3464	2	Katup Pengaman	FV-T7-1	1395000	Dia < 2"	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3465	2	Katup Pengaman	BV-1	1395000	Dia < 2"	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3466	2	Katup Pengaman	PRV-P1-1	1395000	2" < Dia < 6"	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3467	2	Katup Pengaman	PRV-P1-1	1395000	2" < Dia < 6"	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3468	2	Katup Pengaman	PRV-P1-1	1395000	Dia > 6"	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3469	2	Katup Pengaman	PRV-P1-1	1395000	Dia > 6"	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3470	2	Peralatan Putar	P-1	2720000	-	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3471	2	Peralatan Putar	P-2	2720000	-	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3472	2	Peralatan Putar	P-3	2720000	-	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3473	2	Peralatan Putar	P-4	2720000	-	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3474	2	Peralatan Putar	P-5	2720000	-	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3475	2	Tangki Penimbun	T-1	13856188	Dia < 15 M	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3476	2	Tangki Penimbun	T-4	13856188	Dia < 15 M	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3477	2	Tangki Penimbun	T-5	13856188	Dia < 15 M	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3478	2	Tangki Penimbun	T-6	13856188	Dia < 15 M	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3479	2	Tangki Penimbun	T-7	20491639	Dia 15m < Dia < 36m	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3480	2	Peralatan Listrik	MCC-1	1340000	-	-	-	29	-	2023-02-22 07:56:42	2023-02-22 07:56:42	\N
3481	1	Peralatan Listrik	G-1	24000000	-	-	-	32	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3482	1	Peralatan Listrik	G-2	24000000	-	-	-	32	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3483	5	Instalasi	-	80000000	-	-	-	32	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3484	1	Katup Pengaman	PRV-P1-1	5000000	Dia < 2 "	-	-	32	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3485	1	Katup Pengaman	PRV-P2-1	5000000	Dia < 2 "	-	-	32	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3486	1	Katup Pengaman	PRV-P3-1	5000000	Dia < 2 "	-	-	32	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3487	1	Katup Pengaman	PRV-P4-1	5000000	Dia < 2 "	-	-	32	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3488	1	Katup Pengaman	PRV-T1-1	5000000	Dia < 2 "	-	-	32	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3489	1	Katup Pengaman	PRV-T2-1	5000000	Dia < 2 "	-	-	32	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3490	1	Katup Pengaman	PRV-T2-2	5000000	Dia < 2 "	-	-	32	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3491	1	Katup Pengaman	PVV-T3-1	5000000	Dia < 2 "	-	-	32	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3492	1	Katup Pengaman	BV-T3-1	5000000	2" < Dia < 6"	-	-	32	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3493	1	Katup Pengaman	PRV-T4-1	5000000	2" < Dia < 6"	-	-	32	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3494	1	Peralatan Putar	P-1	17000000	-	-	-	32	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3495	1	Peralatan Putar	P-2	17000000	-	-	-	32	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3496	1	Peralatan Putar	P-3	17000000	-	-	-	32	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3497	1	Peralatan Putar	P-4	17000000	-	-	-	32	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3498	1	Peralatan Listrik	MCC-1	23500000	-	-	-	32	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3499	1	Tangki Penimbun	T-1	45000000	15 < Dia < 36 m	-	-	32	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3500	1	Tangki Penimbun	T-2	45000000	16 < Dia < 36 m	-	-	32	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3501	1	Tangki Penimbun	T-3	45000000	17 < Dia < 36 m	-	-	32	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3502	1	Tangki Penimbun	T-4	45000000	18 < Dia < 36 m	-	-	32	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3503	2	Peralatan Listrik	-	1640000	-	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3504	5	Instalasi	-	80000000	-	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3505	5	Instalasi	-	80000000	-	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3506	5	Instalasi	-	80000000	-	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3507	5	Instalasi	-	80000000	-	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3508	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3509	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3510	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3511	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3512	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3513	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3514	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3515	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3516	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3517	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3518	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3519	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3520	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3521	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3522	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3523	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3524	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3525	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3526	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3527	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3528	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3529	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3530	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3531	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3532	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3533	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3534	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3535	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3536	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3537	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3538	2	Peralatan Putar	-	2720000	-	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3539	2	Peralatan Putar	-	2720000	-	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3540	2	Peralatan Putar	-	2720000	-	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3541	2	Peralatan Putar	-	2720000	-	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3542	2	Peralatan Putar	-	2720000	-	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3543	2	Peralatan Putar	-	2720000	-	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3544	2	Peralatan Putar	-	2720000	-	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3545	2	Peralatan Putar	-	2720000	-	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3546	2	Peralatan Putar	-	2720000	-	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3547	2	Peralatan Putar	-	2720000	-	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3548	2	Peralatan Putar	-	2720000	-	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3549	2	Peralatan Listrik	-	23500000	-	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3550	2	Tangki Penimbun	-	9217500	Dia < 15m	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3551	2	Tangki Penimbun	-	9217500	Dia < 15m	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3552	2	Tangki Penimbun	-	9217500	Dia < 15m	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3553	2	Tangki Penimbun	-	9217500	Dia < 15m	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3554	2	Tangki Penimbun	-	9217500	15m < Dia < 36m	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3555	2	Tangki Penimbun	-	9217500	15m < Dia < 36m	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3556	2	Tangki Penimbun	-	9217500	15m < Dia < 36m	-	-	20	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3557	1	Bejana Tekan	T-111	16500000	5 m3 < Vol < 25 m3	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3558	1	Bejana Tekan	T-112A	16500000	5 m3 < Vol < 25 m3	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3559	1	Bejana Tekan	T-112B	19000000	5 m3 < Vol < 50 m3	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3560	2	Peralatan Listrik	G-01	1640000	-	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3561	5	Instalasi	-	80000000	-	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3562	5	Instalasi	-	80000000	-	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3563	1	Katup Pengaman	RV-101	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3564	1	Katup Pengaman	RV-102	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3565	1	Katup Pengaman	RV-103	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3566	1	Katup Pengaman	RV-104	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3567	1	Katup Pengaman	RV-105	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3568	1	Katup Pengaman	RV-106	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3569	1	Katup Pengaman	RV-111	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3570	1	Katup Pengaman	RV-112	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3571	1	Katup Pengaman	RV-113	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3572	1	Katup Pengaman	RV-114	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3573	1	Katup Pengaman	RV-121	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3574	1	Katup Pengaman	RV-122	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3575	1	Katup Pengaman	RV-123	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3576	1	Katup Pengaman	RV-124	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3577	1	Katup Pengaman	RV-131	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3578	1	Katup Pengaman	RV-132	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3579	1	Katup Pengaman	RV-133	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3580	1	Katup Pengaman	RV-134	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3581	1	Katup Pengaman	RV-141	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3582	1	Katup Pengaman	RV-142	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3583	1	Katup Pengaman	RV-143	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3584	1	Katup Pengaman	RV-144	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3585	1	Katup Pengaman	RV-171	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3586	1	Katup Pengaman	RV-172	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3587	1	Katup Pengaman	RV-173	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3588	1	Katup Pengaman	RV-174	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3589	1	Katup Pengaman	RV-181	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3590	1	Katup Pengaman	RV-191	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3591	1	Katup Pengaman	RV-192	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3592	1	Katup Pengaman	RV-193	5000000	<2 "	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3593	1	Pesawat Angkat	Crane No.1	14700000	<=25 Ton	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3594	1	Pesawat Angkat	Crane No.2	14700000	<=25 Ton	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3595	2	Peralatan Putar	P-101A	5505310	-	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3596	2	Peralatan Putar	P-101B	5505310	-	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3597	2	Peralatan Putar	P-101C	5505310	-	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3598	2	Peralatan Putar	P-101D	5505310	-	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3599	2	Peralatan Putar	P-102	5505310	-	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3600	2	Peralatan Putar	P-103	5505310	-	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3601	2	Peralatan Putar	P-105A	5505310	-	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3602	2	Peralatan Putar	P-105B	5505310	-	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3603	2	Peralatan Putar	P-121	5505310	-	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3604	1	Peralatan Putar	P-122	17000000	-	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3605	1	Peralatan Listrik	LV-SWGR-D1	23500000	-	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3606	2	Tangki Penimbun	T-101	20491639	15 m < Dia < 36 m	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3607	2	Tangki Penimbun	T-102	20491639	15 m < Dia < 36 m	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3608	2	Tangki Penimbun	T-103	20491639	15 m < Dia < 36 m	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3609	2	Tangki Penimbun	T-104	20491639	15 m < Dia < 36 m	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3610	2	Peralatan Listrik	TR-01	1340000	-	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3611	1	Peralatan Listrik	TR-01	23500000	-	-	-	9	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3612	1	Bejana Tekan	-	19000000	25 m3 < Vol < 50 m3	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3613	1	Peralatan Listrik	-	24000000	-	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3614	1	Peralatan Listrik	-	24000000	-	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3615	1	Peralatan Listrik	-	24000000	-	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3616	1	Peralatan Listrik	-	24000000	-	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3617	5	Instalasi	-	90000000	-	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3618	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3619	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3620	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3621	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3622	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3623	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3624	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3625	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3626	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3627	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3628	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3629	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3630	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3631	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3632	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3633	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3634	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3635	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3636	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3637	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3638	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3639	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3640	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3641	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3642	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3643	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3644	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3645	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3646	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3647	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3648	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3649	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3650	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3651	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3652	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3653	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3654	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3655	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3656	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3657	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3658	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3659	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3660	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3661	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3662	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3663	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3664	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3665	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3666	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3667	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3668	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3669	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3670	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3671	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3672	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3673	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3674	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3675	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3676	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3677	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3678	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3679	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3680	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:43	2023-02-22 07:56:43	\N
3681	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3682	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3683	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3684	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3685	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3686	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3687	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3688	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3689	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3690	1	Katup Pengaman	-	6000000	2" < Dia < 6"	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3691	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3692	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3693	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3694	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3695	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3696	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3697	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3698	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3699	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3700	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3701	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3702	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3703	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3704	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3705	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3706	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3707	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3708	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3709	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3710	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3711	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3712	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3713	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3714	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3715	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3716	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3717	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3718	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3719	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3720	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3721	1	Peralatan Putar	-	17000000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3722	1	Tangki Penimbun	-	45000000	15m < Dia < 36m	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3723	1	Tangki Penimbun	-	45000000	15m < Dia < 36m	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3724	1	Tangki Penimbun	-	45000000	15m < Dia < 36m	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3725	1	Tangki Penimbun	-	45000000	15m < Dia < 36m	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3726	1	Tangki Penimbun	-	45000000	15m < Dia < 36m	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3727	1	Tangki Penimbun	-	45000000	15m < Dia < 36m	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3728	1	Tangki Penimbun	-	45000000	15m < Dia < 36m	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3729	1	Tangki Penimbun	-	45000000	15m < Dia < 36m	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3730	1	Tangki Penimbun	-	45000000	15m < Dia < 36m	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3731	1	Tangki Penimbun	-	45000000	15m < Dia < 36m	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3732	1	Tangki Penimbun	-	45000000	15m < Dia < 36m	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3733	1	Tangki Penimbun	-	45000000	15m < Dia < 36m	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3734	1	Tangki Penimbun	-	45000000	15m < Dia < 36m	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
4043	2	Peralatan Putar	P.RTW 4	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3735	1	Tangki Penimbun	-	45000000	15m < Dia < 36m	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3736	1	Tangki Penimbun	-	45000000	15m < Dia < 36m	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3737	1	Tangki Penimbun	-	45000000	15m < Dia < 36m	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3738	1	Tangki Penimbun	-	45000000	15m < Dia < 36m	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3739	1	Tangki Penimbun	-	45000000	15m < Dia < 36m	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3740	1	Tangki Penimbun	-	45000000	15m < Dia < 36m	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3741	1	Peralatan Listrik	-	23500000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3742	1	Peralatan Listrik	-	23500000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3743	1	Peralatan Listrik	-	23500000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3744	1	Peralatan Listrik	-	23500000	-	-	-	46	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3745	1	Bejana Tekan	FWS 131	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3746	1	Bejana Tekan	FWS 132	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3747	1	Bejana Tekan	FWS 133	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3748	1	Bejana Tekan	FWS 134	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3749	1	Bejana Tekan	FWS 135	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3750	1	Bejana Tekan	FWS 136	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3751	1	Bejana Tekan	FWS 137	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3752	1	Bejana Tekan	FWS 210	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3753	1	Bejana Tekan	FWS 211	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3754	1	Bejana Tekan	FWS 212	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3755	1	Bejana Tekan	FWS 111	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3756	1	Bejana Tekan	FWS 112	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3757	1	Bejana Tekan	FWS 113	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3758	1	Bejana Tekan	FWS 114	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3759	1	Bejana Tekan	S/N 239779	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3760	1	Bejana Tekan	A237-R-101 S/N 200.040	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3761	1	Bejana Tekan	S/N 75039.3	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3762	1	Bejana Tekan	S/N 75039.4	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3763	1	Bejana Tekan	A237-FS-101	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3764	1	Bejana Tekan	A237-FS-102	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3765	1	Bejana Tekan	A237-FS-103 S/N 577-1	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3766	1	Bejana Tekan	A237-FS-104 S/N 577-2	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3767	1	Bejana Tekan	S/N: 12-2810-1	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3768	1	Bejana Tekan	S/N: 12-2810-2	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3769	1	Bejana Tekan	S/N: 12-2810-3	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3770	1	Bejana Tekan	S/N: 12-2810-4	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3771	1	Bejana Tekan	S/N 12-1626	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3772	1	Bejana Tekan	S/N 359-1	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3773	1	Bejana Tekan	S/N 24867	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3774	1	Bejana Tekan	S/N 12-1628	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3775	1	Bejana Tekan	S/N 24885	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3776	1	Bejana Tekan	S/N 32158	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3777	1	Bejana Tekan	S/N 32157	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3778	1	Bejana Tekan	-	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3779	1	Bejana Tekan	-	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3780	1	Bejana Tekan	-	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3781	1	Bejana Tekan	-	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3782	1	Bejana Tekan	-	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3783	1	Bejana Tekan	-	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3784	1	Bejana Tekan	-	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3785	1	Bejana Tekan	-	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3786	1	Bejana Tekan	-	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3787	1	Bejana Tekan	-	13938400	<5 m3	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3788	2	Pipa Penyalur	-	231469300	23 KM	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3789	2	Pipa Penyalur	-	249469300	25 KM	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3790	1	Katup Pengaman	PSV-depan IT 03	8745000	Dia > 6"	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3791	1	Katup Pengaman	100-BV-101A	8745000	Dia > 6"	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3792	1	Katup Pengaman	100-BV-101B	8745000	Dia > 6"	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3793	1	Katup Pengaman	100-BV-102A	8745000	Dia > 6"	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3794	1	Katup Pengaman	100-BV-102B	8745000	Dia > 6"	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3795	1	Katup Pengaman	100-BV-103A	8745000	Dia > 6"	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3796	1	Katup Pengaman	100-BV-103B	8745000	Dia > 6"	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3797	1	Katup Pengaman	100-BV-104A	8745000	Dia > 6"	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3798	1	Katup Pengaman	100-BV-104B	8745000	Dia > 6"	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3799	1	Katup Pengaman	100-BV-105A	8745000	Dia > 6"	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3800	1	Katup Pengaman	100-BV-105B	8745000	Dia > 6"	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3801	1	Katup Pengaman	100-BV-106A	8745000	Dia > 6"	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3802	1	Katup Pengaman	100-BV-106B	8745000	Dia > 6"	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3803	1	Katup Pengaman	100-BV-107A	8745000	Dia > 6"	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3804	1	Katup Pengaman	100-BV-107B	8745000	Dia > 6"	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3805	1	Katup Pengaman	100-BV-108A	8745000	Dia > 6"	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3806	1	Katup Pengaman	100-BV-108B	8745000	Dia > 6"	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3807	1	Katup Pengaman	100-BV-109A	8745000	Dia > 6"	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3808	1	Tangki Penimbun	T-101	45427000	Dia < 15m	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3809	1	Tangki Penimbun	T-102	45427000	Dia < 15m	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3810	1	Tangki Penimbun	T-103	45427000	Dia < 15m	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3811	1	Tangki Penimbun	T-104	45427000	Dia < 15m	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3812	1	Tangki Penimbun	T-105	45427000	Dia < 15m	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3813	1	Tangki Penimbun	T-106	45427000	Dia < 15m	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3814	1	Tangki Penimbun	T-107	45427000	Dia < 15m	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3815	1	Tangki Penimbun	T-108	45427000	Dia < 15m	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3816	1	Tangki Penimbun	T-109	45427000	Dia < 15m	-	-	28	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3817	1	Bejana Tekan	-	19000000	5 m3 < Vol < 50 m3	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3818	1	Bejana Tekan	-	19000000	5 m3 < Vol < 50 m3	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3819	1	Peralatan Listrik	-	1640000	-	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3820	1	Peralatan Listrik	-	1640000	-	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3821	1	Katup Pengaman	-	1395000	2"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3822	1	Katup Pengaman	-	1395000	2"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3823	1	Katup Pengaman	-	1395000	2"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3824	1	Katup Pengaman	-	1395000	2"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3825	1	Katup Pengaman	-	1395000	2"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3826	1	Katup Pengaman	-	1395000	2"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3827	1	Katup Pengaman	-	1395000	2"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3828	1	Katup Pengaman	-	1395000	2"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3829	1	Katup Pengaman	-	1395000	2"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3830	1	Katup Pengaman	-	1395000	2"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3831	1	Katup Pengaman	-	1395000	2"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3832	1	Katup Pengaman	-	1395000	2"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3833	1	Katup Pengaman	-	1395000	2"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3834	1	Katup Pengaman	-	1395000	2"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3835	1	Katup Pengaman	-	1395000	2"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3836	1	Katup Pengaman	-	1395000	2"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3837	1	Katup Pengaman	-	1395000	2"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3838	1	Katup Pengaman	-	1395000	2"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3839	1	Katup Pengaman	-	1395000	2"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3840	1	Katup Pengaman	-	1395000	2"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3841	1	Katup Pengaman	-	1395000	2"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3842	1	Katup Pengaman	-	1395000	2" < Dia <6"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3843	1	Katup Pengaman	-	1395000	2" < Dia <6"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3844	1	Katup Pengaman	-	1395000	2" < Dia <6"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3845	1	Katup Pengaman	-	1395000	2" < Dia <6"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3846	1	Katup Pengaman	-	1395000	2" < Dia <6"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3847	1	Katup Pengaman	-	1395000	2" < Dia <6"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3848	1	Katup Pengaman	-	1395000	2" < Dia <6"	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3849	1	Katup Pengaman	-	1395000	>6 "	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3850	1	Peralatan Listrik	-	1340000	-	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3851	1	Peralatan Listrik	-	1340000	-	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3852	1	Peralatan Listrik	-	1340000	-	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3853	1	Peralatan Listrik	-	1340000	-	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3854	1	Peralatan Listrik	-	1340000	-	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3855	1	Metering	-	6000000	(Skid <3)	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3856	1	Metering	-	6000000	(Skid <3)	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3857	1	Metering	-	6000000	(Skid <3)	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3858	1	Metering	-	6000000	(Skid <3)	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3859	1	Metering	-	6000000	(Skid <3)	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3860	1	Metering	-	6000000	(Skid <3)	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3861	1	Metering	-	6000000	(Skid <3)	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3862	1	Metering	-	6000000	(Skid <3)	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3863	1	Metering	-	6000000	(Skid <3)	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3864	1	Metering	-	6000000	(Skid <3)	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3865	1	Peralatan Putar	-	2720000	-	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3866	1	Peralatan Putar	-	2720000	-	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3867	1	Peralatan Putar	-	2720000	-	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3868	1	Peralatan Putar	-	2720000	-	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3869	1	Peralatan Putar	-	2720000	-	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3870	1	Peralatan Putar	-	2720000	-	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3871	1	Peralatan Putar	-	2720000	-	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3872	1	Peralatan Putar	-	2720000	-	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3873	1	Peralatan Putar	-	2720000	-	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3874	1	Peralatan Putar	-	2720000	-	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3875	1	Peralatan Listrik	-	23500000	-	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3876	2	Tangki Penimbun	-	9217500	Dia < 15m	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3877	2	Tangki Penimbun	-	9217500	Dia < 15m	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3878	2	Tangki Penimbun	-	9217500	Dia < 15m	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3879	2	Tangki Penimbun	-	9217500	Dia < 15m	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3880	2	Tangki Penimbun	-	9217500	15m < Dia < 36m	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3881	2	Tangki Penimbun	-	9217500	15m < Dia < 36m	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3882	2	Tangki Penimbun	-	9217500	15m < Dia < 36m	-	-	26	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3883	1	Bejana Tekan	D-131	13000000	<5 m3	-	-	48	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3884	1	Bejana Tekan	S-102A	13000000	<5 m3	-	-	48	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3885	1	Bejana Tekan	S-102B	13000000	<5 m3	-	-	48	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3886	1	Bejana Tekan	S-103A	13000000	<5 m3	-	-	48	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3887	1	Bejana Tekan	S-103B	13000000	<5 m3	-	-	48	-	2023-02-22 07:56:44	2023-02-22 07:56:44	\N
3888	1	Bejana Tekan	S-104A	13000000	<5 m3	-	-	48	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3889	1	Bejana Tekan	S-104B	13000000	<5 m3	-	-	48	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3890	1	Bejana Tekan	S-104C	13000000	<5 m3	-	-	48	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3891	1	Bejana Tekan	S-104D	13000000	<5 m3	-	-	48	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3892	1	Bejana Tekan	S-105	13000000	<5 m3	-	-	48	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3893	1	Bejana Tekan	Z-101	13000000	<5 m3	-	-	48	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3894	1	Bejana Tekan	Z-143	13000000	<5 m3	-	-	48	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3895	1	Metering	HNM 05	6000000	-	-	-	48	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3896	1	Metering	HNM 06	6000000	-	-	-	48	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3897	1	Metering	HNM 08	6000000	-	-	-	48	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3900	1	Metering	HNM 12	6000000	-	-	-	48	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3901	1	Metering	HNM 17	6000000	-	-	-	48	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3902	1	Metering	HNM 20	6000000	-	-	-	48	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3903	1	Metering	HNM 21	6000000	-	-	-	48	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3904	1	Metering	HNM 22	6000000	-	-	-	48	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3905	1	Metering	HNM 23	6000000	-	-	-	48	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3906	1	Pipa Penyalur	-	39000000	-	-	-	48	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3907	2	Tangki Penimbun	T-121	40000000	< 15 m	-	-	48	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3908	1	Bejana Tekan	FWS-01	13938400	<5 m3	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3909	1	Bejana Tekan	FWS-02	13938400	<5 m3	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3910	1	Bejana Tekan	FWS-03	13938400	<5 m3	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3911	1	Bejana Tekan	FWS-04	13938400	<5 m3	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3912	1	Bejana Tekan	Strainer Filling Shead 1	13938400	<5 m3	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3913	1	Bejana Tekan	Strainer Filling Shead 2	13938400	<5 m3	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3914	2	Bejana Tekan	T-1	3770000	>50 m3	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3915	2	Bejana Tekan	T-2	3770000	>50 m3	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3916	2	Bejana Tekan	T-3	3770000	>50 m3	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3917	2	Bejana Tekan	T-4	3770000	>50 m3	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3918	1	Peralatan Listrik	Generator	24000000	-	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3919	5	Instalasi	-	80000000	-	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3920	2	Katup Pengaman	PRV-P-02	1395000	<2 "	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3921	2	Katup Pengaman	PRV-P-01	1395000	<2 "	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3922	2	Katup Pengaman	PRV-V-02	1395000	<2 "	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3923	2	Katup Pengaman	PRV-V-01	1395000	<2 "	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3924	2	Katup Pengaman	PRV-T-101A	1395000	<2 "	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3925	2	Katup Pengaman	PRV-T-101B	1395000	<2 "	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3926	2	Katup Pengaman	PRV-T-102 A	1395000	<2 "	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3927	2	Katup Pengaman	PRV-T-102 B	1395000	<2 "	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3928	1	Katup Pengaman	PRV-V-03	5000000	<2 "	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3929	1	Katup Pengaman	PRV-V-04	5000000	<2 "	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3930	1	Katup Pengaman	PRV-P-PR-02	6000000	2" < Dia < 6"	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3931	1	Katup Pengaman	PRV-P-LDP-02	6000000	2" < Dia < 6"	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3932	1	Katup Pengaman	PVRV-T-01	6000000	2" < Dia < 6"	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3933	1	Katup Pengaman	PVRV-T-02	6000000	2" < Dia < 6"	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3934	2	Peralatan Putar	RP-03	2720000	-	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3935	1	Peralatan Putar	TP-01	17000000	-	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3936	1	Peralatan Putar	RP-01	17000000	-	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3937	1	Peralatan Putar	DISSEL	17000000	-	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3938	1	Peralatan Putar	TP-02	17000000	-	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3939	1	Metering	STN-08	6000000	-	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3940	1	Metering	STN-09	6000000	-	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3941	1	Metering	STN-10	6000000	-	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3942	1	Metering	STN-11	6000000	-	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3943	1	Metering	STN-12	6000000	-	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3944	1	Metering	STN-14	6000000	-	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3945	1	Metering	STN-15	6000000	-	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3946	1	Peralatan Listrik	Panel Distribusi	23500000	-	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3947	1	Tangki Penimbun	101	45000000	Dia < 15m	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3948	1	Tangki Penimbun	102	45000000	Dia < 15m	-	-	13	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3949	2	Peralatan Listrik	-	1640000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3950	2	Peralatan Listrik	-	1640000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3951	2	Peralatan Listrik	-	1640000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3952	2	Katup Pengaman	410 PSV T 1011	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3953	2	Katup Pengaman	410 PSV T 1012	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3954	2	Katup Pengaman	410 PSV T 1041	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3955	2	Katup Pengaman	410 PSV T 1042	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3956	2	Katup Pengaman	410 PSV T 1101	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3957	2	Katup Pengaman	410 PSV T 1102	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3958	2	Katup Pengaman	410 PSV 108	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3959	2	Katup Pengaman	410 PSV T 1082	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3960	2	Katup Pengaman	410 PSV T 1031	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3961	2	Katup Pengaman	410 PSV T 1032	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3962	2	Katup Pengaman	410 PSV T 1061	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3963	2	Katup Pengaman	410 PSV T 1062	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3964	2	Katup Pengaman	410 PSV T 1071	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3965	2	Katup Pengaman	410 PSV T 1072	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4044	2	Peralatan Putar	P.RTW 5	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3966	2	Katup Pengaman	410 PSV T 1111	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3967	2	Katup Pengaman	410 PSV T 1112	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3968	2	Katup Pengaman	410 PSV 208	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3969	2	Katup Pengaman	410 PSV 203	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3970	2	Katup Pengaman	410 PSV 214	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3971	2	Katup Pengaman	410 PSV 075	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3972	2	Katup Pengaman	410 PSV 215	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3973	2	Katup Pengaman	410 PSV 216	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3974	2	Katup Pengaman	410 PSV 102	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3975	2	Katup Pengaman	410 PSV 101	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3976	2	Katup Pengaman	410 PSV 103	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3977	2	Katup Pengaman	410 PSV T 1092	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3978	2	Katup Pengaman	410 PSV 105	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3979	2	Katup Pengaman	410 PSV 106	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3980	2	Katup Pengaman	410 PSV 107	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3981	2	Katup Pengaman	410 PSV 109	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3982	2	Katup Pengaman	410 PSV T 1051	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3983	2	Katup Pengaman	410 PSV T 1052	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3984	2	Katup Pengaman	410 PSV T 1021	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3985	2	Katup Pengaman	410 PSV T 1022	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3986	2	Katup Pengaman	410 PSV 206	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3987	2	Katup Pengaman	410 PSV 212	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3988	2	Katup Pengaman	410 PSV 217	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3989	2	Katup Pengaman	410 PVV 01	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3990	2	Katup Pengaman	410 PVV 02	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3991	2	Katup Pengaman	410 PVV 05	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3992	2	Katup Pengaman	410 PVV 03	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3993	2	Katup Pengaman	410 PVV 04	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3994	2	Katup Pengaman	410 PVV 07	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3995	2	Katup Pengaman	410 PVV 08	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3996	2	Katup Pengaman	410 PVV 09	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3997	2	Katup Pengaman	410 PVV 10	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3998	2	Katup Pengaman	410 PVV 14	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
3999	2	Katup Pengaman	410 PVV 15	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4000	2	Katup Pengaman	410 PVV 16	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4001	2	Katup Pengaman	410 PVV 17	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4002	2	Katup Pengaman	410 PSV 104	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4003	2	Katup Pengaman	410 PSV PL 301	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4004	2	Katup Pengaman	410 PSV PL 302	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4005	2	Katup Pengaman	410 PSV PL 303	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4006	2	Katup Pengaman	410 PSV T 1081	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4007	2	Katup Pengaman	410 PSV V 103	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4008	2	Katup Pengaman	410 PSV V 104	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4009	2	Katup Pengaman	410 PSV V 105	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4010	2	Katup Pengaman	410 PSV V 101	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4011	2	Katup Pengaman	410 PSV V 102	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4012	2	Katup Pengaman	410 PSV PP 102	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4013	2	Katup Pengaman	410 PSV PP 101	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4014	2	Katup Pengaman	410 PSV T 1091	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4015	2	Katup Pengaman	410 PSV V 106	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4016	2	Katup Pengaman	410 PVV 06	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4017	2	Katup Pengaman	410 PVV 11	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4018	2	Katup Pengaman	410 PVV 12	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4019	2	Katup Pengaman	410 PVV 13	1395000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4020	2	Peralatan Listrik	-	1340000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4021	2	Peralatan Listrik	-	1340000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4022	2	Metering	P.1 TA	6000000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4023	2	Metering	PX.4 TA	6000000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4024	2	Metering	P.3 TA	6000000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4025	2	Metering	PX.3 TA	6000000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4026	2	Metering	PR.2 TA	6000000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4027	2	Metering	PX.2 TA	6000000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4028	2	Metering	S.1 TA	6000000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4029	2	Metering	S.2 TA	6000000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4030	2	Metering	S.3 TA	6000000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4031	2	Metering	PX Turbo	6000000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4032	2	Metering	PR.1 TA	6000000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4033	2	Metering	PX.1 TA	6000000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4034	2	Peralatan Putar	P 204	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4035	2	Peralatan Putar	P-304 A	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4036	2	Peralatan Putar	PT.A	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4037	2	Peralatan Putar	PF.1	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4038	2	Peralatan Putar	PF.2	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4039	2	Peralatan Putar	P 202E	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4040	2	Peralatan Putar	P.RTW 1	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4041	2	Peralatan Putar	P.RTW 2	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4042	2	Peralatan Putar	P.RTW 3	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4045	2	Peralatan Putar	PF4	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4046	2	Peralatan Putar	PF5	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4047	2	Peralatan Putar	PF3	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4048	2	Peralatan Putar	P-304 B	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4049	2	Peralatan Putar	-	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4050	2	Peralatan Putar	-	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4051	2	Peralatan Putar	-	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4052	2	Peralatan Putar	-	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4053	2	Peralatan Putar	-	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4054	2	Peralatan Putar	-	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4055	2	Peralatan Putar	-	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4056	2	Peralatan Putar	-	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4057	2	Peralatan Putar	-	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4058	2	Peralatan Putar	-	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4059	2	Peralatan Putar	-	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4060	2	Peralatan Putar	-	2720000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4061	2	Peralatan Listrik	-	23500000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4062	2	Peralatan Listrik	-	23500000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4063	2	Tangki Penimbun	-	20491639	15 m < Dia < 36 m	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4064	2	Tangki Penimbun	-	20491639	15 m < Dia < 36 m	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4065	2	Tangki Penimbun	-	20491639	15 m < Dia < 36 m	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4066	2	Tangki Penimbun	-	20491639	15 m < Dia < 36 m	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4067	2	Tangki Penimbun	-	20491639	15 m < Dia < 36 m	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4068	2	Tangki Penimbun	-	20491639	15 m < Dia < 36 m	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4069	2	Tangki Penimbun	-	20491639	15 m < Dia < 36 m	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4070	2	Tangki Penimbun	-	20491639	15 m < Dia < 36 m	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4071	2	Tangki Penimbun	-	20491639	15 m < Dia < 36 m	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4072	2	Tangki Penimbun	-	20491639	15 m < Dia < 36 m	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4073	2	Tangki Penimbun	-	20491639	15 m < Dia < 36 m	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4074	2	Tangki Penimbun	-	20491639	15 m < Dia < 36 m	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4075	2	Peralatan Listrik	-	1340000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4076	2	Peralatan Listrik	-	1340000	-	-	-	24	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4077	2	Peralatan Listrik	-	1640000	-	-	-	39	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4078	2	Peralatan Listrik	-	1640000	-	-	-	39	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4079	2	Katup Pengaman	408-PRV-1011	1395000	-	-	-	39	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4080	2	Katup Pengaman	408-PRV-1012	1395000	-	-	-	39	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4081	2	Katup Pengaman	408-PRV-1021	1395000	-	-	-	39	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4082	2	Katup Pengaman	408-PRV-1022	1395000	-	-	-	39	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4083	2	Katup Pengaman	408-PRV-1031	1395000	-	-	-	39	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4084	2	Katup Pengaman	408-PRV-1032	1395000	-	-	-	39	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4085	2	Katup Pengaman	408-PRV-1041	1395000	-	-	-	39	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4086	2	Katup Pengaman	408-PRV-1042	1395000	-	-	-	39	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4087	2	Katup Pengaman	408-PRV-1051	1395000	-	-	-	39	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4088	2	Katup Pengaman	408-PRV-1052	1395000	-	-	-	39	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4089	2	Katup Pengaman	408-PRV-1061 	1395000	-	-	-	39	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4090	2	Katup Pengaman	408-PRV-1062	1395000	-	-	-	39	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4091	2	Katup Pengaman	408-PRV-1071	1395000	-	-	-	39	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4092	2	Katup Pengaman	408-PRV-1072	1395000	-	-	-	39	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4093	2	Katup Pengaman	408-PRV-1081	1395000	-	-	-	39	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4094	2	Katup Pengaman	408-PRV-1082	1395000	-	-	-	39	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4095	2	Katup Pengaman	408-PSV-31	1395000	-	-	-	39	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4096	2	Katup Pengaman	408-PSV-32	1395000	-	-	-	39	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4097	2	Katup Pengaman	408-PRV-101	1395000	-	-	-	39	-	2023-02-22 07:56:45	2023-02-22 07:56:45	\N
4098	2	Katup Pengaman	408-PRV-102	1395000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4099	2	Katup Pengaman	408-PRV-203	1395000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4100	2	Katup Pengaman	408-PRV-204	1395000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4101	2	Katup Pengaman	408-PRV-207	1395000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4102	2	Katup Pengaman	408-PRV-208	1395000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4103	2	Katup Pengaman	408-PRV-209	1395000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4104	2	Katup Pengaman	408-PRV-2010	1395000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4105	2	Katup Pengaman	408-PRV-211	1395000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4106	2	Katup Pengaman	408-PRV-212	1395000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4107	2	Katup Pengaman	408-PRV-201	1395000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4108	2	Katup Pengaman	408-PRV-202	1395000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4109	2	Katup Pengaman	408-PRV-202	1395000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4110	2	Katup Pengaman	408-PRV-214	1395000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4111	2	Katup Pengaman	408-PRV-215	1395000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4112	2	Katup Pengaman	408-PRV-216	1395000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4113	2	Katup Pengaman	408-PSV-33	1395000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4114	2	Katup Pengaman	408-PSV-34	1395000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4115	2	Katup Pengaman	408-PSV-35	1395000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4116	2	Peralatan Listrik	-	1340000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4117	2	Metering	S.1 TA	6000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4118	2	Metering	IDO.2 TA	6000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4119	2	Metering	MFO.3 TA	6000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4120	2	Metering	DEX.4 TA	6000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4121	2	Metering	MFO.5 TA	6000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4122	2	Metering	DEX.6 TA	6000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4123	2	Metering	MFO.7 TA	6000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4124	2	Metering	KERO.8 TA	6000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4125	2	Metering	FAME TA	6000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4126	2	Metering	BUNKER-HSD	6000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4127	2	Metering	BUNKER-IDO	6000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4128	2	Metering	BUNKER-IFO	6000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4129	2	Metering	Fame-BUNKER	6000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4130	2	Pipa Penyalur	-	5500000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4131	2	Pipa Penyalur	-	5500000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4132	2	Pipa Penyalur	-	5500000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4133	2	Pipa Penyalur	-	5500000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4134	2	Peralatan Putar	-	17000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4135	2	Peralatan Putar	-	17000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4136	2	Peralatan Putar	-	17000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4137	2	Peralatan Putar	-	17000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4138	2	Peralatan Putar	-	17000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4139	2	Peralatan Putar	-	17000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4140	2	Peralatan Putar	-	17000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4141	2	Peralatan Putar	-	17000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4142	2	Peralatan Putar	-	17000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4143	2	Peralatan Putar	-	17000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4144	2	Peralatan Putar	-	17000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4145	2	Peralatan Putar	-	17000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4146	2	Peralatan Putar	-	17000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4147	2	Peralatan Putar	-	17000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4148	2	Peralatan Putar	-	17000000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4149	2	Peralatan Listrik	-	1340000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4150	2	Tangki Penimbun	T-1	9217500	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4151	2	Tangki Penimbun	T-2	9217500	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4152	2	Tangki Penimbun	T-4	9217500	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4153	2	Tangki Penimbun	T-6	9217500	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4154	2	Tangki Penimbun	T-7	9217500	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4155	2	Tangki Penimbun	-	9217500	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4156	2	Tangki Penimbun	-	9217500	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4157	2	Tangki Penimbun	-	9217500	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4158	2	Peralatan Listrik	-	1340000	-	-	-	39	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4159	2	Bejana Tekan	V-110-C	3770000	Vol 50 m3	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4160	2	Bejana Tekan	V-110-D	3770000	Vol 50 m3	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4161	2	Peralatan Listrik	420-GE-302	1640000	-	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4162	2	Katup Pengaman	PSV-103	1395000	Dia < 2"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4163	2	Katup Pengaman	PSV-104	1395000	Dia < 2"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4164	2	Katup Pengaman	PSV-105	1395000	Dia < 2"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4165	2	Katup Pengaman	PSV-106	1395000	Dia < 2"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4166	2	Katup Pengaman	PSV-107	1395000	Dia < 2"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4167	2	Katup Pengaman	PSV-108	1395000	Dia < 2"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4168	2	Katup Pengaman	PSV-109	1395000	Dia < 2"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4169	2	Katup Pengaman	PSV-V-130-1	1395000	Dia < 2"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4170	2	Katup Pengaman	PSV-V-140-1	1395000	Dia < 2"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4171	2	Katup Pengaman	PSV-002	1395000	Dia < 2"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4172	2	Katup Pengaman	PSV-Kompresor-A	1395000	Dia < 2"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4173	2	Katup Pengaman	PSV-Kompresor-B	1395000	Dia < 2"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4174	2	Katup Pengaman	PSV-Kompresor-C	1395000	Dia < 2"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4175	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4176	2	Katup Pengaman	-	1395000	Dia < 2"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4177	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4178	2	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4179	2	Katup Pengaman	-	1395000	Dia > 6"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4180	2	Katup Pengaman	-	1395000	Dia > 6"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4181	2	Katup Pengaman	-	1395000	Dia > 6"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4182	2	Katup Pengaman	-	1395000	Dia > 6"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4183	2	Katup Pengaman	-	1395000	Dia > 6"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4184	2	Katup Pengaman	-	1395000	Dia > 6"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4185	1	Katup Pengaman	-	1395000	Dia <2"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4186	1	Katup Pengaman	-	1395000	Dia <2"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4187	1	Katup Pengaman	-	1395000	Dia <2"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4188	1	Katup Pengaman	-	1395000	Dia <2"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4189	1	Katup Pengaman	-	1395000	Dia <2"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4190	1	Katup Pengaman	-	1395000	Dia <2"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4191	1	Katup Pengaman	-	1395000	Dia <2"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4192	1	Katup Pengaman	-	1395000	Dia <2"	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4193	2	Peralatan Putar	420P-201	2720000	-	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4194	2	Peralatan Putar	420P-202	2720000	-	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4195	2	Peralatan Putar	420P-203	2720000	-	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4196	2	Peralatan Putar	420P-205	2720000	-	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4197	2	Peralatan Putar	420P-205	2720000	-	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4198	2	Peralatan Putar	420P-206	2720000	-	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4199	2	Peralatan Putar	420P-207	2720000	-	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4200	2	Peralatan Putar	420P-208	2720000	-	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4201	1	Peralatan Putar	P1	2720000	-	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4202	1	Peralatan Putar	P2	2720000	-	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4203	1	Peralatan Putar	P-A	2720000	-	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4204	1	Peralatan Putar	P-B	2720000	-	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4205	1	Peralatan Putar	P-A 3kg	2720000	-	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4206	1	Peralatan Putar	P-B 3kg	2720000	-	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4207	1	Peralatan Putar	P-I	2720000	-	-	-	40	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4208	1	Katup Pengaman	-	5000000	Dia <2"	-	-	47	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4209	1	Katup Pengaman	-	5000000	Dia <2"	-	-	47	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4210	1	Katup Pengaman	-	5000000	Dia <2"	-	-	47	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4211	1	Katup Pengaman	-	5000000	Dia <2"	-	-	47	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4212	1	Katup Pengaman	-	5000000	Dia <2"	-	-	47	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4213	2	Peralatan Listrik	-	17000000	-	-	-	23	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4214	2	Peralatan Listrik	-	1340000	-	-	-	23	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4215	2	Peralatan Listrik	SWGR ELMOT 62-A	1340000	-	-	-	23	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4216	2	Peralatan Listrik	-	1340000	-	-	-	23	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4217	2	Peralatan Putar	-	2720000	-	-	-	23	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4218	2	Tangki Penimbun	T-5	13856188	Dia < 15m	-	-	23	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4219	2	Tangki Penimbun	T-7	13856188	Dia < 15m	-	-	23	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4220	2	Tangki Penimbun	T-8	13856188	Dia < 15m	-	-	23	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4221	2	Tangki Penimbun	T-9	13856188	Dia < 15m	-	-	23	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4222	2	Tangki Penimbun	T-10	13856188	Dia < 15m	-	-	23	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4223	2	Tangki Penimbun	T-11	20491639	15 m < Dia < 36 m	-	-	23	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4224	2	Tangki Penimbun	T-14	20491639	15 m < Dia < 36 m	-	-	23	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4225	2	Tangki Penimbun	T-15	28200000	36 m < Dia < 60 m	-	-	23	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4226	3	Peralatan Putar	-	28200000	36 m < Dia < 60 m	-	-	23	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4227	3	Peralatan Listrik	-	28200000	36 m < Dia < 60 m	-	-	23	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4228	3	Tangki Penimbun	-	28200000	36 m < Dia < 60 m	-	-	23	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4229	1	Bejana Tekan	-	3770000	-	-	Vol < 5 M3	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4230	1	Bejana Tekan	-	3770000	-	-	Vol < 5 M4	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4231	1	Bejana Tekan	-	3632898	-	-	Vol < 5 M5	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4232	1	Bejana Tekan	-	3770000	-	-	Vol < 5 M6	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4233	1	Bejana Tekan	-	3770000	-	-	Vol < 5 M7	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4234	1	Bejana Tekan	-	3770000	-	-	Vol < 5 M8	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4235	1	Peralatan Listrik	-	1640000	-	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4236	1	Peralatan Listrik	-	1640000	-	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4237	1	Peralatan Listrik	-	1640000	-	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4238	5	Instalasi	-	80000000	-	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4239	1	Katup Pengaman	-	1395000	Dia < 2"	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4240	1	Katup Pengaman	-	1395000	Dia < 2"	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4241	1	Katup Pengaman	-	1395000	Dia < 2"	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4242	1	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4243	1	Katup Pengaman	-	1395000	2" < Dia < 6"	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4244	1	Katup Pengaman	-	1395000	Dia > 6"	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4245	1	Katup Pengaman	-	1395000	Dia > 6"	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4246	1	Katup Pengaman	-	1395000	Dia > 6"	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4247	1	Katup Pengaman	-	1395000	Dia > 6"	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4248	1	Katup Pengaman	-	1395000	Dia > 6"	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4249	1	Katup Pengaman	-	1395000	Dia > 6"	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4250	1	Metering	-	6000000	-	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4251	1	Metering	-	6000000	-	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4252	1	Metering	-	6000000	-	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4253	1	Pesawat Angkat	-	16800000	-	-	Cap < 25 Ton	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4254	1	Pipa Penyalur	-	35469300	Dia < 8"	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4255	1	Pipa Penyalur	-	35469300	Dia < 8"	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4256	1	Pipa Penyalur	-	35469300	Dia < 8"	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4257	1	Pipa Penyalur	-	35469300	Dia < 8"	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4258	1	Pipa Penyalur	-	35469300	Dia < 8"	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4259	1	Pipa Penyalur	-	35469300	Dia < 8"	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4260	1	Pipa Penyalur	-	35469300	Dia < 8"	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4261	1	Pipa Penyalur	-	35469300	Dia <8" < Dia < 16"	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4262	1	Pipa Penyalur	-	35469300	Dia <8" < Dia < 16"	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4263	1	Pipa Penyalur	-	35469300	Dia <8" < Dia < 16"	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4264	1	Pipa Penyalur	-	35469300	Dia <8" < Dia < 16"	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4265	1	Pipa Penyalur	-	35469300	Dia <8" < Dia < 16"	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4266	1	Pipa Penyalur	-	35469300	Dia <8" < Dia < 16"	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4267	1	Pipa Penyalur	-	35469300	Dia <8" < Dia < 16"	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4268	1	Peralatan Putar	-	2785310	-	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4269	1	Peralatan Putar	-	2785310	-	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4270	1	Peralatan Putar	-	2785310	-	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4271	1	Peralatan Listrik	-	23500000	-	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4272	1	Peralatan Listrik	-	23500000	-	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4273	1	Peralatan Listrik	-	23500000	-	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4274	1	Peralatan Listrik	-	1340000	-	-	-	38	-	2023-02-22 07:56:46	2023-02-22 07:56:46	\N
4275	2	Peralatan Listrik	G-04/X14G285712	1640000	-	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4276	2	Peralatan Listrik	G-04/X14G285713	1640000	-	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4277	5	Instalasi	-	90000000	-	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4278	2	Peralatan Listrik	MCC-01	1340000	-	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4279	1	Peralatan Putar	POMPA BOSTER 1	17000000	-	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4280	1	Peralatan Putar	POMPA BOSTER 2	17000000	-	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4281	1	Peralatan Putar	POMPA PIT STOP 1	17000000	-	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4282	1	Peralatan Putar	POMPA PIT STOP 2 (NEW)	17000000	-	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4283	2	Peralatan Listrik	SWG-01	1340000	-	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4284	2	Peralatan Listrik	SWG-01	1340000	-	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4285	2	Tangki Penimbun	T-1	20491639	15 m <diam<36 m	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4286	2	Tangki Penimbun	T-2	20491639	16 m <diam<36 m	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4287	2	Tangki Penimbun	T-3	20491639	17 m <diam<36 m	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4288	2	Tangki Penimbun	T-4	20491639	18 m <diam<36 m	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4289	2	Tangki Penimbun	T-5	20491639	19 m <diam<36 m	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4290	2	Tangki Penimbun	T-6	20491639	20 m <diam<36 m	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4291	2	Tangki Penimbun	T-7	20491639	21 m <diam<36 m	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4292	2	Tangki Penimbun	T-10	20491639	22 m <diam<36 m	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4293	2	Tangki Penimbun	T-11	20491639	23 m <diam<36 m	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4294	2	Tangki Penimbun	T-12	20491639	24 m <diam<36 m	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4295	2	Tangki Penimbun	T-13	20491639	25 m <diam<36 m	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4296	2	Tangki Penimbun	T-23	20491639	26 m <diam<36 m	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4297	2	Tangki Penimbun	T-24	20491639	27 m <diam<36 m	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4298	2	Tangki Penimbun	Feedstock 01 / 28	20491639	28 m <diam<36 m	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4299	2	Tangki Penimbun	T-14	28200000	36 m <diam<60 m	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4300	2	Tangki Penimbun	T-15	28200000	37 m <diam<60 m	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4301	2	Tangki Penimbun	T-16	28200000	38 m <diam<60 m	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4302	2	Tangki Penimbun	T-17	28200000	39 m <diam<60 m	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4303	2	Tangki Penimbun	T-18	28200000	40 m <diam<60 m	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4304	2	Tangki Penimbun	T-19	28200000	41 m <diam<60 m	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4305	2	Tangki Penimbun	T-21	28200000	42 m <diam<60 m	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4306	2	Tangki Penimbun	T-22	28200000	43 m <diam<60 m	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4307	1	Peralatan Listrik	Trafo A	23500000	-	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4308	1	Peralatan Listrik	Trafo B	23500000	-	-	-	41	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4309	2	Bejana Tekan	Thermal Oil Heater	3424721	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4310	5	Instalasi	-	90000000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4311	1	Peralatan Listrik	03-E-04-14	23500000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4312	2	Peralatan Putar	Pump 38 / 585664N	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4313	2	Peralatan Putar	Pump GP 2 / M307407005	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4314	2	Peralatan Putar	Pump GP 1 / M307407004	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4315	2	Peralatan Putar	Pump A5 / 28111231/4	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4316	2	Peralatan Putar	Pump A6 / 28111233/4	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4317	2	Peralatan Putar	Pump A7 / 28111232/4	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4318	2	Peralatan Putar	Pump 01 / 492932	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4319	2	Peralatan Putar	Pump 20 / 21909AE	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4320	2	Peralatan Putar	Pump 21 / 492931	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4321	2	Peralatan Putar	Pump 05 / 993634/A	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4322	2	Peralatan Putar	Pump 43 / 492930	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4323	2	Peralatan Putar	Pump 30 / 492929	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4324	2	Peralatan Putar	Pump 19 / A502994	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4325	2	Peralatan Putar	Pump 36 / M51.2638	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4326	2	Peralatan Putar	Pump A1 / 42037	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4327	2	Peralatan Putar	Pump A2 / 42038	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4328	2	Peralatan Putar	Pump KSO / 918869	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4329	2	Peralatan Putar	Pump A4 / 42776	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4330	2	Peralatan Putar	Pump 55 / 981266	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4331	2	Peralatan Putar	Pump 40 / 585670N	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4332	2	Peralatan Putar	Pump PLTU 01 / PB3062	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4333	2	Peralatan Putar	Pump 35 / M.512639	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4334	2	Peralatan Putar	Pump 02 / M301407003	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4335	2	Peralatan Putar	Pump 08 / -	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4336	2	Peralatan Putar	Pump 22 / -	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4337	2	Peralatan Putar	Pump 20 / 585669N	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4338	2	Peralatan Putar	Pump 04 / -	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4339	2	Peralatan Putar	Pump 56 / 63101503	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4340	2	Peralatan Putar	Pump 39 / 585668N	2720000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4341	1	Peralatan Listrik	03-EE-04-02 / 62600EC1-9212	23500000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4342	1	Peralatan Listrik	03-EE-04-03 / ID113006	23500000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4343	1	Peralatan Listrik	03-EE-04-04 / -	23500000	-	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4344	2	Tangki Penimbun	T-05 / 317-T-105	13856188	< 15 M	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4345	2	Tangki Penimbun	T-01 / 317-T-101	20491639	15 m <diam<36 m	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4346	2	Tangki Penimbun	T-02 / 317-T-102	20491639	16 m <diam<36 m	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4347	2	Tangki Penimbun	T-31 / 317-T-131	20491639	17 m <diam<36 m	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4348	2	Tangki Penimbun	T-40 / 317-T-140	20491639	18 m <diam<36 m	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4349	2	Tangki Penimbun	T-41 / 317-T-141	20491639	19 m <diam<36 m	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4461	1	Katup Pengaman	-	1395000	<2 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4350	2	Tangki Penimbun	T-42 / 317-T-142	28200000	36 m <diam<60 m	-	-	42	-	2023-02-22 07:58:58	2023-02-22 07:58:58	\N
4385	2	Bejana Tekan	(Tanki T-4A)	3770000	> 50m3	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4386	2	Bejana Tekan	(Tanki T-4B)	3770000	> 50m3	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4387	2	Bejana Tekan	(Tanki T-4C)	3770000	> 50m3	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4388	2	Bejana Tekan	(Tanki T-4D)	3770000	> 50m3	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4389	2	Bejana Tekan	Tanki T-1A) 	3770000	> 50m3	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4390	2	Bejana Tekan	Tanki T-1B) 	3770000	> 50m3	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4391	2	Bejana Tekan	Tanki T-2A) 	3770000	> 50m3	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4392	2	Bejana Tekan	Tanki T-2B) 	3770000	> 50m3	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4393	2	Bejana Tekan	Tanki T-3A) 	3770000	> 50m3	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4394	2	Bejana Tekan	Tanki T-3B) 	3770000	> 50m3	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4395	2	Bejana Tekan	Air Receiver Tank V-01	3632898	<5 m3	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4396	2	Bejana Tekan	Air Receiver Tank  V-02	3632898	<5 m3	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4397	2	Bejana Tekan	T-05	3424721	5 m3 < Vol < 25 m3	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4398	2	Bejana Tekan	T-06	3424721	5 m3 < Vol < 25 m3	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4399	2	Bejana Tekan	T-07	3424721	5 m3 < Vol < 25 m3	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4400	5	Instalasi	-	90000000	-	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4401	2	Katup Pengaman	PRV 0301	1395000	> dia 6"	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4402	2	Katup Pengaman	PRV 0302	1395000	> dia 6"	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4403	2	Katup Pengaman	PRV 0303	1395000	> dia 6"	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4404	2	Katup Pengaman	PRV 0304	1395000	> dia 6"	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4405	2	Katup Pengaman	PRV 0305	1395000	> dia 6"	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4406	2	Katup Pengaman	PRV 0306	1395000	> dia 6"	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4407	2	Katup Pengaman	PRV 0307	1395000	> dia 6"	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4408	2	Katup Pengaman	PRV 0308	1395000	> dia 6"	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4409	2	Katup Pengaman	PSV-T3 B1	1395000	> dia 6"	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4410	2	Katup Pengaman	PSV-T3 B2	1395000	> dia 6"	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4411	2	Katup Pengaman	PSV-T3 B3	1395000	> dia 6"	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4412	2	Katup Pengaman	PSV-T3 B3	1395000	> dia 6"	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4413	1	Peralatan Putar	Pompa Blending  (HAP 52)	17000000	-	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4414	1	Peralatan Putar	Pompa HAP 42 	17000000	-	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4415	1	Peralatan Putar	 Pompa HAP 32 	17000000	-	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4416	1	Peralatan Putar	 Pompa HAP 32 	17000000	-	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4417	1	Peralatan Putar	 Pompa HAP 32 	17000000	-	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4418	1	Peralatan Putar	Pompa Musicool 	17000000	-	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4419	1	Peralatan Putar	Pompa Musicool 	17000000	-	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4420	1	Peralatan Putar	Pompa Musicool 	17000000	-	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4421	1	Peralatan Putar	Pompa Mercaptan	17000000	-	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4422	1	Peralatan Putar	Pompa Mercaptan	17000000	-	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4423	1	Peralatan Putar	Pompa Mercaptan	17000000	-	-	-	43	-	2023-02-22 08:08:41	2023-02-22 08:08:41	\N
4424	1	Bejana Tekan	-	13938400	<5 m3	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4425	1	Bejana Tekan	-	13938400	<5 m3	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4426	1	Bejana Tekan	-	13938400	<5 m3	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4427	1	Bejana Tekan	-	13938400	<5 m3	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4428	1	Bejana Tekan	-	13938400	<5 m3	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4429	1	Bejana Tekan	-	13938400	<5 m3	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4430	1	Bejana Tekan	-	13938400	<5 m3	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4431	1	Bejana Tekan	-	13938400	<5 m3	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4432	1	Bejana Tekan	-	13938400	<5 m3	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4433	1	Bejana Tekan	-	13938400	<5 m3	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4434	1	Bejana Tekan	-	13938400	<5 m3	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4435	1	Bejana Tekan	-	3632898	<5 m3	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4436	1	Bejana Tekan	-	3632898	5 m3 < Vol < 25 m3	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4437	1	Bejana Tekan	-	3632898	5 m3 < Vol < 25 m3	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4438	1	Bejana Tekan	-	3632898	5 m3 < Vol < 25 m3	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4439	1	Bejana Tekan	-	3632898	5 m3 < Vol < 25 m3	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4440	1	Bejana Tekan	-	3770000	>50 m3	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4441	1	Bejana Tekan	-	3770000	>50 m3	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4442	1	Peralatan Listrik	-	1640000	-	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4443	5	Instalasi	-	80000000	-	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4444	1	Katup Pengaman	-	1395000	<2 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4445	1	Katup Pengaman	-	1395000	<2 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4446	1	Katup Pengaman	-	1395000	<2 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4447	1	Katup Pengaman	-	1395000	<2 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4448	1	Katup Pengaman	-	1395000	<2 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4449	1	Katup Pengaman	-	1395000	<2 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4450	1	Katup Pengaman	-	1395000	<2 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4451	1	Katup Pengaman	-	1395000	<2 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4452	1	Katup Pengaman	-	1395000	<2 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4453	1	Katup Pengaman	-	1395000	<2 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4454	1	Katup Pengaman	-	1395000	<2 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4455	1	Katup Pengaman	-	1395000	<2 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4456	1	Katup Pengaman	-	1395000	<2 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4457	1	Katup Pengaman	-	1395000	<2 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4458	1	Katup Pengaman	-	1395000	<2 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4459	1	Katup Pengaman	-	1395000	<2 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4460	1	Katup Pengaman	-	1395000	<2 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4462	1	Katup Pengaman	-	1395000	<2 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4463	1	Katup Pengaman	-	1395000	<2 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4464	1	Katup Pengaman	-	1395000	<2 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4465	1	Katup Pengaman	-	1395000	<2 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4466	1	Katup Pengaman	-	1395000	<2 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4467	1	Katup Pengaman	-	1395000	<2 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4468	1	Katup Pengaman	-	1395000	<2 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4469	1	Katup Pengaman	-	1395000	>6 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4470	1	Katup Pengaman	-	1395000	>6 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4471	1	Katup Pengaman	-	1395000	>6 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4472	1	Katup Pengaman	-	1395000	>6 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4473	1	Katup Pengaman	-	1395000	>6 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4474	1	Katup Pengaman	-	1395000	>6 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4475	1	Katup Pengaman	-	1395000	>6 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4476	1	Katup Pengaman	-	1395000	>6 "	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4477	1	Pesawat Angkat	-	16800000	<=25 Ton	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4478	1	Peralatan Putar	-	2720000	-	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4479	1	Peralatan Putar	-	2720000	-	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4480	1	Peralatan Putar	-	2720000	-	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4481	1	Peralatan Putar	-	2720000	-	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4482	1	Peralatan Putar	-	2720000	-	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4483	1	Peralatan Putar	-	2720000	-	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4484	1	Peralatan Putar	-	2720000	-	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4485	1	Peralatan Putar	-	2720000	-	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4486	1	Peralatan Putar	-	2720000	-	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4487	1	Peralatan Putar	-	2720000	-	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4488	1	Peralatan Putar	-	2720000	-	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4489	1	Tangki Penimbun	-	9217500	Dia < 15m	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4490	1	Tangki Penimbun	-	9217500	15 m < Dia < 36 m	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4491	1	Tangki Penimbun	-	9217500	15 m < Dia < 36 m	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4492	1	Tangki Penimbun	-	9217500	15 m < Dia < 36 m	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4493	1	Tangki Penimbun	-	9217500	15 m < Dia < 36 m	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4494	1	Peralatan Listrik	-	1340000	-	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4495	1	Peralatan Listrik	-	1340000	-	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
4496	1	Peralatan Listrik	-	1340000	-	-	-	10	-	2023-02-22 08:15:15	2023-02-22 08:15:15	\N
2899	2	Pipa Penyalur	Bio Solar Line	5500000	< 20Km Above Ground	-	-	27	[null]	2023-02-22 07:56:40	2023-02-22 09:26:34	\N
2901	2	Pipa Penyalur	Pertamax Line	5500000	< 20Km Above Ground	-	-	27	[null]	2023-02-22 07:56:40	2023-02-22 09:26:55	\N
4351	3	Peralatan Listrik	G-04/X14G285712	1640000	-	-	-	41	-	2023-02-22 08:00:10	2023-02-22 22:02:40	\N
4352	3	Peralatan Listrik	G-04/X14G285713	1640000	-	-	-	41	-	2023-02-22 08:00:10	2023-02-22 22:02:40	\N
4353	3	Instalasi	-	90000000	-	-	-	41	-	2023-02-22 08:00:10	2023-02-22 22:02:40	\N
4354	3	Peralatan Listrik	MCC-01	1340000	-	-	-	41	-	2023-02-22 08:00:10	2023-02-22 22:02:40	\N
4355	3	Peralatan Putar	POMPA BOSTER 1	17000000	-	-	-	41	-	2023-02-22 08:00:10	2023-02-22 22:02:40	\N
4356	3	Peralatan Putar	POMPA BOSTER 2	17000000	-	-	-	41	-	2023-02-22 08:00:10	2023-02-22 22:02:40	\N
4357	3	Peralatan Putar	POMPA PIT STOP 1	17000000	-	-	-	41	-	2023-02-22 08:00:10	2023-02-22 22:02:40	\N
4358	3	Peralatan Putar	POMPA PIT STOP 2 (NEW)	17000000	-	-	-	41	-	2023-02-22 08:00:10	2023-02-22 22:02:40	\N
4359	3	Peralatan Listrik	SWG-01	1340000	-	-	-	41	-	2023-02-22 08:00:10	2023-02-22 22:02:40	\N
4360	3	Peralatan Listrik	SWG-01	1340000	-	-	-	41	-	2023-02-22 08:00:10	2023-02-22 22:02:40	\N
4362	3	Tangki Penimbun	T-2	20491639	16 m <diam<36 m	-	-	41	-	2023-02-22 08:00:10	2023-02-22 22:02:40	\N
4363	3	Tangki Penimbun	T-3	20491639	17 m <diam<36 m	-	-	41	-	2023-02-22 08:00:10	2023-02-22 22:02:40	\N
4364	3	Tangki Penimbun	T-4	20491639	18 m <diam<36 m	-	-	41	-	2023-02-22 08:00:11	2023-02-22 22:02:40	\N
4365	3	Tangki Penimbun	T-5	20491639	19 m <diam<36 m	-	-	41	-	2023-02-22 08:00:11	2023-02-22 22:02:40	\N
4366	3	Tangki Penimbun	T-6	20491639	20 m <diam<36 m	-	-	41	-	2023-02-22 08:00:11	2023-02-22 22:02:40	\N
4367	3	Tangki Penimbun	T-7	20491639	21 m <diam<36 m	-	-	41	-	2023-02-22 08:00:11	2023-02-22 22:02:40	\N
4368	3	Tangki Penimbun	T-10	20491639	22 m <diam<36 m	-	-	41	-	2023-02-22 08:00:11	2023-02-22 22:02:40	\N
4369	3	Tangki Penimbun	T-11	20491639	23 m <diam<36 m	-	-	41	-	2023-02-22 08:00:11	2023-02-22 22:02:40	\N
4370	3	Tangki Penimbun	T-12	20491639	24 m <diam<36 m	-	-	41	-	2023-02-22 08:00:11	2023-02-22 22:02:40	\N
4371	3	Tangki Penimbun	T-13	20491639	25 m <diam<36 m	-	-	41	-	2023-02-22 08:00:11	2023-02-22 22:02:40	\N
4372	3	Tangki Penimbun	T-23	20491639	26 m <diam<36 m	-	-	41	-	2023-02-22 08:00:11	2023-02-22 22:02:40	\N
4373	3	Tangki Penimbun	T-24	20491639	27 m <diam<36 m	-	-	41	-	2023-02-22 08:00:11	2023-02-22 22:02:40	\N
4374	3	Tangki Penimbun	Feedstock 01 / 28	20491639	28 m <diam<36 m	-	-	41	-	2023-02-22 08:00:11	2023-02-22 22:02:40	\N
4375	3	Tangki Penimbun	T-14	28200000	36 m <diam<60 m	-	-	41	-	2023-02-22 08:00:11	2023-02-22 22:02:40	\N
4376	3	Tangki Penimbun	T-15	28200000	37 m <diam<60 m	-	-	41	-	2023-02-22 08:00:11	2023-02-22 22:02:40	\N
4377	3	Tangki Penimbun	T-16	28200000	38 m <diam<60 m	-	-	41	-	2023-02-22 08:00:11	2023-02-22 22:02:40	\N
4378	3	Tangki Penimbun	T-17	28200000	39 m <diam<60 m	-	-	41	-	2023-02-22 08:00:11	2023-02-22 22:02:40	\N
4379	3	Tangki Penimbun	T-18	28200000	40 m <diam<60 m	-	-	41	-	2023-02-22 08:00:11	2023-02-22 22:02:40	\N
4380	3	Tangki Penimbun	T-19	28200000	41 m <diam<60 m	-	-	41	-	2023-02-22 08:00:11	2023-02-22 22:02:40	\N
4381	3	Tangki Penimbun	T-21	28200000	42 m <diam<60 m	-	-	41	-	2023-02-22 08:00:11	2023-02-22 22:02:40	\N
4382	3	Tangki Penimbun	T-22	28200000	43 m <diam<60 m	-	-	41	-	2023-02-22 08:00:11	2023-02-22 22:02:40	\N
4383	3	Peralatan Listrik	Trafo A	23500000	-	-	-	41	-	2023-02-22 08:00:11	2023-02-22 22:02:40	\N
4384	3	Peralatan Listrik	Trafo B	23500000	-	-	-	41	-	2023-02-22 08:00:11	2023-02-22 22:02:40	\N
4361	3	Tangki Penimbun	T-1	18000000	15 m <diam<36 m	-	-	41	-	2023-02-22 08:00:10	2023-02-23 07:23:31	\N
4498	1	Contoh Alat	Steker	25000	-	-	-	41	-	2023-02-23 07:23:31	2023-02-23 07:23:31	\N
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.categories (id, cat_id, cat_name, created_at, updated_at) FROM stdin;
1	tt	Tangki Timbun	2023-03-06 11:35:34	\N
3	ppu	Perangkat Putar	2023-03-06 11:35:34	\N
4	kp	Katup Pengaman	2023-03-06 11:35:34	\N
5	bt	Bejana Tekan	2023-03-06 11:35:34	\N
6	pa	Pesawat Angkat	2023-03-06 11:35:34	\N
7	ppe	Pipa Penyalur	2023-03-06 11:35:34	\N
9	pl	Peralatan Listrik	2023-03-06 11:35:34	\N
8	ins	Instalasi	2023-03-06 11:35:34	\N
2	met	Metering	2023-03-06 11:35:34	\N
\.


--
-- Data for Name: certifications; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.certifications (id, cert_title, description, expired_date, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: coi_activities; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.coi_activities (id, coi_id, user_id, activity, created_at, updated_at, notes) FROM stdin;
1	4	1	Create new COI	2023-05-04 13:39:29	\N	\N
\.


--
-- Data for Name: coi_templates; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.coi_templates (id, equipment, template, technical, created_at, updated_at, additional) FROM stdin;
1	Pipa Penyalur	<p contenteditable="true">PT. Biro Klasifikasi Indonesia (Persero) berdasarkan :<span class="translate">PT. Biro Klasifikasi Indonesia (Persero), based on :</span></p><ol contenteditable="true"><li><p>Peraturan Menteri Enegi dan Sumber Daya Mineral Republik Indonesia No. 32 Tahun 2021;<span class="translate">Regulation Ministry of Mining and Energy Republic of Indonesia No. 32, 2021</span></p></li><li><p>Surat Kemampuan Usaha Penunjang (SKUP) Migas No. 1131/19.07/DMB/2018;<span class="translate">Surat Kemampuan Usaha Penunjang (SKUP) Migas No. 1131/19.07/DMB/2018;</span></p></li><li><p>Kontrak Jasa Teknis No. :nomor_spk perihal :tipe peralatan :equipment<span class="translate">Contract service No. :nomor_spk about Equipmemt :tipe :equipment</span></p></li><li><p>Berita acara Pemeriksaan Keselamatan Migas tanggal :tanggal_ba<span class="translate">Minutes of Safely Inspection of Ditjen Migas dated :tanggal_ba</span></p></li></ol><p contenteditable="true">Dengan ini menerangkan bahwa PT. Biro Klasifikasi Indonesia (Persero) telah melaksanakan inspeksi terhadap :equipment berikut ini :<span class="translate">This is to certify that PT. Biro Klasifikasi Indonesia (Persero) has carried out inspection of the following :equipment :</span></p><table style="width:60%" cellspacing="0" cellpadding="0" contenteditable="true"><tbody><tr><td><p>Pemilik / Pengguna<span class="translate">Owner / User</span></p></td><td>:</td><td>:owner</td></tr><tr><td><p>Tag No. / Serial No.<span class="translate">Tag No. / Serial No.</span></p></td><td>:</td><td>:tag_number</td></tr><tr><td><p>Kapasitas<span class="translate">Capacity</span></p></td><td>:</td><td>:capacity</td></tr><tr><td><p>Lokasi<span class="translate">Location</span></p></td><td>:</td><td>:location</td></tr><tr><td><p>referensi<span class="translate">Reference(s)</span></p></td><td>:</td><td>:reference</td></tr></tbody></table><p contenteditable="true">Berdasarkan hasil sesuai lingkup inspeksi sebagai berikut :<span class="translate">Based on result of scope of inspection</span></p><ol contenteditable="true"><li><p>PT. Biro Klasifikasi Indonesia (Persero) menyatakan bahwa Kondisi :equipment tersebut telah memenuhi persyaratan regulasi pemerintah dan referensi yang diacu;<span class="translate">PT. Biro Klasifikasi Indonesia concludes that :equipment was found comply to government regulation and reference(s);</span></p></li><li><p>Sertifikat ini dapat ditinjau kembali apabila terjadi hal – hal yang menyebabkan :equipment tersebut tidak layak dan tidak aman untuk dioperasikan.<span class="translate">This certificate will be reconsidered, if there is any matters that caused the :equipment is not feasible and unsafe to be operated.</span></p></li></ol><p contenteditable="true">Sertifikat ini berlaku sejak tanggal diterbitkan dan berakhir pada tanggal <mark data-markjs="true">:now</mark> sesuai dengan Laporan Pemeriksaan sebagaimana terlampir.<span class="translate">This certificate is valid from the date of issuance and expired on <mark data-markjs="true">:now</mark> in accordance with the Inspection Report as attached.</span></p>	{"name": ["Nama", "Tipe"], "trans": ["Name", "Type"]}	\N	\N	\N
3	Contoh Alat	<p contenteditable="true">PT. Biro Klasifikasi Indonesia (Persero) berdasarkan :<span class="translate">PT. Biro Klasifikasi Indonesia (Persero), based on :</span></p><ol contenteditable="true"><li><p>Peraturan Menteri Enegi dan Sumber Daya Mineral Republik Indonesia No. 32 Tahun 2021;<span class="translate">Regulation Ministry of Mining and Energy Republic of Indonesia No. 32, 2021</span></p></li><li><p>Surat Kemampuan Usaha Penunjang (SKUP) Migas No. 1131/19.07/DMB/2018;<span class="translate">Surat Kemampuan Usaha Penunjang (SKUP) Migas No. 1131/19.07/DMB/2018;</span></p></li><li><p>Kontrak Jasa Teknis No. :nomor_spk perihal :tipe peralatan :equipment<span class="translate">Contract service No. :nomor_spk about Equipmemt :tipe :equipment</span></p></li><li><p>Berita acara Pemeriksaan Keselamatan Migas tanggal :tanggal_ba<span class="translate">Minutes of Safely Inspection of Ditjen Migas dated :tanggal_ba</span></p></li></ol><p contenteditable="true">Dengan ini menerangkan bahwa PT. Biro Klasifikasi Indonesia (Persero) telah melaksanakan inspeksi terhadap :equipment berikut ini :<span class="translate">This is to certify that PT. Biro Klasifikasi Indonesia (Persero) has carried out inspection of the following :equipment :</span></p><table style="width:60%" cellspacing="0" cellpadding="0" contenteditable="true"><tbody><tr><td><p>Pemilik / Pengguna<span class="translate">Owner / User</span></p></td><td>:</td><td>:owner</td></tr><tr><td><p>Tag No. / Serial No.<span class="translate">Tag No. / Serial No.</span></p></td><td>:</td><td>:tag_number</td></tr><tr><td><p>Kapasitas<span class="translate">Capacity</span></p></td><td>:</td><td>:capacity</td></tr><tr><td><p>Lokasi<span class="translate">Location</span></p></td><td>:</td><td>:location</td></tr><tr><td><p>referensi<span class="translate">Reference(s)</span></p></td><td>:</td><td>:reference</td></tr></tbody></table><p contenteditable="true">Berdasarkan hasil sesuai lingkup inspeksi sebagai berikut :<span class="translate">Based on result of scope of inspection</span></p><ol contenteditable="true"><li><p>PT. Biro Klasifikasi Indonesia (Persero) menyatakan bahwa Kondisi :equipment tersebut telah memenuhi persyaratan regulasi pemerintah dan referensi yang diacu;<span class="translate">PT. Biro Klasifikasi Indonesia concludes that :equipment was found comply to government regulation and reference(s);</span></p></li><li><p>Sertifikat ini dapat ditinjau kembali apabila terjadi hal – hal yang menyebabkan :equipment tersebut tidak layak dan tidak aman untuk dioperasikan.<span class="translate">This certificate will be reconsidered, if there is any matters that caused the :equipment is not feasible and unsafe to be operated.</span></p></li></ol><p contenteditable="true">Sertifikat ini berlaku sejak tanggal diterbitkan dan berakhir pada tanggal :now sesuai dengan Laporan Pemeriksaan sebagaimana terlampir.<span class="translate">This certificate is valid from the date of issuance and expired on :now in accordance with the Inspection Report as attached.</span></p>	\N	\N	\N	\N
2	Bejana Tekan	<p contenteditable="true">PT. Biro Klasifikasi Indonesia (Persero) berdasarkan :<span class="translate">PT. Biro Klasifikasi Indonesia (Persero), based on :</span></p><ol contenteditable="true"><li><p>Peraturan Menteri Enegi dan Sumber Daya Mineral Republik Indonesia No. 32 Tahun 2021;<span class="translate">Regulation Ministry of Mining and Energy Republic of Indonesia No. 32, 2021</span></p></li><li><p>Surat Kemampuan Usaha Penunjang (SKUP) Migas No. 1131/19.07/DMB/2018;<span class="translate">Surat Kemampuan Usaha Penunjang (SKUP) Migas No. 1131/19.07/DMB/2018;</span></p></li><li><p>Kontrak Jasa Teknis No. :nomor_spk perihal :tipe peralatan :equipment<span class="translate">Contract service No. :nomor_spk about Equipmemt :tipe :equipment</span></p></li><li><p>Berita acara Pemeriksaan Keselamatan Migas tanggal :tanggal_ba<span class="translate">Minutes of Safely Inspection of Ditjen Migas dated :tanggal_ba</span></p></li></ol><p contenteditable="true">Dengan ini menerangkan bahwa PT. Biro Klasifikasi Indonesia (Persero) telah melaksanakan inspeksi terhadap :equipment berikut ini :<span class="translate">This is to certify that PT. Biro Klasifikasi Indonesia (Persero) has carried out inspection of the following :equipment :</span></p><table style="width:60%" cellspacing="0" cellpadding="0" contenteditable="true"><tbody><tr><td><p>Pemilik / Pengguna<span class="translate">Owner / User</span></p></td><td>:</td><td><mark data-markjs="true">:owner</mark></td></tr><tr><td><p>Tag No. / Serial No.<span class="translate">Tag No. / Serial No.</span></p></td><td>:</td><td><mark data-markjs="true">:tag_number</mark></td></tr><tr><td><p>Kapasitas<span class="translate">Capacity</span></p></td><td>:</td><td><mark data-markjs="true">:capacity</mark></td></tr><tr><td><p>Lokasi<span class="translate">Location</span></p></td><td>:</td><td><mark data-markjs="true">:location</mark></td></tr><tr><td><p>Referensi<span class="translate">Reference(s)</span></p></td><td>:</td><td><mark data-markjs="true">:reference</mark></td></tr></tbody></table><p contenteditable="true">Berdasarkan hasil sesuai lingkup inspeksi sebagai berikut :<span class="translate">Based on result of scope of inspection</span></p><ol contenteditable="true"><li><p>PT. Biro Klasifikasi Indonesia (Persero) menyatakan bahwa Kondisi <mark data-markjs="true">:equipment</mark> tersebut telah memenuhi persyaratan regulasi pemerintah dan referensi yang diacu;<span class="translate">PT. Biro Klasifikasi Indonesia concludes that <mark data-markjs="true">:equipment</mark> was found comply to government regulation and reference(s);</span></p></li><li><p>Sertifikat ini dapat ditinjau kembali apabila terjadi hal – hal yang menyebabkan <mark data-markjs="true">:equipment</mark> tersebut tidak layak dan tidak aman untuk dioperasikan.<span class="translate">This certificate will be reconsidered, if there is any matters that caused the <mark data-markjs="true">:equipment</mark> is not feasible and unsafe to be operated.</span></p></li></ol><p contenteditable="true">Sertifikat ini berlaku sejak tanggal diterbitkan dan berakhir pada tanggal <mark data-markjs="true">:now</mark> sesuai dengan Laporan Pemeriksaan sebagaimana terlampir.<span class="translate">This certificate is valid from the date of issuance and expired on <mark data-markjs="true">:now</mark> in accordance with the Inspection Report as attached.</span></p>	{"name": ["Nama"], "trans": ["Name"]}	\N	\N	\N
\.


--
-- Data for Name: cois; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.cois (id, coi_no, basic_law, spk_detail, detail_report, equipment, description, location, coi_date, owner, tag_no, reference, expire_date, technical, created_at, updated_at) FROM stdin;
4	123	\N	\N	\N	Bejana Tekan	-	Papua - Maluku	2023-05-04	-	Filter	123	2023-05-04	{"name": "123", "load_test": {"remark": ["123"], "result": ["123"], "test_load": ["123"], "deflection_max": ["123"], "deflection_actual": ["123"], "safe_working_load": ["123"]}}	2023-05-04 13:39:29	2023-05-04 13:39:29
\.


--
-- Data for Name: delivery_orders; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.delivery_orders (id, do_no, company_name, project_value, do_date, created_at, updated_at) FROM stdin;
1	020a/KSO.BKI-SCI-SI/DO-XI/2020	PT. BKI (Persero)	241845796	2020-11-25	2023-02-05 07:49:50	2023-02-05 07:49:50
2	021a/KSO.BKI-SCI-SI/DO-VII/2022	PT. BKI (Persero)	729400000	2023-02-16	2023-02-05 09:22:55	2023-02-05 09:22:55
4	012/KSO.BKI-SCI-SI/DO-VI/2022	PT. BKI (Persero)	277830444	2023-02-14	2023-02-06 01:43:11	2023-02-06 01:43:11
5	014/KSO.BKI-SCI-SI/DO-VI/2022	PT. BKI (Persero)	256400000	2023-02-14	2023-02-06 02:23:38	2023-02-06 02:23:38
7	021b/KSO.BKI-SCI-SI/DO-VII/2022	PT. BKI (Persero)	494618800	2023-02-22	2023-02-22 03:41:00	2023-02-22 08:13:06
8	0014/KSO.BKI-SCI-SI/DO-XI/2020	PT. BKI (Persero)	220928694	2023-02-22	2023-02-22 08:45:26	2023-02-22 08:45:26
9	029/KSO.BKI-SCI-SI/DO-VIII/2022	PT. BKI (Persero)	375052651	2023-02-22	2023-02-22 08:45:40	2023-02-22 08:45:40
10	TP.01.01/LPG-BLG/00212/II/2020	PT. BKI (Persero)	734314028	2023-02-22	2023-02-22 08:46:12	2023-02-22 08:46:12
11	030/KSO.BKI-SCI-SI/DO-VIII/2022	PT. BKI (Persero)	331454752	2023-02-22	2023-02-22 08:47:22	2023-02-22 08:47:22
12	4600000707	PT. BKI (Persero)	246804218	2023-02-22	2023-02-22 08:47:56	2023-02-22 08:47:56
13	033/KSO.BKI-SCI-SI/DO-VIII/2022	PT. BKI (Persero)	415873997	2023-02-22	2023-02-22 08:48:39	2023-02-22 08:48:39
14	4600000706.1	PT. BKI (Persero)	605880000	2023-02-22	2023-02-22 08:49:08	2023-02-22 08:49:08
15	034/KSO.BKI-SCI-SI/DO-VIII/2022	PT. BKI (Persero)	382316511	2023-02-22	2023-02-22 08:49:35	2023-02-22 08:49:35
16	4600000706.2	PT. BKI (Persero)	543479668	2023-02-22	2023-02-22 08:49:44	2023-02-22 08:49:44
17	012aa/KSO.BKI-SCI-SI/DO-VI/2022	PT. BKI (Persero)	403529390	2023-02-22	2023-02-22 08:51:28	2023-02-22 08:51:28
3	015/KSO.BKI-SCI-SI/DO-VI/2022	PT. BKI (Persero)	264829600	2023-02-15	2023-02-05 10:11:25	2023-02-22 08:51:58
18	021b/KSO.BKI-SCI-SI/DO-XI/2021	PT. BKI (Persero)	263657500	2023-02-22	2023-02-22 08:52:13	2023-02-22 08:52:13
19	060/KSO.BKI-SCI-SI/DO-XII/2022	PT. BKI (Persero)	2119000000	2023-02-22	2023-02-22 08:59:25	2023-02-22 08:59:25
50	042/KSO.BKI-SCI-SI/DO-X/2022	PT. BKI (Persero)	481432500	2023-02-22	2023-02-22 09:17:40	2023-02-22 09:17:40
51	035/KSO.BKI-SCI-SI/DO-VIII/2022	PT. BKI (Persero)	1854607000	2023-02-22	2023-02-22 09:18:39	2023-02-22 09:18:39
52	036/KSO.BKI-SCI-SI/DO-VIII/2022	PT. BKI (Persero)	1913533860	2023-02-22	2023-02-22 09:19:16	2023-02-22 09:19:16
53	037a/KSO.BKI-SCI-SI/DP-VIII/2022	PT. BKI (Persero)	760616473	2023-02-22	2023-02-22 09:20:08	2023-02-22 09:20:08
54	031/KSO.BKI-SCI-SI/DO-VIII/2022	PT. BKI (Persero)	603951388	2023-02-22	2023-02-22 09:20:51	2023-02-22 09:20:51
55	021/KSO.BKI-SCI-SI/DO-VII/2022	PT. BKI (Persero)	189596748	2023-02-22	2023-02-22 09:24:18	2023-02-22 09:24:18
56	020/KSO.BKI-Sci-SI/DO-VII/2022	PT. BKI (Persero)	209214500	2023-02-22	2023-02-22 09:25:00	2023-02-22 09:25:00
57	016/KSO.BKI-SCI-SI/DO-VI/2022	PT. BKI (Persero)	1039052600	2023-02-22	2023-02-22 09:26:45	2023-02-22 09:26:45
58	018/KSO.BKI-SCI-SI/DO-VI/2022	PT. BKI (Persero)	678441750	2023-02-22	2023-02-22 09:27:47	2023-02-22 09:27:47
59	017/KSO.BKI-SCI-SI/DO-VI/2022	PT. BKI (Persero)	600976382	2023-02-22	2023-02-22 09:28:20	2023-02-22 09:28:20
60	122/PND970000/2022-S7	PT. BKI (Persero)	219340000	2023-02-22	2023-02-22 09:30:01	2023-02-22 09:30:01
61	037/KSO.BKI-SCI-SI/DO-VIII/2022	PT. BKI (Persero)	196211391	2023-02-22	2023-02-22 09:31:57	2023-02-22 09:31:57
62	122/PND970000/2022-S7	PT. BKI (Persero)	384882376	2023-02-22	2023-02-22 09:33:50	2023-02-22 09:33:50
63	038/KSO.BKI-SCI-SI/DO-VIII/2022	PT. BKI (Persero)	449500000	2023-02-22	2023-02-22 09:34:30	2023-02-22 09:34:30
64	122/PND970000/2022-S7	PT. BKI (Persero)	134000000	2023-02-22	2023-02-22 09:35:53	2023-02-22 09:35:53
65	0003/KSO.BKI-SCI-SI/DO-VII/2021	PT. BKI (Persero)	773487894	2023-02-22	2023-02-22 09:41:12	2023-02-22 09:41:12
66	0004/KSO.BKI-SCI-SI/DO-VII/2021	PT. BKI (Persero)	1646542800	2023-02-22	2023-02-22 09:41:58	2023-02-22 09:41:58
67	032/KSO.BKI-SCI-SI/DO-VIII/2022	PT. BKI (Persero)	347767128	2023-02-22	2023-02-22 09:43:17	2023-02-22 09:43:17
68	023/KSO.BKI-SCI-SI/DO-VI/2022	PT. BKI (Persero)	2209364955	2023-02-22	2023-02-22 09:45:16	2023-02-22 09:45:16
69	122/PND970000/2022-S7	PT. BKI (Persero)	615468184	2023-02-22	2023-02-22 09:47:22	2023-02-22 09:47:22
70	056/KSO.BKI-SCI-SI/DO-XI/2022	PT. BKI (Persero)	474090400	2023-02-22	2023-02-22 09:48:35	2023-02-22 09:48:35
71	055/KSO.BKI-SCI-SI/DO-XI/2022	PT. BKI (Persero)	589894346	2023-02-22	2023-02-22 09:50:52	2023-02-22 09:50:52
72	066/KSO.BKI-SCI-SI/DO-XII/2022	PT. BKI (Persero)	301000000	2023-02-22	2023-02-22 09:51:32	2023-02-22 09:51:32
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: job_executors; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.job_executors (id, sos_no, inspector, inspection_date, document_check, job_status, minutes_no, minutes_note, minutes_date, coi_no, coi_date, expired_date, notes, pic_company, bast_date, plo_number, plo_date, created_at, updated_at, template) FROM stdin;
457	0014/KSO.BKI-SCI-SI/SOS-XI/2020	7	2023-01-20	t	3	BA-SAM-001	BA-SAM-001	2023-01-20	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:10:31	2023-02-22 21:40:13	\N
458	0014/KSO.BKI-SCI-SI/SOS-XI/2020	7	2023-01-20	t	3	BA-SAM-001	BA-SAM-001	2023-01-20	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:10:31	2023-02-22 21:40:13	\N
88	013/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-18	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 01:10:09	2023-02-06 01:32:28	\N
460	0014/KSO.BKI-SCI-SI/SOS-XI/2020	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:10:31	2023-02-22 21:40:13	\N
62	002/BKI/SOS-XII/2022	7	2021-08-19	t	7	BA-WAYAME/2021	-	2021-08-19	4919-02-ENI/67/E06-L11/P1/2022	2022-06-27	2027-06-27	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-14 02:08:17	\N
459	0014/KSO.BKI-SCI-SI/SOS-XI/2020	7	2023-02-22	t	1	BA-SAM-001	BA-SAM-001	2023-01-20	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:10:31	2023-02-22 21:40:13	\N
80	013/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-18	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 01:10:09	2023-02-06 01:32:28	\N
464	0014/KSO.BKI-SCI-SI/SOS-XI/2020	7	2023-01-22	t	2	BA-SAM-001	BA-SAM-001	2023-01-20	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:10:31	2023-02-22 21:40:13	\N
58	002/BKI/SOS-XII/2022	7	2021-08-19	t	7	BA-WAYAME/2021	-	2021-08-19	4914-02-ENI/67/E06-L11/P1/2022	2022-06-27	2027-06-27	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-14 02:04:09	\N
461	0014/KSO.BKI-SCI-SI/SOS-XI/2020	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:10:31	2023-02-22 21:40:13	\N
93	013/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-18	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 01:10:09	2023-02-06 01:32:28	\N
462	0014/KSO.BKI-SCI-SI/SOS-XI/2020	7	2023-01-20	t	3	BA-SAM-001	BA-SAM-001	2023-01-20	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:10:31	2023-02-22 21:40:13	\N
84	013/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-18	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 01:10:09	2023-02-06 01:32:28	\N
463	0014/KSO.BKI-SCI-SI/SOS-XI/2020	7	2023-01-21	t	2	BA-SAM-001	BA-SAM-001	2023-01-20	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:10:31	2023-02-22 21:40:13	\N
52	002/BKI/SOS-XII/2022	7	2021-08-19	t	7	BA-WAYAME/2021	-	2021-08-19	4908-02-ENI/67/E06-L11/P1/2022	2022-06-27	2027-06-27	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 23:12:06	\N
56	002/BKI/SOS-XII/2022	7	2021-08-19	t	7	BA-WAYAME/2021	-	2021-08-19	4912-02-ENI/67/E06-L11/P1/2022	2022-06-27	2027-06-27	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 23:13:30	\N
465	0014/KSO.BKI-SCI-SI/SOS-XI/2020	7	2023-01-23	t	2	BA-SAM-001	BA-SAM-001	2023-01-20	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:10:31	2023-02-22 21:40:13	\N
60	002/BKI/SOS-XII/2022	7	2021-08-19	t	7	BA-WAYAME/2021	-	2021-08-19	4918-02-ENI/67/E06-L11/P1/2022	2022-06-27	2027-06-27	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-14 02:07:27	\N
466	0014/KSO.BKI-SCI-SI/SOS-XI/2020	7	2023-01-24	t	2	BA-SAM-001	BA-SAM-001	2023-01-20	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:10:31	2023-02-22 21:40:13	\N
79	013/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-18	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 01:10:09	2023-02-06 01:32:28	\N
467	0014/KSO.BKI-SCI-SI/SOS-XI/2020	7	2023-01-25	t	2	BA-SAM-001	BA-SAM-001	2023-01-20	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:10:31	2023-02-22 21:40:13	\N
90	013/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-18	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 01:10:09	2023-02-06 01:32:28	\N
468	0014/KSO.BKI-SCI-SI/SOS-XI/2020	7	2023-02-22	t	1	BA-SAM-001	BA-SAM-001	2023-01-20	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:10:31	2023-02-22 21:40:13	\N
86	013/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-18	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 01:10:09	2023-02-06 01:32:28	\N
469	0014/KSO.BKI-SCI-SI/SOS-XI/2020	7	2023-02-22	t	1	BA-SAM-001	BA-SAM-001	2023-01-20	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:10:31	2023-02-22 21:40:13	\N
82	013/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-18	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 01:10:09	2023-02-06 01:32:28	\N
470	0014/KSO.BKI-SCI-SI/SOS-XI/2020	7	2023-02-22	t	1	BA-SAM-001	BA-SAM-001	2023-01-20	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:10:31	2023-02-22 21:40:13	\N
51	002/BKI/SOS-XII/2022	7	2021-08-19	t	7	BA-WAYAME/2021	-	2021-08-19	4907-02-ENI/67/E06-L11/P1/2022	2022-06-27	2027-06-27	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 23:11:45	\N
471	0014/KSO.BKI-SCI-SI/SOS-XI/2020	7	2023-02-22	t	1	BA-SAM-001	BA-SAM-001	2023-01-20	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:10:31	2023-02-22 21:40:13	\N
53	002/BKI/SOS-XII/2022	7	2021-08-19	t	7	BA-WAYAME/2021	-	2021-08-19	4909-02-ENI/67/E06-L11/P1/2022	2022-06-27	2027-06-27	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 23:12:28	\N
55	002/BKI/SOS-XII/2022	7	2021-08-19	t	7	BA-WAYAME/2021	-	2021-08-19	4911-02-ENI/67/E06-L11/P1/2022	2022-06-27	2027-06-27	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 23:13:12	\N
18	001/BKI/SOS-XII/2022	7	2020-12-16	t	7	0235-01-BAP-MSC/222/E01-L03/P1/2021	-	2020-12-16	0235-P02-02-MSC/222/E06-L03/P1/2021	2021-04-06	2026-04-06	\N	\N	\N	\N	\N	2023-02-05 08:19:24	2023-02-13 22:42:31	\N
40	002/BKI/SOS-XII/2022	7	2021-10-06	t	7	BA-WAYAME/2021	-	2021-10-06	4886-02-ENI/67/E08-L11/P1/2022	2022-05-09	2027-05-09	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 23:08:09	\N
57	002/BKI/SOS-XII/2022	7	2021-08-19	t	7	BA-WAYAME/2021	-	2021-08-19	4913-02-ENI/67/E06-L11/P1/2022	2022-06-27	2027-06-27	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 23:54:05	\N
41	002/BKI/SOS-XII/2022	7	2021-10-06	t	7	BA-WAYAME/2021	-	2021-10-06	4887-02-ENI/67/E08-L11/P1/2022	2022-05-09	2027-05-09	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 23:08:27	\N
59	002/BKI/SOS-XII/2022	7	2021-08-19	t	7	BA-WAYAME/2021	-	2021-08-19	4915-02-ENI/67/E06-L11/P1/2022	2022-06-27	2027-06-27	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-14 02:07:00	\N
42	002/BKI/SOS-XII/2022	7	2021-10-06	t	7	BA-WAYAME/2021	-	2021-10-06	4888-02-ENI/67/E08-L11/P1/2022	2022-05-09	2027-05-09	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 23:08:46	\N
61	002/BKI/SOS-XII/2022	7	2021-08-19	t	7	BA-WAYAME/2021	-	2021-08-19	4916-02-ENI/67/E06-L11/P1/2022	2022-06-27	2027-06-27	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-14 02:07:55	\N
43	002/BKI/SOS-XII/2022	7	2021-10-06	t	7	BA-WAYAME/2021	-	2021-10-06	4889-02-ENI/67/E08-L11/P1/2022	2022-05-09	2027-05-09	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 23:09:09	\N
63	002/BKI/SOS-XII/2022	7	2021-08-19	t	7	BA-WAYAME/2021	-	2021-08-19	4917-02-ENI/67/E06-L11/P1/2022	2022-06-27	2027-06-27	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-14 02:08:40	\N
44	002/BKI/SOS-XII/2022	7	2021-10-06	t	7	BA-WAYAME/2021	-	2021-10-06	4890-02-ENI/67/E08-L11/P1/2022	2022-05-09	2027-05-09	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 23:09:28	\N
456	0014/KSO.BKI-SCI-SI/SOS-XI/2020	7	2023-01-20	t	3	BA-SAM-001	BA-SAM-001	2023-01-20	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:10:31	2023-02-22 21:40:13	\N
45	002/BKI/SOS-XII/2022	7	2021-08-19	t	7	BA-WAYAME/2021	-	2021-08-19	4901-02-ENI/67/E06-L11/P1/2022	2022-06-27	2027-06-27	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 23:09:51	\N
91	013/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-18	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 01:10:09	2023-02-06 01:32:28	\N
46	002/BKI/SOS-XII/2022	7	2021-08-19	t	7	BA-WAYAME/2021	-	2021-08-19	4902-02-ENI/67/E06-L11/P1/2022	2022-06-27	2027-06-27	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 23:10:10	\N
89	013/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-18	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 01:10:09	2023-02-06 01:32:28	\N
47	002/BKI/SOS-XII/2022	7	2021-08-19	t	7	BA-WAYAME/2021	-	2021-08-19	4903-02-ENI/67/E06-L11/P1/2022	2022-06-27	2027-06-27	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 23:10:29	\N
87	013/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-18	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 01:10:09	2023-02-06 01:32:28	\N
48	002/BKI/SOS-XII/2022	7	2021-08-19	t	7	BA-WAYAME/2021	-	2021-08-19	4904-02-ENI/67/E06-L11/P1/2022	2022-06-27	2027-06-27	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 23:10:50	\N
85	013/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-18	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 01:10:09	2023-02-06 01:32:28	\N
49	002/BKI/SOS-XII/2022	7	2021-08-19	t	7	BA-WAYAME/2021	-	2021-08-19	4905-02-ENI/67/E06-L11/P1/2022	2022-06-27	2027-06-27	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 23:11:08	\N
83	013/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-18	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 01:10:09	2023-02-06 01:32:28	\N
50	002/BKI/SOS-XII/2022	7	2021-08-19	t	7	BA-WAYAME/2021	-	2021-08-19	4906-02-ENI/67/E06-L11/P1/2022	2022-06-27	2027-06-27	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 23:11:29	\N
81	013/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-18	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 01:10:09	2023-02-06 01:32:28	\N
54	002/BKI/SOS-XII/2022	7	2021-08-19	t	7	BA-WAYAME/2021	-	2021-08-19	4910-02-ENI/67/E06-L11/P1/2022	2022-06-27	2027-06-27	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 23:12:45	\N
118	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	\N	\N	2023-02-02	4859-02-ENI/67/E07-L11/P4/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-08 07:09:55	\N
92	013/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-18	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 01:10:09	2023-02-16 10:58:23	\N
77	013/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-18	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 01:10:09	2023-02-06 01:32:28	\N
76	013/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-18	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 01:10:09	2023-02-06 01:32:28	\N
998	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
999	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1000	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1005	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1006	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1007	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
64	002/BKI/SOS-XII/2022	7	2021-08-19	t	7	BA-WAYAME/2021	-	2021-08-19	4859-02-ENI/67/E07-L11/P4/2022	2022-05-20	2027-05-20	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-14 02:09:37	\N
1008	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1009	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1010	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1011	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1012	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
122	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-20	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
123	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-20	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
124	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-20	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
125	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-20	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
126	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-20	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
127	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-20	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
128	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-20	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
129	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-20	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
130	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-20	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
131	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-20	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
132	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-20	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
133	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-20	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
134	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-20	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
96	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	\N	\N	2023-01-11	4865-02-ENI/67/E08-L11/P1/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-08 07:01:41	\N
97	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	\N	\N	2023-01-12	4866-02-ENI/67/E08-L11/P1/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-08 07:02:11	\N
98	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	\N	\N	2023-01-13	4867-02-ENI/67/E08-L11/P1/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-08 07:02:27	\N
99	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	\N	\N	2023-01-14	4868-02-ENI/67/E08-L11/P1/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-08 07:02:56	\N
101	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	\N	\N	2023-01-16	4870-02-ENI/67/E08-L11/P1/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-08 07:03:28	\N
102	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	\N	\N	2023-01-17	4871-02-ENI/67/E08-L11/P1/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-08 07:03:48	\N
105	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	\N	\N	2023-01-20	4874-02-ENI/67/E08-L11/P1/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-08 07:04:59	\N
106	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	\N	\N	2023-01-21	4875-02-ENI/67/E08-L11/P1/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-06 02:30:34	\N
108	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	\N	\N	2023-01-23	4899-02-ENI/67/E06-L11/P1/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-08 07:06:29	\N
119	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	\N	\N	2023-02-03	4861-02-ENI/67/E07-L11/P4/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-08 07:51:21	\N
117	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	\N	\N	2023-02-01	4860-02-ENI/67/E07-L11/P4/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-08 07:09:36	\N
121	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-20	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
1013	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
120	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	\N	\N	2023-02-04	4862-02-ENI/67/E07-L11/P4/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-08 07:11:08	\N
1014	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
95	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	\N	\N	2023-01-10	4864-02-ENI/67/E08-L11/P1/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-08 07:00:55	\N
75	013/KSO.BKI-SCI-SI/SOS-VI/2022	4	2023-01-18	t	2	\N	\N	\N	123	2023-05-04	\N	\N	\N	\N	\N	\N	2023-02-06 01:10:09	2023-05-04 13:39:31	\N
135	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-20	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
136	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-20	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
137	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-20	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
138	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-20	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
139	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-20	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
141	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
142	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
143	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
144	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
145	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
146	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
147	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
148	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
149	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
150	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
151	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
997	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
109	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	\N	\N	2023-01-24	4898-02-ENI/67/E06-L11/P1/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-08 07:06:49	\N
107	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	\N	\N	2023-01-22	4900-02-ENI/67/E06-L11/P1/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-08 07:06:08	\N
155	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
156	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
157	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
158	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
159	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
160	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
27	001/BKI/SOS-XII/2022	7	2020-12-16	t	7	0235-01-BAP-MSC/222/E01-L03/P1/2021	-	2020-12-16	0235-02-T03-MSC/222/E01-L03/P1/2021	2021-04-06	2026-04-06	\N	\N	\N	\N	\N	2023-02-05 08:19:24	2023-02-13 22:46:45	\N
161	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
162	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
163	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
164	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
17	001/BKI/SOS-XII/2022	7	2020-12-16	t	7	0235-01-BAP-MSC/222/E01-L03/P1/2021	-	2020-12-16	0235-02-MCC01-MSC/222/E07-L03/P1/2021	2021-04-06	2026-04-06	\N	\N	\N	\N	\N	2023-02-05 08:19:24	2023-02-13 07:09:59	\N
165	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
166	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
167	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
168	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
169	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
170	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
172	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
545	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
100	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	\N	\N	2023-01-15	4869-02-ENI/67/E08-L11/P1/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-08 07:03:12	\N
103	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	\N	\N	2023-01-18	4872-02-ENI/67/E08-L11/P1/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-08 07:04:03	\N
104	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	\N	\N	2023-01-19	4873-02-ENI/67/E08-L11/P1/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-08 07:04:21	\N
110	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	\N	\N	2023-01-25	4897-02-ENI/67/E06-L11/P1/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-08 07:07:10	\N
111	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	\N	\N	2023-01-26	4896-02-ENI/67/E06-L11/P1/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-08 07:07:33	\N
112	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	\N	\N	2023-01-27	4895-02-ENI/67/E06-L11/P1/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-08 07:07:53	\N
113	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	\N	\N	2023-01-28	4894-02-ENI/67/E06-L11/P1/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-08 07:08:14	\N
114	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	\N	\N	2023-01-29	4893-02-ENI/67/E06-L11/P1/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-08 07:08:34	\N
115	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	\N	\N	2023-01-30	4892-02-ENI/67/E06-L11/P1/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-08 07:08:52	\N
116	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	\N	\N	2023-01-31	4891-02-ENI/67/E06-L11/P1/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-08 07:09:08	\N
153	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
19	001/BKI/SOS-XII/2022	7	2020-12-16	t	7	0235-01-BAP-MSC/222/E01-L03/P1/2021	-	2020-12-16	0235-P01-02-MSC/222/E06-L03/P1/2021	2021-04-06	2026-04-06	\N	\N	\N	\N	\N	2023-02-05 08:19:24	2023-02-13 22:42:57	\N
20	001/BKI/SOS-XII/2022	7	2020-12-16	t	7	0235-01-BAP-MSC/222/E01-L03/P1/2021	-	2020-12-16	0235-P03-02-MSC/222/E06-L03/P1/2021	2021-04-06	2026-04-06	\N	\N	\N	\N	\N	2023-02-05 08:19:24	2023-02-13 22:43:17	\N
21	001/BKI/SOS-XII/2022	7	2020-12-16	t	7	0235-01-BAP-MSC/222/E01-L03/P1/2021	-	2020-12-16	0235-02-PRV01-MSC/222/E10-L03/P1/2021	2021-04-06	2026-04-06	\N	\N	\N	\N	\N	2023-02-05 08:19:24	2023-02-13 22:43:43	\N
22	001/BKI/SOS-XII/2022	7	2020-12-16	t	7	0235-01-BAP-MSC/222/E01-L03/P1/2021	-	2020-12-16	0235-02-G01-MSC/222/E07-L03/P1/2021	2021-04-06	2026-04-06	\N	\N	\N	\N	\N	2023-02-05 08:19:24	2023-02-13 22:44:17	\N
23	001/BKI/SOS-XII/2022	7	2020-12-16	t	7	0235-01-BAP-MSC/222/E01-L03/P1/2021	-	2020-12-16	0235-02-PRV02-MSC/222/E10-L03/P1/2021	2021-04-06	2026-04-06	\N	\N	\N	\N	\N	2023-02-05 08:19:24	2023-02-13 22:44:46	\N
28	001/BKI/SOS-XII/2022	7	2020-12-16	t	7	0235-01-BAP-MSC/222/E01-L03/P1/2021	-	2020-12-16	0235-02-T04-MSC/222/E01-L03/P1/2021	2021-04-06	2026-04-06	\N	\N	\N	\N	\N	2023-02-05 08:19:24	2023-02-13 22:47:08	\N
25	001/BKI/SOS-XII/2022	7	2020-12-16	t	7	0235-01-BAP-MSC/222/E01-L03/P1/2021	-	2020-12-16	0235-02-T01-MSC/222/E01-L03/P1/2021	2021-04-06	2026-04-06	\N	\N	\N	\N	\N	2023-02-05 08:19:24	2023-02-13 22:45:48	\N
26	001/BKI/SOS-XII/2022	7	2020-12-16	t	7	0235-01-BAP-MSC/222/E01-L03/P1/2021	-	2020-12-16	0235-02-T02-MSC/222/E01-L03/P1/2021	2021-04-06	2026-04-06	\N	\N	\N	\N	\N	2023-02-05 08:19:24	2023-02-13 22:46:10	\N
29	001/BKI/SOS-XII/2022	7	2020-12-16	t	4	0235-01-BAP-MSC/222/E01-L03/P1/2021	-	2020-12-16	0258-02-INS-MSC/186/E01-L03/P1/2022	2021-04-06	2026-04-06	\N	\N	\N	PLO-001	2023-02-23	2023-02-05 08:19:24	2023-02-13 22:53:14	\N
30	002/BKI/SOS-XII/2022	7	2021-10-06	t	7	BA-WAYAME/2021	-	2021-10-06	4876-02-ENI/67/E08-L11/P1/2022	2022-05-09	2027-05-09	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 22:54:18	\N
31	002/BKI/SOS-XII/2022	7	2021-10-06	t	7	BA-WAYAME/2021	-	2021-10-06	4877-02-ENI/67/E08-L11/P1/2022	2022-05-09	2027-05-09	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 22:54:33	\N
32	002/BKI/SOS-XII/2022	7	2021-10-06	t	7	BA-WAYAME/2021	-	2021-10-06	4878-02-ENI/67/E08-L11/P1/2022	2022-05-09	2027-05-09	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 22:54:55	\N
33	002/BKI/SOS-XII/2022	7	2021-10-06	t	7	BA-WAYAME/2021	-	2021-10-06	4879-02-ENI/67/E08-L11/P1/2022	2022-05-09	2027-05-09	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 22:55:19	\N
34	002/BKI/SOS-XII/2022	7	2021-10-06	t	7	BA-WAYAME/2021	-	2021-10-06	4880-02-ENI/67/E08-L11/P1/2022	2022-05-09	2027-05-09	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 22:55:36	\N
35	002/BKI/SOS-XII/2022	7	2021-10-06	t	7	BA-WAYAME/2021	-	2021-10-06	4881-02-ENI/67/E08-L11/P1/2022	2022-05-09	2027-05-09	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 22:55:56	\N
36	002/BKI/SOS-XII/2022	7	2021-10-06	t	7	BA-WAYAME/2021	-	2021-10-06	4882-02-ENI/67/E08-L11/P1/2022	2022-05-09	2027-05-09	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 22:56:17	\N
37	002/BKI/SOS-XII/2022	7	2021-10-06	t	7	BA-WAYAME/2021	-	2021-10-06	4883-02-ENI/67/E08-L11/P1/2022	2022-05-09	2027-05-09	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 22:56:40	\N
38	002/BKI/SOS-XII/2022	7	2021-10-06	t	7	BA-WAYAME/2021	-	2021-10-06	4884-02-ENI/67/E08-L11/P1/2022	2022-05-09	2027-05-09	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 22:56:59	\N
39	002/BKI/SOS-XII/2022	7	2021-10-06	t	7	BA-WAYAME/2021	-	2021-10-06	4885-02-ENI/67/E08-L11/P1/2022	2022-05-09	2027-05-09	\N	\N	\N	\N	\N	2023-02-05 09:24:25	2023-02-13 22:57:15	\N
94	012/KSO.BKI-SCI-SI/SOS-VI/2022	7	2022-12-30	t	7	4863-02-BA/67/E08-L11/P1/2022	\N	2023-01-09	4863-02-ENI/67/E08-L11/P1/2022	2023-01-27	2025-01-27	\N	\N	\N	\N	\N	2023-02-06 02:03:41	2023-02-08 07:00:32	\N
546	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
24	001/BKI/SOS-XII/2022	7	2020-12-16	t	7	0235-01-BAP-MSC/222/E01-L03/P1/2021	-	2020-12-16	0235-02-PRV03-MSC/222/E10-L03/P1/2021	2021-04-06	2026-04-06	\N	\N	\N	\N	\N	2023-02-05 08:19:24	2023-02-13 22:45:22	\N
154	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
550	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
551	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
552	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
553	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
554	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
555	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
588	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
589	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
590	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
591	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
592	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
593	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
594	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
595	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
596	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
597	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
598	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
599	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
788	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:03	2023-02-22 16:09:07	\N
789	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:03	2023-02-22 16:09:07	\N
790	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:03	2023-02-22 16:09:07	\N
791	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:03	2023-02-22 16:09:07	\N
792	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:03	2023-02-22 16:09:07	\N
793	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:03	2023-02-22 16:09:07	\N
794	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:03	2023-02-22 16:09:07	\N
795	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:03	2023-02-22 16:09:07	\N
796	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:03	2023-02-22 16:09:07	\N
797	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:03	2023-02-22 16:09:07	\N
798	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
799	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
800	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
801	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
802	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
803	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
804	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
805	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
806	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
807	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
808	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
809	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
810	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
811	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
812	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
813	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
814	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
815	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
816	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
817	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
818	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
819	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
820	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
821	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
822	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
823	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
824	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
825	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
826	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
827	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
828	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
829	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
830	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
831	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
832	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
833	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
834	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
835	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
836	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
837	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
838	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
839	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
840	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
548	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
549	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
261	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
262	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
263	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
264	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
265	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
266	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
267	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
300	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
268	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
269	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
270	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
271	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
272	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
273	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
274	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
259	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
275	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
277	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
278	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
279	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
280	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
281	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
282	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
283	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
284	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
285	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
286	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
287	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
288	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
289	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
290	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
291	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
292	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
293	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
294	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
295	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
302	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
297	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
298	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
299	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
303	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
304	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
305	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
306	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
307	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
308	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
309	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
310	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
311	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
312	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
313	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
314	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
315	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
316	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
317	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
318	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
319	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
320	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
321	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
322	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
323	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
324	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
325	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
327	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
328	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
329	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
330	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
331	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
332	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
333	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
334	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
335	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
336	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
337	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
338	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
296	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
260	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
342	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
343	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
344	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
345	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
346	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
347	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
348	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
349	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
350	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
351	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
352	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
353	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
354	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
355	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
356	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
358	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
359	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
360	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
361	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
362	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
363	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
364	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
365	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
366	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
367	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
368	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
369	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
370	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
371	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
372	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
373	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
374	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
375	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
376	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
377	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
378	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
379	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
380	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
381	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
383	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
384	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
385	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
386	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
387	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
388	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
389	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
390	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
391	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
392	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
393	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
394	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
395	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
396	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
397	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
398	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
399	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
400	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
401	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
402	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
403	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
404	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
405	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
406	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
408	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
409	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
410	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
411	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
412	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
413	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
414	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
415	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
416	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
417	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
418	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
419	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
340	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
341	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
423	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
424	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
425	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
426	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
427	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
428	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
429	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
430	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
431	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
432	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
434	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
435	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
436	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
437	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
438	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
439	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
440	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
441	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
442	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
443	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
444	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
445	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
446	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
447	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
448	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
449	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
450	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
451	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
452	001/BKI/SOS-XII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:09:50	2023-02-22 13:09:50	\N
453	001/BKI/SOS-XII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:09:50	2023-02-22 13:09:50	\N
454	001/BKI/SOS-XII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:09:50	2023-02-22 13:09:50	\N
472	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
474	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
475	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
476	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
477	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
478	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
479	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
480	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
481	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
482	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
483	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
484	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
485	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
486	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
487	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
488	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
489	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
490	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
491	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
492	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
493	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
494	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
495	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
496	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
497	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
498	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
499	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
501	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
502	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
503	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
504	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
505	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
506	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
507	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
508	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
509	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
510	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
511	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
512	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
513	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
514	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
421	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
422	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
518	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
520	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
521	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
522	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
523	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
524	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
525	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
526	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
527	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
528	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
529	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
530	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
531	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
532	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
533	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
534	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
535	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
536	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
537	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
538	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
539	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
540	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
541	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
542	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
543	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
544	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
556	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
1016	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1017	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1018	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1019	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1020	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1021	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1022	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1023	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
574	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
1024	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1025	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1026	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1027	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1028	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1029	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1030	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1073	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1074	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1075	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1076	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1077	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1078	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
516	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
557	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
558	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
559	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
560	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
561	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
562	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
563	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
564	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
565	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
566	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
567	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
568	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
569	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
575	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
571	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
572	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
573	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
576	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
577	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
578	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
1015	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
570	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
517	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
582	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
583	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
584	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
585	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
586	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
587	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
841	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
1080	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1081	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1082	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1084	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1085	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1086	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:41	\N
1087	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:41	\N
1088	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:41	\N
1089	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:41	\N
1090	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:41	\N
1091	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:41	\N
1092	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:41	\N
1093	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:41	\N
1094	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:41	\N
1095	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:41	\N
1096	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:41	\N
1097	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:41	\N
1098	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:41	\N
1099	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:41	\N
1100	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:41	\N
1101	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:41	\N
1102	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:41	\N
1103	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:41	\N
1104	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:41	\N
842	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
843	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
844	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
845	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
846	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
847	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
848	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
849	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
850	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
851	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
852	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
853	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
854	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
855	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
856	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
857	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
858	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
859	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
860	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
861	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:04	2023-02-22 16:09:07	\N
862	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:07	\N
863	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:07	\N
864	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
865	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
866	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
867	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
868	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
869	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
870	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
871	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
872	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
873	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
874	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
875	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
876	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
877	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
1079	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
580	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
581	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
881	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
882	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
883	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
884	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
885	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
886	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
887	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
888	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
889	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
890	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
891	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
892	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
893	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
894	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
895	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
896	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
897	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
898	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
899	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
900	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
901	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
902	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
903	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
904	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
905	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
906	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
907	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
908	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
909	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
910	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
911	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
912	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
913	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
914	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
915	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
916	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
917	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
918	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
919	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
920	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
921	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
922	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
923	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
924	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
925	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
926	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
927	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
719	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:30	2023-02-22 13:24:30	\N
720	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:30	2023-02-22 13:24:30	\N
721	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:30	2023-02-22 13:24:30	\N
722	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:30	2023-02-22 13:24:30	\N
723	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:30	2023-02-22 13:24:30	\N
724	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:30	2023-02-22 13:24:30	\N
725	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:30	2023-02-22 13:24:30	\N
726	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:30	2023-02-22 13:24:30	\N
727	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:30	2023-02-22 13:24:30	\N
728	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:30	2023-02-22 13:24:30	\N
729	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:30	2023-02-22 13:24:30	\N
730	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
731	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
732	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
733	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
734	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
735	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
736	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
737	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
738	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
739	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
740	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
741	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
742	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
743	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
744	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
879	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
718	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:30	2023-02-22 13:24:30	\N
880	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
748	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
749	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
750	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
751	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
752	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
753	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
754	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
755	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
756	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
757	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
758	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
759	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
760	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
761	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
762	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
763	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
765	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
766	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
767	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
768	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
769	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
770	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
771	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
772	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
773	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
774	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
775	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
776	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
777	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
778	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
779	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
780	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
781	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
782	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
783	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
784	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
785	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
786	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
787	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
936	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
1106	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:41	\N
2388	SOS/4600000706	7	2022-02-02	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:13:03	\N
2402	SOS/4600000706	7	2022-02-02	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:30	2023-02-22 22:13:03	\N
937	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
938	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
939	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
940	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
941	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
942	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
943	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
944	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
945	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
946	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
948	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
949	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
950	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
951	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
952	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
953	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
954	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
955	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
956	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
957	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
958	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
959	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
960	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
961	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
962	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
963	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
964	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
965	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
966	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
1105	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:41	\N
746	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
747	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
970	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
971	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
972	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
973	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
974	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
975	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
977	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
978	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
979	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
980	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
981	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
982	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
983	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
984	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
985	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
986	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
987	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
988	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
989	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
990	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
991	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
992	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
993	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
994	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
995	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
996	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
1174	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
929	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
930	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
931	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
932	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
933	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
934	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
935	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
968	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
1175	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1176	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1177	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1178	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1179	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1180	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1181	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1182	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1183	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1184	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1185	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1186	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1187	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1188	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1189	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1190	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1191	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1192	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1193	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1194	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1195	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1196	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1197	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1198	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1199	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1200	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1201	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1202	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Tidak ada grounding	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:08	\N
1203	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Tidak ada grounding	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:08	\N
1204	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Tidak ada grounding	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:08	\N
1205	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:08	\N
1206	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:08	\N
1207	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:08	\N
928	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
969	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
1211	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	baik	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:08	\N
1212	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	baik	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:08	\N
1213	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	baik	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:08	\N
1214	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	baik	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:08	\N
1215	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	baik	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:08	\N
1216	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	baik	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:08	\N
1217	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	baik	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:08	\N
1218	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	baik	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:08	\N
1219	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	baik	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:08	\N
1220	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	baik	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:08	\N
1221	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	baik	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:08	\N
1222	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	baik	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:08	\N
1223	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:08	\N
1224	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:08	\N
1225	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:08	\N
1226	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:09	\N
1227	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:09	\N
1228	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:09	\N
1229	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:09	\N
1230	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:09	\N
1231	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:09	\N
1232	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:09	\N
1233	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:09	\N
1234	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:09	\N
1235	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:09	\N
1236	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:09	\N
1237	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Ada tetesan pada seal packing pompa	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:09	\N
1238	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Ada tetesan pada seal packing pompa	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:09	\N
1239	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Ada tetesan pada seal packing pompa	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:09	\N
1240	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Ada tetesan pada seal packing pompa	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:09	\N
1241	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:09	\N
1242	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:09	\N
1243	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Nilai Grounding melebih nilai toleransi	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:09	\N
1244	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:09	\N
1245	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Kabel Grounding belum terpasang (Tangki dalam proses perbaikan)	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:09	\N
1246	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:25	2023-02-22 16:09:09	\N
1247	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1248	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1249	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1250	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1251	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1252	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1147	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1148	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1149	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1150	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1151	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1152	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1153	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1154	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1155	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1156	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1157	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1158	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1159	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1160	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1161	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1162	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1163	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1164	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1165	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1209	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	baik	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:08	\N
1146	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1210	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	baik	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:08	\N
1169	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1171	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1172	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1173	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1253	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1254	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1255	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1256	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1257	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1258	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1259	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1260	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1261	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1262	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1263	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1264	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1265	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1266	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1267	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1268	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
2282	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2284	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2285	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2286	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2287	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2288	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2289	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2290	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2291	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2292	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2293	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2294	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2295	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2296	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2297	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2298	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2299	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2300	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2301	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2302	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2303	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2304	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2305	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2306	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2307	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2308	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2309	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2310	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2311	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2312	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2315	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2316	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2317	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2318	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2319	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2320	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2321	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2322	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2323	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2324	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2325	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2326	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2327	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2328	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2329	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2330	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2331	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
1167	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1168	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
2332	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2333	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
1170	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
2283	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2361	SOS/4600000706	7	2022-02-02	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2362	SOS/4600000706	7	2022-02-02	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2363	SOS/4600000706	7	2022-02-02	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2364	SOS/4600000706	7	2022-02-02	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2365	SOS/4600000706	7	2022-02-02	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2366	SOS/4600000706	7	2022-02-02	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2367	SOS/4600000706	7	2022-02-02	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2368	SOS/4600000706	7	2022-02-02	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2369	SOS/4600000706	7	2022-02-02	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2370	SOS/4600000706	7	2022-02-02	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2371	SOS/4600000706	7	2022-02-02	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2372	SOS/4600000706	7	2022-02-02	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2373	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2374	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2375	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2376	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2377	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2378	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2379	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2380	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2381	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2382	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2383	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2384	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2385	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2386	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2387	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2389	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2390	SOS/4600000706	7	2022-02-02	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2391	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2392	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2393	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2394	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:30	2023-02-22 22:21:24	\N
2395	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:30	2023-02-22 22:21:24	\N
2396	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:30	2023-02-22 22:21:24	\N
2397	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:30	2023-02-22 22:21:24	\N
2398	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:30	2023-02-22 22:21:24	\N
2399	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:30	2023-02-22 22:21:24	\N
2400	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:30	2023-02-22 22:21:24	\N
2401	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:30	2023-02-22 22:21:24	\N
2403	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:30	2023-02-22 22:21:24	\N
1553	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1554	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1555	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1556	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1557	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1558	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1559	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1560	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1561	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1562	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1563	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1564	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1565	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
2334	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2346	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2344	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2358	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2341	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2343	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2345	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2349	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2338	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2352	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2336	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2357	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2353	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2340	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2355	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2351	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2339	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2337	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2354	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2348	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2360	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2335	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2350	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2356	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2342	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
140	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	2020-01-23	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-23 04:04:35	\N
1568	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1569	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1570	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1571	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1572	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1573	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1574	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1575	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1576	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1577	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1578	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1579	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1580	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1581	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1582	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1583	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1585	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1586	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1587	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1588	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1589	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1590	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1591	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1592	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1593	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1594	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1595	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1596	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1597	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1598	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1599	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1600	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1601	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1602	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1603	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1604	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1605	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1606	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1607	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1608	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1610	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1611	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1612	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1613	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1614	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1615	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1616	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1617	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1618	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1619	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1620	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1621	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1622	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1623	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1624	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1625	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1626	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1627	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1628	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1629	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1630	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1631	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1632	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1633	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1635	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1636	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1637	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1638	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1639	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1640	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1641	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1642	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1643	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1644	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1645	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1646	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1567	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1649	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1650	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1651	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1652	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1653	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1654	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1655	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1657	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1658	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1659	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1660	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1661	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1662	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1663	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1664	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1665	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1666	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1667	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1668	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
2049	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
1270	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1271	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
2090	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
1272	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1273	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1274	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1275	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1276	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1277	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1278	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1279	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1280	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1281	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1282	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1283	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1284	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1285	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1286	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1287	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1288	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1289	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1290	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1291	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1292	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1293	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1294	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1295	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1296	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1297	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1298	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1299	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1300	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1301	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1302	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1303	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1304	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1305	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1306	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1307	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1308	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1309	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1310	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1648	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
2050	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2051	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2052	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2053	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2054	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2055	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2056	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
1269	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
2059	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2060	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2062	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2063	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2064	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2065	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2066	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2067	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2068	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2069	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2070	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2071	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2072	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2073	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2074	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2075	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2076	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2077	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2078	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2079	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2080	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2081	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2082	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2083	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2085	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2086	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2087	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2088	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2089	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2091	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2092	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2093	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2094	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2095	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2096	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2097	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2098	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2099	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2100	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2101	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2102	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2103	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2104	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2105	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2106	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2108	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2109	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2110	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2111	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2112	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2113	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2114	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2115	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2116	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2117	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2118	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2119	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2120	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2121	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2122	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2123	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2124	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2125	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2126	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2127	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2128	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2129	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2131	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2132	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2133	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2134	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2135	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2136	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2137	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2138	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2139	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
1312	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1313	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1314	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
2058	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
1311	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1317	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1318	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1319	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1320	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1321	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1322	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1323	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1324	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1325	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1326	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1327	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1328	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1329	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1330	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1331	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1332	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1333	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1334	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1335	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1336	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1337	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1338	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1339	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1340	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1341	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1342	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
2415	SOS/4600000707	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:52	2023-02-22 13:35:52	\N
1343	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1344	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1345	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1346	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1347	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1348	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1349	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1350	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1351	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1352	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1353	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1354	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1355	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1356	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1357	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1358	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1359	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1360	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1361	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1362	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1363	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1364	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1365	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1366	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
2221	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2222	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2223	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2224	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2225	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2226	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2227	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2228	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2229	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2230	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2231	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2232	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2233	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2234	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2235	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2236	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2237	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2238	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2239	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2240	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2241	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2276	SOS/4600000706	7	2022-02-02	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:13:02	\N
1316	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
2244	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2245	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2246	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2248	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2249	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2250	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2251	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2252	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2253	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2254	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2255	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2256	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2257	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2258	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2259	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2260	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2261	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2262	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2263	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2264	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2265	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2266	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2267	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2269	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2270	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2277	SOS/4600000706	7	2022-02-02	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:13:02	\N
2278	SOS/4600000706	7	2022-02-02	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:13:02	\N
2279	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2280	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2281	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2313	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2405	SOS/4600000707	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:52	2023-02-22 13:35:52	\N
2406	SOS/4600000707	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:52	2023-02-22 13:35:52	\N
2407	SOS/4600000707	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:52	2023-02-22 13:35:52	\N
2408	SOS/4600000707	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:52	2023-02-22 13:35:52	\N
2409	SOS/4600000707	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:52	2023-02-22 13:35:52	\N
2410	SOS/4600000707	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:52	2023-02-22 13:35:52	\N
2314	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2404	SOS/4600000707	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:52	2023-02-22 13:35:52	\N
2411	SOS/4600000707	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:52	2023-02-22 13:35:52	\N
2412	SOS/4600000707	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:52	2023-02-22 13:35:52	\N
2413	SOS/4600000707	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:52	2023-02-22 13:35:52	\N
2414	SOS/4600000707	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:52	2023-02-22 13:35:52	\N
2416	SOS/4600000707	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:52	2023-02-22 13:35:52	\N
2417	SOS/4600000707	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:52	2023-02-22 13:35:52	\N
2418	SOS/4600000707	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:52	2023-02-22 13:35:52	\N
2419	SOS/4600000707	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:52	2023-02-22 13:35:52	\N
2420	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2421	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2422	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2423	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2424	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2425	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2426	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2427	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2428	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2429	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2430	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2431	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2432	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2433	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2434	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2435	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2436	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2437	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2438	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2439	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2440	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2441	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2442	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2443	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2444	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2445	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2446	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2447	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2448	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2449	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2450	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2451	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2452	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2453	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2243	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2456	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2457	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2458	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2459	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2460	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2461	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2462	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2463	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2464	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
2465	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
1368	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1369	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1370	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1371	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1372	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1373	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1374	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1375	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1376	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1377	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1378	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1379	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1380	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1381	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1382	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1383	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1384	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1385	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1386	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1387	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1388	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1389	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1390	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1391	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1392	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1393	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1394	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1395	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1396	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1397	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1398	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1399	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1400	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1401	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1402	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1403	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1404	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1405	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1406	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1407	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1408	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1409	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1410	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1411	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1412	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1413	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1414	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1415	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1416	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1417	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1418	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1419	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1420	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1421	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1422	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1423	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1424	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1425	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1426	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
2455	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
1367	032/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:17	2023-02-22 16:09:09	\N
1429	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1430	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1431	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1432	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1433	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1434	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1435	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1436	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1437	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1438	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1439	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1440	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1441	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1442	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1443	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1444	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1445	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1446	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1447	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1448	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1449	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1450	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1451	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1452	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1453	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1454	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1455	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1456	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1457	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1458	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1459	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1460	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1461	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1462	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1463	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1464	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1465	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1466	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1467	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1468	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1469	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1470	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1471	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1472	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1473	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1474	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1475	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1476	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1477	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1478	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1479	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1480	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1481	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:09	\N
1482	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:10	\N
1483	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:10	\N
1484	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:10	\N
1485	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:10	\N
1486	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:10	\N
1487	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:10	\N
1488	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:10	\N
1489	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:10	\N
1490	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:10	\N
1491	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:10	\N
1492	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:10	\N
1493	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:10	\N
1494	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:10	\N
1495	034/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:14	2023-02-22 16:09:10	\N
1496	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:38	2023-02-22 16:09:10	\N
2183	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
1428	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1499	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:38	2023-02-22 16:09:10	\N
1500	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:38	2023-02-22 16:09:10	\N
1501	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:38	2023-02-22 16:09:10	\N
1502	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:38	2023-02-22 16:09:10	\N
1503	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:38	2023-02-22 16:09:10	\N
1504	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1505	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1506	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1507	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1508	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1509	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1510	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1511	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1512	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1513	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1514	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1515	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1516	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1517	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1518	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1519	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1520	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1521	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1522	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1523	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1524	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1525	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1526	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1527	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1528	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1529	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1530	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1531	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1532	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1533	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1534	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1535	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1536	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1537	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1538	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1539	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1540	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1541	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1542	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1543	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1544	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1545	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1546	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1547	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1548	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:39	2023-02-22 16:09:10	\N
1549	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	Pending	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 16:09:10	\N
1550	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	Pending	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 16:09:10	\N
1551	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	Pending	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 16:09:10	\N
1552	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	Pending	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 16:09:10	\N
1670	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8002-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 16:09:10	\N
1698	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 16:09:10	\N
1699	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1700	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1701	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1702	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	4	\N	Kerja Kurang	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1703	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	4	\N	Kerja Kurang	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1704	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	4	\N	Kerja Kurang	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1705	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1706	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1707	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
2140	SOS/4600000706	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:01	2023-02-22 14:39:39	\N
1498	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:38	2023-02-22 16:09:10	\N
1710	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1711	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1712	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1713	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1714	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1715	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1716	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1717	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1718	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1719	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1720	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1721	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1722	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1723	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1724	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1725	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1726	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1727	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1728	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1729	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1730	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1731	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1732	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1733	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1734	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1735	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1736	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1737	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1738	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1739	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1740	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1741	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1742	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1743	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1744	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1745	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1746	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1747	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1748	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1749	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1750	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1751	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1752	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1753	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1754	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1755	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1756	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1757	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1758	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1759	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1760	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1761	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1762	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1763	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA +Re-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1764	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1765	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1766	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1709	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1769	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1770	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1771	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1772	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1773	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1776	038/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SIM-01	-	2023-01-05	8029-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:32:44	2023-02-22 16:09:10	\N
1796	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:10	\N
1797	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:10	\N
1798	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:10	\N
1799	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:10	\N
1800	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:10	\N
1801	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:10	\N
1802	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:10	\N
1803	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:10	\N
1804	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:10	\N
1805	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:10	\N
1806	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:10	\N
1807	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:10	\N
1808	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:10	\N
1809	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:10	\N
1810	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1811	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1812	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1813	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1814	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1815	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1816	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1817	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1818	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1819	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1820	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1821	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1822	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1823	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1824	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1825	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1826	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1827	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1828	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1829	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1830	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1831	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1832	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1833	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1834	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1835	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1836	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1837	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1838	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1839	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1840	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1841	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1842	042/KSO.BKI-SCI-SI/SOS-X/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1843	042/KSO.BKI-SCI-SI/SOS-X/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1844	042/KSO.BKI-SCI-SI/SOS-X/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1845	042/KSO.BKI-SCI-SI/SOS-X/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1846	042/KSO.BKI-SCI-SI/SOS-X/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1847	042/KSO.BKI-SCI-SI/SOS-X/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1848	042/KSO.BKI-SCI-SI/SOS-X/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1849	042/KSO.BKI-SCI-SI/SOS-X/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:06	2023-02-22 16:09:11	\N
1850	056/KSO.BKI-SCI-SI/DO-XI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1851	056/KSO.BKI-SCI-SI/DO-XI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1852	056/KSO.BKI-SCI-SI/DO-XI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1853	056/KSO.BKI-SCI-SI/DO-XI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1854	056/KSO.BKI-SCI-SI/DO-XI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1855	056/KSO.BKI-SCI-SI/DO-XI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1856	056/KSO.BKI-SCI-SI/DO-XI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1857	056/KSO.BKI-SCI-SI/DO-XI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
2141	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:01	2023-02-22 14:39:39	\N
1768	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1860	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1861	056/KSO.BKI-SCI-SI/DO-XI/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1862	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1863	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1864	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
175	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:20	2023-02-22 14:39:34	\N
176	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:20	2023-02-22 14:39:34	\N
177	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:20	2023-02-22 14:39:34	\N
178	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:20	2023-02-22 14:39:34	\N
179	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:20	2023-02-22 14:39:34	\N
180	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:20	2023-02-22 14:39:34	\N
181	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:20	2023-02-22 14:39:34	\N
182	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:20	2023-02-22 14:39:34	\N
183	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:20	2023-02-22 14:39:34	\N
184	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:20	2023-02-22 14:39:34	\N
185	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:20	2023-02-22 14:39:34	\N
186	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:20	2023-02-22 14:39:34	\N
187	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:20	2023-02-22 14:39:34	\N
188	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:20	2023-02-22 14:39:34	\N
189	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:20	2023-02-22 14:39:34	\N
190	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:20	2023-02-22 14:39:34	\N
191	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:20	2023-02-22 14:39:34	\N
192	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
193	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
195	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
196	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
197	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
198	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
199	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
200	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
201	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
202	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
203	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
204	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
205	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
206	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
207	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
208	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
209	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
210	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
211	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
212	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
213	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
214	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
215	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
216	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
217	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
218	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
219	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
220	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
221	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
222	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
223	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
225	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
226	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
227	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
228	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
229	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
230	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
231	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
232	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
233	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
234	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
235	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
236	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
237	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
238	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
239	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
240	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
241	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
1859	056/KSO.BKI-SCI-SI/DO-XI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
174	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:20	2023-02-22 14:39:34	\N
244	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
245	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
246	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
247	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
248	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
249	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
250	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
251	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
252	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
253	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
254	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
255	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
256	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
600	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
601	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
602	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
603	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
604	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
605	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
606	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
607	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
608	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
609	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
610	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
611	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
612	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
613	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
614	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
615	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
616	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
617	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
618	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
619	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
620	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
621	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
622	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
623	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
624	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
625	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
626	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
627	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
628	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
629	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
630	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
631	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
632	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
633	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
634	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
635	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
636	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
637	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
638	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
639	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
640	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
641	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
642	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
643	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
644	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
645	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
646	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
647	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
648	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
243	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
651	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
652	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
653	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
654	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
655	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
656	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
657	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
658	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
659	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
660	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
661	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
662	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
663	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
664	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
665	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
666	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
667	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
668	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
669	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
670	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
671	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
672	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
673	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
674	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
675	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
676	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
677	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
678	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
679	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
680	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
681	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
682	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
683	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
684	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
685	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
686	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
687	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
688	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
689	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
690	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
691	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
692	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
693	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
694	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
695	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
696	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
697	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
698	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
699	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
700	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
701	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
702	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
703	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
704	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
705	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
650	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
709	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
710	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
711	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
712	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
1038	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1054	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1055	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1056	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1057	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1058	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1059	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1060	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1061	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1062	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1063	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1064	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1065	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1066	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1067	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1068	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1069	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1070	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1071	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1072	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1107	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1108	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1109	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1110	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1111	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1112	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1113	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1114	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
2184	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
708	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
1046	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1049	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1041	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1004	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1053	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1045	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1044	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1036	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1031	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1040	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1052	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1035	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1047	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1048	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1042	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1037	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1039	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1043	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1003	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1050	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1002	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1051	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1001	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
717	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
1034	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1033	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1032	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
716	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
714	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
713	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
715	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
707	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
1117	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1118	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1119	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1120	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1121	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1122	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1123	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1124	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1125	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1126	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1127	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1128	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1129	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1130	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1131	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1132	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1133	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1134	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1135	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1136	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1137	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1138	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1139	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1140	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1141	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1142	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1143	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1144	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1145	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-23 03:31:18	\N
1671	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8003-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
1116	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1672	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8004-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
1673	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8005-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
1674	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8006-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
1669	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8001-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
1675	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8007-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
1676	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8008-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
1677	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8009-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
1678	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8010-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
1679	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8011-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
1680	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8012-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
1681	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8013-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
1682	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8014-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
1683	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8015-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
1684	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8016-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
1685	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8017-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
1686	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8018-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
1687	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8019-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
1688	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8020-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
1689	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8021-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
1690	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8022-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
1691	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8023-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
1692	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8024-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
1693	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8025-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
1694	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8026-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
2142	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:01	2023-02-22 14:39:39	\N
1083	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 21:59:40	\N
1697	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8029-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
1774	038/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SIM-01	-	2023-01-05	8029-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:32:44	2023-02-22 14:39:38	\N
1775	038/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SIM-01	-	2023-01-05	8029-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:32:44	2023-02-22 14:39:38	\N
1777	038/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SIM-01	-	2023-01-05	8029-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:32:44	2023-02-22 14:39:38	\N
1778	038/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SIM-01	-	2023-01-05	8029-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:32:44	2023-02-22 14:39:38	\N
1779	038/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SIM-01	-	2023-01-05	8029-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:32:44	2023-02-22 14:39:38	\N
1780	038/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SIM-01	-	2023-01-05	8029-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:32:44	2023-02-22 14:39:38	\N
1781	038/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SIM-01	-	2023-01-05	8005-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:32:44	2023-02-22 14:39:38	\N
1782	038/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SIM-01	-	2023-01-05	8006-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:32:44	2023-02-22 14:39:38	\N
1783	038/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SIM-01	-	2023-01-05	8007-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:32:44	2023-02-22 14:39:38	\N
1784	038/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SIM-01	-	2023-01-05	8008-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:32:44	2023-02-22 14:39:38	\N
1785	038/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SIM-01	-	2023-01-05	8029-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:32:44	2023-02-22 14:39:38	\N
1786	038/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SIM-01	-	2023-01-05	8029-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:32:44	2023-02-22 14:39:38	\N
1787	038/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SIM-01	-	2023-01-05	8029-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:32:44	2023-02-22 14:39:38	\N
1788	038/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SIM-01	-	2023-01-05	8029-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:32:44	2023-02-22 14:39:38	\N
1789	038/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SIM-01	-	2023-01-05	8029-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:32:44	2023-02-22 14:39:38	\N
1790	038/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SIM-01	-	2023-01-05	8029-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:32:44	2023-02-22 14:39:38	\N
1791	038/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SIM-01	-	2023-01-05	8029-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:32:44	2023-02-22 14:39:38	\N
1792	038/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SIM-01	-	2023-01-05	8029-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:32:44	2023-02-22 14:39:38	\N
1793	038/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SIM-01	-	2023-01-05	8029-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:32:44	2023-02-22 14:39:38	\N
1794	038/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SIM-01	-	2023-01-05	8029-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:32:44	2023-02-22 14:39:38	\N
1795	038/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:44	2023-02-22 14:39:38	\N
2143	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:01	2023-02-22 14:39:39	\N
2144	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:01	2023-02-22 14:39:39	\N
2145	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:01	2023-02-22 14:39:39	\N
2146	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:01	2023-02-22 14:39:39	\N
2147	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:01	2023-02-22 14:39:39	\N
2148	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:01	2023-02-22 14:39:39	\N
2149	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:01	2023-02-22 14:39:39	\N
2150	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:01	2023-02-22 14:39:39	\N
2151	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:01	2023-02-22 14:39:39	\N
2152	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:01	2023-02-22 14:39:39	\N
2153	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:01	2023-02-22 14:39:39	\N
2154	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:01	2023-02-22 14:39:39	\N
2155	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:01	2023-02-22 14:39:39	\N
2156	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:01	2023-02-22 14:39:39	\N
2157	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2158	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2159	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2160	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2161	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2162	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2163	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2164	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2165	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2166	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2167	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2168	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2169	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2170	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2171	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2172	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2173	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2174	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2175	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2176	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2177	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2178	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2179	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2180	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2181	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2182	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
1696	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8028-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
2186	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2187	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2188	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2189	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2190	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2191	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2192	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2193	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2194	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2195	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2196	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2197	SOS/4600000706	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2198	SOS/4600000706	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2199	SOS/4600000706	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2200	SOS/4600000706	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2201	SOS/4600000706	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2202	SOS/4600000706	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2203	SOS/4600000706	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2204	SOS/4600000706	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2205	SOS/4600000706	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2206	SOS/4600000706	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2207	SOS/4600000706	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2208	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2209	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2210	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2211	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2212	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2213	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2214	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2215	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2216	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2217	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2218	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2219	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
2220	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
1866	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1867	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1868	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1869	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1870	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1871	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1872	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1873	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1874	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1875	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1876	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1877	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1878	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1879	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1880	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1881	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1882	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1883	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1884	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1885	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1886	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1887	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1888	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1889	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1890	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1891	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1892	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1893	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1894	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1895	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1896	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1897	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1898	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1899	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1900	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1901	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1902	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1903	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1904	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
2185	SOS/4600000706	7	2023-01-01	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 14:39:39	\N
1865	056/KSO.BKI-SCI-SI/DO-XI/2022	7	2023-01-01	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
1907	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1909	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1910	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1911	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1912	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1913	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1914	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1915	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1916	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1917	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1918	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1919	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1920	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1921	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1922	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1923	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1924	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1925	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1926	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1927	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1928	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1929	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1930	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1931	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1932	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1933	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1934	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1935	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1936	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1937	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1938	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1939	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1940	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1941	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1942	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1943	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1944	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1945	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1946	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1947	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1948	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1949	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1950	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1951	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1952	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1953	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1954	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1955	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1956	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1957	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1958	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1959	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1960	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1961	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1962	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1963	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1964	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1965	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1966	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1967	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1968	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1969	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1970	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1971	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1972	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1973	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1974	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1906	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1908	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1977	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1978	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1979	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1980	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1981	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1982	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1983	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1984	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1985	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1986	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1987	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1988	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1989	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1990	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1991	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1992	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1993	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1994	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1995	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1996	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1997	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1998	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
1999	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2000	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2001	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2002	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2003	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2004	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2005	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2006	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2007	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2008	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2009	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2010	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2011	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2012	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2013	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2014	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2015	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2016	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2017	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2018	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2019	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2020	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2021	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2022	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2023	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2024	066/KSO.BKI-SCI-SI/SOS-XII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:18	2023-02-22 16:09:11	\N
2025	066/KSO.BKI-SCI-SI/SOS-XII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:18	2023-02-22 16:09:11	\N
2026	066/KSO.BKI-SCI-SI/SOS-XII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:18	2023-02-22 16:09:11	\N
2027	066/KSO.BKI-SCI-SI/SOS-XII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:18	2023-02-22 16:09:11	\N
2028	066/KSO.BKI-SCI-SI/SOS-XII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:18	2023-02-22 16:09:11	\N
2029	066/KSO.BKI-SCI-SI/SOS-XII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:18	2023-02-22 16:09:11	\N
2030	066/KSO.BKI-SCI-SI/SOS-XII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:18	2023-02-22 16:09:11	\N
2031	066/KSO.BKI-SCI-SI/SOS-XII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:18	2023-02-22 16:09:11	\N
2032	066/KSO.BKI-SCI-SI/SOS-XII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:18	2023-02-22 16:09:11	\N
2033	066/KSO.BKI-SCI-SI/SOS-XII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:18	2023-02-22 16:09:11	\N
2034	066/KSO.BKI-SCI-SI/SOS-XII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:18	2023-02-22 16:09:11	\N
2035	066/KSO.BKI-SCI-SI/SOS-XII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:18	2023-02-22 16:09:11	\N
2036	066/KSO.BKI-SCI-SI/SOS-XII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:18	2023-02-22 16:09:11	\N
2037	066/KSO.BKI-SCI-SI/SOS-XII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:18	2023-02-22 16:09:11	\N
2038	066/KSO.BKI-SCI-SI/SOS-XII/2022	7	2023-01-06	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:18	2023-02-22 16:09:11	\N
2039	066/KSO.BKI-SCI-SI/SOS-XII/2022	7	2023-01-07	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:18	2023-02-22 16:09:11	\N
2040	066/KSO.BKI-SCI-SI/SOS-XII/2022	7	2023-01-08	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:18	2023-02-22 16:09:11	\N
2041	066/KSO.BKI-SCI-SI/SOS-XII/2022	7	2023-01-09	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:18	2023-02-22 16:09:11	\N
2042	066/KSO.BKI-SCI-SI/SOS-XII/2022	7	2023-01-10	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:18	2023-02-22 16:09:11	\N
2043	066/KSO.BKI-SCI-SI/SOS-XII/2022	7	2023-01-11	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:18	2023-02-22 16:09:11	\N
2044	066/KSO.BKI-SCI-SI/SOS-XII/2022	7	2023-01-12	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:18	2023-02-22 16:09:11	\N
2045	066/KSO.BKI-SCI-SI/SOS-XII/2022	7	2023-01-13	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:18	2023-02-22 16:09:11	\N
1976	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2047	066/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:18	2023-02-22 16:09:11	\N
2061	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2084	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2273	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 16:09:12	\N
2274	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 16:09:12	\N
2359	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:29	2023-02-22 22:21:24	\N
2454	SOS/TP.01.01/LPG-BLG/00212/II/2020	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:36:18	2023-02-22 13:36:18	\N
473	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
194	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
224	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
242	015/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 04:14:21	2023-02-22 14:39:34	\N
649	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
326	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
339	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
357	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
382	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
407	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
420	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
433	0004/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:55	2023-02-22 13:08:55	\N
455	0014/KSO.BKI-SCI-SI/SOS-XI/2020	7	2023-01-20	t	3	BA-SAM-001	BA-SAM-001	2023-01-20	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:10:31	2023-02-22 21:40:13	\N
500	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
515	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
519	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:01	2023-02-22 13:11:01	\N
547	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
579	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:11:30	2023-02-22 16:09:07	\N
706	016/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:23:53	2023-02-22 14:39:35	\N
745	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
947	020/KSO.BKI-Sci-SI/SOS-VII/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:46	2023-02-22 13:25:46	\N
967	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
976	021/KSO.BKI-SCI-SI/SOS-VII/2022	7	2023-02-22	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:20	2023-02-22 13:26:20	\N
1115	023/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:26:57	2023-02-22 14:39:36	\N
1166	029/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:23	2023-02-22 16:09:08	\N
1208	030/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:27:54	2023-02-22 16:09:08	\N
1315	031/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	Rekomendasi RLA dan RE-Eng	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:28:26	2023-02-22 16:09:09	\N
1427	033/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:29:45	2023-02-22 16:09:09	\N
1609	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1634	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1656	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1695	037/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	7	MOM-SAB-01	-	2023-01-05	8027-02-ENI/12/E07-L11/P3/2021	2023-01-05	2025-01-05	\N	\N	\N	\N	\N	2023-02-22 13:31:43	2023-02-22 14:39:38	\N
1708	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	Perlu RLA	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
1767	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:32:21	2023-02-22 16:09:10	\N
2107	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2130	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
2242	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2247	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
2268	SOS/4600000706	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 13:35:02	\N
1497	035/KSO.BKI-SCI-SI/SOS-VIII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:30:38	2023-02-22 16:09:10	\N
2271	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 16:09:12	\N
2272	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 16:09:12	\N
2275	SOS/4600000706	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:35:02	2023-02-22 16:09:12	\N
1566	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1647	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:19	2023-02-22 13:31:19	\N
1905	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:49	2023-02-22 16:09:11	\N
1975	060/KSO.BKI-SCI-SI/SOS-XII/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:50	2023-02-22 16:09:11	\N
2046	066/KSO.BKI-SCI-SI/SOS-XII/2022	7	2023-01-14	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:18	2023-02-22 16:09:11	\N
258	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
276	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
301	0003/KSO.BKI-SCI-SI/SOS-VII/2021	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:08:31	2023-02-22 13:08:31	\N
764	017/KSO.BKI-SCI-SI/DO-VI/2022	7	2023-02-22	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:24:31	2023-02-22 13:24:31	\N
878	018/KSO.BKI-SCI-SI/DO-VI/2022	7	\N	f	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:25:11	2023-02-22 16:09:08	\N
78	013/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-18	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 01:10:09	2023-02-06 01:32:28	\N
152	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	\N	f	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
171	014/KSO.BKI-SCI-SI/SOS-VI/2022	7	2023-01-20	f	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-06 02:25:29	2023-02-06 02:30:34	\N
1584	036/KSO.BKI-SCI-SI/SOS-VIII/2022	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:31:18	2023-02-22 13:31:18	\N
1858	056/KSO.BKI-SCI-SI/DO-XI/2022	7	\N	f	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:33:27	2023-02-22 16:09:11	\N
2048	066/KSO.BKI-SCI-SI/SOS-XII/2022	7	2023-01-05	t	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:18	2023-02-22 16:09:11	\N
2057	SOS/122/PND970000/2022-S7	7	\N	t	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-22 13:34:40	2023-02-22 13:34:40	\N
\.


--
-- Data for Name: job_status; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.job_status (id, status, created_at, updated_at) FROM stdin;
1	Review Dokumen	2022-11-28 13:57:17	\N
2	Pemeriksaan Lapangan	2022-11-28 13:57:17	\N
3	Pemeriksaan Keselamatan	2022-11-28 13:57:17	\N
4	PLO	2022-11-28 13:57:17	\N
5	Cancel	2022-11-28 13:57:17	\N
6	Pending	2022-11-28 13:57:17	\N
7	Complete	2022-11-28 13:57:17	\N
\.


--
-- Data for Name: map_boq_coi; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.map_boq_coi (boq_id, coi_id, status, reviewer_1, reviewer_2, approval) FROM stdin;
52	4	100	6	5	7
\.


--
-- Data for Name: map_boq_dos; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.map_boq_dos (id, boq_id, do_id, created_at, updated_at) FROM stdin;
1	1	1	2023-02-05 07:49:50	\N
2	2	1	2023-02-05 07:49:50	\N
3	3	1	2023-02-05 07:49:50	\N
4	4	1	2023-02-05 07:49:50	\N
5	5	1	2023-02-05 07:49:50	\N
6	6	1	2023-02-05 07:49:50	\N
7	7	1	2023-02-05 07:49:50	\N
8	8	1	2023-02-05 07:49:50	\N
9	9	1	2023-02-05 07:49:50	\N
10	10	1	2023-02-05 07:49:50	\N
11	11	1	2023-02-05 07:49:50	\N
12	12	1	2023-02-05 07:49:50	\N
13	13	1	2023-02-05 07:49:50	\N
14	14	1	2023-02-05 07:49:50	\N
15	15	1	2023-02-05 07:49:50	\N
16	16	1	2023-02-05 07:49:50	\N
17	17	2	2023-02-05 09:22:55	\N
18	18	2	2023-02-05 09:22:55	\N
19	19	2	2023-02-05 09:22:55	\N
20	20	2	2023-02-05 09:22:55	\N
21	21	2	2023-02-05 09:22:55	\N
22	22	2	2023-02-05 09:22:55	\N
23	23	2	2023-02-05 09:22:55	\N
24	24	2	2023-02-05 09:22:55	\N
25	25	2	2023-02-05 09:22:55	\N
26	26	2	2023-02-05 09:22:55	\N
27	27	2	2023-02-05 09:22:55	\N
28	28	2	2023-02-05 09:22:55	\N
29	29	2	2023-02-05 09:22:55	\N
30	30	2	2023-02-05 09:22:55	\N
31	31	2	2023-02-05 09:22:55	\N
32	32	2	2023-02-05 09:22:55	\N
33	33	2	2023-02-05 09:22:55	\N
34	34	2	2023-02-05 09:22:55	\N
35	35	2	2023-02-05 09:22:55	\N
36	36	2	2023-02-05 09:22:55	\N
37	37	2	2023-02-05 09:22:55	\N
38	38	2	2023-02-05 09:22:55	\N
39	39	2	2023-02-05 09:22:55	\N
40	40	2	2023-02-05 09:22:55	\N
41	41	2	2023-02-05 09:22:55	\N
42	42	2	2023-02-05 09:22:55	\N
43	43	2	2023-02-05 09:22:55	\N
44	44	2	2023-02-05 09:22:55	\N
45	45	2	2023-02-05 09:22:55	\N
46	46	2	2023-02-05 09:22:55	\N
47	47	2	2023-02-05 09:22:55	\N
48	48	2	2023-02-05 09:22:55	\N
49	49	2	2023-02-05 09:22:55	\N
50	50	2	2023-02-05 09:22:55	\N
51	51	2	2023-02-05 09:22:55	\N
52	52	3	2023-02-05 10:11:25	\N
53	53	3	2023-02-05 10:11:25	\N
54	54	3	2023-02-05 10:11:25	\N
55	55	3	2023-02-05 10:11:25	\N
56	56	3	2023-02-05 10:11:25	\N
57	57	3	2023-02-05 10:11:25	\N
58	58	3	2023-02-05 10:11:25	\N
59	59	3	2023-02-05 10:11:25	\N
60	60	3	2023-02-05 10:11:25	\N
61	61	3	2023-02-05 10:11:25	\N
62	62	3	2023-02-05 10:11:25	\N
63	63	3	2023-02-05 10:11:25	\N
64	64	3	2023-02-05 10:11:25	\N
65	65	3	2023-02-05 10:11:25	\N
66	66	3	2023-02-05 10:11:25	\N
67	67	3	2023-02-05 10:11:25	\N
68	68	3	2023-02-05 10:11:25	\N
69	69	3	2023-02-05 10:11:25	\N
70	70	3	2023-02-05 10:11:25	\N
71	71	4	2023-02-06 01:43:11	\N
72	72	4	2023-02-06 01:43:11	\N
73	73	4	2023-02-06 01:43:11	\N
74	74	4	2023-02-06 01:43:11	\N
75	75	4	2023-02-06 01:43:11	\N
76	76	4	2023-02-06 01:43:11	\N
77	77	4	2023-02-06 01:43:11	\N
78	78	4	2023-02-06 01:43:11	\N
79	79	4	2023-02-06 01:43:11	\N
80	80	4	2023-02-06 01:43:11	\N
81	81	4	2023-02-06 01:43:11	\N
82	82	4	2023-02-06 01:43:11	\N
83	83	4	2023-02-06 01:43:11	\N
84	84	4	2023-02-06 01:43:11	\N
85	85	4	2023-02-06 01:43:11	\N
86	86	4	2023-02-06 01:43:11	\N
87	87	4	2023-02-06 01:43:11	\N
88	88	4	2023-02-06 01:43:11	\N
89	89	4	2023-02-06 01:43:11	\N
90	90	4	2023-02-06 01:43:11	\N
91	91	4	2023-02-06 01:43:11	\N
92	92	4	2023-02-06 01:43:11	\N
93	93	4	2023-02-06 01:43:11	\N
94	94	4	2023-02-06 01:43:11	\N
95	95	4	2023-02-06 01:43:11	\N
96	96	4	2023-02-06 01:43:11	\N
97	97	4	2023-02-06 01:43:11	\N
98	98	5	2023-02-06 02:23:38	\N
99	99	5	2023-02-06 02:23:38	\N
100	100	5	2023-02-06 02:23:38	\N
101	101	5	2023-02-06 02:23:38	\N
102	102	5	2023-02-06 02:23:38	\N
103	103	5	2023-02-06 02:23:38	\N
104	104	5	2023-02-06 02:23:38	\N
105	105	5	2023-02-06 02:23:38	\N
106	106	5	2023-02-06 02:23:38	\N
107	107	5	2023-02-06 02:23:38	\N
108	108	5	2023-02-06 02:23:38	\N
109	109	5	2023-02-06 02:23:38	\N
110	110	5	2023-02-06 02:23:38	\N
111	111	5	2023-02-06 02:23:38	\N
112	112	5	2023-02-06 02:23:38	\N
113	113	5	2023-02-06 02:23:38	\N
114	114	5	2023-02-06 02:23:38	\N
115	115	5	2023-02-06 02:23:38	\N
116	116	5	2023-02-06 02:23:38	\N
117	117	5	2023-02-06 02:23:38	\N
118	118	5	2023-02-06 02:23:38	\N
119	119	5	2023-02-06 02:23:38	\N
120	120	5	2023-02-06 02:23:38	\N
121	121	5	2023-02-06 02:23:38	\N
122	122	5	2023-02-06 02:23:38	\N
123	123	5	2023-02-06 02:23:38	\N
124	124	5	2023-02-06 02:23:38	\N
125	125	5	2023-02-06 02:23:38	\N
126	126	5	2023-02-06 02:23:38	\N
127	127	5	2023-02-06 02:23:38	\N
128	128	5	2023-02-06 02:23:38	\N
129	129	5	2023-02-06 02:23:38	\N
130	130	5	2023-02-06 02:23:38	\N
131	131	5	2023-02-06 02:23:38	\N
132	132	5	2023-02-06 02:23:38	\N
133	133	5	2023-02-06 02:23:38	\N
134	134	5	2023-02-06 02:23:38	\N
135	135	5	2023-02-06 02:23:38	\N
136	136	5	2023-02-06 02:23:38	\N
137	137	5	2023-02-06 02:23:38	\N
138	138	5	2023-02-06 02:23:38	\N
139	139	5	2023-02-06 02:23:38	\N
140	140	5	2023-02-06 02:23:38	\N
141	141	5	2023-02-06 02:23:38	\N
142	142	5	2023-02-06 02:23:38	\N
143	143	5	2023-02-06 02:23:38	\N
144	144	5	2023-02-06 02:23:38	\N
145	145	5	2023-02-06 02:23:38	\N
146	146	5	2023-02-06 02:23:38	\N
147	147	5	2023-02-06 02:23:38	\N
148	148	5	2023-02-06 02:23:38	\N
149	149	5	2023-02-06 02:23:38	\N
151	151	7	2023-02-22 03:41:00	\N
152	152	7	2023-02-22 03:41:00	\N
153	153	7	2023-02-22 03:41:00	\N
154	154	7	2023-02-22 03:41:00	\N
155	155	7	2023-02-22 03:41:00	\N
156	156	7	2023-02-22 03:41:00	\N
157	157	7	2023-02-22 03:41:00	\N
158	158	7	2023-02-22 03:41:00	\N
159	159	7	2023-02-22 03:41:00	\N
160	160	7	2023-02-22 03:41:00	\N
161	161	7	2023-02-22 03:41:00	\N
162	162	7	2023-02-22 03:41:00	\N
163	163	7	2023-02-22 03:41:00	\N
164	164	7	2023-02-22 03:41:00	\N
165	165	7	2023-02-22 03:41:00	\N
166	166	7	2023-02-22 03:41:00	\N
167	167	7	2023-02-22 03:41:00	\N
168	168	7	2023-02-22 03:41:00	\N
169	169	7	2023-02-22 03:41:00	\N
170	170	7	2023-02-22 03:41:00	\N
171	171	7	2023-02-22 03:41:00	\N
172	172	7	2023-02-22 03:41:00	\N
173	173	7	2023-02-22 03:41:00	\N
174	174	7	2023-02-22 03:41:00	\N
175	175	7	2023-02-22 03:41:00	\N
176	176	7	2023-02-22 03:41:00	\N
177	177	7	2023-02-22 03:41:00	\N
178	178	7	2023-02-22 03:41:00	\N
179	179	7	2023-02-22 03:41:00	\N
180	180	7	2023-02-22 03:41:00	\N
181	181	7	2023-02-22 03:41:00	\N
182	182	7	2023-02-22 03:41:00	\N
183	183	7	2023-02-22 03:41:00	\N
184	184	7	2023-02-22 03:41:00	\N
185	185	7	2023-02-22 03:41:00	\N
186	186	7	2023-02-22 03:41:00	\N
187	187	7	2023-02-22 03:41:00	\N
188	188	7	2023-02-22 03:41:00	\N
189	189	7	2023-02-22 03:41:00	\N
190	190	7	2023-02-22 03:41:00	\N
191	191	7	2023-02-22 03:41:00	\N
192	192	7	2023-02-22 03:41:00	\N
193	193	7	2023-02-22 03:41:00	\N
194	194	7	2023-02-22 03:41:00	\N
195	195	7	2023-02-22 03:41:00	\N
196	196	7	2023-02-22 03:41:00	\N
197	197	7	2023-02-22 03:41:00	\N
198	198	7	2023-02-22 03:41:00	\N
199	199	7	2023-02-22 03:41:00	\N
200	200	7	2023-02-22 03:41:00	\N
201	201	7	2023-02-22 03:41:00	\N
202	202	7	2023-02-22 03:41:00	\N
203	203	7	2023-02-22 03:41:00	\N
204	204	7	2023-02-22 03:41:00	\N
205	205	7	2023-02-22 03:41:00	\N
206	206	7	2023-02-22 03:41:00	\N
207	207	7	2023-02-22 03:41:00	\N
208	208	7	2023-02-22 03:41:00	\N
209	209	7	2023-02-22 03:41:00	\N
210	210	7	2023-02-22 03:41:00	\N
211	211	7	2023-02-22 03:41:00	\N
212	212	7	2023-02-22 03:41:00	\N
213	213	7	2023-02-22 03:41:00	\N
214	214	7	2023-02-22 03:41:00	\N
215	215	7	2023-02-22 03:41:00	\N
216	216	7	2023-02-22 03:41:00	\N
217	217	7	2023-02-22 03:41:00	\N
218	218	7	2023-02-22 03:41:00	\N
219	219	7	2023-02-22 03:41:00	\N
220	220	7	2023-02-22 03:41:00	\N
221	221	7	2023-02-22 03:41:00	\N
222	222	7	2023-02-22 03:41:00	\N
223	223	7	2023-02-22 03:41:00	\N
224	224	7	2023-02-22 03:41:00	\N
225	225	7	2023-02-22 03:41:00	\N
226	226	7	2023-02-22 03:41:00	\N
227	227	7	2023-02-22 03:41:00	\N
228	228	7	2023-02-22 03:41:00	\N
229	229	7	2023-02-22 03:41:00	\N
230	230	7	2023-02-22 03:41:00	\N
231	231	7	2023-02-22 03:41:00	\N
232	232	7	2023-02-22 03:41:00	\N
233	233	7	2023-02-22 03:41:00	\N
234	234	7	2023-02-22 03:41:00	\N
235	2391	8	2023-02-22 08:45:26	\N
236	2392	8	2023-02-22 08:45:26	\N
237	2393	8	2023-02-22 08:45:27	\N
238	2394	8	2023-02-22 08:45:27	\N
239	2395	8	2023-02-22 08:45:27	\N
240	2396	8	2023-02-22 08:45:27	\N
241	2397	8	2023-02-22 08:45:27	\N
242	2398	8	2023-02-22 08:45:27	\N
243	2399	8	2023-02-22 08:45:27	\N
244	2400	8	2023-02-22 08:45:27	\N
245	2401	8	2023-02-22 08:45:27	\N
246	2402	8	2023-02-22 08:45:27	\N
247	2403	8	2023-02-22 08:45:27	\N
248	2404	8	2023-02-22 08:45:27	\N
249	2405	8	2023-02-22 08:45:27	\N
250	2406	8	2023-02-22 08:45:27	\N
251	2407	8	2023-02-22 08:45:27	\N
252	3100	9	2023-02-22 08:45:40	\N
253	3101	9	2023-02-22 08:45:40	\N
254	3102	9	2023-02-22 08:45:40	\N
255	3103	9	2023-02-22 08:45:40	\N
256	3104	9	2023-02-22 08:45:40	\N
257	3105	9	2023-02-22 08:45:40	\N
258	3106	9	2023-02-22 08:45:40	\N
259	3107	9	2023-02-22 08:45:40	\N
260	3108	9	2023-02-22 08:45:40	\N
261	3109	9	2023-02-22 08:45:40	\N
262	3110	9	2023-02-22 08:45:40	\N
263	3111	9	2023-02-22 08:45:40	\N
264	3112	9	2023-02-22 08:45:40	\N
265	3113	9	2023-02-22 08:45:40	\N
266	3114	9	2023-02-22 08:45:40	\N
267	3115	9	2023-02-22 08:45:40	\N
268	3116	9	2023-02-22 08:45:40	\N
269	3117	9	2023-02-22 08:45:40	\N
270	3118	9	2023-02-22 08:45:40	\N
271	3119	9	2023-02-22 08:45:40	\N
272	3120	9	2023-02-22 08:45:40	\N
273	3121	9	2023-02-22 08:45:40	\N
274	3122	9	2023-02-22 08:45:40	\N
275	3123	9	2023-02-22 08:45:40	\N
276	3124	9	2023-02-22 08:45:40	\N
277	3125	9	2023-02-22 08:45:40	\N
278	3126	9	2023-02-22 08:45:40	\N
279	3127	9	2023-02-22 08:45:40	\N
280	3128	9	2023-02-22 08:45:40	\N
281	3129	9	2023-02-22 08:45:40	\N
282	3130	9	2023-02-22 08:45:40	\N
283	3131	9	2023-02-22 08:45:40	\N
284	3132	9	2023-02-22 08:45:40	\N
285	3133	9	2023-02-22 08:45:40	\N
286	3134	9	2023-02-22 08:45:40	\N
287	3135	9	2023-02-22 08:45:40	\N
288	3136	9	2023-02-22 08:45:40	\N
289	3137	9	2023-02-22 08:45:40	\N
290	3138	9	2023-02-22 08:45:40	\N
291	3139	9	2023-02-22 08:45:40	\N
292	3140	9	2023-02-22 08:45:40	\N
293	3141	9	2023-02-22 08:45:40	\N
294	3142	9	2023-02-22 08:45:40	\N
295	3143	9	2023-02-22 08:45:40	\N
296	3144	9	2023-02-22 08:45:40	\N
297	3145	9	2023-02-22 08:45:40	\N
298	3146	9	2023-02-22 08:45:40	\N
299	3147	9	2023-02-22 08:45:40	\N
300	3148	9	2023-02-22 08:45:40	\N
301	3149	9	2023-02-22 08:45:40	\N
302	3150	9	2023-02-22 08:45:40	\N
303	3151	9	2023-02-22 08:45:40	\N
304	3152	9	2023-02-22 08:45:40	\N
305	3153	9	2023-02-22 08:45:40	\N
306	3154	9	2023-02-22 08:45:40	\N
307	3155	9	2023-02-22 08:45:40	\N
308	4229	10	2023-02-22 08:46:12	\N
309	4230	10	2023-02-22 08:46:12	\N
310	4231	10	2023-02-22 08:46:12	\N
311	4232	10	2023-02-22 08:46:12	\N
312	4233	10	2023-02-22 08:46:12	\N
313	4234	10	2023-02-22 08:46:12	\N
314	4235	10	2023-02-22 08:46:12	\N
315	4236	10	2023-02-22 08:46:12	\N
316	4237	10	2023-02-22 08:46:12	\N
317	4238	10	2023-02-22 08:46:12	\N
318	4239	10	2023-02-22 08:46:12	\N
319	4240	10	2023-02-22 08:46:12	\N
320	4241	10	2023-02-22 08:46:12	\N
321	4242	10	2023-02-22 08:46:12	\N
322	4243	10	2023-02-22 08:46:12	\N
323	4244	10	2023-02-22 08:46:12	\N
324	4245	10	2023-02-22 08:46:12	\N
325	4246	10	2023-02-22 08:46:12	\N
326	4247	10	2023-02-22 08:46:12	\N
327	4248	10	2023-02-22 08:46:12	\N
328	4249	10	2023-02-22 08:46:12	\N
329	4250	10	2023-02-22 08:46:12	\N
330	4251	10	2023-02-22 08:46:12	\N
331	4252	10	2023-02-22 08:46:12	\N
332	4253	10	2023-02-22 08:46:12	\N
333	4254	10	2023-02-22 08:46:12	\N
334	4255	10	2023-02-22 08:46:12	\N
335	4256	10	2023-02-22 08:46:12	\N
336	4257	10	2023-02-22 08:46:12	\N
337	4258	10	2023-02-22 08:46:12	\N
338	4259	10	2023-02-22 08:46:12	\N
339	4260	10	2023-02-22 08:46:12	\N
340	4261	10	2023-02-22 08:46:12	\N
341	4262	10	2023-02-22 08:46:12	\N
342	4263	10	2023-02-22 08:46:12	\N
343	4264	10	2023-02-22 08:46:12	\N
344	4265	10	2023-02-22 08:46:12	\N
345	4266	10	2023-02-22 08:46:12	\N
346	4267	10	2023-02-22 08:46:12	\N
347	4268	10	2023-02-22 08:46:12	\N
348	4269	10	2023-02-22 08:46:12	\N
349	4270	10	2023-02-22 08:46:12	\N
350	4271	10	2023-02-22 08:46:12	\N
351	4272	10	2023-02-22 08:46:12	\N
352	4273	10	2023-02-22 08:46:12	\N
353	4274	10	2023-02-22 08:46:12	\N
354	2908	11	2023-02-22 08:47:22	\N
355	2909	11	2023-02-22 08:47:22	\N
356	2910	11	2023-02-22 08:47:22	\N
357	2911	11	2023-02-22 08:47:22	\N
358	2912	11	2023-02-22 08:47:22	\N
359	2913	11	2023-02-22 08:47:22	\N
360	2914	11	2023-02-22 08:47:22	\N
361	2915	11	2023-02-22 08:47:22	\N
362	2916	11	2023-02-22 08:47:22	\N
363	2917	11	2023-02-22 08:47:22	\N
364	2918	11	2023-02-22 08:47:22	\N
365	2919	11	2023-02-22 08:47:22	\N
366	2920	11	2023-02-22 08:47:22	\N
367	2921	11	2023-02-22 08:47:22	\N
368	2922	11	2023-02-22 08:47:22	\N
369	2923	11	2023-02-22 08:47:22	\N
370	2924	11	2023-02-22 08:47:22	\N
371	2925	11	2023-02-22 08:47:22	\N
372	2926	11	2023-02-22 08:47:22	\N
373	2927	11	2023-02-22 08:47:22	\N
374	2928	11	2023-02-22 08:47:22	\N
375	2929	11	2023-02-22 08:47:22	\N
376	2930	11	2023-02-22 08:47:22	\N
377	2931	11	2023-02-22 08:47:22	\N
378	2932	11	2023-02-22 08:47:22	\N
379	2933	11	2023-02-22 08:47:22	\N
380	2934	11	2023-02-22 08:47:22	\N
381	2935	11	2023-02-22 08:47:22	\N
382	2936	11	2023-02-22 08:47:22	\N
383	2937	11	2023-02-22 08:47:22	\N
384	2938	11	2023-02-22 08:47:22	\N
385	2939	11	2023-02-22 08:47:22	\N
386	2940	11	2023-02-22 08:47:22	\N
387	2941	11	2023-02-22 08:47:22	\N
388	2942	11	2023-02-22 08:47:22	\N
389	2943	11	2023-02-22 08:47:22	\N
390	2944	11	2023-02-22 08:47:22	\N
391	2945	11	2023-02-22 08:47:22	\N
392	2946	11	2023-02-22 08:47:22	\N
393	2947	11	2023-02-22 08:47:22	\N
394	2948	11	2023-02-22 08:47:22	\N
395	2949	11	2023-02-22 08:47:22	\N
396	2950	11	2023-02-22 08:47:22	\N
397	2951	11	2023-02-22 08:47:22	\N
398	4213	12	2023-02-22 08:47:56	\N
399	4214	12	2023-02-22 08:47:56	\N
400	4215	12	2023-02-22 08:47:56	\N
401	4216	12	2023-02-22 08:47:56	\N
402	4217	12	2023-02-22 08:47:56	\N
403	4218	12	2023-02-22 08:47:56	\N
404	4219	12	2023-02-22 08:47:56	\N
405	4220	12	2023-02-22 08:47:56	\N
406	4221	12	2023-02-22 08:47:56	\N
407	4222	12	2023-02-22 08:47:56	\N
408	4223	12	2023-02-22 08:47:56	\N
409	4224	12	2023-02-22 08:47:56	\N
410	4225	12	2023-02-22 08:47:56	\N
411	4226	12	2023-02-22 08:47:56	\N
412	4227	12	2023-02-22 08:47:56	\N
413	4228	12	2023-02-22 08:47:56	\N
414	3040	13	2023-02-22 08:48:39	\N
415	3041	13	2023-02-22 08:48:39	\N
416	3042	13	2023-02-22 08:48:39	\N
417	3043	13	2023-02-22 08:48:39	\N
418	3044	13	2023-02-22 08:48:39	\N
419	3045	13	2023-02-22 08:48:39	\N
420	3046	13	2023-02-22 08:48:39	\N
421	3047	13	2023-02-22 08:48:39	\N
422	3048	13	2023-02-22 08:48:39	\N
423	3049	13	2023-02-22 08:48:39	\N
424	3050	13	2023-02-22 08:48:39	\N
425	3051	13	2023-02-22 08:48:39	\N
426	3052	13	2023-02-22 08:48:39	\N
427	3053	13	2023-02-22 08:48:39	\N
428	3054	13	2023-02-22 08:48:39	\N
429	3055	13	2023-02-22 08:48:39	\N
430	3056	13	2023-02-22 08:48:39	\N
431	3057	13	2023-02-22 08:48:39	\N
432	3058	13	2023-02-22 08:48:39	\N
433	3059	13	2023-02-22 08:48:39	\N
434	3060	13	2023-02-22 08:48:39	\N
435	3061	13	2023-02-22 08:48:39	\N
436	3062	13	2023-02-22 08:48:39	\N
437	3063	13	2023-02-22 08:48:39	\N
438	3064	13	2023-02-22 08:48:39	\N
439	3065	13	2023-02-22 08:48:39	\N
440	3066	13	2023-02-22 08:48:39	\N
441	3067	13	2023-02-22 08:48:39	\N
442	3068	13	2023-02-22 08:48:39	\N
443	3069	13	2023-02-22 08:48:39	\N
444	3070	13	2023-02-22 08:48:39	\N
445	3071	13	2023-02-22 08:48:39	\N
446	3072	13	2023-02-22 08:48:39	\N
447	3073	13	2023-02-22 08:48:39	\N
448	3074	13	2023-02-22 08:48:39	\N
449	3075	13	2023-02-22 08:48:39	\N
450	3076	13	2023-02-22 08:48:39	\N
451	3077	13	2023-02-22 08:48:39	\N
452	3078	13	2023-02-22 08:48:39	\N
453	3079	13	2023-02-22 08:48:39	\N
454	3080	13	2023-02-22 08:48:39	\N
455	3081	13	2023-02-22 08:48:39	\N
456	3082	13	2023-02-22 08:48:39	\N
457	3083	13	2023-02-22 08:48:39	\N
458	3084	13	2023-02-22 08:48:39	\N
459	3085	13	2023-02-22 08:48:39	\N
460	3086	13	2023-02-22 08:48:39	\N
461	3087	13	2023-02-22 08:48:39	\N
462	3088	13	2023-02-22 08:48:39	\N
463	3089	13	2023-02-22 08:48:39	\N
464	3090	13	2023-02-22 08:48:39	\N
465	3091	13	2023-02-22 08:48:39	\N
466	3092	13	2023-02-22 08:48:39	\N
467	3093	13	2023-02-22 08:48:39	\N
468	3094	13	2023-02-22 08:48:39	\N
469	3095	13	2023-02-22 08:48:39	\N
470	3096	13	2023-02-22 08:48:39	\N
471	3097	13	2023-02-22 08:48:39	\N
472	3098	13	2023-02-22 08:48:39	\N
473	3099	13	2023-02-22 08:48:39	\N
474	4077	14	2023-02-22 08:49:08	\N
475	4078	14	2023-02-22 08:49:08	\N
476	4079	14	2023-02-22 08:49:08	\N
477	4080	14	2023-02-22 08:49:08	\N
478	4081	14	2023-02-22 08:49:08	\N
479	4082	14	2023-02-22 08:49:08	\N
480	4083	14	2023-02-22 08:49:08	\N
481	4084	14	2023-02-22 08:49:08	\N
482	4085	14	2023-02-22 08:49:08	\N
483	4086	14	2023-02-22 08:49:08	\N
484	4087	14	2023-02-22 08:49:08	\N
485	4088	14	2023-02-22 08:49:08	\N
486	4089	14	2023-02-22 08:49:08	\N
487	4090	14	2023-02-22 08:49:08	\N
488	4091	14	2023-02-22 08:49:08	\N
489	4092	14	2023-02-22 08:49:08	\N
490	4093	14	2023-02-22 08:49:08	\N
491	4094	14	2023-02-22 08:49:08	\N
492	4095	14	2023-02-22 08:49:08	\N
493	4096	14	2023-02-22 08:49:08	\N
494	4097	14	2023-02-22 08:49:08	\N
495	4098	14	2023-02-22 08:49:08	\N
496	4099	14	2023-02-22 08:49:08	\N
497	4100	14	2023-02-22 08:49:08	\N
498	4101	14	2023-02-22 08:49:08	\N
499	4102	14	2023-02-22 08:49:08	\N
500	4103	14	2023-02-22 08:49:08	\N
501	4104	14	2023-02-22 08:49:08	\N
502	4105	14	2023-02-22 08:49:08	\N
503	4106	14	2023-02-22 08:49:08	\N
504	4107	14	2023-02-22 08:49:08	\N
505	4108	14	2023-02-22 08:49:08	\N
506	4109	14	2023-02-22 08:49:08	\N
507	4110	14	2023-02-22 08:49:08	\N
508	4111	14	2023-02-22 08:49:08	\N
509	4112	14	2023-02-22 08:49:08	\N
510	4113	14	2023-02-22 08:49:08	\N
511	4114	14	2023-02-22 08:49:08	\N
512	4115	14	2023-02-22 08:49:08	\N
513	4116	14	2023-02-22 08:49:08	\N
514	4117	14	2023-02-22 08:49:08	\N
515	4118	14	2023-02-22 08:49:08	\N
516	4119	14	2023-02-22 08:49:08	\N
517	4120	14	2023-02-22 08:49:08	\N
518	4121	14	2023-02-22 08:49:08	\N
519	4122	14	2023-02-22 08:49:08	\N
520	4123	14	2023-02-22 08:49:08	\N
521	4124	14	2023-02-22 08:49:08	\N
522	4125	14	2023-02-22 08:49:08	\N
523	4126	14	2023-02-22 08:49:08	\N
524	4127	14	2023-02-22 08:49:08	\N
525	4128	14	2023-02-22 08:49:08	\N
526	4129	14	2023-02-22 08:49:08	\N
527	4130	14	2023-02-22 08:49:08	\N
528	4131	14	2023-02-22 08:49:08	\N
529	4132	14	2023-02-22 08:49:08	\N
530	4133	14	2023-02-22 08:49:08	\N
531	4134	14	2023-02-22 08:49:08	\N
532	4135	14	2023-02-22 08:49:08	\N
533	4136	14	2023-02-22 08:49:08	\N
534	4137	14	2023-02-22 08:49:08	\N
535	4138	14	2023-02-22 08:49:08	\N
536	4139	14	2023-02-22 08:49:08	\N
537	4140	14	2023-02-22 08:49:08	\N
538	4141	14	2023-02-22 08:49:08	\N
539	4142	14	2023-02-22 08:49:08	\N
540	4143	14	2023-02-22 08:49:08	\N
541	4144	14	2023-02-22 08:49:08	\N
542	4145	14	2023-02-22 08:49:08	\N
543	4146	14	2023-02-22 08:49:08	\N
544	4147	14	2023-02-22 08:49:08	\N
545	4148	14	2023-02-22 08:49:08	\N
546	4149	14	2023-02-22 08:49:08	\N
547	4150	14	2023-02-22 08:49:08	\N
548	4151	14	2023-02-22 08:49:08	\N
549	4152	14	2023-02-22 08:49:08	\N
550	4153	14	2023-02-22 08:49:08	\N
551	4154	14	2023-02-22 08:49:08	\N
552	4155	14	2023-02-22 08:49:08	\N
553	4156	14	2023-02-22 08:49:08	\N
554	4157	14	2023-02-22 08:49:08	\N
555	4158	14	2023-02-22 08:49:08	\N
556	4159	14	2023-02-22 08:49:08	\N
557	4160	14	2023-02-22 08:49:08	\N
558	4161	14	2023-02-22 08:49:08	\N
559	4162	14	2023-02-22 08:49:08	\N
560	4163	14	2023-02-22 08:49:08	\N
561	4164	14	2023-02-22 08:49:08	\N
562	4165	14	2023-02-22 08:49:08	\N
563	4166	14	2023-02-22 08:49:08	\N
564	4167	14	2023-02-22 08:49:08	\N
565	4168	14	2023-02-22 08:49:08	\N
566	4169	14	2023-02-22 08:49:08	\N
567	4170	14	2023-02-22 08:49:08	\N
568	4171	14	2023-02-22 08:49:08	\N
569	4172	14	2023-02-22 08:49:08	\N
570	4173	14	2023-02-22 08:49:08	\N
571	4174	14	2023-02-22 08:49:08	\N
572	4175	14	2023-02-22 08:49:08	\N
573	4176	14	2023-02-22 08:49:08	\N
574	4177	14	2023-02-22 08:49:08	\N
575	4178	14	2023-02-22 08:49:08	\N
576	4179	14	2023-02-22 08:49:08	\N
577	4180	14	2023-02-22 08:49:08	\N
578	4181	14	2023-02-22 08:49:08	\N
579	4182	14	2023-02-22 08:49:08	\N
580	4183	14	2023-02-22 08:49:08	\N
581	4184	14	2023-02-22 08:49:08	\N
582	4185	14	2023-02-22 08:49:08	\N
583	4186	14	2023-02-22 08:49:08	\N
584	4187	14	2023-02-22 08:49:08	\N
585	4188	14	2023-02-22 08:49:08	\N
586	4189	14	2023-02-22 08:49:08	\N
587	4190	14	2023-02-22 08:49:08	\N
588	4191	14	2023-02-22 08:49:08	\N
589	4192	14	2023-02-22 08:49:08	\N
590	4193	14	2023-02-22 08:49:08	\N
591	4194	14	2023-02-22 08:49:08	\N
592	4195	14	2023-02-22 08:49:08	\N
593	4196	14	2023-02-22 08:49:08	\N
594	4197	14	2023-02-22 08:49:08	\N
595	4198	14	2023-02-22 08:49:08	\N
596	4199	14	2023-02-22 08:49:08	\N
597	4200	14	2023-02-22 08:49:08	\N
598	4201	14	2023-02-22 08:49:08	\N
599	4202	14	2023-02-22 08:49:08	\N
600	4203	14	2023-02-22 08:49:08	\N
601	4204	14	2023-02-22 08:49:08	\N
602	4205	14	2023-02-22 08:49:08	\N
603	4206	14	2023-02-22 08:49:08	\N
604	4207	14	2023-02-22 08:49:08	\N
605	4208	14	2023-02-22 08:49:08	\N
606	4209	14	2023-02-22 08:49:08	\N
607	4210	14	2023-02-22 08:49:08	\N
608	4211	14	2023-02-22 08:49:08	\N
609	4212	14	2023-02-22 08:49:08	\N
610	3231	15	2023-02-22 08:49:35	\N
611	3232	15	2023-02-22 08:49:35	\N
612	3233	15	2023-02-22 08:49:35	\N
613	3234	15	2023-02-22 08:49:35	\N
614	3235	15	2023-02-22 08:49:35	\N
615	3236	15	2023-02-22 08:49:35	\N
616	3237	15	2023-02-22 08:49:35	\N
617	3238	15	2023-02-22 08:49:35	\N
618	3239	15	2023-02-22 08:49:35	\N
619	3240	15	2023-02-22 08:49:35	\N
620	3241	15	2023-02-22 08:49:35	\N
621	3242	15	2023-02-22 08:49:35	\N
622	3243	15	2023-02-22 08:49:35	\N
623	3244	15	2023-02-22 08:49:35	\N
624	3245	15	2023-02-22 08:49:35	\N
625	3246	15	2023-02-22 08:49:35	\N
626	3247	15	2023-02-22 08:49:35	\N
627	3248	15	2023-02-22 08:49:35	\N
628	3249	15	2023-02-22 08:49:35	\N
629	3250	15	2023-02-22 08:49:35	\N
630	3251	15	2023-02-22 08:49:35	\N
631	3252	15	2023-02-22 08:49:35	\N
632	3253	15	2023-02-22 08:49:35	\N
633	3254	15	2023-02-22 08:49:35	\N
634	3255	15	2023-02-22 08:49:35	\N
635	3256	15	2023-02-22 08:49:35	\N
636	3257	15	2023-02-22 08:49:35	\N
637	3258	15	2023-02-22 08:49:35	\N
638	3259	15	2023-02-22 08:49:35	\N
639	3260	15	2023-02-22 08:49:35	\N
640	3261	15	2023-02-22 08:49:35	\N
641	3262	15	2023-02-22 08:49:35	\N
642	3263	15	2023-02-22 08:49:35	\N
643	3264	15	2023-02-22 08:49:35	\N
644	3265	15	2023-02-22 08:49:35	\N
645	3266	15	2023-02-22 08:49:35	\N
646	3267	15	2023-02-22 08:49:35	\N
647	3268	15	2023-02-22 08:49:35	\N
648	3269	15	2023-02-22 08:49:35	\N
649	3270	15	2023-02-22 08:49:35	\N
650	3271	15	2023-02-22 08:49:35	\N
651	3272	15	2023-02-22 08:49:35	\N
652	3273	15	2023-02-22 08:49:35	\N
653	3274	15	2023-02-22 08:49:35	\N
654	3275	15	2023-02-22 08:49:35	\N
655	3276	15	2023-02-22 08:49:35	\N
656	3277	15	2023-02-22 08:49:35	\N
657	3949	16	2023-02-22 08:49:44	\N
658	3950	16	2023-02-22 08:49:44	\N
659	3951	16	2023-02-22 08:49:44	\N
660	3952	16	2023-02-22 08:49:44	\N
661	3953	16	2023-02-22 08:49:44	\N
662	3954	16	2023-02-22 08:49:44	\N
663	3955	16	2023-02-22 08:49:44	\N
664	3956	16	2023-02-22 08:49:44	\N
665	3957	16	2023-02-22 08:49:44	\N
666	3958	16	2023-02-22 08:49:44	\N
667	3959	16	2023-02-22 08:49:44	\N
668	3960	16	2023-02-22 08:49:44	\N
669	3961	16	2023-02-22 08:49:44	\N
670	3962	16	2023-02-22 08:49:44	\N
671	3963	16	2023-02-22 08:49:44	\N
672	3964	16	2023-02-22 08:49:44	\N
673	3965	16	2023-02-22 08:49:44	\N
674	3966	16	2023-02-22 08:49:44	\N
675	3967	16	2023-02-22 08:49:44	\N
676	3968	16	2023-02-22 08:49:44	\N
677	3969	16	2023-02-22 08:49:44	\N
678	3970	16	2023-02-22 08:49:44	\N
679	3971	16	2023-02-22 08:49:44	\N
680	3972	16	2023-02-22 08:49:44	\N
681	3973	16	2023-02-22 08:49:44	\N
682	3974	16	2023-02-22 08:49:44	\N
683	3975	16	2023-02-22 08:49:44	\N
684	3976	16	2023-02-22 08:49:44	\N
685	3977	16	2023-02-22 08:49:44	\N
686	3978	16	2023-02-22 08:49:44	\N
687	3979	16	2023-02-22 08:49:44	\N
688	3980	16	2023-02-22 08:49:44	\N
689	3981	16	2023-02-22 08:49:44	\N
690	3982	16	2023-02-22 08:49:44	\N
691	3983	16	2023-02-22 08:49:44	\N
692	3984	16	2023-02-22 08:49:44	\N
693	3985	16	2023-02-22 08:49:44	\N
694	3986	16	2023-02-22 08:49:44	\N
695	3987	16	2023-02-22 08:49:44	\N
696	3988	16	2023-02-22 08:49:44	\N
697	3989	16	2023-02-22 08:49:44	\N
698	3990	16	2023-02-22 08:49:44	\N
699	3991	16	2023-02-22 08:49:44	\N
700	3992	16	2023-02-22 08:49:44	\N
701	3993	16	2023-02-22 08:49:44	\N
702	3994	16	2023-02-22 08:49:44	\N
703	3995	16	2023-02-22 08:49:44	\N
704	3996	16	2023-02-22 08:49:44	\N
705	3997	16	2023-02-22 08:49:44	\N
706	3998	16	2023-02-22 08:49:44	\N
707	3999	16	2023-02-22 08:49:44	\N
708	4000	16	2023-02-22 08:49:44	\N
709	4001	16	2023-02-22 08:49:44	\N
710	4002	16	2023-02-22 08:49:44	\N
711	4003	16	2023-02-22 08:49:44	\N
712	4004	16	2023-02-22 08:49:44	\N
713	4005	16	2023-02-22 08:49:44	\N
714	4006	16	2023-02-22 08:49:44	\N
715	4007	16	2023-02-22 08:49:44	\N
716	4008	16	2023-02-22 08:49:44	\N
717	4009	16	2023-02-22 08:49:44	\N
718	4010	16	2023-02-22 08:49:44	\N
719	4011	16	2023-02-22 08:49:44	\N
720	4012	16	2023-02-22 08:49:44	\N
721	4013	16	2023-02-22 08:49:44	\N
722	4014	16	2023-02-22 08:49:44	\N
723	4015	16	2023-02-22 08:49:44	\N
724	4016	16	2023-02-22 08:49:44	\N
725	4017	16	2023-02-22 08:49:44	\N
726	4018	16	2023-02-22 08:49:44	\N
727	4019	16	2023-02-22 08:49:44	\N
728	4020	16	2023-02-22 08:49:44	\N
729	4021	16	2023-02-22 08:49:44	\N
730	4022	16	2023-02-22 08:49:44	\N
731	4023	16	2023-02-22 08:49:44	\N
732	4024	16	2023-02-22 08:49:44	\N
733	4025	16	2023-02-22 08:49:44	\N
734	4026	16	2023-02-22 08:49:44	\N
735	4027	16	2023-02-22 08:49:44	\N
736	4028	16	2023-02-22 08:49:44	\N
737	4029	16	2023-02-22 08:49:44	\N
738	4030	16	2023-02-22 08:49:44	\N
739	4031	16	2023-02-22 08:49:44	\N
740	4032	16	2023-02-22 08:49:44	\N
741	4033	16	2023-02-22 08:49:44	\N
742	4034	16	2023-02-22 08:49:44	\N
743	4035	16	2023-02-22 08:49:44	\N
744	4036	16	2023-02-22 08:49:44	\N
745	4037	16	2023-02-22 08:49:44	\N
746	4038	16	2023-02-22 08:49:44	\N
747	4039	16	2023-02-22 08:49:44	\N
748	4040	16	2023-02-22 08:49:44	\N
749	4041	16	2023-02-22 08:49:44	\N
750	4042	16	2023-02-22 08:49:44	\N
751	4043	16	2023-02-22 08:49:44	\N
752	4044	16	2023-02-22 08:49:44	\N
753	4045	16	2023-02-22 08:49:44	\N
754	4046	16	2023-02-22 08:49:44	\N
755	4047	16	2023-02-22 08:49:44	\N
756	4048	16	2023-02-22 08:49:44	\N
757	4049	16	2023-02-22 08:49:44	\N
758	4050	16	2023-02-22 08:49:44	\N
759	4051	16	2023-02-22 08:49:44	\N
760	4052	16	2023-02-22 08:49:44	\N
761	4053	16	2023-02-22 08:49:44	\N
762	4054	16	2023-02-22 08:49:44	\N
763	4055	16	2023-02-22 08:49:44	\N
764	4056	16	2023-02-22 08:49:44	\N
765	4057	16	2023-02-22 08:49:44	\N
766	4058	16	2023-02-22 08:49:44	\N
767	4059	16	2023-02-22 08:49:44	\N
768	4060	16	2023-02-22 08:49:44	\N
769	4061	16	2023-02-22 08:49:44	\N
770	4062	16	2023-02-22 08:49:44	\N
771	4063	16	2023-02-22 08:49:44	\N
772	4064	16	2023-02-22 08:49:44	\N
773	4065	16	2023-02-22 08:49:44	\N
774	4066	16	2023-02-22 08:49:44	\N
775	4067	16	2023-02-22 08:49:44	\N
776	4068	16	2023-02-22 08:49:44	\N
777	4069	16	2023-02-22 08:49:44	\N
778	4070	16	2023-02-22 08:49:44	\N
779	4071	16	2023-02-22 08:49:44	\N
780	4072	16	2023-02-22 08:49:44	\N
781	4073	16	2023-02-22 08:49:44	\N
782	4074	16	2023-02-22 08:49:44	\N
783	4075	16	2023-02-22 08:49:44	\N
784	4076	16	2023-02-22 08:49:45	\N
785	4424	17	2023-02-22 08:51:28	\N
786	4425	17	2023-02-22 08:51:28	\N
787	4426	17	2023-02-22 08:51:28	\N
788	4427	17	2023-02-22 08:51:28	\N
789	4428	17	2023-02-22 08:51:28	\N
790	4429	17	2023-02-22 08:51:28	\N
791	4430	17	2023-02-22 08:51:28	\N
792	4431	17	2023-02-22 08:51:28	\N
793	4432	17	2023-02-22 08:51:28	\N
794	4433	17	2023-02-22 08:51:28	\N
795	4434	17	2023-02-22 08:51:28	\N
796	4435	17	2023-02-22 08:51:28	\N
797	4436	17	2023-02-22 08:51:28	\N
798	4437	17	2023-02-22 08:51:28	\N
799	4438	17	2023-02-22 08:51:28	\N
800	4439	17	2023-02-22 08:51:28	\N
801	4440	17	2023-02-22 08:51:28	\N
802	4441	17	2023-02-22 08:51:28	\N
803	4442	17	2023-02-22 08:51:28	\N
804	4443	17	2023-02-22 08:51:28	\N
805	4444	17	2023-02-22 08:51:28	\N
806	4445	17	2023-02-22 08:51:28	\N
807	4446	17	2023-02-22 08:51:28	\N
808	4447	17	2023-02-22 08:51:28	\N
809	4448	17	2023-02-22 08:51:28	\N
810	4449	17	2023-02-22 08:51:28	\N
811	4450	17	2023-02-22 08:51:28	\N
812	4451	17	2023-02-22 08:51:28	\N
813	4452	17	2023-02-22 08:51:28	\N
814	4453	17	2023-02-22 08:51:28	\N
815	4454	17	2023-02-22 08:51:28	\N
816	4455	17	2023-02-22 08:51:28	\N
817	4456	17	2023-02-22 08:51:28	\N
818	4457	17	2023-02-22 08:51:28	\N
819	4458	17	2023-02-22 08:51:28	\N
820	4459	17	2023-02-22 08:51:28	\N
821	4460	17	2023-02-22 08:51:28	\N
822	4461	17	2023-02-22 08:51:28	\N
823	4462	17	2023-02-22 08:51:28	\N
824	4463	17	2023-02-22 08:51:28	\N
825	4464	17	2023-02-22 08:51:28	\N
826	4465	17	2023-02-22 08:51:28	\N
827	4466	17	2023-02-22 08:51:28	\N
828	4467	17	2023-02-22 08:51:28	\N
829	4468	17	2023-02-22 08:51:28	\N
830	4469	17	2023-02-22 08:51:28	\N
831	4470	17	2023-02-22 08:51:28	\N
832	4471	17	2023-02-22 08:51:28	\N
833	4472	17	2023-02-22 08:51:28	\N
834	4473	17	2023-02-22 08:51:28	\N
835	4474	17	2023-02-22 08:51:28	\N
836	4475	17	2023-02-22 08:51:28	\N
837	4476	17	2023-02-22 08:51:28	\N
838	4477	17	2023-02-22 08:51:28	\N
839	4478	17	2023-02-22 08:51:28	\N
840	4479	17	2023-02-22 08:51:28	\N
841	4480	17	2023-02-22 08:51:28	\N
842	4481	17	2023-02-22 08:51:28	\N
843	4482	17	2023-02-22 08:51:28	\N
844	4483	17	2023-02-22 08:51:28	\N
845	4484	17	2023-02-22 08:51:28	\N
846	4485	17	2023-02-22 08:51:28	\N
847	4486	17	2023-02-22 08:51:28	\N
848	4487	17	2023-02-22 08:51:28	\N
849	4488	17	2023-02-22 08:51:28	\N
850	4489	17	2023-02-22 08:51:28	\N
851	4490	17	2023-02-22 08:51:28	\N
852	4491	17	2023-02-22 08:51:28	\N
853	4492	17	2023-02-22 08:51:28	\N
854	4493	17	2023-02-22 08:51:28	\N
855	4494	17	2023-02-22 08:51:28	\N
856	4495	17	2023-02-22 08:51:28	\N
857	4496	17	2023-02-22 08:51:28	\N
858	3817	18	2023-02-22 08:52:13	\N
859	3818	18	2023-02-22 08:52:13	\N
860	3819	18	2023-02-22 08:52:13	\N
861	3820	18	2023-02-22 08:52:13	\N
862	3821	18	2023-02-22 08:52:13	\N
863	3822	18	2023-02-22 08:52:13	\N
864	3823	18	2023-02-22 08:52:13	\N
865	3824	18	2023-02-22 08:52:13	\N
866	3825	18	2023-02-22 08:52:13	\N
867	3826	18	2023-02-22 08:52:13	\N
868	3827	18	2023-02-22 08:52:13	\N
869	3828	18	2023-02-22 08:52:13	\N
870	3829	18	2023-02-22 08:52:13	\N
871	3830	18	2023-02-22 08:52:13	\N
872	3831	18	2023-02-22 08:52:13	\N
873	3832	18	2023-02-22 08:52:13	\N
874	3833	18	2023-02-22 08:52:13	\N
875	3834	18	2023-02-22 08:52:13	\N
876	3835	18	2023-02-22 08:52:13	\N
877	3836	18	2023-02-22 08:52:13	\N
878	3837	18	2023-02-22 08:52:13	\N
879	3838	18	2023-02-22 08:52:13	\N
880	3839	18	2023-02-22 08:52:13	\N
881	3840	18	2023-02-22 08:52:13	\N
882	3841	18	2023-02-22 08:52:13	\N
883	3842	18	2023-02-22 08:52:13	\N
884	3843	18	2023-02-22 08:52:13	\N
885	3844	18	2023-02-22 08:52:13	\N
886	3845	18	2023-02-22 08:52:13	\N
887	3846	18	2023-02-22 08:52:13	\N
888	3847	18	2023-02-22 08:52:13	\N
889	3848	18	2023-02-22 08:52:13	\N
890	3849	18	2023-02-22 08:52:13	\N
891	3850	18	2023-02-22 08:52:13	\N
892	3851	18	2023-02-22 08:52:13	\N
893	3852	18	2023-02-22 08:52:13	\N
894	3853	18	2023-02-22 08:52:13	\N
895	3854	18	2023-02-22 08:52:13	\N
896	3855	18	2023-02-22 08:52:13	\N
897	3856	18	2023-02-22 08:52:13	\N
898	3857	18	2023-02-22 08:52:13	\N
899	3858	18	2023-02-22 08:52:13	\N
900	3859	18	2023-02-22 08:52:13	\N
901	3860	18	2023-02-22 08:52:13	\N
902	3861	18	2023-02-22 08:52:13	\N
903	3862	18	2023-02-22 08:52:13	\N
904	3863	18	2023-02-22 08:52:13	\N
905	3864	18	2023-02-22 08:52:13	\N
906	3865	18	2023-02-22 08:52:13	\N
907	3866	18	2023-02-22 08:52:13	\N
908	3867	18	2023-02-22 08:52:13	\N
909	3868	18	2023-02-22 08:52:13	\N
910	3869	18	2023-02-22 08:52:13	\N
911	3870	18	2023-02-22 08:52:13	\N
912	3871	18	2023-02-22 08:52:13	\N
913	3872	18	2023-02-22 08:52:13	\N
914	3873	18	2023-02-22 08:52:13	\N
915	3874	18	2023-02-22 08:52:13	\N
916	3875	18	2023-02-22 08:52:13	\N
917	3876	18	2023-02-22 08:52:13	\N
918	3877	18	2023-02-22 08:52:13	\N
919	3878	18	2023-02-22 08:52:13	\N
920	3879	18	2023-02-22 08:52:13	\N
921	3880	18	2023-02-22 08:52:13	\N
922	3881	18	2023-02-22 08:52:13	\N
923	3882	18	2023-02-22 08:52:13	\N
924	3612	19	2023-02-22 08:59:25	\N
925	3613	19	2023-02-22 08:59:25	\N
926	3614	19	2023-02-22 08:59:25	\N
927	3615	19	2023-02-22 08:59:25	\N
928	3616	19	2023-02-22 08:59:25	\N
929	3617	19	2023-02-22 08:59:25	\N
930	3618	19	2023-02-22 08:59:25	\N
931	3619	19	2023-02-22 08:59:25	\N
932	3620	19	2023-02-22 08:59:25	\N
933	3621	19	2023-02-22 08:59:25	\N
934	3622	19	2023-02-22 08:59:25	\N
935	3623	19	2023-02-22 08:59:25	\N
936	3624	19	2023-02-22 08:59:25	\N
937	3625	19	2023-02-22 08:59:25	\N
938	3626	19	2023-02-22 08:59:25	\N
939	3627	19	2023-02-22 08:59:25	\N
940	3628	19	2023-02-22 08:59:25	\N
941	3629	19	2023-02-22 08:59:25	\N
942	3630	19	2023-02-22 08:59:25	\N
943	3631	19	2023-02-22 08:59:25	\N
944	3632	19	2023-02-22 08:59:25	\N
945	3633	19	2023-02-22 08:59:25	\N
946	3634	19	2023-02-22 08:59:25	\N
947	3635	19	2023-02-22 08:59:25	\N
948	3636	19	2023-02-22 08:59:25	\N
949	3637	19	2023-02-22 08:59:25	\N
950	3638	19	2023-02-22 08:59:25	\N
951	3639	19	2023-02-22 08:59:25	\N
952	3640	19	2023-02-22 08:59:25	\N
953	3641	19	2023-02-22 08:59:25	\N
954	3642	19	2023-02-22 08:59:26	\N
955	3643	19	2023-02-22 08:59:26	\N
956	3644	19	2023-02-22 08:59:26	\N
957	3645	19	2023-02-22 08:59:26	\N
958	3646	19	2023-02-22 08:59:26	\N
959	3647	19	2023-02-22 08:59:26	\N
960	3648	19	2023-02-22 08:59:26	\N
961	3649	19	2023-02-22 08:59:26	\N
962	3650	19	2023-02-22 08:59:26	\N
963	3651	19	2023-02-22 08:59:26	\N
964	3652	19	2023-02-22 08:59:26	\N
965	3653	19	2023-02-22 08:59:26	\N
966	3654	19	2023-02-22 08:59:26	\N
967	3655	19	2023-02-22 08:59:26	\N
968	3656	19	2023-02-22 08:59:26	\N
969	3657	19	2023-02-22 08:59:26	\N
970	3658	19	2023-02-22 08:59:26	\N
971	3659	19	2023-02-22 08:59:26	\N
972	3660	19	2023-02-22 08:59:26	\N
973	3661	19	2023-02-22 08:59:26	\N
974	3662	19	2023-02-22 08:59:26	\N
975	3663	19	2023-02-22 08:59:26	\N
976	3664	19	2023-02-22 08:59:26	\N
977	3665	19	2023-02-22 08:59:26	\N
978	3666	19	2023-02-22 08:59:26	\N
979	3667	19	2023-02-22 08:59:26	\N
980	3668	19	2023-02-22 08:59:26	\N
981	3669	19	2023-02-22 08:59:26	\N
982	3670	19	2023-02-22 08:59:26	\N
983	3671	19	2023-02-22 08:59:26	\N
984	3672	19	2023-02-22 08:59:26	\N
985	3673	19	2023-02-22 08:59:26	\N
986	3674	19	2023-02-22 08:59:26	\N
987	3675	19	2023-02-22 08:59:26	\N
988	3676	19	2023-02-22 08:59:26	\N
989	3677	19	2023-02-22 08:59:26	\N
990	3678	19	2023-02-22 08:59:26	\N
991	3679	19	2023-02-22 08:59:26	\N
992	3680	19	2023-02-22 08:59:26	\N
993	3681	19	2023-02-22 08:59:26	\N
994	3682	19	2023-02-22 08:59:26	\N
995	3683	19	2023-02-22 08:59:26	\N
996	3684	19	2023-02-22 08:59:26	\N
997	3685	19	2023-02-22 08:59:26	\N
998	3686	19	2023-02-22 08:59:26	\N
999	3687	19	2023-02-22 08:59:26	\N
1000	3688	19	2023-02-22 08:59:26	\N
1001	3689	19	2023-02-22 08:59:26	\N
1002	3690	19	2023-02-22 08:59:26	\N
1003	3691	19	2023-02-22 08:59:26	\N
1004	3692	19	2023-02-22 08:59:26	\N
1005	3693	19	2023-02-22 08:59:26	\N
1006	3694	19	2023-02-22 08:59:26	\N
1007	3695	19	2023-02-22 08:59:26	\N
1008	3696	19	2023-02-22 08:59:26	\N
1009	3697	19	2023-02-22 08:59:26	\N
1010	3698	19	2023-02-22 08:59:26	\N
1011	3699	19	2023-02-22 08:59:26	\N
1012	3700	19	2023-02-22 08:59:26	\N
1013	3701	19	2023-02-22 08:59:26	\N
1014	3702	19	2023-02-22 08:59:26	\N
1015	3703	19	2023-02-22 08:59:26	\N
1016	3704	19	2023-02-22 08:59:26	\N
1017	3705	19	2023-02-22 08:59:26	\N
1018	3706	19	2023-02-22 08:59:26	\N
1019	3707	19	2023-02-22 08:59:26	\N
1020	3708	19	2023-02-22 08:59:26	\N
1021	3709	19	2023-02-22 08:59:26	\N
1022	3710	19	2023-02-22 08:59:26	\N
1023	3711	19	2023-02-22 08:59:26	\N
1024	3712	19	2023-02-22 08:59:26	\N
1025	3713	19	2023-02-22 08:59:26	\N
1026	3714	19	2023-02-22 08:59:26	\N
1027	3715	19	2023-02-22 08:59:26	\N
1028	3716	19	2023-02-22 08:59:26	\N
1029	3717	19	2023-02-22 08:59:26	\N
1030	3718	19	2023-02-22 08:59:26	\N
1031	3719	19	2023-02-22 08:59:26	\N
1032	3720	19	2023-02-22 08:59:26	\N
1033	3721	19	2023-02-22 08:59:26	\N
1034	3722	19	2023-02-22 08:59:26	\N
1035	3723	19	2023-02-22 08:59:26	\N
1036	3724	19	2023-02-22 08:59:26	\N
1037	3725	19	2023-02-22 08:59:26	\N
1038	3726	19	2023-02-22 08:59:26	\N
1039	3727	19	2023-02-22 08:59:26	\N
1040	3728	19	2023-02-22 08:59:26	\N
1041	3729	19	2023-02-22 08:59:26	\N
1042	3730	19	2023-02-22 08:59:26	\N
1043	3731	19	2023-02-22 08:59:26	\N
1044	3732	19	2023-02-22 08:59:26	\N
1045	3733	19	2023-02-22 08:59:26	\N
1046	3734	19	2023-02-22 08:59:26	\N
1047	3735	19	2023-02-22 08:59:26	\N
1048	3736	19	2023-02-22 08:59:26	\N
1049	3737	19	2023-02-22 08:59:26	\N
1050	3738	19	2023-02-22 08:59:26	\N
1051	3739	19	2023-02-22 08:59:26	\N
1052	3740	19	2023-02-22 08:59:26	\N
1053	3741	19	2023-02-22 08:59:26	\N
1054	3742	19	2023-02-22 08:59:26	\N
1055	3743	19	2023-02-22 08:59:26	\N
1056	3744	19	2023-02-22 08:59:26	\N
1058	3503	50	2023-02-22 09:17:40	\N
1059	3504	50	2023-02-22 09:17:40	\N
1060	3505	50	2023-02-22 09:17:40	\N
1061	3506	50	2023-02-22 09:17:40	\N
1062	3507	50	2023-02-22 09:17:40	\N
1063	3508	50	2023-02-22 09:17:40	\N
1064	3509	50	2023-02-22 09:17:40	\N
1065	3510	50	2023-02-22 09:17:40	\N
1066	3511	50	2023-02-22 09:17:40	\N
1067	3512	50	2023-02-22 09:17:40	\N
1068	3513	50	2023-02-22 09:17:40	\N
1069	3514	50	2023-02-22 09:17:40	\N
1070	3515	50	2023-02-22 09:17:40	\N
1071	3516	50	2023-02-22 09:17:40	\N
1072	3517	50	2023-02-22 09:17:40	\N
1073	3518	50	2023-02-22 09:17:40	\N
1074	3519	50	2023-02-22 09:17:40	\N
1075	3520	50	2023-02-22 09:17:40	\N
1076	3521	50	2023-02-22 09:17:40	\N
1077	3522	50	2023-02-22 09:17:40	\N
1078	3523	50	2023-02-22 09:17:40	\N
1079	3524	50	2023-02-22 09:17:40	\N
1080	3525	50	2023-02-22 09:17:40	\N
1081	3526	50	2023-02-22 09:17:40	\N
1082	3527	50	2023-02-22 09:17:40	\N
1083	3528	50	2023-02-22 09:17:40	\N
1084	3529	50	2023-02-22 09:17:40	\N
1085	3530	50	2023-02-22 09:17:40	\N
1086	3531	50	2023-02-22 09:17:40	\N
1087	3532	50	2023-02-22 09:17:40	\N
1088	3533	50	2023-02-22 09:17:40	\N
1089	3534	50	2023-02-22 09:17:40	\N
1090	3535	50	2023-02-22 09:17:40	\N
1091	3536	50	2023-02-22 09:17:40	\N
1092	3537	50	2023-02-22 09:17:40	\N
1093	3538	50	2023-02-22 09:17:40	\N
1094	3539	50	2023-02-22 09:17:40	\N
1095	3540	50	2023-02-22 09:17:40	\N
1096	3541	50	2023-02-22 09:17:40	\N
1097	3542	50	2023-02-22 09:17:40	\N
1098	3543	50	2023-02-22 09:17:40	\N
1099	3544	50	2023-02-22 09:17:40	\N
1100	3545	50	2023-02-22 09:17:40	\N
1101	3546	50	2023-02-22 09:17:40	\N
1102	3547	50	2023-02-22 09:17:40	\N
1103	3548	50	2023-02-22 09:17:40	\N
1104	3549	50	2023-02-22 09:17:40	\N
1105	3550	50	2023-02-22 09:17:40	\N
1106	3551	50	2023-02-22 09:17:40	\N
1107	3552	50	2023-02-22 09:17:40	\N
1108	3553	50	2023-02-22 09:17:40	\N
1109	3554	50	2023-02-22 09:17:40	\N
1110	3555	50	2023-02-22 09:17:40	\N
1111	3556	50	2023-02-22 09:17:40	\N
1112	3398	51	2023-02-22 09:18:39	\N
1113	3399	51	2023-02-22 09:18:39	\N
1114	3400	51	2023-02-22 09:18:39	\N
1115	3401	51	2023-02-22 09:18:39	\N
1116	3402	51	2023-02-22 09:18:39	\N
1117	3403	51	2023-02-22 09:18:39	\N
1118	3404	51	2023-02-22 09:18:39	\N
1119	3405	51	2023-02-22 09:18:39	\N
1120	3406	51	2023-02-22 09:18:39	\N
1121	3407	51	2023-02-22 09:18:39	\N
1122	3408	51	2023-02-22 09:18:39	\N
1123	3409	51	2023-02-22 09:18:39	\N
1124	3410	51	2023-02-22 09:18:39	\N
1125	3411	51	2023-02-22 09:18:39	\N
1126	3412	51	2023-02-22 09:18:39	\N
1127	3413	51	2023-02-22 09:18:39	\N
1128	3414	51	2023-02-22 09:18:39	\N
1129	3415	51	2023-02-22 09:18:39	\N
1130	3416	51	2023-02-22 09:18:39	\N
1131	3417	51	2023-02-22 09:18:39	\N
1132	3418	51	2023-02-22 09:18:39	\N
1133	3419	51	2023-02-22 09:18:39	\N
1134	3420	51	2023-02-22 09:18:39	\N
1135	3421	51	2023-02-22 09:18:39	\N
1136	3422	51	2023-02-22 09:18:39	\N
1137	3423	51	2023-02-22 09:18:39	\N
1138	3424	51	2023-02-22 09:18:39	\N
1139	3425	51	2023-02-22 09:18:39	\N
1140	3426	51	2023-02-22 09:18:39	\N
1141	3427	51	2023-02-22 09:18:39	\N
1142	3428	51	2023-02-22 09:18:39	\N
1143	3429	51	2023-02-22 09:18:39	\N
1144	3430	51	2023-02-22 09:18:39	\N
1145	3431	51	2023-02-22 09:18:39	\N
1146	3432	51	2023-02-22 09:18:39	\N
1147	3433	51	2023-02-22 09:18:39	\N
1148	3434	51	2023-02-22 09:18:39	\N
1149	3435	51	2023-02-22 09:18:39	\N
1150	3436	51	2023-02-22 09:18:39	\N
1151	3437	51	2023-02-22 09:18:39	\N
1152	3438	51	2023-02-22 09:18:39	\N
1153	3439	51	2023-02-22 09:18:39	\N
1154	3440	51	2023-02-22 09:18:39	\N
1155	3441	51	2023-02-22 09:18:39	\N
1156	3442	51	2023-02-22 09:18:39	\N
1157	3443	51	2023-02-22 09:18:39	\N
1158	3444	51	2023-02-22 09:18:39	\N
1159	3445	51	2023-02-22 09:18:39	\N
1160	3446	51	2023-02-22 09:18:39	\N
1161	3447	51	2023-02-22 09:18:39	\N
1162	3448	51	2023-02-22 09:18:39	\N
1163	3449	51	2023-02-22 09:18:39	\N
1164	3450	51	2023-02-22 09:18:39	\N
1165	3278	52	2023-02-22 09:19:16	\N
1166	3279	52	2023-02-22 09:19:16	\N
1167	3280	52	2023-02-22 09:19:16	\N
1168	3281	52	2023-02-22 09:19:16	\N
1169	3282	52	2023-02-22 09:19:16	\N
1170	3283	52	2023-02-22 09:19:16	\N
1171	3284	52	2023-02-22 09:19:16	\N
1172	3285	52	2023-02-22 09:19:16	\N
1173	3286	52	2023-02-22 09:19:16	\N
1174	3287	52	2023-02-22 09:19:16	\N
1175	3288	52	2023-02-22 09:19:16	\N
1176	3289	52	2023-02-22 09:19:16	\N
1177	3290	52	2023-02-22 09:19:16	\N
1178	3291	52	2023-02-22 09:19:16	\N
1179	3292	52	2023-02-22 09:19:16	\N
1180	3293	52	2023-02-22 09:19:16	\N
1181	3294	52	2023-02-22 09:19:16	\N
1182	3295	52	2023-02-22 09:19:16	\N
1183	3296	52	2023-02-22 09:19:16	\N
1184	3297	52	2023-02-22 09:19:16	\N
1185	3298	52	2023-02-22 09:19:16	\N
1186	3299	52	2023-02-22 09:19:16	\N
1187	3300	52	2023-02-22 09:19:16	\N
1188	3301	52	2023-02-22 09:19:16	\N
1189	3302	52	2023-02-22 09:19:16	\N
1190	3303	52	2023-02-22 09:19:16	\N
1191	3304	52	2023-02-22 09:19:16	\N
1192	3305	52	2023-02-22 09:19:16	\N
1193	3306	52	2023-02-22 09:19:16	\N
1194	3307	52	2023-02-22 09:19:16	\N
1195	3308	52	2023-02-22 09:19:16	\N
1196	3309	52	2023-02-22 09:19:16	\N
1197	3310	52	2023-02-22 09:19:16	\N
1198	3311	52	2023-02-22 09:19:16	\N
1199	3312	52	2023-02-22 09:19:16	\N
1200	3313	52	2023-02-22 09:19:16	\N
1201	3314	52	2023-02-22 09:19:16	\N
1202	3315	52	2023-02-22 09:19:16	\N
1203	3316	52	2023-02-22 09:19:16	\N
1204	3317	52	2023-02-22 09:19:16	\N
1205	3318	52	2023-02-22 09:19:16	\N
1206	3319	52	2023-02-22 09:19:16	\N
1207	3320	52	2023-02-22 09:19:16	\N
1208	3321	52	2023-02-22 09:19:16	\N
1209	3322	52	2023-02-22 09:19:16	\N
1210	3323	52	2023-02-22 09:19:16	\N
1211	3324	52	2023-02-22 09:19:16	\N
1212	3325	52	2023-02-22 09:19:16	\N
1213	3326	52	2023-02-22 09:19:16	\N
1214	3327	52	2023-02-22 09:19:16	\N
1215	3328	52	2023-02-22 09:19:16	\N
1216	3329	52	2023-02-22 09:19:16	\N
1217	3330	52	2023-02-22 09:19:16	\N
1218	3331	52	2023-02-22 09:19:16	\N
1219	3332	52	2023-02-22 09:19:16	\N
1220	3333	52	2023-02-22 09:19:16	\N
1221	3334	52	2023-02-22 09:19:16	\N
1222	3335	52	2023-02-22 09:19:16	\N
1223	3336	52	2023-02-22 09:19:16	\N
1224	3337	52	2023-02-22 09:19:16	\N
1225	3338	52	2023-02-22 09:19:16	\N
1226	3339	52	2023-02-22 09:19:16	\N
1227	3340	52	2023-02-22 09:19:16	\N
1228	3341	52	2023-02-22 09:19:16	\N
1229	3342	52	2023-02-22 09:19:16	\N
1230	3343	52	2023-02-22 09:19:16	\N
1231	3344	52	2023-02-22 09:19:16	\N
1232	3345	52	2023-02-22 09:19:16	\N
1233	3346	52	2023-02-22 09:19:16	\N
1234	3347	52	2023-02-22 09:19:16	\N
1235	3348	52	2023-02-22 09:19:16	\N
1236	3349	52	2023-02-22 09:19:16	\N
1237	3350	52	2023-02-22 09:19:16	\N
1238	3351	52	2023-02-22 09:19:16	\N
1239	3352	52	2023-02-22 09:19:16	\N
1240	3353	52	2023-02-22 09:19:16	\N
1241	3354	52	2023-02-22 09:19:16	\N
1242	3355	52	2023-02-22 09:19:16	\N
1243	3356	52	2023-02-22 09:19:16	\N
1244	3357	52	2023-02-22 09:19:16	\N
1245	3358	52	2023-02-22 09:19:16	\N
1246	3359	52	2023-02-22 09:19:16	\N
1247	3360	52	2023-02-22 09:19:16	\N
1248	3361	52	2023-02-22 09:19:16	\N
1249	3362	52	2023-02-22 09:19:16	\N
1250	3363	52	2023-02-22 09:19:16	\N
1251	3364	52	2023-02-22 09:19:16	\N
1252	3365	52	2023-02-22 09:19:16	\N
1253	3366	52	2023-02-22 09:19:16	\N
1254	3367	52	2023-02-22 09:19:16	\N
1255	3368	52	2023-02-22 09:19:16	\N
1256	3369	52	2023-02-22 09:19:16	\N
1257	3370	52	2023-02-22 09:19:16	\N
1258	3371	52	2023-02-22 09:19:16	\N
1259	3372	52	2023-02-22 09:19:16	\N
1260	3373	52	2023-02-22 09:19:16	\N
1261	3374	52	2023-02-22 09:19:16	\N
1262	3375	52	2023-02-22 09:19:16	\N
1263	3376	52	2023-02-22 09:19:16	\N
1264	3377	52	2023-02-22 09:19:16	\N
1265	3378	52	2023-02-22 09:19:16	\N
1266	3379	52	2023-02-22 09:19:16	\N
1267	3380	52	2023-02-22 09:19:16	\N
1268	3381	52	2023-02-22 09:19:16	\N
1269	3382	52	2023-02-22 09:19:16	\N
1270	3383	52	2023-02-22 09:19:16	\N
1271	3384	52	2023-02-22 09:19:16	\N
1272	3385	52	2023-02-22 09:19:16	\N
1273	3386	52	2023-02-22 09:19:16	\N
1274	3387	52	2023-02-22 09:19:16	\N
1275	3388	52	2023-02-22 09:19:16	\N
1276	3389	52	2023-02-22 09:19:16	\N
1277	3390	52	2023-02-22 09:19:16	\N
1278	3391	52	2023-02-22 09:19:16	\N
1279	3392	52	2023-02-22 09:19:16	\N
1280	3393	52	2023-02-22 09:19:16	\N
1281	3394	52	2023-02-22 09:19:16	\N
1282	3395	52	2023-02-22 09:19:16	\N
1283	3396	52	2023-02-22 09:19:16	\N
1284	3397	52	2023-02-22 09:19:16	\N
1285	3156	53	2023-02-22 09:20:08	\N
1286	3157	53	2023-02-22 09:20:08	\N
1287	3158	53	2023-02-22 09:20:08	\N
1288	3159	53	2023-02-22 09:20:08	\N
1289	3160	53	2023-02-22 09:20:08	\N
1290	3161	53	2023-02-22 09:20:08	\N
1291	3162	53	2023-02-22 09:20:08	\N
1292	3163	53	2023-02-22 09:20:08	\N
1293	3164	53	2023-02-22 09:20:08	\N
1294	3165	53	2023-02-22 09:20:08	\N
1295	3166	53	2023-02-22 09:20:08	\N
1296	3167	53	2023-02-22 09:20:08	\N
1297	3168	53	2023-02-22 09:20:08	\N
1298	3169	53	2023-02-22 09:20:08	\N
1299	3170	53	2023-02-22 09:20:08	\N
1300	3171	53	2023-02-22 09:20:08	\N
1301	3172	53	2023-02-22 09:20:08	\N
1302	3173	53	2023-02-22 09:20:08	\N
1303	3174	53	2023-02-22 09:20:08	\N
1304	3175	53	2023-02-22 09:20:08	\N
1305	3176	53	2023-02-22 09:20:08	\N
1306	3177	53	2023-02-22 09:20:08	\N
1307	3178	53	2023-02-22 09:20:08	\N
1308	3179	53	2023-02-22 09:20:08	\N
1309	3180	53	2023-02-22 09:20:08	\N
1310	3181	53	2023-02-22 09:20:08	\N
1311	3182	53	2023-02-22 09:20:08	\N
1312	3183	53	2023-02-22 09:20:08	\N
1313	3184	53	2023-02-22 09:20:08	\N
1314	3185	53	2023-02-22 09:20:08	\N
1315	3186	53	2023-02-22 09:20:08	\N
1316	3187	53	2023-02-22 09:20:08	\N
1317	3188	53	2023-02-22 09:20:08	\N
1318	3189	53	2023-02-22 09:20:08	\N
1319	3190	53	2023-02-22 09:20:08	\N
1320	3191	53	2023-02-22 09:20:08	\N
1321	3192	53	2023-02-22 09:20:08	\N
1322	3193	53	2023-02-22 09:20:08	\N
1323	3194	53	2023-02-22 09:20:08	\N
1324	3195	53	2023-02-22 09:20:08	\N
1325	3196	53	2023-02-22 09:20:08	\N
1326	3197	53	2023-02-22 09:20:08	\N
1327	3198	53	2023-02-22 09:20:08	\N
1328	3199	53	2023-02-22 09:20:08	\N
1329	3200	53	2023-02-22 09:20:08	\N
1330	3201	53	2023-02-22 09:20:08	\N
1331	3202	53	2023-02-22 09:20:08	\N
1332	3203	53	2023-02-22 09:20:08	\N
1333	3204	53	2023-02-22 09:20:08	\N
1334	3205	53	2023-02-22 09:20:08	\N
1335	3206	53	2023-02-22 09:20:08	\N
1336	3207	53	2023-02-22 09:20:08	\N
1337	3208	53	2023-02-22 09:20:08	\N
1338	3209	53	2023-02-22 09:20:08	\N
1339	3210	53	2023-02-22 09:20:08	\N
1340	3211	53	2023-02-22 09:20:08	\N
1341	3212	53	2023-02-22 09:20:08	\N
1342	3213	53	2023-02-22 09:20:08	\N
1343	3214	53	2023-02-22 09:20:08	\N
1344	3215	53	2023-02-22 09:20:08	\N
1345	3216	53	2023-02-22 09:20:08	\N
1346	3217	53	2023-02-22 09:20:08	\N
1347	3218	53	2023-02-22 09:20:08	\N
1348	3219	53	2023-02-22 09:20:08	\N
1349	3220	53	2023-02-22 09:20:08	\N
1350	3221	53	2023-02-22 09:20:08	\N
1351	3222	53	2023-02-22 09:20:08	\N
1352	3223	53	2023-02-22 09:20:08	\N
1353	3224	53	2023-02-22 09:20:08	\N
1354	3225	53	2023-02-22 09:20:08	\N
1355	3226	53	2023-02-22 09:20:08	\N
1356	3227	53	2023-02-22 09:20:08	\N
1357	3228	53	2023-02-22 09:20:08	\N
1358	3229	53	2023-02-22 09:20:08	\N
1359	3230	53	2023-02-22 09:20:08	\N
1360	2952	54	2023-02-22 09:20:51	\N
1361	2953	54	2023-02-22 09:20:51	\N
1362	2954	54	2023-02-22 09:20:51	\N
1363	2955	54	2023-02-22 09:20:51	\N
1364	2956	54	2023-02-22 09:20:51	\N
1365	2957	54	2023-02-22 09:20:51	\N
1366	2958	54	2023-02-22 09:20:51	\N
1367	2959	54	2023-02-22 09:20:51	\N
1368	2960	54	2023-02-22 09:20:51	\N
1369	2961	54	2023-02-22 09:20:51	\N
1370	2962	54	2023-02-22 09:20:51	\N
1371	2963	54	2023-02-22 09:20:51	\N
1372	2964	54	2023-02-22 09:20:51	\N
1373	2965	54	2023-02-22 09:20:51	\N
1374	2966	54	2023-02-22 09:20:51	\N
1375	2967	54	2023-02-22 09:20:51	\N
1376	2968	54	2023-02-22 09:20:51	\N
1377	2969	54	2023-02-22 09:20:51	\N
1378	2970	54	2023-02-22 09:20:51	\N
1379	2971	54	2023-02-22 09:20:51	\N
1380	2972	54	2023-02-22 09:20:51	\N
1381	2973	54	2023-02-22 09:20:51	\N
1382	2974	54	2023-02-22 09:20:51	\N
1383	2975	54	2023-02-22 09:20:51	\N
1384	2976	54	2023-02-22 09:20:51	\N
1385	2977	54	2023-02-22 09:20:51	\N
1386	2978	54	2023-02-22 09:20:51	\N
1387	2979	54	2023-02-22 09:20:51	\N
1388	2980	54	2023-02-22 09:20:51	\N
1389	2981	54	2023-02-22 09:20:51	\N
1390	2982	54	2023-02-22 09:20:51	\N
1391	2983	54	2023-02-22 09:20:51	\N
1392	2984	54	2023-02-22 09:20:51	\N
1393	2985	54	2023-02-22 09:20:51	\N
1394	2986	54	2023-02-22 09:20:51	\N
1395	2987	54	2023-02-22 09:20:51	\N
1396	2988	54	2023-02-22 09:20:51	\N
1397	2989	54	2023-02-22 09:20:51	\N
1398	2990	54	2023-02-22 09:20:51	\N
1399	2991	54	2023-02-22 09:20:51	\N
1400	2992	54	2023-02-22 09:20:51	\N
1401	2993	54	2023-02-22 09:20:51	\N
1402	2994	54	2023-02-22 09:20:51	\N
1403	2995	54	2023-02-22 09:20:51	\N
1404	2996	54	2023-02-22 09:20:51	\N
1405	2997	54	2023-02-22 09:20:51	\N
1406	2998	54	2023-02-22 09:20:51	\N
1407	2999	54	2023-02-22 09:20:51	\N
1408	3000	54	2023-02-22 09:20:51	\N
1409	3001	54	2023-02-22 09:20:51	\N
1410	3002	54	2023-02-22 09:20:51	\N
1411	3003	54	2023-02-22 09:20:51	\N
1412	3004	54	2023-02-22 09:20:51	\N
1413	3005	54	2023-02-22 09:20:51	\N
1414	3006	54	2023-02-22 09:20:51	\N
1415	3007	54	2023-02-22 09:20:51	\N
1416	3008	54	2023-02-22 09:20:51	\N
1417	3009	54	2023-02-22 09:20:51	\N
1418	3010	54	2023-02-22 09:20:51	\N
1419	3011	54	2023-02-22 09:20:51	\N
1420	3012	54	2023-02-22 09:20:51	\N
1421	3013	54	2023-02-22 09:20:51	\N
1422	3014	54	2023-02-22 09:20:51	\N
1423	3015	54	2023-02-22 09:20:51	\N
1424	3016	54	2023-02-22 09:20:51	\N
1425	3017	54	2023-02-22 09:20:51	\N
1426	3018	54	2023-02-22 09:20:51	\N
1427	3019	54	2023-02-22 09:20:51	\N
1428	3020	54	2023-02-22 09:20:51	\N
1429	3021	54	2023-02-22 09:20:51	\N
1430	3022	54	2023-02-22 09:20:51	\N
1431	3023	54	2023-02-22 09:20:51	\N
1432	3024	54	2023-02-22 09:20:51	\N
1433	3025	54	2023-02-22 09:20:51	\N
1434	3026	54	2023-02-22 09:20:51	\N
1435	3027	54	2023-02-22 09:20:51	\N
1436	3028	54	2023-02-22 09:20:51	\N
1437	3029	54	2023-02-22 09:20:51	\N
1438	3030	54	2023-02-22 09:20:51	\N
1439	3031	54	2023-02-22 09:20:51	\N
1440	3032	54	2023-02-22 09:20:51	\N
1441	3033	54	2023-02-22 09:20:51	\N
1442	3034	54	2023-02-22 09:20:51	\N
1443	3035	54	2023-02-22 09:20:51	\N
1444	3036	54	2023-02-22 09:20:51	\N
1445	3037	54	2023-02-22 09:20:51	\N
1446	3038	54	2023-02-22 09:20:51	\N
1447	3039	54	2023-02-22 09:20:51	\N
1448	2819	55	2023-02-22 09:24:18	\N
1449	2820	55	2023-02-22 09:24:18	\N
1450	2821	55	2023-02-22 09:24:18	\N
1451	2822	55	2023-02-22 09:24:18	\N
1452	2823	55	2023-02-22 09:24:18	\N
1453	2824	55	2023-02-22 09:24:18	\N
1454	2825	55	2023-02-22 09:24:19	\N
1455	2826	55	2023-02-22 09:24:19	\N
1456	2827	55	2023-02-22 09:24:19	\N
1457	2828	55	2023-02-22 09:24:19	\N
1458	2829	55	2023-02-22 09:24:19	\N
1459	2830	55	2023-02-22 09:24:19	\N
1460	2831	55	2023-02-22 09:24:19	\N
1461	2832	55	2023-02-22 09:24:19	\N
1462	2833	55	2023-02-22 09:24:19	\N
1463	2834	55	2023-02-22 09:24:19	\N
1464	2835	55	2023-02-22 09:24:19	\N
1465	2836	55	2023-02-22 09:24:19	\N
1466	2837	55	2023-02-22 09:24:19	\N
1467	2838	55	2023-02-22 09:24:19	\N
1468	2839	55	2023-02-22 09:24:19	\N
1469	2840	55	2023-02-22 09:24:19	\N
1470	2841	55	2023-02-22 09:24:19	\N
1471	2842	55	2023-02-22 09:24:19	\N
1472	2843	55	2023-02-22 09:24:19	\N
1473	2844	55	2023-02-22 09:24:19	\N
1474	2845	55	2023-02-22 09:24:19	\N
1475	2846	55	2023-02-22 09:24:19	\N
1476	2847	55	2023-02-22 09:24:19	\N
1477	2848	55	2023-02-22 09:24:19	\N
1478	2849	55	2023-02-22 09:24:19	\N
1479	2850	55	2023-02-22 09:24:19	\N
1480	2851	55	2023-02-22 09:24:19	\N
1481	2852	55	2023-02-22 09:24:19	\N
1482	2792	56	2023-02-22 09:25:00	\N
1483	2793	56	2023-02-22 09:25:00	\N
1484	2794	56	2023-02-22 09:25:00	\N
1485	2795	56	2023-02-22 09:25:00	\N
1486	2796	56	2023-02-22 09:25:00	\N
1487	2797	56	2023-02-22 09:25:00	\N
1488	2798	56	2023-02-22 09:25:00	\N
1489	2799	56	2023-02-22 09:25:00	\N
1490	2800	56	2023-02-22 09:25:00	\N
1491	2801	56	2023-02-22 09:25:00	\N
1492	2802	56	2023-02-22 09:25:00	\N
1493	2803	56	2023-02-22 09:25:00	\N
1494	2804	56	2023-02-22 09:25:00	\N
1495	2805	56	2023-02-22 09:25:00	\N
1496	2806	56	2023-02-22 09:25:00	\N
1497	2807	56	2023-02-22 09:25:00	\N
1498	2808	56	2023-02-22 09:25:00	\N
1499	2809	56	2023-02-22 09:25:00	\N
1500	2810	56	2023-02-22 09:25:00	\N
1501	2811	56	2023-02-22 09:25:00	\N
1502	2812	56	2023-02-22 09:25:00	\N
1503	2813	56	2023-02-22 09:25:00	\N
1504	2814	56	2023-02-22 09:25:00	\N
1505	2815	56	2023-02-22 09:25:00	\N
1506	2816	56	2023-02-22 09:25:00	\N
1507	2817	56	2023-02-22 09:25:00	\N
1508	2818	56	2023-02-22 09:25:00	\N
1509	2674	57	2023-02-22 09:26:45	\N
1510	2675	57	2023-02-22 09:26:45	\N
1511	2676	57	2023-02-22 09:26:45	\N
1512	2677	57	2023-02-22 09:26:45	\N
1513	2678	57	2023-02-22 09:26:45	\N
1514	2679	57	2023-02-22 09:26:45	\N
1515	2680	57	2023-02-22 09:26:45	\N
1516	2681	57	2023-02-22 09:26:45	\N
1517	2682	57	2023-02-22 09:26:45	\N
1518	2683	57	2023-02-22 09:26:45	\N
1519	2684	57	2023-02-22 09:26:45	\N
1520	2685	57	2023-02-22 09:26:45	\N
1521	2686	57	2023-02-22 09:26:45	\N
1522	2687	57	2023-02-22 09:26:45	\N
1523	2688	57	2023-02-22 09:26:45	\N
1524	2689	57	2023-02-22 09:26:45	\N
1525	2690	57	2023-02-22 09:26:45	\N
1526	2691	57	2023-02-22 09:26:45	\N
1527	2692	57	2023-02-22 09:26:45	\N
1528	2693	57	2023-02-22 09:26:45	\N
1529	2694	57	2023-02-22 09:26:45	\N
1530	2695	57	2023-02-22 09:26:45	\N
1531	2696	57	2023-02-22 09:26:45	\N
1532	2697	57	2023-02-22 09:26:45	\N
1533	2698	57	2023-02-22 09:26:45	\N
1534	2699	57	2023-02-22 09:26:45	\N
1535	2700	57	2023-02-22 09:26:45	\N
1536	2701	57	2023-02-22 09:26:45	\N
1537	2702	57	2023-02-22 09:26:45	\N
1538	2703	57	2023-02-22 09:26:45	\N
1539	2704	57	2023-02-22 09:26:45	\N
1540	2705	57	2023-02-22 09:26:45	\N
1541	2706	57	2023-02-22 09:26:45	\N
1542	2707	57	2023-02-22 09:26:45	\N
1543	2708	57	2023-02-22 09:26:45	\N
1544	2709	57	2023-02-22 09:26:45	\N
1545	2710	57	2023-02-22 09:26:45	\N
1546	2711	57	2023-02-22 09:26:45	\N
1547	2712	57	2023-02-22 09:26:45	\N
1548	2713	57	2023-02-22 09:26:45	\N
1549	2714	57	2023-02-22 09:26:45	\N
1550	2715	57	2023-02-22 09:26:45	\N
1551	2716	57	2023-02-22 09:26:45	\N
1552	2717	57	2023-02-22 09:26:45	\N
1553	2718	57	2023-02-22 09:26:45	\N
1554	2719	57	2023-02-22 09:26:45	\N
1555	2720	57	2023-02-22 09:26:45	\N
1556	2721	57	2023-02-22 09:26:45	\N
1557	2722	57	2023-02-22 09:26:45	\N
1558	2723	57	2023-02-22 09:26:45	\N
1559	2724	57	2023-02-22 09:26:45	\N
1560	2725	57	2023-02-22 09:26:45	\N
1561	2726	57	2023-02-22 09:26:45	\N
1562	2727	57	2023-02-22 09:26:45	\N
1563	2728	57	2023-02-22 09:26:45	\N
1564	2729	57	2023-02-22 09:26:45	\N
1565	2730	57	2023-02-22 09:26:45	\N
1566	2731	57	2023-02-22 09:26:45	\N
1567	2732	57	2023-02-22 09:26:45	\N
1568	2733	57	2023-02-22 09:26:45	\N
1569	2734	57	2023-02-22 09:26:45	\N
1570	2735	57	2023-02-22 09:26:45	\N
1571	2736	57	2023-02-22 09:26:45	\N
1572	2737	57	2023-02-22 09:26:45	\N
1573	2738	57	2023-02-22 09:26:45	\N
1574	2739	57	2023-02-22 09:26:45	\N
1575	2740	57	2023-02-22 09:26:45	\N
1576	2741	57	2023-02-22 09:26:45	\N
1577	2742	57	2023-02-22 09:26:45	\N
1578	2743	57	2023-02-22 09:26:45	\N
1579	2744	57	2023-02-22 09:26:45	\N
1580	2745	57	2023-02-22 09:26:45	\N
1581	2746	57	2023-02-22 09:26:45	\N
1582	2747	57	2023-02-22 09:26:45	\N
1583	2748	57	2023-02-22 09:26:45	\N
1584	2749	57	2023-02-22 09:26:45	\N
1585	2750	57	2023-02-22 09:26:45	\N
1586	2751	57	2023-02-22 09:26:45	\N
1587	2752	57	2023-02-22 09:26:45	\N
1588	2753	57	2023-02-22 09:26:45	\N
1589	2754	57	2023-02-22 09:26:45	\N
1590	2755	57	2023-02-22 09:26:45	\N
1591	2756	57	2023-02-22 09:26:45	\N
1592	2757	57	2023-02-22 09:26:45	\N
1593	2758	57	2023-02-22 09:26:45	\N
1594	2759	57	2023-02-22 09:26:45	\N
1595	2760	57	2023-02-22 09:26:45	\N
1596	2761	57	2023-02-22 09:26:45	\N
1597	2762	57	2023-02-22 09:26:45	\N
1598	2763	57	2023-02-22 09:26:45	\N
1599	2764	57	2023-02-22 09:26:45	\N
1600	2765	57	2023-02-22 09:26:45	\N
1601	2766	57	2023-02-22 09:26:45	\N
1602	2767	57	2023-02-22 09:26:45	\N
1603	2768	57	2023-02-22 09:26:45	\N
1604	2769	57	2023-02-22 09:26:45	\N
1605	2770	57	2023-02-22 09:26:45	\N
1606	2771	57	2023-02-22 09:26:45	\N
1607	2772	57	2023-02-22 09:26:45	\N
1608	2773	57	2023-02-22 09:26:45	\N
1609	2774	57	2023-02-22 09:26:45	\N
1610	2775	57	2023-02-22 09:26:45	\N
1611	2776	57	2023-02-22 09:26:45	\N
1612	2777	57	2023-02-22 09:26:45	\N
1613	2778	57	2023-02-22 09:26:45	\N
1614	2779	57	2023-02-22 09:26:45	\N
1615	2780	57	2023-02-22 09:26:45	\N
1616	2781	57	2023-02-22 09:26:45	\N
1617	2782	57	2023-02-22 09:26:45	\N
1618	2783	57	2023-02-22 09:26:45	\N
1619	2784	57	2023-02-22 09:26:45	\N
1620	2785	57	2023-02-22 09:26:45	\N
1621	2786	57	2023-02-22 09:26:45	\N
1622	2787	57	2023-02-22 09:26:45	\N
1623	2788	57	2023-02-22 09:26:45	\N
1624	2789	57	2023-02-22 09:26:45	\N
1625	2790	57	2023-02-22 09:26:45	\N
1626	2791	57	2023-02-22 09:26:45	\N
1627	2600	58	2023-02-22 09:27:47	\N
1628	2601	58	2023-02-22 09:27:47	\N
1629	2602	58	2023-02-22 09:27:47	\N
1630	2603	58	2023-02-22 09:27:47	\N
1631	2604	58	2023-02-22 09:27:47	\N
1632	2605	58	2023-02-22 09:27:47	\N
1633	2606	58	2023-02-22 09:27:47	\N
1634	2607	58	2023-02-22 09:27:47	\N
1635	2608	58	2023-02-22 09:27:47	\N
1636	2609	58	2023-02-22 09:27:47	\N
1637	2610	58	2023-02-22 09:27:47	\N
1638	2611	58	2023-02-22 09:27:47	\N
1639	2612	58	2023-02-22 09:27:47	\N
1640	2613	58	2023-02-22 09:27:47	\N
1641	2614	58	2023-02-22 09:27:47	\N
1642	2615	58	2023-02-22 09:27:47	\N
1643	2616	58	2023-02-22 09:27:47	\N
1644	2617	58	2023-02-22 09:27:47	\N
1645	2618	58	2023-02-22 09:27:47	\N
1646	2619	58	2023-02-22 09:27:47	\N
1647	2620	58	2023-02-22 09:27:47	\N
1648	2621	58	2023-02-22 09:27:47	\N
1649	2622	58	2023-02-22 09:27:47	\N
1650	2623	58	2023-02-22 09:27:47	\N
1651	2624	58	2023-02-22 09:27:47	\N
1652	2625	58	2023-02-22 09:27:47	\N
1653	2626	58	2023-02-22 09:27:47	\N
1654	2627	58	2023-02-22 09:27:47	\N
1655	2628	58	2023-02-22 09:27:47	\N
1656	2629	58	2023-02-22 09:27:47	\N
1657	2630	58	2023-02-22 09:27:47	\N
1658	2631	58	2023-02-22 09:27:47	\N
1659	2632	58	2023-02-22 09:27:47	\N
1660	2633	58	2023-02-22 09:27:47	\N
1661	2634	58	2023-02-22 09:27:47	\N
1662	2635	58	2023-02-22 09:27:47	\N
1663	2636	58	2023-02-22 09:27:47	\N
1664	2637	58	2023-02-22 09:27:47	\N
1665	2638	58	2023-02-22 09:27:47	\N
1666	2639	58	2023-02-22 09:27:47	\N
1667	2640	58	2023-02-22 09:27:47	\N
1668	2641	58	2023-02-22 09:27:47	\N
1669	2642	58	2023-02-22 09:27:47	\N
1670	2643	58	2023-02-22 09:27:47	\N
1671	2644	58	2023-02-22 09:27:47	\N
1672	2645	58	2023-02-22 09:27:47	\N
1673	2646	58	2023-02-22 09:27:47	\N
1674	2647	58	2023-02-22 09:27:47	\N
1675	2648	58	2023-02-22 09:27:47	\N
1676	2649	58	2023-02-22 09:27:47	\N
1677	2650	58	2023-02-22 09:27:47	\N
1678	2651	58	2023-02-22 09:27:47	\N
1679	2652	58	2023-02-22 09:27:47	\N
1680	2653	58	2023-02-22 09:27:47	\N
1681	2654	58	2023-02-22 09:27:47	\N
1682	2655	58	2023-02-22 09:27:47	\N
1683	2656	58	2023-02-22 09:27:47	\N
1684	2657	58	2023-02-22 09:27:47	\N
1685	2658	58	2023-02-22 09:27:47	\N
1686	2659	58	2023-02-22 09:27:47	\N
1687	2660	58	2023-02-22 09:27:47	\N
1688	2661	58	2023-02-22 09:27:47	\N
1689	2662	58	2023-02-22 09:27:47	\N
1690	2663	58	2023-02-22 09:27:47	\N
1691	2664	58	2023-02-22 09:27:47	\N
1692	2665	58	2023-02-22 09:27:47	\N
1693	2666	58	2023-02-22 09:27:47	\N
1694	2667	58	2023-02-22 09:27:47	\N
1695	2668	58	2023-02-22 09:27:47	\N
1696	2669	58	2023-02-22 09:27:47	\N
1697	2670	58	2023-02-22 09:27:47	\N
1698	2671	58	2023-02-22 09:27:47	\N
1699	2672	58	2023-02-22 09:27:47	\N
1700	2673	58	2023-02-22 09:27:47	\N
1701	2530	59	2023-02-22 09:28:20	\N
1702	2531	59	2023-02-22 09:28:20	\N
1703	2532	59	2023-02-22 09:28:20	\N
1704	2533	59	2023-02-22 09:28:20	\N
1705	2534	59	2023-02-22 09:28:20	\N
1706	2535	59	2023-02-22 09:28:20	\N
1707	2536	59	2023-02-22 09:28:20	\N
1708	2537	59	2023-02-22 09:28:20	\N
1709	2538	59	2023-02-22 09:28:20	\N
1710	2539	59	2023-02-22 09:28:20	\N
1711	2540	59	2023-02-22 09:28:20	\N
1712	2541	59	2023-02-22 09:28:20	\N
1713	2542	59	2023-02-22 09:28:20	\N
1714	2543	59	2023-02-22 09:28:20	\N
1715	2544	59	2023-02-22 09:28:20	\N
1716	2545	59	2023-02-22 09:28:20	\N
1717	2546	59	2023-02-22 09:28:20	\N
1718	2547	59	2023-02-22 09:28:20	\N
1719	2548	59	2023-02-22 09:28:20	\N
1720	2549	59	2023-02-22 09:28:20	\N
1721	2550	59	2023-02-22 09:28:20	\N
1722	2551	59	2023-02-22 09:28:20	\N
1723	2552	59	2023-02-22 09:28:20	\N
1724	2553	59	2023-02-22 09:28:20	\N
1725	2554	59	2023-02-22 09:28:20	\N
1726	2555	59	2023-02-22 09:28:20	\N
1727	2556	59	2023-02-22 09:28:20	\N
1728	2557	59	2023-02-22 09:28:20	\N
1729	2558	59	2023-02-22 09:28:20	\N
1730	2559	59	2023-02-22 09:28:20	\N
1731	2560	59	2023-02-22 09:28:20	\N
1732	2561	59	2023-02-22 09:28:20	\N
1733	2562	59	2023-02-22 09:28:20	\N
1734	2563	59	2023-02-22 09:28:20	\N
1735	2564	59	2023-02-22 09:28:20	\N
1736	2565	59	2023-02-22 09:28:20	\N
1737	2566	59	2023-02-22 09:28:20	\N
1738	2567	59	2023-02-22 09:28:20	\N
1739	2568	59	2023-02-22 09:28:20	\N
1740	2569	59	2023-02-22 09:28:20	\N
1741	2570	59	2023-02-22 09:28:20	\N
1742	2571	59	2023-02-22 09:28:20	\N
1743	2572	59	2023-02-22 09:28:20	\N
1744	2573	59	2023-02-22 09:28:20	\N
1745	2574	59	2023-02-22 09:28:20	\N
1746	2575	59	2023-02-22 09:28:20	\N
1747	2576	59	2023-02-22 09:28:20	\N
1748	2577	59	2023-02-22 09:28:20	\N
1749	2578	59	2023-02-22 09:28:20	\N
1750	2579	59	2023-02-22 09:28:20	\N
1751	2580	59	2023-02-22 09:28:20	\N
1752	2581	59	2023-02-22 09:28:20	\N
1753	2582	59	2023-02-22 09:28:20	\N
1754	2583	59	2023-02-22 09:28:20	\N
1755	2584	59	2023-02-22 09:28:20	\N
1756	2585	59	2023-02-22 09:28:20	\N
1757	2586	59	2023-02-22 09:28:20	\N
1758	2587	59	2023-02-22 09:28:20	\N
1759	2588	59	2023-02-22 09:28:20	\N
1760	2589	59	2023-02-22 09:28:20	\N
1761	2590	59	2023-02-22 09:28:20	\N
1762	2591	59	2023-02-22 09:28:20	\N
1763	2592	59	2023-02-22 09:28:20	\N
1764	2593	59	2023-02-22 09:28:20	\N
1765	2594	59	2023-02-22 09:28:20	\N
1766	2595	59	2023-02-22 09:28:20	\N
1767	2596	59	2023-02-22 09:28:20	\N
1768	2597	59	2023-02-22 09:28:20	\N
1769	2598	59	2023-02-22 09:28:20	\N
1770	2599	59	2023-02-22 09:28:20	\N
1771	2366	60	2023-02-22 09:30:02	\N
1772	2367	60	2023-02-22 09:30:02	\N
1773	2368	60	2023-02-22 09:30:02	\N
1774	2369	60	2023-02-22 09:30:02	\N
1775	2370	60	2023-02-22 09:30:02	\N
1776	2371	60	2023-02-22 09:30:02	\N
1777	2372	60	2023-02-22 09:30:02	\N
1778	2373	60	2023-02-22 09:30:02	\N
1779	2374	60	2023-02-22 09:30:02	\N
1780	2375	60	2023-02-22 09:30:02	\N
1781	2376	60	2023-02-22 09:30:02	\N
1782	2377	60	2023-02-22 09:30:02	\N
1783	2378	60	2023-02-22 09:30:02	\N
1784	2379	60	2023-02-22 09:30:02	\N
1785	2380	60	2023-02-22 09:30:02	\N
1786	2381	60	2023-02-22 09:30:02	\N
1787	2382	60	2023-02-22 09:30:02	\N
1788	2383	60	2023-02-22 09:30:02	\N
1789	2384	60	2023-02-22 09:30:02	\N
1790	2385	60	2023-02-22 09:30:02	\N
1791	2386	60	2023-02-22 09:30:02	\N
1792	2387	60	2023-02-22 09:30:02	\N
1793	2388	60	2023-02-22 09:30:02	\N
1794	2389	60	2023-02-22 09:30:02	\N
1795	2390	60	2023-02-22 09:30:02	\N
1796	3451	61	2023-02-22 09:31:57	\N
1797	3452	61	2023-02-22 09:31:57	\N
1798	3453	61	2023-02-22 09:31:57	\N
1799	3454	61	2023-02-22 09:31:57	\N
1800	3455	61	2023-02-22 09:31:57	\N
1801	3456	61	2023-02-22 09:31:57	\N
1802	3457	61	2023-02-22 09:31:57	\N
1803	3458	61	2023-02-22 09:31:57	\N
1804	3459	61	2023-02-22 09:31:57	\N
1805	3460	61	2023-02-22 09:31:57	\N
1806	3461	61	2023-02-22 09:31:57	\N
1807	3462	61	2023-02-22 09:31:57	\N
1808	3463	61	2023-02-22 09:31:57	\N
1809	3464	61	2023-02-22 09:31:57	\N
1810	3465	61	2023-02-22 09:31:57	\N
1811	3466	61	2023-02-22 09:31:57	\N
1812	3467	61	2023-02-22 09:31:57	\N
1813	3468	61	2023-02-22 09:31:57	\N
1814	3469	61	2023-02-22 09:31:57	\N
1815	3470	61	2023-02-22 09:31:57	\N
1816	3471	61	2023-02-22 09:31:57	\N
1817	3472	61	2023-02-22 09:31:57	\N
1818	3473	61	2023-02-22 09:31:57	\N
1819	3474	61	2023-02-22 09:31:57	\N
1820	3475	61	2023-02-22 09:31:57	\N
1821	3476	61	2023-02-22 09:31:57	\N
1822	3477	61	2023-02-22 09:31:57	\N
1823	3478	61	2023-02-22 09:31:57	\N
1824	3479	61	2023-02-22 09:31:57	\N
1825	3480	61	2023-02-22 09:31:57	\N
1826	2213	62	2023-02-22 09:33:50	\N
1827	2214	62	2023-02-22 09:33:50	\N
1828	2215	62	2023-02-22 09:33:50	\N
1829	2216	62	2023-02-22 09:33:50	\N
1830	2217	62	2023-02-22 09:33:50	\N
1831	2218	62	2023-02-22 09:33:50	\N
1832	2219	62	2023-02-22 09:33:50	\N
1833	2220	62	2023-02-22 09:33:50	\N
1834	2221	62	2023-02-22 09:33:50	\N
1835	2222	62	2023-02-22 09:33:50	\N
1836	2223	62	2023-02-22 09:33:50	\N
1837	2224	62	2023-02-22 09:33:50	\N
1838	2225	62	2023-02-22 09:33:50	\N
1839	2226	62	2023-02-22 09:33:50	\N
1840	2227	62	2023-02-22 09:33:50	\N
1841	2228	62	2023-02-22 09:33:50	\N
1842	2229	62	2023-02-22 09:33:50	\N
1843	2230	62	2023-02-22 09:33:50	\N
1844	2231	62	2023-02-22 09:33:50	\N
1845	2232	62	2023-02-22 09:33:50	\N
1846	2233	62	2023-02-22 09:33:50	\N
1847	2234	62	2023-02-22 09:33:50	\N
1848	2235	62	2023-02-22 09:33:50	\N
1849	2236	62	2023-02-22 09:33:50	\N
1850	2237	62	2023-02-22 09:33:50	\N
1851	2238	62	2023-02-22 09:33:50	\N
1852	2239	62	2023-02-22 09:33:50	\N
1853	2240	62	2023-02-22 09:33:50	\N
1854	2241	62	2023-02-22 09:33:50	\N
1855	2242	62	2023-02-22 09:33:50	\N
1856	2243	62	2023-02-22 09:33:50	\N
1857	2244	62	2023-02-22 09:33:50	\N
1858	2245	62	2023-02-22 09:33:50	\N
1859	2246	62	2023-02-22 09:33:50	\N
1860	2247	62	2023-02-22 09:33:50	\N
1861	2248	62	2023-02-22 09:33:50	\N
1862	2249	62	2023-02-22 09:33:50	\N
1863	2250	62	2023-02-22 09:33:50	\N
1864	2251	62	2023-02-22 09:33:50	\N
1865	2252	62	2023-02-22 09:33:50	\N
1866	2253	62	2023-02-22 09:33:50	\N
1867	2254	62	2023-02-22 09:33:50	\N
1868	2255	62	2023-02-22 09:33:50	\N
1869	2256	62	2023-02-22 09:33:50	\N
1870	2257	62	2023-02-22 09:33:50	\N
1871	2258	62	2023-02-22 09:33:50	\N
1872	2259	62	2023-02-22 09:33:50	\N
1873	2260	62	2023-02-22 09:33:50	\N
1874	2261	62	2023-02-22 09:33:50	\N
1875	2262	62	2023-02-22 09:33:50	\N
1876	2263	62	2023-02-22 09:33:50	\N
1877	2264	62	2023-02-22 09:33:50	\N
1878	3481	63	2023-02-22 09:34:30	\N
1879	3482	63	2023-02-22 09:34:30	\N
1880	3483	63	2023-02-22 09:34:30	\N
1881	3484	63	2023-02-22 09:34:30	\N
1882	3485	63	2023-02-22 09:34:30	\N
1883	3486	63	2023-02-22 09:34:30	\N
1884	3487	63	2023-02-22 09:34:30	\N
1885	3488	63	2023-02-22 09:34:30	\N
1886	3489	63	2023-02-22 09:34:30	\N
1887	3490	63	2023-02-22 09:34:30	\N
1888	3491	63	2023-02-22 09:34:30	\N
1889	3492	63	2023-02-22 09:34:30	\N
1890	3493	63	2023-02-22 09:34:30	\N
1891	3494	63	2023-02-22 09:34:30	\N
1892	3495	63	2023-02-22 09:34:30	\N
1893	3496	63	2023-02-22 09:34:30	\N
1894	3497	63	2023-02-22 09:34:30	\N
1895	3498	63	2023-02-22 09:34:30	\N
1896	3499	63	2023-02-22 09:34:30	\N
1897	3500	63	2023-02-22 09:34:30	\N
1898	3501	63	2023-02-22 09:34:30	\N
1899	3502	63	2023-02-22 09:34:30	\N
1900	2265	64	2023-02-22 09:35:53	\N
1901	2266	64	2023-02-22 09:35:53	\N
1902	2267	64	2023-02-22 09:35:53	\N
1903	2268	64	2023-02-22 09:35:53	\N
1904	2269	64	2023-02-22 09:35:53	\N
1905	2270	64	2023-02-22 09:35:53	\N
1906	2271	64	2023-02-22 09:35:53	\N
1907	2272	64	2023-02-22 09:35:53	\N
1908	2273	64	2023-02-22 09:35:53	\N
1909	2274	64	2023-02-22 09:35:53	\N
1910	2408	65	2023-02-22 09:41:12	\N
1911	2409	65	2023-02-22 09:41:12	\N
1912	2410	65	2023-02-22 09:41:12	\N
1913	2411	65	2023-02-22 09:41:12	\N
1914	2412	65	2023-02-22 09:41:12	\N
1915	2413	65	2023-02-22 09:41:12	\N
1916	2414	65	2023-02-22 09:41:12	\N
1917	2415	65	2023-02-22 09:41:12	\N
1918	2416	65	2023-02-22 09:41:12	\N
1919	2417	65	2023-02-22 09:41:12	\N
1920	2418	65	2023-02-22 09:41:12	\N
1921	2419	65	2023-02-22 09:41:12	\N
1922	2420	65	2023-02-22 09:41:12	\N
1923	2421	65	2023-02-22 09:41:12	\N
1924	2422	65	2023-02-22 09:41:12	\N
1925	2423	65	2023-02-22 09:41:12	\N
1926	2424	65	2023-02-22 09:41:12	\N
1927	2425	65	2023-02-22 09:41:12	\N
1928	2426	65	2023-02-22 09:41:12	\N
1929	2427	65	2023-02-22 09:41:12	\N
1930	2428	65	2023-02-22 09:41:12	\N
1931	2429	65	2023-02-22 09:41:12	\N
1932	2430	65	2023-02-22 09:41:12	\N
1933	2431	65	2023-02-22 09:41:12	\N
1934	2432	65	2023-02-22 09:41:12	\N
1935	2433	65	2023-02-22 09:41:12	\N
1936	2434	65	2023-02-22 09:41:12	\N
1937	2435	65	2023-02-22 09:41:12	\N
1938	2436	65	2023-02-22 09:41:12	\N
1939	2437	65	2023-02-22 09:41:12	\N
1940	2438	65	2023-02-22 09:41:12	\N
1941	2439	65	2023-02-22 09:41:12	\N
1942	2440	65	2023-02-22 09:41:12	\N
1943	2441	65	2023-02-22 09:41:12	\N
1944	2442	65	2023-02-22 09:41:12	\N
1945	2443	65	2023-02-22 09:41:12	\N
1946	2444	65	2023-02-22 09:41:12	\N
1947	2445	65	2023-02-22 09:41:12	\N
1948	2446	65	2023-02-22 09:41:12	\N
1949	2447	65	2023-02-22 09:41:12	\N
1950	2448	65	2023-02-22 09:41:12	\N
1951	2449	65	2023-02-22 09:41:12	\N
1952	2450	65	2023-02-22 09:41:12	\N
1953	2451	65	2023-02-22 09:41:12	\N
1954	2452	65	2023-02-22 09:41:12	\N
1955	2453	65	2023-02-22 09:41:12	\N
1956	2454	65	2023-02-22 09:41:12	\N
1957	2455	65	2023-02-22 09:41:12	\N
1958	2456	65	2023-02-22 09:41:12	\N
1959	2457	65	2023-02-22 09:41:12	\N
1960	2458	65	2023-02-22 09:41:12	\N
1961	2459	65	2023-02-22 09:41:12	\N
1962	2460	65	2023-02-22 09:41:12	\N
1963	2461	65	2023-02-22 09:41:12	\N
1964	2462	65	2023-02-22 09:41:12	\N
1965	2463	65	2023-02-22 09:41:12	\N
1966	2464	65	2023-02-22 09:41:12	\N
1967	2465	65	2023-02-22 09:41:12	\N
1968	2466	65	2023-02-22 09:41:12	\N
1969	2467	65	2023-02-22 09:41:12	\N
1970	2468	65	2023-02-22 09:41:12	\N
1971	2469	65	2023-02-22 09:41:12	\N
1972	2470	65	2023-02-22 09:41:12	\N
1973	2471	65	2023-02-22 09:41:12	\N
1974	2472	65	2023-02-22 09:41:12	\N
1975	2473	65	2023-02-22 09:41:12	\N
1976	2474	65	2023-02-22 09:41:12	\N
1977	2475	65	2023-02-22 09:41:12	\N
1978	2476	65	2023-02-22 09:41:12	\N
1979	2477	65	2023-02-22 09:41:12	\N
1980	2478	65	2023-02-22 09:41:12	\N
1981	2479	65	2023-02-22 09:41:12	\N
1982	2480	65	2023-02-22 09:41:12	\N
1983	2481	65	2023-02-22 09:41:12	\N
1984	2482	65	2023-02-22 09:41:12	\N
1985	2483	65	2023-02-22 09:41:12	\N
1986	2484	65	2023-02-22 09:41:12	\N
1987	2485	65	2023-02-22 09:41:12	\N
1988	2486	65	2023-02-22 09:41:12	\N
1989	2487	65	2023-02-22 09:41:12	\N
1990	2488	65	2023-02-22 09:41:12	\N
1991	2489	65	2023-02-22 09:41:12	\N
1992	2490	65	2023-02-22 09:41:12	\N
1993	2491	65	2023-02-22 09:41:12	\N
1994	2492	65	2023-02-22 09:41:12	\N
1995	2493	65	2023-02-22 09:41:12	\N
1996	2494	65	2023-02-22 09:41:12	\N
1997	2495	65	2023-02-22 09:41:12	\N
1998	2496	65	2023-02-22 09:41:12	\N
1999	2497	65	2023-02-22 09:41:12	\N
2000	2498	65	2023-02-22 09:41:12	\N
2001	2499	65	2023-02-22 09:41:12	\N
2002	2500	65	2023-02-22 09:41:12	\N
2003	2501	65	2023-02-22 09:41:12	\N
2004	2502	65	2023-02-22 09:41:12	\N
2005	2503	65	2023-02-22 09:41:12	\N
2006	2504	65	2023-02-22 09:41:12	\N
2007	2505	65	2023-02-22 09:41:12	\N
2008	2506	65	2023-02-22 09:41:12	\N
2009	2507	65	2023-02-22 09:41:12	\N
2010	2508	65	2023-02-22 09:41:12	\N
2011	2509	65	2023-02-22 09:41:12	\N
2012	2510	65	2023-02-22 09:41:12	\N
2013	2511	65	2023-02-22 09:41:12	\N
2014	2512	65	2023-02-22 09:41:12	\N
2015	2513	65	2023-02-22 09:41:12	\N
2016	2514	65	2023-02-22 09:41:12	\N
2017	2515	65	2023-02-22 09:41:12	\N
2018	2516	65	2023-02-22 09:41:12	\N
2019	2517	65	2023-02-22 09:41:12	\N
2020	2518	65	2023-02-22 09:41:12	\N
2021	2519	65	2023-02-22 09:41:12	\N
2022	2520	65	2023-02-22 09:41:12	\N
2023	2521	65	2023-02-22 09:41:12	\N
2024	2522	65	2023-02-22 09:41:12	\N
2025	2523	65	2023-02-22 09:41:12	\N
2026	2524	65	2023-02-22 09:41:12	\N
2027	2525	65	2023-02-22 09:41:12	\N
2028	2526	65	2023-02-22 09:41:12	\N
2029	2527	65	2023-02-22 09:41:12	\N
2030	2528	65	2023-02-22 09:41:12	\N
2031	2529	65	2023-02-22 09:41:12	\N
2032	3745	66	2023-02-22 09:41:58	\N
2033	3746	66	2023-02-22 09:41:58	\N
2034	3747	66	2023-02-22 09:41:58	\N
2035	3748	66	2023-02-22 09:41:58	\N
2036	3749	66	2023-02-22 09:41:58	\N
2037	3750	66	2023-02-22 09:41:58	\N
2038	3751	66	2023-02-22 09:41:58	\N
2039	3752	66	2023-02-22 09:41:58	\N
2040	3753	66	2023-02-22 09:41:58	\N
2041	3754	66	2023-02-22 09:41:58	\N
2042	3755	66	2023-02-22 09:41:58	\N
2043	3756	66	2023-02-22 09:41:58	\N
2044	3757	66	2023-02-22 09:41:58	\N
2045	3758	66	2023-02-22 09:41:58	\N
2046	3759	66	2023-02-22 09:41:58	\N
2047	3760	66	2023-02-22 09:41:58	\N
2048	3761	66	2023-02-22 09:41:58	\N
2049	3762	66	2023-02-22 09:41:58	\N
2050	3763	66	2023-02-22 09:41:58	\N
2051	3764	66	2023-02-22 09:41:58	\N
2052	3765	66	2023-02-22 09:41:58	\N
2053	3766	66	2023-02-22 09:41:58	\N
2054	3767	66	2023-02-22 09:41:58	\N
2055	3768	66	2023-02-22 09:41:58	\N
2056	3769	66	2023-02-22 09:41:58	\N
2057	3770	66	2023-02-22 09:41:58	\N
2058	3771	66	2023-02-22 09:41:58	\N
2059	3772	66	2023-02-22 09:41:58	\N
2060	3773	66	2023-02-22 09:41:58	\N
2061	3774	66	2023-02-22 09:41:58	\N
2062	3775	66	2023-02-22 09:41:58	\N
2063	3776	66	2023-02-22 09:41:58	\N
2064	3777	66	2023-02-22 09:41:58	\N
2065	3778	66	2023-02-22 09:41:58	\N
2066	3779	66	2023-02-22 09:41:58	\N
2067	3780	66	2023-02-22 09:41:58	\N
2068	3781	66	2023-02-22 09:41:58	\N
2069	3782	66	2023-02-22 09:41:58	\N
2070	3783	66	2023-02-22 09:41:58	\N
2071	3784	66	2023-02-22 09:41:58	\N
2072	3785	66	2023-02-22 09:41:58	\N
2073	3786	66	2023-02-22 09:41:58	\N
2074	3787	66	2023-02-22 09:41:58	\N
2075	3788	66	2023-02-22 09:41:58	\N
2076	3789	66	2023-02-22 09:41:58	\N
2077	3790	66	2023-02-22 09:41:58	\N
2078	3791	66	2023-02-22 09:41:58	\N
2079	3792	66	2023-02-22 09:41:58	\N
2080	3793	66	2023-02-22 09:41:58	\N
2081	3794	66	2023-02-22 09:41:58	\N
2082	3795	66	2023-02-22 09:41:58	\N
2083	3796	66	2023-02-22 09:41:58	\N
2084	3797	66	2023-02-22 09:41:58	\N
2085	3798	66	2023-02-22 09:41:58	\N
2086	3799	66	2023-02-22 09:41:58	\N
2087	3800	66	2023-02-22 09:41:58	\N
2088	3801	66	2023-02-22 09:41:58	\N
2089	3802	66	2023-02-22 09:41:58	\N
2090	3803	66	2023-02-22 09:41:58	\N
2091	3804	66	2023-02-22 09:41:58	\N
2092	3805	66	2023-02-22 09:41:58	\N
2093	3806	66	2023-02-22 09:41:58	\N
2094	3807	66	2023-02-22 09:41:58	\N
2095	3808	66	2023-02-22 09:41:58	\N
2096	3809	66	2023-02-22 09:41:58	\N
2097	3810	66	2023-02-22 09:41:58	\N
2098	3811	66	2023-02-22 09:41:58	\N
2099	3812	66	2023-02-22 09:41:58	\N
2100	3813	66	2023-02-22 09:41:58	\N
2101	3814	66	2023-02-22 09:41:58	\N
2102	3815	66	2023-02-22 09:41:58	\N
2103	3816	66	2023-02-22 09:41:58	\N
2104	2853	67	2023-02-22 09:43:17	\N
2105	2854	67	2023-02-22 09:43:17	\N
2106	2855	67	2023-02-22 09:43:17	\N
2107	2856	67	2023-02-22 09:43:17	\N
2108	2857	67	2023-02-22 09:43:17	\N
2109	2858	67	2023-02-22 09:43:17	\N
2110	2859	67	2023-02-22 09:43:17	\N
2111	2860	67	2023-02-22 09:43:17	\N
2112	2861	67	2023-02-22 09:43:17	\N
2113	2862	67	2023-02-22 09:43:17	\N
2114	2863	67	2023-02-22 09:43:17	\N
2115	2864	67	2023-02-22 09:43:17	\N
2116	2865	67	2023-02-22 09:43:17	\N
2117	2866	67	2023-02-22 09:43:17	\N
2118	2867	67	2023-02-22 09:43:17	\N
2119	2868	67	2023-02-22 09:43:17	\N
2120	2869	67	2023-02-22 09:43:17	\N
2121	2870	67	2023-02-22 09:43:17	\N
2122	2871	67	2023-02-22 09:43:17	\N
2123	2872	67	2023-02-22 09:43:17	\N
2124	2873	67	2023-02-22 09:43:17	\N
2125	2874	67	2023-02-22 09:43:17	\N
2126	2875	67	2023-02-22 09:43:17	\N
2127	2876	67	2023-02-22 09:43:17	\N
2128	2877	67	2023-02-22 09:43:17	\N
2129	2878	67	2023-02-22 09:43:17	\N
2130	2879	67	2023-02-22 09:43:17	\N
2131	2880	67	2023-02-22 09:43:17	\N
2132	2881	67	2023-02-22 09:43:17	\N
2133	2882	67	2023-02-22 09:43:17	\N
2134	2883	67	2023-02-22 09:43:17	\N
2135	2884	67	2023-02-22 09:43:17	\N
2136	2885	67	2023-02-22 09:43:17	\N
2137	2886	67	2023-02-22 09:43:17	\N
2138	2887	67	2023-02-22 09:43:17	\N
2139	2888	67	2023-02-22 09:43:17	\N
2140	2889	67	2023-02-22 09:43:17	\N
2141	2890	67	2023-02-22 09:43:17	\N
2142	2891	67	2023-02-22 09:43:17	\N
2143	2892	67	2023-02-22 09:43:17	\N
2144	2893	67	2023-02-22 09:43:17	\N
2145	2894	67	2023-02-22 09:43:17	\N
2146	2895	67	2023-02-22 09:43:17	\N
2147	2896	67	2023-02-22 09:43:17	\N
2148	2897	67	2023-02-22 09:43:17	\N
2149	2898	67	2023-02-22 09:43:17	\N
2150	2899	67	2023-02-22 09:43:17	\N
2151	2900	67	2023-02-22 09:43:17	\N
2152	2901	67	2023-02-22 09:43:17	\N
2153	2902	67	2023-02-22 09:43:17	\N
2154	2903	67	2023-02-22 09:43:17	\N
2155	2904	67	2023-02-22 09:43:17	\N
2156	2905	67	2023-02-22 09:43:17	\N
2157	2906	67	2023-02-22 09:43:17	\N
2158	2907	67	2023-02-22 09:43:17	\N
2159	4275	68	2023-02-22 09:45:16	\N
2160	4276	68	2023-02-22 09:45:16	\N
2161	4277	68	2023-02-22 09:45:16	\N
2162	4278	68	2023-02-22 09:45:16	\N
2163	4279	68	2023-02-22 09:45:16	\N
2164	4280	68	2023-02-22 09:45:16	\N
2165	4281	68	2023-02-22 09:45:16	\N
2166	4282	68	2023-02-22 09:45:16	\N
2167	4283	68	2023-02-22 09:45:16	\N
2168	4284	68	2023-02-22 09:45:16	\N
2169	4285	68	2023-02-22 09:45:16	\N
2170	4286	68	2023-02-22 09:45:16	\N
2171	4287	68	2023-02-22 09:45:16	\N
2172	4288	68	2023-02-22 09:45:16	\N
2173	4289	68	2023-02-22 09:45:16	\N
2174	4290	68	2023-02-22 09:45:16	\N
2175	4291	68	2023-02-22 09:45:16	\N
2176	4292	68	2023-02-22 09:45:16	\N
2177	4293	68	2023-02-22 09:45:16	\N
2178	4294	68	2023-02-22 09:45:16	\N
2179	4295	68	2023-02-22 09:45:16	\N
2180	4296	68	2023-02-22 09:45:16	\N
2181	4297	68	2023-02-22 09:45:16	\N
2182	4298	68	2023-02-22 09:45:16	\N
2183	4299	68	2023-02-22 09:45:16	\N
2184	4300	68	2023-02-22 09:45:16	\N
2185	4301	68	2023-02-22 09:45:16	\N
2186	4302	68	2023-02-22 09:45:16	\N
2187	4303	68	2023-02-22 09:45:16	\N
2188	4304	68	2023-02-22 09:45:16	\N
2189	4305	68	2023-02-22 09:45:16	\N
2190	4306	68	2023-02-22 09:45:16	\N
2191	4307	68	2023-02-22 09:45:16	\N
2192	4308	68	2023-02-22 09:45:16	\N
2193	4309	68	2023-02-22 09:45:16	\N
2194	4310	68	2023-02-22 09:45:16	\N
2195	4311	68	2023-02-22 09:45:16	\N
2196	4312	68	2023-02-22 09:45:16	\N
2197	4313	68	2023-02-22 09:45:16	\N
2198	4314	68	2023-02-22 09:45:16	\N
2199	4315	68	2023-02-22 09:45:16	\N
2200	4316	68	2023-02-22 09:45:16	\N
2201	4317	68	2023-02-22 09:45:16	\N
2202	4318	68	2023-02-22 09:45:16	\N
2203	4319	68	2023-02-22 09:45:16	\N
2204	4320	68	2023-02-22 09:45:16	\N
2205	4321	68	2023-02-22 09:45:16	\N
2206	4322	68	2023-02-22 09:45:16	\N
2207	4323	68	2023-02-22 09:45:16	\N
2208	4324	68	2023-02-22 09:45:16	\N
2209	4325	68	2023-02-22 09:45:16	\N
2210	4326	68	2023-02-22 09:45:16	\N
2211	4327	68	2023-02-22 09:45:16	\N
2212	4328	68	2023-02-22 09:45:16	\N
2213	4329	68	2023-02-22 09:45:16	\N
2214	4330	68	2023-02-22 09:45:16	\N
2215	4331	68	2023-02-22 09:45:16	\N
2216	4332	68	2023-02-22 09:45:16	\N
2217	4333	68	2023-02-22 09:45:16	\N
2218	4334	68	2023-02-22 09:45:16	\N
2219	4335	68	2023-02-22 09:45:16	\N
2220	4336	68	2023-02-22 09:45:16	\N
2221	4337	68	2023-02-22 09:45:16	\N
2222	4338	68	2023-02-22 09:45:16	\N
2223	4339	68	2023-02-22 09:45:16	\N
2224	4340	68	2023-02-22 09:45:16	\N
2225	4341	68	2023-02-22 09:45:16	\N
2226	4342	68	2023-02-22 09:45:16	\N
2227	4343	68	2023-02-22 09:45:16	\N
2228	4344	68	2023-02-22 09:45:16	\N
2229	4345	68	2023-02-22 09:45:16	\N
2230	4346	68	2023-02-22 09:45:16	\N
2231	4347	68	2023-02-22 09:45:16	\N
2232	4348	68	2023-02-22 09:45:16	\N
2233	4349	68	2023-02-22 09:45:16	\N
2234	4350	68	2023-02-22 09:45:16	\N
2235	4351	68	2023-02-22 09:45:16	\N
2236	4352	68	2023-02-22 09:45:16	\N
2237	4353	68	2023-02-22 09:45:16	\N
2238	4354	68	2023-02-22 09:45:16	\N
2239	4355	68	2023-02-22 09:45:16	\N
2240	4356	68	2023-02-22 09:45:16	\N
2241	4357	68	2023-02-22 09:45:16	\N
2242	4358	68	2023-02-22 09:45:16	\N
2243	4359	68	2023-02-22 09:45:16	\N
2244	4360	68	2023-02-22 09:45:16	\N
2245	4361	68	2023-02-22 09:45:16	\N
2246	4362	68	2023-02-22 09:45:16	\N
2247	4363	68	2023-02-22 09:45:16	\N
2248	4364	68	2023-02-22 09:45:16	\N
2249	4365	68	2023-02-22 09:45:16	\N
2250	4366	68	2023-02-22 09:45:16	\N
2251	4367	68	2023-02-22 09:45:16	\N
2252	4368	68	2023-02-22 09:45:16	\N
2253	4369	68	2023-02-22 09:45:16	\N
2254	4370	68	2023-02-22 09:45:16	\N
2255	4371	68	2023-02-22 09:45:16	\N
2256	4372	68	2023-02-22 09:45:16	\N
2257	4373	68	2023-02-22 09:45:16	\N
2258	4374	68	2023-02-22 09:45:16	\N
2259	4375	68	2023-02-22 09:45:16	\N
2260	4376	68	2023-02-22 09:45:16	\N
2261	4377	68	2023-02-22 09:45:16	\N
2262	4378	68	2023-02-22 09:45:16	\N
2263	4379	68	2023-02-22 09:45:16	\N
2264	4380	68	2023-02-22 09:45:16	\N
2265	4381	68	2023-02-22 09:45:16	\N
2266	4382	68	2023-02-22 09:45:16	\N
2267	4383	68	2023-02-22 09:45:16	\N
2268	4384	68	2023-02-22 09:45:16	\N
2269	4385	68	2023-02-22 09:45:16	\N
2270	4386	68	2023-02-22 09:45:16	\N
2271	4387	68	2023-02-22 09:45:16	\N
2272	4388	68	2023-02-22 09:45:16	\N
2273	4389	68	2023-02-22 09:45:16	\N
2274	4390	68	2023-02-22 09:45:16	\N
2275	4391	68	2023-02-22 09:45:16	\N
2276	4392	68	2023-02-22 09:45:16	\N
2277	4393	68	2023-02-22 09:45:16	\N
2278	4394	68	2023-02-22 09:45:16	\N
2279	4395	68	2023-02-22 09:45:16	\N
2280	4396	68	2023-02-22 09:45:16	\N
2281	4397	68	2023-02-22 09:45:16	\N
2282	4398	68	2023-02-22 09:45:16	\N
2283	4399	68	2023-02-22 09:45:16	\N
2284	4400	68	2023-02-22 09:45:16	\N
2285	4401	68	2023-02-22 09:45:16	\N
2286	4402	68	2023-02-22 09:45:16	\N
2287	4403	68	2023-02-22 09:45:16	\N
2288	4404	68	2023-02-22 09:45:16	\N
2289	4405	68	2023-02-22 09:45:16	\N
2290	4406	68	2023-02-22 09:45:16	\N
2291	4407	68	2023-02-22 09:45:16	\N
2292	4408	68	2023-02-22 09:45:16	\N
2293	4409	68	2023-02-22 09:45:16	\N
2294	4410	68	2023-02-22 09:45:16	\N
2295	4411	68	2023-02-22 09:45:16	\N
2296	4412	68	2023-02-22 09:45:16	\N
2297	4413	68	2023-02-22 09:45:16	\N
2298	4414	68	2023-02-22 09:45:16	\N
2299	4415	68	2023-02-22 09:45:16	\N
2300	4416	68	2023-02-22 09:45:16	\N
2301	4417	68	2023-02-22 09:45:16	\N
2302	4418	68	2023-02-22 09:45:16	\N
2303	4419	68	2023-02-22 09:45:16	\N
2304	4420	68	2023-02-22 09:45:16	\N
2305	4421	68	2023-02-22 09:45:16	\N
2306	4422	68	2023-02-22 09:45:16	\N
2307	4423	68	2023-02-22 09:45:16	\N
2308	2275	69	2023-02-22 09:47:22	\N
2309	2276	69	2023-02-22 09:47:22	\N
2310	2277	69	2023-02-22 09:47:22	\N
2311	2278	69	2023-02-22 09:47:22	\N
2312	2279	69	2023-02-22 09:47:22	\N
2313	2280	69	2023-02-22 09:47:22	\N
2314	2281	69	2023-02-22 09:47:22	\N
2315	2282	69	2023-02-22 09:47:22	\N
2316	2283	69	2023-02-22 09:47:22	\N
2317	2284	69	2023-02-22 09:47:22	\N
2318	2285	69	2023-02-22 09:47:22	\N
2319	2286	69	2023-02-22 09:47:22	\N
2320	2287	69	2023-02-22 09:47:22	\N
2321	2288	69	2023-02-22 09:47:22	\N
2322	2289	69	2023-02-22 09:47:22	\N
2323	2290	69	2023-02-22 09:47:22	\N
2324	2291	69	2023-02-22 09:47:22	\N
2325	2292	69	2023-02-22 09:47:22	\N
2326	2293	69	2023-02-22 09:47:22	\N
2327	2294	69	2023-02-22 09:47:22	\N
2328	2295	69	2023-02-22 09:47:22	\N
2329	2296	69	2023-02-22 09:47:22	\N
2330	2297	69	2023-02-22 09:47:22	\N
2331	2298	69	2023-02-22 09:47:22	\N
2332	2299	69	2023-02-22 09:47:22	\N
2333	2300	69	2023-02-22 09:47:22	\N
2334	2301	69	2023-02-22 09:47:22	\N
2335	2302	69	2023-02-22 09:47:22	\N
2336	2303	69	2023-02-22 09:47:22	\N
2337	2304	69	2023-02-22 09:47:22	\N
2338	2305	69	2023-02-22 09:47:22	\N
2339	2306	69	2023-02-22 09:47:22	\N
2340	2307	69	2023-02-22 09:47:22	\N
2341	2308	69	2023-02-22 09:47:22	\N
2342	2309	69	2023-02-22 09:47:22	\N
2343	2310	69	2023-02-22 09:47:22	\N
2344	2311	69	2023-02-22 09:47:22	\N
2345	2312	69	2023-02-22 09:47:22	\N
2346	2313	69	2023-02-22 09:47:22	\N
2347	2314	69	2023-02-22 09:47:22	\N
2348	2315	69	2023-02-22 09:47:22	\N
2349	2316	69	2023-02-22 09:47:22	\N
2350	2317	69	2023-02-22 09:47:22	\N
2351	2318	69	2023-02-22 09:47:22	\N
2352	2319	69	2023-02-22 09:47:22	\N
2353	2320	69	2023-02-22 09:47:22	\N
2354	2321	69	2023-02-22 09:47:22	\N
2355	2322	69	2023-02-22 09:47:22	\N
2356	2323	69	2023-02-22 09:47:22	\N
2357	2324	69	2023-02-22 09:47:22	\N
2358	2325	69	2023-02-22 09:47:22	\N
2359	2326	69	2023-02-22 09:47:23	\N
2360	2327	69	2023-02-22 09:47:23	\N
2361	2328	69	2023-02-22 09:47:23	\N
2362	2329	69	2023-02-22 09:47:23	\N
2363	2330	69	2023-02-22 09:47:23	\N
2364	2331	69	2023-02-22 09:47:23	\N
2365	2332	69	2023-02-22 09:47:23	\N
2366	2333	69	2023-02-22 09:47:23	\N
2367	2334	69	2023-02-22 09:47:23	\N
2368	2335	69	2023-02-22 09:47:23	\N
2369	2336	69	2023-02-22 09:47:23	\N
2370	2337	69	2023-02-22 09:47:23	\N
2371	2338	69	2023-02-22 09:47:23	\N
2372	2339	69	2023-02-22 09:47:23	\N
2373	2340	69	2023-02-22 09:47:23	\N
2374	2341	69	2023-02-22 09:47:23	\N
2375	2342	69	2023-02-22 09:47:23	\N
2376	2343	69	2023-02-22 09:47:23	\N
2377	2344	69	2023-02-22 09:47:23	\N
2378	2345	69	2023-02-22 09:47:23	\N
2379	2346	69	2023-02-22 09:47:23	\N
2380	2347	69	2023-02-22 09:47:23	\N
2381	2348	69	2023-02-22 09:47:23	\N
2382	2349	69	2023-02-22 09:47:23	\N
2383	2350	69	2023-02-22 09:47:23	\N
2384	2351	69	2023-02-22 09:47:23	\N
2385	2352	69	2023-02-22 09:47:23	\N
2386	2353	69	2023-02-22 09:47:23	\N
2387	2354	69	2023-02-22 09:47:23	\N
2388	2355	69	2023-02-22 09:47:23	\N
2389	2356	69	2023-02-22 09:47:23	\N
2390	2357	69	2023-02-22 09:47:23	\N
2391	2358	69	2023-02-22 09:47:23	\N
2392	2359	69	2023-02-22 09:47:23	\N
2393	2360	69	2023-02-22 09:47:23	\N
2394	2361	69	2023-02-22 09:47:23	\N
2395	2362	69	2023-02-22 09:47:23	\N
2396	2363	69	2023-02-22 09:47:23	\N
2397	2364	69	2023-02-22 09:47:23	\N
2398	2365	69	2023-02-22 09:47:23	\N
2399	3908	70	2023-02-22 09:48:35	\N
2400	3909	70	2023-02-22 09:48:35	\N
2401	3910	70	2023-02-22 09:48:35	\N
2402	3911	70	2023-02-22 09:48:35	\N
2403	3912	70	2023-02-22 09:48:35	\N
2404	3913	70	2023-02-22 09:48:35	\N
2405	3914	70	2023-02-22 09:48:35	\N
2406	3915	70	2023-02-22 09:48:35	\N
2407	3916	70	2023-02-22 09:48:35	\N
2408	3917	70	2023-02-22 09:48:35	\N
2409	3918	70	2023-02-22 09:48:35	\N
2410	3919	70	2023-02-22 09:48:35	\N
2411	3920	70	2023-02-22 09:48:35	\N
2412	3921	70	2023-02-22 09:48:35	\N
2413	3922	70	2023-02-22 09:48:35	\N
2414	3923	70	2023-02-22 09:48:35	\N
2415	3924	70	2023-02-22 09:48:35	\N
2416	3925	70	2023-02-22 09:48:35	\N
2417	3926	70	2023-02-22 09:48:35	\N
2418	3927	70	2023-02-22 09:48:35	\N
2419	3928	70	2023-02-22 09:48:35	\N
2420	3929	70	2023-02-22 09:48:35	\N
2421	3930	70	2023-02-22 09:48:35	\N
2422	3931	70	2023-02-22 09:48:35	\N
2423	3932	70	2023-02-22 09:48:35	\N
2424	3933	70	2023-02-22 09:48:35	\N
2425	3934	70	2023-02-22 09:48:35	\N
2426	3935	70	2023-02-22 09:48:35	\N
2427	3936	70	2023-02-22 09:48:35	\N
2428	3937	70	2023-02-22 09:48:35	\N
2429	3938	70	2023-02-22 09:48:35	\N
2430	3939	70	2023-02-22 09:48:35	\N
2431	3940	70	2023-02-22 09:48:35	\N
2432	3941	70	2023-02-22 09:48:35	\N
2433	3942	70	2023-02-22 09:48:35	\N
2434	3943	70	2023-02-22 09:48:35	\N
2435	3944	70	2023-02-22 09:48:35	\N
2436	3945	70	2023-02-22 09:48:35	\N
2437	3946	70	2023-02-22 09:48:35	\N
2438	3947	70	2023-02-22 09:48:35	\N
2439	3948	70	2023-02-22 09:48:35	\N
2440	3557	71	2023-02-22 09:50:52	\N
2441	3558	71	2023-02-22 09:50:52	\N
2442	3559	71	2023-02-22 09:50:52	\N
2443	3560	71	2023-02-22 09:50:52	\N
2444	3561	71	2023-02-22 09:50:52	\N
2445	3562	71	2023-02-22 09:50:52	\N
2446	3563	71	2023-02-22 09:50:52	\N
2447	3564	71	2023-02-22 09:50:52	\N
2448	3565	71	2023-02-22 09:50:52	\N
2449	3566	71	2023-02-22 09:50:52	\N
2450	3567	71	2023-02-22 09:50:52	\N
2451	3568	71	2023-02-22 09:50:52	\N
2452	3569	71	2023-02-22 09:50:52	\N
2453	3570	71	2023-02-22 09:50:52	\N
2454	3571	71	2023-02-22 09:50:52	\N
2455	3572	71	2023-02-22 09:50:52	\N
2456	3573	71	2023-02-22 09:50:52	\N
2457	3574	71	2023-02-22 09:50:52	\N
2458	3575	71	2023-02-22 09:50:52	\N
2459	3576	71	2023-02-22 09:50:52	\N
2460	3577	71	2023-02-22 09:50:52	\N
2461	3578	71	2023-02-22 09:50:52	\N
2462	3579	71	2023-02-22 09:50:52	\N
2463	3580	71	2023-02-22 09:50:52	\N
2464	3581	71	2023-02-22 09:50:52	\N
2465	3582	71	2023-02-22 09:50:52	\N
2466	3583	71	2023-02-22 09:50:52	\N
2467	3584	71	2023-02-22 09:50:52	\N
2468	3585	71	2023-02-22 09:50:52	\N
2469	3586	71	2023-02-22 09:50:52	\N
2470	3587	71	2023-02-22 09:50:52	\N
2471	3588	71	2023-02-22 09:50:52	\N
2472	3589	71	2023-02-22 09:50:52	\N
2473	3590	71	2023-02-22 09:50:52	\N
2474	3591	71	2023-02-22 09:50:52	\N
2475	3592	71	2023-02-22 09:50:52	\N
2476	3593	71	2023-02-22 09:50:52	\N
2477	3594	71	2023-02-22 09:50:52	\N
2478	3595	71	2023-02-22 09:50:52	\N
2479	3596	71	2023-02-22 09:50:52	\N
2480	3597	71	2023-02-22 09:50:52	\N
2481	3598	71	2023-02-22 09:50:52	\N
2482	3599	71	2023-02-22 09:50:52	\N
2483	3600	71	2023-02-22 09:50:52	\N
2484	3601	71	2023-02-22 09:50:52	\N
2485	3602	71	2023-02-22 09:50:52	\N
2486	3603	71	2023-02-22 09:50:52	\N
2487	3604	71	2023-02-22 09:50:52	\N
2488	3605	71	2023-02-22 09:50:52	\N
2489	3606	71	2023-02-22 09:50:52	\N
2490	3607	71	2023-02-22 09:50:52	\N
2491	3608	71	2023-02-22 09:50:52	\N
2492	3609	71	2023-02-22 09:50:52	\N
2493	3610	71	2023-02-22 09:50:52	\N
2494	3611	71	2023-02-22 09:50:52	\N
2495	3883	72	2023-02-22 09:51:32	\N
2496	3884	72	2023-02-22 09:51:32	\N
2497	3885	72	2023-02-22 09:51:32	\N
2498	3886	72	2023-02-22 09:51:32	\N
2499	3887	72	2023-02-22 09:51:32	\N
2500	3888	72	2023-02-22 09:51:32	\N
2501	3889	72	2023-02-22 09:51:32	\N
2502	3890	72	2023-02-22 09:51:32	\N
2503	3891	72	2023-02-22 09:51:32	\N
2504	3892	72	2023-02-22 09:51:32	\N
2505	3893	72	2023-02-22 09:51:32	\N
2506	3894	72	2023-02-22 09:51:32	\N
2507	3895	72	2023-02-22 09:51:32	\N
2508	3896	72	2023-02-22 09:51:32	\N
2509	3897	72	2023-02-22 09:51:32	\N
2510	3898	72	2023-02-22 09:51:32	\N
2511	3899	72	2023-02-22 09:51:32	\N
2512	3900	72	2023-02-22 09:51:32	\N
2513	3901	72	2023-02-22 09:51:32	\N
2514	3902	72	2023-02-22 09:51:32	\N
2515	3903	72	2023-02-22 09:51:32	\N
2516	3904	72	2023-02-22 09:51:32	\N
2517	3905	72	2023-02-22 09:51:32	\N
2518	3906	72	2023-02-22 09:51:32	\N
2519	3907	72	2023-02-22 09:51:32	\N
\.


--
-- Data for Name: map_boq_je; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.map_boq_je (id, boq_id, je_id, created_at, updated_at) FROM stdin;
17	4	17	2023-02-05 08:19:24	\N
18	5	18	2023-02-05 08:19:24	\N
19	6	19	2023-02-05 08:19:24	\N
20	7	20	2023-02-05 08:19:24	\N
21	8	21	2023-02-05 08:19:24	\N
22	9	22	2023-02-05 08:19:24	\N
23	10	23	2023-02-05 08:19:24	\N
24	11	24	2023-02-05 08:19:24	\N
25	12	25	2023-02-05 08:19:24	\N
26	13	26	2023-02-05 08:19:24	\N
27	14	27	2023-02-05 08:19:24	\N
28	15	28	2023-02-05 08:19:24	\N
29	16	29	2023-02-05 08:19:24	\N
30	17	30	2023-02-05 09:24:25	\N
31	18	31	2023-02-05 09:24:25	\N
32	19	32	2023-02-05 09:24:25	\N
33	20	33	2023-02-05 09:24:25	\N
34	21	34	2023-02-05 09:24:25	\N
35	22	35	2023-02-05 09:24:25	\N
36	23	36	2023-02-05 09:24:25	\N
37	24	37	2023-02-05 09:24:25	\N
38	25	38	2023-02-05 09:24:25	\N
39	26	39	2023-02-05 09:24:25	\N
40	27	40	2023-02-05 09:24:25	\N
41	28	41	2023-02-05 09:24:25	\N
42	29	42	2023-02-05 09:24:25	\N
43	30	43	2023-02-05 09:24:25	\N
44	31	44	2023-02-05 09:24:25	\N
45	32	45	2023-02-05 09:24:25	\N
46	33	46	2023-02-05 09:24:25	\N
47	34	47	2023-02-05 09:24:25	\N
48	35	48	2023-02-05 09:24:25	\N
49	36	49	2023-02-05 09:24:25	\N
50	37	50	2023-02-05 09:24:25	\N
51	38	51	2023-02-05 09:24:25	\N
52	39	52	2023-02-05 09:24:25	\N
53	40	53	2023-02-05 09:24:25	\N
54	41	54	2023-02-05 09:24:25	\N
55	42	55	2023-02-05 09:24:25	\N
56	43	56	2023-02-05 09:24:25	\N
57	44	57	2023-02-05 09:24:25	\N
58	45	58	2023-02-05 09:24:25	\N
59	46	59	2023-02-05 09:24:25	\N
60	47	60	2023-02-05 09:24:25	\N
61	48	61	2023-02-05 09:24:25	\N
62	49	62	2023-02-05 09:24:25	\N
63	50	63	2023-02-05 09:24:25	\N
64	51	64	2023-02-05 09:24:25	\N
75	52	75	2023-02-06 01:10:09	\N
76	53	76	2023-02-06 01:10:09	\N
77	54	77	2023-02-06 01:10:09	\N
78	55	78	2023-02-06 01:10:09	\N
79	56	79	2023-02-06 01:10:09	\N
80	57	80	2023-02-06 01:10:09	\N
81	58	81	2023-02-06 01:10:09	\N
82	59	82	2023-02-06 01:10:09	\N
83	60	83	2023-02-06 01:10:09	\N
84	61	84	2023-02-06 01:10:09	\N
85	62	85	2023-02-06 01:10:09	\N
86	63	86	2023-02-06 01:10:09	\N
87	64	87	2023-02-06 01:10:09	\N
88	65	88	2023-02-06 01:10:09	\N
89	66	89	2023-02-06 01:10:09	\N
90	67	90	2023-02-06 01:10:09	\N
91	68	91	2023-02-06 01:10:09	\N
92	69	92	2023-02-06 01:10:09	\N
93	70	93	2023-02-06 01:10:09	\N
94	71	94	2023-02-06 02:03:41	\N
95	72	95	2023-02-06 02:03:41	\N
96	73	96	2023-02-06 02:03:41	\N
97	74	97	2023-02-06 02:03:41	\N
98	75	98	2023-02-06 02:03:41	\N
99	76	99	2023-02-06 02:03:41	\N
100	77	100	2023-02-06 02:03:41	\N
101	78	101	2023-02-06 02:03:41	\N
102	79	102	2023-02-06 02:03:41	\N
103	80	103	2023-02-06 02:03:41	\N
104	81	104	2023-02-06 02:03:41	\N
105	82	105	2023-02-06 02:03:41	\N
106	83	106	2023-02-06 02:03:41	\N
107	84	107	2023-02-06 02:03:41	\N
108	85	108	2023-02-06 02:03:41	\N
109	86	109	2023-02-06 02:03:41	\N
110	87	110	2023-02-06 02:03:41	\N
111	88	111	2023-02-06 02:03:41	\N
112	89	112	2023-02-06 02:03:41	\N
113	90	113	2023-02-06 02:03:41	\N
114	91	114	2023-02-06 02:03:41	\N
115	92	115	2023-02-06 02:03:41	\N
116	93	116	2023-02-06 02:03:41	\N
117	94	117	2023-02-06 02:03:41	\N
118	95	118	2023-02-06 02:03:41	\N
119	96	119	2023-02-06 02:03:41	\N
120	97	120	2023-02-06 02:03:41	\N
121	98	121	2023-02-06 02:25:29	\N
122	99	122	2023-02-06 02:25:29	\N
123	100	123	2023-02-06 02:25:29	\N
124	101	124	2023-02-06 02:25:29	\N
125	102	125	2023-02-06 02:25:29	\N
126	103	126	2023-02-06 02:25:29	\N
127	104	127	2023-02-06 02:25:29	\N
128	105	128	2023-02-06 02:25:29	\N
129	106	129	2023-02-06 02:25:29	\N
130	107	130	2023-02-06 02:25:29	\N
131	108	131	2023-02-06 02:25:29	\N
132	109	132	2023-02-06 02:25:29	\N
133	110	133	2023-02-06 02:25:29	\N
134	111	134	2023-02-06 02:25:29	\N
135	112	135	2023-02-06 02:25:29	\N
136	113	136	2023-02-06 02:25:29	\N
137	114	137	2023-02-06 02:25:29	\N
138	115	138	2023-02-06 02:25:29	\N
139	116	139	2023-02-06 02:25:29	\N
140	117	140	2023-02-06 02:25:29	\N
141	118	141	2023-02-06 02:25:29	\N
142	119	142	2023-02-06 02:25:29	\N
143	120	143	2023-02-06 02:25:29	\N
144	121	144	2023-02-06 02:25:29	\N
145	122	145	2023-02-06 02:25:29	\N
146	123	146	2023-02-06 02:25:29	\N
147	124	147	2023-02-06 02:25:29	\N
148	125	148	2023-02-06 02:25:29	\N
149	126	149	2023-02-06 02:25:29	\N
150	127	150	2023-02-06 02:25:29	\N
151	128	151	2023-02-06 02:25:29	\N
152	129	152	2023-02-06 02:25:29	\N
153	130	153	2023-02-06 02:25:29	\N
154	131	154	2023-02-06 02:25:29	\N
155	132	155	2023-02-06 02:25:29	\N
156	133	156	2023-02-06 02:25:29	\N
157	134	157	2023-02-06 02:25:29	\N
158	135	158	2023-02-06 02:25:29	\N
159	136	159	2023-02-06 02:25:29	\N
160	137	160	2023-02-06 02:25:29	\N
161	138	161	2023-02-06 02:25:29	\N
162	139	162	2023-02-06 02:25:29	\N
163	140	163	2023-02-06 02:25:29	\N
164	141	164	2023-02-06 02:25:29	\N
165	142	165	2023-02-06 02:25:29	\N
166	143	166	2023-02-06 02:25:29	\N
167	144	167	2023-02-06 02:25:29	\N
168	145	168	2023-02-06 02:25:29	\N
169	146	169	2023-02-06 02:25:29	\N
170	147	170	2023-02-06 02:25:29	\N
171	148	171	2023-02-06 02:25:29	\N
172	149	172	2023-02-06 02:25:29	\N
174	151	174	2023-02-22 04:14:20	\N
175	152	175	2023-02-22 04:14:20	\N
176	153	176	2023-02-22 04:14:20	\N
177	154	177	2023-02-22 04:14:20	\N
178	155	178	2023-02-22 04:14:20	\N
179	156	179	2023-02-22 04:14:20	\N
180	157	180	2023-02-22 04:14:20	\N
181	158	181	2023-02-22 04:14:20	\N
182	159	182	2023-02-22 04:14:20	\N
183	160	183	2023-02-22 04:14:20	\N
184	161	184	2023-02-22 04:14:20	\N
185	162	185	2023-02-22 04:14:20	\N
186	163	186	2023-02-22 04:14:20	\N
187	164	187	2023-02-22 04:14:20	\N
188	165	188	2023-02-22 04:14:20	\N
189	166	189	2023-02-22 04:14:20	\N
190	167	190	2023-02-22 04:14:20	\N
191	168	191	2023-02-22 04:14:21	\N
192	169	192	2023-02-22 04:14:21	\N
193	170	193	2023-02-22 04:14:21	\N
194	171	194	2023-02-22 04:14:21	\N
195	172	195	2023-02-22 04:14:21	\N
196	173	196	2023-02-22 04:14:21	\N
197	174	197	2023-02-22 04:14:21	\N
198	175	198	2023-02-22 04:14:21	\N
199	176	199	2023-02-22 04:14:21	\N
200	177	200	2023-02-22 04:14:21	\N
201	178	201	2023-02-22 04:14:21	\N
202	179	202	2023-02-22 04:14:21	\N
203	180	203	2023-02-22 04:14:21	\N
204	181	204	2023-02-22 04:14:21	\N
205	182	205	2023-02-22 04:14:21	\N
206	183	206	2023-02-22 04:14:21	\N
207	184	207	2023-02-22 04:14:21	\N
208	185	208	2023-02-22 04:14:21	\N
209	186	209	2023-02-22 04:14:21	\N
210	187	210	2023-02-22 04:14:21	\N
211	188	211	2023-02-22 04:14:21	\N
212	189	212	2023-02-22 04:14:21	\N
213	190	213	2023-02-22 04:14:21	\N
214	191	214	2023-02-22 04:14:21	\N
215	192	215	2023-02-22 04:14:21	\N
216	193	216	2023-02-22 04:14:21	\N
217	194	217	2023-02-22 04:14:21	\N
218	195	218	2023-02-22 04:14:21	\N
219	196	219	2023-02-22 04:14:21	\N
220	197	220	2023-02-22 04:14:21	\N
221	198	221	2023-02-22 04:14:21	\N
222	199	222	2023-02-22 04:14:21	\N
223	200	223	2023-02-22 04:14:21	\N
224	201	224	2023-02-22 04:14:21	\N
225	202	225	2023-02-22 04:14:21	\N
226	203	226	2023-02-22 04:14:21	\N
227	204	227	2023-02-22 04:14:21	\N
228	205	228	2023-02-22 04:14:21	\N
229	206	229	2023-02-22 04:14:21	\N
230	207	230	2023-02-22 04:14:21	\N
231	208	231	2023-02-22 04:14:21	\N
232	209	232	2023-02-22 04:14:21	\N
233	210	233	2023-02-22 04:14:21	\N
234	211	234	2023-02-22 04:14:21	\N
235	212	235	2023-02-22 04:14:21	\N
236	213	236	2023-02-22 04:14:21	\N
237	214	237	2023-02-22 04:14:21	\N
238	215	238	2023-02-22 04:14:21	\N
239	216	239	2023-02-22 04:14:21	\N
240	217	240	2023-02-22 04:14:21	\N
241	218	241	2023-02-22 04:14:21	\N
242	219	242	2023-02-22 04:14:21	\N
243	221	243	2023-02-22 04:14:21	\N
244	222	244	2023-02-22 04:14:21	\N
245	223	245	2023-02-22 04:14:21	\N
246	224	246	2023-02-22 04:14:21	\N
247	225	247	2023-02-22 04:14:21	\N
248	226	248	2023-02-22 04:14:21	\N
249	227	249	2023-02-22 04:14:21	\N
250	228	250	2023-02-22 04:14:21	\N
251	229	251	2023-02-22 04:14:21	\N
252	230	252	2023-02-22 04:14:21	\N
253	231	253	2023-02-22 04:14:21	\N
254	232	254	2023-02-22 04:14:21	\N
255	233	255	2023-02-22 04:14:21	\N
256	234	256	2023-02-22 04:14:21	\N
258	2408	258	2023-02-22 13:08:31	\N
259	2409	259	2023-02-22 13:08:31	\N
260	2410	260	2023-02-22 13:08:31	\N
261	2411	261	2023-02-22 13:08:31	\N
262	2412	262	2023-02-22 13:08:31	\N
263	2413	263	2023-02-22 13:08:31	\N
264	2414	264	2023-02-22 13:08:31	\N
265	2415	265	2023-02-22 13:08:31	\N
266	2416	266	2023-02-22 13:08:31	\N
267	2417	267	2023-02-22 13:08:31	\N
268	2418	268	2023-02-22 13:08:31	\N
269	2419	269	2023-02-22 13:08:31	\N
270	2420	270	2023-02-22 13:08:31	\N
271	2421	271	2023-02-22 13:08:31	\N
272	2422	272	2023-02-22 13:08:31	\N
273	2423	273	2023-02-22 13:08:31	\N
274	2424	274	2023-02-22 13:08:31	\N
275	2425	275	2023-02-22 13:08:31	\N
276	2426	276	2023-02-22 13:08:31	\N
277	2427	277	2023-02-22 13:08:31	\N
278	2428	278	2023-02-22 13:08:31	\N
279	2429	279	2023-02-22 13:08:31	\N
280	2430	280	2023-02-22 13:08:31	\N
281	2431	281	2023-02-22 13:08:31	\N
282	2432	282	2023-02-22 13:08:31	\N
283	2433	283	2023-02-22 13:08:31	\N
284	2434	284	2023-02-22 13:08:31	\N
285	2435	285	2023-02-22 13:08:31	\N
286	2436	286	2023-02-22 13:08:31	\N
287	2437	287	2023-02-22 13:08:31	\N
288	2438	288	2023-02-22 13:08:31	\N
289	2439	289	2023-02-22 13:08:31	\N
290	2440	290	2023-02-22 13:08:31	\N
291	2441	291	2023-02-22 13:08:31	\N
292	2442	292	2023-02-22 13:08:31	\N
293	2443	293	2023-02-22 13:08:31	\N
294	2444	294	2023-02-22 13:08:31	\N
295	2445	295	2023-02-22 13:08:31	\N
296	2446	296	2023-02-22 13:08:31	\N
297	2447	297	2023-02-22 13:08:31	\N
298	2448	298	2023-02-22 13:08:31	\N
299	2449	299	2023-02-22 13:08:31	\N
300	2450	300	2023-02-22 13:08:31	\N
301	2451	301	2023-02-22 13:08:31	\N
302	2452	302	2023-02-22 13:08:31	\N
303	2453	303	2023-02-22 13:08:31	\N
304	2454	304	2023-02-22 13:08:31	\N
305	2455	305	2023-02-22 13:08:31	\N
306	2456	306	2023-02-22 13:08:31	\N
307	2457	307	2023-02-22 13:08:31	\N
308	2458	308	2023-02-22 13:08:31	\N
309	2459	309	2023-02-22 13:08:31	\N
310	2460	310	2023-02-22 13:08:31	\N
311	2461	311	2023-02-22 13:08:31	\N
312	2462	312	2023-02-22 13:08:31	\N
313	2463	313	2023-02-22 13:08:31	\N
314	2464	314	2023-02-22 13:08:31	\N
315	2465	315	2023-02-22 13:08:31	\N
316	2466	316	2023-02-22 13:08:31	\N
317	2467	317	2023-02-22 13:08:31	\N
318	2468	318	2023-02-22 13:08:31	\N
319	2469	319	2023-02-22 13:08:31	\N
320	2470	320	2023-02-22 13:08:31	\N
321	2471	321	2023-02-22 13:08:31	\N
322	2472	322	2023-02-22 13:08:31	\N
323	2473	323	2023-02-22 13:08:31	\N
324	2474	324	2023-02-22 13:08:31	\N
325	2475	325	2023-02-22 13:08:31	\N
326	2476	326	2023-02-22 13:08:31	\N
327	2477	327	2023-02-22 13:08:31	\N
328	2478	328	2023-02-22 13:08:31	\N
329	2479	329	2023-02-22 13:08:31	\N
330	2480	330	2023-02-22 13:08:31	\N
331	2481	331	2023-02-22 13:08:31	\N
332	2482	332	2023-02-22 13:08:31	\N
333	2483	333	2023-02-22 13:08:31	\N
334	2484	334	2023-02-22 13:08:31	\N
335	2485	335	2023-02-22 13:08:31	\N
336	2486	336	2023-02-22 13:08:31	\N
337	2487	337	2023-02-22 13:08:31	\N
338	2488	338	2023-02-22 13:08:31	\N
339	2489	339	2023-02-22 13:08:31	\N
340	2490	340	2023-02-22 13:08:31	\N
341	2491	341	2023-02-22 13:08:31	\N
342	2492	342	2023-02-22 13:08:31	\N
343	2493	343	2023-02-22 13:08:31	\N
344	2494	344	2023-02-22 13:08:31	\N
345	2495	345	2023-02-22 13:08:31	\N
346	2496	346	2023-02-22 13:08:31	\N
347	2497	347	2023-02-22 13:08:31	\N
348	2498	348	2023-02-22 13:08:31	\N
349	2499	349	2023-02-22 13:08:31	\N
350	2500	350	2023-02-22 13:08:31	\N
351	2501	351	2023-02-22 13:08:31	\N
352	2502	352	2023-02-22 13:08:31	\N
353	2503	353	2023-02-22 13:08:31	\N
354	2504	354	2023-02-22 13:08:31	\N
355	2505	355	2023-02-22 13:08:31	\N
356	2506	356	2023-02-22 13:08:31	\N
357	2507	357	2023-02-22 13:08:31	\N
358	2508	358	2023-02-22 13:08:31	\N
359	2509	359	2023-02-22 13:08:31	\N
360	2510	360	2023-02-22 13:08:31	\N
361	2511	361	2023-02-22 13:08:31	\N
362	2512	362	2023-02-22 13:08:31	\N
363	2513	363	2023-02-22 13:08:31	\N
364	2514	364	2023-02-22 13:08:31	\N
365	2515	365	2023-02-22 13:08:31	\N
366	2516	366	2023-02-22 13:08:31	\N
367	2517	367	2023-02-22 13:08:31	\N
368	2518	368	2023-02-22 13:08:31	\N
369	2519	369	2023-02-22 13:08:31	\N
370	2520	370	2023-02-22 13:08:31	\N
371	2521	371	2023-02-22 13:08:31	\N
372	2522	372	2023-02-22 13:08:31	\N
373	2523	373	2023-02-22 13:08:31	\N
374	2524	374	2023-02-22 13:08:31	\N
375	2525	375	2023-02-22 13:08:31	\N
376	2526	376	2023-02-22 13:08:31	\N
377	2527	377	2023-02-22 13:08:31	\N
378	2528	378	2023-02-22 13:08:31	\N
379	2529	379	2023-02-22 13:08:31	\N
380	3745	380	2023-02-22 13:08:55	\N
381	3746	381	2023-02-22 13:08:55	\N
382	3747	382	2023-02-22 13:08:55	\N
383	3748	383	2023-02-22 13:08:55	\N
384	3749	384	2023-02-22 13:08:55	\N
385	3750	385	2023-02-22 13:08:55	\N
386	3751	386	2023-02-22 13:08:55	\N
387	3752	387	2023-02-22 13:08:55	\N
388	3753	388	2023-02-22 13:08:55	\N
389	3754	389	2023-02-22 13:08:55	\N
390	3755	390	2023-02-22 13:08:55	\N
391	3756	391	2023-02-22 13:08:55	\N
392	3757	392	2023-02-22 13:08:55	\N
393	3758	393	2023-02-22 13:08:55	\N
394	3759	394	2023-02-22 13:08:55	\N
395	3760	395	2023-02-22 13:08:55	\N
396	3761	396	2023-02-22 13:08:55	\N
397	3762	397	2023-02-22 13:08:55	\N
398	3763	398	2023-02-22 13:08:55	\N
399	3764	399	2023-02-22 13:08:55	\N
400	3765	400	2023-02-22 13:08:55	\N
401	3766	401	2023-02-22 13:08:55	\N
402	3767	402	2023-02-22 13:08:55	\N
403	3768	403	2023-02-22 13:08:55	\N
404	3769	404	2023-02-22 13:08:55	\N
405	3770	405	2023-02-22 13:08:55	\N
406	3771	406	2023-02-22 13:08:55	\N
407	3772	407	2023-02-22 13:08:55	\N
408	3773	408	2023-02-22 13:08:55	\N
409	3774	409	2023-02-22 13:08:55	\N
410	3775	410	2023-02-22 13:08:55	\N
411	3776	411	2023-02-22 13:08:55	\N
412	3777	412	2023-02-22 13:08:55	\N
413	3778	413	2023-02-22 13:08:55	\N
414	3779	414	2023-02-22 13:08:55	\N
415	3780	415	2023-02-22 13:08:55	\N
416	3781	416	2023-02-22 13:08:55	\N
417	3782	417	2023-02-22 13:08:55	\N
418	3783	418	2023-02-22 13:08:55	\N
419	3784	419	2023-02-22 13:08:55	\N
420	3785	420	2023-02-22 13:08:55	\N
421	3786	421	2023-02-22 13:08:55	\N
422	3787	422	2023-02-22 13:08:55	\N
423	3788	423	2023-02-22 13:08:55	\N
424	3789	424	2023-02-22 13:08:55	\N
425	3790	425	2023-02-22 13:08:55	\N
426	3791	426	2023-02-22 13:08:55	\N
427	3792	427	2023-02-22 13:08:55	\N
428	3793	428	2023-02-22 13:08:55	\N
429	3794	429	2023-02-22 13:08:55	\N
430	3795	430	2023-02-22 13:08:55	\N
431	3796	431	2023-02-22 13:08:55	\N
432	3797	432	2023-02-22 13:08:55	\N
433	3798	433	2023-02-22 13:08:55	\N
434	3799	434	2023-02-22 13:08:55	\N
435	3800	435	2023-02-22 13:08:55	\N
436	3801	436	2023-02-22 13:08:55	\N
437	3802	437	2023-02-22 13:08:55	\N
438	3803	438	2023-02-22 13:08:55	\N
439	3804	439	2023-02-22 13:08:55	\N
440	3805	440	2023-02-22 13:08:55	\N
441	3806	441	2023-02-22 13:08:55	\N
442	3807	442	2023-02-22 13:08:55	\N
443	3808	443	2023-02-22 13:08:55	\N
444	3809	444	2023-02-22 13:08:55	\N
445	3810	445	2023-02-22 13:08:55	\N
446	3811	446	2023-02-22 13:08:55	\N
447	3812	447	2023-02-22 13:08:55	\N
448	3813	448	2023-02-22 13:08:55	\N
449	3814	449	2023-02-22 13:08:55	\N
450	3815	450	2023-02-22 13:08:55	\N
451	3816	451	2023-02-22 13:08:55	\N
452	1	452	2023-02-22 13:09:50	\N
453	2	453	2023-02-22 13:09:50	\N
454	3	454	2023-02-22 13:09:50	\N
455	2391	455	2023-02-22 13:10:31	\N
456	2392	456	2023-02-22 13:10:31	\N
457	2393	457	2023-02-22 13:10:31	\N
458	2394	458	2023-02-22 13:10:31	\N
459	2395	459	2023-02-22 13:10:31	\N
460	2396	460	2023-02-22 13:10:31	\N
461	2397	461	2023-02-22 13:10:31	\N
462	2398	462	2023-02-22 13:10:31	\N
463	2399	463	2023-02-22 13:10:31	\N
464	2400	464	2023-02-22 13:10:31	\N
465	2401	465	2023-02-22 13:10:31	\N
466	2402	466	2023-02-22 13:10:31	\N
467	2403	467	2023-02-22 13:10:31	\N
468	2404	468	2023-02-22 13:10:31	\N
469	2405	469	2023-02-22 13:10:31	\N
470	2406	470	2023-02-22 13:10:31	\N
471	2407	471	2023-02-22 13:10:31	\N
472	4424	472	2023-02-22 13:11:01	\N
473	4425	473	2023-02-22 13:11:01	\N
474	4426	474	2023-02-22 13:11:01	\N
475	4427	475	2023-02-22 13:11:01	\N
476	4428	476	2023-02-22 13:11:01	\N
477	4429	477	2023-02-22 13:11:01	\N
478	4430	478	2023-02-22 13:11:01	\N
479	4431	479	2023-02-22 13:11:01	\N
480	4432	480	2023-02-22 13:11:01	\N
481	4433	481	2023-02-22 13:11:01	\N
482	4434	482	2023-02-22 13:11:01	\N
483	4435	483	2023-02-22 13:11:01	\N
484	4436	484	2023-02-22 13:11:01	\N
485	4437	485	2023-02-22 13:11:01	\N
486	4438	486	2023-02-22 13:11:01	\N
487	4439	487	2023-02-22 13:11:01	\N
488	4440	488	2023-02-22 13:11:01	\N
489	4441	489	2023-02-22 13:11:01	\N
490	4442	490	2023-02-22 13:11:01	\N
491	4443	491	2023-02-22 13:11:01	\N
492	4444	492	2023-02-22 13:11:01	\N
493	4445	493	2023-02-22 13:11:01	\N
494	4446	494	2023-02-22 13:11:01	\N
495	4447	495	2023-02-22 13:11:01	\N
496	4448	496	2023-02-22 13:11:01	\N
497	4449	497	2023-02-22 13:11:01	\N
498	4450	498	2023-02-22 13:11:01	\N
499	4451	499	2023-02-22 13:11:01	\N
500	4452	500	2023-02-22 13:11:01	\N
501	4453	501	2023-02-22 13:11:01	\N
502	4454	502	2023-02-22 13:11:01	\N
503	4455	503	2023-02-22 13:11:01	\N
504	4456	504	2023-02-22 13:11:01	\N
505	4457	505	2023-02-22 13:11:01	\N
506	4458	506	2023-02-22 13:11:01	\N
507	4459	507	2023-02-22 13:11:01	\N
508	4460	508	2023-02-22 13:11:01	\N
509	4461	509	2023-02-22 13:11:01	\N
510	4462	510	2023-02-22 13:11:01	\N
511	4463	511	2023-02-22 13:11:01	\N
512	4464	512	2023-02-22 13:11:01	\N
513	4465	513	2023-02-22 13:11:01	\N
514	4466	514	2023-02-22 13:11:01	\N
515	4467	515	2023-02-22 13:11:01	\N
516	4468	516	2023-02-22 13:11:01	\N
517	4469	517	2023-02-22 13:11:01	\N
518	4470	518	2023-02-22 13:11:01	\N
519	4471	519	2023-02-22 13:11:01	\N
520	4472	520	2023-02-22 13:11:01	\N
521	4473	521	2023-02-22 13:11:01	\N
522	4474	522	2023-02-22 13:11:01	\N
523	4475	523	2023-02-22 13:11:01	\N
524	4476	524	2023-02-22 13:11:01	\N
525	4477	525	2023-02-22 13:11:01	\N
526	4478	526	2023-02-22 13:11:01	\N
527	4479	527	2023-02-22 13:11:01	\N
528	4480	528	2023-02-22 13:11:01	\N
529	4481	529	2023-02-22 13:11:01	\N
530	4482	530	2023-02-22 13:11:01	\N
531	4483	531	2023-02-22 13:11:01	\N
532	4484	532	2023-02-22 13:11:01	\N
533	4485	533	2023-02-22 13:11:01	\N
534	4486	534	2023-02-22 13:11:01	\N
535	4487	535	2023-02-22 13:11:01	\N
536	4488	536	2023-02-22 13:11:01	\N
537	4489	537	2023-02-22 13:11:01	\N
538	4490	538	2023-02-22 13:11:01	\N
539	4491	539	2023-02-22 13:11:01	\N
540	4492	540	2023-02-22 13:11:01	\N
541	4493	541	2023-02-22 13:11:01	\N
542	4494	542	2023-02-22 13:11:01	\N
543	4495	543	2023-02-22 13:11:01	\N
544	4496	544	2023-02-22 13:11:01	\N
545	3557	545	2023-02-22 13:11:30	\N
546	3558	546	2023-02-22 13:11:30	\N
547	3559	547	2023-02-22 13:11:30	\N
548	3560	548	2023-02-22 13:11:30	\N
549	3561	549	2023-02-22 13:11:30	\N
550	3562	550	2023-02-22 13:11:30	\N
551	3563	551	2023-02-22 13:11:30	\N
552	3564	552	2023-02-22 13:11:30	\N
553	3565	553	2023-02-22 13:11:30	\N
554	3566	554	2023-02-22 13:11:30	\N
555	3567	555	2023-02-22 13:11:30	\N
556	3568	556	2023-02-22 13:11:30	\N
557	3569	557	2023-02-22 13:11:30	\N
558	3570	558	2023-02-22 13:11:30	\N
559	3571	559	2023-02-22 13:11:30	\N
560	3572	560	2023-02-22 13:11:30	\N
561	3573	561	2023-02-22 13:11:30	\N
562	3574	562	2023-02-22 13:11:30	\N
563	3575	563	2023-02-22 13:11:30	\N
564	3576	564	2023-02-22 13:11:30	\N
565	3577	565	2023-02-22 13:11:30	\N
566	3578	566	2023-02-22 13:11:30	\N
567	3579	567	2023-02-22 13:11:30	\N
568	3580	568	2023-02-22 13:11:30	\N
569	3581	569	2023-02-22 13:11:30	\N
570	3582	570	2023-02-22 13:11:30	\N
571	3583	571	2023-02-22 13:11:30	\N
572	3584	572	2023-02-22 13:11:30	\N
573	3585	573	2023-02-22 13:11:30	\N
574	3586	574	2023-02-22 13:11:30	\N
575	3587	575	2023-02-22 13:11:30	\N
576	3588	576	2023-02-22 13:11:30	\N
577	3589	577	2023-02-22 13:11:30	\N
578	3590	578	2023-02-22 13:11:30	\N
579	3591	579	2023-02-22 13:11:30	\N
580	3592	580	2023-02-22 13:11:30	\N
581	3593	581	2023-02-22 13:11:30	\N
582	3594	582	2023-02-22 13:11:30	\N
583	3595	583	2023-02-22 13:11:30	\N
584	3596	584	2023-02-22 13:11:30	\N
585	3597	585	2023-02-22 13:11:30	\N
586	3598	586	2023-02-22 13:11:30	\N
587	3599	587	2023-02-22 13:11:30	\N
588	3600	588	2023-02-22 13:11:30	\N
589	3601	589	2023-02-22 13:11:30	\N
590	3602	590	2023-02-22 13:11:30	\N
591	3603	591	2023-02-22 13:11:30	\N
592	3604	592	2023-02-22 13:11:30	\N
593	3605	593	2023-02-22 13:11:30	\N
594	3606	594	2023-02-22 13:11:30	\N
595	3607	595	2023-02-22 13:11:30	\N
596	3608	596	2023-02-22 13:11:30	\N
597	3609	597	2023-02-22 13:11:30	\N
598	3610	598	2023-02-22 13:11:30	\N
599	3611	599	2023-02-22 13:11:30	\N
600	2674	600	2023-02-22 13:23:53	\N
601	2675	601	2023-02-22 13:23:53	\N
602	2676	602	2023-02-22 13:23:53	\N
603	2677	603	2023-02-22 13:23:53	\N
604	2678	604	2023-02-22 13:23:53	\N
605	2679	605	2023-02-22 13:23:53	\N
606	2680	606	2023-02-22 13:23:53	\N
607	2681	607	2023-02-22 13:23:53	\N
608	2682	608	2023-02-22 13:23:53	\N
609	2683	609	2023-02-22 13:23:53	\N
610	2684	610	2023-02-22 13:23:53	\N
611	2685	611	2023-02-22 13:23:53	\N
612	2686	612	2023-02-22 13:23:53	\N
613	2687	613	2023-02-22 13:23:53	\N
614	2688	614	2023-02-22 13:23:53	\N
615	2689	615	2023-02-22 13:23:53	\N
616	2690	616	2023-02-22 13:23:53	\N
617	2691	617	2023-02-22 13:23:53	\N
618	2692	618	2023-02-22 13:23:53	\N
619	2693	619	2023-02-22 13:23:53	\N
620	2694	620	2023-02-22 13:23:53	\N
621	2695	621	2023-02-22 13:23:53	\N
622	2696	622	2023-02-22 13:23:53	\N
623	2697	623	2023-02-22 13:23:53	\N
624	2698	624	2023-02-22 13:23:53	\N
625	2699	625	2023-02-22 13:23:53	\N
626	2700	626	2023-02-22 13:23:53	\N
627	2701	627	2023-02-22 13:23:53	\N
628	2702	628	2023-02-22 13:23:53	\N
629	2703	629	2023-02-22 13:23:53	\N
630	2704	630	2023-02-22 13:23:53	\N
631	2705	631	2023-02-22 13:23:53	\N
632	2706	632	2023-02-22 13:23:53	\N
633	2707	633	2023-02-22 13:23:53	\N
634	2708	634	2023-02-22 13:23:53	\N
635	2709	635	2023-02-22 13:23:53	\N
636	2710	636	2023-02-22 13:23:53	\N
637	2711	637	2023-02-22 13:23:53	\N
638	2712	638	2023-02-22 13:23:53	\N
639	2713	639	2023-02-22 13:23:53	\N
640	2714	640	2023-02-22 13:23:53	\N
641	2715	641	2023-02-22 13:23:53	\N
642	2716	642	2023-02-22 13:23:53	\N
643	2717	643	2023-02-22 13:23:53	\N
644	2718	644	2023-02-22 13:23:53	\N
645	2719	645	2023-02-22 13:23:53	\N
646	2720	646	2023-02-22 13:23:53	\N
647	2721	647	2023-02-22 13:23:53	\N
648	2722	648	2023-02-22 13:23:53	\N
649	2723	649	2023-02-22 13:23:53	\N
650	2724	650	2023-02-22 13:23:53	\N
651	2725	651	2023-02-22 13:23:53	\N
652	2726	652	2023-02-22 13:23:53	\N
653	2727	653	2023-02-22 13:23:53	\N
654	2728	654	2023-02-22 13:23:53	\N
655	2729	655	2023-02-22 13:23:53	\N
656	2730	656	2023-02-22 13:23:53	\N
657	2731	657	2023-02-22 13:23:53	\N
658	2732	658	2023-02-22 13:23:53	\N
659	2733	659	2023-02-22 13:23:53	\N
660	2734	660	2023-02-22 13:23:53	\N
661	2735	661	2023-02-22 13:23:53	\N
662	2736	662	2023-02-22 13:23:53	\N
663	2737	663	2023-02-22 13:23:53	\N
664	2738	664	2023-02-22 13:23:53	\N
665	2739	665	2023-02-22 13:23:53	\N
666	2740	666	2023-02-22 13:23:53	\N
667	2741	667	2023-02-22 13:23:53	\N
668	2742	668	2023-02-22 13:23:53	\N
669	2743	669	2023-02-22 13:23:53	\N
670	2744	670	2023-02-22 13:23:53	\N
671	2745	671	2023-02-22 13:23:53	\N
672	2746	672	2023-02-22 13:23:53	\N
673	2747	673	2023-02-22 13:23:53	\N
674	2748	674	2023-02-22 13:23:53	\N
675	2749	675	2023-02-22 13:23:53	\N
676	2750	676	2023-02-22 13:23:53	\N
677	2751	677	2023-02-22 13:23:53	\N
678	2752	678	2023-02-22 13:23:53	\N
679	2753	679	2023-02-22 13:23:53	\N
680	2754	680	2023-02-22 13:23:53	\N
681	2755	681	2023-02-22 13:23:53	\N
682	2756	682	2023-02-22 13:23:53	\N
683	2757	683	2023-02-22 13:23:53	\N
684	2758	684	2023-02-22 13:23:53	\N
685	2759	685	2023-02-22 13:23:53	\N
686	2760	686	2023-02-22 13:23:53	\N
687	2761	687	2023-02-22 13:23:53	\N
688	2762	688	2023-02-22 13:23:53	\N
689	2763	689	2023-02-22 13:23:53	\N
690	2764	690	2023-02-22 13:23:53	\N
691	2765	691	2023-02-22 13:23:53	\N
692	2766	692	2023-02-22 13:23:53	\N
693	2767	693	2023-02-22 13:23:53	\N
694	2768	694	2023-02-22 13:23:53	\N
695	2769	695	2023-02-22 13:23:53	\N
696	2770	696	2023-02-22 13:23:53	\N
697	2771	697	2023-02-22 13:23:53	\N
698	2772	698	2023-02-22 13:23:53	\N
699	2773	699	2023-02-22 13:23:53	\N
700	2774	700	2023-02-22 13:23:53	\N
701	2775	701	2023-02-22 13:23:53	\N
702	2776	702	2023-02-22 13:23:53	\N
703	2777	703	2023-02-22 13:23:53	\N
704	2778	704	2023-02-22 13:23:53	\N
705	2779	705	2023-02-22 13:23:53	\N
706	2780	706	2023-02-22 13:23:53	\N
707	2781	707	2023-02-22 13:23:53	\N
708	2782	708	2023-02-22 13:23:53	\N
709	2783	709	2023-02-22 13:23:53	\N
710	2784	710	2023-02-22 13:23:53	\N
711	2785	711	2023-02-22 13:23:53	\N
712	2786	712	2023-02-22 13:23:53	\N
713	2787	713	2023-02-22 13:23:53	\N
714	2788	714	2023-02-22 13:23:53	\N
715	2789	715	2023-02-22 13:23:53	\N
716	2790	716	2023-02-22 13:23:53	\N
717	2791	717	2023-02-22 13:23:53	\N
718	2530	718	2023-02-22 13:24:30	\N
719	2531	719	2023-02-22 13:24:30	\N
720	2532	720	2023-02-22 13:24:30	\N
721	2533	721	2023-02-22 13:24:30	\N
722	2534	722	2023-02-22 13:24:30	\N
723	2535	723	2023-02-22 13:24:30	\N
724	2536	724	2023-02-22 13:24:30	\N
725	2537	725	2023-02-22 13:24:30	\N
726	2538	726	2023-02-22 13:24:30	\N
727	2539	727	2023-02-22 13:24:30	\N
728	2540	728	2023-02-22 13:24:30	\N
729	2541	729	2023-02-22 13:24:30	\N
730	2542	730	2023-02-22 13:24:31	\N
731	2543	731	2023-02-22 13:24:31	\N
732	2544	732	2023-02-22 13:24:31	\N
733	2545	733	2023-02-22 13:24:31	\N
734	2546	734	2023-02-22 13:24:31	\N
735	2547	735	2023-02-22 13:24:31	\N
736	2548	736	2023-02-22 13:24:31	\N
737	2549	737	2023-02-22 13:24:31	\N
738	2550	738	2023-02-22 13:24:31	\N
739	2551	739	2023-02-22 13:24:31	\N
740	2552	740	2023-02-22 13:24:31	\N
741	2553	741	2023-02-22 13:24:31	\N
742	2554	742	2023-02-22 13:24:31	\N
743	2555	743	2023-02-22 13:24:31	\N
744	2556	744	2023-02-22 13:24:31	\N
745	2557	745	2023-02-22 13:24:31	\N
746	2558	746	2023-02-22 13:24:31	\N
747	2559	747	2023-02-22 13:24:31	\N
748	2560	748	2023-02-22 13:24:31	\N
749	2561	749	2023-02-22 13:24:31	\N
750	2562	750	2023-02-22 13:24:31	\N
751	2563	751	2023-02-22 13:24:31	\N
752	2564	752	2023-02-22 13:24:31	\N
753	2565	753	2023-02-22 13:24:31	\N
754	2566	754	2023-02-22 13:24:31	\N
755	2567	755	2023-02-22 13:24:31	\N
756	2568	756	2023-02-22 13:24:31	\N
757	2569	757	2023-02-22 13:24:31	\N
758	2570	758	2023-02-22 13:24:31	\N
759	2571	759	2023-02-22 13:24:31	\N
760	2572	760	2023-02-22 13:24:31	\N
761	2573	761	2023-02-22 13:24:31	\N
762	2574	762	2023-02-22 13:24:31	\N
763	2575	763	2023-02-22 13:24:31	\N
764	2576	764	2023-02-22 13:24:31	\N
765	2577	765	2023-02-22 13:24:31	\N
766	2578	766	2023-02-22 13:24:31	\N
767	2579	767	2023-02-22 13:24:31	\N
768	2580	768	2023-02-22 13:24:31	\N
769	2581	769	2023-02-22 13:24:31	\N
770	2582	770	2023-02-22 13:24:31	\N
771	2583	771	2023-02-22 13:24:31	\N
772	2584	772	2023-02-22 13:24:31	\N
773	2585	773	2023-02-22 13:24:31	\N
774	2586	774	2023-02-22 13:24:31	\N
775	2587	775	2023-02-22 13:24:31	\N
776	2588	776	2023-02-22 13:24:31	\N
777	2589	777	2023-02-22 13:24:31	\N
778	2590	778	2023-02-22 13:24:31	\N
779	2591	779	2023-02-22 13:24:31	\N
780	2592	780	2023-02-22 13:24:31	\N
781	2593	781	2023-02-22 13:24:31	\N
782	2594	782	2023-02-22 13:24:31	\N
783	2595	783	2023-02-22 13:24:31	\N
784	2596	784	2023-02-22 13:24:31	\N
785	2597	785	2023-02-22 13:24:31	\N
786	2598	786	2023-02-22 13:24:31	\N
787	2599	787	2023-02-22 13:24:31	\N
788	2600	788	2023-02-22 13:25:03	\N
789	2601	789	2023-02-22 13:25:03	\N
790	2602	790	2023-02-22 13:25:03	\N
791	2603	791	2023-02-22 13:25:03	\N
792	2604	792	2023-02-22 13:25:03	\N
793	2605	793	2023-02-22 13:25:03	\N
794	2606	794	2023-02-22 13:25:03	\N
795	2607	795	2023-02-22 13:25:03	\N
796	2608	796	2023-02-22 13:25:03	\N
797	2609	797	2023-02-22 13:25:04	\N
798	2610	798	2023-02-22 13:25:04	\N
799	2611	799	2023-02-22 13:25:04	\N
800	2612	800	2023-02-22 13:25:04	\N
801	2613	801	2023-02-22 13:25:04	\N
802	2614	802	2023-02-22 13:25:04	\N
803	2615	803	2023-02-22 13:25:04	\N
804	2616	804	2023-02-22 13:25:04	\N
805	2617	805	2023-02-22 13:25:04	\N
806	2618	806	2023-02-22 13:25:04	\N
807	2619	807	2023-02-22 13:25:04	\N
808	2620	808	2023-02-22 13:25:04	\N
809	2621	809	2023-02-22 13:25:04	\N
810	2622	810	2023-02-22 13:25:04	\N
811	2623	811	2023-02-22 13:25:04	\N
812	2624	812	2023-02-22 13:25:04	\N
813	2625	813	2023-02-22 13:25:04	\N
814	2626	814	2023-02-22 13:25:04	\N
815	2627	815	2023-02-22 13:25:04	\N
816	2628	816	2023-02-22 13:25:04	\N
817	2629	817	2023-02-22 13:25:04	\N
818	2630	818	2023-02-22 13:25:04	\N
819	2631	819	2023-02-22 13:25:04	\N
820	2632	820	2023-02-22 13:25:04	\N
821	2633	821	2023-02-22 13:25:04	\N
822	2634	822	2023-02-22 13:25:04	\N
823	2635	823	2023-02-22 13:25:04	\N
824	2636	824	2023-02-22 13:25:04	\N
825	2637	825	2023-02-22 13:25:04	\N
826	2638	826	2023-02-22 13:25:04	\N
827	2639	827	2023-02-22 13:25:04	\N
828	2640	828	2023-02-22 13:25:04	\N
829	2641	829	2023-02-22 13:25:04	\N
830	2642	830	2023-02-22 13:25:04	\N
831	2643	831	2023-02-22 13:25:04	\N
832	2644	832	2023-02-22 13:25:04	\N
833	2645	833	2023-02-22 13:25:04	\N
834	2646	834	2023-02-22 13:25:04	\N
835	2647	835	2023-02-22 13:25:04	\N
836	2648	836	2023-02-22 13:25:04	\N
837	2649	837	2023-02-22 13:25:04	\N
838	2650	838	2023-02-22 13:25:04	\N
839	2651	839	2023-02-22 13:25:04	\N
840	2652	840	2023-02-22 13:25:04	\N
841	2653	841	2023-02-22 13:25:04	\N
842	2654	842	2023-02-22 13:25:04	\N
843	2655	843	2023-02-22 13:25:04	\N
844	2656	844	2023-02-22 13:25:04	\N
845	2657	845	2023-02-22 13:25:04	\N
846	2658	846	2023-02-22 13:25:04	\N
847	2659	847	2023-02-22 13:25:04	\N
848	2660	848	2023-02-22 13:25:04	\N
849	2661	849	2023-02-22 13:25:04	\N
850	2662	850	2023-02-22 13:25:04	\N
851	2663	851	2023-02-22 13:25:04	\N
852	2664	852	2023-02-22 13:25:04	\N
853	2665	853	2023-02-22 13:25:04	\N
854	2666	854	2023-02-22 13:25:04	\N
855	2667	855	2023-02-22 13:25:04	\N
856	2668	856	2023-02-22 13:25:04	\N
857	2669	857	2023-02-22 13:25:04	\N
858	2670	858	2023-02-22 13:25:04	\N
859	2671	859	2023-02-22 13:25:04	\N
860	2672	860	2023-02-22 13:25:04	\N
861	2673	861	2023-02-22 13:25:04	\N
862	2600	862	2023-02-22 13:25:11	\N
863	2601	863	2023-02-22 13:25:11	\N
864	2602	864	2023-02-22 13:25:11	\N
865	2603	865	2023-02-22 13:25:11	\N
866	2604	866	2023-02-22 13:25:11	\N
867	2605	867	2023-02-22 13:25:11	\N
868	2606	868	2023-02-22 13:25:11	\N
869	2607	869	2023-02-22 13:25:11	\N
870	2608	870	2023-02-22 13:25:11	\N
871	2609	871	2023-02-22 13:25:11	\N
872	2610	872	2023-02-22 13:25:11	\N
873	2611	873	2023-02-22 13:25:11	\N
874	2612	874	2023-02-22 13:25:11	\N
875	2613	875	2023-02-22 13:25:11	\N
876	2614	876	2023-02-22 13:25:11	\N
877	2615	877	2023-02-22 13:25:11	\N
878	2616	878	2023-02-22 13:25:11	\N
879	2617	879	2023-02-22 13:25:11	\N
880	2618	880	2023-02-22 13:25:11	\N
881	2619	881	2023-02-22 13:25:11	\N
882	2620	882	2023-02-22 13:25:11	\N
883	2621	883	2023-02-22 13:25:11	\N
884	2622	884	2023-02-22 13:25:11	\N
885	2623	885	2023-02-22 13:25:11	\N
886	2624	886	2023-02-22 13:25:11	\N
887	2625	887	2023-02-22 13:25:11	\N
888	2626	888	2023-02-22 13:25:11	\N
889	2627	889	2023-02-22 13:25:11	\N
890	2628	890	2023-02-22 13:25:11	\N
891	2629	891	2023-02-22 13:25:11	\N
892	2630	892	2023-02-22 13:25:11	\N
893	2631	893	2023-02-22 13:25:11	\N
894	2632	894	2023-02-22 13:25:11	\N
895	2633	895	2023-02-22 13:25:11	\N
896	2634	896	2023-02-22 13:25:11	\N
897	2635	897	2023-02-22 13:25:11	\N
898	2636	898	2023-02-22 13:25:11	\N
899	2637	899	2023-02-22 13:25:11	\N
900	2638	900	2023-02-22 13:25:11	\N
901	2639	901	2023-02-22 13:25:11	\N
902	2640	902	2023-02-22 13:25:11	\N
903	2641	903	2023-02-22 13:25:11	\N
904	2642	904	2023-02-22 13:25:11	\N
905	2643	905	2023-02-22 13:25:11	\N
906	2644	906	2023-02-22 13:25:11	\N
907	2645	907	2023-02-22 13:25:11	\N
908	2646	908	2023-02-22 13:25:11	\N
909	2647	909	2023-02-22 13:25:11	\N
910	2648	910	2023-02-22 13:25:11	\N
911	2649	911	2023-02-22 13:25:11	\N
912	2650	912	2023-02-22 13:25:11	\N
913	2651	913	2023-02-22 13:25:11	\N
914	2652	914	2023-02-22 13:25:11	\N
915	2653	915	2023-02-22 13:25:11	\N
916	2654	916	2023-02-22 13:25:11	\N
917	2655	917	2023-02-22 13:25:11	\N
918	2656	918	2023-02-22 13:25:11	\N
919	2657	919	2023-02-22 13:25:11	\N
920	2658	920	2023-02-22 13:25:11	\N
921	2659	921	2023-02-22 13:25:11	\N
922	2660	922	2023-02-22 13:25:11	\N
923	2661	923	2023-02-22 13:25:11	\N
924	2662	924	2023-02-22 13:25:11	\N
925	2663	925	2023-02-22 13:25:11	\N
926	2664	926	2023-02-22 13:25:11	\N
927	2665	927	2023-02-22 13:25:11	\N
928	2666	928	2023-02-22 13:25:11	\N
929	2667	929	2023-02-22 13:25:11	\N
930	2668	930	2023-02-22 13:25:11	\N
931	2669	931	2023-02-22 13:25:11	\N
932	2670	932	2023-02-22 13:25:11	\N
933	2671	933	2023-02-22 13:25:11	\N
934	2672	934	2023-02-22 13:25:11	\N
935	2673	935	2023-02-22 13:25:11	\N
936	2792	936	2023-02-22 13:25:46	\N
937	2793	937	2023-02-22 13:25:46	\N
938	2794	938	2023-02-22 13:25:46	\N
939	2795	939	2023-02-22 13:25:46	\N
940	2796	940	2023-02-22 13:25:46	\N
941	2797	941	2023-02-22 13:25:46	\N
942	2798	942	2023-02-22 13:25:46	\N
943	2799	943	2023-02-22 13:25:46	\N
944	2800	944	2023-02-22 13:25:46	\N
945	2801	945	2023-02-22 13:25:46	\N
946	2802	946	2023-02-22 13:25:46	\N
947	2803	947	2023-02-22 13:25:46	\N
948	2804	948	2023-02-22 13:25:46	\N
949	2805	949	2023-02-22 13:25:46	\N
950	2806	950	2023-02-22 13:25:46	\N
951	2807	951	2023-02-22 13:25:46	\N
952	2808	952	2023-02-22 13:25:46	\N
953	2809	953	2023-02-22 13:25:46	\N
954	2810	954	2023-02-22 13:25:46	\N
955	2811	955	2023-02-22 13:25:46	\N
956	2812	956	2023-02-22 13:25:46	\N
957	2813	957	2023-02-22 13:25:46	\N
958	2814	958	2023-02-22 13:25:46	\N
959	2815	959	2023-02-22 13:25:46	\N
960	2816	960	2023-02-22 13:25:46	\N
961	2817	961	2023-02-22 13:25:46	\N
962	2818	962	2023-02-22 13:25:46	\N
963	2819	963	2023-02-22 13:26:20	\N
964	2820	964	2023-02-22 13:26:20	\N
965	2821	965	2023-02-22 13:26:20	\N
966	2822	966	2023-02-22 13:26:20	\N
967	2823	967	2023-02-22 13:26:20	\N
968	2824	968	2023-02-22 13:26:20	\N
969	2825	969	2023-02-22 13:26:20	\N
970	2826	970	2023-02-22 13:26:20	\N
971	2827	971	2023-02-22 13:26:20	\N
972	2828	972	2023-02-22 13:26:20	\N
973	2829	973	2023-02-22 13:26:20	\N
974	2830	974	2023-02-22 13:26:20	\N
975	2831	975	2023-02-22 13:26:20	\N
976	2832	976	2023-02-22 13:26:20	\N
977	2833	977	2023-02-22 13:26:20	\N
978	2834	978	2023-02-22 13:26:20	\N
979	2835	979	2023-02-22 13:26:20	\N
980	2836	980	2023-02-22 13:26:20	\N
981	2837	981	2023-02-22 13:26:20	\N
982	2838	982	2023-02-22 13:26:20	\N
983	2839	983	2023-02-22 13:26:20	\N
984	2840	984	2023-02-22 13:26:20	\N
985	2841	985	2023-02-22 13:26:20	\N
986	2842	986	2023-02-22 13:26:20	\N
987	2843	987	2023-02-22 13:26:20	\N
988	2844	988	2023-02-22 13:26:20	\N
989	2845	989	2023-02-22 13:26:20	\N
990	2846	990	2023-02-22 13:26:20	\N
991	2847	991	2023-02-22 13:26:20	\N
992	2848	992	2023-02-22 13:26:20	\N
993	2849	993	2023-02-22 13:26:20	\N
994	2850	994	2023-02-22 13:26:20	\N
995	2851	995	2023-02-22 13:26:20	\N
996	2852	996	2023-02-22 13:26:20	\N
997	4275	997	2023-02-22 13:26:57	\N
998	4276	998	2023-02-22 13:26:57	\N
999	4277	999	2023-02-22 13:26:57	\N
1000	4278	1000	2023-02-22 13:26:57	\N
1001	4279	1001	2023-02-22 13:26:57	\N
1002	4280	1002	2023-02-22 13:26:57	\N
1003	4281	1003	2023-02-22 13:26:57	\N
1004	4282	1004	2023-02-22 13:26:57	\N
1005	4283	1005	2023-02-22 13:26:57	\N
1006	4284	1006	2023-02-22 13:26:57	\N
1007	4285	1007	2023-02-22 13:26:57	\N
1008	4286	1008	2023-02-22 13:26:57	\N
1009	4287	1009	2023-02-22 13:26:57	\N
1010	4288	1010	2023-02-22 13:26:57	\N
1011	4289	1011	2023-02-22 13:26:57	\N
1012	4290	1012	2023-02-22 13:26:57	\N
1013	4291	1013	2023-02-22 13:26:57	\N
1014	4292	1014	2023-02-22 13:26:57	\N
1015	4293	1015	2023-02-22 13:26:57	\N
1016	4294	1016	2023-02-22 13:26:57	\N
1017	4295	1017	2023-02-22 13:26:57	\N
1018	4296	1018	2023-02-22 13:26:57	\N
1019	4297	1019	2023-02-22 13:26:57	\N
1020	4298	1020	2023-02-22 13:26:57	\N
1021	4299	1021	2023-02-22 13:26:57	\N
1022	4300	1022	2023-02-22 13:26:57	\N
1023	4301	1023	2023-02-22 13:26:57	\N
1024	4302	1024	2023-02-22 13:26:57	\N
1025	4303	1025	2023-02-22 13:26:57	\N
1026	4304	1026	2023-02-22 13:26:57	\N
1027	4305	1027	2023-02-22 13:26:57	\N
1028	4306	1028	2023-02-22 13:26:57	\N
1029	4307	1029	2023-02-22 13:26:57	\N
1030	4308	1030	2023-02-22 13:26:57	\N
1031	4309	1031	2023-02-22 13:26:57	\N
1032	4310	1032	2023-02-22 13:26:57	\N
1033	4311	1033	2023-02-22 13:26:57	\N
1034	4312	1034	2023-02-22 13:26:57	\N
1035	4313	1035	2023-02-22 13:26:57	\N
1036	4314	1036	2023-02-22 13:26:57	\N
1037	4315	1037	2023-02-22 13:26:57	\N
1038	4316	1038	2023-02-22 13:26:57	\N
1039	4317	1039	2023-02-22 13:26:57	\N
1040	4318	1040	2023-02-22 13:26:57	\N
1041	4319	1041	2023-02-22 13:26:57	\N
1042	4320	1042	2023-02-22 13:26:57	\N
1043	4321	1043	2023-02-22 13:26:57	\N
1044	4322	1044	2023-02-22 13:26:57	\N
1045	4323	1045	2023-02-22 13:26:57	\N
1046	4324	1046	2023-02-22 13:26:57	\N
1047	4325	1047	2023-02-22 13:26:57	\N
1048	4326	1048	2023-02-22 13:26:57	\N
1049	4327	1049	2023-02-22 13:26:57	\N
1050	4328	1050	2023-02-22 13:26:57	\N
1051	4329	1051	2023-02-22 13:26:57	\N
1052	4330	1052	2023-02-22 13:26:57	\N
1053	4331	1053	2023-02-22 13:26:57	\N
1054	4332	1054	2023-02-22 13:26:57	\N
1055	4333	1055	2023-02-22 13:26:57	\N
1056	4334	1056	2023-02-22 13:26:57	\N
1057	4335	1057	2023-02-22 13:26:57	\N
1058	4336	1058	2023-02-22 13:26:57	\N
1059	4337	1059	2023-02-22 13:26:57	\N
1060	4338	1060	2023-02-22 13:26:57	\N
1061	4339	1061	2023-02-22 13:26:57	\N
1062	4340	1062	2023-02-22 13:26:57	\N
1063	4341	1063	2023-02-22 13:26:57	\N
1064	4342	1064	2023-02-22 13:26:57	\N
1065	4343	1065	2023-02-22 13:26:57	\N
1066	4344	1066	2023-02-22 13:26:57	\N
1067	4345	1067	2023-02-22 13:26:57	\N
1068	4346	1068	2023-02-22 13:26:57	\N
1069	4347	1069	2023-02-22 13:26:57	\N
1070	4348	1070	2023-02-22 13:26:57	\N
1071	4349	1071	2023-02-22 13:26:57	\N
1072	4350	1072	2023-02-22 13:26:57	\N
1073	4351	1073	2023-02-22 13:26:57	\N
1074	4352	1074	2023-02-22 13:26:57	\N
1075	4353	1075	2023-02-22 13:26:57	\N
1076	4354	1076	2023-02-22 13:26:57	\N
1077	4355	1077	2023-02-22 13:26:57	\N
1078	4356	1078	2023-02-22 13:26:57	\N
1079	4357	1079	2023-02-22 13:26:57	\N
1080	4358	1080	2023-02-22 13:26:57	\N
1081	4359	1081	2023-02-22 13:26:57	\N
1082	4360	1082	2023-02-22 13:26:57	\N
1083	4361	1083	2023-02-22 13:26:57	\N
1084	4362	1084	2023-02-22 13:26:57	\N
1085	4363	1085	2023-02-22 13:26:57	\N
1086	4364	1086	2023-02-22 13:26:57	\N
1087	4365	1087	2023-02-22 13:26:57	\N
1088	4366	1088	2023-02-22 13:26:57	\N
1089	4367	1089	2023-02-22 13:26:57	\N
1090	4368	1090	2023-02-22 13:26:57	\N
1091	4369	1091	2023-02-22 13:26:57	\N
1092	4370	1092	2023-02-22 13:26:57	\N
1093	4371	1093	2023-02-22 13:26:57	\N
1094	4372	1094	2023-02-22 13:26:57	\N
1095	4373	1095	2023-02-22 13:26:57	\N
1096	4374	1096	2023-02-22 13:26:57	\N
1097	4375	1097	2023-02-22 13:26:57	\N
1098	4376	1098	2023-02-22 13:26:57	\N
1099	4377	1099	2023-02-22 13:26:57	\N
1100	4378	1100	2023-02-22 13:26:57	\N
1101	4379	1101	2023-02-22 13:26:57	\N
1102	4380	1102	2023-02-22 13:26:57	\N
1103	4381	1103	2023-02-22 13:26:57	\N
1104	4382	1104	2023-02-22 13:26:57	\N
1105	4383	1105	2023-02-22 13:26:57	\N
1106	4384	1106	2023-02-22 13:26:57	\N
1107	4385	1107	2023-02-22 13:26:57	\N
1108	4386	1108	2023-02-22 13:26:57	\N
1109	4387	1109	2023-02-22 13:26:57	\N
1110	4388	1110	2023-02-22 13:26:57	\N
1111	4389	1111	2023-02-22 13:26:57	\N
1112	4390	1112	2023-02-22 13:26:57	\N
1113	4391	1113	2023-02-22 13:26:57	\N
1114	4392	1114	2023-02-22 13:26:57	\N
1115	4393	1115	2023-02-22 13:26:57	\N
1116	4394	1116	2023-02-22 13:26:57	\N
1117	4395	1117	2023-02-22 13:26:57	\N
1118	4396	1118	2023-02-22 13:26:57	\N
1119	4397	1119	2023-02-22 13:26:57	\N
1120	4398	1120	2023-02-22 13:26:57	\N
1121	4399	1121	2023-02-22 13:26:57	\N
1122	4400	1122	2023-02-22 13:26:57	\N
1123	4401	1123	2023-02-22 13:26:57	\N
1124	4402	1124	2023-02-22 13:26:57	\N
1125	4403	1125	2023-02-22 13:26:57	\N
1126	4404	1126	2023-02-22 13:26:57	\N
1127	4405	1127	2023-02-22 13:26:57	\N
1128	4406	1128	2023-02-22 13:26:57	\N
1129	4407	1129	2023-02-22 13:26:57	\N
1130	4408	1130	2023-02-22 13:26:57	\N
1131	4409	1131	2023-02-22 13:26:57	\N
1132	4410	1132	2023-02-22 13:26:57	\N
1133	4411	1133	2023-02-22 13:26:57	\N
1134	4412	1134	2023-02-22 13:26:57	\N
1135	4413	1135	2023-02-22 13:26:57	\N
1136	4414	1136	2023-02-22 13:26:57	\N
1137	4415	1137	2023-02-22 13:26:57	\N
1138	4416	1138	2023-02-22 13:26:57	\N
1139	4417	1139	2023-02-22 13:26:57	\N
1140	4418	1140	2023-02-22 13:26:57	\N
1141	4419	1141	2023-02-22 13:26:57	\N
1142	4420	1142	2023-02-22 13:26:57	\N
1143	4421	1143	2023-02-22 13:26:57	\N
1144	4422	1144	2023-02-22 13:26:57	\N
1145	4423	1145	2023-02-22 13:26:57	\N
1146	3100	1146	2023-02-22 13:27:23	\N
1147	3101	1147	2023-02-22 13:27:23	\N
1148	3102	1148	2023-02-22 13:27:23	\N
1149	3103	1149	2023-02-22 13:27:23	\N
1150	3104	1150	2023-02-22 13:27:23	\N
1151	3105	1151	2023-02-22 13:27:23	\N
1152	3106	1152	2023-02-22 13:27:23	\N
1153	3107	1153	2023-02-22 13:27:23	\N
1154	3108	1154	2023-02-22 13:27:23	\N
1155	3109	1155	2023-02-22 13:27:23	\N
1156	3110	1156	2023-02-22 13:27:23	\N
1157	3111	1157	2023-02-22 13:27:23	\N
1158	3112	1158	2023-02-22 13:27:23	\N
1159	3113	1159	2023-02-22 13:27:23	\N
1160	3114	1160	2023-02-22 13:27:23	\N
1161	3115	1161	2023-02-22 13:27:23	\N
1162	3116	1162	2023-02-22 13:27:23	\N
1163	3117	1163	2023-02-22 13:27:23	\N
1164	3118	1164	2023-02-22 13:27:23	\N
1165	3119	1165	2023-02-22 13:27:23	\N
1166	3120	1166	2023-02-22 13:27:23	\N
1167	3121	1167	2023-02-22 13:27:23	\N
1168	3122	1168	2023-02-22 13:27:23	\N
1169	3123	1169	2023-02-22 13:27:23	\N
1170	3124	1170	2023-02-22 13:27:23	\N
1171	3125	1171	2023-02-22 13:27:23	\N
1172	3126	1172	2023-02-22 13:27:23	\N
1173	3127	1173	2023-02-22 13:27:23	\N
1174	3128	1174	2023-02-22 13:27:23	\N
1175	3129	1175	2023-02-22 13:27:23	\N
1176	3130	1176	2023-02-22 13:27:23	\N
1177	3131	1177	2023-02-22 13:27:23	\N
1178	3132	1178	2023-02-22 13:27:23	\N
1179	3133	1179	2023-02-22 13:27:23	\N
1180	3134	1180	2023-02-22 13:27:23	\N
1181	3135	1181	2023-02-22 13:27:23	\N
1182	3136	1182	2023-02-22 13:27:23	\N
1183	3137	1183	2023-02-22 13:27:23	\N
1184	3138	1184	2023-02-22 13:27:23	\N
1185	3139	1185	2023-02-22 13:27:23	\N
1186	3140	1186	2023-02-22 13:27:23	\N
1187	3141	1187	2023-02-22 13:27:23	\N
1188	3142	1188	2023-02-22 13:27:23	\N
1189	3143	1189	2023-02-22 13:27:23	\N
1190	3144	1190	2023-02-22 13:27:23	\N
1191	3145	1191	2023-02-22 13:27:23	\N
1192	3146	1192	2023-02-22 13:27:23	\N
1193	3147	1193	2023-02-22 13:27:23	\N
1194	3148	1194	2023-02-22 13:27:23	\N
1195	3149	1195	2023-02-22 13:27:23	\N
1196	3150	1196	2023-02-22 13:27:23	\N
1197	3151	1197	2023-02-22 13:27:23	\N
1198	3152	1198	2023-02-22 13:27:23	\N
1199	3153	1199	2023-02-22 13:27:23	\N
1200	3154	1200	2023-02-22 13:27:23	\N
1201	3155	1201	2023-02-22 13:27:23	\N
1202	2908	1202	2023-02-22 13:27:54	\N
1203	2909	1203	2023-02-22 13:27:54	\N
1204	2910	1204	2023-02-22 13:27:54	\N
1205	2911	1205	2023-02-22 13:27:54	\N
1206	2912	1206	2023-02-22 13:27:54	\N
1207	2913	1207	2023-02-22 13:27:54	\N
1208	2914	1208	2023-02-22 13:27:54	\N
1209	2915	1209	2023-02-22 13:27:54	\N
1210	2916	1210	2023-02-22 13:27:54	\N
1211	2917	1211	2023-02-22 13:27:54	\N
1212	2918	1212	2023-02-22 13:27:54	\N
1213	2919	1213	2023-02-22 13:27:54	\N
1214	2920	1214	2023-02-22 13:27:54	\N
1215	2921	1215	2023-02-22 13:27:54	\N
1216	2922	1216	2023-02-22 13:27:54	\N
1217	2923	1217	2023-02-22 13:27:54	\N
1218	2924	1218	2023-02-22 13:27:54	\N
1219	2925	1219	2023-02-22 13:27:54	\N
1220	2926	1220	2023-02-22 13:27:54	\N
1221	2927	1221	2023-02-22 13:27:54	\N
1222	2928	1222	2023-02-22 13:27:54	\N
1223	2929	1223	2023-02-22 13:27:54	\N
1224	2930	1224	2023-02-22 13:27:54	\N
1225	2931	1225	2023-02-22 13:27:54	\N
1226	2932	1226	2023-02-22 13:27:54	\N
1227	2933	1227	2023-02-22 13:27:54	\N
1228	2934	1228	2023-02-22 13:27:54	\N
1229	2935	1229	2023-02-22 13:27:54	\N
1230	2936	1230	2023-02-22 13:27:54	\N
1231	2937	1231	2023-02-22 13:27:54	\N
1232	2938	1232	2023-02-22 13:27:54	\N
1233	2939	1233	2023-02-22 13:27:54	\N
1234	2940	1234	2023-02-22 13:27:54	\N
1235	2941	1235	2023-02-22 13:27:54	\N
1236	2942	1236	2023-02-22 13:27:54	\N
1237	2943	1237	2023-02-22 13:27:54	\N
1238	2944	1238	2023-02-22 13:27:54	\N
1239	2945	1239	2023-02-22 13:27:54	\N
1240	2946	1240	2023-02-22 13:27:54	\N
1241	2947	1241	2023-02-22 13:27:54	\N
1242	2948	1242	2023-02-22 13:27:54	\N
1243	2949	1243	2023-02-22 13:27:54	\N
1244	2950	1244	2023-02-22 13:27:54	\N
1245	2951	1245	2023-02-22 13:27:54	\N
1246	2952	1246	2023-02-22 13:28:25	\N
1247	2953	1247	2023-02-22 13:28:26	\N
1248	2954	1248	2023-02-22 13:28:26	\N
1249	2955	1249	2023-02-22 13:28:26	\N
1250	2956	1250	2023-02-22 13:28:26	\N
1251	2957	1251	2023-02-22 13:28:26	\N
1252	2958	1252	2023-02-22 13:28:26	\N
1253	2959	1253	2023-02-22 13:28:26	\N
1254	2960	1254	2023-02-22 13:28:26	\N
1255	2961	1255	2023-02-22 13:28:26	\N
1256	2962	1256	2023-02-22 13:28:26	\N
1257	2963	1257	2023-02-22 13:28:26	\N
1258	2964	1258	2023-02-22 13:28:26	\N
1259	2965	1259	2023-02-22 13:28:26	\N
1260	2966	1260	2023-02-22 13:28:26	\N
1261	2967	1261	2023-02-22 13:28:26	\N
1262	2968	1262	2023-02-22 13:28:26	\N
1263	2969	1263	2023-02-22 13:28:26	\N
1264	2970	1264	2023-02-22 13:28:26	\N
1265	2971	1265	2023-02-22 13:28:26	\N
1266	2972	1266	2023-02-22 13:28:26	\N
1267	2973	1267	2023-02-22 13:28:26	\N
1268	2974	1268	2023-02-22 13:28:26	\N
1269	2975	1269	2023-02-22 13:28:26	\N
1270	2976	1270	2023-02-22 13:28:26	\N
1271	2977	1271	2023-02-22 13:28:26	\N
1272	2978	1272	2023-02-22 13:28:26	\N
1273	2979	1273	2023-02-22 13:28:26	\N
1274	2980	1274	2023-02-22 13:28:26	\N
1275	2981	1275	2023-02-22 13:28:26	\N
1276	2982	1276	2023-02-22 13:28:26	\N
1277	2983	1277	2023-02-22 13:28:26	\N
1278	2984	1278	2023-02-22 13:28:26	\N
1279	2985	1279	2023-02-22 13:28:26	\N
1280	2986	1280	2023-02-22 13:28:26	\N
1281	2987	1281	2023-02-22 13:28:26	\N
1282	2988	1282	2023-02-22 13:28:26	\N
1283	2989	1283	2023-02-22 13:28:26	\N
1284	2990	1284	2023-02-22 13:28:26	\N
1285	2991	1285	2023-02-22 13:28:26	\N
1286	2992	1286	2023-02-22 13:28:26	\N
1287	2993	1287	2023-02-22 13:28:26	\N
1288	2994	1288	2023-02-22 13:28:26	\N
1289	2995	1289	2023-02-22 13:28:26	\N
1290	2996	1290	2023-02-22 13:28:26	\N
1291	2997	1291	2023-02-22 13:28:26	\N
1292	2998	1292	2023-02-22 13:28:26	\N
1293	2999	1293	2023-02-22 13:28:26	\N
1294	3000	1294	2023-02-22 13:28:26	\N
1295	3001	1295	2023-02-22 13:28:26	\N
1296	3002	1296	2023-02-22 13:28:26	\N
1297	3003	1297	2023-02-22 13:28:26	\N
1298	3004	1298	2023-02-22 13:28:26	\N
1299	3005	1299	2023-02-22 13:28:26	\N
1300	3006	1300	2023-02-22 13:28:26	\N
1301	3007	1301	2023-02-22 13:28:26	\N
1302	3008	1302	2023-02-22 13:28:26	\N
1303	3009	1303	2023-02-22 13:28:26	\N
1304	3010	1304	2023-02-22 13:28:26	\N
1305	3011	1305	2023-02-22 13:28:26	\N
1306	3012	1306	2023-02-22 13:28:26	\N
1307	3013	1307	2023-02-22 13:28:26	\N
1308	3014	1308	2023-02-22 13:28:26	\N
1309	3015	1309	2023-02-22 13:28:26	\N
1310	3016	1310	2023-02-22 13:28:26	\N
1311	3017	1311	2023-02-22 13:28:26	\N
1312	3018	1312	2023-02-22 13:28:26	\N
1313	3019	1313	2023-02-22 13:28:26	\N
1314	3020	1314	2023-02-22 13:28:26	\N
1315	3021	1315	2023-02-22 13:28:26	\N
1316	3022	1316	2023-02-22 13:28:26	\N
1317	3023	1317	2023-02-22 13:28:26	\N
1318	3024	1318	2023-02-22 13:28:26	\N
1319	3025	1319	2023-02-22 13:28:26	\N
1320	3026	1320	2023-02-22 13:28:26	\N
1321	3027	1321	2023-02-22 13:28:26	\N
1322	3028	1322	2023-02-22 13:28:26	\N
1323	3029	1323	2023-02-22 13:28:26	\N
1324	3030	1324	2023-02-22 13:28:26	\N
1325	3031	1325	2023-02-22 13:28:26	\N
1326	3032	1326	2023-02-22 13:28:26	\N
1327	3033	1327	2023-02-22 13:28:26	\N
1328	3034	1328	2023-02-22 13:28:26	\N
1329	3035	1329	2023-02-22 13:28:26	\N
1330	3036	1330	2023-02-22 13:28:26	\N
1331	3037	1331	2023-02-22 13:28:26	\N
1332	3038	1332	2023-02-22 13:28:26	\N
1333	3039	1333	2023-02-22 13:28:26	\N
1334	2853	1334	2023-02-22 13:29:17	\N
1335	2854	1335	2023-02-22 13:29:17	\N
1336	2855	1336	2023-02-22 13:29:17	\N
1337	2856	1337	2023-02-22 13:29:17	\N
1338	2857	1338	2023-02-22 13:29:17	\N
1339	2858	1339	2023-02-22 13:29:17	\N
1340	2859	1340	2023-02-22 13:29:17	\N
1341	2860	1341	2023-02-22 13:29:17	\N
1342	2861	1342	2023-02-22 13:29:17	\N
1343	2862	1343	2023-02-22 13:29:17	\N
1344	2863	1344	2023-02-22 13:29:17	\N
1345	2864	1345	2023-02-22 13:29:17	\N
1346	2865	1346	2023-02-22 13:29:17	\N
1347	2866	1347	2023-02-22 13:29:17	\N
1348	2867	1348	2023-02-22 13:29:17	\N
1349	2868	1349	2023-02-22 13:29:17	\N
1350	2869	1350	2023-02-22 13:29:17	\N
1351	2870	1351	2023-02-22 13:29:17	\N
1352	2871	1352	2023-02-22 13:29:17	\N
1353	2872	1353	2023-02-22 13:29:17	\N
1354	2873	1354	2023-02-22 13:29:17	\N
1355	2874	1355	2023-02-22 13:29:17	\N
1356	2875	1356	2023-02-22 13:29:17	\N
1357	2876	1357	2023-02-22 13:29:17	\N
1358	2877	1358	2023-02-22 13:29:17	\N
1359	2878	1359	2023-02-22 13:29:17	\N
1360	2879	1360	2023-02-22 13:29:17	\N
1361	2880	1361	2023-02-22 13:29:17	\N
1362	2881	1362	2023-02-22 13:29:17	\N
1363	2882	1363	2023-02-22 13:29:17	\N
1364	2883	1364	2023-02-22 13:29:17	\N
1365	2884	1365	2023-02-22 13:29:17	\N
1366	2885	1366	2023-02-22 13:29:17	\N
1367	2886	1367	2023-02-22 13:29:17	\N
1368	2887	1368	2023-02-22 13:29:17	\N
1369	2888	1369	2023-02-22 13:29:17	\N
1370	2889	1370	2023-02-22 13:29:17	\N
1371	2890	1371	2023-02-22 13:29:17	\N
1372	2891	1372	2023-02-22 13:29:17	\N
1373	2892	1373	2023-02-22 13:29:17	\N
1374	2893	1374	2023-02-22 13:29:17	\N
1375	2894	1375	2023-02-22 13:29:17	\N
1376	2895	1376	2023-02-22 13:29:17	\N
1377	2896	1377	2023-02-22 13:29:17	\N
1378	2897	1378	2023-02-22 13:29:17	\N
1379	2898	1379	2023-02-22 13:29:17	\N
1380	2899	1380	2023-02-22 13:29:17	\N
1381	2900	1381	2023-02-22 13:29:17	\N
1382	2901	1382	2023-02-22 13:29:17	\N
1383	2902	1383	2023-02-22 13:29:17	\N
1384	2903	1384	2023-02-22 13:29:17	\N
1385	2904	1385	2023-02-22 13:29:17	\N
1386	2905	1386	2023-02-22 13:29:17	\N
1387	2906	1387	2023-02-22 13:29:17	\N
1388	2907	1388	2023-02-22 13:29:17	\N
1389	3040	1389	2023-02-22 13:29:45	\N
1390	3041	1390	2023-02-22 13:29:45	\N
1391	3042	1391	2023-02-22 13:29:45	\N
1392	3043	1392	2023-02-22 13:29:45	\N
1393	3044	1393	2023-02-22 13:29:45	\N
1394	3045	1394	2023-02-22 13:29:45	\N
1395	3046	1395	2023-02-22 13:29:45	\N
1396	3047	1396	2023-02-22 13:29:45	\N
1397	3048	1397	2023-02-22 13:29:45	\N
1398	3049	1398	2023-02-22 13:29:45	\N
1399	3050	1399	2023-02-22 13:29:45	\N
1400	3051	1400	2023-02-22 13:29:45	\N
1401	3052	1401	2023-02-22 13:29:45	\N
1402	3053	1402	2023-02-22 13:29:45	\N
1403	3054	1403	2023-02-22 13:29:45	\N
1404	3055	1404	2023-02-22 13:29:45	\N
1405	3056	1405	2023-02-22 13:29:45	\N
1406	3057	1406	2023-02-22 13:29:45	\N
1407	3058	1407	2023-02-22 13:29:45	\N
1408	3059	1408	2023-02-22 13:29:45	\N
1409	3060	1409	2023-02-22 13:29:45	\N
1410	3061	1410	2023-02-22 13:29:45	\N
1411	3062	1411	2023-02-22 13:29:45	\N
1412	3063	1412	2023-02-22 13:29:45	\N
1413	3064	1413	2023-02-22 13:29:45	\N
1414	3065	1414	2023-02-22 13:29:45	\N
1415	3066	1415	2023-02-22 13:29:45	\N
1416	3067	1416	2023-02-22 13:29:45	\N
1417	3068	1417	2023-02-22 13:29:45	\N
1418	3069	1418	2023-02-22 13:29:45	\N
1419	3070	1419	2023-02-22 13:29:45	\N
1420	3071	1420	2023-02-22 13:29:45	\N
1421	3072	1421	2023-02-22 13:29:45	\N
1422	3073	1422	2023-02-22 13:29:45	\N
1423	3074	1423	2023-02-22 13:29:45	\N
1424	3075	1424	2023-02-22 13:29:45	\N
1425	3076	1425	2023-02-22 13:29:45	\N
1426	3077	1426	2023-02-22 13:29:45	\N
1427	3078	1427	2023-02-22 13:29:45	\N
1428	3079	1428	2023-02-22 13:29:45	\N
1429	3080	1429	2023-02-22 13:29:45	\N
1430	3081	1430	2023-02-22 13:29:45	\N
1431	3082	1431	2023-02-22 13:29:45	\N
1432	3083	1432	2023-02-22 13:29:45	\N
1433	3084	1433	2023-02-22 13:29:45	\N
1434	3085	1434	2023-02-22 13:29:45	\N
1435	3086	1435	2023-02-22 13:29:45	\N
1436	3087	1436	2023-02-22 13:29:45	\N
1437	3088	1437	2023-02-22 13:29:45	\N
1438	3089	1438	2023-02-22 13:29:45	\N
1439	3090	1439	2023-02-22 13:29:45	\N
1440	3091	1440	2023-02-22 13:29:45	\N
1441	3092	1441	2023-02-22 13:29:45	\N
1442	3093	1442	2023-02-22 13:29:45	\N
1443	3094	1443	2023-02-22 13:29:45	\N
1444	3095	1444	2023-02-22 13:29:45	\N
1445	3096	1445	2023-02-22 13:29:45	\N
1446	3097	1446	2023-02-22 13:29:45	\N
1447	3098	1447	2023-02-22 13:29:45	\N
1448	3099	1448	2023-02-22 13:29:45	\N
1449	3231	1449	2023-02-22 13:30:14	\N
1450	3232	1450	2023-02-22 13:30:14	\N
1451	3233	1451	2023-02-22 13:30:14	\N
1452	3234	1452	2023-02-22 13:30:14	\N
1453	3235	1453	2023-02-22 13:30:14	\N
1454	3236	1454	2023-02-22 13:30:14	\N
1455	3237	1455	2023-02-22 13:30:14	\N
1456	3238	1456	2023-02-22 13:30:14	\N
1457	3239	1457	2023-02-22 13:30:14	\N
1458	3240	1458	2023-02-22 13:30:14	\N
1459	3241	1459	2023-02-22 13:30:14	\N
1460	3242	1460	2023-02-22 13:30:14	\N
1461	3243	1461	2023-02-22 13:30:14	\N
1462	3244	1462	2023-02-22 13:30:14	\N
1463	3245	1463	2023-02-22 13:30:14	\N
1464	3246	1464	2023-02-22 13:30:14	\N
1465	3247	1465	2023-02-22 13:30:14	\N
1466	3248	1466	2023-02-22 13:30:14	\N
1467	3249	1467	2023-02-22 13:30:14	\N
1468	3250	1468	2023-02-22 13:30:14	\N
1469	3251	1469	2023-02-22 13:30:14	\N
1470	3252	1470	2023-02-22 13:30:14	\N
1471	3253	1471	2023-02-22 13:30:14	\N
1472	3254	1472	2023-02-22 13:30:14	\N
1473	3255	1473	2023-02-22 13:30:14	\N
1474	3256	1474	2023-02-22 13:30:14	\N
1475	3257	1475	2023-02-22 13:30:14	\N
1476	3258	1476	2023-02-22 13:30:14	\N
1477	3259	1477	2023-02-22 13:30:14	\N
1478	3260	1478	2023-02-22 13:30:14	\N
1479	3261	1479	2023-02-22 13:30:14	\N
1480	3262	1480	2023-02-22 13:30:14	\N
1481	3263	1481	2023-02-22 13:30:14	\N
1482	3264	1482	2023-02-22 13:30:14	\N
1483	3265	1483	2023-02-22 13:30:14	\N
1484	3266	1484	2023-02-22 13:30:14	\N
1485	3267	1485	2023-02-22 13:30:14	\N
1486	3268	1486	2023-02-22 13:30:14	\N
1487	3269	1487	2023-02-22 13:30:14	\N
1488	3270	1488	2023-02-22 13:30:14	\N
1489	3271	1489	2023-02-22 13:30:14	\N
1490	3272	1490	2023-02-22 13:30:14	\N
1491	3273	1491	2023-02-22 13:30:14	\N
1492	3274	1492	2023-02-22 13:30:14	\N
1493	3275	1493	2023-02-22 13:30:14	\N
1494	3276	1494	2023-02-22 13:30:14	\N
1495	3277	1495	2023-02-22 13:30:14	\N
1496	3398	1496	2023-02-22 13:30:38	\N
1497	3399	1497	2023-02-22 13:30:38	\N
1498	3400	1498	2023-02-22 13:30:38	\N
1499	3401	1499	2023-02-22 13:30:38	\N
1500	3402	1500	2023-02-22 13:30:38	\N
1501	3403	1501	2023-02-22 13:30:38	\N
1502	3404	1502	2023-02-22 13:30:38	\N
1503	3405	1503	2023-02-22 13:30:39	\N
1504	3406	1504	2023-02-22 13:30:39	\N
1505	3407	1505	2023-02-22 13:30:39	\N
1506	3408	1506	2023-02-22 13:30:39	\N
1507	3409	1507	2023-02-22 13:30:39	\N
1508	3410	1508	2023-02-22 13:30:39	\N
1509	3411	1509	2023-02-22 13:30:39	\N
1510	3412	1510	2023-02-22 13:30:39	\N
1511	3413	1511	2023-02-22 13:30:39	\N
1512	3414	1512	2023-02-22 13:30:39	\N
1513	3415	1513	2023-02-22 13:30:39	\N
1514	3416	1514	2023-02-22 13:30:39	\N
1515	3417	1515	2023-02-22 13:30:39	\N
1516	3418	1516	2023-02-22 13:30:39	\N
1517	3419	1517	2023-02-22 13:30:39	\N
1518	3420	1518	2023-02-22 13:30:39	\N
1519	3421	1519	2023-02-22 13:30:39	\N
1520	3422	1520	2023-02-22 13:30:39	\N
1521	3423	1521	2023-02-22 13:30:39	\N
1522	3424	1522	2023-02-22 13:30:39	\N
1523	3425	1523	2023-02-22 13:30:39	\N
1524	3426	1524	2023-02-22 13:30:39	\N
1525	3427	1525	2023-02-22 13:30:39	\N
1526	3428	1526	2023-02-22 13:30:39	\N
1527	3429	1527	2023-02-22 13:30:39	\N
1528	3430	1528	2023-02-22 13:30:39	\N
1529	3431	1529	2023-02-22 13:30:39	\N
1530	3432	1530	2023-02-22 13:30:39	\N
1531	3433	1531	2023-02-22 13:30:39	\N
1532	3434	1532	2023-02-22 13:30:39	\N
1533	3435	1533	2023-02-22 13:30:39	\N
1534	3436	1534	2023-02-22 13:30:39	\N
1535	3437	1535	2023-02-22 13:30:39	\N
1536	3438	1536	2023-02-22 13:30:39	\N
1537	3439	1537	2023-02-22 13:30:39	\N
1538	3440	1538	2023-02-22 13:30:39	\N
1539	3441	1539	2023-02-22 13:30:39	\N
1540	3442	1540	2023-02-22 13:30:39	\N
1541	3443	1541	2023-02-22 13:30:39	\N
1542	3444	1542	2023-02-22 13:30:39	\N
1543	3445	1543	2023-02-22 13:30:39	\N
1544	3446	1544	2023-02-22 13:30:39	\N
1545	3447	1545	2023-02-22 13:30:39	\N
1546	3448	1546	2023-02-22 13:30:39	\N
1547	3449	1547	2023-02-22 13:30:39	\N
1548	3450	1548	2023-02-22 13:30:39	\N
1549	3278	1549	2023-02-22 13:31:18	\N
1550	3279	1550	2023-02-22 13:31:18	\N
1551	3280	1551	2023-02-22 13:31:18	\N
1552	3281	1552	2023-02-22 13:31:18	\N
1553	3282	1553	2023-02-22 13:31:18	\N
1554	3283	1554	2023-02-22 13:31:18	\N
1555	3284	1555	2023-02-22 13:31:18	\N
1556	3285	1556	2023-02-22 13:31:18	\N
1557	3286	1557	2023-02-22 13:31:18	\N
1558	3287	1558	2023-02-22 13:31:18	\N
1559	3288	1559	2023-02-22 13:31:18	\N
1560	3289	1560	2023-02-22 13:31:18	\N
1561	3290	1561	2023-02-22 13:31:18	\N
1562	3291	1562	2023-02-22 13:31:18	\N
1563	3292	1563	2023-02-22 13:31:18	\N
1564	3293	1564	2023-02-22 13:31:18	\N
1565	3294	1565	2023-02-22 13:31:18	\N
1566	3295	1566	2023-02-22 13:31:18	\N
1567	3296	1567	2023-02-22 13:31:18	\N
1568	3297	1568	2023-02-22 13:31:18	\N
1569	3298	1569	2023-02-22 13:31:18	\N
1570	3299	1570	2023-02-22 13:31:18	\N
1571	3300	1571	2023-02-22 13:31:18	\N
1572	3301	1572	2023-02-22 13:31:18	\N
1573	3302	1573	2023-02-22 13:31:18	\N
1574	3303	1574	2023-02-22 13:31:18	\N
1575	3304	1575	2023-02-22 13:31:18	\N
1576	3305	1576	2023-02-22 13:31:18	\N
1577	3306	1577	2023-02-22 13:31:18	\N
1578	3307	1578	2023-02-22 13:31:18	\N
1579	3308	1579	2023-02-22 13:31:18	\N
1580	3309	1580	2023-02-22 13:31:18	\N
1581	3310	1581	2023-02-22 13:31:18	\N
1582	3311	1582	2023-02-22 13:31:18	\N
1583	3312	1583	2023-02-22 13:31:18	\N
1584	3313	1584	2023-02-22 13:31:18	\N
1585	3314	1585	2023-02-22 13:31:18	\N
1586	3315	1586	2023-02-22 13:31:18	\N
1587	3316	1587	2023-02-22 13:31:18	\N
1588	3317	1588	2023-02-22 13:31:18	\N
1589	3318	1589	2023-02-22 13:31:18	\N
1590	3319	1590	2023-02-22 13:31:18	\N
1591	3320	1591	2023-02-22 13:31:18	\N
1592	3321	1592	2023-02-22 13:31:18	\N
1593	3322	1593	2023-02-22 13:31:18	\N
1594	3323	1594	2023-02-22 13:31:18	\N
1595	3324	1595	2023-02-22 13:31:18	\N
1596	3325	1596	2023-02-22 13:31:18	\N
1597	3326	1597	2023-02-22 13:31:18	\N
1598	3327	1598	2023-02-22 13:31:18	\N
1599	3328	1599	2023-02-22 13:31:18	\N
1600	3329	1600	2023-02-22 13:31:18	\N
1601	3330	1601	2023-02-22 13:31:18	\N
1602	3331	1602	2023-02-22 13:31:18	\N
1603	3332	1603	2023-02-22 13:31:18	\N
1604	3333	1604	2023-02-22 13:31:18	\N
1605	3334	1605	2023-02-22 13:31:18	\N
1606	3335	1606	2023-02-22 13:31:18	\N
1607	3336	1607	2023-02-22 13:31:18	\N
1608	3337	1608	2023-02-22 13:31:18	\N
1609	3338	1609	2023-02-22 13:31:18	\N
1610	3339	1610	2023-02-22 13:31:18	\N
1611	3340	1611	2023-02-22 13:31:18	\N
1612	3341	1612	2023-02-22 13:31:18	\N
1613	3342	1613	2023-02-22 13:31:18	\N
1614	3343	1614	2023-02-22 13:31:18	\N
1615	3344	1615	2023-02-22 13:31:18	\N
1616	3345	1616	2023-02-22 13:31:18	\N
1617	3346	1617	2023-02-22 13:31:18	\N
1618	3347	1618	2023-02-22 13:31:18	\N
1619	3348	1619	2023-02-22 13:31:18	\N
1620	3349	1620	2023-02-22 13:31:18	\N
1621	3350	1621	2023-02-22 13:31:18	\N
1622	3351	1622	2023-02-22 13:31:18	\N
1623	3352	1623	2023-02-22 13:31:18	\N
1624	3353	1624	2023-02-22 13:31:18	\N
1625	3354	1625	2023-02-22 13:31:18	\N
1626	3355	1626	2023-02-22 13:31:18	\N
1627	3356	1627	2023-02-22 13:31:18	\N
1628	3357	1628	2023-02-22 13:31:18	\N
1629	3358	1629	2023-02-22 13:31:18	\N
1630	3359	1630	2023-02-22 13:31:18	\N
1631	3360	1631	2023-02-22 13:31:18	\N
1632	3361	1632	2023-02-22 13:31:19	\N
1633	3362	1633	2023-02-22 13:31:19	\N
1634	3363	1634	2023-02-22 13:31:19	\N
1635	3364	1635	2023-02-22 13:31:19	\N
1636	3365	1636	2023-02-22 13:31:19	\N
1637	3366	1637	2023-02-22 13:31:19	\N
1638	3367	1638	2023-02-22 13:31:19	\N
1639	3368	1639	2023-02-22 13:31:19	\N
1640	3369	1640	2023-02-22 13:31:19	\N
1641	3370	1641	2023-02-22 13:31:19	\N
1642	3371	1642	2023-02-22 13:31:19	\N
1643	3372	1643	2023-02-22 13:31:19	\N
1644	3373	1644	2023-02-22 13:31:19	\N
1645	3374	1645	2023-02-22 13:31:19	\N
1646	3375	1646	2023-02-22 13:31:19	\N
1647	3376	1647	2023-02-22 13:31:19	\N
1648	3377	1648	2023-02-22 13:31:19	\N
1649	3378	1649	2023-02-22 13:31:19	\N
1650	3379	1650	2023-02-22 13:31:19	\N
1651	3380	1651	2023-02-22 13:31:19	\N
1652	3381	1652	2023-02-22 13:31:19	\N
1653	3382	1653	2023-02-22 13:31:19	\N
1654	3383	1654	2023-02-22 13:31:19	\N
1655	3384	1655	2023-02-22 13:31:19	\N
1656	3385	1656	2023-02-22 13:31:19	\N
1657	3386	1657	2023-02-22 13:31:19	\N
1658	3387	1658	2023-02-22 13:31:19	\N
1659	3388	1659	2023-02-22 13:31:19	\N
1660	3389	1660	2023-02-22 13:31:19	\N
1661	3390	1661	2023-02-22 13:31:19	\N
1662	3391	1662	2023-02-22 13:31:19	\N
1663	3392	1663	2023-02-22 13:31:19	\N
1664	3393	1664	2023-02-22 13:31:19	\N
1665	3394	1665	2023-02-22 13:31:19	\N
1666	3395	1666	2023-02-22 13:31:19	\N
1667	3396	1667	2023-02-22 13:31:19	\N
1668	3397	1668	2023-02-22 13:31:19	\N
1669	3451	1669	2023-02-22 13:31:43	\N
1670	3452	1670	2023-02-22 13:31:43	\N
1671	3453	1671	2023-02-22 13:31:43	\N
1672	3454	1672	2023-02-22 13:31:43	\N
1673	3455	1673	2023-02-22 13:31:43	\N
1674	3456	1674	2023-02-22 13:31:43	\N
1675	3457	1675	2023-02-22 13:31:43	\N
1676	3458	1676	2023-02-22 13:31:43	\N
1677	3459	1677	2023-02-22 13:31:43	\N
1678	3460	1678	2023-02-22 13:31:43	\N
1679	3461	1679	2023-02-22 13:31:43	\N
1680	3462	1680	2023-02-22 13:31:43	\N
1681	3463	1681	2023-02-22 13:31:43	\N
1682	3464	1682	2023-02-22 13:31:43	\N
1683	3465	1683	2023-02-22 13:31:43	\N
1684	3466	1684	2023-02-22 13:31:43	\N
1685	3467	1685	2023-02-22 13:31:43	\N
1686	3468	1686	2023-02-22 13:31:43	\N
1687	3469	1687	2023-02-22 13:31:43	\N
1688	3470	1688	2023-02-22 13:31:43	\N
1689	3471	1689	2023-02-22 13:31:43	\N
1690	3472	1690	2023-02-22 13:31:43	\N
1691	3473	1691	2023-02-22 13:31:43	\N
1692	3474	1692	2023-02-22 13:31:43	\N
1693	3475	1693	2023-02-22 13:31:43	\N
1694	3476	1694	2023-02-22 13:31:43	\N
1695	3477	1695	2023-02-22 13:31:43	\N
1696	3478	1696	2023-02-22 13:31:43	\N
1697	3479	1697	2023-02-22 13:31:43	\N
1698	3480	1698	2023-02-22 13:31:43	\N
1699	3156	1699	2023-02-22 13:32:21	\N
1700	3157	1700	2023-02-22 13:32:21	\N
1701	3158	1701	2023-02-22 13:32:21	\N
1702	3159	1702	2023-02-22 13:32:21	\N
1703	3160	1703	2023-02-22 13:32:21	\N
1704	3161	1704	2023-02-22 13:32:21	\N
1705	3162	1705	2023-02-22 13:32:21	\N
1706	3163	1706	2023-02-22 13:32:21	\N
1707	3164	1707	2023-02-22 13:32:21	\N
1708	3165	1708	2023-02-22 13:32:21	\N
1709	3166	1709	2023-02-22 13:32:21	\N
1710	3167	1710	2023-02-22 13:32:21	\N
1711	3168	1711	2023-02-22 13:32:21	\N
1712	3169	1712	2023-02-22 13:32:21	\N
1713	3170	1713	2023-02-22 13:32:21	\N
1714	3171	1714	2023-02-22 13:32:21	\N
1715	3172	1715	2023-02-22 13:32:21	\N
1716	3173	1716	2023-02-22 13:32:21	\N
1717	3174	1717	2023-02-22 13:32:21	\N
1718	3175	1718	2023-02-22 13:32:21	\N
1719	3176	1719	2023-02-22 13:32:21	\N
1720	3177	1720	2023-02-22 13:32:21	\N
1721	3178	1721	2023-02-22 13:32:21	\N
1722	3179	1722	2023-02-22 13:32:21	\N
1723	3180	1723	2023-02-22 13:32:21	\N
1724	3181	1724	2023-02-22 13:32:21	\N
1725	3182	1725	2023-02-22 13:32:21	\N
1726	3183	1726	2023-02-22 13:32:21	\N
1727	3184	1727	2023-02-22 13:32:21	\N
1728	3185	1728	2023-02-22 13:32:21	\N
1729	3186	1729	2023-02-22 13:32:21	\N
1730	3187	1730	2023-02-22 13:32:21	\N
1731	3188	1731	2023-02-22 13:32:21	\N
1732	3189	1732	2023-02-22 13:32:21	\N
1733	3190	1733	2023-02-22 13:32:21	\N
1734	3191	1734	2023-02-22 13:32:21	\N
1735	3192	1735	2023-02-22 13:32:21	\N
1736	3193	1736	2023-02-22 13:32:21	\N
1737	3194	1737	2023-02-22 13:32:21	\N
1738	3195	1738	2023-02-22 13:32:21	\N
1739	3196	1739	2023-02-22 13:32:21	\N
1740	3197	1740	2023-02-22 13:32:21	\N
1741	3198	1741	2023-02-22 13:32:21	\N
1742	3199	1742	2023-02-22 13:32:21	\N
1743	3200	1743	2023-02-22 13:32:21	\N
1744	3201	1744	2023-02-22 13:32:21	\N
1745	3202	1745	2023-02-22 13:32:21	\N
1746	3203	1746	2023-02-22 13:32:21	\N
1747	3204	1747	2023-02-22 13:32:21	\N
1748	3205	1748	2023-02-22 13:32:21	\N
1749	3206	1749	2023-02-22 13:32:21	\N
1750	3207	1750	2023-02-22 13:32:21	\N
1751	3208	1751	2023-02-22 13:32:21	\N
1752	3209	1752	2023-02-22 13:32:21	\N
1753	3210	1753	2023-02-22 13:32:21	\N
1754	3211	1754	2023-02-22 13:32:21	\N
1755	3212	1755	2023-02-22 13:32:21	\N
1756	3213	1756	2023-02-22 13:32:21	\N
1757	3214	1757	2023-02-22 13:32:21	\N
1758	3215	1758	2023-02-22 13:32:21	\N
1759	3216	1759	2023-02-22 13:32:21	\N
1760	3217	1760	2023-02-22 13:32:21	\N
1761	3218	1761	2023-02-22 13:32:21	\N
1762	3219	1762	2023-02-22 13:32:21	\N
1763	3220	1763	2023-02-22 13:32:21	\N
1764	3221	1764	2023-02-22 13:32:21	\N
1765	3222	1765	2023-02-22 13:32:21	\N
1766	3223	1766	2023-02-22 13:32:21	\N
1767	3224	1767	2023-02-22 13:32:21	\N
1768	3225	1768	2023-02-22 13:32:21	\N
1769	3226	1769	2023-02-22 13:32:21	\N
1770	3227	1770	2023-02-22 13:32:21	\N
1771	3228	1771	2023-02-22 13:32:21	\N
1772	3229	1772	2023-02-22 13:32:21	\N
1773	3230	1773	2023-02-22 13:32:21	\N
1774	3481	1774	2023-02-22 13:32:44	\N
1775	3482	1775	2023-02-22 13:32:44	\N
1776	3483	1776	2023-02-22 13:32:44	\N
1777	3484	1777	2023-02-22 13:32:44	\N
1778	3485	1778	2023-02-22 13:32:44	\N
1779	3486	1779	2023-02-22 13:32:44	\N
1780	3487	1780	2023-02-22 13:32:44	\N
1781	3488	1781	2023-02-22 13:32:44	\N
1782	3489	1782	2023-02-22 13:32:44	\N
1783	3490	1783	2023-02-22 13:32:44	\N
1784	3491	1784	2023-02-22 13:32:44	\N
1785	3492	1785	2023-02-22 13:32:44	\N
1786	3493	1786	2023-02-22 13:32:44	\N
1787	3494	1787	2023-02-22 13:32:44	\N
1788	3495	1788	2023-02-22 13:32:44	\N
1789	3496	1789	2023-02-22 13:32:44	\N
1790	3497	1790	2023-02-22 13:32:44	\N
1791	3498	1791	2023-02-22 13:32:44	\N
1792	3499	1792	2023-02-22 13:32:44	\N
1793	3500	1793	2023-02-22 13:32:44	\N
1794	3501	1794	2023-02-22 13:32:44	\N
1795	3502	1795	2023-02-22 13:32:44	\N
1796	3503	1796	2023-02-22 13:33:06	\N
1797	3504	1797	2023-02-22 13:33:06	\N
1798	3505	1798	2023-02-22 13:33:06	\N
1799	3506	1799	2023-02-22 13:33:06	\N
1800	3507	1800	2023-02-22 13:33:06	\N
1801	3508	1801	2023-02-22 13:33:06	\N
1802	3509	1802	2023-02-22 13:33:06	\N
1803	3510	1803	2023-02-22 13:33:06	\N
1804	3511	1804	2023-02-22 13:33:06	\N
1805	3512	1805	2023-02-22 13:33:06	\N
1806	3513	1806	2023-02-22 13:33:06	\N
1807	3514	1807	2023-02-22 13:33:06	\N
1808	3515	1808	2023-02-22 13:33:06	\N
1809	3516	1809	2023-02-22 13:33:06	\N
1810	3517	1810	2023-02-22 13:33:06	\N
1811	3518	1811	2023-02-22 13:33:06	\N
1812	3519	1812	2023-02-22 13:33:06	\N
1813	3520	1813	2023-02-22 13:33:06	\N
1814	3521	1814	2023-02-22 13:33:06	\N
1815	3522	1815	2023-02-22 13:33:06	\N
1816	3523	1816	2023-02-22 13:33:06	\N
1817	3524	1817	2023-02-22 13:33:06	\N
1818	3525	1818	2023-02-22 13:33:06	\N
1819	3526	1819	2023-02-22 13:33:06	\N
1820	3527	1820	2023-02-22 13:33:06	\N
1821	3528	1821	2023-02-22 13:33:06	\N
1822	3529	1822	2023-02-22 13:33:06	\N
1823	3530	1823	2023-02-22 13:33:06	\N
1824	3531	1824	2023-02-22 13:33:06	\N
1825	3532	1825	2023-02-22 13:33:06	\N
1826	3533	1826	2023-02-22 13:33:06	\N
1827	3534	1827	2023-02-22 13:33:06	\N
1828	3535	1828	2023-02-22 13:33:06	\N
1829	3536	1829	2023-02-22 13:33:06	\N
1830	3537	1830	2023-02-22 13:33:06	\N
1831	3538	1831	2023-02-22 13:33:06	\N
1832	3539	1832	2023-02-22 13:33:06	\N
1833	3540	1833	2023-02-22 13:33:06	\N
1834	3541	1834	2023-02-22 13:33:06	\N
1835	3542	1835	2023-02-22 13:33:06	\N
1836	3543	1836	2023-02-22 13:33:06	\N
1837	3544	1837	2023-02-22 13:33:06	\N
1838	3545	1838	2023-02-22 13:33:06	\N
1839	3546	1839	2023-02-22 13:33:06	\N
1840	3547	1840	2023-02-22 13:33:06	\N
1841	3548	1841	2023-02-22 13:33:06	\N
1842	3549	1842	2023-02-22 13:33:06	\N
1843	3550	1843	2023-02-22 13:33:06	\N
1844	3551	1844	2023-02-22 13:33:06	\N
1845	3552	1845	2023-02-22 13:33:06	\N
1846	3553	1846	2023-02-22 13:33:06	\N
1847	3554	1847	2023-02-22 13:33:06	\N
1848	3555	1848	2023-02-22 13:33:06	\N
1849	3556	1849	2023-02-22 13:33:06	\N
1850	3908	1850	2023-02-22 13:33:27	\N
1851	3909	1851	2023-02-22 13:33:27	\N
1852	3910	1852	2023-02-22 13:33:27	\N
1853	3911	1853	2023-02-22 13:33:27	\N
1854	3912	1854	2023-02-22 13:33:27	\N
1855	3913	1855	2023-02-22 13:33:27	\N
1856	3914	1856	2023-02-22 13:33:27	\N
1857	3915	1857	2023-02-22 13:33:27	\N
1858	3916	1858	2023-02-22 13:33:27	\N
1859	3917	1859	2023-02-22 13:33:27	\N
1860	3918	1860	2023-02-22 13:33:27	\N
1861	3919	1861	2023-02-22 13:33:27	\N
1862	3920	1862	2023-02-22 13:33:27	\N
1863	3921	1863	2023-02-22 13:33:27	\N
1864	3922	1864	2023-02-22 13:33:27	\N
1865	3923	1865	2023-02-22 13:33:27	\N
1866	3924	1866	2023-02-22 13:33:27	\N
1867	3925	1867	2023-02-22 13:33:27	\N
1868	3926	1868	2023-02-22 13:33:27	\N
1869	3927	1869	2023-02-22 13:33:27	\N
1870	3928	1870	2023-02-22 13:33:27	\N
1871	3929	1871	2023-02-22 13:33:27	\N
1872	3930	1872	2023-02-22 13:33:27	\N
1873	3931	1873	2023-02-22 13:33:27	\N
1874	3932	1874	2023-02-22 13:33:27	\N
1875	3933	1875	2023-02-22 13:33:27	\N
1876	3934	1876	2023-02-22 13:33:27	\N
1877	3935	1877	2023-02-22 13:33:27	\N
1878	3936	1878	2023-02-22 13:33:27	\N
1879	3937	1879	2023-02-22 13:33:27	\N
1880	3938	1880	2023-02-22 13:33:27	\N
1881	3939	1881	2023-02-22 13:33:27	\N
1882	3940	1882	2023-02-22 13:33:27	\N
1883	3941	1883	2023-02-22 13:33:27	\N
1884	3942	1884	2023-02-22 13:33:27	\N
1885	3943	1885	2023-02-22 13:33:27	\N
1886	3944	1886	2023-02-22 13:33:27	\N
1887	3945	1887	2023-02-22 13:33:27	\N
1888	3946	1888	2023-02-22 13:33:27	\N
1889	3947	1889	2023-02-22 13:33:27	\N
1890	3948	1890	2023-02-22 13:33:27	\N
1891	3612	1891	2023-02-22 13:33:49	\N
1892	3613	1892	2023-02-22 13:33:49	\N
1893	3614	1893	2023-02-22 13:33:49	\N
1894	3615	1894	2023-02-22 13:33:49	\N
1895	3616	1895	2023-02-22 13:33:49	\N
1896	3617	1896	2023-02-22 13:33:49	\N
1897	3618	1897	2023-02-22 13:33:49	\N
1898	3619	1898	2023-02-22 13:33:49	\N
1899	3620	1899	2023-02-22 13:33:49	\N
1900	3621	1900	2023-02-22 13:33:49	\N
1901	3622	1901	2023-02-22 13:33:49	\N
1902	3623	1902	2023-02-22 13:33:49	\N
1903	3624	1903	2023-02-22 13:33:49	\N
1904	3625	1904	2023-02-22 13:33:49	\N
1905	3626	1905	2023-02-22 13:33:49	\N
1906	3627	1906	2023-02-22 13:33:49	\N
1907	3628	1907	2023-02-22 13:33:49	\N
1908	3629	1908	2023-02-22 13:33:49	\N
1909	3630	1909	2023-02-22 13:33:49	\N
1910	3631	1910	2023-02-22 13:33:49	\N
1911	3632	1911	2023-02-22 13:33:49	\N
1912	3633	1912	2023-02-22 13:33:49	\N
1913	3634	1913	2023-02-22 13:33:49	\N
1914	3635	1914	2023-02-22 13:33:49	\N
1915	3636	1915	2023-02-22 13:33:49	\N
1916	3637	1916	2023-02-22 13:33:49	\N
1917	3638	1917	2023-02-22 13:33:49	\N
1918	3639	1918	2023-02-22 13:33:49	\N
1919	3640	1919	2023-02-22 13:33:49	\N
1920	3641	1920	2023-02-22 13:33:49	\N
1921	3642	1921	2023-02-22 13:33:49	\N
1922	3643	1922	2023-02-22 13:33:49	\N
1923	3644	1923	2023-02-22 13:33:49	\N
1924	3645	1924	2023-02-22 13:33:49	\N
1925	3646	1925	2023-02-22 13:33:49	\N
1926	3647	1926	2023-02-22 13:33:49	\N
1927	3648	1927	2023-02-22 13:33:49	\N
1928	3649	1928	2023-02-22 13:33:50	\N
1929	3650	1929	2023-02-22 13:33:50	\N
1930	3651	1930	2023-02-22 13:33:50	\N
1931	3652	1931	2023-02-22 13:33:50	\N
1932	3653	1932	2023-02-22 13:33:50	\N
1933	3654	1933	2023-02-22 13:33:50	\N
1934	3655	1934	2023-02-22 13:33:50	\N
1935	3656	1935	2023-02-22 13:33:50	\N
1936	3657	1936	2023-02-22 13:33:50	\N
1937	3658	1937	2023-02-22 13:33:50	\N
1938	3659	1938	2023-02-22 13:33:50	\N
1939	3660	1939	2023-02-22 13:33:50	\N
1940	3661	1940	2023-02-22 13:33:50	\N
1941	3662	1941	2023-02-22 13:33:50	\N
1942	3663	1942	2023-02-22 13:33:50	\N
1943	3664	1943	2023-02-22 13:33:50	\N
1944	3665	1944	2023-02-22 13:33:50	\N
1945	3666	1945	2023-02-22 13:33:50	\N
1946	3667	1946	2023-02-22 13:33:50	\N
1947	3668	1947	2023-02-22 13:33:50	\N
1948	3669	1948	2023-02-22 13:33:50	\N
1949	3670	1949	2023-02-22 13:33:50	\N
1950	3671	1950	2023-02-22 13:33:50	\N
1951	3672	1951	2023-02-22 13:33:50	\N
1952	3673	1952	2023-02-22 13:33:50	\N
1953	3674	1953	2023-02-22 13:33:50	\N
1954	3675	1954	2023-02-22 13:33:50	\N
1955	3676	1955	2023-02-22 13:33:50	\N
1956	3677	1956	2023-02-22 13:33:50	\N
1957	3678	1957	2023-02-22 13:33:50	\N
1958	3679	1958	2023-02-22 13:33:50	\N
1959	3680	1959	2023-02-22 13:33:50	\N
1960	3681	1960	2023-02-22 13:33:50	\N
1961	3682	1961	2023-02-22 13:33:50	\N
1962	3683	1962	2023-02-22 13:33:50	\N
1963	3684	1963	2023-02-22 13:33:50	\N
1964	3685	1964	2023-02-22 13:33:50	\N
1965	3686	1965	2023-02-22 13:33:50	\N
1966	3687	1966	2023-02-22 13:33:50	\N
1967	3688	1967	2023-02-22 13:33:50	\N
1968	3689	1968	2023-02-22 13:33:50	\N
1969	3690	1969	2023-02-22 13:33:50	\N
1970	3691	1970	2023-02-22 13:33:50	\N
1971	3692	1971	2023-02-22 13:33:50	\N
1972	3693	1972	2023-02-22 13:33:50	\N
1973	3694	1973	2023-02-22 13:33:50	\N
1974	3695	1974	2023-02-22 13:33:50	\N
1975	3696	1975	2023-02-22 13:33:50	\N
1976	3697	1976	2023-02-22 13:33:50	\N
1977	3698	1977	2023-02-22 13:33:50	\N
1978	3699	1978	2023-02-22 13:33:50	\N
1979	3700	1979	2023-02-22 13:33:50	\N
1980	3701	1980	2023-02-22 13:33:50	\N
1981	3702	1981	2023-02-22 13:33:50	\N
1982	3703	1982	2023-02-22 13:33:50	\N
1983	3704	1983	2023-02-22 13:33:50	\N
1984	3705	1984	2023-02-22 13:33:50	\N
1985	3706	1985	2023-02-22 13:33:50	\N
1986	3707	1986	2023-02-22 13:33:50	\N
1987	3708	1987	2023-02-22 13:33:50	\N
1988	3709	1988	2023-02-22 13:33:50	\N
1989	3710	1989	2023-02-22 13:33:50	\N
1990	3711	1990	2023-02-22 13:33:50	\N
1991	3712	1991	2023-02-22 13:33:50	\N
1992	3713	1992	2023-02-22 13:33:50	\N
1993	3714	1993	2023-02-22 13:33:50	\N
1994	3715	1994	2023-02-22 13:33:50	\N
1995	3716	1995	2023-02-22 13:33:50	\N
1996	3717	1996	2023-02-22 13:33:50	\N
1997	3718	1997	2023-02-22 13:33:50	\N
1998	3719	1998	2023-02-22 13:33:50	\N
1999	3720	1999	2023-02-22 13:33:50	\N
2000	3721	2000	2023-02-22 13:33:50	\N
2001	3722	2001	2023-02-22 13:33:50	\N
2002	3723	2002	2023-02-22 13:33:50	\N
2003	3724	2003	2023-02-22 13:33:50	\N
2004	3725	2004	2023-02-22 13:33:50	\N
2005	3726	2005	2023-02-22 13:33:50	\N
2006	3727	2006	2023-02-22 13:33:50	\N
2007	3728	2007	2023-02-22 13:33:50	\N
2008	3729	2008	2023-02-22 13:33:50	\N
2009	3730	2009	2023-02-22 13:33:50	\N
2010	3731	2010	2023-02-22 13:33:50	\N
2011	3732	2011	2023-02-22 13:33:50	\N
2012	3733	2012	2023-02-22 13:33:50	\N
2013	3734	2013	2023-02-22 13:33:50	\N
2014	3735	2014	2023-02-22 13:33:50	\N
2015	3736	2015	2023-02-22 13:33:50	\N
2016	3737	2016	2023-02-22 13:33:50	\N
2017	3738	2017	2023-02-22 13:33:50	\N
2018	3739	2018	2023-02-22 13:33:50	\N
2019	3740	2019	2023-02-22 13:33:50	\N
2020	3741	2020	2023-02-22 13:33:50	\N
2021	3742	2021	2023-02-22 13:33:50	\N
2022	3743	2022	2023-02-22 13:33:50	\N
2023	3744	2023	2023-02-22 13:33:50	\N
2024	3883	2024	2023-02-22 13:34:18	\N
2025	3884	2025	2023-02-22 13:34:18	\N
2026	3885	2026	2023-02-22 13:34:18	\N
2027	3886	2027	2023-02-22 13:34:18	\N
2028	3887	2028	2023-02-22 13:34:18	\N
2029	3888	2029	2023-02-22 13:34:18	\N
2030	3889	2030	2023-02-22 13:34:18	\N
2031	3890	2031	2023-02-22 13:34:18	\N
2032	3891	2032	2023-02-22 13:34:18	\N
2033	3892	2033	2023-02-22 13:34:18	\N
2034	3893	2034	2023-02-22 13:34:18	\N
2035	3894	2035	2023-02-22 13:34:18	\N
2036	3895	2036	2023-02-22 13:34:18	\N
2037	3896	2037	2023-02-22 13:34:18	\N
2038	3897	2038	2023-02-22 13:34:18	\N
2039	3898	2039	2023-02-22 13:34:18	\N
2040	3899	2040	2023-02-22 13:34:18	\N
2041	3900	2041	2023-02-22 13:34:18	\N
2042	3901	2042	2023-02-22 13:34:18	\N
2043	3902	2043	2023-02-22 13:34:18	\N
2044	3903	2044	2023-02-22 13:34:18	\N
2045	3904	2045	2023-02-22 13:34:18	\N
2046	3905	2046	2023-02-22 13:34:18	\N
2047	3906	2047	2023-02-22 13:34:18	\N
2048	3907	2048	2023-02-22 13:34:18	\N
2049	2275	2049	2023-02-22 13:34:40	\N
2050	2276	2050	2023-02-22 13:34:40	\N
2051	2277	2051	2023-02-22 13:34:40	\N
2052	2278	2052	2023-02-22 13:34:40	\N
2053	2279	2053	2023-02-22 13:34:40	\N
2054	2280	2054	2023-02-22 13:34:40	\N
2055	2281	2055	2023-02-22 13:34:40	\N
2056	2282	2056	2023-02-22 13:34:40	\N
2057	2283	2057	2023-02-22 13:34:40	\N
2058	2284	2058	2023-02-22 13:34:40	\N
2059	2285	2059	2023-02-22 13:34:40	\N
2060	2286	2060	2023-02-22 13:34:40	\N
2061	2287	2061	2023-02-22 13:34:40	\N
2062	2288	2062	2023-02-22 13:34:40	\N
2063	2289	2063	2023-02-22 13:34:40	\N
2064	2290	2064	2023-02-22 13:34:40	\N
2065	2291	2065	2023-02-22 13:34:40	\N
2066	2292	2066	2023-02-22 13:34:40	\N
2067	2293	2067	2023-02-22 13:34:40	\N
2068	2294	2068	2023-02-22 13:34:40	\N
2069	2295	2069	2023-02-22 13:34:40	\N
2070	2296	2070	2023-02-22 13:34:40	\N
2071	2297	2071	2023-02-22 13:34:40	\N
2072	2298	2072	2023-02-22 13:34:40	\N
2073	2299	2073	2023-02-22 13:34:40	\N
2074	2300	2074	2023-02-22 13:34:40	\N
2075	2301	2075	2023-02-22 13:34:40	\N
2076	2302	2076	2023-02-22 13:34:40	\N
2077	2303	2077	2023-02-22 13:34:40	\N
2078	2304	2078	2023-02-22 13:34:40	\N
2079	2305	2079	2023-02-22 13:34:40	\N
2080	2306	2080	2023-02-22 13:34:40	\N
2081	2307	2081	2023-02-22 13:34:40	\N
2082	2308	2082	2023-02-22 13:34:40	\N
2083	2309	2083	2023-02-22 13:34:40	\N
2084	2310	2084	2023-02-22 13:34:40	\N
2085	2311	2085	2023-02-22 13:34:40	\N
2086	2312	2086	2023-02-22 13:34:40	\N
2087	2313	2087	2023-02-22 13:34:40	\N
2088	2314	2088	2023-02-22 13:34:40	\N
2089	2315	2089	2023-02-22 13:34:40	\N
2090	2316	2090	2023-02-22 13:34:40	\N
2091	2317	2091	2023-02-22 13:34:40	\N
2092	2318	2092	2023-02-22 13:34:40	\N
2093	2319	2093	2023-02-22 13:34:40	\N
2094	2320	2094	2023-02-22 13:34:40	\N
2095	2321	2095	2023-02-22 13:34:40	\N
2096	2322	2096	2023-02-22 13:34:40	\N
2097	2323	2097	2023-02-22 13:34:40	\N
2098	2324	2098	2023-02-22 13:34:40	\N
2099	2325	2099	2023-02-22 13:34:40	\N
2100	2326	2100	2023-02-22 13:34:40	\N
2101	2327	2101	2023-02-22 13:34:40	\N
2102	2328	2102	2023-02-22 13:34:40	\N
2103	2329	2103	2023-02-22 13:34:40	\N
2104	2330	2104	2023-02-22 13:34:40	\N
2105	2331	2105	2023-02-22 13:34:40	\N
2106	2332	2106	2023-02-22 13:34:40	\N
2107	2333	2107	2023-02-22 13:34:40	\N
2108	2334	2108	2023-02-22 13:34:40	\N
2109	2335	2109	2023-02-22 13:34:40	\N
2110	2336	2110	2023-02-22 13:34:40	\N
2111	2337	2111	2023-02-22 13:34:40	\N
2112	2338	2112	2023-02-22 13:34:40	\N
2113	2339	2113	2023-02-22 13:34:40	\N
2114	2340	2114	2023-02-22 13:34:40	\N
2115	2341	2115	2023-02-22 13:34:40	\N
2116	2342	2116	2023-02-22 13:34:40	\N
2117	2343	2117	2023-02-22 13:34:40	\N
2118	2344	2118	2023-02-22 13:34:40	\N
2119	2345	2119	2023-02-22 13:34:40	\N
2120	2346	2120	2023-02-22 13:34:40	\N
2121	2347	2121	2023-02-22 13:34:40	\N
2122	2348	2122	2023-02-22 13:34:40	\N
2123	2349	2123	2023-02-22 13:34:40	\N
2124	2350	2124	2023-02-22 13:34:40	\N
2125	2351	2125	2023-02-22 13:34:40	\N
2126	2352	2126	2023-02-22 13:34:40	\N
2127	2353	2127	2023-02-22 13:34:40	\N
2128	2354	2128	2023-02-22 13:34:40	\N
2129	2355	2129	2023-02-22 13:34:40	\N
2130	2356	2130	2023-02-22 13:34:40	\N
2131	2357	2131	2023-02-22 13:34:40	\N
2132	2358	2132	2023-02-22 13:34:40	\N
2133	2359	2133	2023-02-22 13:34:40	\N
2134	2360	2134	2023-02-22 13:34:40	\N
2135	2361	2135	2023-02-22 13:34:40	\N
2136	2362	2136	2023-02-22 13:34:40	\N
2137	2363	2137	2023-02-22 13:34:40	\N
2138	2364	2138	2023-02-22 13:34:40	\N
2139	2365	2139	2023-02-22 13:34:40	\N
2140	4077	2140	2023-02-22 13:35:01	\N
2141	4078	2141	2023-02-22 13:35:01	\N
2142	4079	2142	2023-02-22 13:35:01	\N
2143	4080	2143	2023-02-22 13:35:01	\N
2144	4081	2144	2023-02-22 13:35:01	\N
2145	4082	2145	2023-02-22 13:35:01	\N
2146	4083	2146	2023-02-22 13:35:01	\N
2147	4084	2147	2023-02-22 13:35:01	\N
2148	4085	2148	2023-02-22 13:35:01	\N
2149	4086	2149	2023-02-22 13:35:01	\N
2150	4087	2150	2023-02-22 13:35:01	\N
2151	4088	2151	2023-02-22 13:35:01	\N
2152	4089	2152	2023-02-22 13:35:01	\N
2153	4090	2153	2023-02-22 13:35:01	\N
2154	4091	2154	2023-02-22 13:35:01	\N
2155	4092	2155	2023-02-22 13:35:01	\N
2156	4093	2156	2023-02-22 13:35:01	\N
2157	4094	2157	2023-02-22 13:35:02	\N
2158	4095	2158	2023-02-22 13:35:02	\N
2159	4096	2159	2023-02-22 13:35:02	\N
2160	4097	2160	2023-02-22 13:35:02	\N
2161	4098	2161	2023-02-22 13:35:02	\N
2162	4099	2162	2023-02-22 13:35:02	\N
2163	4100	2163	2023-02-22 13:35:02	\N
2164	4101	2164	2023-02-22 13:35:02	\N
2165	4102	2165	2023-02-22 13:35:02	\N
2166	4103	2166	2023-02-22 13:35:02	\N
2167	4104	2167	2023-02-22 13:35:02	\N
2168	4105	2168	2023-02-22 13:35:02	\N
2169	4106	2169	2023-02-22 13:35:02	\N
2170	4107	2170	2023-02-22 13:35:02	\N
2171	4108	2171	2023-02-22 13:35:02	\N
2172	4109	2172	2023-02-22 13:35:02	\N
2173	4110	2173	2023-02-22 13:35:02	\N
2174	4111	2174	2023-02-22 13:35:02	\N
2175	4112	2175	2023-02-22 13:35:02	\N
2176	4113	2176	2023-02-22 13:35:02	\N
2177	4114	2177	2023-02-22 13:35:02	\N
2178	4115	2178	2023-02-22 13:35:02	\N
2179	4116	2179	2023-02-22 13:35:02	\N
2180	4117	2180	2023-02-22 13:35:02	\N
2181	4118	2181	2023-02-22 13:35:02	\N
2182	4119	2182	2023-02-22 13:35:02	\N
2183	4120	2183	2023-02-22 13:35:02	\N
2184	4121	2184	2023-02-22 13:35:02	\N
2185	4122	2185	2023-02-22 13:35:02	\N
2186	4123	2186	2023-02-22 13:35:02	\N
2187	4124	2187	2023-02-22 13:35:02	\N
2188	4125	2188	2023-02-22 13:35:02	\N
2189	4126	2189	2023-02-22 13:35:02	\N
2190	4127	2190	2023-02-22 13:35:02	\N
2191	4128	2191	2023-02-22 13:35:02	\N
2192	4129	2192	2023-02-22 13:35:02	\N
2193	4130	2193	2023-02-22 13:35:02	\N
2194	4131	2194	2023-02-22 13:35:02	\N
2195	4132	2195	2023-02-22 13:35:02	\N
2196	4133	2196	2023-02-22 13:35:02	\N
2197	4134	2197	2023-02-22 13:35:02	\N
2198	4135	2198	2023-02-22 13:35:02	\N
2199	4136	2199	2023-02-22 13:35:02	\N
2200	4137	2200	2023-02-22 13:35:02	\N
2201	4138	2201	2023-02-22 13:35:02	\N
2202	4139	2202	2023-02-22 13:35:02	\N
2203	4140	2203	2023-02-22 13:35:02	\N
2204	4141	2204	2023-02-22 13:35:02	\N
2205	4142	2205	2023-02-22 13:35:02	\N
2206	4143	2206	2023-02-22 13:35:02	\N
2207	4144	2207	2023-02-22 13:35:02	\N
2208	4145	2208	2023-02-22 13:35:02	\N
2209	4146	2209	2023-02-22 13:35:02	\N
2210	4147	2210	2023-02-22 13:35:02	\N
2211	4148	2211	2023-02-22 13:35:02	\N
2212	4149	2212	2023-02-22 13:35:02	\N
2213	4150	2213	2023-02-22 13:35:02	\N
2214	4151	2214	2023-02-22 13:35:02	\N
2215	4152	2215	2023-02-22 13:35:02	\N
2216	4153	2216	2023-02-22 13:35:02	\N
2217	4154	2217	2023-02-22 13:35:02	\N
2218	4155	2218	2023-02-22 13:35:02	\N
2219	4156	2219	2023-02-22 13:35:02	\N
2220	4157	2220	2023-02-22 13:35:02	\N
2221	4158	2221	2023-02-22 13:35:02	\N
2222	4159	2222	2023-02-22 13:35:02	\N
2223	4160	2223	2023-02-22 13:35:02	\N
2224	4161	2224	2023-02-22 13:35:02	\N
2225	4162	2225	2023-02-22 13:35:02	\N
2226	4163	2226	2023-02-22 13:35:02	\N
2227	4164	2227	2023-02-22 13:35:02	\N
2228	4165	2228	2023-02-22 13:35:02	\N
2229	4166	2229	2023-02-22 13:35:02	\N
2230	4167	2230	2023-02-22 13:35:02	\N
2231	4168	2231	2023-02-22 13:35:02	\N
2232	4169	2232	2023-02-22 13:35:02	\N
2233	4170	2233	2023-02-22 13:35:02	\N
2234	4171	2234	2023-02-22 13:35:02	\N
2235	4172	2235	2023-02-22 13:35:02	\N
2236	4173	2236	2023-02-22 13:35:02	\N
2237	4174	2237	2023-02-22 13:35:02	\N
2238	4175	2238	2023-02-22 13:35:02	\N
2239	4176	2239	2023-02-22 13:35:02	\N
2240	4177	2240	2023-02-22 13:35:02	\N
2241	4178	2241	2023-02-22 13:35:02	\N
2242	4179	2242	2023-02-22 13:35:02	\N
2243	4180	2243	2023-02-22 13:35:02	\N
2244	4181	2244	2023-02-22 13:35:02	\N
2245	4182	2245	2023-02-22 13:35:02	\N
2246	4183	2246	2023-02-22 13:35:02	\N
2247	4184	2247	2023-02-22 13:35:02	\N
2248	4185	2248	2023-02-22 13:35:02	\N
2249	4186	2249	2023-02-22 13:35:02	\N
2250	4187	2250	2023-02-22 13:35:02	\N
2251	4188	2251	2023-02-22 13:35:02	\N
2252	4189	2252	2023-02-22 13:35:02	\N
2253	4190	2253	2023-02-22 13:35:02	\N
2254	4191	2254	2023-02-22 13:35:02	\N
2255	4192	2255	2023-02-22 13:35:02	\N
2256	4193	2256	2023-02-22 13:35:02	\N
2257	4194	2257	2023-02-22 13:35:02	\N
2258	4195	2258	2023-02-22 13:35:02	\N
2259	4196	2259	2023-02-22 13:35:02	\N
2260	4197	2260	2023-02-22 13:35:02	\N
2261	4198	2261	2023-02-22 13:35:02	\N
2262	4199	2262	2023-02-22 13:35:02	\N
2263	4200	2263	2023-02-22 13:35:02	\N
2264	4201	2264	2023-02-22 13:35:02	\N
2265	4202	2265	2023-02-22 13:35:02	\N
2266	4203	2266	2023-02-22 13:35:02	\N
2267	4204	2267	2023-02-22 13:35:02	\N
2268	4205	2268	2023-02-22 13:35:02	\N
2269	4206	2269	2023-02-22 13:35:02	\N
2270	4207	2270	2023-02-22 13:35:02	\N
2271	4208	2271	2023-02-22 13:35:02	\N
2272	4209	2272	2023-02-22 13:35:02	\N
2273	4210	2273	2023-02-22 13:35:02	\N
2274	4211	2274	2023-02-22 13:35:02	\N
2275	4212	2275	2023-02-22 13:35:02	\N
2276	3949	2276	2023-02-22 13:35:29	\N
2277	3950	2277	2023-02-22 13:35:29	\N
2278	3951	2278	2023-02-22 13:35:29	\N
2279	3952	2279	2023-02-22 13:35:29	\N
2280	3953	2280	2023-02-22 13:35:29	\N
2281	3954	2281	2023-02-22 13:35:29	\N
2282	3955	2282	2023-02-22 13:35:29	\N
2283	3956	2283	2023-02-22 13:35:29	\N
2284	3957	2284	2023-02-22 13:35:29	\N
2285	3958	2285	2023-02-22 13:35:29	\N
2286	3959	2286	2023-02-22 13:35:29	\N
2287	3960	2287	2023-02-22 13:35:29	\N
2288	3961	2288	2023-02-22 13:35:29	\N
2289	3962	2289	2023-02-22 13:35:29	\N
2290	3963	2290	2023-02-22 13:35:29	\N
2291	3964	2291	2023-02-22 13:35:29	\N
2292	3965	2292	2023-02-22 13:35:29	\N
2293	3966	2293	2023-02-22 13:35:29	\N
2294	3967	2294	2023-02-22 13:35:29	\N
2295	3968	2295	2023-02-22 13:35:29	\N
2296	3969	2296	2023-02-22 13:35:29	\N
2297	3970	2297	2023-02-22 13:35:29	\N
2298	3971	2298	2023-02-22 13:35:29	\N
2299	3972	2299	2023-02-22 13:35:29	\N
2300	3973	2300	2023-02-22 13:35:29	\N
2301	3974	2301	2023-02-22 13:35:29	\N
2302	3975	2302	2023-02-22 13:35:29	\N
2303	3976	2303	2023-02-22 13:35:29	\N
2304	3977	2304	2023-02-22 13:35:29	\N
2305	3978	2305	2023-02-22 13:35:29	\N
2306	3979	2306	2023-02-22 13:35:29	\N
2307	3980	2307	2023-02-22 13:35:29	\N
2308	3981	2308	2023-02-22 13:35:29	\N
2309	3982	2309	2023-02-22 13:35:29	\N
2310	3983	2310	2023-02-22 13:35:29	\N
2311	3984	2311	2023-02-22 13:35:29	\N
2312	3985	2312	2023-02-22 13:35:29	\N
2313	3986	2313	2023-02-22 13:35:29	\N
2314	3987	2314	2023-02-22 13:35:29	\N
2315	3988	2315	2023-02-22 13:35:29	\N
2316	3989	2316	2023-02-22 13:35:29	\N
2317	3990	2317	2023-02-22 13:35:29	\N
2318	3991	2318	2023-02-22 13:35:29	\N
2319	3992	2319	2023-02-22 13:35:29	\N
2320	3993	2320	2023-02-22 13:35:29	\N
2321	3994	2321	2023-02-22 13:35:29	\N
2322	3995	2322	2023-02-22 13:35:29	\N
2323	3996	2323	2023-02-22 13:35:29	\N
2324	3997	2324	2023-02-22 13:35:29	\N
2325	3998	2325	2023-02-22 13:35:29	\N
2326	3999	2326	2023-02-22 13:35:29	\N
2327	4000	2327	2023-02-22 13:35:29	\N
2328	4001	2328	2023-02-22 13:35:29	\N
2329	4002	2329	2023-02-22 13:35:29	\N
2330	4003	2330	2023-02-22 13:35:29	\N
2331	4004	2331	2023-02-22 13:35:29	\N
2332	4005	2332	2023-02-22 13:35:29	\N
2333	4006	2333	2023-02-22 13:35:29	\N
2334	4007	2334	2023-02-22 13:35:29	\N
2335	4008	2335	2023-02-22 13:35:29	\N
2336	4009	2336	2023-02-22 13:35:29	\N
2337	4010	2337	2023-02-22 13:35:29	\N
2338	4011	2338	2023-02-22 13:35:29	\N
2339	4012	2339	2023-02-22 13:35:29	\N
2340	4013	2340	2023-02-22 13:35:29	\N
2341	4014	2341	2023-02-22 13:35:29	\N
2342	4015	2342	2023-02-22 13:35:29	\N
2343	4016	2343	2023-02-22 13:35:29	\N
2344	4017	2344	2023-02-22 13:35:29	\N
2345	4018	2345	2023-02-22 13:35:29	\N
2346	4019	2346	2023-02-22 13:35:29	\N
2348	4021	2348	2023-02-22 13:35:29	\N
2349	4022	2349	2023-02-22 13:35:29	\N
2350	4023	2350	2023-02-22 13:35:29	\N
2351	4024	2351	2023-02-22 13:35:29	\N
2352	4025	2352	2023-02-22 13:35:29	\N
2353	4026	2353	2023-02-22 13:35:29	\N
2354	4027	2354	2023-02-22 13:35:29	\N
2355	4028	2355	2023-02-22 13:35:29	\N
2356	4029	2356	2023-02-22 13:35:29	\N
2357	4030	2357	2023-02-22 13:35:29	\N
2358	4031	2358	2023-02-22 13:35:29	\N
2359	4032	2359	2023-02-22 13:35:29	\N
2360	4033	2360	2023-02-22 13:35:29	\N
2361	4034	2361	2023-02-22 13:35:29	\N
2362	4035	2362	2023-02-22 13:35:29	\N
2363	4036	2363	2023-02-22 13:35:29	\N
2364	4037	2364	2023-02-22 13:35:29	\N
2365	4038	2365	2023-02-22 13:35:29	\N
2366	4039	2366	2023-02-22 13:35:29	\N
2367	4040	2367	2023-02-22 13:35:29	\N
2368	4041	2368	2023-02-22 13:35:29	\N
2369	4042	2369	2023-02-22 13:35:29	\N
2370	4043	2370	2023-02-22 13:35:29	\N
2371	4044	2371	2023-02-22 13:35:29	\N
2372	4045	2372	2023-02-22 13:35:29	\N
2373	4046	2373	2023-02-22 13:35:29	\N
2374	4047	2374	2023-02-22 13:35:29	\N
2375	4048	2375	2023-02-22 13:35:29	\N
2376	4049	2376	2023-02-22 13:35:29	\N
2377	4050	2377	2023-02-22 13:35:29	\N
2378	4051	2378	2023-02-22 13:35:29	\N
2379	4052	2379	2023-02-22 13:35:29	\N
2380	4053	2380	2023-02-22 13:35:29	\N
2381	4054	2381	2023-02-22 13:35:29	\N
2382	4055	2382	2023-02-22 13:35:29	\N
2383	4056	2383	2023-02-22 13:35:29	\N
2384	4057	2384	2023-02-22 13:35:29	\N
2385	4058	2385	2023-02-22 13:35:29	\N
2386	4059	2386	2023-02-22 13:35:29	\N
2387	4060	2387	2023-02-22 13:35:29	\N
2388	4061	2388	2023-02-22 13:35:29	\N
2389	4062	2389	2023-02-22 13:35:29	\N
2390	4063	2390	2023-02-22 13:35:29	\N
2391	4064	2391	2023-02-22 13:35:29	\N
2392	4065	2392	2023-02-22 13:35:29	\N
2393	4066	2393	2023-02-22 13:35:29	\N
2394	4067	2394	2023-02-22 13:35:30	\N
2395	4068	2395	2023-02-22 13:35:30	\N
2396	4069	2396	2023-02-22 13:35:30	\N
2397	4070	2397	2023-02-22 13:35:30	\N
2398	4071	2398	2023-02-22 13:35:30	\N
2399	4072	2399	2023-02-22 13:35:30	\N
2400	4073	2400	2023-02-22 13:35:30	\N
2401	4074	2401	2023-02-22 13:35:30	\N
2402	4075	2402	2023-02-22 13:35:30	\N
2403	4076	2403	2023-02-22 13:35:30	\N
2404	4213	2404	2023-02-22 13:35:52	\N
2405	4214	2405	2023-02-22 13:35:52	\N
2406	4215	2406	2023-02-22 13:35:52	\N
2407	4216	2407	2023-02-22 13:35:52	\N
2408	4217	2408	2023-02-22 13:35:52	\N
2409	4218	2409	2023-02-22 13:35:52	\N
2410	4219	2410	2023-02-22 13:35:52	\N
2411	4220	2411	2023-02-22 13:35:52	\N
2412	4221	2412	2023-02-22 13:35:52	\N
2413	4222	2413	2023-02-22 13:35:52	\N
2414	4223	2414	2023-02-22 13:35:52	\N
2415	4224	2415	2023-02-22 13:35:52	\N
2416	4225	2416	2023-02-22 13:35:52	\N
2417	4226	2417	2023-02-22 13:35:52	\N
2418	4227	2418	2023-02-22 13:35:52	\N
2419	4228	2419	2023-02-22 13:35:52	\N
2420	4229	2420	2023-02-22 13:36:18	\N
2421	4230	2421	2023-02-22 13:36:18	\N
2422	4231	2422	2023-02-22 13:36:18	\N
2423	4232	2423	2023-02-22 13:36:18	\N
2424	4233	2424	2023-02-22 13:36:18	\N
2425	4234	2425	2023-02-22 13:36:18	\N
2426	4235	2426	2023-02-22 13:36:18	\N
2427	4236	2427	2023-02-22 13:36:18	\N
2428	4237	2428	2023-02-22 13:36:18	\N
2429	4238	2429	2023-02-22 13:36:18	\N
2430	4239	2430	2023-02-22 13:36:18	\N
2431	4240	2431	2023-02-22 13:36:18	\N
2432	4241	2432	2023-02-22 13:36:18	\N
2433	4242	2433	2023-02-22 13:36:18	\N
2434	4243	2434	2023-02-22 13:36:18	\N
2435	4244	2435	2023-02-22 13:36:18	\N
2436	4245	2436	2023-02-22 13:36:18	\N
2437	4246	2437	2023-02-22 13:36:18	\N
2438	4247	2438	2023-02-22 13:36:18	\N
2439	4248	2439	2023-02-22 13:36:18	\N
2440	4249	2440	2023-02-22 13:36:18	\N
2441	4250	2441	2023-02-22 13:36:18	\N
2442	4251	2442	2023-02-22 13:36:18	\N
2443	4252	2443	2023-02-22 13:36:18	\N
2444	4253	2444	2023-02-22 13:36:18	\N
2445	4254	2445	2023-02-22 13:36:18	\N
2446	4255	2446	2023-02-22 13:36:18	\N
2447	4256	2447	2023-02-22 13:36:18	\N
2448	4257	2448	2023-02-22 13:36:18	\N
2449	4258	2449	2023-02-22 13:36:18	\N
2450	4259	2450	2023-02-22 13:36:18	\N
2451	4260	2451	2023-02-22 13:36:18	\N
2452	4261	2452	2023-02-22 13:36:18	\N
2453	4262	2453	2023-02-22 13:36:18	\N
2454	4263	2454	2023-02-22 13:36:18	\N
2455	4264	2455	2023-02-22 13:36:18	\N
2456	4265	2456	2023-02-22 13:36:18	\N
2457	4266	2457	2023-02-22 13:36:18	\N
2458	4267	2458	2023-02-22 13:36:18	\N
2459	4268	2459	2023-02-22 13:36:18	\N
2460	4269	2460	2023-02-22 13:36:18	\N
2461	4270	2461	2023-02-22 13:36:18	\N
2462	4271	2462	2023-02-22 13:36:18	\N
2463	4272	2463	2023-02-22 13:36:18	\N
2464	4273	2464	2023-02-22 13:36:18	\N
2465	4274	2465	2023-02-22 13:36:18	\N
\.


--
-- Data for Name: map_boq_sos; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.map_boq_sos (id, boq_id, sos_id, created_at, updated_at) FROM stdin;
17	1	2	2023-02-05 08:18:23	\N
18	2	2	2023-02-05 08:18:23	\N
19	3	2	2023-02-05 08:18:23	\N
20	4	2	2023-02-05 08:18:23	\N
21	5	2	2023-02-05 08:18:23	\N
22	6	2	2023-02-05 08:18:23	\N
23	7	2	2023-02-05 08:18:23	\N
24	8	2	2023-02-05 08:18:23	\N
25	9	2	2023-02-05 08:18:23	\N
26	10	2	2023-02-05 08:18:23	\N
27	11	2	2023-02-05 08:18:23	\N
28	12	2	2023-02-05 08:18:23	\N
29	13	2	2023-02-05 08:18:23	\N
30	14	2	2023-02-05 08:18:23	\N
31	15	2	2023-02-05 08:18:23	\N
32	16	2	2023-02-05 08:18:23	\N
33	17	3	2023-02-05 09:24:04	\N
34	18	3	2023-02-05 09:24:04	\N
35	19	3	2023-02-05 09:24:04	\N
36	20	3	2023-02-05 09:24:04	\N
37	21	3	2023-02-05 09:24:04	\N
38	22	3	2023-02-05 09:24:04	\N
39	23	3	2023-02-05 09:24:04	\N
40	24	3	2023-02-05 09:24:04	\N
41	25	3	2023-02-05 09:24:04	\N
42	26	3	2023-02-05 09:24:04	\N
43	27	3	2023-02-05 09:24:04	\N
44	28	3	2023-02-05 09:24:04	\N
45	29	3	2023-02-05 09:24:04	\N
46	30	3	2023-02-05 09:24:04	\N
47	31	3	2023-02-05 09:24:04	\N
48	32	3	2023-02-05 09:24:04	\N
49	33	3	2023-02-05 09:24:04	\N
50	34	3	2023-02-05 09:24:04	\N
51	35	3	2023-02-05 09:24:04	\N
52	36	3	2023-02-05 09:24:04	\N
53	37	3	2023-02-05 09:24:04	\N
54	38	3	2023-02-05 09:24:04	\N
55	39	3	2023-02-05 09:24:04	\N
56	40	3	2023-02-05 09:24:04	\N
57	41	3	2023-02-05 09:24:04	\N
58	42	3	2023-02-05 09:24:04	\N
59	43	3	2023-02-05 09:24:04	\N
60	44	3	2023-02-05 09:24:04	\N
61	45	3	2023-02-05 09:24:04	\N
62	46	3	2023-02-05 09:24:04	\N
63	47	3	2023-02-05 09:24:04	\N
64	48	3	2023-02-05 09:24:04	\N
65	49	3	2023-02-05 09:24:04	\N
66	50	3	2023-02-05 09:24:04	\N
67	51	3	2023-02-05 09:24:04	\N
78	69	5	2023-02-06 01:09:47	\N
79	52	5	2023-02-06 01:09:47	\N
80	53	5	2023-02-06 01:09:47	\N
81	54	5	2023-02-06 01:09:47	\N
82	55	5	2023-02-06 01:09:47	\N
83	56	5	2023-02-06 01:09:47	\N
84	57	5	2023-02-06 01:09:47	\N
85	58	5	2023-02-06 01:09:47	\N
86	59	5	2023-02-06 01:09:47	\N
87	60	5	2023-02-06 01:09:47	\N
88	61	5	2023-02-06 01:09:47	\N
89	62	5	2023-02-06 01:09:47	\N
90	63	5	2023-02-06 01:09:47	\N
91	64	5	2023-02-06 01:09:47	\N
92	65	5	2023-02-06 01:09:47	\N
93	66	5	2023-02-06 01:09:47	\N
94	67	5	2023-02-06 01:09:47	\N
95	68	5	2023-02-06 01:09:47	\N
96	70	5	2023-02-06 01:09:47	\N
97	71	6	2023-02-06 01:51:51	\N
98	72	6	2023-02-06 01:51:51	\N
99	73	6	2023-02-06 01:51:51	\N
100	74	6	2023-02-06 01:51:51	\N
101	75	6	2023-02-06 01:51:51	\N
102	76	6	2023-02-06 01:51:51	\N
103	77	6	2023-02-06 01:51:51	\N
104	78	6	2023-02-06 01:51:51	\N
105	79	6	2023-02-06 01:51:51	\N
106	80	6	2023-02-06 01:51:51	\N
107	81	6	2023-02-06 01:51:51	\N
108	82	6	2023-02-06 01:51:51	\N
109	83	6	2023-02-06 01:51:51	\N
110	84	6	2023-02-06 01:51:51	\N
111	85	6	2023-02-06 01:51:51	\N
112	86	6	2023-02-06 01:51:51	\N
113	87	6	2023-02-06 01:51:51	\N
114	88	6	2023-02-06 01:51:51	\N
115	89	6	2023-02-06 01:51:51	\N
116	90	6	2023-02-06 01:51:51	\N
117	91	6	2023-02-06 01:51:51	\N
118	92	6	2023-02-06 01:51:51	\N
119	93	6	2023-02-06 01:51:51	\N
120	94	6	2023-02-06 01:51:51	\N
121	95	6	2023-02-06 01:51:51	\N
122	96	6	2023-02-06 01:51:51	\N
123	97	6	2023-02-06 01:51:51	\N
124	98	7	2023-02-06 02:24:57	\N
125	99	7	2023-02-06 02:24:57	\N
126	100	7	2023-02-06 02:24:57	\N
127	101	7	2023-02-06 02:24:57	\N
128	102	7	2023-02-06 02:24:57	\N
129	103	7	2023-02-06 02:24:57	\N
130	104	7	2023-02-06 02:24:57	\N
131	105	7	2023-02-06 02:24:57	\N
132	106	7	2023-02-06 02:24:57	\N
133	107	7	2023-02-06 02:24:57	\N
134	108	7	2023-02-06 02:24:57	\N
135	109	7	2023-02-06 02:24:57	\N
136	110	7	2023-02-06 02:24:57	\N
137	111	7	2023-02-06 02:24:57	\N
138	112	7	2023-02-06 02:24:57	\N
139	113	7	2023-02-06 02:24:57	\N
140	114	7	2023-02-06 02:24:57	\N
141	115	7	2023-02-06 02:24:57	\N
142	116	7	2023-02-06 02:24:57	\N
143	117	7	2023-02-06 02:24:57	\N
144	118	7	2023-02-06 02:24:57	\N
145	119	7	2023-02-06 02:24:57	\N
146	120	7	2023-02-06 02:24:57	\N
147	121	7	2023-02-06 02:24:57	\N
148	122	7	2023-02-06 02:24:57	\N
149	123	7	2023-02-06 02:24:57	\N
150	124	7	2023-02-06 02:24:57	\N
151	125	7	2023-02-06 02:24:57	\N
152	126	7	2023-02-06 02:24:57	\N
153	127	7	2023-02-06 02:24:57	\N
154	128	7	2023-02-06 02:24:57	\N
155	129	7	2023-02-06 02:24:57	\N
156	130	7	2023-02-06 02:24:57	\N
157	131	7	2023-02-06 02:24:57	\N
158	132	7	2023-02-06 02:24:57	\N
159	133	7	2023-02-06 02:24:57	\N
160	134	7	2023-02-06 02:24:57	\N
161	135	7	2023-02-06 02:24:57	\N
162	136	7	2023-02-06 02:24:57	\N
163	137	7	2023-02-06 02:24:57	\N
164	138	7	2023-02-06 02:24:57	\N
165	139	7	2023-02-06 02:24:57	\N
166	140	7	2023-02-06 02:24:57	\N
167	141	7	2023-02-06 02:24:57	\N
168	142	7	2023-02-06 02:24:57	\N
169	143	7	2023-02-06 02:24:57	\N
170	144	7	2023-02-06 02:24:57	\N
171	145	7	2023-02-06 02:24:57	\N
172	146	7	2023-02-06 02:24:57	\N
173	147	7	2023-02-06 02:24:57	\N
174	148	7	2023-02-06 02:24:57	\N
175	149	7	2023-02-06 02:24:57	\N
177	151	9	2023-02-22 03:42:29	\N
178	152	9	2023-02-22 03:42:29	\N
179	153	9	2023-02-22 03:42:29	\N
180	154	9	2023-02-22 03:42:29	\N
181	155	9	2023-02-22 03:42:29	\N
182	156	9	2023-02-22 03:42:29	\N
183	157	9	2023-02-22 03:42:29	\N
184	158	9	2023-02-22 03:42:29	\N
185	159	9	2023-02-22 03:42:29	\N
186	160	9	2023-02-22 03:42:29	\N
187	161	9	2023-02-22 03:42:29	\N
188	162	9	2023-02-22 03:42:29	\N
189	163	9	2023-02-22 03:42:29	\N
190	164	9	2023-02-22 03:42:29	\N
191	165	9	2023-02-22 03:42:29	\N
192	166	9	2023-02-22 03:42:29	\N
193	167	9	2023-02-22 03:42:29	\N
194	168	9	2023-02-22 03:42:29	\N
195	169	9	2023-02-22 03:42:29	\N
196	170	9	2023-02-22 03:42:29	\N
197	171	9	2023-02-22 03:42:29	\N
198	172	9	2023-02-22 03:42:29	\N
199	173	9	2023-02-22 03:42:29	\N
200	174	9	2023-02-22 03:42:29	\N
201	175	9	2023-02-22 03:42:29	\N
202	176	9	2023-02-22 03:42:29	\N
203	177	9	2023-02-22 03:42:29	\N
204	178	9	2023-02-22 03:42:29	\N
205	179	9	2023-02-22 03:42:29	\N
206	180	9	2023-02-22 03:42:29	\N
207	181	9	2023-02-22 03:42:29	\N
208	182	9	2023-02-22 03:42:29	\N
209	183	9	2023-02-22 03:42:29	\N
210	184	9	2023-02-22 03:42:29	\N
211	185	9	2023-02-22 03:42:29	\N
212	186	9	2023-02-22 03:42:29	\N
213	187	9	2023-02-22 03:42:29	\N
214	188	9	2023-02-22 03:42:29	\N
215	189	9	2023-02-22 03:42:29	\N
216	190	9	2023-02-22 03:42:29	\N
217	191	9	2023-02-22 03:42:29	\N
218	192	9	2023-02-22 03:42:29	\N
219	193	9	2023-02-22 03:42:29	\N
220	194	9	2023-02-22 03:42:29	\N
221	195	9	2023-02-22 03:42:29	\N
222	196	9	2023-02-22 03:42:29	\N
223	197	9	2023-02-22 03:42:29	\N
224	198	9	2023-02-22 03:42:29	\N
225	199	9	2023-02-22 03:42:29	\N
226	200	9	2023-02-22 03:42:29	\N
227	201	9	2023-02-22 03:42:29	\N
228	202	9	2023-02-22 03:42:29	\N
229	203	9	2023-02-22 03:42:29	\N
230	204	9	2023-02-22 03:42:29	\N
231	205	9	2023-02-22 03:42:29	\N
232	206	9	2023-02-22 03:42:29	\N
233	207	9	2023-02-22 03:42:29	\N
234	208	9	2023-02-22 03:42:29	\N
235	209	9	2023-02-22 03:42:29	\N
236	210	9	2023-02-22 03:42:29	\N
237	211	9	2023-02-22 03:42:29	\N
238	212	9	2023-02-22 03:42:29	\N
239	213	9	2023-02-22 03:42:29	\N
240	214	9	2023-02-22 03:42:29	\N
241	215	9	2023-02-22 03:42:29	\N
242	216	9	2023-02-22 03:42:29	\N
243	217	9	2023-02-22 03:42:29	\N
244	218	9	2023-02-22 03:42:29	\N
245	219	9	2023-02-22 03:42:29	\N
246	220	9	2023-02-22 03:42:29	\N
247	221	9	2023-02-22 03:42:29	\N
248	222	9	2023-02-22 03:42:29	\N
249	223	9	2023-02-22 03:42:29	\N
250	224	9	2023-02-22 03:42:29	\N
251	225	9	2023-02-22 03:42:29	\N
252	226	9	2023-02-22 03:42:29	\N
253	227	9	2023-02-22 03:42:29	\N
254	228	9	2023-02-22 03:42:29	\N
255	229	9	2023-02-22 03:42:29	\N
256	230	9	2023-02-22 03:42:29	\N
257	231	9	2023-02-22 03:42:29	\N
258	232	9	2023-02-22 03:42:29	\N
259	233	9	2023-02-22 03:42:29	\N
260	234	9	2023-02-22 03:42:29	\N
262	2408	11	2023-02-22 09:56:04	\N
263	2409	11	2023-02-22 09:56:04	\N
264	2410	11	2023-02-22 09:56:04	\N
265	2411	11	2023-02-22 09:56:04	\N
266	2412	11	2023-02-22 09:56:04	\N
267	2413	11	2023-02-22 09:56:04	\N
268	2414	11	2023-02-22 09:56:04	\N
269	2415	11	2023-02-22 09:56:04	\N
270	2416	11	2023-02-22 09:56:04	\N
271	2417	11	2023-02-22 09:56:04	\N
272	2418	11	2023-02-22 09:56:04	\N
273	2419	11	2023-02-22 09:56:04	\N
274	2420	11	2023-02-22 09:56:04	\N
275	2421	11	2023-02-22 09:56:04	\N
276	2422	11	2023-02-22 09:56:04	\N
277	2423	11	2023-02-22 09:56:04	\N
278	2424	11	2023-02-22 09:56:04	\N
279	2425	11	2023-02-22 09:56:04	\N
280	2426	11	2023-02-22 09:56:04	\N
281	2427	11	2023-02-22 09:56:04	\N
282	2428	11	2023-02-22 09:56:04	\N
283	2429	11	2023-02-22 09:56:04	\N
284	2430	11	2023-02-22 09:56:04	\N
285	2431	11	2023-02-22 09:56:04	\N
286	2432	11	2023-02-22 09:56:04	\N
287	2433	11	2023-02-22 09:56:04	\N
288	2434	11	2023-02-22 09:56:04	\N
289	2435	11	2023-02-22 09:56:04	\N
290	2436	11	2023-02-22 09:56:04	\N
291	2437	11	2023-02-22 09:56:04	\N
292	2438	11	2023-02-22 09:56:04	\N
293	2439	11	2023-02-22 09:56:04	\N
294	2440	11	2023-02-22 09:56:04	\N
295	2441	11	2023-02-22 09:56:04	\N
296	2442	11	2023-02-22 09:56:04	\N
297	2443	11	2023-02-22 09:56:04	\N
298	2444	11	2023-02-22 09:56:04	\N
299	2445	11	2023-02-22 09:56:04	\N
300	2446	11	2023-02-22 09:56:04	\N
301	2447	11	2023-02-22 09:56:04	\N
302	2448	11	2023-02-22 09:56:04	\N
303	2449	11	2023-02-22 09:56:04	\N
304	2450	11	2023-02-22 09:56:04	\N
305	2451	11	2023-02-22 09:56:04	\N
306	2452	11	2023-02-22 09:56:04	\N
307	2453	11	2023-02-22 09:56:04	\N
308	2454	11	2023-02-22 09:56:04	\N
309	2455	11	2023-02-22 09:56:04	\N
310	2456	11	2023-02-22 09:56:04	\N
311	2457	11	2023-02-22 09:56:04	\N
312	2458	11	2023-02-22 09:56:04	\N
313	2459	11	2023-02-22 09:56:04	\N
314	2460	11	2023-02-22 09:56:04	\N
315	2461	11	2023-02-22 09:56:04	\N
316	2462	11	2023-02-22 09:56:04	\N
317	2463	11	2023-02-22 09:56:04	\N
318	2464	11	2023-02-22 09:56:04	\N
319	2465	11	2023-02-22 09:56:04	\N
320	2466	11	2023-02-22 09:56:04	\N
321	2467	11	2023-02-22 09:56:04	\N
322	2468	11	2023-02-22 09:56:04	\N
323	2469	11	2023-02-22 09:56:04	\N
324	2470	11	2023-02-22 09:56:04	\N
325	2471	11	2023-02-22 09:56:04	\N
326	2472	11	2023-02-22 09:56:04	\N
327	2473	11	2023-02-22 09:56:04	\N
328	2474	11	2023-02-22 09:56:04	\N
329	2475	11	2023-02-22 09:56:04	\N
330	2476	11	2023-02-22 09:56:04	\N
331	2477	11	2023-02-22 09:56:04	\N
332	2478	11	2023-02-22 09:56:04	\N
333	2479	11	2023-02-22 09:56:04	\N
334	2480	11	2023-02-22 09:56:04	\N
335	2481	11	2023-02-22 09:56:04	\N
336	2482	11	2023-02-22 09:56:04	\N
337	2483	11	2023-02-22 09:56:04	\N
338	2484	11	2023-02-22 09:56:04	\N
339	2485	11	2023-02-22 09:56:04	\N
340	2486	11	2023-02-22 09:56:04	\N
341	2487	11	2023-02-22 09:56:04	\N
342	2488	11	2023-02-22 09:56:04	\N
343	2489	11	2023-02-22 09:56:04	\N
344	2490	11	2023-02-22 09:56:04	\N
345	2491	11	2023-02-22 09:56:04	\N
346	2492	11	2023-02-22 09:56:04	\N
347	2493	11	2023-02-22 09:56:04	\N
348	2494	11	2023-02-22 09:56:04	\N
349	2495	11	2023-02-22 09:56:04	\N
350	2496	11	2023-02-22 09:56:04	\N
351	2497	11	2023-02-22 09:56:04	\N
352	2498	11	2023-02-22 09:56:04	\N
353	2499	11	2023-02-22 09:56:04	\N
354	2500	11	2023-02-22 09:56:04	\N
355	2501	11	2023-02-22 09:56:04	\N
356	2502	11	2023-02-22 09:56:04	\N
357	2503	11	2023-02-22 09:56:04	\N
358	2504	11	2023-02-22 09:56:04	\N
359	2505	11	2023-02-22 09:56:04	\N
360	2506	11	2023-02-22 09:56:04	\N
361	2507	11	2023-02-22 09:56:04	\N
362	2508	11	2023-02-22 09:56:04	\N
363	2509	11	2023-02-22 09:56:04	\N
364	2510	11	2023-02-22 09:56:04	\N
365	2511	11	2023-02-22 09:56:04	\N
366	2512	11	2023-02-22 09:56:04	\N
367	2513	11	2023-02-22 09:56:04	\N
368	2514	11	2023-02-22 09:56:04	\N
369	2515	11	2023-02-22 09:56:04	\N
370	2516	11	2023-02-22 09:56:04	\N
371	2517	11	2023-02-22 09:56:04	\N
372	2518	11	2023-02-22 09:56:04	\N
373	2519	11	2023-02-22 09:56:04	\N
374	2520	11	2023-02-22 09:56:04	\N
375	2521	11	2023-02-22 09:56:04	\N
376	2522	11	2023-02-22 09:56:04	\N
377	2523	11	2023-02-22 09:56:04	\N
378	2524	11	2023-02-22 09:56:04	\N
379	2525	11	2023-02-22 09:56:04	\N
380	2526	11	2023-02-22 09:56:04	\N
381	2527	11	2023-02-22 09:56:04	\N
382	2528	11	2023-02-22 09:56:04	\N
383	2529	11	2023-02-22 09:56:04	\N
384	3745	12	2023-02-22 09:57:06	\N
385	3746	12	2023-02-22 09:57:06	\N
386	3747	12	2023-02-22 09:57:06	\N
387	3748	12	2023-02-22 09:57:06	\N
388	3749	12	2023-02-22 09:57:06	\N
389	3750	12	2023-02-22 09:57:06	\N
390	3751	12	2023-02-22 09:57:06	\N
391	3752	12	2023-02-22 09:57:06	\N
392	3753	12	2023-02-22 09:57:06	\N
393	3754	12	2023-02-22 09:57:06	\N
394	3755	12	2023-02-22 09:57:06	\N
395	3756	12	2023-02-22 09:57:06	\N
396	3757	12	2023-02-22 09:57:06	\N
397	3758	12	2023-02-22 09:57:06	\N
398	3759	12	2023-02-22 09:57:06	\N
399	3760	12	2023-02-22 09:57:06	\N
400	3761	12	2023-02-22 09:57:06	\N
401	3762	12	2023-02-22 09:57:06	\N
402	3763	12	2023-02-22 09:57:06	\N
403	3764	12	2023-02-22 09:57:06	\N
404	3765	12	2023-02-22 09:57:06	\N
405	3766	12	2023-02-22 09:57:06	\N
406	3767	12	2023-02-22 09:57:06	\N
407	3768	12	2023-02-22 09:57:06	\N
408	3769	12	2023-02-22 09:57:06	\N
409	3770	12	2023-02-22 09:57:06	\N
410	3771	12	2023-02-22 09:57:06	\N
411	3772	12	2023-02-22 09:57:06	\N
412	3773	12	2023-02-22 09:57:06	\N
413	3774	12	2023-02-22 09:57:06	\N
414	3775	12	2023-02-22 09:57:06	\N
415	3776	12	2023-02-22 09:57:06	\N
416	3777	12	2023-02-22 09:57:06	\N
417	3778	12	2023-02-22 09:57:06	\N
418	3779	12	2023-02-22 09:57:06	\N
419	3780	12	2023-02-22 09:57:06	\N
420	3781	12	2023-02-22 09:57:06	\N
421	3782	12	2023-02-22 09:57:06	\N
422	3783	12	2023-02-22 09:57:06	\N
423	3784	12	2023-02-22 09:57:06	\N
424	3785	12	2023-02-22 09:57:06	\N
425	3786	12	2023-02-22 09:57:06	\N
426	3787	12	2023-02-22 09:57:06	\N
427	3788	12	2023-02-22 09:57:06	\N
428	3789	12	2023-02-22 09:57:06	\N
429	3790	12	2023-02-22 09:57:06	\N
430	3791	12	2023-02-22 09:57:06	\N
431	3792	12	2023-02-22 09:57:06	\N
432	3793	12	2023-02-22 09:57:06	\N
433	3794	12	2023-02-22 09:57:06	\N
434	3795	12	2023-02-22 09:57:06	\N
435	3796	12	2023-02-22 09:57:06	\N
436	3797	12	2023-02-22 09:57:06	\N
437	3798	12	2023-02-22 09:57:06	\N
438	3799	12	2023-02-22 09:57:06	\N
439	3800	12	2023-02-22 09:57:06	\N
440	3801	12	2023-02-22 09:57:06	\N
441	3802	12	2023-02-22 09:57:06	\N
442	3803	12	2023-02-22 09:57:06	\N
443	3804	12	2023-02-22 09:57:06	\N
444	3805	12	2023-02-22 09:57:06	\N
445	3806	12	2023-02-22 09:57:06	\N
446	3807	12	2023-02-22 09:57:06	\N
447	3808	12	2023-02-22 09:57:06	\N
448	3809	12	2023-02-22 09:57:06	\N
449	3810	12	2023-02-22 09:57:06	\N
450	3811	12	2023-02-22 09:57:06	\N
451	3812	12	2023-02-22 09:57:06	\N
452	3813	12	2023-02-22 09:57:06	\N
453	3814	12	2023-02-22 09:57:06	\N
454	3815	12	2023-02-22 09:57:06	\N
455	3816	12	2023-02-22 09:57:06	\N
456	2391	13	2023-02-22 10:05:06	\N
457	2392	13	2023-02-22 10:05:06	\N
458	2393	13	2023-02-22 10:05:06	\N
459	2394	13	2023-02-22 10:05:06	\N
460	2395	13	2023-02-22 10:05:06	\N
461	2396	13	2023-02-22 10:05:06	\N
462	2397	13	2023-02-22 10:05:06	\N
463	2398	13	2023-02-22 10:05:06	\N
464	2399	13	2023-02-22 10:05:06	\N
465	2400	13	2023-02-22 10:05:06	\N
466	2401	13	2023-02-22 10:05:06	\N
467	2402	13	2023-02-22 10:05:06	\N
468	2403	13	2023-02-22 10:05:06	\N
469	2404	13	2023-02-22 10:05:06	\N
470	2405	13	2023-02-22 10:05:06	\N
471	2406	13	2023-02-22 10:05:06	\N
472	2407	13	2023-02-22 10:05:06	\N
473	4424	14	2023-02-22 10:11:06	\N
474	4425	14	2023-02-22 10:11:06	\N
475	4426	14	2023-02-22 10:11:06	\N
476	4427	14	2023-02-22 10:11:06	\N
477	4428	14	2023-02-22 10:11:06	\N
478	4429	14	2023-02-22 10:11:06	\N
479	4430	14	2023-02-22 10:11:06	\N
480	4431	14	2023-02-22 10:11:06	\N
481	4432	14	2023-02-22 10:11:06	\N
482	4433	14	2023-02-22 10:11:06	\N
483	4434	14	2023-02-22 10:11:06	\N
484	4435	14	2023-02-22 10:11:06	\N
485	4436	14	2023-02-22 10:11:06	\N
486	4437	14	2023-02-22 10:11:06	\N
487	4438	14	2023-02-22 10:11:06	\N
488	4439	14	2023-02-22 10:11:06	\N
489	4440	14	2023-02-22 10:11:06	\N
490	4441	14	2023-02-22 10:11:06	\N
491	4442	14	2023-02-22 10:11:06	\N
492	4443	14	2023-02-22 10:11:06	\N
493	4444	14	2023-02-22 10:11:06	\N
494	4445	14	2023-02-22 10:11:06	\N
495	4446	14	2023-02-22 10:11:06	\N
496	4447	14	2023-02-22 10:11:06	\N
497	4448	14	2023-02-22 10:11:06	\N
498	4449	14	2023-02-22 10:11:06	\N
499	4450	14	2023-02-22 10:11:06	\N
500	4451	14	2023-02-22 10:11:06	\N
501	4452	14	2023-02-22 10:11:06	\N
502	4453	14	2023-02-22 10:11:06	\N
503	4454	14	2023-02-22 10:11:06	\N
504	4455	14	2023-02-22 10:11:06	\N
505	4456	14	2023-02-22 10:11:06	\N
506	4457	14	2023-02-22 10:11:06	\N
507	4458	14	2023-02-22 10:11:06	\N
508	4459	14	2023-02-22 10:11:06	\N
509	4460	14	2023-02-22 10:11:06	\N
510	4461	14	2023-02-22 10:11:06	\N
511	4462	14	2023-02-22 10:11:06	\N
512	4463	14	2023-02-22 10:11:06	\N
513	4464	14	2023-02-22 10:11:06	\N
514	4465	14	2023-02-22 10:11:06	\N
515	4466	14	2023-02-22 10:11:06	\N
516	4467	14	2023-02-22 10:11:06	\N
517	4468	14	2023-02-22 10:11:06	\N
518	4469	14	2023-02-22 10:11:06	\N
519	4470	14	2023-02-22 10:11:06	\N
520	4471	14	2023-02-22 10:11:06	\N
521	4472	14	2023-02-22 10:11:06	\N
522	4473	14	2023-02-22 10:11:06	\N
523	4474	14	2023-02-22 10:11:06	\N
524	4475	14	2023-02-22 10:11:06	\N
525	4476	14	2023-02-22 10:11:06	\N
526	4477	14	2023-02-22 10:11:06	\N
527	4478	14	2023-02-22 10:11:06	\N
528	4479	14	2023-02-22 10:11:06	\N
529	4480	14	2023-02-22 10:11:06	\N
530	4481	14	2023-02-22 10:11:06	\N
531	4482	14	2023-02-22 10:11:06	\N
532	4483	14	2023-02-22 10:11:06	\N
533	4484	14	2023-02-22 10:11:06	\N
534	4485	14	2023-02-22 10:11:06	\N
535	4486	14	2023-02-22 10:11:06	\N
536	4487	14	2023-02-22 10:11:06	\N
537	4488	14	2023-02-22 10:11:06	\N
538	4489	14	2023-02-22 10:11:06	\N
539	4490	14	2023-02-22 10:11:06	\N
540	4491	14	2023-02-22 10:11:06	\N
541	4492	14	2023-02-22 10:11:06	\N
542	4493	14	2023-02-22 10:11:06	\N
543	4494	14	2023-02-22 10:11:06	\N
544	4495	14	2023-02-22 10:11:06	\N
545	4496	14	2023-02-22 10:11:06	\N
546	3100	15	2023-02-22 11:07:28	\N
547	3101	15	2023-02-22 11:07:28	\N
548	3102	15	2023-02-22 11:07:28	\N
549	3103	15	2023-02-22 11:07:28	\N
550	3104	15	2023-02-22 11:07:28	\N
551	3105	15	2023-02-22 11:07:28	\N
552	3106	15	2023-02-22 11:07:28	\N
553	3107	15	2023-02-22 11:07:28	\N
554	3108	15	2023-02-22 11:07:28	\N
555	3109	15	2023-02-22 11:07:28	\N
556	3110	15	2023-02-22 11:07:28	\N
557	3111	15	2023-02-22 11:07:28	\N
558	3112	15	2023-02-22 11:07:28	\N
559	3113	15	2023-02-22 11:07:28	\N
560	3114	15	2023-02-22 11:07:28	\N
561	3115	15	2023-02-22 11:07:28	\N
562	3116	15	2023-02-22 11:07:28	\N
563	3117	15	2023-02-22 11:07:28	\N
564	3118	15	2023-02-22 11:07:28	\N
565	3119	15	2023-02-22 11:07:28	\N
566	3120	15	2023-02-22 11:07:28	\N
567	3121	15	2023-02-22 11:07:28	\N
568	3122	15	2023-02-22 11:07:28	\N
569	3123	15	2023-02-22 11:07:28	\N
570	3124	15	2023-02-22 11:07:28	\N
571	3125	15	2023-02-22 11:07:28	\N
572	3126	15	2023-02-22 11:07:28	\N
573	3127	15	2023-02-22 11:07:28	\N
574	3128	15	2023-02-22 11:07:28	\N
575	3129	15	2023-02-22 11:07:28	\N
576	3130	15	2023-02-22 11:07:28	\N
577	3131	15	2023-02-22 11:07:28	\N
578	3132	15	2023-02-22 11:07:28	\N
579	3133	15	2023-02-22 11:07:28	\N
580	3134	15	2023-02-22 11:07:28	\N
581	3135	15	2023-02-22 11:07:28	\N
582	3136	15	2023-02-22 11:07:28	\N
583	3137	15	2023-02-22 11:07:28	\N
584	3138	15	2023-02-22 11:07:28	\N
585	3139	15	2023-02-22 11:07:28	\N
586	3140	15	2023-02-22 11:07:28	\N
587	3141	15	2023-02-22 11:07:28	\N
588	3142	15	2023-02-22 11:07:28	\N
589	3143	15	2023-02-22 11:07:28	\N
590	3144	15	2023-02-22 11:07:28	\N
591	3145	15	2023-02-22 11:07:28	\N
592	3146	15	2023-02-22 11:07:28	\N
593	3147	15	2023-02-22 11:07:28	\N
594	3148	15	2023-02-22 11:07:28	\N
595	3149	15	2023-02-22 11:07:28	\N
596	3150	15	2023-02-22 11:07:28	\N
597	3151	15	2023-02-22 11:07:28	\N
598	3152	15	2023-02-22 11:07:28	\N
599	3153	15	2023-02-22 11:07:28	\N
600	3154	15	2023-02-22 11:07:28	\N
601	3155	15	2023-02-22 11:07:28	\N
602	2908	16	2023-02-22 11:09:37	\N
603	2909	16	2023-02-22 11:09:37	\N
604	2910	16	2023-02-22 11:09:37	\N
605	2911	16	2023-02-22 11:09:37	\N
606	2912	16	2023-02-22 11:09:37	\N
607	2913	16	2023-02-22 11:09:37	\N
608	2914	16	2023-02-22 11:09:37	\N
609	2915	16	2023-02-22 11:09:37	\N
610	2916	16	2023-02-22 11:09:37	\N
611	2917	16	2023-02-22 11:09:37	\N
612	2918	16	2023-02-22 11:09:37	\N
613	2919	16	2023-02-22 11:09:37	\N
614	2920	16	2023-02-22 11:09:37	\N
615	2921	16	2023-02-22 11:09:37	\N
616	2922	16	2023-02-22 11:09:37	\N
617	2923	16	2023-02-22 11:09:37	\N
618	2924	16	2023-02-22 11:09:37	\N
619	2925	16	2023-02-22 11:09:37	\N
620	2926	16	2023-02-22 11:09:37	\N
621	2927	16	2023-02-22 11:09:37	\N
622	2928	16	2023-02-22 11:09:37	\N
623	2929	16	2023-02-22 11:09:37	\N
624	2930	16	2023-02-22 11:09:37	\N
625	2931	16	2023-02-22 11:09:37	\N
626	2932	16	2023-02-22 11:09:37	\N
627	2933	16	2023-02-22 11:09:37	\N
628	2934	16	2023-02-22 11:09:37	\N
629	2935	16	2023-02-22 11:09:37	\N
630	2936	16	2023-02-22 11:09:37	\N
631	2937	16	2023-02-22 11:09:37	\N
632	2938	16	2023-02-22 11:09:37	\N
633	2939	16	2023-02-22 11:09:37	\N
634	2940	16	2023-02-22 11:09:37	\N
635	2941	16	2023-02-22 11:09:37	\N
636	2942	16	2023-02-22 11:09:37	\N
637	2943	16	2023-02-22 11:09:37	\N
638	2944	16	2023-02-22 11:09:37	\N
639	2945	16	2023-02-22 11:09:37	\N
640	2946	16	2023-02-22 11:09:37	\N
641	2947	16	2023-02-22 11:09:37	\N
642	2948	16	2023-02-22 11:09:37	\N
643	2949	16	2023-02-22 11:09:37	\N
644	2950	16	2023-02-22 11:09:37	\N
645	2951	16	2023-02-22 11:09:37	\N
646	3040	17	2023-02-22 11:10:59	\N
647	3041	17	2023-02-22 11:10:59	\N
648	3042	17	2023-02-22 11:10:59	\N
649	3043	17	2023-02-22 11:10:59	\N
650	3044	17	2023-02-22 11:10:59	\N
651	3045	17	2023-02-22 11:10:59	\N
652	3046	17	2023-02-22 11:10:59	\N
653	3047	17	2023-02-22 11:10:59	\N
654	3048	17	2023-02-22 11:10:59	\N
655	3049	17	2023-02-22 11:10:59	\N
656	3050	17	2023-02-22 11:10:59	\N
657	3051	17	2023-02-22 11:10:59	\N
658	3052	17	2023-02-22 11:10:59	\N
659	3053	17	2023-02-22 11:10:59	\N
660	3054	17	2023-02-22 11:10:59	\N
661	3055	17	2023-02-22 11:10:59	\N
662	3056	17	2023-02-22 11:10:59	\N
663	3057	17	2023-02-22 11:10:59	\N
664	3058	17	2023-02-22 11:10:59	\N
665	3059	17	2023-02-22 11:10:59	\N
666	3060	17	2023-02-22 11:10:59	\N
667	3061	17	2023-02-22 11:10:59	\N
668	3062	17	2023-02-22 11:10:59	\N
669	3063	17	2023-02-22 11:10:59	\N
670	3064	17	2023-02-22 11:10:59	\N
671	3065	17	2023-02-22 11:10:59	\N
672	3066	17	2023-02-22 11:10:59	\N
673	3067	17	2023-02-22 11:10:59	\N
674	3068	17	2023-02-22 11:10:59	\N
675	3069	17	2023-02-22 11:10:59	\N
676	3070	17	2023-02-22 11:10:59	\N
677	3071	17	2023-02-22 11:10:59	\N
678	3072	17	2023-02-22 11:10:59	\N
679	3073	17	2023-02-22 11:10:59	\N
680	3074	17	2023-02-22 11:10:59	\N
681	3075	17	2023-02-22 11:10:59	\N
682	3076	17	2023-02-22 11:10:59	\N
683	3077	17	2023-02-22 11:10:59	\N
684	3078	17	2023-02-22 11:10:59	\N
685	3079	17	2023-02-22 11:10:59	\N
686	3080	17	2023-02-22 11:10:59	\N
687	3081	17	2023-02-22 11:10:59	\N
688	3082	17	2023-02-22 11:10:59	\N
689	3083	17	2023-02-22 11:10:59	\N
690	3084	17	2023-02-22 11:10:59	\N
691	3085	17	2023-02-22 11:10:59	\N
692	3086	17	2023-02-22 11:10:59	\N
693	3087	17	2023-02-22 11:10:59	\N
694	3088	17	2023-02-22 11:10:59	\N
695	3089	17	2023-02-22 11:10:59	\N
696	3090	17	2023-02-22 11:10:59	\N
697	3091	17	2023-02-22 11:10:59	\N
698	3092	17	2023-02-22 11:10:59	\N
699	3093	17	2023-02-22 11:10:59	\N
700	3094	17	2023-02-22 11:10:59	\N
701	3095	17	2023-02-22 11:10:59	\N
702	3096	17	2023-02-22 11:10:59	\N
703	3097	17	2023-02-22 11:10:59	\N
704	3098	17	2023-02-22 11:10:59	\N
705	3099	17	2023-02-22 11:10:59	\N
706	3231	18	2023-02-22 11:13:54	\N
707	3232	18	2023-02-22 11:13:54	\N
708	3233	18	2023-02-22 11:13:54	\N
709	3234	18	2023-02-22 11:13:54	\N
710	3235	18	2023-02-22 11:13:54	\N
711	3236	18	2023-02-22 11:13:54	\N
712	3237	18	2023-02-22 11:13:54	\N
713	3238	18	2023-02-22 11:13:54	\N
714	3239	18	2023-02-22 11:13:54	\N
715	3240	18	2023-02-22 11:13:54	\N
716	3241	18	2023-02-22 11:13:54	\N
717	3242	18	2023-02-22 11:13:54	\N
718	3243	18	2023-02-22 11:13:54	\N
719	3244	18	2023-02-22 11:13:54	\N
720	3245	18	2023-02-22 11:13:54	\N
721	3246	18	2023-02-22 11:13:54	\N
722	3247	18	2023-02-22 11:13:54	\N
723	3248	18	2023-02-22 11:13:54	\N
724	3249	18	2023-02-22 11:13:54	\N
725	3250	18	2023-02-22 11:13:54	\N
726	3251	18	2023-02-22 11:13:54	\N
727	3252	18	2023-02-22 11:13:54	\N
728	3253	18	2023-02-22 11:13:54	\N
729	3254	18	2023-02-22 11:13:54	\N
730	3255	18	2023-02-22 11:13:54	\N
731	3256	18	2023-02-22 11:13:54	\N
732	3257	18	2023-02-22 11:13:54	\N
733	3258	18	2023-02-22 11:13:54	\N
734	3259	18	2023-02-22 11:13:54	\N
735	3260	18	2023-02-22 11:13:54	\N
736	3261	18	2023-02-22 11:13:54	\N
737	3262	18	2023-02-22 11:13:54	\N
738	3263	18	2023-02-22 11:13:54	\N
739	3264	18	2023-02-22 11:13:54	\N
740	3265	18	2023-02-22 11:13:54	\N
741	3266	18	2023-02-22 11:13:54	\N
742	3267	18	2023-02-22 11:13:54	\N
743	3268	18	2023-02-22 11:13:54	\N
744	3269	18	2023-02-22 11:13:54	\N
745	3270	18	2023-02-22 11:13:54	\N
746	3271	18	2023-02-22 11:13:54	\N
747	3272	18	2023-02-22 11:13:54	\N
748	3273	18	2023-02-22 11:13:54	\N
749	3274	18	2023-02-22 11:13:54	\N
750	3275	18	2023-02-22 11:13:54	\N
751	3276	18	2023-02-22 11:13:54	\N
752	3277	18	2023-02-22 11:13:54	\N
753	4275	19	2023-02-22 11:19:05	\N
754	4276	19	2023-02-22 11:19:05	\N
755	4277	19	2023-02-22 11:19:05	\N
756	4278	19	2023-02-22 11:19:05	\N
757	4279	19	2023-02-22 11:19:05	\N
758	4280	19	2023-02-22 11:19:05	\N
759	4281	19	2023-02-22 11:19:05	\N
760	4282	19	2023-02-22 11:19:05	\N
761	4283	19	2023-02-22 11:19:05	\N
762	4284	19	2023-02-22 11:19:05	\N
763	4285	19	2023-02-22 11:19:05	\N
764	4286	19	2023-02-22 11:19:05	\N
765	4287	19	2023-02-22 11:19:05	\N
766	4288	19	2023-02-22 11:19:05	\N
767	4289	19	2023-02-22 11:19:05	\N
768	4290	19	2023-02-22 11:19:05	\N
769	4291	19	2023-02-22 11:19:05	\N
770	4292	19	2023-02-22 11:19:05	\N
771	4293	19	2023-02-22 11:19:05	\N
772	4294	19	2023-02-22 11:19:05	\N
773	4295	19	2023-02-22 11:19:05	\N
774	4296	19	2023-02-22 11:19:05	\N
775	4297	19	2023-02-22 11:19:05	\N
776	4298	19	2023-02-22 11:19:05	\N
777	4299	19	2023-02-22 11:19:05	\N
778	4300	19	2023-02-22 11:19:05	\N
779	4301	19	2023-02-22 11:19:05	\N
780	4302	19	2023-02-22 11:19:05	\N
781	4303	19	2023-02-22 11:19:05	\N
782	4304	19	2023-02-22 11:19:05	\N
783	4305	19	2023-02-22 11:19:05	\N
784	4306	19	2023-02-22 11:19:05	\N
785	4307	19	2023-02-22 11:19:05	\N
786	4308	19	2023-02-22 11:19:05	\N
787	4309	19	2023-02-22 11:19:05	\N
788	4310	19	2023-02-22 11:19:05	\N
789	4311	19	2023-02-22 11:19:05	\N
790	4312	19	2023-02-22 11:19:05	\N
791	4313	19	2023-02-22 11:19:05	\N
792	4314	19	2023-02-22 11:19:05	\N
793	4315	19	2023-02-22 11:19:05	\N
794	4316	19	2023-02-22 11:19:05	\N
795	4317	19	2023-02-22 11:19:05	\N
796	4318	19	2023-02-22 11:19:05	\N
797	4319	19	2023-02-22 11:19:05	\N
798	4320	19	2023-02-22 11:19:05	\N
799	4321	19	2023-02-22 11:19:05	\N
800	4322	19	2023-02-22 11:19:05	\N
801	4323	19	2023-02-22 11:19:05	\N
802	4324	19	2023-02-22 11:19:05	\N
803	4325	19	2023-02-22 11:19:05	\N
804	4326	19	2023-02-22 11:19:05	\N
805	4327	19	2023-02-22 11:19:05	\N
806	4328	19	2023-02-22 11:19:05	\N
807	4329	19	2023-02-22 11:19:05	\N
808	4330	19	2023-02-22 11:19:05	\N
809	4331	19	2023-02-22 11:19:05	\N
810	4332	19	2023-02-22 11:19:05	\N
811	4333	19	2023-02-22 11:19:05	\N
812	4334	19	2023-02-22 11:19:05	\N
813	4335	19	2023-02-22 11:19:05	\N
814	4336	19	2023-02-22 11:19:05	\N
815	4337	19	2023-02-22 11:19:05	\N
816	4338	19	2023-02-22 11:19:05	\N
817	4339	19	2023-02-22 11:19:05	\N
818	4340	19	2023-02-22 11:19:05	\N
819	4341	19	2023-02-22 11:19:05	\N
820	4342	19	2023-02-22 11:19:05	\N
821	4343	19	2023-02-22 11:19:05	\N
822	4344	19	2023-02-22 11:19:05	\N
823	4345	19	2023-02-22 11:19:05	\N
824	4346	19	2023-02-22 11:19:05	\N
825	4347	19	2023-02-22 11:19:05	\N
826	4348	19	2023-02-22 11:19:05	\N
827	4349	19	2023-02-22 11:19:05	\N
828	4350	19	2023-02-22 11:19:05	\N
829	4351	19	2023-02-22 11:19:05	\N
830	4352	19	2023-02-22 11:19:05	\N
831	4353	19	2023-02-22 11:19:05	\N
832	4354	19	2023-02-22 11:19:05	\N
833	4355	19	2023-02-22 11:19:05	\N
834	4356	19	2023-02-22 11:19:05	\N
835	4357	19	2023-02-22 11:19:05	\N
836	4358	19	2023-02-22 11:19:05	\N
837	4359	19	2023-02-22 11:19:05	\N
838	4360	19	2023-02-22 11:19:05	\N
839	4361	19	2023-02-22 11:19:05	\N
840	4362	19	2023-02-22 11:19:05	\N
841	4363	19	2023-02-22 11:19:05	\N
842	4364	19	2023-02-22 11:19:05	\N
843	4365	19	2023-02-22 11:19:05	\N
844	4366	19	2023-02-22 11:19:05	\N
845	4367	19	2023-02-22 11:19:05	\N
846	4368	19	2023-02-22 11:19:05	\N
847	4369	19	2023-02-22 11:19:05	\N
848	4370	19	2023-02-22 11:19:05	\N
849	4371	19	2023-02-22 11:19:05	\N
850	4372	19	2023-02-22 11:19:05	\N
851	4373	19	2023-02-22 11:19:05	\N
852	4374	19	2023-02-22 11:19:05	\N
853	4375	19	2023-02-22 11:19:05	\N
854	4376	19	2023-02-22 11:19:05	\N
855	4377	19	2023-02-22 11:19:05	\N
856	4378	19	2023-02-22 11:19:05	\N
857	4379	19	2023-02-22 11:19:05	\N
858	4380	19	2023-02-22 11:19:05	\N
859	4381	19	2023-02-22 11:19:05	\N
860	4382	19	2023-02-22 11:19:05	\N
861	4383	19	2023-02-22 11:19:05	\N
862	4384	19	2023-02-22 11:19:05	\N
863	4385	19	2023-02-22 11:19:05	\N
864	4386	19	2023-02-22 11:19:05	\N
865	4387	19	2023-02-22 11:19:05	\N
866	4388	19	2023-02-22 11:19:05	\N
867	4389	19	2023-02-22 11:19:05	\N
868	4390	19	2023-02-22 11:19:05	\N
869	4391	19	2023-02-22 11:19:05	\N
870	4392	19	2023-02-22 11:19:05	\N
871	4393	19	2023-02-22 11:19:05	\N
872	4394	19	2023-02-22 11:19:05	\N
873	4395	19	2023-02-22 11:19:05	\N
874	4396	19	2023-02-22 11:19:05	\N
875	4397	19	2023-02-22 11:19:05	\N
876	4398	19	2023-02-22 11:19:05	\N
877	4399	19	2023-02-22 11:19:05	\N
878	4400	19	2023-02-22 11:19:05	\N
879	4401	19	2023-02-22 11:19:05	\N
880	4402	19	2023-02-22 11:19:05	\N
881	4403	19	2023-02-22 11:19:05	\N
882	4404	19	2023-02-22 11:19:05	\N
883	4405	19	2023-02-22 11:19:05	\N
884	4406	19	2023-02-22 11:19:05	\N
885	4407	19	2023-02-22 11:19:05	\N
886	4408	19	2023-02-22 11:19:05	\N
887	4409	19	2023-02-22 11:19:05	\N
888	4410	19	2023-02-22 11:19:05	\N
889	4411	19	2023-02-22 11:19:05	\N
890	4412	19	2023-02-22 11:19:05	\N
891	4413	19	2023-02-22 11:19:05	\N
892	4414	19	2023-02-22 11:19:05	\N
893	4415	19	2023-02-22 11:19:05	\N
894	4416	19	2023-02-22 11:19:05	\N
895	4417	19	2023-02-22 11:19:05	\N
896	4418	19	2023-02-22 11:19:05	\N
897	4419	19	2023-02-22 11:19:05	\N
898	4420	19	2023-02-22 11:19:05	\N
899	4421	19	2023-02-22 11:19:05	\N
900	4422	19	2023-02-22 11:19:05	\N
901	4423	19	2023-02-22 11:19:05	\N
902	3451	20	2023-02-22 11:24:47	\N
903	3452	20	2023-02-22 11:24:47	\N
904	3453	20	2023-02-22 11:24:47	\N
905	3454	20	2023-02-22 11:24:47	\N
906	3455	20	2023-02-22 11:24:47	\N
907	3456	20	2023-02-22 11:24:47	\N
908	3457	20	2023-02-22 11:24:47	\N
909	3458	20	2023-02-22 11:24:47	\N
910	3459	20	2023-02-22 11:24:47	\N
911	3460	20	2023-02-22 11:24:47	\N
912	3461	20	2023-02-22 11:24:47	\N
913	3462	20	2023-02-22 11:24:47	\N
914	3463	20	2023-02-22 11:24:47	\N
915	3464	20	2023-02-22 11:24:47	\N
916	3465	20	2023-02-22 11:24:47	\N
917	3466	20	2023-02-22 11:24:47	\N
918	3467	20	2023-02-22 11:24:47	\N
919	3468	20	2023-02-22 11:24:47	\N
920	3469	20	2023-02-22 11:24:47	\N
921	3470	20	2023-02-22 11:24:47	\N
922	3471	20	2023-02-22 11:24:47	\N
923	3472	20	2023-02-22 11:24:47	\N
924	3473	20	2023-02-22 11:24:47	\N
925	3474	20	2023-02-22 11:24:47	\N
926	3475	20	2023-02-22 11:24:47	\N
927	3476	20	2023-02-22 11:24:47	\N
928	3477	20	2023-02-22 11:24:47	\N
929	3478	20	2023-02-22 11:24:47	\N
930	3479	20	2023-02-22 11:24:47	\N
931	3480	20	2023-02-22 11:24:47	\N
932	3481	21	2023-02-22 11:26:59	\N
933	3482	21	2023-02-22 11:26:59	\N
934	3483	21	2023-02-22 11:26:59	\N
935	3484	21	2023-02-22 11:26:59	\N
936	3485	21	2023-02-22 11:26:59	\N
937	3486	21	2023-02-22 11:26:59	\N
938	3487	21	2023-02-22 11:26:59	\N
939	3488	21	2023-02-22 11:26:59	\N
940	3489	21	2023-02-22 11:26:59	\N
941	3490	21	2023-02-22 11:26:59	\N
942	3491	21	2023-02-22 11:26:59	\N
943	3492	21	2023-02-22 11:26:59	\N
944	3493	21	2023-02-22 11:26:59	\N
945	3494	21	2023-02-22 11:26:59	\N
946	3495	21	2023-02-22 11:26:59	\N
947	3496	21	2023-02-22 11:26:59	\N
948	3497	21	2023-02-22 11:26:59	\N
949	3498	21	2023-02-22 11:26:59	\N
950	3499	21	2023-02-22 11:26:59	\N
951	3500	21	2023-02-22 11:26:59	\N
952	3501	21	2023-02-22 11:26:59	\N
953	3502	21	2023-02-22 11:26:59	\N
954	2275	22	2023-02-22 11:29:22	\N
955	2276	22	2023-02-22 11:29:22	\N
956	2277	22	2023-02-22 11:29:22	\N
957	2278	22	2023-02-22 11:29:22	\N
958	2279	22	2023-02-22 11:29:22	\N
959	2280	22	2023-02-22 11:29:22	\N
960	2281	22	2023-02-22 11:29:22	\N
961	2282	22	2023-02-22 11:29:22	\N
962	2283	22	2023-02-22 11:29:22	\N
963	2284	22	2023-02-22 11:29:22	\N
964	2285	22	2023-02-22 11:29:22	\N
965	2286	22	2023-02-22 11:29:22	\N
966	2287	22	2023-02-22 11:29:22	\N
967	2288	22	2023-02-22 11:29:22	\N
968	2289	22	2023-02-22 11:29:22	\N
969	2290	22	2023-02-22 11:29:22	\N
970	2291	22	2023-02-22 11:29:22	\N
971	2292	22	2023-02-22 11:29:22	\N
972	2293	22	2023-02-22 11:29:22	\N
973	2294	22	2023-02-22 11:29:22	\N
974	2295	22	2023-02-22 11:29:22	\N
975	2296	22	2023-02-22 11:29:22	\N
976	2297	22	2023-02-22 11:29:22	\N
977	2298	22	2023-02-22 11:29:22	\N
978	2299	22	2023-02-22 11:29:22	\N
979	2300	22	2023-02-22 11:29:22	\N
980	2301	22	2023-02-22 11:29:22	\N
981	2302	22	2023-02-22 11:29:22	\N
982	2303	22	2023-02-22 11:29:22	\N
983	2304	22	2023-02-22 11:29:22	\N
984	2305	22	2023-02-22 11:29:22	\N
985	2306	22	2023-02-22 11:29:22	\N
986	2307	22	2023-02-22 11:29:22	\N
987	2308	22	2023-02-22 11:29:22	\N
988	2309	22	2023-02-22 11:29:22	\N
989	2310	22	2023-02-22 11:29:22	\N
990	2311	22	2023-02-22 11:29:22	\N
991	2312	22	2023-02-22 11:29:22	\N
992	2313	22	2023-02-22 11:29:22	\N
993	2314	22	2023-02-22 11:29:22	\N
994	2315	22	2023-02-22 11:29:22	\N
995	2316	22	2023-02-22 11:29:22	\N
996	2317	22	2023-02-22 11:29:22	\N
997	2318	22	2023-02-22 11:29:22	\N
998	2319	22	2023-02-22 11:29:22	\N
999	2320	22	2023-02-22 11:29:22	\N
1000	2321	22	2023-02-22 11:29:22	\N
1001	2322	22	2023-02-22 11:29:22	\N
1002	2323	22	2023-02-22 11:29:22	\N
1003	2324	22	2023-02-22 11:29:22	\N
1004	2325	22	2023-02-22 11:29:22	\N
1005	2326	22	2023-02-22 11:29:22	\N
1006	2327	22	2023-02-22 11:29:22	\N
1007	2328	22	2023-02-22 11:29:22	\N
1008	2329	22	2023-02-22 11:29:22	\N
1009	2330	22	2023-02-22 11:29:22	\N
1010	2331	22	2023-02-22 11:29:22	\N
1011	2332	22	2023-02-22 11:29:22	\N
1012	2333	22	2023-02-22 11:29:22	\N
1013	2334	22	2023-02-22 11:29:22	\N
1014	2335	22	2023-02-22 11:29:22	\N
1015	2336	22	2023-02-22 11:29:22	\N
1016	2337	22	2023-02-22 11:29:22	\N
1017	2338	22	2023-02-22 11:29:22	\N
1018	2339	22	2023-02-22 11:29:22	\N
1019	2340	22	2023-02-22 11:29:22	\N
1020	2341	22	2023-02-22 11:29:22	\N
1021	2342	22	2023-02-22 11:29:22	\N
1022	2343	22	2023-02-22 11:29:22	\N
1023	2344	22	2023-02-22 11:29:22	\N
1024	2345	22	2023-02-22 11:29:22	\N
1025	2346	22	2023-02-22 11:29:22	\N
1026	2347	22	2023-02-22 11:29:22	\N
1027	2348	22	2023-02-22 11:29:22	\N
1028	2349	22	2023-02-22 11:29:22	\N
1029	2350	22	2023-02-22 11:29:22	\N
1030	2351	22	2023-02-22 11:29:22	\N
1031	2352	22	2023-02-22 11:29:22	\N
1032	2353	22	2023-02-22 11:29:22	\N
1033	2354	22	2023-02-22 11:29:22	\N
1034	2355	22	2023-02-22 11:29:22	\N
1035	2356	22	2023-02-22 11:29:22	\N
1036	2357	22	2023-02-22 11:29:22	\N
1037	2358	22	2023-02-22 11:29:22	\N
1038	2359	22	2023-02-22 11:29:22	\N
1039	2360	22	2023-02-22 11:29:22	\N
1040	2361	22	2023-02-22 11:29:22	\N
1041	2362	22	2023-02-22 11:29:22	\N
1042	2363	22	2023-02-22 11:29:22	\N
1043	2364	22	2023-02-22 11:29:22	\N
1044	2365	22	2023-02-22 11:29:22	\N
1045	4077	23	2023-02-22 12:32:35	\N
1046	4078	23	2023-02-22 12:32:35	\N
1047	4079	23	2023-02-22 12:32:35	\N
1048	4080	23	2023-02-22 12:32:35	\N
1049	4081	23	2023-02-22 12:32:35	\N
1050	4082	23	2023-02-22 12:32:35	\N
1051	4083	23	2023-02-22 12:32:35	\N
1052	4084	23	2023-02-22 12:32:35	\N
1053	4085	23	2023-02-22 12:32:35	\N
1054	4086	23	2023-02-22 12:32:35	\N
1055	4087	23	2023-02-22 12:32:35	\N
1056	4088	23	2023-02-22 12:32:35	\N
1057	4089	23	2023-02-22 12:32:35	\N
1058	4090	23	2023-02-22 12:32:35	\N
1059	4091	23	2023-02-22 12:32:35	\N
1060	4092	23	2023-02-22 12:32:35	\N
1061	4093	23	2023-02-22 12:32:35	\N
1062	4094	23	2023-02-22 12:32:35	\N
1063	4095	23	2023-02-22 12:32:35	\N
1064	4096	23	2023-02-22 12:32:35	\N
1065	4097	23	2023-02-22 12:32:35	\N
1066	4098	23	2023-02-22 12:32:35	\N
1067	4099	23	2023-02-22 12:32:35	\N
1068	4100	23	2023-02-22 12:32:35	\N
1069	4101	23	2023-02-22 12:32:35	\N
1070	4102	23	2023-02-22 12:32:35	\N
1071	4103	23	2023-02-22 12:32:35	\N
1072	4104	23	2023-02-22 12:32:35	\N
1073	4105	23	2023-02-22 12:32:35	\N
1074	4106	23	2023-02-22 12:32:35	\N
1075	4107	23	2023-02-22 12:32:35	\N
1076	4108	23	2023-02-22 12:32:35	\N
1077	4109	23	2023-02-22 12:32:35	\N
1078	4110	23	2023-02-22 12:32:35	\N
1079	4111	23	2023-02-22 12:32:35	\N
1080	4112	23	2023-02-22 12:32:35	\N
1081	4113	23	2023-02-22 12:32:35	\N
1082	4114	23	2023-02-22 12:32:35	\N
1083	4115	23	2023-02-22 12:32:35	\N
1084	4116	23	2023-02-22 12:32:35	\N
1085	4117	23	2023-02-22 12:32:35	\N
1086	4118	23	2023-02-22 12:32:35	\N
1087	4119	23	2023-02-22 12:32:35	\N
1088	4120	23	2023-02-22 12:32:35	\N
1089	4121	23	2023-02-22 12:32:35	\N
1090	4122	23	2023-02-22 12:32:35	\N
1091	4123	23	2023-02-22 12:32:35	\N
1092	4124	23	2023-02-22 12:32:35	\N
1093	4125	23	2023-02-22 12:32:35	\N
1094	4126	23	2023-02-22 12:32:35	\N
1095	4127	23	2023-02-22 12:32:35	\N
1096	4128	23	2023-02-22 12:32:35	\N
1097	4129	23	2023-02-22 12:32:35	\N
1098	4130	23	2023-02-22 12:32:35	\N
1099	4131	23	2023-02-22 12:32:35	\N
1100	4132	23	2023-02-22 12:32:35	\N
1101	4133	23	2023-02-22 12:32:35	\N
1102	4134	23	2023-02-22 12:32:35	\N
1103	4135	23	2023-02-22 12:32:35	\N
1104	4136	23	2023-02-22 12:32:35	\N
1105	4137	23	2023-02-22 12:32:35	\N
1106	4138	23	2023-02-22 12:32:35	\N
1107	4139	23	2023-02-22 12:32:35	\N
1108	4140	23	2023-02-22 12:32:35	\N
1109	4141	23	2023-02-22 12:32:35	\N
1110	4142	23	2023-02-22 12:32:35	\N
1111	4143	23	2023-02-22 12:32:35	\N
1112	4144	23	2023-02-22 12:32:35	\N
1113	4145	23	2023-02-22 12:32:35	\N
1114	4146	23	2023-02-22 12:32:35	\N
1115	4147	23	2023-02-22 12:32:35	\N
1116	4148	23	2023-02-22 12:32:35	\N
1117	4149	23	2023-02-22 12:32:35	\N
1118	4150	23	2023-02-22 12:32:35	\N
1119	4151	23	2023-02-22 12:32:35	\N
1120	4152	23	2023-02-22 12:32:35	\N
1121	4153	23	2023-02-22 12:32:36	\N
1122	4154	23	2023-02-22 12:32:36	\N
1123	4155	23	2023-02-22 12:32:36	\N
1124	4156	23	2023-02-22 12:32:36	\N
1125	4157	23	2023-02-22 12:32:36	\N
1126	4158	23	2023-02-22 12:32:36	\N
1127	4159	23	2023-02-22 12:32:36	\N
1128	4160	23	2023-02-22 12:32:36	\N
1129	4161	23	2023-02-22 12:32:36	\N
1130	4162	23	2023-02-22 12:32:36	\N
1131	4163	23	2023-02-22 12:32:36	\N
1132	4164	23	2023-02-22 12:32:36	\N
1133	4165	23	2023-02-22 12:32:36	\N
1134	4166	23	2023-02-22 12:32:36	\N
1135	4167	23	2023-02-22 12:32:36	\N
1136	4168	23	2023-02-22 12:32:36	\N
1137	4169	23	2023-02-22 12:32:36	\N
1138	4170	23	2023-02-22 12:32:36	\N
1139	4171	23	2023-02-22 12:32:36	\N
1140	4172	23	2023-02-22 12:32:36	\N
1141	4173	23	2023-02-22 12:32:36	\N
1142	4174	23	2023-02-22 12:32:36	\N
1143	4175	23	2023-02-22 12:32:36	\N
1144	4176	23	2023-02-22 12:32:36	\N
1145	4177	23	2023-02-22 12:32:36	\N
1146	4178	23	2023-02-22 12:32:36	\N
1147	4179	23	2023-02-22 12:32:36	\N
1148	4180	23	2023-02-22 12:32:36	\N
1149	4181	23	2023-02-22 12:32:36	\N
1150	4182	23	2023-02-22 12:32:36	\N
1151	4183	23	2023-02-22 12:32:36	\N
1152	4184	23	2023-02-22 12:32:36	\N
1153	4185	23	2023-02-22 12:32:36	\N
1154	4186	23	2023-02-22 12:32:36	\N
1155	4187	23	2023-02-22 12:32:36	\N
1156	4188	23	2023-02-22 12:32:36	\N
1157	4189	23	2023-02-22 12:32:36	\N
1158	4190	23	2023-02-22 12:32:36	\N
1159	4191	23	2023-02-22 12:32:36	\N
1160	4192	23	2023-02-22 12:32:36	\N
1161	4193	23	2023-02-22 12:32:36	\N
1162	4194	23	2023-02-22 12:32:36	\N
1163	4195	23	2023-02-22 12:32:36	\N
1164	4196	23	2023-02-22 12:32:36	\N
1165	4197	23	2023-02-22 12:32:36	\N
1166	4198	23	2023-02-22 12:32:36	\N
1167	4199	23	2023-02-22 12:32:36	\N
1168	4200	23	2023-02-22 12:32:36	\N
1169	4201	23	2023-02-22 12:32:36	\N
1170	4202	23	2023-02-22 12:32:36	\N
1171	4203	23	2023-02-22 12:32:36	\N
1172	4204	23	2023-02-22 12:32:36	\N
1173	4205	23	2023-02-22 12:32:36	\N
1174	4206	23	2023-02-22 12:32:36	\N
1175	4207	23	2023-02-22 12:32:36	\N
1176	4208	23	2023-02-22 12:32:36	\N
1177	4209	23	2023-02-22 12:32:36	\N
1178	4210	23	2023-02-22 12:32:36	\N
1179	4211	23	2023-02-22 12:32:36	\N
1180	4212	23	2023-02-22 12:32:36	\N
1181	2530	24	2023-02-22 12:41:28	\N
1182	2531	24	2023-02-22 12:41:28	\N
1183	2532	24	2023-02-22 12:41:28	\N
1184	2533	24	2023-02-22 12:41:28	\N
1185	2534	24	2023-02-22 12:41:28	\N
1186	2535	24	2023-02-22 12:41:28	\N
1187	2536	24	2023-02-22 12:41:28	\N
1188	2537	24	2023-02-22 12:41:28	\N
1189	2538	24	2023-02-22 12:41:28	\N
1190	2539	24	2023-02-22 12:41:28	\N
1191	2540	24	2023-02-22 12:41:28	\N
1192	2541	24	2023-02-22 12:41:28	\N
1193	2542	24	2023-02-22 12:41:28	\N
1194	2543	24	2023-02-22 12:41:28	\N
1195	2544	24	2023-02-22 12:41:28	\N
1196	2545	24	2023-02-22 12:41:28	\N
1197	2546	24	2023-02-22 12:41:28	\N
1198	2547	24	2023-02-22 12:41:28	\N
1199	2548	24	2023-02-22 12:41:28	\N
1200	2549	24	2023-02-22 12:41:28	\N
1201	2550	24	2023-02-22 12:41:28	\N
1202	2551	24	2023-02-22 12:41:28	\N
1203	2552	24	2023-02-22 12:41:28	\N
1204	2553	24	2023-02-22 12:41:28	\N
1205	2554	24	2023-02-22 12:41:28	\N
1206	2555	24	2023-02-22 12:41:28	\N
1207	2556	24	2023-02-22 12:41:28	\N
1208	2557	24	2023-02-22 12:41:28	\N
1209	2558	24	2023-02-22 12:41:28	\N
1210	2559	24	2023-02-22 12:41:28	\N
1211	2560	24	2023-02-22 12:41:28	\N
1212	2561	24	2023-02-22 12:41:28	\N
1213	2562	24	2023-02-22 12:41:28	\N
1214	2563	24	2023-02-22 12:41:28	\N
1215	2564	24	2023-02-22 12:41:28	\N
1216	2565	24	2023-02-22 12:41:28	\N
1217	2566	24	2023-02-22 12:41:28	\N
1218	2567	24	2023-02-22 12:41:28	\N
1219	2568	24	2023-02-22 12:41:28	\N
1220	2569	24	2023-02-22 12:41:28	\N
1221	2570	24	2023-02-22 12:41:28	\N
1222	2571	24	2023-02-22 12:41:28	\N
1223	2572	24	2023-02-22 12:41:28	\N
1224	2573	24	2023-02-22 12:41:28	\N
1225	2574	24	2023-02-22 12:41:28	\N
1226	2575	24	2023-02-22 12:41:29	\N
1227	2576	24	2023-02-22 12:41:29	\N
1228	2577	24	2023-02-22 12:41:29	\N
1229	2578	24	2023-02-22 12:41:29	\N
1230	2579	24	2023-02-22 12:41:29	\N
1231	2580	24	2023-02-22 12:41:29	\N
1232	2581	24	2023-02-22 12:41:29	\N
1233	2582	24	2023-02-22 12:41:29	\N
1234	2583	24	2023-02-22 12:41:29	\N
1235	2584	24	2023-02-22 12:41:29	\N
1236	2585	24	2023-02-22 12:41:29	\N
1237	2586	24	2023-02-22 12:41:29	\N
1238	2587	24	2023-02-22 12:41:29	\N
1239	2588	24	2023-02-22 12:41:29	\N
1240	2589	24	2023-02-22 12:41:29	\N
1241	2590	24	2023-02-22 12:41:29	\N
1242	2591	24	2023-02-22 12:41:29	\N
1243	2592	24	2023-02-22 12:41:29	\N
1244	2593	24	2023-02-22 12:41:29	\N
1245	2594	24	2023-02-22 12:41:29	\N
1246	2595	24	2023-02-22 12:41:29	\N
1247	2596	24	2023-02-22 12:41:29	\N
1248	2597	24	2023-02-22 12:41:29	\N
1249	2598	24	2023-02-22 12:41:29	\N
1250	2599	24	2023-02-22 12:41:29	\N
1251	2600	25	2023-02-22 12:42:32	\N
1252	2601	25	2023-02-22 12:42:32	\N
1253	2602	25	2023-02-22 12:42:32	\N
1254	2603	25	2023-02-22 12:42:32	\N
1255	2604	25	2023-02-22 12:42:32	\N
1256	2605	25	2023-02-22 12:42:32	\N
1257	2606	25	2023-02-22 12:42:32	\N
1258	2607	25	2023-02-22 12:42:32	\N
1259	2608	25	2023-02-22 12:42:32	\N
1260	2609	25	2023-02-22 12:42:32	\N
1261	2610	25	2023-02-22 12:42:32	\N
1262	2611	25	2023-02-22 12:42:32	\N
1263	2612	25	2023-02-22 12:42:32	\N
1264	2613	25	2023-02-22 12:42:32	\N
1265	2614	25	2023-02-22 12:42:32	\N
1266	2615	25	2023-02-22 12:42:32	\N
1267	2616	25	2023-02-22 12:42:32	\N
1268	2617	25	2023-02-22 12:42:32	\N
1269	2618	25	2023-02-22 12:42:32	\N
1270	2619	25	2023-02-22 12:42:32	\N
1271	2620	25	2023-02-22 12:42:32	\N
1272	2621	25	2023-02-22 12:42:32	\N
1273	2622	25	2023-02-22 12:42:32	\N
1274	2623	25	2023-02-22 12:42:32	\N
1275	2624	25	2023-02-22 12:42:32	\N
1276	2625	25	2023-02-22 12:42:32	\N
1277	2626	25	2023-02-22 12:42:32	\N
1278	2627	25	2023-02-22 12:42:32	\N
1279	2628	25	2023-02-22 12:42:32	\N
1280	2629	25	2023-02-22 12:42:32	\N
1281	2630	25	2023-02-22 12:42:32	\N
1282	2631	25	2023-02-22 12:42:32	\N
1283	2632	25	2023-02-22 12:42:32	\N
1284	2633	25	2023-02-22 12:42:32	\N
1285	2634	25	2023-02-22 12:42:32	\N
1286	2635	25	2023-02-22 12:42:32	\N
1287	2636	25	2023-02-22 12:42:32	\N
1288	2637	25	2023-02-22 12:42:32	\N
1289	2638	25	2023-02-22 12:42:32	\N
1290	2639	25	2023-02-22 12:42:32	\N
1291	2640	25	2023-02-22 12:42:32	\N
1292	2641	25	2023-02-22 12:42:32	\N
1293	2642	25	2023-02-22 12:42:32	\N
1294	2643	25	2023-02-22 12:42:32	\N
1295	2644	25	2023-02-22 12:42:32	\N
1296	2645	25	2023-02-22 12:42:32	\N
1297	2646	25	2023-02-22 12:42:32	\N
1298	2647	25	2023-02-22 12:42:32	\N
1299	2648	25	2023-02-22 12:42:32	\N
1300	2649	25	2023-02-22 12:42:32	\N
1301	2650	25	2023-02-22 12:42:32	\N
1302	2651	25	2023-02-22 12:42:32	\N
1303	2652	25	2023-02-22 12:42:32	\N
1304	2653	25	2023-02-22 12:42:32	\N
1305	2654	25	2023-02-22 12:42:32	\N
1306	2655	25	2023-02-22 12:42:32	\N
1307	2656	25	2023-02-22 12:42:32	\N
1308	2657	25	2023-02-22 12:42:32	\N
1309	2658	25	2023-02-22 12:42:32	\N
1310	2659	25	2023-02-22 12:42:32	\N
1311	2660	25	2023-02-22 12:42:32	\N
1312	2661	25	2023-02-22 12:42:32	\N
1313	2662	25	2023-02-22 12:42:32	\N
1314	2663	25	2023-02-22 12:42:32	\N
1315	2664	25	2023-02-22 12:42:32	\N
1316	2665	25	2023-02-22 12:42:32	\N
1317	2666	25	2023-02-22 12:42:32	\N
1318	2667	25	2023-02-22 12:42:32	\N
1319	2668	25	2023-02-22 12:42:32	\N
1320	2669	25	2023-02-22 12:42:32	\N
1321	2670	25	2023-02-22 12:42:32	\N
1322	2671	25	2023-02-22 12:42:32	\N
1323	2672	25	2023-02-22 12:42:32	\N
1324	2673	25	2023-02-22 12:42:32	\N
1325	2674	26	2023-02-22 12:43:38	\N
1326	2675	26	2023-02-22 12:43:38	\N
1327	2676	26	2023-02-22 12:43:38	\N
1328	2677	26	2023-02-22 12:43:38	\N
1329	2678	26	2023-02-22 12:43:38	\N
1330	2679	26	2023-02-22 12:43:38	\N
1331	2680	26	2023-02-22 12:43:38	\N
1332	2681	26	2023-02-22 12:43:38	\N
1333	2682	26	2023-02-22 12:43:38	\N
1334	2683	26	2023-02-22 12:43:38	\N
1335	2684	26	2023-02-22 12:43:38	\N
1336	2685	26	2023-02-22 12:43:38	\N
1337	2686	26	2023-02-22 12:43:38	\N
1338	2687	26	2023-02-22 12:43:38	\N
1339	2688	26	2023-02-22 12:43:38	\N
1340	2689	26	2023-02-22 12:43:38	\N
1341	2690	26	2023-02-22 12:43:38	\N
1342	2691	26	2023-02-22 12:43:38	\N
1343	2692	26	2023-02-22 12:43:38	\N
1344	2693	26	2023-02-22 12:43:38	\N
1345	2694	26	2023-02-22 12:43:38	\N
1346	2695	26	2023-02-22 12:43:38	\N
1347	2696	26	2023-02-22 12:43:38	\N
1348	2697	26	2023-02-22 12:43:38	\N
1349	2698	26	2023-02-22 12:43:38	\N
1350	2699	26	2023-02-22 12:43:38	\N
1351	2700	26	2023-02-22 12:43:38	\N
1352	2701	26	2023-02-22 12:43:38	\N
1353	2702	26	2023-02-22 12:43:38	\N
1354	2703	26	2023-02-22 12:43:38	\N
1355	2704	26	2023-02-22 12:43:38	\N
1356	2705	26	2023-02-22 12:43:38	\N
1357	2706	26	2023-02-22 12:43:38	\N
1358	2707	26	2023-02-22 12:43:38	\N
1359	2708	26	2023-02-22 12:43:38	\N
1360	2709	26	2023-02-22 12:43:38	\N
1361	2710	26	2023-02-22 12:43:38	\N
1362	2711	26	2023-02-22 12:43:38	\N
1363	2712	26	2023-02-22 12:43:38	\N
1364	2713	26	2023-02-22 12:43:38	\N
1365	2714	26	2023-02-22 12:43:38	\N
1366	2715	26	2023-02-22 12:43:38	\N
1367	2716	26	2023-02-22 12:43:38	\N
1368	2717	26	2023-02-22 12:43:38	\N
1369	2718	26	2023-02-22 12:43:38	\N
1370	2719	26	2023-02-22 12:43:38	\N
1371	2720	26	2023-02-22 12:43:38	\N
1372	2721	26	2023-02-22 12:43:38	\N
1373	2722	26	2023-02-22 12:43:38	\N
1374	2723	26	2023-02-22 12:43:38	\N
1375	2724	26	2023-02-22 12:43:38	\N
1376	2725	26	2023-02-22 12:43:38	\N
1377	2726	26	2023-02-22 12:43:38	\N
1378	2727	26	2023-02-22 12:43:38	\N
1379	2728	26	2023-02-22 12:43:38	\N
1380	2729	26	2023-02-22 12:43:38	\N
1381	2730	26	2023-02-22 12:43:38	\N
1382	2731	26	2023-02-22 12:43:38	\N
1383	2732	26	2023-02-22 12:43:38	\N
1384	2733	26	2023-02-22 12:43:38	\N
1385	2734	26	2023-02-22 12:43:38	\N
1386	2735	26	2023-02-22 12:43:38	\N
1387	2736	26	2023-02-22 12:43:38	\N
1388	2737	26	2023-02-22 12:43:38	\N
1389	2738	26	2023-02-22 12:43:38	\N
1390	2739	26	2023-02-22 12:43:38	\N
1391	2740	26	2023-02-22 12:43:38	\N
1392	2741	26	2023-02-22 12:43:38	\N
1393	2742	26	2023-02-22 12:43:38	\N
1394	2743	26	2023-02-22 12:43:38	\N
1395	2744	26	2023-02-22 12:43:38	\N
1396	2745	26	2023-02-22 12:43:38	\N
1397	2746	26	2023-02-22 12:43:38	\N
1398	2747	26	2023-02-22 12:43:38	\N
1399	2748	26	2023-02-22 12:43:38	\N
1400	2749	26	2023-02-22 12:43:38	\N
1401	2750	26	2023-02-22 12:43:38	\N
1402	2751	26	2023-02-22 12:43:38	\N
1403	2752	26	2023-02-22 12:43:38	\N
1404	2753	26	2023-02-22 12:43:38	\N
1405	2754	26	2023-02-22 12:43:38	\N
1406	2755	26	2023-02-22 12:43:38	\N
1407	2756	26	2023-02-22 12:43:38	\N
1408	2757	26	2023-02-22 12:43:38	\N
1409	2758	26	2023-02-22 12:43:38	\N
1410	2759	26	2023-02-22 12:43:38	\N
1411	2760	26	2023-02-22 12:43:38	\N
1412	2761	26	2023-02-22 12:43:38	\N
1413	2762	26	2023-02-22 12:43:38	\N
1414	2763	26	2023-02-22 12:43:38	\N
1415	2764	26	2023-02-22 12:43:38	\N
1416	2765	26	2023-02-22 12:43:38	\N
1417	2766	26	2023-02-22 12:43:38	\N
1418	2767	26	2023-02-22 12:43:38	\N
1419	2768	26	2023-02-22 12:43:38	\N
1420	2769	26	2023-02-22 12:43:38	\N
1421	2770	26	2023-02-22 12:43:38	\N
1422	2771	26	2023-02-22 12:43:38	\N
1423	2772	26	2023-02-22 12:43:38	\N
1424	2773	26	2023-02-22 12:43:38	\N
1425	2774	26	2023-02-22 12:43:38	\N
1426	2775	26	2023-02-22 12:43:38	\N
1427	2776	26	2023-02-22 12:43:38	\N
1428	2777	26	2023-02-22 12:43:38	\N
1429	2778	26	2023-02-22 12:43:38	\N
1430	2779	26	2023-02-22 12:43:38	\N
1431	2780	26	2023-02-22 12:43:38	\N
1432	2781	26	2023-02-22 12:43:38	\N
1433	2782	26	2023-02-22 12:43:38	\N
1434	2783	26	2023-02-22 12:43:38	\N
1435	2784	26	2023-02-22 12:43:38	\N
1436	2785	26	2023-02-22 12:43:38	\N
1437	2786	26	2023-02-22 12:43:38	\N
1438	2787	26	2023-02-22 12:43:38	\N
1439	2788	26	2023-02-22 12:43:38	\N
1440	2789	26	2023-02-22 12:43:38	\N
1441	2790	26	2023-02-22 12:43:38	\N
1442	2791	26	2023-02-22 12:43:38	\N
1443	2792	27	2023-02-22 12:44:51	\N
1444	2793	27	2023-02-22 12:44:51	\N
1445	2794	27	2023-02-22 12:44:51	\N
1446	2795	27	2023-02-22 12:44:51	\N
1447	2796	27	2023-02-22 12:44:51	\N
1448	2797	27	2023-02-22 12:44:51	\N
1449	2798	27	2023-02-22 12:44:51	\N
1450	2799	27	2023-02-22 12:44:51	\N
1451	2800	27	2023-02-22 12:44:51	\N
1452	2801	27	2023-02-22 12:44:51	\N
1453	2802	27	2023-02-22 12:44:51	\N
1454	2803	27	2023-02-22 12:44:51	\N
1455	2804	27	2023-02-22 12:44:51	\N
1456	2805	27	2023-02-22 12:44:51	\N
1457	2806	27	2023-02-22 12:44:51	\N
1458	2807	27	2023-02-22 12:44:51	\N
1459	2808	27	2023-02-22 12:44:51	\N
1460	2809	27	2023-02-22 12:44:51	\N
1461	2810	27	2023-02-22 12:44:51	\N
1462	2811	27	2023-02-22 12:44:51	\N
1463	2812	27	2023-02-22 12:44:51	\N
1464	2813	27	2023-02-22 12:44:51	\N
1465	2814	27	2023-02-22 12:44:51	\N
1466	2815	27	2023-02-22 12:44:51	\N
1467	2816	27	2023-02-22 12:44:51	\N
1468	2817	27	2023-02-22 12:44:51	\N
1469	2818	27	2023-02-22 12:44:51	\N
1470	2819	28	2023-02-22 12:46:09	\N
1471	2820	28	2023-02-22 12:46:09	\N
1472	2821	28	2023-02-22 12:46:09	\N
1473	2822	28	2023-02-22 12:46:09	\N
1474	2823	28	2023-02-22 12:46:09	\N
1475	2824	28	2023-02-22 12:46:09	\N
1476	2825	28	2023-02-22 12:46:09	\N
1477	2826	28	2023-02-22 12:46:09	\N
1478	2827	28	2023-02-22 12:46:09	\N
1479	2828	28	2023-02-22 12:46:09	\N
1480	2829	28	2023-02-22 12:46:09	\N
1481	2830	28	2023-02-22 12:46:09	\N
1482	2831	28	2023-02-22 12:46:09	\N
1483	2832	28	2023-02-22 12:46:09	\N
1484	2833	28	2023-02-22 12:46:09	\N
1485	2834	28	2023-02-22 12:46:09	\N
1486	2835	28	2023-02-22 12:46:09	\N
1487	2836	28	2023-02-22 12:46:09	\N
1488	2837	28	2023-02-22 12:46:09	\N
1489	2838	28	2023-02-22 12:46:09	\N
1490	2839	28	2023-02-22 12:46:09	\N
1491	2840	28	2023-02-22 12:46:09	\N
1492	2841	28	2023-02-22 12:46:09	\N
1493	2842	28	2023-02-22 12:46:09	\N
1494	2843	28	2023-02-22 12:46:09	\N
1495	2844	28	2023-02-22 12:46:09	\N
1496	2845	28	2023-02-22 12:46:09	\N
1497	2846	28	2023-02-22 12:46:09	\N
1498	2847	28	2023-02-22 12:46:09	\N
1499	2848	28	2023-02-22 12:46:09	\N
1500	2849	28	2023-02-22 12:46:09	\N
1501	2850	28	2023-02-22 12:46:09	\N
1502	2851	28	2023-02-22 12:46:09	\N
1503	2852	28	2023-02-22 12:46:09	\N
1504	2853	29	2023-02-22 12:47:09	\N
1505	2854	29	2023-02-22 12:47:09	\N
1506	2855	29	2023-02-22 12:47:09	\N
1507	2856	29	2023-02-22 12:47:09	\N
1508	2857	29	2023-02-22 12:47:09	\N
1509	2858	29	2023-02-22 12:47:09	\N
1510	2859	29	2023-02-22 12:47:09	\N
1511	2860	29	2023-02-22 12:47:09	\N
1512	2861	29	2023-02-22 12:47:09	\N
1513	2862	29	2023-02-22 12:47:09	\N
1514	2863	29	2023-02-22 12:47:09	\N
1515	2864	29	2023-02-22 12:47:09	\N
1516	2865	29	2023-02-22 12:47:09	\N
1517	2866	29	2023-02-22 12:47:09	\N
1518	2867	29	2023-02-22 12:47:09	\N
1519	2868	29	2023-02-22 12:47:09	\N
1520	2869	29	2023-02-22 12:47:09	\N
1521	2870	29	2023-02-22 12:47:09	\N
1522	2871	29	2023-02-22 12:47:09	\N
1523	2872	29	2023-02-22 12:47:09	\N
1524	2873	29	2023-02-22 12:47:09	\N
1525	2874	29	2023-02-22 12:47:09	\N
1526	2875	29	2023-02-22 12:47:09	\N
1527	2876	29	2023-02-22 12:47:09	\N
1528	2877	29	2023-02-22 12:47:09	\N
1529	2878	29	2023-02-22 12:47:09	\N
1530	2879	29	2023-02-22 12:47:09	\N
1531	2880	29	2023-02-22 12:47:09	\N
1532	2881	29	2023-02-22 12:47:09	\N
1533	2882	29	2023-02-22 12:47:09	\N
1534	2883	29	2023-02-22 12:47:09	\N
1535	2884	29	2023-02-22 12:47:09	\N
1536	2885	29	2023-02-22 12:47:09	\N
1537	2886	29	2023-02-22 12:47:09	\N
1538	2887	29	2023-02-22 12:47:09	\N
1539	2888	29	2023-02-22 12:47:09	\N
1540	2889	29	2023-02-22 12:47:09	\N
1541	2890	29	2023-02-22 12:47:09	\N
1542	2891	29	2023-02-22 12:47:09	\N
1543	2892	29	2023-02-22 12:47:09	\N
1544	2893	29	2023-02-22 12:47:09	\N
1545	2894	29	2023-02-22 12:47:09	\N
1546	2895	29	2023-02-22 12:47:09	\N
1547	2896	29	2023-02-22 12:47:09	\N
1548	2897	29	2023-02-22 12:47:09	\N
1549	2898	29	2023-02-22 12:47:09	\N
1550	2900	29	2023-02-22 12:47:09	\N
1551	2902	29	2023-02-22 12:47:09	\N
1552	2903	29	2023-02-22 12:47:09	\N
1553	2904	29	2023-02-22 12:47:09	\N
1554	2905	29	2023-02-22 12:47:09	\N
1555	2906	29	2023-02-22 12:47:09	\N
1556	2907	29	2023-02-22 12:47:09	\N
1557	2899	29	2023-02-22 12:47:09	\N
1558	2901	29	2023-02-22 12:47:09	\N
1559	2952	30	2023-02-22 12:48:16	\N
1560	2953	30	2023-02-22 12:48:16	\N
1561	2954	30	2023-02-22 12:48:16	\N
1562	2955	30	2023-02-22 12:48:16	\N
1563	2956	30	2023-02-22 12:48:16	\N
1564	2957	30	2023-02-22 12:48:16	\N
1565	2958	30	2023-02-22 12:48:16	\N
1566	2959	30	2023-02-22 12:48:16	\N
1567	2960	30	2023-02-22 12:48:16	\N
1568	2961	30	2023-02-22 12:48:16	\N
1569	2962	30	2023-02-22 12:48:16	\N
1570	2963	30	2023-02-22 12:48:16	\N
1571	2964	30	2023-02-22 12:48:16	\N
1572	2965	30	2023-02-22 12:48:16	\N
1573	2966	30	2023-02-22 12:48:16	\N
1574	2967	30	2023-02-22 12:48:16	\N
1575	2968	30	2023-02-22 12:48:16	\N
1576	2969	30	2023-02-22 12:48:16	\N
1577	2970	30	2023-02-22 12:48:16	\N
1578	2971	30	2023-02-22 12:48:16	\N
1579	2972	30	2023-02-22 12:48:16	\N
1580	2973	30	2023-02-22 12:48:16	\N
1581	2974	30	2023-02-22 12:48:16	\N
1582	2975	30	2023-02-22 12:48:16	\N
1583	2976	30	2023-02-22 12:48:16	\N
1584	2977	30	2023-02-22 12:48:16	\N
1585	2978	30	2023-02-22 12:48:16	\N
1586	2979	30	2023-02-22 12:48:16	\N
1587	2980	30	2023-02-22 12:48:16	\N
1588	2981	30	2023-02-22 12:48:16	\N
1589	2982	30	2023-02-22 12:48:16	\N
1590	2983	30	2023-02-22 12:48:16	\N
1591	2984	30	2023-02-22 12:48:16	\N
1592	2985	30	2023-02-22 12:48:16	\N
1593	2986	30	2023-02-22 12:48:16	\N
1594	2987	30	2023-02-22 12:48:16	\N
1595	2988	30	2023-02-22 12:48:16	\N
1596	2989	30	2023-02-22 12:48:16	\N
1597	2990	30	2023-02-22 12:48:16	\N
1598	2991	30	2023-02-22 12:48:16	\N
1599	2992	30	2023-02-22 12:48:16	\N
1600	2993	30	2023-02-22 12:48:16	\N
1601	2994	30	2023-02-22 12:48:16	\N
1602	2995	30	2023-02-22 12:48:16	\N
1603	2996	30	2023-02-22 12:48:16	\N
1604	2997	30	2023-02-22 12:48:16	\N
1605	2998	30	2023-02-22 12:48:16	\N
1606	2999	30	2023-02-22 12:48:16	\N
1607	3000	30	2023-02-22 12:48:16	\N
1608	3001	30	2023-02-22 12:48:16	\N
1609	3002	30	2023-02-22 12:48:16	\N
1610	3003	30	2023-02-22 12:48:16	\N
1611	3004	30	2023-02-22 12:48:16	\N
1612	3005	30	2023-02-22 12:48:16	\N
1613	3006	30	2023-02-22 12:48:16	\N
1614	3007	30	2023-02-22 12:48:16	\N
1615	3008	30	2023-02-22 12:48:16	\N
1616	3009	30	2023-02-22 12:48:16	\N
1617	3010	30	2023-02-22 12:48:16	\N
1618	3011	30	2023-02-22 12:48:16	\N
1619	3012	30	2023-02-22 12:48:16	\N
1620	3013	30	2023-02-22 12:48:16	\N
1621	3014	30	2023-02-22 12:48:16	\N
1622	3015	30	2023-02-22 12:48:16	\N
1623	3016	30	2023-02-22 12:48:16	\N
1624	3017	30	2023-02-22 12:48:16	\N
1625	3018	30	2023-02-22 12:48:16	\N
1626	3019	30	2023-02-22 12:48:16	\N
1627	3020	30	2023-02-22 12:48:16	\N
1628	3021	30	2023-02-22 12:48:16	\N
1629	3022	30	2023-02-22 12:48:16	\N
1630	3023	30	2023-02-22 12:48:16	\N
1631	3024	30	2023-02-22 12:48:16	\N
1632	3025	30	2023-02-22 12:48:16	\N
1633	3026	30	2023-02-22 12:48:16	\N
1634	3027	30	2023-02-22 12:48:16	\N
1635	3028	30	2023-02-22 12:48:16	\N
1636	3029	30	2023-02-22 12:48:16	\N
1637	3030	30	2023-02-22 12:48:16	\N
1638	3031	30	2023-02-22 12:48:16	\N
1639	3032	30	2023-02-22 12:48:16	\N
1640	3033	30	2023-02-22 12:48:16	\N
1641	3034	30	2023-02-22 12:48:16	\N
1642	3035	30	2023-02-22 12:48:16	\N
1643	3036	30	2023-02-22 12:48:16	\N
1644	3037	30	2023-02-22 12:48:16	\N
1645	3038	30	2023-02-22 12:48:16	\N
1646	3039	30	2023-02-22 12:48:16	\N
1647	3156	31	2023-02-22 12:50:52	\N
1648	3157	31	2023-02-22 12:50:52	\N
1649	3158	31	2023-02-22 12:50:52	\N
1650	3159	31	2023-02-22 12:50:52	\N
1651	3160	31	2023-02-22 12:50:52	\N
1652	3161	31	2023-02-22 12:50:52	\N
1653	3162	31	2023-02-22 12:50:52	\N
1654	3163	31	2023-02-22 12:50:52	\N
1655	3164	31	2023-02-22 12:50:52	\N
1656	3165	31	2023-02-22 12:50:52	\N
1657	3166	31	2023-02-22 12:50:52	\N
1658	3167	31	2023-02-22 12:50:52	\N
1659	3168	31	2023-02-22 12:50:52	\N
1660	3169	31	2023-02-22 12:50:52	\N
1661	3170	31	2023-02-22 12:50:52	\N
1662	3171	31	2023-02-22 12:50:52	\N
1663	3172	31	2023-02-22 12:50:52	\N
1664	3173	31	2023-02-22 12:50:52	\N
1665	3174	31	2023-02-22 12:50:52	\N
1666	3175	31	2023-02-22 12:50:52	\N
1667	3176	31	2023-02-22 12:50:52	\N
1668	3177	31	2023-02-22 12:50:52	\N
1669	3178	31	2023-02-22 12:50:52	\N
1670	3179	31	2023-02-22 12:50:52	\N
1671	3180	31	2023-02-22 12:50:52	\N
1672	3181	31	2023-02-22 12:50:52	\N
1673	3182	31	2023-02-22 12:50:52	\N
1674	3183	31	2023-02-22 12:50:52	\N
1675	3184	31	2023-02-22 12:50:52	\N
1676	3185	31	2023-02-22 12:50:52	\N
1677	3186	31	2023-02-22 12:50:52	\N
1678	3187	31	2023-02-22 12:50:52	\N
1679	3188	31	2023-02-22 12:50:52	\N
1680	3189	31	2023-02-22 12:50:52	\N
1681	3190	31	2023-02-22 12:50:52	\N
1682	3191	31	2023-02-22 12:50:52	\N
1683	3192	31	2023-02-22 12:50:52	\N
1684	3193	31	2023-02-22 12:50:52	\N
1685	3194	31	2023-02-22 12:50:52	\N
1686	3195	31	2023-02-22 12:50:52	\N
1687	3196	31	2023-02-22 12:50:52	\N
1688	3197	31	2023-02-22 12:50:52	\N
1689	3198	31	2023-02-22 12:50:52	\N
1690	3199	31	2023-02-22 12:50:52	\N
1691	3200	31	2023-02-22 12:50:52	\N
1692	3201	31	2023-02-22 12:50:52	\N
1693	3202	31	2023-02-22 12:50:52	\N
1694	3203	31	2023-02-22 12:50:52	\N
1695	3204	31	2023-02-22 12:50:52	\N
1696	3205	31	2023-02-22 12:50:52	\N
1697	3206	31	2023-02-22 12:50:52	\N
1698	3207	31	2023-02-22 12:50:52	\N
1699	3208	31	2023-02-22 12:50:52	\N
1700	3209	31	2023-02-22 12:50:52	\N
1701	3210	31	2023-02-22 12:50:52	\N
1702	3211	31	2023-02-22 12:50:52	\N
1703	3212	31	2023-02-22 12:50:52	\N
1704	3213	31	2023-02-22 12:50:52	\N
1705	3214	31	2023-02-22 12:50:52	\N
1706	3215	31	2023-02-22 12:50:52	\N
1707	3216	31	2023-02-22 12:50:52	\N
1708	3217	31	2023-02-22 12:50:52	\N
1709	3218	31	2023-02-22 12:50:52	\N
1710	3219	31	2023-02-22 12:50:52	\N
1711	3220	31	2023-02-22 12:50:52	\N
1712	3221	31	2023-02-22 12:50:52	\N
1713	3222	31	2023-02-22 12:50:52	\N
1714	3223	31	2023-02-22 12:50:52	\N
1715	3224	31	2023-02-22 12:50:52	\N
1716	3225	31	2023-02-22 12:50:52	\N
1717	3226	31	2023-02-22 12:50:52	\N
1718	3227	31	2023-02-22 12:50:52	\N
1719	3228	31	2023-02-22 12:50:52	\N
1720	3229	31	2023-02-22 12:50:52	\N
1721	3230	31	2023-02-22 12:50:52	\N
1722	3278	32	2023-02-22 12:51:52	\N
1723	3279	32	2023-02-22 12:51:52	\N
1724	3280	32	2023-02-22 12:51:52	\N
1725	3281	32	2023-02-22 12:51:52	\N
1726	3282	32	2023-02-22 12:51:52	\N
1727	3283	32	2023-02-22 12:51:52	\N
1728	3284	32	2023-02-22 12:51:52	\N
1729	3285	32	2023-02-22 12:51:52	\N
1730	3286	32	2023-02-22 12:51:52	\N
1731	3287	32	2023-02-22 12:51:52	\N
1732	3288	32	2023-02-22 12:51:52	\N
1733	3289	32	2023-02-22 12:51:52	\N
1734	3290	32	2023-02-22 12:51:52	\N
1735	3291	32	2023-02-22 12:51:52	\N
1736	3292	32	2023-02-22 12:51:52	\N
1737	3293	32	2023-02-22 12:51:52	\N
1738	3294	32	2023-02-22 12:51:52	\N
1739	3295	32	2023-02-22 12:51:52	\N
1740	3296	32	2023-02-22 12:51:52	\N
1741	3297	32	2023-02-22 12:51:52	\N
1742	3298	32	2023-02-22 12:51:52	\N
1743	3299	32	2023-02-22 12:51:52	\N
1744	3300	32	2023-02-22 12:51:52	\N
1745	3301	32	2023-02-22 12:51:52	\N
1746	3302	32	2023-02-22 12:51:52	\N
1747	3303	32	2023-02-22 12:51:52	\N
1748	3304	32	2023-02-22 12:51:52	\N
1749	3305	32	2023-02-22 12:51:52	\N
1750	3306	32	2023-02-22 12:51:52	\N
1751	3307	32	2023-02-22 12:51:52	\N
1752	3308	32	2023-02-22 12:51:52	\N
1753	3309	32	2023-02-22 12:51:52	\N
1754	3310	32	2023-02-22 12:51:52	\N
1755	3311	32	2023-02-22 12:51:52	\N
1756	3312	32	2023-02-22 12:51:52	\N
1757	3313	32	2023-02-22 12:51:52	\N
1758	3314	32	2023-02-22 12:51:52	\N
1759	3315	32	2023-02-22 12:51:52	\N
1760	3316	32	2023-02-22 12:51:52	\N
1761	3317	32	2023-02-22 12:51:52	\N
1762	3318	32	2023-02-22 12:51:52	\N
1763	3319	32	2023-02-22 12:51:52	\N
1764	3320	32	2023-02-22 12:51:52	\N
1765	3321	32	2023-02-22 12:51:52	\N
1766	3322	32	2023-02-22 12:51:52	\N
1767	3323	32	2023-02-22 12:51:52	\N
1768	3324	32	2023-02-22 12:51:52	\N
1769	3325	32	2023-02-22 12:51:52	\N
1770	3326	32	2023-02-22 12:51:52	\N
1771	3327	32	2023-02-22 12:51:52	\N
1772	3328	32	2023-02-22 12:51:52	\N
1773	3329	32	2023-02-22 12:51:52	\N
1774	3330	32	2023-02-22 12:51:52	\N
1775	3331	32	2023-02-22 12:51:52	\N
1776	3332	32	2023-02-22 12:51:52	\N
1777	3333	32	2023-02-22 12:51:52	\N
1778	3334	32	2023-02-22 12:51:52	\N
1779	3335	32	2023-02-22 12:51:52	\N
1780	3336	32	2023-02-22 12:51:52	\N
1781	3337	32	2023-02-22 12:51:52	\N
1782	3338	32	2023-02-22 12:51:52	\N
1783	3339	32	2023-02-22 12:51:52	\N
1784	3340	32	2023-02-22 12:51:52	\N
1785	3341	32	2023-02-22 12:51:52	\N
1786	3342	32	2023-02-22 12:51:52	\N
1787	3343	32	2023-02-22 12:51:52	\N
1788	3344	32	2023-02-22 12:51:52	\N
1789	3345	32	2023-02-22 12:51:52	\N
1790	3346	32	2023-02-22 12:51:52	\N
1791	3347	32	2023-02-22 12:51:52	\N
1792	3348	32	2023-02-22 12:51:52	\N
1793	3349	32	2023-02-22 12:51:52	\N
1794	3350	32	2023-02-22 12:51:52	\N
1795	3351	32	2023-02-22 12:51:52	\N
1796	3352	32	2023-02-22 12:51:52	\N
1797	3353	32	2023-02-22 12:51:52	\N
1798	3354	32	2023-02-22 12:51:52	\N
1799	3355	32	2023-02-22 12:51:52	\N
1800	3356	32	2023-02-22 12:51:52	\N
1801	3357	32	2023-02-22 12:51:52	\N
1802	3358	32	2023-02-22 12:51:52	\N
1803	3359	32	2023-02-22 12:51:52	\N
1804	3360	32	2023-02-22 12:51:52	\N
1805	3361	32	2023-02-22 12:51:52	\N
1806	3362	32	2023-02-22 12:51:52	\N
1807	3363	32	2023-02-22 12:51:52	\N
1808	3364	32	2023-02-22 12:51:52	\N
1809	3365	32	2023-02-22 12:51:52	\N
1810	3366	32	2023-02-22 12:51:52	\N
1811	3367	32	2023-02-22 12:51:52	\N
1812	3368	32	2023-02-22 12:51:52	\N
1813	3369	32	2023-02-22 12:51:52	\N
1814	3370	32	2023-02-22 12:51:52	\N
1815	3371	32	2023-02-22 12:51:52	\N
1816	3372	32	2023-02-22 12:51:52	\N
1817	3373	32	2023-02-22 12:51:52	\N
1818	3374	32	2023-02-22 12:51:52	\N
1819	3375	32	2023-02-22 12:51:52	\N
1820	3376	32	2023-02-22 12:51:52	\N
1821	3377	32	2023-02-22 12:51:52	\N
1822	3378	32	2023-02-22 12:51:52	\N
1823	3379	32	2023-02-22 12:51:52	\N
1824	3380	32	2023-02-22 12:51:52	\N
1825	3381	32	2023-02-22 12:51:52	\N
1826	3382	32	2023-02-22 12:51:52	\N
1827	3383	32	2023-02-22 12:51:52	\N
1828	3384	32	2023-02-22 12:51:52	\N
1829	3385	32	2023-02-22 12:51:52	\N
1830	3386	32	2023-02-22 12:51:52	\N
1831	3387	32	2023-02-22 12:51:52	\N
1832	3388	32	2023-02-22 12:51:52	\N
1833	3389	32	2023-02-22 12:51:52	\N
1834	3390	32	2023-02-22 12:51:52	\N
1835	3391	32	2023-02-22 12:51:52	\N
1836	3392	32	2023-02-22 12:51:52	\N
1837	3393	32	2023-02-22 12:51:52	\N
1838	3394	32	2023-02-22 12:51:52	\N
1839	3395	32	2023-02-22 12:51:52	\N
1840	3396	32	2023-02-22 12:51:52	\N
1841	3397	32	2023-02-22 12:51:52	\N
1842	3398	33	2023-02-22 12:53:25	\N
1843	3399	33	2023-02-22 12:53:25	\N
1844	3400	33	2023-02-22 12:53:25	\N
1845	3401	33	2023-02-22 12:53:25	\N
1846	3402	33	2023-02-22 12:53:25	\N
1847	3403	33	2023-02-22 12:53:25	\N
1848	3404	33	2023-02-22 12:53:25	\N
1849	3405	33	2023-02-22 12:53:25	\N
1850	3406	33	2023-02-22 12:53:25	\N
1851	3407	33	2023-02-22 12:53:25	\N
1852	3408	33	2023-02-22 12:53:25	\N
1853	3409	33	2023-02-22 12:53:25	\N
1854	3410	33	2023-02-22 12:53:25	\N
1855	3411	33	2023-02-22 12:53:25	\N
1856	3412	33	2023-02-22 12:53:25	\N
1857	3413	33	2023-02-22 12:53:25	\N
1858	3414	33	2023-02-22 12:53:25	\N
1859	3415	33	2023-02-22 12:53:25	\N
1860	3416	33	2023-02-22 12:53:25	\N
1861	3417	33	2023-02-22 12:53:25	\N
1862	3418	33	2023-02-22 12:53:25	\N
1863	3419	33	2023-02-22 12:53:25	\N
1864	3420	33	2023-02-22 12:53:25	\N
1865	3421	33	2023-02-22 12:53:25	\N
1866	3422	33	2023-02-22 12:53:25	\N
1867	3423	33	2023-02-22 12:53:25	\N
1868	3424	33	2023-02-22 12:53:25	\N
1869	3425	33	2023-02-22 12:53:25	\N
1870	3426	33	2023-02-22 12:53:25	\N
1871	3427	33	2023-02-22 12:53:25	\N
1872	3428	33	2023-02-22 12:53:25	\N
1873	3429	33	2023-02-22 12:53:25	\N
1874	3430	33	2023-02-22 12:53:25	\N
1875	3431	33	2023-02-22 12:53:25	\N
1876	3432	33	2023-02-22 12:53:25	\N
1877	3433	33	2023-02-22 12:53:25	\N
1878	3434	33	2023-02-22 12:53:25	\N
1879	3435	33	2023-02-22 12:53:25	\N
1880	3436	33	2023-02-22 12:53:25	\N
1881	3437	33	2023-02-22 12:53:25	\N
1882	3438	33	2023-02-22 12:53:25	\N
1883	3439	33	2023-02-22 12:53:25	\N
1884	3440	33	2023-02-22 12:53:25	\N
1885	3441	33	2023-02-22 12:53:25	\N
1886	3442	33	2023-02-22 12:53:25	\N
1887	3443	33	2023-02-22 12:53:25	\N
1888	3444	33	2023-02-22 12:53:25	\N
1889	3445	33	2023-02-22 12:53:25	\N
1890	3446	33	2023-02-22 12:53:25	\N
1891	3447	33	2023-02-22 12:53:25	\N
1892	3448	33	2023-02-22 12:53:25	\N
1893	3449	33	2023-02-22 12:53:25	\N
1894	3450	33	2023-02-22 12:53:25	\N
1895	3503	34	2023-02-22 12:54:24	\N
1896	3504	34	2023-02-22 12:54:24	\N
1897	3505	34	2023-02-22 12:54:24	\N
1898	3506	34	2023-02-22 12:54:24	\N
1899	3507	34	2023-02-22 12:54:24	\N
1900	3508	34	2023-02-22 12:54:24	\N
1901	3509	34	2023-02-22 12:54:24	\N
1902	3510	34	2023-02-22 12:54:24	\N
1903	3511	34	2023-02-22 12:54:24	\N
1904	3512	34	2023-02-22 12:54:24	\N
1905	3513	34	2023-02-22 12:54:24	\N
1906	3514	34	2023-02-22 12:54:24	\N
1907	3515	34	2023-02-22 12:54:24	\N
1908	3516	34	2023-02-22 12:54:24	\N
1909	3517	34	2023-02-22 12:54:24	\N
1910	3518	34	2023-02-22 12:54:24	\N
1911	3519	34	2023-02-22 12:54:24	\N
1912	3520	34	2023-02-22 12:54:24	\N
1913	3521	34	2023-02-22 12:54:24	\N
1914	3522	34	2023-02-22 12:54:24	\N
1915	3523	34	2023-02-22 12:54:24	\N
1916	3524	34	2023-02-22 12:54:24	\N
1917	3525	34	2023-02-22 12:54:24	\N
1918	3526	34	2023-02-22 12:54:24	\N
1919	3527	34	2023-02-22 12:54:24	\N
1920	3528	34	2023-02-22 12:54:24	\N
1921	3529	34	2023-02-22 12:54:24	\N
1922	3530	34	2023-02-22 12:54:24	\N
1923	3531	34	2023-02-22 12:54:24	\N
1924	3532	34	2023-02-22 12:54:24	\N
1925	3533	34	2023-02-22 12:54:24	\N
1926	3534	34	2023-02-22 12:54:24	\N
1927	3535	34	2023-02-22 12:54:24	\N
1928	3536	34	2023-02-22 12:54:24	\N
1929	3537	34	2023-02-22 12:54:24	\N
1930	3538	34	2023-02-22 12:54:24	\N
1931	3539	34	2023-02-22 12:54:24	\N
1932	3540	34	2023-02-22 12:54:24	\N
1933	3541	34	2023-02-22 12:54:24	\N
1934	3542	34	2023-02-22 12:54:24	\N
1935	3543	34	2023-02-22 12:54:24	\N
1936	3544	34	2023-02-22 12:54:24	\N
1937	3545	34	2023-02-22 12:54:24	\N
1938	3546	34	2023-02-22 12:54:24	\N
1939	3547	34	2023-02-22 12:54:24	\N
1940	3548	34	2023-02-22 12:54:24	\N
1941	3549	34	2023-02-22 12:54:24	\N
1942	3550	34	2023-02-22 12:54:24	\N
1943	3551	34	2023-02-22 12:54:24	\N
1944	3552	34	2023-02-22 12:54:24	\N
1945	3553	34	2023-02-22 12:54:24	\N
1946	3554	34	2023-02-22 12:54:24	\N
1947	3555	34	2023-02-22 12:54:24	\N
1948	3556	34	2023-02-22 12:54:24	\N
1949	3612	35	2023-02-22 12:55:13	\N
1950	3613	35	2023-02-22 12:55:13	\N
1951	3614	35	2023-02-22 12:55:13	\N
1952	3615	35	2023-02-22 12:55:13	\N
1953	3616	35	2023-02-22 12:55:13	\N
1954	3617	35	2023-02-22 12:55:13	\N
1955	3618	35	2023-02-22 12:55:13	\N
1956	3619	35	2023-02-22 12:55:13	\N
1957	3620	35	2023-02-22 12:55:13	\N
1958	3621	35	2023-02-22 12:55:13	\N
1959	3622	35	2023-02-22 12:55:13	\N
1960	3623	35	2023-02-22 12:55:13	\N
1961	3624	35	2023-02-22 12:55:13	\N
1962	3625	35	2023-02-22 12:55:13	\N
1963	3626	35	2023-02-22 12:55:13	\N
1964	3627	35	2023-02-22 12:55:13	\N
1965	3628	35	2023-02-22 12:55:13	\N
1966	3629	35	2023-02-22 12:55:13	\N
1967	3630	35	2023-02-22 12:55:13	\N
1968	3631	35	2023-02-22 12:55:13	\N
1969	3632	35	2023-02-22 12:55:13	\N
1970	3633	35	2023-02-22 12:55:13	\N
1971	3634	35	2023-02-22 12:55:13	\N
1972	3635	35	2023-02-22 12:55:13	\N
1973	3636	35	2023-02-22 12:55:13	\N
1974	3637	35	2023-02-22 12:55:13	\N
1975	3638	35	2023-02-22 12:55:13	\N
1976	3639	35	2023-02-22 12:55:13	\N
1977	3640	35	2023-02-22 12:55:13	\N
1978	3641	35	2023-02-22 12:55:13	\N
1979	3642	35	2023-02-22 12:55:13	\N
1980	3643	35	2023-02-22 12:55:13	\N
1981	3644	35	2023-02-22 12:55:13	\N
1982	3645	35	2023-02-22 12:55:13	\N
1983	3646	35	2023-02-22 12:55:13	\N
1984	3647	35	2023-02-22 12:55:13	\N
1985	3648	35	2023-02-22 12:55:13	\N
1986	3649	35	2023-02-22 12:55:13	\N
1987	3650	35	2023-02-22 12:55:13	\N
1988	3651	35	2023-02-22 12:55:13	\N
1989	3652	35	2023-02-22 12:55:13	\N
1990	3653	35	2023-02-22 12:55:13	\N
1991	3654	35	2023-02-22 12:55:13	\N
1992	3655	35	2023-02-22 12:55:13	\N
1993	3656	35	2023-02-22 12:55:13	\N
1994	3657	35	2023-02-22 12:55:13	\N
1995	3658	35	2023-02-22 12:55:13	\N
1996	3659	35	2023-02-22 12:55:13	\N
1997	3660	35	2023-02-22 12:55:13	\N
1998	3661	35	2023-02-22 12:55:13	\N
1999	3662	35	2023-02-22 12:55:13	\N
2000	3663	35	2023-02-22 12:55:13	\N
2001	3664	35	2023-02-22 12:55:13	\N
2002	3665	35	2023-02-22 12:55:13	\N
2003	3666	35	2023-02-22 12:55:13	\N
2004	3667	35	2023-02-22 12:55:13	\N
2005	3668	35	2023-02-22 12:55:13	\N
2006	3669	35	2023-02-22 12:55:13	\N
2007	3670	35	2023-02-22 12:55:13	\N
2008	3671	35	2023-02-22 12:55:13	\N
2009	3672	35	2023-02-22 12:55:13	\N
2010	3673	35	2023-02-22 12:55:13	\N
2011	3674	35	2023-02-22 12:55:13	\N
2012	3675	35	2023-02-22 12:55:13	\N
2013	3676	35	2023-02-22 12:55:13	\N
2014	3677	35	2023-02-22 12:55:13	\N
2015	3678	35	2023-02-22 12:55:13	\N
2016	3679	35	2023-02-22 12:55:13	\N
2017	3680	35	2023-02-22 12:55:13	\N
2018	3681	35	2023-02-22 12:55:13	\N
2019	3682	35	2023-02-22 12:55:13	\N
2020	3683	35	2023-02-22 12:55:13	\N
2021	3684	35	2023-02-22 12:55:13	\N
2022	3685	35	2023-02-22 12:55:13	\N
2023	3686	35	2023-02-22 12:55:13	\N
2024	3687	35	2023-02-22 12:55:13	\N
2025	3688	35	2023-02-22 12:55:13	\N
2026	3689	35	2023-02-22 12:55:13	\N
2027	3690	35	2023-02-22 12:55:13	\N
2028	3691	35	2023-02-22 12:55:13	\N
2029	3692	35	2023-02-22 12:55:13	\N
2030	3693	35	2023-02-22 12:55:13	\N
2031	3694	35	2023-02-22 12:55:13	\N
2032	3695	35	2023-02-22 12:55:13	\N
2033	3696	35	2023-02-22 12:55:13	\N
2034	3697	35	2023-02-22 12:55:13	\N
2035	3698	35	2023-02-22 12:55:13	\N
2036	3699	35	2023-02-22 12:55:13	\N
2037	3700	35	2023-02-22 12:55:13	\N
2038	3701	35	2023-02-22 12:55:13	\N
2039	3702	35	2023-02-22 12:55:13	\N
2040	3703	35	2023-02-22 12:55:13	\N
2041	3704	35	2023-02-22 12:55:13	\N
2042	3705	35	2023-02-22 12:55:13	\N
2043	3706	35	2023-02-22 12:55:13	\N
2044	3707	35	2023-02-22 12:55:13	\N
2045	3708	35	2023-02-22 12:55:13	\N
2046	3709	35	2023-02-22 12:55:13	\N
2047	3710	35	2023-02-22 12:55:13	\N
2048	3711	35	2023-02-22 12:55:13	\N
2049	3712	35	2023-02-22 12:55:13	\N
2050	3713	35	2023-02-22 12:55:13	\N
2051	3714	35	2023-02-22 12:55:13	\N
2052	3715	35	2023-02-22 12:55:13	\N
2053	3716	35	2023-02-22 12:55:13	\N
2054	3717	35	2023-02-22 12:55:13	\N
2055	3718	35	2023-02-22 12:55:13	\N
2056	3719	35	2023-02-22 12:55:13	\N
2057	3720	35	2023-02-22 12:55:13	\N
2058	3721	35	2023-02-22 12:55:13	\N
2059	3722	35	2023-02-22 12:55:13	\N
2060	3723	35	2023-02-22 12:55:13	\N
2061	3724	35	2023-02-22 12:55:13	\N
2062	3725	35	2023-02-22 12:55:13	\N
2063	3726	35	2023-02-22 12:55:13	\N
2064	3727	35	2023-02-22 12:55:13	\N
2065	3728	35	2023-02-22 12:55:13	\N
2066	3729	35	2023-02-22 12:55:13	\N
2067	3730	35	2023-02-22 12:55:13	\N
2068	3731	35	2023-02-22 12:55:13	\N
2069	3732	35	2023-02-22 12:55:13	\N
2070	3733	35	2023-02-22 12:55:13	\N
2071	3734	35	2023-02-22 12:55:13	\N
2072	3735	35	2023-02-22 12:55:13	\N
2073	3736	35	2023-02-22 12:55:13	\N
2074	3737	35	2023-02-22 12:55:13	\N
2075	3738	35	2023-02-22 12:55:13	\N
2076	3739	35	2023-02-22 12:55:13	\N
2077	3740	35	2023-02-22 12:55:13	\N
2078	3741	35	2023-02-22 12:55:13	\N
2079	3742	35	2023-02-22 12:55:13	\N
2080	3743	35	2023-02-22 12:55:13	\N
2081	3744	35	2023-02-22 12:55:13	\N
2082	3557	36	2023-02-22 12:57:10	\N
2083	3558	36	2023-02-22 12:57:10	\N
2084	3559	36	2023-02-22 12:57:10	\N
2085	3560	36	2023-02-22 12:57:10	\N
2086	3561	36	2023-02-22 12:57:10	\N
2087	3562	36	2023-02-22 12:57:10	\N
2088	3563	36	2023-02-22 12:57:10	\N
2089	3564	36	2023-02-22 12:57:10	\N
2090	3565	36	2023-02-22 12:57:10	\N
2091	3566	36	2023-02-22 12:57:10	\N
2092	3567	36	2023-02-22 12:57:10	\N
2093	3568	36	2023-02-22 12:57:10	\N
2094	3569	36	2023-02-22 12:57:10	\N
2095	3570	36	2023-02-22 12:57:10	\N
2096	3571	36	2023-02-22 12:57:10	\N
2097	3572	36	2023-02-22 12:57:10	\N
2098	3573	36	2023-02-22 12:57:10	\N
2099	3574	36	2023-02-22 12:57:10	\N
2100	3575	36	2023-02-22 12:57:10	\N
2101	3576	36	2023-02-22 12:57:10	\N
2102	3577	36	2023-02-22 12:57:10	\N
2103	3578	36	2023-02-22 12:57:10	\N
2104	3579	36	2023-02-22 12:57:10	\N
2105	3580	36	2023-02-22 12:57:10	\N
2106	3581	36	2023-02-22 12:57:10	\N
2107	3582	36	2023-02-22 12:57:10	\N
2108	3583	36	2023-02-22 12:57:10	\N
2109	3584	36	2023-02-22 12:57:10	\N
2110	3585	36	2023-02-22 12:57:10	\N
2111	3586	36	2023-02-22 12:57:10	\N
2112	3587	36	2023-02-22 12:57:10	\N
2113	3588	36	2023-02-22 12:57:10	\N
2114	3589	36	2023-02-22 12:57:10	\N
2115	3590	36	2023-02-22 12:57:10	\N
2116	3591	36	2023-02-22 12:57:10	\N
2117	3592	36	2023-02-22 12:57:10	\N
2118	3593	36	2023-02-22 12:57:10	\N
2119	3594	36	2023-02-22 12:57:10	\N
2120	3595	36	2023-02-22 12:57:10	\N
2121	3596	36	2023-02-22 12:57:10	\N
2122	3597	36	2023-02-22 12:57:10	\N
2123	3598	36	2023-02-22 12:57:10	\N
2124	3599	36	2023-02-22 12:57:10	\N
2125	3600	36	2023-02-22 12:57:10	\N
2126	3601	36	2023-02-22 12:57:10	\N
2127	3602	36	2023-02-22 12:57:10	\N
2128	3603	36	2023-02-22 12:57:10	\N
2129	3604	36	2023-02-22 12:57:10	\N
2130	3605	36	2023-02-22 12:57:10	\N
2131	3606	36	2023-02-22 12:57:10	\N
2132	3607	36	2023-02-22 12:57:10	\N
2133	3608	36	2023-02-22 12:57:10	\N
2134	3609	36	2023-02-22 12:57:10	\N
2135	3610	36	2023-02-22 12:57:10	\N
2136	3611	36	2023-02-22 12:57:10	\N
2137	3883	37	2023-02-22 12:58:06	\N
2138	3884	37	2023-02-22 12:58:06	\N
2139	3885	37	2023-02-22 12:58:06	\N
2140	3886	37	2023-02-22 12:58:06	\N
2141	3887	37	2023-02-22 12:58:06	\N
2142	3888	37	2023-02-22 12:58:06	\N
2143	3889	37	2023-02-22 12:58:06	\N
2144	3890	37	2023-02-22 12:58:06	\N
2145	3891	37	2023-02-22 12:58:06	\N
2146	3892	37	2023-02-22 12:58:06	\N
2147	3893	37	2023-02-22 12:58:06	\N
2148	3894	37	2023-02-22 12:58:06	\N
2149	3895	37	2023-02-22 12:58:06	\N
2150	3896	37	2023-02-22 12:58:06	\N
2151	3897	37	2023-02-22 12:58:06	\N
2152	3898	37	2023-02-22 12:58:06	\N
2153	3899	37	2023-02-22 12:58:06	\N
2154	3900	37	2023-02-22 12:58:06	\N
2155	3901	37	2023-02-22 12:58:06	\N
2156	3902	37	2023-02-22 12:58:06	\N
2157	3903	37	2023-02-22 12:58:06	\N
2158	3904	37	2023-02-22 12:58:06	\N
2159	3905	37	2023-02-22 12:58:06	\N
2160	3906	37	2023-02-22 12:58:06	\N
2161	3907	37	2023-02-22 12:58:06	\N
2162	3908	38	2023-02-22 12:58:52	\N
2163	3909	38	2023-02-22 12:58:52	\N
2164	3910	38	2023-02-22 12:58:52	\N
2165	3911	38	2023-02-22 12:58:52	\N
2166	3912	38	2023-02-22 12:58:52	\N
2167	3913	38	2023-02-22 12:58:52	\N
2168	3914	38	2023-02-22 12:58:52	\N
2169	3915	38	2023-02-22 12:58:52	\N
2170	3916	38	2023-02-22 12:58:52	\N
2171	3917	38	2023-02-22 12:58:52	\N
2172	3918	38	2023-02-22 12:58:52	\N
2173	3919	38	2023-02-22 12:58:52	\N
2174	3920	38	2023-02-22 12:58:52	\N
2175	3921	38	2023-02-22 12:58:52	\N
2176	3922	38	2023-02-22 12:58:52	\N
2177	3923	38	2023-02-22 12:58:52	\N
2178	3924	38	2023-02-22 12:58:52	\N
2179	3925	38	2023-02-22 12:58:52	\N
2180	3926	38	2023-02-22 12:58:52	\N
2181	3927	38	2023-02-22 12:58:52	\N
2182	3928	38	2023-02-22 12:58:52	\N
2183	3929	38	2023-02-22 12:58:52	\N
2184	3930	38	2023-02-22 12:58:52	\N
2185	3931	38	2023-02-22 12:58:52	\N
2186	3932	38	2023-02-22 12:58:52	\N
2187	3933	38	2023-02-22 12:58:52	\N
2188	3934	38	2023-02-22 12:58:52	\N
2189	3935	38	2023-02-22 12:58:52	\N
2190	3936	38	2023-02-22 12:58:52	\N
2191	3937	38	2023-02-22 12:58:52	\N
2192	3938	38	2023-02-22 12:58:52	\N
2193	3939	38	2023-02-22 12:58:52	\N
2194	3940	38	2023-02-22 12:58:52	\N
2195	3941	38	2023-02-22 12:58:52	\N
2196	3942	38	2023-02-22 12:58:52	\N
2197	3943	38	2023-02-22 12:58:52	\N
2198	3944	38	2023-02-22 12:58:52	\N
2199	3945	38	2023-02-22 12:58:52	\N
2200	3946	38	2023-02-22 12:58:52	\N
2201	3947	38	2023-02-22 12:58:52	\N
2202	3948	38	2023-02-22 12:58:52	\N
2203	4043	39	2023-02-22 13:00:32	\N
2204	3949	39	2023-02-22 13:00:32	\N
2205	3950	39	2023-02-22 13:00:32	\N
2206	3951	39	2023-02-22 13:00:32	\N
2207	3952	39	2023-02-22 13:00:32	\N
2208	3953	39	2023-02-22 13:00:32	\N
2209	3954	39	2023-02-22 13:00:32	\N
2210	3955	39	2023-02-22 13:00:32	\N
2211	3956	39	2023-02-22 13:00:32	\N
2212	3957	39	2023-02-22 13:00:32	\N
2213	3958	39	2023-02-22 13:00:32	\N
2214	3959	39	2023-02-22 13:00:32	\N
2215	3960	39	2023-02-22 13:00:32	\N
2216	3961	39	2023-02-22 13:00:32	\N
2217	3962	39	2023-02-22 13:00:32	\N
2218	3963	39	2023-02-22 13:00:32	\N
2219	3964	39	2023-02-22 13:00:32	\N
2220	3965	39	2023-02-22 13:00:32	\N
2221	4044	39	2023-02-22 13:00:32	\N
2222	3966	39	2023-02-22 13:00:32	\N
2223	3967	39	2023-02-22 13:00:32	\N
2224	3968	39	2023-02-22 13:00:32	\N
2225	3969	39	2023-02-22 13:00:32	\N
2226	3970	39	2023-02-22 13:00:32	\N
2227	3971	39	2023-02-22 13:00:32	\N
2228	3972	39	2023-02-22 13:00:32	\N
2229	3973	39	2023-02-22 13:00:32	\N
2230	3974	39	2023-02-22 13:00:32	\N
2231	3975	39	2023-02-22 13:00:32	\N
2232	3976	39	2023-02-22 13:00:32	\N
2233	3977	39	2023-02-22 13:00:32	\N
2234	3978	39	2023-02-22 13:00:32	\N
2235	3979	39	2023-02-22 13:00:32	\N
2236	3980	39	2023-02-22 13:00:32	\N
2237	3981	39	2023-02-22 13:00:32	\N
2238	3982	39	2023-02-22 13:00:32	\N
2239	3983	39	2023-02-22 13:00:32	\N
2240	3984	39	2023-02-22 13:00:32	\N
2241	3985	39	2023-02-22 13:00:32	\N
2242	3986	39	2023-02-22 13:00:32	\N
2243	3987	39	2023-02-22 13:00:32	\N
2244	3988	39	2023-02-22 13:00:32	\N
2245	3989	39	2023-02-22 13:00:32	\N
2246	3990	39	2023-02-22 13:00:32	\N
2247	3991	39	2023-02-22 13:00:32	\N
2248	3992	39	2023-02-22 13:00:32	\N
2249	3993	39	2023-02-22 13:00:32	\N
2250	3994	39	2023-02-22 13:00:32	\N
2251	3995	39	2023-02-22 13:00:32	\N
2252	3996	39	2023-02-22 13:00:32	\N
2253	3997	39	2023-02-22 13:00:32	\N
2254	3998	39	2023-02-22 13:00:32	\N
2255	3999	39	2023-02-22 13:00:32	\N
2256	4000	39	2023-02-22 13:00:32	\N
2257	4001	39	2023-02-22 13:00:32	\N
2258	4002	39	2023-02-22 13:00:32	\N
2259	4003	39	2023-02-22 13:00:32	\N
2260	4004	39	2023-02-22 13:00:32	\N
2261	4005	39	2023-02-22 13:00:32	\N
2262	4006	39	2023-02-22 13:00:32	\N
2263	4007	39	2023-02-22 13:00:32	\N
2264	4008	39	2023-02-22 13:00:32	\N
2265	4009	39	2023-02-22 13:00:32	\N
2266	4010	39	2023-02-22 13:00:32	\N
2267	4011	39	2023-02-22 13:00:32	\N
2268	4012	39	2023-02-22 13:00:32	\N
2269	4013	39	2023-02-22 13:00:32	\N
2270	4014	39	2023-02-22 13:00:32	\N
2271	4015	39	2023-02-22 13:00:32	\N
2272	4016	39	2023-02-22 13:00:32	\N
2273	4017	39	2023-02-22 13:00:32	\N
2274	4018	39	2023-02-22 13:00:32	\N
2275	4019	39	2023-02-22 13:00:32	\N
2276	4020	39	2023-02-22 13:00:32	\N
2277	4021	39	2023-02-22 13:00:32	\N
2278	4022	39	2023-02-22 13:00:32	\N
2279	4023	39	2023-02-22 13:00:32	\N
2280	4024	39	2023-02-22 13:00:32	\N
2281	4025	39	2023-02-22 13:00:32	\N
2282	4026	39	2023-02-22 13:00:32	\N
2283	4027	39	2023-02-22 13:00:32	\N
2284	4028	39	2023-02-22 13:00:32	\N
2285	4029	39	2023-02-22 13:00:32	\N
2286	4030	39	2023-02-22 13:00:32	\N
2287	4031	39	2023-02-22 13:00:32	\N
2288	4032	39	2023-02-22 13:00:32	\N
2289	4033	39	2023-02-22 13:00:32	\N
2290	4034	39	2023-02-22 13:00:32	\N
2291	4035	39	2023-02-22 13:00:32	\N
2292	4036	39	2023-02-22 13:00:32	\N
2293	4037	39	2023-02-22 13:00:32	\N
2294	4038	39	2023-02-22 13:00:32	\N
2295	4039	39	2023-02-22 13:00:32	\N
2296	4040	39	2023-02-22 13:00:32	\N
2297	4041	39	2023-02-22 13:00:32	\N
2298	4042	39	2023-02-22 13:00:32	\N
2299	4045	39	2023-02-22 13:00:32	\N
2300	4046	39	2023-02-22 13:00:32	\N
2301	4047	39	2023-02-22 13:00:32	\N
2302	4048	39	2023-02-22 13:00:32	\N
2303	4049	39	2023-02-22 13:00:32	\N
2304	4050	39	2023-02-22 13:00:32	\N
2305	4051	39	2023-02-22 13:00:32	\N
2306	4052	39	2023-02-22 13:00:32	\N
2307	4053	39	2023-02-22 13:00:32	\N
2308	4054	39	2023-02-22 13:00:32	\N
2309	4055	39	2023-02-22 13:00:32	\N
2310	4056	39	2023-02-22 13:00:32	\N
2311	4057	39	2023-02-22 13:00:32	\N
2312	4058	39	2023-02-22 13:00:32	\N
2313	4059	39	2023-02-22 13:00:32	\N
2314	4060	39	2023-02-22 13:00:32	\N
2315	4061	39	2023-02-22 13:00:32	\N
2316	4062	39	2023-02-22 13:00:32	\N
2317	4063	39	2023-02-22 13:00:32	\N
2318	4064	39	2023-02-22 13:00:32	\N
2319	4065	39	2023-02-22 13:00:32	\N
2320	4066	39	2023-02-22 13:00:32	\N
2321	4067	39	2023-02-22 13:00:32	\N
2322	4068	39	2023-02-22 13:00:32	\N
2323	4069	39	2023-02-22 13:00:32	\N
2324	4070	39	2023-02-22 13:00:32	\N
2325	4071	39	2023-02-22 13:00:32	\N
2326	4072	39	2023-02-22 13:00:32	\N
2327	4073	39	2023-02-22 13:00:32	\N
2328	4074	39	2023-02-22 13:00:32	\N
2329	4075	39	2023-02-22 13:00:32	\N
2330	4076	39	2023-02-22 13:00:32	\N
2331	4213	40	2023-02-22 13:04:05	\N
2332	4214	40	2023-02-22 13:04:05	\N
2333	4215	40	2023-02-22 13:04:05	\N
2334	4216	40	2023-02-22 13:04:05	\N
2335	4217	40	2023-02-22 13:04:05	\N
2336	4218	40	2023-02-22 13:04:05	\N
2337	4219	40	2023-02-22 13:04:05	\N
2338	4220	40	2023-02-22 13:04:05	\N
2339	4221	40	2023-02-22 13:04:05	\N
2340	4222	40	2023-02-22 13:04:05	\N
2341	4223	40	2023-02-22 13:04:05	\N
2342	4224	40	2023-02-22 13:04:05	\N
2343	4225	40	2023-02-22 13:04:05	\N
2344	4226	40	2023-02-22 13:04:05	\N
2345	4227	40	2023-02-22 13:04:05	\N
2346	4228	40	2023-02-22 13:04:05	\N
2347	4229	41	2023-02-22 13:05:00	\N
2348	4230	41	2023-02-22 13:05:00	\N
2349	4231	41	2023-02-22 13:05:00	\N
2350	4232	41	2023-02-22 13:05:00	\N
2351	4233	41	2023-02-22 13:05:00	\N
2352	4234	41	2023-02-22 13:05:00	\N
2353	4235	41	2023-02-22 13:05:00	\N
2354	4236	41	2023-02-22 13:05:00	\N
2355	4237	41	2023-02-22 13:05:00	\N
2356	4238	41	2023-02-22 13:05:00	\N
2357	4239	41	2023-02-22 13:05:00	\N
2358	4240	41	2023-02-22 13:05:00	\N
2359	4241	41	2023-02-22 13:05:00	\N
2360	4242	41	2023-02-22 13:05:00	\N
2361	4243	41	2023-02-22 13:05:00	\N
2362	4244	41	2023-02-22 13:05:00	\N
2363	4245	41	2023-02-22 13:05:00	\N
2364	4246	41	2023-02-22 13:05:00	\N
2365	4247	41	2023-02-22 13:05:00	\N
2366	4248	41	2023-02-22 13:05:00	\N
2367	4249	41	2023-02-22 13:05:00	\N
2368	4250	41	2023-02-22 13:05:00	\N
2369	4251	41	2023-02-22 13:05:00	\N
2370	4252	41	2023-02-22 13:05:00	\N
2371	4253	41	2023-02-22 13:05:00	\N
2372	4254	41	2023-02-22 13:05:00	\N
2373	4255	41	2023-02-22 13:05:00	\N
2374	4256	41	2023-02-22 13:05:00	\N
2375	4257	41	2023-02-22 13:05:00	\N
2376	4258	41	2023-02-22 13:05:00	\N
2377	4259	41	2023-02-22 13:05:00	\N
2378	4260	41	2023-02-22 13:05:00	\N
2379	4261	41	2023-02-22 13:05:00	\N
2380	4262	41	2023-02-22 13:05:00	\N
2381	4263	41	2023-02-22 13:05:00	\N
2382	4264	41	2023-02-22 13:05:00	\N
2383	4265	41	2023-02-22 13:05:00	\N
2384	4266	41	2023-02-22 13:05:00	\N
2385	4267	41	2023-02-22 13:05:00	\N
2386	4268	41	2023-02-22 13:05:00	\N
2387	4269	41	2023-02-22 13:05:00	\N
2388	4270	41	2023-02-22 13:05:00	\N
2389	4271	41	2023-02-22 13:05:00	\N
2390	4272	41	2023-02-22 13:05:00	\N
2391	4273	41	2023-02-22 13:05:00	\N
2392	4274	41	2023-02-22 13:05:00	\N
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_resets_table	1
3	2019_08_19_000000_create_failed_jobs_table	1
4	2022_08_27_062323_create_uploads_table	1
5	2022_10_24_152632_create_spks_table	1
6	2022_10_24_230554_create_boqs_table	1
7	2022_10_29_103542_create_ba_table	1
8	2022_11_13_221639_create_purchase_orders_table	1
9	2022_11_14_014738_create_delivery_orders_table	1
10	2022_11_14_020006_create_sos_table	1
11	2022_11_19_223331_create_boq_do_mapping	1
12	2022_11_19_223331_create_boq_sos_mapping	1
13	2022_11_20_183837_create_permission_tables	1
14	2022_11_21_034136_create_job_executors_table	1
15	2022_11_24_091334_create_type_table	1
16	2022_11_28_065456_job_status_table	1
17	2023_01_07_050717_create_je_mapping_tables	1
18	2023_01_07_051006_create_vw_all_data	1
20	2023_02_27_153223_add_edited_val_to_boq_table	2
21	2023_03_03_033154_create_table_cois	2
22	2023_03_04_000141_create_user_details_table	2
23	2023_03_06_043048_create_categories_table	2
24	2023_03_12_141816_create_certifications_table	2
25	2023_03_12_152234_add_long_lat_to_po	2
26	2023_03_12_152543_create_boq_coi_mapping	2
27	2023_03_12_153400_create_view_all_data	2
28	2023_03_16_233108_create_coi_activity_table	2
29	2023_03_24_034505_add_status_coi	2
30	2023_03_24_034637_add_notes_coi_activity	2
31	2023_03_29_142300_add_reviewer_and_approval_to_coi_map	2
32	2023_03_30_025433_create_notifications_table	2
33	2023_04_06_041330_alter_all_vw_all_data	2
34	2023_04_09_025300_coi_template	2
35	2023_05_01_151526_alter_tabel_cois_change_basic_law_nullable	2
36	2023_05_07_134248_add_additional_column_to_coi_template	3
38	2023_05_15_072044_create_activity_log_table	4
39	2023_05_16_063204_alter_tabel_coi_template_technical_column	4
40	2023_05_24_092517_alter_table_coi_templates_column_additional_to_jsonb	4
41	2023_05_25_085405_add_column_template_to_je	4
42	2023_05_26_033111_indexing	4
43	2023_06_07_041330_alter_all_vw_all_data	4
\.


--
-- Data for Name: model_has_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
\.


--
-- Data for Name: model_has_roles; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.model_has_roles (role_id, model_type, model_id) FROM stdin;
1	App\\Models\\User	1
2	App\\Models\\User	2
3	App\\Models\\User	3
4	App\\Models\\User	4
5	App\\Models\\User	5
6	App\\Models\\User	6
7	App\\Models\\User	7
8	App\\Models\\User	8
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.notifications (id, type, notifiable_type, notifiable_id, data, read_at, created_at, updated_at) FROM stdin;
961b1080-b536-4c17-9856-b3e4e88958d7	App\\Notifications\\CoiNotification	App\\Models\\User	6	{"from":1,"message":"Create COI","actionURL":"http:\\/\\/bki.test\\/job-executor\\/75"}	\N	2023-05-04 13:39:31	2023-05-04 13:39:31
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.permissions (id, name, guard_name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: purchase_orders; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.purchase_orders (id, po_no, spk_no, project_name, project_value, company_name, start_date, end_date, area, location, description, sow, status, created_at, updated_at, lat, long) FROM stdin;
2	020/PNDB40000/2021-S7	4150137998	Jasa Resertifikasi  Peralatan  di Fuel Terminal Wayame - Ambon	729400000	PT. Pertamina Patra Niaga	2021-08-19	2026-08-19	FT Wayame	Papua - Maluku	-	-	Valid	2023-02-05 07:44:39	2023-02-05 07:44:39	\N	\N
29	3700007860	-	Jasa Resertifikasi dan PLO Peralatan/Instalasi di FT Sabang Tahun 2022	196211391	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	FT Sabang	Sumbagut	-	-	Valid	2023-02-22 03:21:25	2023-02-22 06:44:58	\N	\N
7	3700007589	3700007589	Jasa Resertifikasi dan PLO Peralatan/Instalasi di FT Wayame	494618800	PT. Pertamina Patra Niaga	2023-02-01	2023-05-31	FT Wayame	Papua - Maluku	-	-	Valid	2023-02-22 02:05:13	2023-02-22 06:47:57	\N	\N
3	020/PNDB40000/2021-S7	-	Jasa Resertifikasi dan PLO Peralatan/Instalasi di FT Jayapura	264829600	PT. Pertamina Parta Niaga	2022-01-12	2023-03-31	FT Jayapura	Papua - Maluku	-	-	Valid	2023-02-05 09:45:24	2023-02-22 06:43:31	\N	\N
21	3700007816	-	Jasa Resertifikasi dan PLO Peralatan/Instalasi di Fuel Terminal Kolaka	415873997	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	FT Kolaka	Sulawesi	-	-	Valid	2023-02-22 03:03:45	2023-02-22 06:41:05	\N	\N
4	020/PNDB40000/2021-S7	-	Jasa Resertifikasi  Peralatan  di IT Jayapura  - Papua	301330444	PT. Pertamina Parta Niaga	2022-01-12	2023-06-10	IT Jayapura	Jayapura	-	-	Valid	2023-02-05 09:46:31	2023-02-22 06:55:00	\N	\N
30	122/PND970000/2022-S7	-	Inspeksi dan Sertifikasi/Resertifikasi Peralatan Operasi & Instalasi FT Samarinda	224512376	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	FT Samarinda	Kalimantan	-	-	Valid	2023-02-22 03:22:00	2023-02-22 06:32:07	\N	\N
22	3700007819	-	Jasa Resertifikasi dan PLO Peralatan/Instalasi di Fuel Terminal Kolonodale	375052651	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	FT Kolonodale	Sulawesi	-	-	Valid	2023-02-22 03:04:53	2023-02-22 06:15:58	\N	\N
19	3700007432	-	Jasa Resertifikasi dan PLO Peralatan/Instalasi di Fuel Terminal Kendari	678441750	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	FT Kendari	Sulawesi	-	-	Valid	2023-02-22 03:02:19	2023-02-22 06:35:28	\N	\N
17	3700007814	-	Jasa Resertifikasi dan PLO Peralatan/Instalasi di Fuel Terminal Banggai	331454752	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	FT Banggai	Sulawesi	-	-	Valid	2023-02-22 02:56:41	2023-02-22 06:34:41	\N	\N
8	3700007431	-	Jasa Resertifikasi dan PLO Peralatan/Instalasi di Fuel Terminal Luwuk	598296382	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	FT Luwuk	Sulawesi	-	-	Valid	2023-02-22 02:47:19	2023-02-22 06:37:53	\N	\N
25	3700007815	-	Jasa Resertifikasi dan PLO Peralatan/Instalasi di Fuel Terminal Palopo	603951388	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	FT Palopo	Sulawesi	-	-	Valid	2023-02-22 03:08:29	2023-02-22 06:39:05	\N	\N
13	4150200605	-	Jasa Sertifikasi di DPPU Sentani Tahun 2022	474090400	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	DPPU Sentani	Papua - Maluku	-	-	Valid	2023-02-22 02:52:23	2023-02-22 07:08:53	\N	\N
18	3700007822	-	Jasa Resertifikasi dan PLO Peralatan/Instalasi di Fuel Terminal Donggala	382316511	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	FT Donggala	Sulawesi	-	-	Valid	2023-02-22 03:01:39	2023-02-22 06:41:52	\N	\N
5	3700007371	-	Jasa Resertifikasi dan PLO Peralatan/Instalasi di FT Jayapura	256400000	PT. Pertamina Parta Niaga	2022-12-30	2023-03-25	FT Jayapura	Papua - Maluku	-	-	Valid	2023-02-05 09:47:22	2023-02-22 06:43:46	\N	\N
24	4600000706	-	Jasa Inspeksi dan Sertifikasi/Resertifikasi Peralatan Operasi di  PT Pertamina Patra Niaga	499159668	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	FT Maos	JBT	-	-	Valid	2023-02-22 03:06:58	2023-02-22 06:57:37	\N	\N
28	4150106608	-	Jasa Resertifikasi dan Sertifikasi DPPU Soekarno Hatta (SHAFTHI)	1646542800	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	DPPU Soekarno Hatta (SHAFTHI)	JBB	-	-	Valid	2023-02-22 03:11:05	2023-02-22 07:01:29	\N	\N
15	3700005125	-	Jasa Resertifikasi dan Sertifikasi DPPU Soekarno Hatta (SHAFTHI)	773487894	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	DPPU Soekarno Hatta (SHAFTHI)	JBB	-	-	Valid	2023-02-22 02:54:06	2023-02-22 07:01:47	\N	\N
14	3700007511	-	Sertifikasi Peralatan Operasi di DPPU Sepinggan	209214500	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	DPPU Sepinggan	Kalimantan	-	-	Valid	2023-02-22 02:53:17	2023-02-22 07:06:47	\N	\N
16	3700007518	-	Sertifikasi Peralatan Operasi di DPPU Supadio Tahun 2022	189596748	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	DPPU Supadio	Kalimantan	\N	\N	Valid	2023-02-22 02:55:02	2023-02-22 07:07:01	\N	\N
27	3700007812	-	Jasa Resertifikasi dan PLO Peralatan/Instalasi di Fuel Terminal Raha	372236428	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	FT Raha	Sulawesi	-	-	Valid	2023-02-22 03:10:00	2023-02-22 07:07:54	\N	\N
11	3700007820	-	Resertifikasi, Sertifikasi dan PLO di DPPU Ngurah Rai	760616473	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	DPPU Ngurah Rai	Jatimbalinus	-	-	Valid	2023-02-22 02:50:55	2023-02-22 07:11:24	\N	\N
35	3700007843	-	Jasa Inspeksi dan Sertifikasi/Resertifikasi Peralatan Operasi di IT Tuban	1913533860	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	FT Tuban	Jatimbalinus	-	-	Valid	2023-02-22 03:25:10	2023-02-22 07:12:44	\N	\N
26	4150133224	-	Sertifikasi/Resertifikasi Peralatan dan RLA Tangki Timbun di MOR VII FT Pare Pare	263657500	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	FT Pare - Pare	Sulawesi	-	-	Valid	2023-02-22 03:09:11	2023-02-22 07:14:33	\N	\N
10	4150173617	-	Jasa Pengurusan Sertifikasi COI dan PLO DPPU Juanda 2022	323529390	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	DPPU Juanda	Jatimbalinus	-	-	Valid	2023-02-22 02:49:52	2023-02-22 08:15:03	\N	\N
34	3700007844	-	Jasa Inspeksi Sertifikasi/Resertifikasi Peralatan Operasi IT Tanjung Wangi	1854607000	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	FT Tanjung Wangi	Jatimbalinus	-	-	Valid	2023-02-22 03:24:30	2023-02-22 07:21:15	\N	\N
20	3700008132	-	Jasa Resertifikasi, PLO dan RLA Peralatan FT Kertapati lama	481432500	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	FT Kertapati Lama	Sumbagsel	-	-	Valid	2023-02-22 03:02:56	2023-02-22 07:22:49	\N	\N
38	TP.01.01/LPG-BLG/00212/II/2020	-	Pekerjaan Sertifikasi PLO dan COI Proyek Jasa Konstruksi Pembangunan Tangki LPG Pressurized 3 x 3000 MT di Terminal LPG Balongan berikut Sarfas Pendukung	734314028	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	IT Balongan - LPG Terminal (Island Berth)	JBB	-	-	Valid	2023-02-22 03:27:32	2023-02-22 07:27:28	\N	\N
9	3700008351	-	Jasa Resertifikasi dan Sertifikasi DPPU Hang Nadim Tahun 2022	589894346	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	DPPU Hang Nadim	Sumbagut	-	-	Valid	2023-02-22 02:48:24	2023-02-22 07:25:00	\N	\N
12	3700003817	-	Inspeksi dan Resertifikasi Peralatan Produksi DPPU Sam Ratulangi Revisi 1	220928694	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	DPPU Sam Ratulangi	Sulawesi	-	-	Valid	2023-02-22 02:51:46	2023-02-22 07:43:22	\N	\N
23	4600000707	-	Jasa Inspeksi dan Sertifikasi/Resertifikasi Peralatan Operasi di  PT Pertamina Patra Niaga	246804218	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	FT Lomanis	JBT	-	-	Valid	2023-02-22 03:05:52	2023-02-22 07:39:19	\N	\N
1	3700003819	-	Sertifikasi PLO & COI DPPU Mutiara Palu	241845796	PT. Pertamina Patra Niaga	2020-12-14	2022-01-04	DPPU Mutiara Palu	Sulawesi	-	-	Expired	2023-02-05 07:27:20	2023-02-23 07:56:57	\N	\N
47	4600000706	-	Jasa Inspeksi dan Sertifikasi/Resertifikasi Peralatan Operasi di  PT Pertamina Patra Niaga	25000000	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	Pipeline Cilacap - Jogya (CY1); Pipeline Cilacap - Bandung (CB1); Pipeline Cilacap - Bandung (CB2)	JBT	-	-	Valid	2023-02-22 03:37:16	2023-02-22 03:37:16	\N	\N
39	4600000706	-	Jasa Inspeksi dan Sertifikasi/Resertifikasi Peralatan Operasi di  PT Pertamina Patra Niaga	487655000	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	IT Cilacap - Fuel Terminal	JBT	-	-	Valid	2023-02-22 03:28:50	2023-02-22 06:53:47	\N	\N
40	4600000706	-	Jasa Inspeksi dan Sertifikasi/Resertifikasi Peralatan Operasi di  PT Pertamina Patra Niaga	93225000	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	IT Cilacap - LPG Terminal	JBT	-	-	Valid	2023-02-22 03:29:28	2023-02-22 06:54:09	\N	\N
45	122/PND970000/2022-S7	-	Inspeksi dan Sertifikasi/Resertifikasi Peralatan Operasi & Instalasi IT Pontianak	219340000	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	IT Pontianak	Kalimantan	-	-	Valid	2023-02-22 03:35:49	2023-02-22 06:56:07	\N	\N
44	3700007433	-	Jasa Resertifikasi dan PLO Peralatan/Instalasi di Integrated Terminal Makassar	1039052600	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	IT Makassar	Sulawesi	-	-	Valid	2023-02-22 03:35:05	2023-02-22 07:04:00	\N	\N
46	3700008459	-	Sertifikasi Peralatan RLA dan PLO IT Surabaya Perak	2119000000	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	IT Surabaya - Fuel Tanjung Perak	Jatimbalinus	-	-	Valid	2023-02-22 03:36:29	2023-02-22 07:25:33	\N	\N
41	1000040038	-	Sertifikasi PLO SARFAS FT Plumpang, IT Priok, dan LPG Terminal Priok	724782946	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	IT Jakarta - Fuel Plumpang	JBB	-	-	Valid	2023-02-22 03:30:49	2023-02-22 06:29:26	\N	\N
42	1000040038	-	Sertifikasi PLO SARFAS FT Plumpang, IT Priok, dan LPG Terminal Priok	439019104	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	IT Jakarta - Fuel Tg.Priok	JBB	-	-	Valid	2023-02-22 03:32:05	2023-02-22 06:30:09	\N	\N
31	122/PND970000/2022-S7	-	Inspeksi dan Sertifikasi/Resertifikasi Peralatan Operasi & Instalasi FT Sampit	160370000	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	FT Sampit	Kalimantan	-	-	Valid	2023-02-22 03:22:30	2023-02-22 06:33:07	\N	\N
48	4150200489	-	Jasa Resertifikasi dan Sertifikasi DPPU Hang Nadim Tahun 2022	262000000	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	DPPU Hang Nadim	Sumbagut	-	-	Valid	2023-02-22 04:39:36	2023-02-22 07:26:55	\N	\N
32	3700007912	-	Jasa Resertifikasi dan PLO Peralatan/Instalasi di FT Simeulue tahun 2022	449500000	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	FT Simeulue	Sumbagut	-	-	Valid	2023-02-22 03:23:08	2023-02-22 06:45:46	\N	\N
33	122/PND970000/2022-S7	-	Inspeksi dan Sertifikasi/Resertifikasi Peralatan Operasi & Instalasi FT Sintang	134000000	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	FT Sintang	Kalimantan	-	-	Valid	2023-02-22 03:23:50	2023-02-22 06:46:27	\N	\N
36	122/PND970000/2022-S7	-	Inspeksi dan Sertifikasi/Resertifikasi Peralatan Operasi & Instalasi IT Balikpapan	246503694	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	IT Balikpapan - Fuel Terminal	Kalimantan	-	-	Valid	2023-02-22 03:25:48	2023-02-22 06:49:21	\N	\N
37	122/PND970000/2022-S7	-	Inspeksi dan Sertifikasi/Resertifikasi Peralatan Operasi & Instalasi IT Balikpapan - LPG	368964490	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	IT Balikpapan - LPG Terminal	Kalimantan	-	-	Valid	2023-02-22 03:26:31	2023-02-22 06:50:44	\N	\N
43	1000040038	-	Sertifikasi PLO SARFAS FT Plumpang, IT Priok, dan LPG Terminal Priok	348979959	PT. Pertamina Patra Niaga	2023-02-01	2023-04-29	IT Jakarta - LPG Tg.Priok	JBB	-	-	Valid	2023-02-22 03:32:41	2023-02-22 08:08:22	\N	\N
\.


--
-- Data for Name: role_has_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.role_has_permissions (permission_id, role_id) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.roles (id, name, guard_name, created_at, updated_at) FROM stdin;
1	superadmin	web	2022-11-22 01:38:50	2022-11-22 01:38:50
2	marketing-admin	web	2022-11-22 01:50:58	2022-11-22 01:52:21
3	operation-admin	web	2022-11-22 01:51:43	2022-11-22 01:51:43
4	inspektor	web	2022-11-22 01:51:43	2022-11-22 01:51:43
5	manager	web	2022-11-22 01:51:43	2022-11-22 01:51:43
6	koordinator	web	2022-11-22 01:51:43	2022-11-22 01:51:43
7	kepala-produksi	web	2022-11-22 01:51:43	2022-11-22 01:51:43
8	guest	web	2022-11-22 01:51:43	2022-11-22 01:51:43
\.


--
-- Data for Name: sos; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sos (id, sos_no, branch_name, value, sos_date, created_at, updated_at) FROM stdin;
2	001/BKI/SOS-XII/2022	BKI Cabang Makassar	241845796	2023-02-05	2023-02-05 08:18:23	2023-02-05 08:18:23
3	002/BKI/SOS-XII/2022	BKI SBU ENI	729400000	2023-02-16	2023-02-05 09:24:04	2023-02-05 09:24:04
6	012/KSO.BKI-SCI-SI/SOS-VI/2022	BKI SBU ENI	277830444	2023-02-15	2023-02-06 01:51:51	2023-02-06 01:51:51
5	013/KSO.BKI-SCI-SI/SOS-VI/2022	BKI SBU ENI	264829600	2023-02-15	2023-02-06 01:09:47	2023-02-22 03:42:44
7	014/KSO.BKI-SCI-SI/SOS-VI/2022	BKI SBU ENI	256400000	2023-02-15	2023-02-06 02:24:57	2023-02-22 03:42:52
9	015/KSO.BKI-SCI-SI/SOS-VI/2022	BKI SBU ENI	494618800	2023-02-22	2023-02-22 03:42:29	2023-02-22 03:42:57
11	0003/KSO.BKI-SCI-SI/SOS-VII/2021	SBU ENI	773487894	2023-02-22	2023-02-22 09:56:04	2023-02-22 09:56:04
12	0004/KSO.BKI-SCI-SI/SOS-VII/2021	SBU ENI	1646542800	2023-02-22	2023-02-22 09:57:06	2023-02-22 09:57:06
14	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	BKI SBU ENI	403529390	2023-02-22	2023-02-22 10:11:06	2023-02-22 10:11:06
15	029/KSO.BKI-SCI-SI/SOS-VIII/2022	BKI Makassar	375052651	2023-02-22	2023-02-22 11:07:28	2023-02-22 11:07:28
16	030/KSO.BKI-SCI-SI/SOS-VIII/2022	BKI Makassar	331454752	2023-02-22	2023-02-22 11:09:37	2023-02-22 11:09:37
17	033/KSO.BKI-SCI-SI/SOS-VIII/2022	BKI Makassar	415873997	2023-02-22	2023-02-22 11:10:59	2023-02-22 11:10:59
18	034/KSO.BKI-SCI-SI/SOS-VIII/2022	BKI Makassar	382316511	2023-02-22	2023-02-22 11:13:54	2023-02-22 11:13:54
19	023/KSO.BKI-SCI-SI/SOS-VI/2022	SBU ENI	2209364955	2023-02-22	2023-02-22 11:19:05	2023-02-22 11:19:05
20	037/KSO.BKI-SCI-SI/SOS-VIII/2022	Cabang Belawan	196211391	2023-02-22	2023-02-22 11:24:47	2023-02-22 11:24:47
21	038/KSO.BKI-SCI-SI/SOS-VIII/2022	Cabang Belawan	449500000	2023-02-22	2023-02-22 11:26:59	2023-02-22 11:26:59
22	SOS/122/PND970000/2022-S7	BKI Cab Balikpapan	615468184	2023-02-22	2023-02-22 11:29:22	2023-02-22 11:29:22
23	SOS/4600000706	BKI Semarang	605880000	2023-02-22	2023-02-22 12:32:35	2023-02-22 12:32:35
24	017/KSO.BKI-SCI-SI/DO-VI/2022	BKI Makassar	600976382	2023-02-22	2023-02-22 12:41:28	2023-02-22 12:41:28
25	018/KSO.BKI-SCI-SI/DO-VI/2022	BKI Makassar	678441750	2023-02-22	2023-02-22 12:42:32	2023-02-22 12:42:32
26	016/KSO.BKI-SCI-SI/SOS-VI/2022	BKI Makassar	1039052600	2023-02-22	2023-02-22 12:43:38	2023-02-22 12:43:38
27	020/KSO.BKI-Sci-SI/SOS-VII/2022	BKI Cabang Balikpapapn	209214500	2023-02-22	2023-02-22 12:44:51	2023-02-22 12:44:51
28	021/KSO.BKI-SCI-SI/SOS-VII/2022	BKI Cabang Pontianak	189596748	2023-02-22	2023-02-22 12:46:09	2023-02-22 12:46:09
29	032/KSO.BKI-SCI-SI/SOS-VIII/2022	BKI Makassar	347767128	2023-02-22	2023-02-22 12:47:09	2023-02-22 12:47:09
30	031/KSO.BKI-SCI-SI/SOS-VIII/2022	BKI Makassar	603951388	2023-02-22	2023-02-22 12:48:16	2023-02-22 12:48:16
31	037a/KSO.BKI-SCI-SI/SOS-VIII/2022	SBU ENI	760616473	2023-02-22	2023-02-22 12:50:52	2023-02-22 12:50:52
32	036/KSO.BKI-SCI-SI/SOS-VIII/2022	SBU ENI	1913533860	2023-02-22	2023-02-22 12:51:52	2023-02-22 12:51:52
33	035/KSO.BKI-SCI-SI/SOS-VIII/2022	SBU ENI	1854607000	2023-02-22	2023-02-22 12:53:25	2023-02-22 12:53:25
34	042/KSO.BKI-SCI-SI/SOS-X/2022	SBU ENI	481432500	2023-02-22	2023-02-22 12:54:24	2023-02-22 12:54:24
35	060/KSO.BKI-SCI-SI/SOS-XII/2022	Cabang Surabaya	2119000000	2023-02-22	2023-02-22 12:55:13	2023-02-22 12:55:13
36	012aa/KSO.BKI-SCI-SI/SOS-VI/2022	SBU ENI	589894346	2023-02-22	2023-02-22 12:57:10	2023-02-22 12:57:10
37	066/KSO.BKI-SCI-SI/SOS-XII/2022	SBU ENI	301000000	2023-02-22	2023-02-22 12:58:06	2023-02-22 12:58:06
38	056/KSO.BKI-SCI-SI/DO-XI/2022	SBU ENI	474090400	2023-02-22	2023-02-22 12:58:52	2023-02-22 12:58:52
39	SOS/4600000706	BKI Semarang	543479668	2023-02-22	2023-02-22 13:00:32	2023-02-22 13:00:32
40	SOS/4600000707	BKI Semarang	246804218	2023-02-22	2023-02-22 13:04:05	2023-02-22 13:04:05
41	SOS/TP.01.01/LPG-BLG/00212/II/2020	SBU ENI	734314028	2023-02-22	2023-02-22 13:05:00	2023-02-22 13:05:00
13	0014/KSO.BKI-SCI-SI/SOS-XI/2020	SBU ENI	220928694	2023-02-22	2023-02-22 10:05:06	2023-02-22 13:06:36
\.


--
-- Data for Name: spks; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.spks (id, spk_no, project_name, project_value, company_name, start_date, end_date, area, location, description, sow, status, created_at, updated_at) FROM stdin;
1	4150137998	Jasa Resertifikasi  Peralatan  di Fuel Terminal Wayame - Ambon	729400000	PT. Pertamina Patra Niaga	2021-08-19	2026-08-19	FT Wayame	Papua - Maluku	-	-	Valid	2023-02-05 07:44:10	2023-02-05 07:44:10
3	3700007589	Jasa Resertifikasi dan PLO Peralatan/Instalasi di FT Wayame	397050000	PT. Pertamina Patra Niaga	2023-02-01	2023-05-31	FT Wayame	Papua - Maluku	-	-	Valid	2023-02-22 02:04:29	2023-02-22 02:04:29
\.


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.types (id, name, user_input, created_at, updated_at) FROM stdin;
1	Certification	SERTIFIKASI	2022-11-22 01:38:50	\N
2	Recertification	RESERTIFIKASI	2022-11-22 01:38:50	\N
3	RLA	RLA	2022-11-22 01:38:50	\N
4	Reengineering	REENGINEERING	2022-11-22 01:38:50	\N
5	PLO	PLO	2022-11-22 01:38:50	\N
\.


--
-- Data for Name: uploads; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.uploads (id, request_id, name, filename, path, "order", label, upload_date, created_at, updated_at) FROM stdin;
2	94	4863-02-ENI.pdf	2_20230208070032_sadmin@mail.com-job-document-coi.pdf	files/job/080223_94/2_20230208070032_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-08	2023-02-08 07:00:32	2023-02-08 07:00:32
3	95	4864-02-ENI.pdf	2_20230208070055_sadmin@mail.com-job-document-coi.pdf	files/job/080223_95/2_20230208070055_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-08	2023-02-08 07:00:55	2023-02-08 07:00:55
4	96	4865-02-ENI.pdf	2_20230208070141_sadmin@mail.com-job-document-coi.pdf	files/job/080223_96/2_20230208070141_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-08	2023-02-08 07:01:41	2023-02-08 07:01:41
5	97	4866-02-ENI.pdf	2_20230208070211_sadmin@mail.com-job-document-coi.pdf	files/job/080223_97/2_20230208070211_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-08	2023-02-08 07:02:11	2023-02-08 07:02:11
6	98	4867-02-ENI.pdf	2_20230208070227_sadmin@mail.com-job-document-coi.pdf	files/job/080223_98/2_20230208070227_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-08	2023-02-08 07:02:27	2023-02-08 07:02:27
7	99	4868-02-ENI.pdf	2_20230208070256_sadmin@mail.com-job-document-coi.pdf	files/job/080223_99/2_20230208070256_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-08	2023-02-08 07:02:56	2023-02-08 07:02:56
8	100	4869-02-ENI.pdf	2_20230208070312_sadmin@mail.com-job-document-coi.pdf	files/job/080223_100/2_20230208070312_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-08	2023-02-08 07:03:12	2023-02-08 07:03:12
9	101	4870-02-ENI.pdf	2_20230208070328_sadmin@mail.com-job-document-coi.pdf	files/job/080223_101/2_20230208070328_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-08	2023-02-08 07:03:28	2023-02-08 07:03:28
10	102	4871-02-ENI.pdf	2_20230208070348_sadmin@mail.com-job-document-coi.pdf	files/job/080223_102/2_20230208070348_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-08	2023-02-08 07:03:48	2023-02-08 07:03:48
11	103	4872-02-ENI.pdf	2_20230208070403_sadmin@mail.com-job-document-coi.pdf	files/job/080223_103/2_20230208070403_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-08	2023-02-08 07:04:03	2023-02-08 07:04:03
12	104	4873-02-ENI.pdf	2_20230208070421_sadmin@mail.com-job-document-coi.pdf	files/job/080223_104/2_20230208070421_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-08	2023-02-08 07:04:21	2023-02-08 07:04:21
13	105	4874-02-ENI.pdf	2_20230208070459_sadmin@mail.com-job-document-coi.pdf	files/job/080223_105/2_20230208070459_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-08	2023-02-08 07:04:59	2023-02-08 07:04:59
14	107	4900-02-ENI.pdf	2_20230208070608_sadmin@mail.com-job-document-coi.pdf	files/job/080223_107/2_20230208070608_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-08	2023-02-08 07:06:08	2023-02-08 07:06:08
15	108	4899-02-ENI.pdf	2_20230208070629_sadmin@mail.com-job-document-coi.pdf	files/job/080223_108/2_20230208070629_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-08	2023-02-08 07:06:29	2023-02-08 07:06:29
16	109	4898-02-ENI.pdf	2_20230208070649_sadmin@mail.com-job-document-coi.pdf	files/job/080223_109/2_20230208070649_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-08	2023-02-08 07:06:49	2023-02-08 07:06:49
17	110	4897-02-ENI.pdf	2_20230208070710_sadmin@mail.com-job-document-coi.pdf	files/job/080223_110/2_20230208070710_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-08	2023-02-08 07:07:10	2023-02-08 07:07:10
18	111	4896-02-ENI.pdf	2_20230208070733_sadmin@mail.com-job-document-coi.pdf	files/job/080223_111/2_20230208070733_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-08	2023-02-08 07:07:33	2023-02-08 07:07:33
19	112	4895-02-ENI.pdf	2_20230208070753_sadmin@mail.com-job-document-coi.pdf	files/job/080223_112/2_20230208070753_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-08	2023-02-08 07:07:53	2023-02-08 07:07:53
20	113	4894-02-ENI.pdf	2_20230208070814_sadmin@mail.com-job-document-coi.pdf	files/job/080223_113/2_20230208070814_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-08	2023-02-08 07:08:14	2023-02-08 07:08:14
21	114	4893-02-ENI.pdf	2_20230208070834_sadmin@mail.com-job-document-coi.pdf	files/job/080223_114/2_20230208070834_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-08	2023-02-08 07:08:34	2023-02-08 07:08:34
22	115	4892-02-ENI.pdf	2_20230208070852_sadmin@mail.com-job-document-coi.pdf	files/job/080223_115/2_20230208070852_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-08	2023-02-08 07:08:52	2023-02-08 07:08:52
23	116	4891-02-ENI.pdf	2_20230208070908_sadmin@mail.com-job-document-coi.pdf	files/job/080223_116/2_20230208070908_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-08	2023-02-08 07:09:08	2023-02-08 07:09:08
24	117	4860-02-ENI-67-E07-L11-P4-2022.pdf	2_20230208070936_sadmin@mail.com-job-document-coi.pdf	files/job/080223_117/2_20230208070936_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-08	2023-02-08 07:09:36	2023-02-08 07:09:36
25	118	4859-02-ENI-67-E07-L11-P4-2022.pdf	2_20230208070955_sadmin@mail.com-job-document-coi.pdf	files/job/080223_118/2_20230208070955_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-08	2023-02-08 07:09:55	2023-02-08 07:09:55
26	120	4862-02-ENI-67-E07-L11-P4-2022.pdf	2_20230208071108_sadmin@mail.com-job-document-coi.pdf	files/job/080223_120/2_20230208071108_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-08	2023-02-08 07:11:08	2023-02-08 07:11:08
27	119	4861-02-ENI-67-E07-L11-P4-2022.pdf	2_20230208071312_sadmin@mail.com-job-document-coi.pdf	files/job/080223_119/2_20230208071312_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-08	2023-02-08 07:13:12	2023-02-08 07:13:12
28	17	CoI Panel Control.pdf	2_20230213070959_sadmin@mail.com-job-document-coi.pdf	files/job/130223_17/2_20230213070959_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 07:09:59	2023-02-13 07:09:59
29	18	0235-P02-02-MSC222E06-L03P12021.pdf	2_20230213224231_sadmin@mail.com-job-document-coi.pdf	files/job/130223_18/2_20230213224231_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 22:42:31	2023-02-13 22:42:31
30	19	0235-P01-02-MSC222E06-L03P12021.pdf	2_20230213224257_sadmin@mail.com-job-document-coi.pdf	files/job/130223_19/2_20230213224257_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 22:42:57	2023-02-13 22:42:57
31	20	0235-P03-02-MSC222E06-L03P12021.pdf	2_20230213224317_sadmin@mail.com-job-document-coi.pdf	files/job/130223_20/2_20230213224317_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 22:43:17	2023-02-13 22:43:17
32	21	0235-02-PRV01-MSC222E10-L03P12021.pdf	2_20230213224343_sadmin@mail.com-job-document-coi.pdf	files/job/130223_21/2_20230213224343_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 22:43:43	2023-02-13 22:43:43
33	22	CoI Generator.pdf	2_20230213224417_sadmin@mail.com-job-document-coi.pdf	files/job/130223_22/2_20230213224417_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 22:44:17	2023-02-13 22:44:17
34	23	0235-02-PRV02-MSC222E10-L03P12021.pdf	2_20230213224446_sadmin@mail.com-job-document-coi.pdf	files/job/130223_23/2_20230213224446_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 22:44:46	2023-02-13 22:44:46
35	24	0235-02-PRV03-MSC222E10-L03P12021.pdf	2_20230213224522_sadmin@mail.com-job-document-coi.pdf	files/job/130223_24/2_20230213224522_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 22:45:22	2023-02-13 22:45:22
36	25	0235-02-T01-MSC222E01-L03P12021.pdf	2_20230213224548_sadmin@mail.com-job-document-coi.pdf	files/job/130223_25/2_20230213224548_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 22:45:49	2023-02-13 22:45:49
37	26	0235-02-T02-MSC222E01-L03P12021.pdf	2_20230213224610_sadmin@mail.com-job-document-coi.pdf	files/job/130223_26/2_20230213224610_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 22:46:10	2023-02-13 22:46:10
38	27	0235-02-T03-MSC222E01-L03P12021.pdf	2_20230213224645_sadmin@mail.com-job-document-coi.pdf	files/job/130223_27/2_20230213224645_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 22:46:45	2023-02-13 22:46:45
39	28	0235-02-T04-MSC222E01-L03P12021.pdf	2_20230213224708_sadmin@mail.com-job-document-coi.pdf	files/job/130223_28/2_20230213224708_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 22:47:08	2023-02-13 22:47:08
40	29	3. Sertifikat Inspeksi Instalasi DPPU Mutiara Palu.pdf	2_20230213225314_sadmin@mail.com-job-document-coi.pdf	files/job/130223_29/2_20230213225314_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 22:53:14	2023-02-13 22:53:14
41	30	COI-TANGKI-4876.pdf	2_20230213225418_sadmin@mail.com-job-document-coi.pdf	files/job/130223_30/2_20230213225418_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 22:54:18	2023-02-13 22:54:18
42	31	COI-TANGKI-4877.pdf	2_20230213225433_sadmin@mail.com-job-document-coi.pdf	files/job/130223_31/2_20230213225433_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 22:54:33	2023-02-13 22:54:33
43	32	COI-TANGKI-4878.pdf	2_20230213225455_sadmin@mail.com-job-document-coi.pdf	files/job/130223_32/2_20230213225455_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 22:54:55	2023-02-13 22:54:55
44	33	COI-TANGKI-4879.pdf	2_20230213225519_sadmin@mail.com-job-document-coi.pdf	files/job/130223_33/2_20230213225519_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 22:55:19	2023-02-13 22:55:19
45	34	COI-TANGKI-4880.pdf	2_20230213225536_sadmin@mail.com-job-document-coi.pdf	files/job/130223_34/2_20230213225536_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 22:55:36	2023-02-13 22:55:36
46	35	COI-TANGKI-4881.pdf	2_20230213225556_sadmin@mail.com-job-document-coi.pdf	files/job/130223_35/2_20230213225556_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 22:55:56	2023-02-13 22:55:56
47	36	COI-TANGKI-4882.pdf	2_20230213225617_sadmin@mail.com-job-document-coi.pdf	files/job/130223_36/2_20230213225617_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 22:56:17	2023-02-13 22:56:17
48	37	COI-TANGKI-4883.pdf	2_20230213225640_sadmin@mail.com-job-document-coi.pdf	files/job/130223_37/2_20230213225640_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 22:56:40	2023-02-13 22:56:40
49	38	COI-TANGKI-4884.pdf	2_20230213225659_sadmin@mail.com-job-document-coi.pdf	files/job/130223_38/2_20230213225659_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 22:56:59	2023-02-13 22:56:59
50	39	COI-TANGKI-4885.pdf	2_20230213225715_sadmin@mail.com-job-document-coi.pdf	files/job/130223_39/2_20230213225715_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 22:57:15	2023-02-13 22:57:15
51	40	COI-TANGKI-4886.pdf	2_20230213230809_sadmin@mail.com-job-document-coi.pdf	files/job/130223_40/2_20230213230809_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 23:08:09	2023-02-13 23:08:09
52	41	COI-TANGKI-4887.pdf	2_20230213230827_sadmin@mail.com-job-document-coi.pdf	files/job/130223_41/2_20230213230827_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 23:08:27	2023-02-13 23:08:27
53	42	COI-TANGKI-4888.pdf	2_20230213230846_sadmin@mail.com-job-document-coi.pdf	files/job/130223_42/2_20230213230846_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 23:08:46	2023-02-13 23:08:46
54	43	COI-TANGKI-4889.pdf	2_20230213230909_sadmin@mail.com-job-document-coi.pdf	files/job/130223_43/2_20230213230909_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 23:09:09	2023-02-13 23:09:09
55	44	COI-TANGKI-4890.pdf	2_20230213230928_sadmin@mail.com-job-document-coi.pdf	files/job/130223_44/2_20230213230928_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 23:09:28	2023-02-13 23:09:28
56	45	COI-4901.pdf	2_20230213230951_sadmin@mail.com-job-document-coi.pdf	files/job/130223_45/2_20230213230951_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 23:09:51	2023-02-13 23:09:51
57	46	COI-4902.pdf	2_20230213231010_sadmin@mail.com-job-document-coi.pdf	files/job/130223_46/2_20230213231010_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 23:10:10	2023-02-13 23:10:10
58	47	COI-4903.pdf	2_20230213231029_sadmin@mail.com-job-document-coi.pdf	files/job/130223_47/2_20230213231029_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 23:10:29	2023-02-13 23:10:29
59	48	COI-4904.pdf	2_20230213231050_sadmin@mail.com-job-document-coi.pdf	files/job/130223_48/2_20230213231050_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 23:10:50	2023-02-13 23:10:50
60	49	COI-4905.pdf	2_20230213231108_sadmin@mail.com-job-document-coi.pdf	files/job/130223_49/2_20230213231108_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 23:11:08	2023-02-13 23:11:08
61	50	COI-4906.pdf	2_20230213231129_sadmin@mail.com-job-document-coi.pdf	files/job/130223_50/2_20230213231129_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 23:11:29	2023-02-13 23:11:29
62	51	COI-4907.pdf	2_20230213231145_sadmin@mail.com-job-document-coi.pdf	files/job/130223_51/2_20230213231145_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 23:11:45	2023-02-13 23:11:45
63	52	COI-4908.pdf	2_20230213231206_sadmin@mail.com-job-document-coi.pdf	files/job/130223_52/2_20230213231206_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 23:12:06	2023-02-13 23:12:06
64	53	COI-4909.pdf	2_20230213231228_sadmin@mail.com-job-document-coi.pdf	files/job/130223_53/2_20230213231228_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 23:12:28	2023-02-13 23:12:28
65	54	COI-4910.pdf	2_20230213231245_sadmin@mail.com-job-document-coi.pdf	files/job/130223_54/2_20230213231245_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 23:12:45	2023-02-13 23:12:45
66	55	COI-4911.pdf	2_20230213231312_sadmin@mail.com-job-document-coi.pdf	files/job/130223_55/2_20230213231312_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 23:13:12	2023-02-13 23:13:12
67	56	COI-4912.pdf	2_20230213231330_sadmin@mail.com-job-document-coi.pdf	files/job/130223_56/2_20230213231330_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 23:13:30	2023-02-13 23:13:30
68	57	COI-4913.pdf	2_20230213235405_sadmin@mail.com-job-document-coi.pdf	files/job/130223_57/2_20230213235405_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-13	2023-02-13 23:54:05	2023-02-13 23:54:05
69	58	COI-4914.pdf	2_20230214020409_sadmin@mail.com-job-document-coi.pdf	files/job/140223_58/2_20230214020409_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-14	2023-02-14 02:04:09	2023-02-14 02:04:09
70	59	COI-4915.pdf	2_20230214020700_sadmin@mail.com-job-document-coi.pdf	files/job/140223_59/2_20230214020700_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-14	2023-02-14 02:07:00	2023-02-14 02:07:00
71	60	COI-4918.pdf	2_20230214020727_sadmin@mail.com-job-document-coi.pdf	files/job/140223_60/2_20230214020727_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-14	2023-02-14 02:07:27	2023-02-14 02:07:27
72	61	COI-4916.pdf	2_20230214020755_sadmin@mail.com-job-document-coi.pdf	files/job/140223_61/2_20230214020755_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-14	2023-02-14 02:07:55	2023-02-14 02:07:55
73	62	COI-4919.pdf	2_20230214020817_sadmin@mail.com-job-document-coi.pdf	files/job/140223_62/2_20230214020817_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-14	2023-02-14 02:08:17	2023-02-14 02:08:17
74	63	COI-4917.pdf	2_20230214020840_sadmin@mail.com-job-document-coi.pdf	files/job/140223_63/2_20230214020840_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-14	2023-02-14 02:08:40	2023-02-14 02:08:40
75	64	COI Elektrikal FT Wayame.pdf	2_20230214020937_sadmin@mail.com-job-document-coi.pdf	files/job/140223_64/2_20230214020937_sadmin@mail.com-job-document-coi.pdf	2	job-document-coi	2023-02-14	2023-02-14 02:09:37	2023-02-14 02:09:37
76	92	3. BA MIGAS PERALATAN.pdf	1_20230216104050_operation@mail.com-job-document.pdf	files/job/160223_92/1_20230216104050_operation@mail.com-job-document.pdf	1	job-document	2023-02-16	2023-02-16 10:40:50	2023-02-16 10:40:50
77	92	2. BA INSPEKSI.pdf	3_20230216104050_operation@mail.com-job-document.pdf	files/job/160223_92/3_20230216104050_operation@mail.com-job-document.pdf	3	job-document	2023-02-16	2023-02-16 10:40:50	2023-02-16 10:40:50
78	3	PO dan SPK FT WAYAME JAYAPURA_1.5M_2021.pdf	1_20230222020429_sadmin@mail.com-spk-document.pdf	files/spk/220223_3/1_20230222020429_sadmin@mail.com-spk-document.pdf	1	spk-document	2023-02-22	2023-02-22 02:04:29	2023-02-22 02:04:29
79	7	PO dan SPK FT WAYAME JAYAPURA_1.5M_2021.pdf	1_20230222020513_sadmin@mail.com-po-document.pdf	files/po/220223_7/1_20230222020513_sadmin@mail.com-po-document.pdf	1	po-document	2023-02-22	2023-02-22 02:05:13	2023-02-22 02:05:13
\.


--
-- Data for Name: user_details; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.user_details (id, user_id, expired_date, nup, jabatan, kode_departemen, sign, photo, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.users (id, name, contact, role_id, email, email_verified_at, password, status, remember_token, created_at, updated_at) FROM stdin;
1	Superadmin	123	1	sadmin@mail.com	\N	$2y$10$M/0SC1YWu79nOE.X3Mr0lO2Ncd56IRzgPWbOE3kFYnPtQv0P3a5bi	active	\N	2022-11-22 01:38:38	2022-11-22 01:42:36
2	Marketing Admin	123	2	marketing@mail.com	\N	$2y$10$h.SUv1NmAKKA.CAtrEFjEO.jhCpl39DC4ZfPxE5VwZGHeriKteqBO	active	\N	2022-11-22 01:52:56	2022-11-22 01:58:43
3	Operation Admin	123	3	operation@mail.com	\N	$2y$10$x54lsnhLKmXGSfMHlXCjY.nZa2nzGAU5IidyU4kRV3najlY4HKS7.	active	\N	2022-11-22 01:53:39	2022-11-22 01:54:18
4	Inspektor	123	4	inspektor@mail.com	\N	$2y$10$x54lsnhLKmXGSfMHlXCjY.nZa2nzGAU5IidyU4kRV3najlY4HKS7.	active	\N	2022-11-22 01:53:39	2022-11-22 01:54:18
5	Manager	123	5	manager@mail.com	\N	$2y$10$x54lsnhLKmXGSfMHlXCjY.nZa2nzGAU5IidyU4kRV3najlY4HKS7.	active	\N	2022-11-22 01:53:39	2022-11-22 01:54:18
6	Koordinator	123	6	koordinator@mail.com	\N	$2y$10$x54lsnhLKmXGSfMHlXCjY.nZa2nzGAU5IidyU4kRV3najlY4HKS7.	active	\N	2022-11-22 01:53:39	2022-11-22 01:54:18
7	Kepala Produksi	123	7	kaproduksi@mail.com	\N	$2y$10$x54lsnhLKmXGSfMHlXCjY.nZa2nzGAU5IidyU4kRV3najlY4HKS7.	active	\N	2022-11-22 01:53:39	2022-11-22 01:54:18
8	Guest	123	8	guest@mail.com	\N	$2y$10$x54lsnhLKmXGSfMHlXCjY.nZa2nzGAU5IidyU4kRV3najlY4HKS7.	active	\N	2022-11-22 01:53:39	2022-11-22 01:54:18
\.


--
-- Name: activity_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.activity_log_id_seq', 1, false);


--
-- Name: ba_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.ba_id_seq', 2, false);


--
-- Name: boqs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.boqs_id_seq', 4499, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.categories_id_seq', 2, false);


--
-- Name: certifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.certifications_id_seq', 2, false);


--
-- Name: coi_activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.coi_activities_id_seq', 2, true);


--
-- Name: coi_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.coi_templates_id_seq', 4, true);


--
-- Name: cois_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.cois_id_seq', 5, true);


--
-- Name: delivery_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.delivery_orders_id_seq', 73, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 2, false);


--
-- Name: job_executors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.job_executors_id_seq', 2466, true);


--
-- Name: job_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.job_status_id_seq', 9, true);


--
-- Name: map_boq_dos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.map_boq_dos_id_seq', 2520, true);


--
-- Name: map_boq_je_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.map_boq_je_id_seq', 2466, true);


--
-- Name: map_boq_sos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.map_boq_sos_id_seq', 2393, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.migrations_id_seq', 43, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.permissions_id_seq', 2, false);


--
-- Name: purchase_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.purchase_orders_id_seq', 50, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.roles_id_seq', 10, true);


--
-- Name: sos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.sos_id_seq', 42, true);


--
-- Name: spks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.spks_id_seq', 5, true);


--
-- Name: types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.types_id_seq', 7, true);


--
-- Name: uploads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.uploads_id_seq', 80, true);


--
-- Name: user_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.user_details_id_seq', 2, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- Name: activity_log activity_log_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.activity_log
    ADD CONSTRAINT activity_log_pkey PRIMARY KEY (id);


--
-- Name: ba ba_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ba
    ADD CONSTRAINT ba_pkey PRIMARY KEY (id);


--
-- Name: boqs boqs_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.boqs
    ADD CONSTRAINT boqs_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: certifications certifications_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.certifications
    ADD CONSTRAINT certifications_pkey PRIMARY KEY (id);


--
-- Name: coi_activities coi_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.coi_activities
    ADD CONSTRAINT coi_activities_pkey PRIMARY KEY (id);


--
-- Name: coi_templates coi_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.coi_templates
    ADD CONSTRAINT coi_templates_pkey PRIMARY KEY (id);


--
-- Name: cois cois_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cois
    ADD CONSTRAINT cois_pkey PRIMARY KEY (id);


--
-- Name: delivery_orders delivery_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.delivery_orders
    ADD CONSTRAINT delivery_orders_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: job_executors job_executors_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.job_executors
    ADD CONSTRAINT job_executors_pkey PRIMARY KEY (id);


--
-- Name: job_status job_status_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.job_status
    ADD CONSTRAINT job_status_pkey PRIMARY KEY (id);


--
-- Name: map_boq_dos map_boq_dos_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.map_boq_dos
    ADD CONSTRAINT map_boq_dos_pkey PRIMARY KEY (id);


--
-- Name: map_boq_je map_boq_je_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.map_boq_je
    ADD CONSTRAINT map_boq_je_pkey PRIMARY KEY (id);


--
-- Name: map_boq_sos map_boq_sos_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.map_boq_sos
    ADD CONSTRAINT map_boq_sos_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: model_has_permissions model_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);


--
-- Name: model_has_roles model_has_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: purchase_orders purchase_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_pkey PRIMARY KEY (id);


--
-- Name: role_has_permissions role_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);


--
-- Name: roles roles_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: sos sos_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sos
    ADD CONSTRAINT sos_pkey PRIMARY KEY (id);


--
-- Name: spks spks_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.spks
    ADD CONSTRAINT spks_pkey PRIMARY KEY (id);


--
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


--
-- Name: uploads uploads_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.uploads
    ADD CONSTRAINT uploads_pkey PRIMARY KEY (id);


--
-- Name: user_details user_details_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_details
    ADD CONSTRAINT user_details_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: activity_log_log_name_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX activity_log_log_name_index ON public.activity_log USING btree (log_name);


--
-- Name: boqs_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX boqs_id_index ON public.boqs USING btree (id);


--
-- Name: causer; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX causer ON public.activity_log USING btree (causer_type, causer_id);


--
-- Name: cois_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX cois_id_index ON public.cois USING btree (id);


--
-- Name: job_executors_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX job_executors_id_index ON public.job_executors USING btree (id);


--
-- Name: map_boq_coi_boq_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX map_boq_coi_boq_id_index ON public.map_boq_coi USING btree (boq_id);


--
-- Name: map_boq_coi_coi_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX map_boq_coi_coi_id_index ON public.map_boq_coi USING btree (coi_id);


--
-- Name: map_boq_je_boq_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX map_boq_je_boq_id_index ON public.map_boq_je USING btree (boq_id);


--
-- Name: map_boq_je_je_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX map_boq_je_je_id_index ON public.map_boq_je USING btree (je_id);


--
-- Name: model_has_permissions_model_id_model_type_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);


--
-- Name: model_has_roles_model_id_model_type_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);


--
-- Name: notifications_notifiable_type_notifiable_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX notifications_notifiable_type_notifiable_id_index ON public.notifications USING btree (notifiable_type, notifiable_id);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- Name: purchase_orders_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX purchase_orders_id_index ON public.purchase_orders USING btree (id);


--
-- Name: subject; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX subject ON public.activity_log USING btree (subject_type, subject_id);


--
-- Name: certifications certifications_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.certifications
    ADD CONSTRAINT certifications_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: coi_activities coi_activities_coi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.coi_activities
    ADD CONSTRAINT coi_activities_coi_id_foreign FOREIGN KEY (coi_id) REFERENCES public.cois(id) ON DELETE CASCADE;


--
-- Name: coi_activities coi_activities_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.coi_activities
    ADD CONSTRAINT coi_activities_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: job_executors job_executors_template_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.job_executors
    ADD CONSTRAINT job_executors_template_foreign FOREIGN KEY (template) REFERENCES public.coi_templates(id) ON DELETE SET NULL;


--
-- Name: map_boq_coi map_boq_coi_approval_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.map_boq_coi
    ADD CONSTRAINT map_boq_coi_approval_foreign FOREIGN KEY (approval) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: map_boq_coi map_boq_coi_boq_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.map_boq_coi
    ADD CONSTRAINT map_boq_coi_boq_id_foreign FOREIGN KEY (boq_id) REFERENCES public.boqs(id) ON DELETE CASCADE;


--
-- Name: map_boq_coi map_boq_coi_coi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.map_boq_coi
    ADD CONSTRAINT map_boq_coi_coi_id_foreign FOREIGN KEY (coi_id) REFERENCES public.cois(id) ON DELETE CASCADE;


--
-- Name: map_boq_coi map_boq_coi_reviewer_1_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.map_boq_coi
    ADD CONSTRAINT map_boq_coi_reviewer_1_foreign FOREIGN KEY (reviewer_1) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: map_boq_coi map_boq_coi_reviewer_2_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.map_boq_coi
    ADD CONSTRAINT map_boq_coi_reviewer_2_foreign FOREIGN KEY (reviewer_2) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: map_boq_dos map_boq_dos_boq_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.map_boq_dos
    ADD CONSTRAINT map_boq_dos_boq_id_foreign FOREIGN KEY (boq_id) REFERENCES public.boqs(id) ON DELETE CASCADE;


--
-- Name: map_boq_dos map_boq_dos_do_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.map_boq_dos
    ADD CONSTRAINT map_boq_dos_do_id_foreign FOREIGN KEY (do_id) REFERENCES public.delivery_orders(id) ON DELETE CASCADE;


--
-- Name: map_boq_je map_boq_je_boq_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.map_boq_je
    ADD CONSTRAINT map_boq_je_boq_id_foreign FOREIGN KEY (boq_id) REFERENCES public.boqs(id) ON DELETE CASCADE;


--
-- Name: map_boq_je map_boq_je_je_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.map_boq_je
    ADD CONSTRAINT map_boq_je_je_id_foreign FOREIGN KEY (je_id) REFERENCES public.job_executors(id) ON DELETE CASCADE;


--
-- Name: map_boq_sos map_boq_sos_boq_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.map_boq_sos
    ADD CONSTRAINT map_boq_sos_boq_id_foreign FOREIGN KEY (boq_id) REFERENCES public.boqs(id) ON DELETE CASCADE;


--
-- Name: map_boq_sos map_boq_sos_sos_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.map_boq_sos
    ADD CONSTRAINT map_boq_sos_sos_id_foreign FOREIGN KEY (sos_id) REFERENCES public.sos(id) ON DELETE CASCADE;


--
-- Name: model_has_permissions model_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: model_has_roles model_has_roles_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: TABLE activity_log; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.activity_log FROM root;
GRANT ALL ON TABLE public.activity_log TO root WITH GRANT OPTION;


--
-- Name: SEQUENCE activity_log_id_seq; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON SEQUENCE public.activity_log_id_seq FROM root;
GRANT ALL ON SEQUENCE public.activity_log_id_seq TO root WITH GRANT OPTION;


--
-- Name: TABLE ba; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.ba FROM root;
GRANT ALL ON TABLE public.ba TO root WITH GRANT OPTION;


--
-- Name: SEQUENCE ba_id_seq; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON SEQUENCE public.ba_id_seq FROM root;
GRANT ALL ON SEQUENCE public.ba_id_seq TO root WITH GRANT OPTION;


--
-- Name: TABLE boqs; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.boqs FROM root;
GRANT ALL ON TABLE public.boqs TO root WITH GRANT OPTION;


--
-- Name: SEQUENCE boqs_id_seq; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON SEQUENCE public.boqs_id_seq FROM root;
GRANT ALL ON SEQUENCE public.boqs_id_seq TO root WITH GRANT OPTION;


--
-- Name: TABLE categories; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.categories FROM root;
GRANT ALL ON TABLE public.categories TO root WITH GRANT OPTION;


--
-- Name: SEQUENCE categories_id_seq; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON SEQUENCE public.categories_id_seq FROM root;
GRANT ALL ON SEQUENCE public.categories_id_seq TO root WITH GRANT OPTION;


--
-- Name: TABLE certifications; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.certifications FROM root;
GRANT ALL ON TABLE public.certifications TO root WITH GRANT OPTION;


--
-- Name: SEQUENCE certifications_id_seq; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON SEQUENCE public.certifications_id_seq FROM root;
GRANT ALL ON SEQUENCE public.certifications_id_seq TO root WITH GRANT OPTION;


--
-- Name: TABLE coi_activities; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.coi_activities FROM root;
GRANT ALL ON TABLE public.coi_activities TO root WITH GRANT OPTION;


--
-- Name: SEQUENCE coi_activities_id_seq; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON SEQUENCE public.coi_activities_id_seq FROM root;
GRANT ALL ON SEQUENCE public.coi_activities_id_seq TO root WITH GRANT OPTION;


--
-- Name: TABLE coi_templates; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.coi_templates FROM root;
GRANT ALL ON TABLE public.coi_templates TO root WITH GRANT OPTION;


--
-- Name: SEQUENCE coi_templates_id_seq; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON SEQUENCE public.coi_templates_id_seq FROM root;
GRANT ALL ON SEQUENCE public.coi_templates_id_seq TO root WITH GRANT OPTION;


--
-- Name: TABLE cois; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.cois FROM root;
GRANT ALL ON TABLE public.cois TO root WITH GRANT OPTION;


--
-- Name: SEQUENCE cois_id_seq; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON SEQUENCE public.cois_id_seq FROM root;
GRANT ALL ON SEQUENCE public.cois_id_seq TO root WITH GRANT OPTION;


--
-- Name: TABLE delivery_orders; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.delivery_orders FROM root;
GRANT ALL ON TABLE public.delivery_orders TO root WITH GRANT OPTION;


--
-- Name: SEQUENCE delivery_orders_id_seq; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON SEQUENCE public.delivery_orders_id_seq FROM root;
GRANT ALL ON SEQUENCE public.delivery_orders_id_seq TO root WITH GRANT OPTION;


--
-- Name: TABLE failed_jobs; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.failed_jobs FROM root;
GRANT ALL ON TABLE public.failed_jobs TO root WITH GRANT OPTION;


--
-- Name: SEQUENCE failed_jobs_id_seq; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON SEQUENCE public.failed_jobs_id_seq FROM root;
GRANT ALL ON SEQUENCE public.failed_jobs_id_seq TO root WITH GRANT OPTION;


--
-- Name: TABLE job_executors; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.job_executors FROM root;
GRANT ALL ON TABLE public.job_executors TO root WITH GRANT OPTION;


--
-- Name: SEQUENCE job_executors_id_seq; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON SEQUENCE public.job_executors_id_seq FROM root;
GRANT ALL ON SEQUENCE public.job_executors_id_seq TO root WITH GRANT OPTION;


--
-- Name: TABLE job_status; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.job_status FROM root;
GRANT ALL ON TABLE public.job_status TO root WITH GRANT OPTION;


--
-- Name: SEQUENCE job_status_id_seq; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON SEQUENCE public.job_status_id_seq FROM root;
GRANT ALL ON SEQUENCE public.job_status_id_seq TO root WITH GRANT OPTION;


--
-- Name: TABLE map_boq_coi; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.map_boq_coi FROM root;
GRANT ALL ON TABLE public.map_boq_coi TO root WITH GRANT OPTION;


--
-- Name: TABLE map_boq_dos; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.map_boq_dos FROM root;
GRANT ALL ON TABLE public.map_boq_dos TO root WITH GRANT OPTION;


--
-- Name: SEQUENCE map_boq_dos_id_seq; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON SEQUENCE public.map_boq_dos_id_seq FROM root;
GRANT ALL ON SEQUENCE public.map_boq_dos_id_seq TO root WITH GRANT OPTION;


--
-- Name: TABLE map_boq_je; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.map_boq_je FROM root;
GRANT ALL ON TABLE public.map_boq_je TO root WITH GRANT OPTION;


--
-- Name: SEQUENCE map_boq_je_id_seq; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON SEQUENCE public.map_boq_je_id_seq FROM root;
GRANT ALL ON SEQUENCE public.map_boq_je_id_seq TO root WITH GRANT OPTION;


--
-- Name: TABLE map_boq_sos; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.map_boq_sos FROM root;
GRANT ALL ON TABLE public.map_boq_sos TO root WITH GRANT OPTION;


--
-- Name: SEQUENCE map_boq_sos_id_seq; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON SEQUENCE public.map_boq_sos_id_seq FROM root;
GRANT ALL ON SEQUENCE public.map_boq_sos_id_seq TO root WITH GRANT OPTION;


--
-- Name: TABLE migrations; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.migrations FROM root;
GRANT ALL ON TABLE public.migrations TO root WITH GRANT OPTION;


--
-- Name: SEQUENCE migrations_id_seq; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON SEQUENCE public.migrations_id_seq FROM root;
GRANT ALL ON SEQUENCE public.migrations_id_seq TO root WITH GRANT OPTION;


--
-- Name: TABLE model_has_permissions; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.model_has_permissions FROM root;
GRANT ALL ON TABLE public.model_has_permissions TO root WITH GRANT OPTION;


--
-- Name: TABLE model_has_roles; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.model_has_roles FROM root;
GRANT ALL ON TABLE public.model_has_roles TO root WITH GRANT OPTION;


--
-- Name: TABLE notifications; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.notifications FROM root;
GRANT ALL ON TABLE public.notifications TO root WITH GRANT OPTION;


--
-- Name: TABLE password_resets; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.password_resets FROM root;
GRANT ALL ON TABLE public.password_resets TO root WITH GRANT OPTION;


--
-- Name: TABLE permissions; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.permissions FROM root;
GRANT ALL ON TABLE public.permissions TO root WITH GRANT OPTION;


--
-- Name: SEQUENCE permissions_id_seq; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON SEQUENCE public.permissions_id_seq FROM root;
GRANT ALL ON SEQUENCE public.permissions_id_seq TO root WITH GRANT OPTION;


--
-- Name: TABLE purchase_orders; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.purchase_orders FROM root;
GRANT ALL ON TABLE public.purchase_orders TO root WITH GRANT OPTION;


--
-- Name: SEQUENCE purchase_orders_id_seq; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON SEQUENCE public.purchase_orders_id_seq FROM root;
GRANT ALL ON SEQUENCE public.purchase_orders_id_seq TO root WITH GRANT OPTION;


--
-- Name: TABLE role_has_permissions; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.role_has_permissions FROM root;
GRANT ALL ON TABLE public.role_has_permissions TO root WITH GRANT OPTION;


--
-- Name: TABLE roles; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.roles FROM root;
GRANT ALL ON TABLE public.roles TO root WITH GRANT OPTION;


--
-- Name: SEQUENCE roles_id_seq; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON SEQUENCE public.roles_id_seq FROM root;
GRANT ALL ON SEQUENCE public.roles_id_seq TO root WITH GRANT OPTION;


--
-- Name: TABLE sos; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.sos FROM root;
GRANT ALL ON TABLE public.sos TO root WITH GRANT OPTION;


--
-- Name: SEQUENCE sos_id_seq; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON SEQUENCE public.sos_id_seq FROM root;
GRANT ALL ON SEQUENCE public.sos_id_seq TO root WITH GRANT OPTION;


--
-- Name: TABLE spks; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.spks FROM root;
GRANT ALL ON TABLE public.spks TO root WITH GRANT OPTION;


--
-- Name: SEQUENCE spks_id_seq; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON SEQUENCE public.spks_id_seq FROM root;
GRANT ALL ON SEQUENCE public.spks_id_seq TO root WITH GRANT OPTION;


--
-- Name: TABLE types; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.types FROM root;
GRANT ALL ON TABLE public.types TO root WITH GRANT OPTION;


--
-- Name: SEQUENCE types_id_seq; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON SEQUENCE public.types_id_seq FROM root;
GRANT ALL ON SEQUENCE public.types_id_seq TO root WITH GRANT OPTION;


--
-- Name: SEQUENCE uploads_id_seq; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON SEQUENCE public.uploads_id_seq FROM root;
GRANT ALL ON SEQUENCE public.uploads_id_seq TO root WITH GRANT OPTION;


--
-- Name: TABLE uploads; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.uploads FROM root;
GRANT ALL ON TABLE public.uploads TO root WITH GRANT OPTION;


--
-- Name: TABLE user_details; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.user_details FROM root;
GRANT ALL ON TABLE public.user_details TO root WITH GRANT OPTION;


--
-- Name: SEQUENCE user_details_id_seq; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON SEQUENCE public.user_details_id_seq FROM root;
GRANT ALL ON SEQUENCE public.user_details_id_seq TO root WITH GRANT OPTION;


--
-- Name: TABLE users; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.users FROM root;
GRANT ALL ON TABLE public.users TO root WITH GRANT OPTION;


--
-- Name: SEQUENCE users_id_seq; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON SEQUENCE public.users_id_seq FROM root;
GRANT ALL ON SEQUENCE public.users_id_seq TO root WITH GRANT OPTION;


--
-- Name: TABLE vw_all_data; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.vw_all_data FROM root;
GRANT ALL ON TABLE public.vw_all_data TO root WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: -; Owner: root
--

ALTER DEFAULT PRIVILEGES FOR ROLE root REVOKE ALL ON SEQUENCES  FROM root;
ALTER DEFAULT PRIVILEGES FOR ROLE root GRANT ALL ON SEQUENCES  TO root WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TYPES; Type: DEFAULT ACL; Schema: -; Owner: root
--

ALTER DEFAULT PRIVILEGES FOR ROLE root REVOKE ALL ON TYPES  FROM root;
ALTER DEFAULT PRIVILEGES FOR ROLE root GRANT ALL ON TYPES  TO root WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: -; Owner: root
--

ALTER DEFAULT PRIVILEGES FOR ROLE root REVOKE ALL ON FUNCTIONS  FROM root;
ALTER DEFAULT PRIVILEGES FOR ROLE root GRANT ALL ON FUNCTIONS  TO root WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: root
--

ALTER DEFAULT PRIVILEGES FOR ROLE root REVOKE ALL ON TABLES  FROM root;
ALTER DEFAULT PRIVILEGES FOR ROLE root GRANT ALL ON TABLES  TO root WITH GRANT OPTION;


--
-- PostgreSQL database dump complete
--

