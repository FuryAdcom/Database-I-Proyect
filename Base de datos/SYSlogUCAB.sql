--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

-- Started on 2018-12-10 22:33:52

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 25774)
-- Name: Aeropuerto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Aeropuerto" (
    "Cantidad_Terminales" integer NOT NULL,
    "Pistas" integer NOT NULL,
    "Capacidad" integer NOT NULL,
    "Hangares" integer NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Sitio" integer NOT NULL,
    "FK_Dispone_con" integer NOT NULL
);


ALTER TABLE public."Aeropuerto" OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 25777)
-- Name: Aeropuerto_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Aeropuerto_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Aeropuerto_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 197
-- Name: Aeropuerto_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Aeropuerto_Codigo_seq" OWNED BY public."Aeropuerto"."Codigo";


--
-- TOC entry 198 (class 1259 OID 25779)
-- Name: Auditoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Auditoria" (
    "Usuario" character varying(20) NOT NULL,
    "Fecha_Ingreso" date NOT NULL,
    "Accion" character varying(50) NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Observa" integer NOT NULL
);


ALTER TABLE public."Auditoria" OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 25782)
-- Name: Auditoria_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Auditoria_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Auditoria_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 199
-- Name: Auditoria_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Auditoria_Codigo_seq" OWNED BY public."Auditoria"."Codigo";


--
-- TOC entry 200 (class 1259 OID 25784)
-- Name: Cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cliente" (
    "Cedula" integer NOT NULL,
    "Nombre" character varying(50) NOT NULL,
    "Apellido" character varying(50) NOT NULL,
    "Correo_Personal" character varying(50) NOT NULL,
    "Fecha_Nacimiento" date NOT NULL,
    estado_civil character varying(2) NOT NULL,
    "Empresa" character varying(50),
    l_vip boolean,
    "Frecuente" boolean,
    CONSTRAINT "Check_VIP" CHECK (((l_vip = true) OR false)),
    CONSTRAINT "Check_estadocivil1" CHECK (((estado_civil)::text = ((('soltero'::text || 'casado'::text) || 'viudo'::text) || 'divorciado'::text)))
);


ALTER TABLE public."Cliente" OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 25789)
-- Name: Contabilidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Contabilidad" (
    "Descripcion" character varying(50) NOT NULL,
    "Salario" real NOT NULL,
    "Dias_Trabajados" date NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Calcula" integer NOT NULL
);


ALTER TABLE public."Contabilidad" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 25792)
-- Name: Contabilidad_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Contabilidad_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Contabilidad_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 202
-- Name: Contabilidad_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Contabilidad_Codigo_seq" OWNED BY public."Contabilidad"."Codigo";


--
-- TOC entry 203 (class 1259 OID 25794)
-- Name: Emp-Hor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Emp-Hor" (
    "Fecha" date NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Asistencia" integer NOT NULL,
    "FK_Recibe_Emp" integer NOT NULL
);


ALTER TABLE public."Emp-Hor" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 25797)
-- Name: Emp-Hor_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Emp-Hor_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Emp-Hor_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 204
-- Name: Emp-Hor_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Emp-Hor_Codigo_seq" OWNED BY public."Emp-Hor"."Codigo";


--
-- TOC entry 205 (class 1259 OID 25799)
-- Name: Emp-Zon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Emp-Zon" (
    "Codigo" integer NOT NULL,
    "FK_Asiste" integer NOT NULL,
    "FK_Asignar" integer NOT NULL
);


ALTER TABLE public."Emp-Zon" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 25802)
-- Name: Emp-Zon_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Emp-Zon_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Emp-Zon_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 206
-- Name: Emp-Zon_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Emp-Zon_Codigo_seq" OWNED BY public."Emp-Zon"."Codigo";


--
-- TOC entry 207 (class 1259 OID 25804)
-- Name: Empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Empleado" (
    "Cedula" integer NOT NULL,
    "Nombre" character varying(50) NOT NULL,
    "Apellido" character varying(50) NOT NULL,
    "Correo_Personal" character varying(50) NOT NULL,
    "Fecha_Nacimiento" date NOT NULL,
    estado_civil character varying(15) NOT NULL,
    "Nivel_Academico" character varying(50) NOT NULL,
    "Profesion" character varying(50) NOT NULL,
    "Num_hijos" integer,
    "FK_Habitacion" integer NOT NULL,
    CONSTRAINT "Check_estadocivil2" CHECK (((estado_civil)::text = ((('soltero'::text || 'casado'::text) || 'viudo'::text) || 'divorciado'::text)))
);


ALTER TABLE public."Empleado" OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 25808)
-- Name: Env-Est; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Env-Est" (
    "FK_Revisa_Sta" integer NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Encuentra_Sta" integer NOT NULL
);


ALTER TABLE public."Env-Est" OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 25811)
-- Name: Env-Est_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Env-Est_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Env-Est_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 209
-- Name: Env-Est_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Env-Est_Codigo_seq" OWNED BY public."Env-Est"."Codigo";


--
-- TOC entry 210 (class 1259 OID 25813)
-- Name: Env-Rut; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Env-Rut" (
    "Codigo" integer NOT NULL,
    "FK_Adquiere_Pa" integer NOT NULL,
    "FK_Recorre" integer NOT NULL
);


ALTER TABLE public."Env-Rut" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 25816)
-- Name: Env-Rut_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Env-Rut_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Env-Rut_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 211
-- Name: Env-Rut_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Env-Rut_Codigo_seq" OWNED BY public."Env-Rut"."Codigo";


--
-- TOC entry 212 (class 1259 OID 25818)
-- Name: Envio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Envio" (
    "Monto" real NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Destino" integer NOT NULL,
    "FK_Realiza" integer NOT NULL
);


ALTER TABLE public."Envio" OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 25821)
-- Name: Envio_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Envio_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Envio_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 213
-- Name: Envio_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Envio_Codigo_seq" OWNED BY public."Envio"."Codigo";


--
-- TOC entry 214 (class 1259 OID 25823)
-- Name: Estatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Estatus" (
    "Descripcion" character varying(50) NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Revision" integer NOT NULL
);


ALTER TABLE public."Estatus" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 25826)
-- Name: Estatus_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Estatus_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Estatus_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 215
-- Name: Estatus_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Estatus_Codigo_seq" OWNED BY public."Estatus"."Codigo";


--
-- TOC entry 216 (class 1259 OID 25828)
-- Name: Falla; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Falla" (
    "Descripcion" character varying(50) NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Origina" character varying(15) NOT NULL,
    "FK_Origina2" character varying(15) NOT NULL,
    "FK_Origina3" character varying(15) NOT NULL
);


ALTER TABLE public."Falla" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 25831)
-- Name: Falla_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Falla_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Falla_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3439 (class 0 OID 0)
-- Dependencies: 217
-- Name: Falla_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Falla_Codigo_seq" OWNED BY public."Falla"."Codigo";


--
-- TOC entry 218 (class 1259 OID 25833)
-- Name: Horario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Horario" (
    "Dia" date NOT NULL,
    "Hora_Inicio" time(6) with time zone NOT NULL,
    "Hora_Fin" time(6) with time zone NOT NULL,
    "Descripcion" character varying(50) NOT NULL,
    "FK_cada-uno" integer NOT NULL,
    "Codigo" integer NOT NULL
);


ALTER TABLE public."Horario" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 25836)
-- Name: Horario_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Horario_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Horario_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3440 (class 0 OID 0)
-- Dependencies: 219
-- Name: Horario_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Horario_Codigo_seq" OWNED BY public."Horario"."Codigo";


--
-- TOC entry 220 (class 1259 OID 25838)
-- Name: Lugar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Lugar" (
    "Nombre" character varying(50) NOT NULL,
    "Tipo" character varying(50) NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Lugar" integer
);


ALTER TABLE public."Lugar" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 25841)
-- Name: Lugar_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Lugar_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Lugar_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3441 (class 0 OID 0)
-- Dependencies: 221
-- Name: Lugar_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Lugar_Codigo_seq" OWNED BY public."Lugar"."Codigo";


--
-- TOC entry 222 (class 1259 OID 25843)
-- Name: Marca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Marca" (
    "Descripcion" character varying(50) NOT NULL,
    "Codigo" integer NOT NULL
);


ALTER TABLE public."Marca" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 25846)
-- Name: Marca_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Marca_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Marca_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3442 (class 0 OID 0)
-- Dependencies: 223
-- Name: Marca_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Marca_Codigo_seq" OWNED BY public."Marca"."Codigo";


--
-- TOC entry 224 (class 1259 OID 25848)
-- Name: Modelo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Modelo" (
    "Descripcion" character varying(50) NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Contiene" integer NOT NULL
);


ALTER TABLE public."Modelo" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 25851)
-- Name: Modelo_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Modelo_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Modelo_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3443 (class 0 OID 0)
-- Dependencies: 225
-- Name: Modelo_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Modelo_Codigo_seq" OWNED BY public."Modelo"."Codigo";


--
-- TOC entry 226 (class 1259 OID 25853)
-- Name: Ofi-Paq; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ofi-Paq" (
    "Codigo" integer NOT NULL,
    "FK_Almacena" integer NOT NULL,
    "FK_Llega" integer NOT NULL
);


ALTER TABLE public."Ofi-Paq" OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 25856)
-- Name: Ofi-Paq_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Ofi-Paq_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Ofi-Paq_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3444 (class 0 OID 0)
-- Dependencies: 227
-- Name: Ofi-Paq_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Ofi-Paq_Codigo_seq" OWNED BY public."Ofi-Paq"."Codigo";


--
-- TOC entry 228 (class 1259 OID 25858)
-- Name: Ofi-Rut; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ofi-Rut" (
    "Costo" real NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Camino" character varying(15) NOT NULL,
    "FK_Camino2" character varying(15) NOT NULL,
    "FK_Camino3" character varying(15) NOT NULL,
    "FK_Ofi_Origen" integer NOT NULL,
    "FK_Ofi_Destino" integer NOT NULL
);


ALTER TABLE public."Ofi-Rut" OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 25861)
-- Name: Ofi-Rut_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Ofi-Rut_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Ofi-Rut_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 229
-- Name: Ofi-Rut_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Ofi-Rut_Codigo_seq" OWNED BY public."Ofi-Rut"."Codigo";


--
-- TOC entry 230 (class 1259 OID 25863)
-- Name: Ofi-Ser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ofi-Ser" (
    "Codigo" integer NOT NULL,
    "FK_Gasta" integer NOT NULL,
    "FK_Pago" integer NOT NULL,
    "FK_Ofrece" integer NOT NULL
);


ALTER TABLE public."Ofi-Ser" OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 25866)
-- Name: Ofi-Ser_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Ofi-Ser_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Ofi-Ser_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 231
-- Name: Ofi-Ser_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Ofi-Ser_Codigo_seq" OWNED BY public."Ofi-Ser"."Codigo";


--
-- TOC entry 232 (class 1259 OID 25868)
-- Name: Oficina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Oficina" (
    "Nombre" character varying(20) NOT NULL,
    "Tamaño_Deposito" real NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Varios" integer NOT NULL
);


ALTER TABLE public."Oficina" OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 25871)
-- Name: Oficina_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Oficina_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Oficina_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 233
-- Name: Oficina_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Oficina_Codigo_seq" OWNED BY public."Oficina"."Codigo";


--
-- TOC entry 234 (class 1259 OID 25873)
-- Name: Pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Pago" (
    "Monto_Total" real NOT NULL,
    "Fecha" date NOT NULL,
    "Tipo" character varying(20) NOT NULL,
    "Numero_unico" integer NOT NULL,
    "FK_Costo" integer NOT NULL,
    "FK_Cancela1" integer NOT NULL,
    "FK_Cancela2" integer NOT NULL,
    "FK_Cancela3" integer NOT NULL
);


ALTER TABLE public."Pago" OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 25876)
-- Name: Paquete; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Paquete" (
    "Destinatario" character varying(50) NOT NULL,
    "Peso" real NOT NULL,
    "Clasificacion" character varying(50) NOT NULL,
    "Telefono_Contacto" character varying(20) NOT NULL,
    "Dimension_Paquete" real NOT NULL,
    "Numero_guia" integer NOT NULL,
    "FK_Transporta" integer NOT NULL,
    "FK_Entrega" integer NOT NULL
);


ALTER TABLE public."Paquete" OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 25879)
-- Name: Persona-Contacto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Persona-Contacto" (
    "CI" integer NOT NULL,
    "Nombre" character varying(20) NOT NULL
);


ALTER TABLE public."Persona-Contacto" OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 25882)
-- Name: Priv-Rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Priv-Rol" (
    "Codigo" integer NOT NULL,
    "FK_Opcion" integer NOT NULL,
    "FK_Accede_Sis" integer NOT NULL
);


ALTER TABLE public."Priv-Rol" OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 25885)
-- Name: Priv-Rol_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Priv-Rol_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Priv-Rol_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 238
-- Name: Priv-Rol_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Priv-Rol_Codigo_seq" OWNED BY public."Priv-Rol"."Codigo";


--
-- TOC entry 239 (class 1259 OID 25887)
-- Name: Privilegio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Privilegio" (
    tipo character varying(2) NOT NULL,
    "Codigo" integer NOT NULL,
    CONSTRAINT "Check_tipo" CHECK ((((tipo)::text = 'si'::text) OR false))
);


ALTER TABLE public."Privilegio" OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 25891)
-- Name: Privilegio_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Privilegio_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Privilegio_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 240
-- Name: Privilegio_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Privilegio_Codigo_seq" OWNED BY public."Privilegio"."Codigo";


--
-- TOC entry 241 (class 1259 OID 25893)
-- Name: Puerto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Puerto" (
    "Cantidad_Puestos" integer NOT NULL,
    "Area_Techada" real NOT NULL,
    "Muelles" integer NOT NULL,
    "Longitud" real NOT NULL,
    "Ancho" real NOT NULL,
    "Calado" real NOT NULL,
    "Uso" character varying(20) NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Sede" integer NOT NULL,
    "FK_Tiene_con" integer NOT NULL
);


ALTER TABLE public."Puerto" OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 25896)
-- Name: Puerto_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Puerto_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Puerto_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 242
-- Name: Puerto_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Puerto_Codigo_seq" OWNED BY public."Puerto"."Codigo";


--
-- TOC entry 243 (class 1259 OID 25898)
-- Name: Rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Rol" (
    "Tipo" character varying(50) NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Asignado_tipo" integer NOT NULL,
    "FK_Asignado_Puesto" integer NOT NULL
);


ALTER TABLE public."Rol" OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 25901)
-- Name: Rol_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Rol_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Rol_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 244
-- Name: Rol_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Rol_Codigo_seq" OWNED BY public."Rol"."Codigo";


--
-- TOC entry 245 (class 1259 OID 25903)
-- Name: Ruta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ruta" (
    "Descripcion" character varying(50) NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Ruta" integer,
    "FK_Camino" integer NOT NULL
);


ALTER TABLE public."Ruta" OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 25906)
-- Name: Ruta_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Ruta_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Ruta_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 246
-- Name: Ruta_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Ruta_Codigo_seq" OWNED BY public."Ruta"."Codigo";


--
-- TOC entry 247 (class 1259 OID 25908)
-- Name: Servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Servicio" (
    "Descripcion" character varying(50) NOT NULL,
    "Codigo" integer NOT NULL
);


ALTER TABLE public."Servicio" OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 25911)
-- Name: Servicio_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Servicio_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Servicio_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 248
-- Name: Servicio_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Servicio_Codigo_seq" OWNED BY public."Servicio"."Codigo";


--
-- TOC entry 249 (class 1259 OID 25913)
-- Name: Tall-Per.C; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tall-Per.C" (
    "Codigo" integer NOT NULL,
    "FK_Conoce" integer NOT NULL,
    "FK_Referente" integer NOT NULL
);


ALTER TABLE public."Tall-Per.C" OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 25916)
-- Name: Tall-Per.C_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tall-Per.C_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Tall-Per.C_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 250
-- Name: Tall-Per.C_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tall-Per.C_Codigo_seq" OWNED BY public."Tall-Per.C"."Codigo";


--
-- TOC entry 251 (class 1259 OID 25918)
-- Name: Taller; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Taller" (
    "Flota_Revision" character varying(20),
    "Fecha_Entrada" date,
    "Fecha_Salida_Prevista" date,
    "Fecha_Salida_Real" date,
    "Proxima_Fecha" date,
    "Codigo" integer NOT NULL,
    "FK_Locacion" integer NOT NULL
);


ALTER TABLE public."Taller" OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 25921)
-- Name: Taller_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Taller_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Taller_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 252
-- Name: Taller_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Taller_Codigo_seq" OWNED BY public."Taller"."Codigo";


--
-- TOC entry 253 (class 1259 OID 25923)
-- Name: Telefono; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Telefono" (
    "Numero" integer NOT NULL,
    tipo character varying(20) NOT NULL,
    "FK_Dispositivo" integer,
    "FK_Comunicado" integer,
    "FK_Telefonia" integer,
    "FK_Posee" integer,
    CONSTRAINT "Check_tipotelf" CHECK (((tipo)::text = (('local'::text || 'oficina'::text) || 'movil'::text)))
);


ALTER TABLE public."Telefono" OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 25927)
-- Name: Tipo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tipo" (
    "Nombre" character varying(20) NOT NULL,
    "Descripcion" character varying(50) NOT NULL,
    "Costo" real NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Es_de" integer NOT NULL
);


ALTER TABLE public."Tipo" OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 25930)
-- Name: Tipo_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tipo_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Tipo_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 255
-- Name: Tipo_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tipo_Codigo_seq" OWNED BY public."Tipo"."Codigo";


--
-- TOC entry 256 (class 1259 OID 25932)
-- Name: Tipo_Pago_Cheque; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tipo_Pago_Cheque" (
    "Monto_Total" real NOT NULL,
    "Numero_Cheque" integer NOT NULL,
    "Institucion_Financiera" character varying(20) NOT NULL,
    "Codigo" integer NOT NULL
);


ALTER TABLE public."Tipo_Pago_Cheque" OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 25935)
-- Name: Tipo_Pago_Cheque_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tipo_Pago_Cheque_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Tipo_Pago_Cheque_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 257
-- Name: Tipo_Pago_Cheque_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tipo_Pago_Cheque_Codigo_seq" OWNED BY public."Tipo_Pago_Cheque"."Codigo";


--
-- TOC entry 258 (class 1259 OID 25937)
-- Name: Tipo_Pago_Credit_Card; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tipo_Pago_Credit_Card" (
    "Monto_Total" real NOT NULL,
    "Tipo_Tarjeta" character varying(20) NOT NULL,
    "Banco" character varying(20) NOT NULL,
    "Numero_Tarjeta" integer NOT NULL,
    "Codigo" integer NOT NULL
);


ALTER TABLE public."Tipo_Pago_Credit_Card" OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 25940)
-- Name: Tipo_Pago_Credit_Card_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tipo_Pago_Credit_Card_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Tipo_Pago_Credit_Card_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 259
-- Name: Tipo_Pago_Credit_Card_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tipo_Pago_Credit_Card_Codigo_seq" OWNED BY public."Tipo_Pago_Credit_Card"."Codigo";


--
-- TOC entry 260 (class 1259 OID 25942)
-- Name: Tipo_Pago_Efectivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tipo_Pago_Efectivo" (
    "Monto_total" real NOT NULL,
    "Total_Billetes" real NOT NULL,
    "Codigo" integer NOT NULL
);


ALTER TABLE public."Tipo_Pago_Efectivo" OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 25945)
-- Name: Tipo_Pago_Efectivo_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tipo_Pago_Efectivo_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Tipo_Pago_Efectivo_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 261
-- Name: Tipo_Pago_Efectivo_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tipo_Pago_Efectivo_Codigo_seq" OWNED BY public."Tipo_Pago_Efectivo"."Codigo";


--
-- TOC entry 262 (class 1259 OID 25947)
-- Name: Usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Usuario" (
    "Nombre" character varying(20) NOT NULL,
    "Correo" character varying(50) NOT NULL,
    "Contraseña" character varying(50) NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Sele_Concede" integer NOT NULL
);


ALTER TABLE public."Usuario" OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 25950)
-- Name: Usuario_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Usuario_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Usuario_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 263
-- Name: Usuario_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Usuario_Codigo_seq" OWNED BY public."Usuario"."Codigo";


--
-- TOC entry 264 (class 1259 OID 25952)
-- Name: Vea-Aero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Vea-Aero" (
    "Codigo" integer NOT NULL,
    "FK_Guarda" character varying(15) NOT NULL,
    "FK_Estaciona" integer NOT NULL
);


ALTER TABLE public."Vea-Aero" OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 25955)
-- Name: Vea-Aero_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Vea-Aero_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Vea-Aero_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 265
-- Name: Vea-Aero_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Vea-Aero_Codigo_seq" OWNED BY public."Vea-Aero"."Codigo";


--
-- TOC entry 266 (class 1259 OID 25957)
-- Name: Veh-Tall; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Veh-Tall" (
    "Codigo" integer NOT NULL,
    "FK_Enviar" character varying(15) NOT NULL,
    "FK_Enviar2" character varying(15) NOT NULL,
    "FK_Enviar3" character varying(15) NOT NULL,
    "FK_Chequear" integer NOT NULL,
    "FK_Refleja" integer NOT NULL
);


ALTER TABLE public."Veh-Tall" OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 25960)
-- Name: Veh-Tall_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Veh-Tall_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Veh-Tall_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 267
-- Name: Veh-Tall_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Veh-Tall_Codigo_seq" OWNED BY public."Veh-Tall"."Codigo";


--
-- TOC entry 268 (class 1259 OID 25962)
-- Name: Vehiculo_Aereo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Vehiculo_Aereo" (
    "Placa" character varying(20) NOT NULL,
    "Peso" real,
    "Capacidad" real NOT NULL,
    "Serial_Motor" character varying(20) NOT NULL,
    "Altura" real NOT NULL,
    "Velocidad_Maxima" integer,
    "Capacidad_Combustible" real NOT NULL,
    "Envergadura" real NOT NULL,
    "Ancho_Cabina" real NOT NULL,
    "Diametro_Fusilaje" real NOT NULL,
    "Peso_Vacio" real NOT NULL,
    "Peso_Max_Despegue" real NOT NULL,
    "Carrera_Despegue" real NOT NULL,
    "Motores" character varying(20),
    "FK_Representa" integer NOT NULL,
    "FK_Cuentacon" integer NOT NULL
);


ALTER TABLE public."Vehiculo_Aereo" OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 25965)
-- Name: Vehiculo_Maritimo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Vehiculo_Maritimo" (
    "Placa" character varying(20) NOT NULL,
    "Peso" real,
    "Capacidad" real NOT NULL,
    "Serial_Motor" character varying(20) NOT NULL,
    "Altura" real NOT NULL,
    "Velocidad_Maxima" integer,
    "Capacidad_Combustible" real NOT NULL,
    "Nombre" character varying(20) NOT NULL,
    "FK_Representa" integer NOT NULL,
    "FK_Cuentacon" integer NOT NULL
);


ALTER TABLE public."Vehiculo_Maritimo" OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 25968)
-- Name: Vehiculo_Terrestre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Vehiculo_Terrestre" (
    "Placa" character varying(15) NOT NULL,
    "Peso" real,
    "Capacidad" real NOT NULL,
    "Serial_Motor" character varying(20) NOT NULL,
    "Altura" real NOT NULL,
    "Velocidad_Maxima" integer,
    "Capacidad_Combustible" real NOT NULL,
    "Serial_Carroceria" character varying(20) NOT NULL,
    "FK_Representa" integer NOT NULL,
    "FK_Cuentacon" integer NOT NULL
);


ALTER TABLE public."Vehiculo_Terrestre" OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 25971)
-- Name: Vma-Pue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Vma-Pue" (
    "Codigo" integer NOT NULL,
    "FK_Atraca" character varying(15) NOT NULL,
    "FK_Desembarca" integer NOT NULL
);


ALTER TABLE public."Vma-Pue" OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 25974)
-- Name: Vma-Pue_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Vma-Pue_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Vma-Pue_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 272
-- Name: Vma-Pue_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Vma-Pue_Codigo_seq" OWNED BY public."Vma-Pue"."Codigo";


--
-- TOC entry 273 (class 1259 OID 25976)
-- Name: Zona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Zona" (
    "Nombre" character varying(20) NOT NULL,
    "Descripcion" character varying(50) NOT NULL,
    "Division_area" integer NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Divide" integer NOT NULL
);


ALTER TABLE public."Zona" OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 25979)
-- Name: Zona_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Zona_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Zona_Codigo_seq" OWNER TO postgres;

--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 274
-- Name: Zona_Codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Zona_Codigo_seq" OWNED BY public."Zona"."Codigo";


--
-- TOC entry 2925 (class 2604 OID 25981)
-- Name: Aeropuerto Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Aeropuerto" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Aeropuerto_Codigo_seq"'::regclass);


--
-- TOC entry 2926 (class 2604 OID 25982)
-- Name: Auditoria Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Auditoria" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Auditoria_Codigo_seq"'::regclass);


--
-- TOC entry 2929 (class 2604 OID 25983)
-- Name: Contabilidad Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contabilidad" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Contabilidad_Codigo_seq"'::regclass);


--
-- TOC entry 2930 (class 2604 OID 25984)
-- Name: Emp-Hor Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Emp-Hor" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Emp-Hor_Codigo_seq"'::regclass);


--
-- TOC entry 2931 (class 2604 OID 25985)
-- Name: Emp-Zon Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Emp-Zon" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Emp-Zon_Codigo_seq"'::regclass);


--
-- TOC entry 2933 (class 2604 OID 25986)
-- Name: Env-Est Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Env-Est" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Env-Est_Codigo_seq"'::regclass);


--
-- TOC entry 2934 (class 2604 OID 25987)
-- Name: Env-Rut Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Env-Rut" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Env-Rut_Codigo_seq"'::regclass);


--
-- TOC entry 2935 (class 2604 OID 25988)
-- Name: Envio Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Envio" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Envio_Codigo_seq"'::regclass);


--
-- TOC entry 2936 (class 2604 OID 25989)
-- Name: Estatus Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Estatus" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Estatus_Codigo_seq"'::regclass);


--
-- TOC entry 2937 (class 2604 OID 25990)
-- Name: Falla Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Falla" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Falla_Codigo_seq"'::regclass);


--
-- TOC entry 2938 (class 2604 OID 25991)
-- Name: Horario Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Horario" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Horario_Codigo_seq"'::regclass);


--
-- TOC entry 2939 (class 2604 OID 25992)
-- Name: Lugar Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lugar" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Lugar_Codigo_seq"'::regclass);


--
-- TOC entry 2940 (class 2604 OID 25993)
-- Name: Marca Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Marca" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Marca_Codigo_seq"'::regclass);


--
-- TOC entry 2941 (class 2604 OID 25994)
-- Name: Modelo Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Modelo" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Modelo_Codigo_seq"'::regclass);


--
-- TOC entry 2942 (class 2604 OID 25995)
-- Name: Ofi-Paq Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ofi-Paq" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Ofi-Paq_Codigo_seq"'::regclass);


--
-- TOC entry 2943 (class 2604 OID 25996)
-- Name: Ofi-Rut Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ofi-Rut" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Ofi-Rut_Codigo_seq"'::regclass);


--
-- TOC entry 2944 (class 2604 OID 25997)
-- Name: Ofi-Ser Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ofi-Ser" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Ofi-Ser_Codigo_seq"'::regclass);


--
-- TOC entry 2945 (class 2604 OID 25998)
-- Name: Oficina Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Oficina" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Oficina_Codigo_seq"'::regclass);


--
-- TOC entry 2946 (class 2604 OID 25999)
-- Name: Priv-Rol Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Priv-Rol" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Priv-Rol_Codigo_seq"'::regclass);


--
-- TOC entry 2947 (class 2604 OID 26000)
-- Name: Privilegio Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Privilegio" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Privilegio_Codigo_seq"'::regclass);


--
-- TOC entry 2949 (class 2604 OID 26001)
-- Name: Puerto Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Puerto" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Puerto_Codigo_seq"'::regclass);


--
-- TOC entry 2950 (class 2604 OID 26002)
-- Name: Rol Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Rol_Codigo_seq"'::regclass);


--
-- TOC entry 2951 (class 2604 OID 26003)
-- Name: Ruta Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ruta" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Ruta_Codigo_seq"'::regclass);


--
-- TOC entry 2952 (class 2604 OID 26004)
-- Name: Servicio Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Servicio" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Servicio_Codigo_seq"'::regclass);


--
-- TOC entry 2953 (class 2604 OID 26005)
-- Name: Tall-Per.C Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tall-Per.C" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Tall-Per.C_Codigo_seq"'::regclass);


--
-- TOC entry 2954 (class 2604 OID 26006)
-- Name: Taller Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Taller" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Taller_Codigo_seq"'::regclass);


--
-- TOC entry 2956 (class 2604 OID 26007)
-- Name: Tipo Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tipo" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Tipo_Codigo_seq"'::regclass);


--
-- TOC entry 2957 (class 2604 OID 26008)
-- Name: Tipo_Pago_Cheque Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tipo_Pago_Cheque" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Tipo_Pago_Cheque_Codigo_seq"'::regclass);


--
-- TOC entry 2958 (class 2604 OID 26009)
-- Name: Tipo_Pago_Credit_Card Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tipo_Pago_Credit_Card" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Tipo_Pago_Credit_Card_Codigo_seq"'::regclass);


--
-- TOC entry 2959 (class 2604 OID 26010)
-- Name: Tipo_Pago_Efectivo Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tipo_Pago_Efectivo" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Tipo_Pago_Efectivo_Codigo_seq"'::regclass);


--
-- TOC entry 2960 (class 2604 OID 26011)
-- Name: Usuario Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Usuario_Codigo_seq"'::regclass);


--
-- TOC entry 2961 (class 2604 OID 26012)
-- Name: Vea-Aero Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vea-Aero" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Vea-Aero_Codigo_seq"'::regclass);


--
-- TOC entry 2962 (class 2604 OID 26013)
-- Name: Veh-Tall Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Veh-Tall" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Veh-Tall_Codigo_seq"'::regclass);


--
-- TOC entry 2963 (class 2604 OID 26014)
-- Name: Vma-Pue Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vma-Pue" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Vma-Pue_Codigo_seq"'::regclass);


--
-- TOC entry 2964 (class 2604 OID 26015)
-- Name: Zona Codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Zona" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Zona_Codigo_seq"'::regclass);


--
-- TOC entry 3346 (class 0 OID 25774)
-- Dependencies: 196
-- Data for Name: Aeropuerto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3348 (class 0 OID 25779)
-- Dependencies: 198
-- Data for Name: Auditoria; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3350 (class 0 OID 25784)
-- Dependencies: 200
-- Data for Name: Cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3351 (class 0 OID 25789)
-- Dependencies: 201
-- Data for Name: Contabilidad; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3353 (class 0 OID 25794)
-- Dependencies: 203
-- Data for Name: Emp-Hor; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3355 (class 0 OID 25799)
-- Dependencies: 205
-- Data for Name: Emp-Zon; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3357 (class 0 OID 25804)
-- Dependencies: 207
-- Data for Name: Empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3358 (class 0 OID 25808)
-- Dependencies: 208
-- Data for Name: Env-Est; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3360 (class 0 OID 25813)
-- Dependencies: 210
-- Data for Name: Env-Rut; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3362 (class 0 OID 25818)
-- Dependencies: 212
-- Data for Name: Envio; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3364 (class 0 OID 25823)
-- Dependencies: 214
-- Data for Name: Estatus; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3366 (class 0 OID 25828)
-- Dependencies: 216
-- Data for Name: Falla; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3368 (class 0 OID 25833)
-- Dependencies: 218
-- Data for Name: Horario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3370 (class 0 OID 25838)
-- Dependencies: 220
-- Data for Name: Lugar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Amazonas', 'Estado', 1601, NULL);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Anzoátegui', 'Estado', 1602, NULL);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Apure', 'Estado', 1603, NULL);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Aragua', 'Estado', 1604, NULL);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Barinas', 'Estado', 1605, NULL);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bolívar', 'Estado', 1606, NULL);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Carabobo', 'Estado', 1607, NULL);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cojedes', 'Estado', 1608, NULL);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Delta Amacuro', 'Estado', 1609, NULL);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Falcón', 'Estado', 1610, NULL);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guárico', 'Estado', 1611, NULL);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Lara', 'Estado', 1612, NULL);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mérida', 'Estado', 1613, NULL);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Miranda', 'Estado', 1614, NULL);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Monagas', 'Estado', 1615, NULL);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Nueva Esparta', 'Estado', 1616, NULL);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Portuguesa', 'Estado', 1617, NULL);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sucre', 'Estado', 1618, NULL);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Táchira', 'Estado', 1619, NULL);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Trujillo', 'Estado', 1620, NULL);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Vargas', 'Estado', 1621, NULL);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Yaracuy', 'Estado', 1622, NULL);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Zulia', 'Estado', 1623, NULL);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Distrito Capital', 'Estado', 1624, NULL);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Dependencias Federales', 'Estado', 1625, NULL);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Alto Orinoco', 'Municipio', 1, 1601);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Atabapo', 'Municipio', 2, 1601);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Atures', 'Municipio', 3, 1601);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Autana', 'Municipio', 4, 1601);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Manapiare', 'Municipio', 5, 1601);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Maroa', 'Municipio', 6, 1601);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Río Negro', 'Municipio', 7, 1601);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Anaco', 'Municipio', 8, 1602);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Aragua', 'Municipio', 9, 1602);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Manuel Ezequiel Bruzual', 'Municipio', 10, 1602);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Diego Bautista Urbaneja', 'Municipio', 11, 1602);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Fernando Peñalver', 'Municipio', 12, 1602);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Francisco Del Carmen Carvajal', 'Municipio', 13, 1602);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('General Sir Arthur McGregor', 'Municipio', 14, 1602);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guanta', 'Municipio', 15, 1602);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Independencia', 'Municipio', 16, 1602);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Gregorio Monagas', 'Municipio', 17, 1602);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Juan Antonio Sotillo', 'Municipio', 18, 1602);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Juan Manuel Cajigal', 'Municipio', 19, 1602);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Libertad', 'Municipio', 20, 1602);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Francisco de Miranda', 'Municipio', 21, 1602);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pedro María Freites', 'Municipio', 22, 1602);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Píritu', 'Municipio', 23, 1602);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San José de Guanipa', 'Municipio', 24, 1602);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Juan de Capistrano', 'Municipio', 25, 1602);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Ana', 'Municipio', 26, 1602);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Simón Bolívar', 'Municipio', 27, 1602);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Simón Rodríguez', 'Municipio', 28, 1602);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Achaguas', 'Municipio', 29, 1603);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Biruaca', 'Municipio', 30, 1603);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Muñóz', 'Municipio', 31, 1603);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Páez', 'Municipio', 32, 1603);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pedro Camejo', 'Municipio', 33, 1603);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Rómulo Gallegos', 'Municipio', 34, 1603);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Fernando', 'Municipio', 35, 1603);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Atanasio Girardot', 'Municipio', 36, 1604);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bolívar', 'Municipio', 37, 1604);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Camatagua', 'Municipio', 38, 1604);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Francisco Linares Alcántara', 'Municipio', 39, 1604);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Ángel Lamas', 'Municipio', 40, 1604);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Félix Ribas', 'Municipio', 41, 1604);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Rafael Revenga', 'Municipio', 42, 1604);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Libertador', 'Municipio', 43, 1604);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mario Briceño Iragorry', 'Municipio', 44, 1604);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ocumare de la Costa de Oro', 'Municipio', 45, 1604);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Casimiro', 'Municipio', 46, 1604);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Sebastián', 'Municipio', 47, 1604);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santiago Mariño', 'Municipio', 48, 1604);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santos Michelena', 'Municipio', 49, 1604);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sucre', 'Municipio', 50, 1604);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tovar', 'Municipio', 51, 1604);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Urdaneta', 'Municipio', 52, 1604);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Zamora', 'Municipio', 53, 1604);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Alberto Arvelo Torrealba', 'Municipio', 54, 1605);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Andrés Eloy Blanco', 'Municipio', 55, 1605);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Antonio José de Sucre', 'Municipio', 56, 1605);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Arismendi', 'Municipio', 57, 1605);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Barinas', 'Municipio', 58, 1605);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bolívar', 'Municipio', 59, 1605);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cruz Paredes', 'Municipio', 60, 1605);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ezequiel Zamora', 'Municipio', 61, 1605);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Obispos', 'Municipio', 62, 1605);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pedraza', 'Municipio', 63, 1605);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Rojas', 'Municipio', 64, 1605);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sosa', 'Municipio', 65, 1605);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Caroní', 'Municipio', 66, 1606);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cedeño', 'Municipio', 67, 1606);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Callao', 'Municipio', 68, 1606);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Gran Sabana', 'Municipio', 69, 1606);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Heres', 'Municipio', 70, 1606);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Piar', 'Municipio', 71, 1606);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Angostura (Raúl Leoni)', 'Municipio', 72, 1606);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Roscio', 'Municipio', 73, 1606);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sifontes', 'Municipio', 74, 1606);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sucre', 'Municipio', 75, 1606);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Padre Pedro Chien', 'Municipio', 76, 1606);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bejuma', 'Municipio', 77, 1607);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Carlos Arvelo', 'Municipio', 78, 1607);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Diego Ibarra', 'Municipio', 79, 1607);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guacara', 'Municipio', 80, 1607);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Juan José Mora', 'Municipio', 81, 1607);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Libertador', 'Municipio', 82, 1607);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Los Guayos', 'Municipio', 83, 1607);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Miranda', 'Municipio', 84, 1607);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Montalbán', 'Municipio', 85, 1607);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Naguanagua', 'Municipio', 86, 1607);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Puerto Cabello', 'Municipio', 87, 1607);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Diego', 'Municipio', 88, 1607);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Joaquín', 'Municipio', 89, 1607);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Valencia', 'Municipio', 90, 1607);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Anzoátegui', 'Municipio', 91, 1608);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tinaquillo', 'Municipio', 92, 1608);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Girardot', 'Municipio', 93, 1608);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Lima Blanco', 'Municipio', 94, 1608);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pao de San Juan Bautista', 'Municipio', 95, 1608);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ricaurte', 'Municipio', 96, 1608);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Rómulo Gallegos', 'Municipio', 97, 1608);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Carlos', 'Municipio', 98, 1608);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tinaco', 'Municipio', 99, 1608);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Antonio Díaz', 'Municipio', 100, 1609);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Casacoima', 'Municipio', 101, 1609);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pedernales', 'Municipio', 102, 1609);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tucupita', 'Municipio', 103, 1609);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Acosta', 'Municipio', 104, 1610);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bolívar', 'Municipio', 105, 1610);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Buchivacoa', 'Municipio', 106, 1610);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cacique Manaure', 'Municipio', 107, 1610);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Carirubana', 'Municipio', 108, 1610);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Colina', 'Municipio', 109, 1610);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Dabajuro', 'Municipio', 110, 1610);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Democracia', 'Municipio', 111, 1610);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Falcón', 'Municipio', 112, 1610);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Federación', 'Municipio', 113, 1610);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Jacura', 'Municipio', 114, 1610);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Laurencio Silva', 'Municipio', 115, 1610);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Los Taques', 'Municipio', 116, 1610);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mauroa', 'Municipio', 117, 1610);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Miranda', 'Municipio', 118, 1610);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Monseñor Iturriza', 'Municipio', 119, 1610);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Palmasola', 'Municipio', 120, 1610);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Petit', 'Municipio', 121, 1610);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Píritu', 'Municipio', 122, 1610);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Francisco', 'Municipio', 123, 1610);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sucre', 'Municipio', 124, 1610);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tocópero', 'Municipio', 125, 1610);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Unión', 'Municipio', 126, 1610);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Urumaco', 'Municipio', 127, 1610);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Zamora', 'Municipio', 128, 1610);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Camaguán', 'Municipio', 129, 1611);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Chaguaramas', 'Municipio', 130, 1611);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Socorro', 'Municipio', 131, 1611);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Félix Ribas', 'Municipio', 132, 1611);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Tadeo Monagas', 'Municipio', 133, 1611);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Juan Germán Roscio', 'Municipio', 134, 1611);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Julián Mellado', 'Municipio', 135, 1611);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Las Mercedes', 'Municipio', 136, 1611);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Leonardo Infante', 'Municipio', 137, 1611);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pedro Zaraza', 'Municipio', 138, 1611);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ortíz', 'Municipio', 139, 1611);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Gerónimo de Guayabal', 'Municipio', 140, 1611);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San José de Guaribe', 'Municipio', 141, 1611);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa María de Ipire', 'Municipio', 142, 1611);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sebastián Francisco de Miranda', 'Municipio', 143, 1611);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Andrés Eloy Blanco', 'Municipio', 144, 1612);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Crespo', 'Municipio', 145, 1612);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Iribarren', 'Municipio', 146, 1612);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Jiménez', 'Municipio', 147, 1612);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Morán', 'Municipio', 148, 1612);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Palavecino', 'Municipio', 149, 1612);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Simón Planas', 'Municipio', 150, 1612);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Torres', 'Municipio', 151, 1612);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Urdaneta', 'Municipio', 152, 1612);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Alberto Adriani', 'Municipio', 179, 1613);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Andrés Bello', 'Municipio', 180, 1613);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Antonio Pinto Salinas', 'Municipio', 181, 1613);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Aricagua', 'Municipio', 182, 1613);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Arzobispo Chacón', 'Municipio', 183, 1613);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Campo Elías', 'Municipio', 184, 1613);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Caracciolo Parra Olmedo', 'Municipio', 185, 1613);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cardenal Quintero', 'Municipio', 186, 1613);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guaraque', 'Municipio', 187, 1613);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Julio César Salas', 'Municipio', 188, 1613);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Justo Briceño', 'Municipio', 189, 1613);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Libertador', 'Municipio', 190, 1613);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Miranda', 'Municipio', 191, 1613);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Obispo Ramos de Lora', 'Municipio', 192, 1613);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Padre Noguera', 'Municipio', 193, 1613);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pueblo Llano', 'Municipio', 194, 1613);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Rangel', 'Municipio', 195, 1613);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Rivas Dávila', 'Municipio', 196, 1613);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santos Marquina', 'Municipio', 197, 1613);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sucre', 'Municipio', 198, 1613);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tovar', 'Municipio', 199, 1613);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tulio Febres Cordero', 'Municipio', 200, 1613);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Zea', 'Municipio', 201, 1613);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Acevedo', 'Municipio', 223, 1614);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Andrés Bello', 'Municipio', 224, 1614);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Baruta', 'Municipio', 225, 1614);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Brión', 'Municipio', 226, 1614);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Buroz', 'Municipio', 227, 1614);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Carrizal', 'Municipio', 228, 1614);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Chacao', 'Municipio', 229, 1614);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cristóbal Rojas', 'Municipio', 230, 1614);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Hatillo', 'Municipio', 231, 1614);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guaicaipuro', 'Municipio', 232, 1614);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Independencia', 'Municipio', 233, 1614);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Lander', 'Municipio', 234, 1614);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Los Salias', 'Municipio', 235, 1614);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Páez', 'Municipio', 236, 1614);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Paz Castillo', 'Municipio', 237, 1614);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pedro Gual', 'Municipio', 238, 1614);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Plaza', 'Municipio', 239, 1614);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Simón Bolívar', 'Municipio', 240, 1614);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sucre', 'Municipio', 241, 1614);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Urdaneta', 'Municipio', 242, 1614);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Zamora', 'Municipio', 243, 1614);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Acosta', 'Municipio', 258, 1615);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Aguasay', 'Municipio', 259, 1615);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bolívar', 'Municipio', 260, 1615);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Caripe', 'Municipio', 261, 1615);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cedeño', 'Municipio', 262, 1615);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ezequiel Zamora', 'Municipio', 263, 1615);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Libertador', 'Municipio', 264, 1615);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Maturín', 'Municipio', 265, 1615);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Piar', 'Municipio', 266, 1615);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Punceres', 'Municipio', 267, 1615);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Bárbara', 'Municipio', 268, 1615);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sotillo', 'Municipio', 269, 1615);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Uracoa', 'Municipio', 270, 1615);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Antolín del Campo', 'Municipio', 271, 1616);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Arismendi', 'Municipio', 272, 1616);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('García', 'Municipio', 273, 1616);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Gómez', 'Municipio', 274, 1616);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Maneiro', 'Municipio', 275, 1616);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Marcano', 'Municipio', 276, 1616);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mariño', 'Municipio', 277, 1616);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Península de Macanao', 'Municipio', 278, 1616);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tubores', 'Municipio', 279, 1616);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Villalba', 'Municipio', 280, 1616);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Díaz', 'Municipio', 281, 1616);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Agua Blanca', 'Municipio', 282, 1617);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Araure', 'Municipio', 283, 1617);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Esteller', 'Municipio', 284, 1617);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guanare', 'Municipio', 285, 1617);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guanarito', 'Municipio', 286, 1617);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Monseñor José Vicente de Unda', 'Municipio', 287, 1617);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ospino', 'Municipio', 288, 1617);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Páez', 'Municipio', 289, 1617);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Papelón', 'Municipio', 290, 1617);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Genaro de Boconoíto', 'Municipio', 291, 1617);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Rafael de Onoto', 'Municipio', 292, 1617);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Rosalía', 'Municipio', 293, 1617);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sucre', 'Municipio', 294, 1617);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Turén', 'Municipio', 295, 1617);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Andrés Eloy Blanco', 'Municipio', 296, 1618);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Andrés Mata', 'Municipio', 297, 1618);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Arismendi', 'Municipio', 298, 1618);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Benítez', 'Municipio', 299, 1618);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bermúdez', 'Municipio', 300, 1618);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bolívar', 'Municipio', 301, 1618);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cajigal', 'Municipio', 302, 1618);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cruz Salmerón Acosta', 'Municipio', 303, 1618);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Libertador', 'Municipio', 304, 1618);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mariño', 'Municipio', 305, 1618);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mejía', 'Municipio', 306, 1618);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Montes', 'Municipio', 307, 1618);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ribero', 'Municipio', 308, 1618);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sucre', 'Municipio', 309, 1618);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Valdéz', 'Municipio', 310, 1618);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Andrés Bello', 'Municipio', 341, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Antonio Rómulo Costa', 'Municipio', 342, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ayacucho', 'Municipio', 343, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bolívar', 'Municipio', 344, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cárdenas', 'Municipio', 345, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Córdoba', 'Municipio', 346, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Fernández Feo', 'Municipio', 347, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Francisco de Miranda', 'Municipio', 348, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('García de Hevia', 'Municipio', 349, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guásimos', 'Municipio', 350, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Independencia', 'Municipio', 351, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Jáuregui', 'Municipio', 352, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José María Vargas', 'Municipio', 353, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Junín', 'Municipio', 354, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Libertad', 'Municipio', 355, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Libertador', 'Municipio', 356, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Lobatera', 'Municipio', 357, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Michelena', 'Municipio', 358, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Panamericano', 'Municipio', 359, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pedro María Ureña', 'Municipio', 360, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Rafael Urdaneta', 'Municipio', 361, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Samuel Darío Maldonado', 'Municipio', 362, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Cristóbal', 'Municipio', 363, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Seboruco', 'Municipio', 364, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Simón Rodríguez', 'Municipio', 365, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sucre', 'Municipio', 366, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Torbes', 'Municipio', 367, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Uribante', 'Municipio', 368, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Judas Tadeo', 'Municipio', 369, 1619);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Andrés Bello', 'Municipio', 370, 1620);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Boconó', 'Municipio', 371, 1620);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bolívar', 'Municipio', 372, 1620);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Candelaria', 'Municipio', 373, 1620);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Carache', 'Municipio', 374, 1620);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Escuque', 'Municipio', 375, 1620);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Felipe Márquez Cañizalez', 'Municipio', 376, 1620);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Juan Vicente Campos Elías', 'Municipio', 377, 1620);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Ceiba', 'Municipio', 378, 1620);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Miranda', 'Municipio', 379, 1620);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Monte Carmelo', 'Municipio', 380, 1620);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Motatán', 'Municipio', 381, 1620);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pampán', 'Municipio', 382, 1620);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pampanito', 'Municipio', 383, 1620);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Rafael Rangel', 'Municipio', 384, 1620);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Rafael de Carvajal', 'Municipio', 385, 1620);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sucre', 'Municipio', 386, 1620);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Trujillo', 'Municipio', 387, 1620);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Urdaneta', 'Municipio', 388, 1620);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Valera', 'Municipio', 389, 1620);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Vargas', 'Municipio', 390, 1621);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Arístides Bastidas', 'Municipio', 391, 1622);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bolívar', 'Municipio', 392, 1622);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bruzual', 'Municipio', 407, 1622);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cocorote', 'Municipio', 408, 1622);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Independencia', 'Municipio', 409, 1622);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Antonio Páez', 'Municipio', 410, 1622);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Trinidad', 'Municipio', 411, 1622);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Manuel Monge', 'Municipio', 412, 1622);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Nirgua', 'Municipio', 413, 1622);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Peña', 'Municipio', 414, 1622);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Felipe', 'Municipio', 415, 1622);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sucre', 'Municipio', 416, 1622);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Urachiche', 'Municipio', 417, 1622);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Joaquín Veroes', 'Municipio', 418, 1622);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Almirante Padilla', 'Municipio', 441, 1623);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Baralt', 'Municipio', 442, 1623);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cabimas', 'Municipio', 443, 1623);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Catatumbo', 'Municipio', 444, 1623);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Colón', 'Municipio', 445, 1623);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Francisco Javier Pulgar', 'Municipio', 446, 1623);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Páez', 'Municipio', 447, 1623);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Jesús Enrique Losada', 'Municipio', 448, 1623);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Jesús María Semprún', 'Municipio', 449, 1623);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Cañada de Urdaneta', 'Municipio', 450, 1623);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Lagunillas', 'Municipio', 451, 1623);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Machiques de Perijá', 'Municipio', 452, 1623);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mara', 'Municipio', 453, 1623);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Maracaibo', 'Municipio', 454, 1623);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Miranda', 'Municipio', 455, 1623);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Rosario de Perijá', 'Municipio', 456, 1623);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Francisco', 'Municipio', 457, 1623);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Rita', 'Municipio', 458, 1623);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Simón Bolívar', 'Municipio', 459, 1623);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sucre', 'Municipio', 460, 1623);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Valmore Rodríguez', 'Municipio', 461, 1623);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Libertador', 'Municipio', 462, 1624);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Alto Orinoco', 'Parroquia', 463, 1);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Huachamacare Acanaña', 'Parroquia', 464, 1);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Marawaka Toky Shamanaña', 'Parroquia', 465, 1);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mavaka Mavaka', 'Parroquia', 466, 1);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sierra Parima Parimabé', 'Parroquia', 467, 1);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ucata Laja Lisa', 'Parroquia', 468, 2);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Yapacana Macuruco', 'Parroquia', 469, 2);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Caname Guarinuma', 'Parroquia', 470, 2);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Fernando Girón Tovar', 'Parroquia', 471, 3);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Luis Alberto Gómez', 'Parroquia', 472, 3);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pahueña Limón de Parhueña', 'Parroquia', 473, 3);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Platanillal Platanillal', 'Parroquia', 474, 3);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Samariapo', 'Parroquia', 475, 4);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sipapo', 'Parroquia', 476, 4);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Munduapo', 'Parroquia', 477, 4);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guayapo', 'Parroquia', 478, 4);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Alto Ventuari', 'Parroquia', 479, 5);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Medio Ventuari', 'Parroquia', 480, 5);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bajo Ventuari', 'Parroquia', 481, 5);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Victorino', 'Parroquia', 482, 6);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Comunidad', 'Parroquia', 483, 6);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Casiquiare', 'Parroquia', 484, 7);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cocuy', 'Parroquia', 485, 7);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Carlos de Río Negro', 'Parroquia', 486, 7);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Solano', 'Parroquia', 487, 7);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Anaco', 'Parroquia', 488, 8);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Joaquín', 'Parroquia', 489, 8);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cachipo', 'Parroquia', 490, 9);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Aragua de Barcelona', 'Parroquia', 491, 9);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Lechería', 'Parroquia', 492, 11);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Morro', 'Parroquia', 493, 11);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Puerto Píritu', 'Parroquia', 494, 12);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Miguel', 'Parroquia', 495, 12);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sucre', 'Parroquia', 496, 12);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Valle de Guanape', 'Parroquia', 497, 13);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Bárbara', 'Parroquia', 498, 13);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Chaparro', 'Parroquia', 499, 14);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tomás Alfaro', 'Parroquia', 500, 14);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Calatrava', 'Parroquia', 501, 14);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guanta', 'Parroquia', 502, 15);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Chorrerón', 'Parroquia', 503, 15);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mamo', 'Parroquia', 504, 16);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Soledad', 'Parroquia', 505, 16);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mapire', 'Parroquia', 506, 17);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Piar', 'Parroquia', 507, 17);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Clara', 'Parroquia', 508, 17);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Diego de Cabrutica', 'Parroquia', 509, 17);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Uverito', 'Parroquia', 510, 17);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Zuata', 'Parroquia', 511, 17);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Puerto La Cruz', 'Parroquia', 512, 18);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pozuelos', 'Parroquia', 513, 18);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Onoto', 'Parroquia', 514, 19);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Pablo', 'Parroquia', 515, 19);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Mateo', 'Parroquia', 516, 20);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Carito', 'Parroquia', 517, 20);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Inés', 'Parroquia', 518, 20);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Romereña', 'Parroquia', 519, 20);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Atapirire', 'Parroquia', 520, 21);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Boca del Pao', 'Parroquia', 521, 21);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Pao', 'Parroquia', 522, 21);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pariaguán', 'Parroquia', 523, 21);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cantaura', 'Parroquia', 524, 22);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Libertador', 'Parroquia', 525, 22);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Rosa', 'Parroquia', 526, 22);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Urica', 'Parroquia', 527, 22);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Píritu', 'Parroquia', 528, 23);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Francisco', 'Parroquia', 529, 23);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San José de Guanipa', 'Parroquia', 530, 24);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Boca de Uchire', 'Parroquia', 531, 25);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Boca de Chávez', 'Parroquia', 532, 25);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pueblo Nuevo', 'Parroquia', 533, 26);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Ana', 'Parroquia', 534, 26);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bergantín', 'Parroquia', 535, 27);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Caigua', 'Parroquia', 536, 27);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Carmen', 'Parroquia', 537, 27);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Pilar', 'Parroquia', 538, 27);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Naricual', 'Parroquia', 539, 27);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Crsitóbal', 'Parroquia', 540, 27);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Edmundo Barrios', 'Parroquia', 541, 28);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Miguel Otero Silva', 'Parroquia', 542, 28);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Achaguas', 'Parroquia', 543, 29);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Apurito', 'Parroquia', 544, 29);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Yagual', 'Parroquia', 545, 29);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guachara', 'Parroquia', 546, 29);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mucuritas', 'Parroquia', 547, 29);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Queseras del medio', 'Parroquia', 548, 29);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Biruaca', 'Parroquia', 549, 30);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bruzual', 'Parroquia', 550, 31);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mantecal', 'Parroquia', 551, 31);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Quintero', 'Parroquia', 552, 31);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Rincón Hondo', 'Parroquia', 553, 31);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Vicente', 'Parroquia', 554, 31);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guasdualito', 'Parroquia', 555, 32);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Aramendi', 'Parroquia', 556, 32);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Amparo', 'Parroquia', 557, 32);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Camilo', 'Parroquia', 558, 32);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Urdaneta', 'Parroquia', 559, 32);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Juan de Payara', 'Parroquia', 560, 33);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Codazzi', 'Parroquia', 561, 33);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cunaviche', 'Parroquia', 562, 33);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Elorza', 'Parroquia', 563, 34);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Trinidad', 'Parroquia', 564, 34);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Fernando', 'Parroquia', 565, 35);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Recreo', 'Parroquia', 566, 35);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Peñalver', 'Parroquia', 567, 35);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Rafael de Atamaica', 'Parroquia', 568, 35);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pedro José Ovalles', 'Parroquia', 569, 36);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Joaquín Crespo', 'Parroquia', 570, 36);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Casanova Godoy', 'Parroquia', 571, 36);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Madre María de San José', 'Parroquia', 572, 36);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Andrés Eloy Blanco', 'Parroquia', 573, 36);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Los Tacarigua', 'Parroquia', 574, 36);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Las Delicias', 'Parroquia', 575, 36);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Choroní', 'Parroquia', 576, 36);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bolívar', 'Parroquia', 577, 37);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Camatagua', 'Parroquia', 578, 38);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Carmen de Cura', 'Parroquia', 579, 38);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Rita', 'Parroquia', 580, 39);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Francisco de Miranda', 'Parroquia', 581, 39);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Moseñor Feliciano González', 'Parroquia', 582, 39);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Cruz', 'Parroquia', 583, 40);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Félix Ribas', 'Parroquia', 584, 41);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Castor Nieves Ríos', 'Parroquia', 585, 41);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Las Guacamayas', 'Parroquia', 586, 41);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pao de Zárate', 'Parroquia', 587, 41);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Zuata', 'Parroquia', 588, 41);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Rafael Revenga', 'Parroquia', 589, 42);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Palo Negro', 'Parroquia', 590, 43);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Martín de Porres', 'Parroquia', 591, 43);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Limón', 'Parroquia', 592, 44);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Caña de Azúcar', 'Parroquia', 593, 44);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ocumare de la Costa', 'Parroquia', 594, 45);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Casimiro', 'Parroquia', 595, 46);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Güiripa', 'Parroquia', 596, 46);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ollas de Caramacate', 'Parroquia', 597, 46);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Valle Morín', 'Parroquia', 598, 46);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Sebastían', 'Parroquia', 599, 47);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Turmero', 'Parroquia', 600, 48);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Arevalo Aponte', 'Parroquia', 601, 48);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Chuao', 'Parroquia', 602, 48);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Samán de Güere', 'Parroquia', 603, 48);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Alfredo Pacheco Miranda', 'Parroquia', 604, 48);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santos Michelena', 'Parroquia', 605, 49);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tiara', 'Parroquia', 606, 49);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cagua', 'Parroquia', 607, 50);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bella Vista', 'Parroquia', 608, 50);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tovar', 'Parroquia', 609, 51);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Urdaneta', 'Parroquia', 610, 52);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Las Peñitas', 'Parroquia', 611, 52);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Francisco de Cara', 'Parroquia', 612, 52);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Taguay', 'Parroquia', 613, 52);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Zamora', 'Parroquia', 614, 53);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Magdaleno', 'Parroquia', 615, 53);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Francisco de Asís', 'Parroquia', 616, 53);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Valles de Tucutunemo', 'Parroquia', 617, 53);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Augusto Mijares', 'Parroquia', 618, 53);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sabaneta', 'Parroquia', 619, 54);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Juan Antonio Rodríguez Domínguez', 'Parroquia', 620, 54);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Cantón', 'Parroquia', 621, 55);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Cruz de Guacas', 'Parroquia', 622, 55);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Puerto Vivas', 'Parroquia', 623, 55);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ticoporo', 'Parroquia', 624, 56);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Nicolás Pulido', 'Parroquia', 625, 56);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Andrés Bello', 'Parroquia', 626, 56);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Arismendi', 'Parroquia', 627, 57);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guadarrama', 'Parroquia', 628, 57);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Unión', 'Parroquia', 629, 57);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Antonio', 'Parroquia', 630, 57);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Barinas', 'Parroquia', 631, 58);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Alberto Arvelo Larriva', 'Parroquia', 632, 58);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Silvestre', 'Parroquia', 633, 58);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Inés', 'Parroquia', 634, 58);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Lucía', 'Parroquia', 635, 58);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Torumos', 'Parroquia', 636, 58);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Carmen', 'Parroquia', 637, 58);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Rómulo Betancourt', 'Parroquia', 638, 58);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Corazón de Jesús', 'Parroquia', 639, 58);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ramón Ignacio Méndez', 'Parroquia', 640, 58);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Alto Barinas', 'Parroquia', 641, 58);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Manuel Palacio Fajardo', 'Parroquia', 642, 58);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Juan Antonio Rodríguez Domínguez', 'Parroquia', 643, 58);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Dominga Ortiz de Páez', 'Parroquia', 644, 58);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Barinitas', 'Parroquia', 645, 59);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Altamira de Cáceres', 'Parroquia', 646, 59);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Calderas', 'Parroquia', 647, 59);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Barrancas', 'Parroquia', 648, 60);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Socorro', 'Parroquia', 649, 60);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mazparrito', 'Parroquia', 650, 60);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Bárbara', 'Parroquia', 651, 61);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pedro Briceño Méndez', 'Parroquia', 652, 61);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ramón Ignacio Méndez', 'Parroquia', 653, 61);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Ignacio del Pumar', 'Parroquia', 654, 61);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Obispos', 'Parroquia', 655, 62);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guasimitos', 'Parroquia', 656, 62);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Real', 'Parroquia', 657, 62);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Luz', 'Parroquia', 658, 62);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ciudad Bolívia', 'Parroquia', 659, 63);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Ignacio Briceño', 'Parroquia', 660, 63);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Félix Ribas', 'Parroquia', 661, 63);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Páez', 'Parroquia', 662, 63);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Libertad', 'Parroquia', 663, 64);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Dolores', 'Parroquia', 664, 64);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Rosa', 'Parroquia', 665, 64);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Palacio Fajardo', 'Parroquia', 666, 64);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ciudad de Nutrias', 'Parroquia', 667, 65);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Regalo', 'Parroquia', 668, 65);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Puerto Nutrias', 'Parroquia', 669, 65);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Catalina', 'Parroquia', 670, 65);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cachamay', 'Parroquia', 671, 66);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Chirica', 'Parroquia', 672, 66);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Dalla Costa', 'Parroquia', 673, 66);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Once de Abril', 'Parroquia', 674, 66);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Simón Bolívar', 'Parroquia', 675, 66);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Unare', 'Parroquia', 676, 66);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Universidad', 'Parroquia', 677, 66);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Vista al Sol', 'Parroquia', 678, 66);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pozo Verde', 'Parroquia', 679, 66);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Yocoima', 'Parroquia', 680, 66);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('5 de Julio', 'Parroquia', 681, 66);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cedeño', 'Parroquia', 682, 67);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Altagracia', 'Parroquia', 683, 67);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ascensión Farreras', 'Parroquia', 684, 67);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guaniamo', 'Parroquia', 685, 67);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Urbana', 'Parroquia', 686, 67);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pijiguaos', 'Parroquia', 687, 67);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Callao', 'Parroquia', 688, 68);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Gran Sabana', 'Parroquia', 689, 69);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ikabarú', 'Parroquia', 690, 69);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Catedral', 'Parroquia', 691, 70);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Zea', 'Parroquia', 692, 70);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Orinoco', 'Parroquia', 693, 70);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Antonio Páez', 'Parroquia', 694, 70);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Marhuanta', 'Parroquia', 695, 70);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Agua Salada', 'Parroquia', 696, 70);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Vista Hermosa', 'Parroquia', 697, 70);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Sabanita', 'Parroquia', 698, 70);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Panapana', 'Parroquia', 699, 70);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Andrés Eloy Blanco', 'Parroquia', 700, 71);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pedro Cova', 'Parroquia', 701, 71);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Raúl Leoni', 'Parroquia', 702, 72);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Barceloneta', 'Parroquia', 703, 72);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Bárbara', 'Parroquia', 704, 72);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Francisco', 'Parroquia', 705, 72);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Roscio', 'Parroquia', 706, 73);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Salóm', 'Parroquia', 707, 73);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sifontes', 'Parroquia', 708, 74);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Dalla Costa', 'Parroquia', 709, 74);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Isidro', 'Parroquia', 710, 74);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sucre', 'Parroquia', 711, 75);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Aripao', 'Parroquia', 712, 75);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guarataro', 'Parroquia', 713, 75);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Las Majadas', 'Parroquia', 714, 75);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Moitaco', 'Parroquia', 715, 75);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Padre Pedro Chien', 'Parroquia', 716, 76);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Río Grande', 'Parroquia', 717, 76);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bejuma', 'Parroquia', 718, 77);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Canoabo', 'Parroquia', 719, 77);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Simón Bolívar', 'Parroquia', 720, 77);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Güigüe', 'Parroquia', 721, 78);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Carabobo', 'Parroquia', 722, 78);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tacarigua', 'Parroquia', 723, 78);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mariara', 'Parroquia', 724, 79);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Aguas Calientes', 'Parroquia', 725, 79);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ciudad Alianza', 'Parroquia', 726, 80);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guacara', 'Parroquia', 727, 80);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Yagua', 'Parroquia', 728, 80);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Morón', 'Parroquia', 729, 81);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Yagua', 'Parroquia', 730, 81);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tocuyito', 'Parroquia', 731, 82);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Independencia', 'Parroquia', 732, 82);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Los Guayos', 'Parroquia', 733, 83);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Miranda', 'Parroquia', 734, 84);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Montalbán', 'Parroquia', 735, 85);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Naguanagua', 'Parroquia', 736, 86);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bartolomé Salóm', 'Parroquia', 737, 87);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Democracia', 'Parroquia', 738, 87);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Fraternidad', 'Parroquia', 739, 87);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Goaigoaza', 'Parroquia', 740, 87);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Juan José Flores', 'Parroquia', 741, 87);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Unión', 'Parroquia', 742, 87);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Borburata', 'Parroquia', 743, 87);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Patanemo', 'Parroquia', 744, 87);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Diego', 'Parroquia', 745, 88);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Joaquín', 'Parroquia', 746, 89);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Candelaria', 'Parroquia', 747, 90);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Catedral', 'Parroquia', 748, 90);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Socorro', 'Parroquia', 749, 90);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Miguel Peña', 'Parroquia', 750, 90);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Rafael Urdaneta', 'Parroquia', 751, 90);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Blas', 'Parroquia', 752, 90);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San José', 'Parroquia', 753, 90);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Rosa', 'Parroquia', 754, 90);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Negro Primero', 'Parroquia', 755, 90);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cojedes', 'Parroquia', 756, 91);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Juan de Mata Suárez', 'Parroquia', 757, 91);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tinaquillo', 'Parroquia', 758, 92);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Baúl', 'Parroquia', 759, 93);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sucre', 'Parroquia', 760, 93);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Aguadita', 'Parroquia', 761, 94);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Macapo', 'Parroquia', 762, 94);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Pao', 'Parroquia', 763, 95);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Amparo', 'Parroquia', 764, 96);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Libertad de Cojedes', 'Parroquia', 765, 96);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Rómulo Gallegos', 'Parroquia', 766, 97);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Carlos de Austria', 'Parroquia', 767, 98);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Juan Ángel Bravo', 'Parroquia', 768, 98);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Manuel Manrique', 'Parroquia', 769, 98);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('General en Jefe José Laurencio Silva', 'Parroquia', 770, 99);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Curiapo', 'Parroquia', 771, 100);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Almirante Luis Brión', 'Parroquia', 772, 100);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Francisco Aniceto Lugo', 'Parroquia', 773, 100);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Manuel Renaud', 'Parroquia', 774, 100);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Padre Barral', 'Parroquia', 775, 100);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santos de Abelgas', 'Parroquia', 776, 100);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Imataca', 'Parroquia', 777, 101);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cinco de Julio', 'Parroquia', 778, 101);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Juan Bautista Arismendi', 'Parroquia', 779, 101);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Manuel Piar', 'Parroquia', 780, 101);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Rómulo Gallegos', 'Parroquia', 781, 101);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pedernales', 'Parroquia', 782, 102);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Luis Beltrán Prieto Figueroa', 'Parroquia', 783, 102);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San José (Delta Amacuro)', 'Parroquia', 784, 103);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Vidal Marcano', 'Parroquia', 785, 103);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Juan Millán', 'Parroquia', 786, 103);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Leonardo Ruíz Pineda', 'Parroquia', 787, 103);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mariscal Antonio José de Sucre', 'Parroquia', 788, 103);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Monseñor Argimiro García', 'Parroquia', 789, 103);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Rafael (Delta Amacuro)', 'Parroquia', 790, 103);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Virgen del Valle', 'Parroquia', 791, 103);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Clarines', 'Parroquia', 792, 10);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guanape', 'Parroquia', 793, 10);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sabana de Uchire', 'Parroquia', 794, 10);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Capadare', 'Parroquia', 795, 104);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Pastora', 'Parroquia', 796, 104);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Libertador', 'Parroquia', 797, 104);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Juan de los Cayos', 'Parroquia', 798, 104);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Aracua', 'Parroquia', 799, 105);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Peña', 'Parroquia', 800, 105);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Luis', 'Parroquia', 801, 105);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bariro', 'Parroquia', 802, 106);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Borojó', 'Parroquia', 803, 106);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Capatárida', 'Parroquia', 804, 106);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guajiro', 'Parroquia', 805, 106);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Seque', 'Parroquia', 806, 106);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Zazárida', 'Parroquia', 807, 106);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Valle de Eroa', 'Parroquia', 808, 106);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cacique Manaure', 'Parroquia', 809, 107);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Norte', 'Parroquia', 810, 108);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Carirubana', 'Parroquia', 811, 108);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Ana', 'Parroquia', 812, 108);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Urbana Punta Cardón', 'Parroquia', 813, 108);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Vela de Coro', 'Parroquia', 814, 109);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Acurigua', 'Parroquia', 815, 109);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guaibacoa', 'Parroquia', 816, 109);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Las Calderas', 'Parroquia', 817, 109);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Macoruca', 'Parroquia', 818, 109);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Dabajuro', 'Parroquia', 819, 110);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Agua Clara', 'Parroquia', 820, 111);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Avaria', 'Parroquia', 821, 111);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pedregal', 'Parroquia', 822, 111);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Piedra Grande', 'Parroquia', 823, 111);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Purureche', 'Parroquia', 824, 111);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Adaure', 'Parroquia', 825, 112);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Adícora', 'Parroquia', 826, 112);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Baraived', 'Parroquia', 827, 112);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Buena Vista', 'Parroquia', 828, 112);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Jadacaquiva', 'Parroquia', 829, 112);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Vínculo', 'Parroquia', 830, 112);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Hato', 'Parroquia', 831, 112);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Moruy', 'Parroquia', 832, 112);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pueblo Nuevo', 'Parroquia', 833, 112);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Agua Larga', 'Parroquia', 834, 113);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Paují', 'Parroquia', 835, 113);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Independencia', 'Parroquia', 836, 113);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mapararí', 'Parroquia', 837, 113);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Agua Linda', 'Parroquia', 838, 114);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Araurima', 'Parroquia', 839, 114);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Jacura', 'Parroquia', 840, 114);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tucacas', 'Parroquia', 841, 115);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Boca de Aroa', 'Parroquia', 842, 115);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Los Taques', 'Parroquia', 843, 116);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Judibana', 'Parroquia', 844, 116);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mene de Mauroa', 'Parroquia', 845, 117);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Félix', 'Parroquia', 846, 117);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Casigua', 'Parroquia', 847, 117);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guzmán Guillermo', 'Parroquia', 848, 118);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mitare', 'Parroquia', 849, 118);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Río Seco', 'Parroquia', 850, 118);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sabaneta', 'Parroquia', 851, 118);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Antonio', 'Parroquia', 852, 118);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Gabriel', 'Parroquia', 853, 118);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Ana', 'Parroquia', 854, 118);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Boca del Tocuyo', 'Parroquia', 855, 119);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Chichiriviche', 'Parroquia', 856, 119);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tocuyo de la Costa', 'Parroquia', 857, 119);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Palmasola', 'Parroquia', 858, 120);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cabure', 'Parroquia', 859, 121);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Colina', 'Parroquia', 860, 121);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Curimagua', 'Parroquia', 861, 121);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San José de la Costa', 'Parroquia', 862, 122);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Píritu', 'Parroquia', 863, 122);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Francisco', 'Parroquia', 864, 123);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sucre', 'Parroquia', 865, 124);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pecaya', 'Parroquia', 866, 124);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tocópero', 'Parroquia', 867, 125);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Charal', 'Parroquia', 868, 126);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Las Vegas del Tuy', 'Parroquia', 869, 126);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Cruz de Bucaral', 'Parroquia', 870, 126);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bruzual', 'Parroquia', 871, 127);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Urumaco', 'Parroquia', 872, 127);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Puerto Cumarebo', 'Parroquia', 873, 128);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Ciénaga', 'Parroquia', 874, 128);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Soledad', 'Parroquia', 875, 128);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pueblo Cumarebo', 'Parroquia', 876, 128);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Zazárida', 'Parroquia', 877, 128);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Churuguara', 'Parroquia', 878, 113);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Camaguán', 'Parroquia', 879, 129);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Puerto Miranda', 'Parroquia', 880, 129);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Uverito', 'Parroquia', 881, 129);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Chaguaramas', 'Parroquia', 882, 130);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Socorro', 'Parroquia', 883, 131);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tucupido', 'Parroquia', 884, 132);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Rafael de Laya', 'Parroquia', 885, 132);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Altagracia de Orituco', 'Parroquia', 886, 133);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Rafael de Orituco', 'Parroquia', 887, 133);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Francisco Javier de Lezama', 'Parroquia', 888, 133);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Paso Real de Macaira', 'Parroquia', 889, 133);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Carlos Soublette', 'Parroquia', 890, 133);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Francisco de Macaira', 'Parroquia', 891, 133);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Libertad de Orituco', 'Parroquia', 892, 133);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cantaclaro', 'Parroquia', 893, 134);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Juan de los Morros', 'Parroquia', 894, 134);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Parapara', 'Parroquia', 895, 134);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Sombrero', 'Parroquia', 896, 135);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sosa', 'Parroquia', 897, 135);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Las Mercedes', 'Parroquia', 898, 136);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cabruta', 'Parroquia', 899, 136);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Rita de Manapire', 'Parroquia', 900, 136);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Valle de la Pascua', 'Parroquia', 901, 137);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Espino', 'Parroquia', 902, 137);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San José de Unare', 'Parroquia', 903, 138);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Zaraza', 'Parroquia', 904, 138);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San José de Tiznados', 'Parroquia', 905, 139);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Francisco de Tiznados', 'Parroquia', 906, 139);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Lorenzo de Tiznados', 'Parroquia', 907, 139);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ortiz', 'Parroquia', 908, 139);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guayabal', 'Parroquia', 909, 140);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cazorla', 'Parroquia', 910, 140);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San José de Guaribe', 'Parroquia', 911, 141);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Uveral', 'Parroquia', 912, 141);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa María de Ipire', 'Parroquia', 913, 142);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Altamira', 'Parroquia', 914, 142);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Calvario', 'Parroquia', 915, 143);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Rastro', 'Parroquia', 916, 143);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guardatinajas', 'Parroquia', 917, 143);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Capital Urbana Calabozo', 'Parroquia', 918, 143);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Quebrada Honda de Guache', 'Parroquia', 919, 144);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pío Tamayo', 'Parroquia', 920, 144);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Yacambú', 'Parroquia', 921, 144);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Fréitez', 'Parroquia', 922, 145);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José María Blanco', 'Parroquia', 923, 145);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Catedral', 'Parroquia', 924, 146);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Concepción', 'Parroquia', 925, 146);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Cují', 'Parroquia', 926, 146);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Juan de Villegas', 'Parroquia', 927, 146);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Rosa', 'Parroquia', 928, 146);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tamaca', 'Parroquia', 929, 146);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Unión', 'Parroquia', 930, 146);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Aguedo Felipe Alvarado', 'Parroquia', 931, 146);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Buena Vista', 'Parroquia', 932, 146);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Juárez', 'Parroquia', 933, 146);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Juan Bautista Rodríguez', 'Parroquia', 934, 147);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cuara', 'Parroquia', 935, 147);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Diego de Lozada', 'Parroquia', 936, 147);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Paraíso de San José', 'Parroquia', 937, 147);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Miguel', 'Parroquia', 938, 147);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tintorero', 'Parroquia', 939, 147);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Bernardo Dorante', 'Parroquia', 940, 147);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Coronel Mariano Peraza ', 'Parroquia', 941, 147);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bolívar', 'Parroquia', 942, 148);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Anzoátegui', 'Parroquia', 943, 148);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guarico', 'Parroquia', 944, 148);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Hilario Luna y Luna', 'Parroquia', 945, 148);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Humocaro Alto', 'Parroquia', 946, 148);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Humocaro Bajo', 'Parroquia', 947, 148);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Candelaria', 'Parroquia', 948, 148);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Morán', 'Parroquia', 949, 148);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cabudare', 'Parroquia', 950, 149);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Gregorio Bastidas', 'Parroquia', 951, 149);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Agua Viva', 'Parroquia', 952, 149);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sarare', 'Parroquia', 953, 150);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Buría', 'Parroquia', 954, 150);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Gustavo Vegas León', 'Parroquia', 955, 150);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Trinidad Samuel', 'Parroquia', 956, 151);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Antonio Díaz', 'Parroquia', 957, 151);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Camacaro', 'Parroquia', 958, 151);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Castañeda', 'Parroquia', 959, 151);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cecilio Zubillaga', 'Parroquia', 960, 151);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Chiquinquirá', 'Parroquia', 961, 151);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Blanco', 'Parroquia', 962, 151);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Espinoza de los Monteros', 'Parroquia', 963, 151);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Lara', 'Parroquia', 964, 151);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Las Mercedes', 'Parroquia', 965, 151);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Manuel Morillo', 'Parroquia', 966, 151);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Montaña Verde', 'Parroquia', 967, 151);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Montes de Oca', 'Parroquia', 968, 151);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Torres', 'Parroquia', 969, 151);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Heriberto Arroyo', 'Parroquia', 970, 151);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Reyes Vargas', 'Parroquia', 971, 151);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Altagracia', 'Parroquia', 972, 151);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Siquisique', 'Parroquia', 973, 152);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Moroturo', 'Parroquia', 974, 152);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Miguel', 'Parroquia', 975, 152);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Xaguas', 'Parroquia', 976, 152);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Presidente Betancourt', 'Parroquia', 977, 179);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Presidente Páez', 'Parroquia', 978, 179);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Presidente Rómulo Gallegos', 'Parroquia', 979, 179);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Gabriel Picón González', 'Parroquia', 980, 179);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Héctor Amable Mora', 'Parroquia', 981, 179);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Nucete Sardi', 'Parroquia', 982, 179);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pulido Méndez', 'Parroquia', 983, 179);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Azulita', 'Parroquia', 984, 180);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Cruz de Mora', 'Parroquia', 985, 181);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mesa Bolívar', 'Parroquia', 986, 181);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mesa de Las Palmas', 'Parroquia', 987, 181);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Aricagua', 'Parroquia', 988, 182);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Antonio', 'Parroquia', 989, 182);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Canagua', 'Parroquia', 990, 183);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Capurí', 'Parroquia', 991, 183);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Chacantá', 'Parroquia', 992, 183);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Molino', 'Parroquia', 993, 183);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guaimaral', 'Parroquia', 994, 183);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mucutuy', 'Parroquia', 995, 183);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mucuchachí', 'Parroquia', 996, 183);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Fernández Peña', 'Parroquia', 997, 184);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Matriz', 'Parroquia', 998, 184);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Montalbán', 'Parroquia', 999, 184);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Acequias', 'Parroquia', 1000, 184);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Jají', 'Parroquia', 1001, 184);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Mesa', 'Parroquia', 1002, 184);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San José del Sur', 'Parroquia', 1003, 184);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tucaní', 'Parroquia', 1004, 185);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Florencio Ramírez', 'Parroquia', 1005, 185);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santo Domingo', 'Parroquia', 1006, 186);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Las Piedras', 'Parroquia', 1007, 186);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guaraque', 'Parroquia', 1008, 187);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mesa de Quintero', 'Parroquia', 1009, 187);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Río Negro', 'Parroquia', 1010, 187);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Arapuey', 'Parroquia', 1011, 188);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Palmira', 'Parroquia', 1012, 188);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Cristóbal de Torondoy', 'Parroquia', 1013, 189);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Torondoy', 'Parroquia', 1014, 189);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Antonio Spinetti Dini', 'Parroquia', 1015, 190);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Arias', 'Parroquia', 1016, 190);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Caracciolo Parra Pérez', 'Parroquia', 1017, 190);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Domingo Peña', 'Parroquia', 1018, 190);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Llano', 'Parroquia', 1019, 190);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Gonzalo Picón Febres', 'Parroquia', 1020, 190);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Jacinto Plaza', 'Parroquia', 1021, 190);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Juan Rodríguez Suárez', 'Parroquia', 1022, 190);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Lasso de la Vega', 'Parroquia', 1023, 190);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mariano Picón Salas', 'Parroquia', 1024, 190);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Milla', 'Parroquia', 1025, 190);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Osuna Rodríguez', 'Parroquia', 1026, 190);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sagrario', 'Parroquia', 1027, 190);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Morro', 'Parroquia', 1028, 190);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Los Nevados', 'Parroquia', 1029, 190);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Andrés Eloy Blanco', 'Parroquia', 1030, 191);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Venta', 'Parroquia', 1031, 191);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Piñango', 'Parroquia', 1032, 191);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Timotes', 'Parroquia', 1033, 191);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Eloy Paredes', 'Parroquia', 1034, 192);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Rafael de Alcázar', 'Parroquia', 1035, 192);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Elena de Arenales', 'Parroquia', 1036, 192);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa María de Caparo', 'Parroquia', 1037, 193);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pueblo Llano', 'Parroquia', 1038, 194);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cacute', 'Parroquia', 1039, 195);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Toma', 'Parroquia', 1040, 195);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mucuchíes', 'Parroquia', 1041, 195);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mucurubá', 'Parroquia', 1042, 195);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Rafael', 'Parroquia', 1043, 195);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Gerónimo Maldonado', 'Parroquia', 1044, 196);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bailadores', 'Parroquia', 1045, 196);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tabay', 'Parroquia', 1046, 197);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Chiguará', 'Parroquia', 1047, 198);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Estánquez', 'Parroquia', 1048, 198);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Lagunillas', 'Parroquia', 1049, 198);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Trampa', 'Parroquia', 1050, 198);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pueblo Nuevo del Sur', 'Parroquia', 1051, 198);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Juan', 'Parroquia', 1052, 198);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Amparo', 'Parroquia', 1053, 199);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Llano', 'Parroquia', 1054, 199);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Francisco', 'Parroquia', 1055, 199);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tovar', 'Parroquia', 1056, 199);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Independencia', 'Parroquia', 1057, 200);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('María de la Concepción Palacios Blanco', 'Parroquia', 1058, 200);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Nueva Bolivia', 'Parroquia', 1059, 200);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Apolonia', 'Parroquia', 1060, 200);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Caño El Tigre', 'Parroquia', 1061, 201);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Zea', 'Parroquia', 1062, 201);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Aragüita', 'Parroquia', 1063, 223);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Arévalo González', 'Parroquia', 1064, 223);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Capaya', 'Parroquia', 1065, 223);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Caucagua', 'Parroquia', 1066, 223);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Panaquire', 'Parroquia', 1067, 223);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ribas', 'Parroquia', 1068, 223);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Café', 'Parroquia', 1069, 223);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Marizapa', 'Parroquia', 1070, 223);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cumbo', 'Parroquia', 1071, 224);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San José de Barlovento', 'Parroquia', 1072, 224);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Cafetal', 'Parroquia', 1073, 225);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Las Minas', 'Parroquia', 1074, 225);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Nuestra Señora del Rosario', 'Parroquia', 1075, 225);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Higuerote', 'Parroquia', 1076, 226);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Curiepe', 'Parroquia', 1077, 226);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tacarigua de Brión', 'Parroquia', 1078, 226);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mamporal', 'Parroquia', 1079, 227);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Carrizal', 'Parroquia', 1080, 228);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Chacao', 'Parroquia', 1081, 229);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Charallave', 'Parroquia', 1082, 230);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Las Brisas', 'Parroquia', 1083, 230);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Hatillo', 'Parroquia', 1084, 231);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Altagracia de la Montaña', 'Parroquia', 1085, 232);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cecilio Acosta', 'Parroquia', 1086, 232);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Los Teques', 'Parroquia', 1087, 232);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Jarillo', 'Parroquia', 1088, 232);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Pedro', 'Parroquia', 1089, 232);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tácata', 'Parroquia', 1090, 232);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Paracotos', 'Parroquia', 1091, 232);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cartanal', 'Parroquia', 1092, 233);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Teresa del Tuy', 'Parroquia', 1093, 233);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Democracia', 'Parroquia', 1094, 234);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ocumare del Tuy', 'Parroquia', 1095, 234);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Bárbara', 'Parroquia', 1096, 234);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Antonio de los Altos', 'Parroquia', 1097, 235);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Río Chico', 'Parroquia', 1098, 236);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Guapo', 'Parroquia', 1099, 236);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tacarigua de la Laguna', 'Parroquia', 1100, 236);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Paparo', 'Parroquia', 1101, 236);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Fernando del Guapo', 'Parroquia', 1102, 236);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Lucía del Tuy', 'Parroquia', 1103, 237);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cúpira', 'Parroquia', 1104, 238);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Machurucuto', 'Parroquia', 1105, 238);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guarenas', 'Parroquia', 1106, 239);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Antonio de Yare', 'Parroquia', 1107, 240);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Francisco de Yare', 'Parroquia', 1108, 240);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Leoncio Martínez', 'Parroquia', 1109, 241);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Petare', 'Parroquia', 1110, 241);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Caucagüita', 'Parroquia', 1111, 241);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Filas de Mariche', 'Parroquia', 1112, 241);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Dolorita', 'Parroquia', 1113, 241);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cúa', 'Parroquia', 1114, 242);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Nueva Cúa', 'Parroquia', 1115, 242);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guatire', 'Parroquia', 1116, 243);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bolívar', 'Parroquia', 1117, 243);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Antonio de Maturín', 'Parroquia', 1118, 258);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Francisco de Maturín', 'Parroquia', 1119, 258);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Aguasay', 'Parroquia', 1120, 259);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Caripito', 'Parroquia', 1121, 260);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Guácharo', 'Parroquia', 1122, 261);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Guanota', 'Parroquia', 1123, 261);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sabana de Piedra', 'Parroquia', 1124, 261);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Agustín', 'Parroquia', 1125, 261);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Teresen', 'Parroquia', 1126, 261);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Caripe', 'Parroquia', 1127, 261);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Areo', 'Parroquia', 1128, 262);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Capital Cedeño', 'Parroquia', 1129, 262);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Félix de Cantalicio', 'Parroquia', 1130, 262);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Viento Fresco', 'Parroquia', 1131, 262);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Tejero', 'Parroquia', 1132, 263);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Punta de Mata', 'Parroquia', 1133, 263);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Chaguaramas', 'Parroquia', 1134, 264);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Las Alhuacas', 'Parroquia', 1135, 264);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tabasca', 'Parroquia', 1136, 264);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Temblador', 'Parroquia', 1137, 264);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Alto de los Godos', 'Parroquia', 1138, 265);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Boquerón', 'Parroquia', 1139, 265);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Las Cocuizas', 'Parroquia', 1140, 265);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Cruz', 'Parroquia', 1141, 265);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Simón', 'Parroquia', 1142, 265);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Corozo', 'Parroquia', 1143, 265);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Furrial', 'Parroquia', 1144, 265);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Jusepín', 'Parroquia', 1145, 265);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Pica', 'Parroquia', 1146, 265);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Vicente', 'Parroquia', 1147, 265);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Aparicio', 'Parroquia', 1148, 266);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Aragua de Maturín', 'Parroquia', 1149, 266);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Chaguamal', 'Parroquia', 1150, 266);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Pinto', 'Parroquia', 1151, 266);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guanaguana', 'Parroquia', 1152, 266);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Toscana', 'Parroquia', 1153, 266);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Taguaya', 'Parroquia', 1154, 266);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cachipo', 'Parroquia', 1155, 267);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Quiriquire', 'Parroquia', 1156, 267);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Bárbara', 'Parroquia', 1157, 268);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Barrancas', 'Parroquia', 1158, 269);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Los Barrancos de Fajardo', 'Parroquia', 1159, 269);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Uracoa', 'Parroquia', 1160, 270);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Antolín del Campo', 'Parroquia', 1161, 271);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Arismendi', 'Parroquia', 1162, 272);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('García', 'Parroquia', 1163, 273);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Francisco Fajardo', 'Parroquia', 1164, 273);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bolívar', 'Parroquia', 1165, 274);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guevara', 'Parroquia', 1166, 274);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Matasiete', 'Parroquia', 1167, 274);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Ana', 'Parroquia', 1168, 274);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sucre', 'Parroquia', 1169, 274);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Aguirre', 'Parroquia', 1170, 275);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Maneiro', 'Parroquia', 1171, 275);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Adrián', 'Parroquia', 1172, 276);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Juan Griego', 'Parroquia', 1173, 276);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Yaguaraparo', 'Parroquia', 1174, 276);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Porlamar', 'Parroquia', 1175, 277);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Francisco de Macanao', 'Parroquia', 1176, 278);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Boca de Río', 'Parroquia', 1177, 278);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tubores', 'Parroquia', 1178, 279);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Los Baleales', 'Parroquia', 1179, 279);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Vicente Fuentes', 'Parroquia', 1180, 280);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Villalba', 'Parroquia', 1181, 280);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Juan Bautista', 'Parroquia', 1182, 281);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Zabala', 'Parroquia', 1183, 281);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Capital Araure', 'Parroquia', 1184, 283);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Río Acarigua', 'Parroquia', 1185, 283);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Capital Esteller', 'Parroquia', 1186, 284);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Uveral', 'Parroquia', 1187, 284);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guanare', 'Parroquia', 1188, 285);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Córdoba', 'Parroquia', 1189, 285);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San José de la Montaña', 'Parroquia', 1190, 285);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Juan de Guanaguanare', 'Parroquia', 1191, 285);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Virgen de la Coromoto', 'Parroquia', 1192, 285);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guanarito', 'Parroquia', 1193, 286);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Trinidad de la Capilla', 'Parroquia', 1194, 286);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Divina Pastora', 'Parroquia', 1195, 286);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Monseñor José Vicente de Unda', 'Parroquia', 1196, 287);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Peña Blanca', 'Parroquia', 1197, 287);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Capital Ospino', 'Parroquia', 1198, 288);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Aparición', 'Parroquia', 1199, 288);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Estación', 'Parroquia', 1200, 288);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Páez', 'Parroquia', 1201, 289);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Payara', 'Parroquia', 1202, 289);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pimpinela', 'Parroquia', 1203, 289);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ramón Peraza', 'Parroquia', 1204, 289);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Papelón', 'Parroquia', 1205, 290);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Caño Delgadito', 'Parroquia', 1206, 290);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Genaro de Boconoito', 'Parroquia', 1207, 291);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Antolín Tovar', 'Parroquia', 1208, 291);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Rafael de Onoto', 'Parroquia', 1209, 292);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Fe', 'Parroquia', 1210, 292);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Thermo Morles', 'Parroquia', 1211, 292);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Rosalía', 'Parroquia', 1212, 293);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Florida', 'Parroquia', 1213, 293);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sucre', 'Parroquia', 1214, 294);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Concepción', 'Parroquia', 1215, 294);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Rafael de Palo Alzado', 'Parroquia', 1216, 294);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Uvencio Antonio Velásquez', 'Parroquia', 1217, 294);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San José de Saguaz', 'Parroquia', 1218, 294);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Villa Rosa', 'Parroquia', 1219, 294);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Turén', 'Parroquia', 1220, 295);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Canelones', 'Parroquia', 1221, 295);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Cruz', 'Parroquia', 1222, 295);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Isidro Labrador', 'Parroquia', 1223, 295);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mariño', 'Parroquia', 1224, 296);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Rómulo Gallegos', 'Parroquia', 1225, 296);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San José de Aerocuar', 'Parroquia', 1226, 297);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tavera Acosta', 'Parroquia', 1227, 297);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Río Caribe', 'Parroquia', 1228, 298);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Antonio José de Sucre', 'Parroquia', 1229, 298);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Morro de Puerto Santo', 'Parroquia', 1230, 298);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Puerto Santo', 'Parroquia', 1231, 298);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Juan de las Galdonas', 'Parroquia', 1232, 298);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Pilar', 'Parroquia', 1233, 299);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Rincón', 'Parroquia', 1234, 299);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('General Francisco Antonio Váquez', 'Parroquia', 1235, 299);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guaraúnos', 'Parroquia', 1236, 299);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tunapuicito', 'Parroquia', 1237, 299);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Unión', 'Parroquia', 1238, 299);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Catalina', 'Parroquia', 1239, 300);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Rosa', 'Parroquia', 1240, 300);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Teresa', 'Parroquia', 1241, 300);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bolívar', 'Parroquia', 1242, 300);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Maracapana', 'Parroquia', 1243, 300);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Libertad', 'Parroquia', 1244, 302);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Paujil', 'Parroquia', 1245, 302);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Yaguaraparo', 'Parroquia', 1246, 302);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cruz Salmerón Acosta', 'Parroquia', 1247, 303);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Chacopata', 'Parroquia', 1248, 303);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Manicuare', 'Parroquia', 1249, 303);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tunapuy', 'Parroquia', 1250, 304);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Campo Elías', 'Parroquia', 1251, 304);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Irapa', 'Parroquia', 1252, 305);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Campo Claro', 'Parroquia', 1253, 305);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Maraval', 'Parroquia', 1254, 305);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Antonio de Irapa', 'Parroquia', 1255, 305);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Soro', 'Parroquia', 1256, 305);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mejía', 'Parroquia', 1257, 306);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cumanacoa', 'Parroquia', 1258, 307);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Arenas', 'Parroquia', 1259, 307);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Aricagua', 'Parroquia', 1260, 307);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cogollar', 'Parroquia', 1261, 307);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Fernando', 'Parroquia', 1262, 307);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Lorenzo', 'Parroquia', 1263, 307);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Villa Frontado (Muelle de Cariaco)', 'Parroquia', 1264, 308);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Catuaro', 'Parroquia', 1265, 308);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Rendón', 'Parroquia', 1266, 308);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Cruz', 'Parroquia', 1267, 308);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa María', 'Parroquia', 1268, 308);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Altagracia', 'Parroquia', 1269, 309);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Inés', 'Parroquia', 1270, 309);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Valentín Valiente', 'Parroquia', 1271, 309);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ayacucho', 'Parroquia', 1272, 309);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Juan', 'Parroquia', 1273, 309);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Raúl Leoni', 'Parroquia', 1274, 309);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Gran Mariscal', 'Parroquia', 1275, 309);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cristóbal Colón', 'Parroquia', 1276, 310);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bideau', 'Parroquia', 1277, 310);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Punta de Piedras', 'Parroquia', 1278, 310);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Güiria', 'Parroquia', 1279, 310);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Andrés Bello', 'Parroquia', 1280, 341);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Antonio Rómulo Costa', 'Parroquia', 1281, 342);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ayacucho', 'Parroquia', 1282, 343);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Rivas Berti', 'Parroquia', 1283, 343);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Pedro del Río', 'Parroquia', 1284, 343);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bolívar', 'Parroquia', 1285, 344);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Palotal', 'Parroquia', 1286, 344);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('General Juan Vicente Gómez', 'Parroquia', 1287, 344);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Isaías Medina Angarita', 'Parroquia', 1288, 344);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cárdenas', 'Parroquia', 1289, 345);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Amenodoro Ángel Lamus', 'Parroquia', 1290, 345);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Florida', 'Parroquia', 1291, 345);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Córdoba', 'Parroquia', 1292, 346);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Fernández Feo', 'Parroquia', 1293, 347);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Alberto Adriani', 'Parroquia', 1294, 347);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santo Domingo', 'Parroquia', 1295, 347);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Francisco de Miranda', 'Parroquia', 1296, 348);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('García de Hevia', 'Parroquia', 1297, 349);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Boca de Grita', 'Parroquia', 1298, 349);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Antonio Páez', 'Parroquia', 1299, 349);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guásimos', 'Parroquia', 1300, 350);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Independencia', 'Parroquia', 1301, 351);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Juan Germán Roscio', 'Parroquia', 1302, 351);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Román Cárdenas', 'Parroquia', 1303, 351);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Jáuregui', 'Parroquia', 1304, 352);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Emilio Constantino Guerrero', 'Parroquia', 1305, 352);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Monseñor Miguel Antonio Salas', 'Parroquia', 1306, 352);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José María Vargas', 'Parroquia', 1307, 353);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Junín', 'Parroquia', 1308, 354);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Petrólea', 'Parroquia', 1309, 354);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Quinimarí', 'Parroquia', 1310, 354);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bramón', 'Parroquia', 1311, 354);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Libertad', 'Parroquia', 1312, 355);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cipriano Castro', 'Parroquia', 1313, 355);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Manuel Felipe Rugeles', 'Parroquia', 1314, 355);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Libertador', 'Parroquia', 1315, 356);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Doradas', 'Parroquia', 1316, 356);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Emeterio Ochoa', 'Parroquia', 1317, 356);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Joaquín de Navay', 'Parroquia', 1318, 356);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Lobatera', 'Parroquia', 1319, 357);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Constitución', 'Parroquia', 1320, 357);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Michelena', 'Parroquia', 1321, 358);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Panamericano', 'Parroquia', 1322, 359);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Palmita', 'Parroquia', 1323, 359);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pedro María Ureña', 'Parroquia', 1324, 360);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Nueva Arcadia', 'Parroquia', 1325, 360);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Delicias', 'Parroquia', 1326, 361);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pecaya', 'Parroquia', 1327, 361);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Samuel Darío Maldonado', 'Parroquia', 1328, 362);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Boconó', 'Parroquia', 1329, 362);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Hernández', 'Parroquia', 1330, 362);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Concordia', 'Parroquia', 1331, 363);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Juan Bautista', 'Parroquia', 1332, 363);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pedro María Morantes', 'Parroquia', 1333, 363);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Sebastián', 'Parroquia', 1334, 363);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Dr. Francisco Romero Lobo', 'Parroquia', 1335, 363);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Seboruco', 'Parroquia', 1336, 364);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Simón Rodríguez', 'Parroquia', 1337, 365);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sucre', 'Parroquia', 1338, 366);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Eleazar López Contreras', 'Parroquia', 1339, 366);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Pablo', 'Parroquia', 1340, 366);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Torbes', 'Parroquia', 1341, 367);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Uribante', 'Parroquia', 1342, 368);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cárdenas', 'Parroquia', 1343, 368);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Juan Pablo Peñalosa', 'Parroquia', 1344, 368);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Potosí', 'Parroquia', 1345, 368);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Judas Tadeo', 'Parroquia', 1346, 369);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Araguaney', 'Parroquia', 1347, 370);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Jaguito', 'Parroquia', 1348, 370);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Esperanza', 'Parroquia', 1349, 370);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Isabel', 'Parroquia', 1350, 370);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Boconó', 'Parroquia', 1351, 371);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Carmen', 'Parroquia', 1352, 371);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mosquey', 'Parroquia', 1353, 371);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ayacucho', 'Parroquia', 1354, 371);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Burbusay', 'Parroquia', 1355, 371);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('General Ribas', 'Parroquia', 1356, 371);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guaramacal', 'Parroquia', 1357, 371);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Vega de Guaramacal', 'Parroquia', 1358, 371);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Monseñor Jáuregui', 'Parroquia', 1359, 371);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Rafael Rangel', 'Parroquia', 1360, 371);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Miguel', 'Parroquia', 1361, 371);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San José', 'Parroquia', 1362, 371);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sabana Grande', 'Parroquia', 1363, 372);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cheregüé', 'Parroquia', 1364, 372);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Granados', 'Parroquia', 1365, 372);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Arnoldo Gabaldón', 'Parroquia', 1366, 373);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bolivia', 'Parroquia', 1367, 373);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Carrillo', 'Parroquia', 1368, 373);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cegarra', 'Parroquia', 1369, 373);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Chejendé', 'Parroquia', 1370, 373);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Manuel Salvador Ulloa', 'Parroquia', 1371, 373);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San José', 'Parroquia', 1372, 373);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Carache', 'Parroquia', 1373, 374);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Concepción', 'Parroquia', 1374, 374);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cuicas', 'Parroquia', 1375, 374);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Panamericana', 'Parroquia', 1376, 374);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Cruz', 'Parroquia', 1377, 374);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Escuque', 'Parroquia', 1378, 375);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Unión', 'Parroquia', 1379, 375);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Rita', 'Parroquia', 1380, 375);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sabana Libre', 'Parroquia', 1381, 375);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Socorro', 'Parroquia', 1382, 376);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Los Caprichos', 'Parroquia', 1383, 376);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Antonio José de Sucre', 'Parroquia', 1384, 376);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Campo Elías', 'Parroquia', 1385, 377);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Arnoldo Gabaldón', 'Parroquia', 1386, 377);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Apolonia', 'Parroquia', 1387, 378);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Progreso', 'Parroquia', 1388, 378);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Ceiba', 'Parroquia', 1389, 378);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tres de Febrero', 'Parroquia', 1390, 378);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Dividive', 'Parroquia', 1391, 379);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Agua Santa', 'Parroquia', 1392, 379);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Agua Caliente', 'Parroquia', 1393, 379);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Cenizo', 'Parroquia', 1394, 379);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Valerita', 'Parroquia', 1395, 379);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Monte Carmelo', 'Parroquia', 1396, 380);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Buena Vista', 'Parroquia', 1397, 380);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa María del Horcón', 'Parroquia', 1398, 380);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Motatán', 'Parroquia', 1399, 381);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Baño', 'Parroquia', 1400, 381);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Jalisco', 'Parroquia', 1401, 381);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pampán', 'Parroquia', 1402, 382);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Flor de Patria', 'Parroquia', 1403, 382);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Paz', 'Parroquia', 1404, 382);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Ana', 'Parroquia', 1405, 382);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pampanito', 'Parroquia', 1406, 383);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Concepción', 'Parroquia', 1407, 383);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pampanito II', 'Parroquia', 1408, 383);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Betijoque', 'Parroquia', 1409, 384);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Gregorio Hernández', 'Parroquia', 1410, 384);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Pueblita', 'Parroquia', 1411, 384);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Los Cedros', 'Parroquia', 1412, 384);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Carvajal', 'Parroquia', 1413, 385);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Campo Alegre', 'Parroquia', 1414, 385);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Antonio Nicolás Briceño', 'Parroquia', 1415, 385);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Leonardo Suárez', 'Parroquia', 1416, 385);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sabana de Mendoza', 'Parroquia', 1417, 386);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Junín', 'Parroquia', 1418, 386);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Valmore Rodríguez', 'Parroquia', 1419, 386);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Paraíso', 'Parroquia', 1420, 386);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Andrés Linares', 'Parroquia', 1421, 387);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Chiquinquirá', 'Parroquia', 1422, 387);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cristóbal Mendoza', 'Parroquia', 1423, 387);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cruz Carrillo', 'Parroquia', 1424, 387);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Matriz', 'Parroquia', 1425, 387);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Monseñor Carrillo', 'Parroquia', 1426, 387);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tres Esquinas', 'Parroquia', 1427, 387);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cabimbú', 'Parroquia', 1428, 388);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Jajó', 'Parroquia', 1429, 388);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Mesa de Esnujaque', 'Parroquia', 1430, 388);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santiago', 'Parroquia', 1431, 388);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tuñame', 'Parroquia', 1432, 388);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Quebrada', 'Parroquia', 1433, 388);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Juan Ignacio Montilla', 'Parroquia', 1434, 389);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Beatriz', 'Parroquia', 1435, 389);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Puerta', 'Parroquia', 1436, 389);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mendoza del Valle de Momboy', 'Parroquia', 1437, 389);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mercedes Díaz', 'Parroquia', 1438, 389);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Luis', 'Parroquia', 1439, 389);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Caraballeda', 'Parroquia', 1440, 390);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Carayaca', 'Parroquia', 1441, 390);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Carlos Soublette', 'Parroquia', 1442, 390);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Caruao Chuspa', 'Parroquia', 1443, 390);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Catia La Mar', 'Parroquia', 1444, 390);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Junko', 'Parroquia', 1445, 390);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Guaira', 'Parroquia', 1446, 390);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Macuto', 'Parroquia', 1447, 390);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Maiquetía', 'Parroquia', 1448, 390);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Naiguatá', 'Parroquia', 1449, 390);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Urimare', 'Parroquia', 1450, 390);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Arístides Bastidas', 'Parroquia', 1451, 391);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bolívar', 'Parroquia', 1452, 392);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Chivacoa', 'Parroquia', 1453, 407);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Campo Elías', 'Parroquia', 1454, 407);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cocorote', 'Parroquia', 1455, 408);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Independencia', 'Parroquia', 1456, 409);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Antonio Páez', 'Parroquia', 1457, 410);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Trinidad', 'Parroquia', 1458, 411);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Manuel Monge', 'Parroquia', 1459, 412);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Salóm', 'Parroquia', 1460, 413);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Temerla', 'Parroquia', 1461, 413);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Nirgua', 'Parroquia', 1462, 413);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Andrés', 'Parroquia', 1463, 414);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Yaritagua', 'Parroquia', 1464, 414);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Javier', 'Parroquia', 1465, 415);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Albarico', 'Parroquia', 1466, 415);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Felipe', 'Parroquia', 1467, 415);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sucre', 'Parroquia', 1468, 416);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Urachiche', 'Parroquia', 1469, 417);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Guayabo', 'Parroquia', 1470, 418);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Farriar', 'Parroquia', 1471, 418);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Isla de Toas', 'Parroquia', 1472, 441);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Monagas', 'Parroquia', 1473, 441);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Timoteo', 'Parroquia', 1474, 442);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('General Urdaneta', 'Parroquia', 1475, 442);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Libertador', 'Parroquia', 1476, 442);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Marcelino Briceño', 'Parroquia', 1477, 442);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pueblo Nuevo', 'Parroquia', 1478, 442);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Manuel Guanipa Matos', 'Parroquia', 1479, 442);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ambrosio', 'Parroquia', 1480, 443);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Carmen Herrera', 'Parroquia', 1481, 443);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Rosa', 'Parroquia', 1482, 443);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Germán Ríos Linares', 'Parroquia', 1483, 443);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Benito', 'Parroquia', 1484, 443);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Rómulo Betancourt', 'Parroquia', 1485, 443);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Jorge Hernández', 'Parroquia', 1486, 443);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Punta Gorda', 'Parroquia', 1487, 443);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Arístides Calvani', 'Parroquia', 1488, 443);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Encontrados', 'Parroquia', 1489, 444);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Udón Pérez', 'Parroquia', 1490, 444);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Moralito', 'Parroquia', 1491, 445);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Carlos del Zulia', 'Parroquia', 1492, 445);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Cruz del Zulia', 'Parroquia', 1493, 445);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Bárbara', 'Parroquia', 1494, 445);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Urribarrí', 'Parroquia', 1495, 445);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Carlos Quevedo', 'Parroquia', 1496, 446);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Francisco Javier Pulgar', 'Parroquia', 1497, 446);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Simón Rodríguez', 'Parroquia', 1498, 446);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guamo-Gavilanes', 'Parroquia', 1499, 446);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Concepción', 'Parroquia', 1500, 448);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San José', 'Parroquia', 1501, 448);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Mariano Parra León', 'Parroquia', 1502, 448);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Ramón Yépez', 'Parroquia', 1503, 448);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Jesús María Semprún', 'Parroquia', 1504, 449);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Barí', 'Parroquia', 1505, 449);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Concepción', 'Parroquia', 1506, 450);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Andrés Bello', 'Parroquia', 1507, 450);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Chiquinquirá', 'Parroquia', 1508, 450);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Carmelo', 'Parroquia', 1509, 450);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Potreritos', 'Parroquia', 1510, 450);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Libertad', 'Parroquia', 1511, 451);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Alonso de Ojeda', 'Parroquia', 1512, 451);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Venezuela', 'Parroquia', 1513, 451);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Eleazar López Contreras', 'Parroquia', 1514, 451);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Campo Lara', 'Parroquia', 1515, 451);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bartolomé de las Casas', 'Parroquia', 1516, 452);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Libertad', 'Parroquia', 1517, 452);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Río Negro', 'Parroquia', 1518, 452);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San José de Perijá', 'Parroquia', 1519, 452);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Rafael', 'Parroquia', 1520, 453);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Sierrita', 'Parroquia', 1521, 453);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Las Parcelas', 'Parroquia', 1522, 453);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Luis de Vicente', 'Parroquia', 1523, 453);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Monseñor Marcos Sergio Godoy', 'Parroquia', 1524, 453);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ricaurte', 'Parroquia', 1525, 453);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Tamare', 'Parroquia', 1526, 453);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Antonio Borjas Romero', 'Parroquia', 1527, 454);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bolívar', 'Parroquia', 1528, 454);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cacique Mara', 'Parroquia', 1529, 454);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Carracciolo Parra Pérez', 'Parroquia', 1530, 454);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cecilio Acosta', 'Parroquia', 1531, 454);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Cristo de Aranza', 'Parroquia', 1532, 454);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Coquivacoa', 'Parroquia', 1533, 454);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Chiquinquirá', 'Parroquia', 1534, 454);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Francisco Eugenio Bustamante', 'Parroquia', 1535, 454);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Idelfonzo Vásquez', 'Parroquia', 1536, 454);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Juana de Ávila', 'Parroquia', 1537, 454);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Luis Hurtado Higuera', 'Parroquia', 1538, 454);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Manuel Dagnino', 'Parroquia', 1539, 454);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Olegario Villalobos', 'Parroquia', 1540, 454);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Raúl Leoni', 'Parroquia', 1541, 454);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Lucía', 'Parroquia', 1542, 454);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Venancio Pulgar', 'Parroquia', 1543, 454);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Isidro', 'Parroquia', 1544, 454);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Altagracia', 'Parroquia', 1545, 455);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Faría', 'Parroquia', 1546, 455);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Ana María Campos', 'Parroquia', 1547, 455);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Antonio', 'Parroquia', 1548, 455);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San José', 'Parroquia', 1549, 455);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Donaldo García', 'Parroquia', 1550, 456);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Rosario', 'Parroquia', 1551, 456);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sixto Zambrano', 'Parroquia', 1552, 456);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Francisco', 'Parroquia', 1553, 457);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Bajo', 'Parroquia', 1554, 457);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Domitila Flores', 'Parroquia', 1555, 457);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Francisco Ochoa', 'Parroquia', 1556, 457);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Los Cortijos', 'Parroquia', 1557, 457);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Marcial Hernández', 'Parroquia', 1558, 457);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Rita', 'Parroquia', 1559, 458);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Mene', 'Parroquia', 1560, 458);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Pedro Lucas Urribarrí', 'Parroquia', 1561, 458);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('José Cenobio Urribarrí', 'Parroquia', 1562, 458);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Rafael Maria Baralt', 'Parroquia', 1563, 459);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Manuel Manrique', 'Parroquia', 1564, 459);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Rafael Urdaneta', 'Parroquia', 1565, 459);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Bobures', 'Parroquia', 1566, 460);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Gibraltar', 'Parroquia', 1567, 460);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Heras', 'Parroquia', 1568, 460);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Monseñor Arturo Álvarez', 'Parroquia', 1569, 460);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Rómulo Gallegos', 'Parroquia', 1570, 460);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Batey', 'Parroquia', 1571, 460);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Rafael Urdaneta', 'Parroquia', 1572, 461);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Victoria', 'Parroquia', 1573, 461);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Raúl Cuenca', 'Parroquia', 1574, 461);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sinamaica', 'Parroquia', 1575, 447);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Alta Guajira', 'Parroquia', 1576, 447);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Elías Sánchez Rubio', 'Parroquia', 1577, 447);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Guajira', 'Parroquia', 1578, 447);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Altagracia', 'Parroquia', 1579, 462);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Antímano', 'Parroquia', 1580, 462);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Caricuao', 'Parroquia', 1581, 462);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Catedral', 'Parroquia', 1582, 462);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Coche', 'Parroquia', 1583, 462);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Junquito', 'Parroquia', 1584, 462);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Paraíso', 'Parroquia', 1585, 462);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Recreo', 'Parroquia', 1586, 462);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('El Valle', 'Parroquia', 1587, 462);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Candelaria', 'Parroquia', 1588, 462);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Pastora', 'Parroquia', 1589, 462);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('La Vega', 'Parroquia', 1590, 462);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Macarao', 'Parroquia', 1591, 462);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Agustín', 'Parroquia', 1592, 462);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Bernardino', 'Parroquia', 1593, 462);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San José', 'Parroquia', 1594, 462);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Juan', 'Parroquia', 1595, 462);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('San Pedro', 'Parroquia', 1596, 462);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Rosalía', 'Parroquia', 1597, 462);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Santa Teresa', 'Parroquia', 1598, 462);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('Sucre (Catia)', 'Parroquia', 1599, 462);
INSERT INTO public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") VALUES ('23 de enero', 'Parroquia', 1600, 462);


--
-- TOC entry 3372 (class 0 OID 25843)
-- Dependencies: 222
-- Data for Name: Marca; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3374 (class 0 OID 25848)
-- Dependencies: 224
-- Data for Name: Modelo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3376 (class 0 OID 25853)
-- Dependencies: 226
-- Data for Name: Ofi-Paq; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3378 (class 0 OID 25858)
-- Dependencies: 228
-- Data for Name: Ofi-Rut; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3380 (class 0 OID 25863)
-- Dependencies: 230
-- Data for Name: Ofi-Ser; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3382 (class 0 OID 25868)
-- Dependencies: 232
-- Data for Name: Oficina; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3384 (class 0 OID 25873)
-- Dependencies: 234
-- Data for Name: Pago; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3385 (class 0 OID 25876)
-- Dependencies: 235
-- Data for Name: Paquete; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3386 (class 0 OID 25879)
-- Dependencies: 236
-- Data for Name: Persona-Contacto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3387 (class 0 OID 25882)
-- Dependencies: 237
-- Data for Name: Priv-Rol; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3389 (class 0 OID 25887)
-- Dependencies: 239
-- Data for Name: Privilegio; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3391 (class 0 OID 25893)
-- Dependencies: 241
-- Data for Name: Puerto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3393 (class 0 OID 25898)
-- Dependencies: 243
-- Data for Name: Rol; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3395 (class 0 OID 25903)
-- Dependencies: 245
-- Data for Name: Ruta; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3397 (class 0 OID 25908)
-- Dependencies: 247
-- Data for Name: Servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3399 (class 0 OID 25913)
-- Dependencies: 249
-- Data for Name: Tall-Per.C; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3401 (class 0 OID 25918)
-- Dependencies: 251
-- Data for Name: Taller; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3403 (class 0 OID 25923)
-- Dependencies: 253
-- Data for Name: Telefono; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3404 (class 0 OID 25927)
-- Dependencies: 254
-- Data for Name: Tipo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3406 (class 0 OID 25932)
-- Dependencies: 256
-- Data for Name: Tipo_Pago_Cheque; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3408 (class 0 OID 25937)
-- Dependencies: 258
-- Data for Name: Tipo_Pago_Credit_Card; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3410 (class 0 OID 25942)
-- Dependencies: 260
-- Data for Name: Tipo_Pago_Efectivo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3412 (class 0 OID 25947)
-- Dependencies: 262
-- Data for Name: Usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3414 (class 0 OID 25952)
-- Dependencies: 264
-- Data for Name: Vea-Aero; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3416 (class 0 OID 25957)
-- Dependencies: 266
-- Data for Name: Veh-Tall; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3418 (class 0 OID 25962)
-- Dependencies: 268
-- Data for Name: Vehiculo_Aereo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3419 (class 0 OID 25965)
-- Dependencies: 269
-- Data for Name: Vehiculo_Maritimo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3420 (class 0 OID 25968)
-- Dependencies: 270
-- Data for Name: Vehiculo_Terrestre; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3421 (class 0 OID 25971)
-- Dependencies: 271
-- Data for Name: Vma-Pue; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3423 (class 0 OID 25976)
-- Dependencies: 273
-- Data for Name: Zona; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 197
-- Name: Aeropuerto_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Aeropuerto_Codigo_seq"', 1, false);


--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 199
-- Name: Auditoria_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Auditoria_Codigo_seq"', 1, false);


--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 202
-- Name: Contabilidad_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Contabilidad_Codigo_seq"', 1, false);


--
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 204
-- Name: Emp-Hor_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Emp-Hor_Codigo_seq"', 1, false);


--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 206
-- Name: Emp-Zon_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Emp-Zon_Codigo_seq"', 1, false);


--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 209
-- Name: Env-Est_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Env-Est_Codigo_seq"', 1, false);


--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 211
-- Name: Env-Rut_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Env-Rut_Codigo_seq"', 1, false);


--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 213
-- Name: Envio_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Envio_Codigo_seq"', 1, false);


--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 215
-- Name: Estatus_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Estatus_Codigo_seq"', 1, false);


--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 217
-- Name: Falla_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Falla_Codigo_seq"', 1, false);


--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 219
-- Name: Horario_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Horario_Codigo_seq"', 1, false);


--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 221
-- Name: Lugar_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Lugar_Codigo_seq"', 1, false);


--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 223
-- Name: Marca_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Marca_Codigo_seq"', 1, false);


--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 225
-- Name: Modelo_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Modelo_Codigo_seq"', 1, false);


--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 227
-- Name: Ofi-Paq_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Ofi-Paq_Codigo_seq"', 1, false);


--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 229
-- Name: Ofi-Rut_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Ofi-Rut_Codigo_seq"', 1, false);


--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 231
-- Name: Ofi-Ser_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Ofi-Ser_Codigo_seq"', 1, false);


--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 233
-- Name: Oficina_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Oficina_Codigo_seq"', 1, false);


--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 238
-- Name: Priv-Rol_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Priv-Rol_Codigo_seq"', 1, false);


--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 240
-- Name: Privilegio_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Privilegio_Codigo_seq"', 1, false);


--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 242
-- Name: Puerto_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Puerto_Codigo_seq"', 1, false);


--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 244
-- Name: Rol_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Rol_Codigo_seq"', 1, false);


--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 246
-- Name: Ruta_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Ruta_Codigo_seq"', 1, false);


--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 248
-- Name: Servicio_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Servicio_Codigo_seq"', 1, false);


--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 250
-- Name: Tall-Per.C_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tall-Per.C_Codigo_seq"', 1, false);


--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 252
-- Name: Taller_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Taller_Codigo_seq"', 1, false);


--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 255
-- Name: Tipo_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tipo_Codigo_seq"', 1, false);


--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 257
-- Name: Tipo_Pago_Cheque_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tipo_Pago_Cheque_Codigo_seq"', 1, false);


--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 259
-- Name: Tipo_Pago_Credit_Card_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tipo_Pago_Credit_Card_Codigo_seq"', 1, false);


--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 261
-- Name: Tipo_Pago_Efectivo_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tipo_Pago_Efectivo_Codigo_seq"', 1, false);


--
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 263
-- Name: Usuario_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Usuario_Codigo_seq"', 1, false);


--
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 265
-- Name: Vea-Aero_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Vea-Aero_Codigo_seq"', 1, false);


--
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 267
-- Name: Veh-Tall_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Veh-Tall_Codigo_seq"', 1, false);


--
-- TOC entry 3498 (class 0 OID 0)
-- Dependencies: 272
-- Name: Vma-Pue_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Vma-Pue_Codigo_seq"', 1, false);


--
-- TOC entry 3499 (class 0 OID 0)
-- Dependencies: 274
-- Name: Zona_Codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Zona_Codigo_seq"', 1, false);


--
-- TOC entry 2966 (class 2606 OID 26017)
-- Name: Aeropuerto Aeropuerto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Aeropuerto"
    ADD CONSTRAINT "Aeropuerto_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 2970 (class 2606 OID 26019)
-- Name: Auditoria Auditoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Auditoria"
    ADD CONSTRAINT "Auditoria_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 2973 (class 2606 OID 26021)
-- Name: Cliente Cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cliente"
    ADD CONSTRAINT "Cliente_pkey" PRIMARY KEY ("Cedula");


--
-- TOC entry 2977 (class 2606 OID 26023)
-- Name: Contabilidad Contabilidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contabilidad"
    ADD CONSTRAINT "Contabilidad_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 2982 (class 2606 OID 26025)
-- Name: Emp-Hor Emp-Hor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Emp-Hor"
    ADD CONSTRAINT "Emp-Hor_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 2986 (class 2606 OID 26027)
-- Name: Emp-Zon Emp-Zon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Emp-Zon"
    ADD CONSTRAINT "Emp-Zon_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 2990 (class 2606 OID 26029)
-- Name: Empleado Empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Empleado"
    ADD CONSTRAINT "Empleado_pkey" PRIMARY KEY ("Cedula");


--
-- TOC entry 2995 (class 2606 OID 26031)
-- Name: Env-Est Env-Est_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Env-Est"
    ADD CONSTRAINT "Env-Est_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 2999 (class 2606 OID 26033)
-- Name: Env-Rut Env-Rut_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Env-Rut"
    ADD CONSTRAINT "Env-Rut_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3003 (class 2606 OID 26035)
-- Name: Envio Envio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Envio"
    ADD CONSTRAINT "Envio_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3008 (class 2606 OID 26037)
-- Name: Estatus Estatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Estatus"
    ADD CONSTRAINT "Estatus_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3011 (class 2606 OID 26039)
-- Name: Falla Falla_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Falla"
    ADD CONSTRAINT "Falla_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3016 (class 2606 OID 26041)
-- Name: Horario Horario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Horario"
    ADD CONSTRAINT "Horario_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3019 (class 2606 OID 26043)
-- Name: Lugar Lugar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lugar"
    ADD CONSTRAINT "Lugar_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3022 (class 2606 OID 26045)
-- Name: Marca Marca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Marca"
    ADD CONSTRAINT "Marca_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3024 (class 2606 OID 26047)
-- Name: Modelo Modelo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Modelo"
    ADD CONSTRAINT "Modelo_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3027 (class 2606 OID 26049)
-- Name: Ofi-Paq Ofi-Paq_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ofi-Paq"
    ADD CONSTRAINT "Ofi-Paq_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3031 (class 2606 OID 26051)
-- Name: Ofi-Rut Ofi-Rut_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ofi-Rut"
    ADD CONSTRAINT "Ofi-Rut_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3038 (class 2606 OID 26053)
-- Name: Ofi-Ser Ofi-Ser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ofi-Ser"
    ADD CONSTRAINT "Ofi-Ser_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3043 (class 2606 OID 26055)
-- Name: Oficina Oficina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Oficina"
    ADD CONSTRAINT "Oficina_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3046 (class 2606 OID 26057)
-- Name: Pago Pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago"
    ADD CONSTRAINT "Pago_pkey" PRIMARY KEY ("Numero_unico");


--
-- TOC entry 3052 (class 2606 OID 26059)
-- Name: Paquete Paquete_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT "Paquete_pkey" PRIMARY KEY ("Numero_guia");


--
-- TOC entry 3056 (class 2606 OID 26061)
-- Name: Persona-Contacto Persona-Contacto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Persona-Contacto"
    ADD CONSTRAINT "Persona-Contacto_pkey" PRIMARY KEY ("CI");


--
-- TOC entry 3058 (class 2606 OID 26063)
-- Name: Priv-Rol Priv-Rol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Priv-Rol"
    ADD CONSTRAINT "Priv-Rol_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3062 (class 2606 OID 26065)
-- Name: Privilegio Privilegio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Privilegio"
    ADD CONSTRAINT "Privilegio_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3064 (class 2606 OID 26067)
-- Name: Puerto Puerto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Puerto"
    ADD CONSTRAINT "Puerto_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3068 (class 2606 OID 26069)
-- Name: Rol Rol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol"
    ADD CONSTRAINT "Rol_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3072 (class 2606 OID 26071)
-- Name: Ruta Ruta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ruta"
    ADD CONSTRAINT "Ruta_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3076 (class 2606 OID 26073)
-- Name: Servicio Servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Servicio"
    ADD CONSTRAINT "Servicio_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3078 (class 2606 OID 26075)
-- Name: Tall-Per.C Tall-Per.C_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tall-Per.C"
    ADD CONSTRAINT "Tall-Per.C_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3082 (class 2606 OID 26077)
-- Name: Taller Taller_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Taller"
    ADD CONSTRAINT "Taller_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3085 (class 2606 OID 26079)
-- Name: Telefono Telefono_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Telefono"
    ADD CONSTRAINT "Telefono_pkey" PRIMARY KEY ("Numero");


--
-- TOC entry 3094 (class 2606 OID 26081)
-- Name: Tipo_Pago_Cheque Tipo_Pago_Cheque_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tipo_Pago_Cheque"
    ADD CONSTRAINT "Tipo_Pago_Cheque_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3098 (class 2606 OID 26083)
-- Name: Tipo_Pago_Credit_Card Tipo_Pago_Credit_Card_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tipo_Pago_Credit_Card"
    ADD CONSTRAINT "Tipo_Pago_Credit_Card_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3102 (class 2606 OID 26085)
-- Name: Tipo_Pago_Efectivo Tipo_Pago_Efectivo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tipo_Pago_Efectivo"
    ADD CONSTRAINT "Tipo_Pago_Efectivo_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3091 (class 2606 OID 26087)
-- Name: Tipo Tipo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tipo"
    ADD CONSTRAINT "Tipo_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 2975 (class 2606 OID 26089)
-- Name: Cliente UK_Correo1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cliente"
    ADD CONSTRAINT "UK_Correo1" UNIQUE ("Correo_Personal");


--
-- TOC entry 3104 (class 2606 OID 26091)
-- Name: Usuario UK_Correo3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "UK_Correo3" UNIQUE ("Correo");


--
-- TOC entry 3130 (class 2606 OID 26093)
-- Name: Vehiculo_Maritimo UK_Nombre; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vehiculo_Maritimo"
    ADD CONSTRAINT "UK_Nombre" UNIQUE ("Nombre");


--
-- TOC entry 3106 (class 2606 OID 26095)
-- Name: Usuario UK_Nombre2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "UK_Nombre2" UNIQUE ("Nombre");


--
-- TOC entry 3096 (class 2606 OID 26097)
-- Name: Tipo_Pago_Cheque UK_NumCheque; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tipo_Pago_Cheque"
    ADD CONSTRAINT "UK_NumCheque" UNIQUE ("Numero_Cheque");


--
-- TOC entry 3100 (class 2606 OID 26099)
-- Name: Tipo_Pago_Credit_Card UK_NumTarjeta; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tipo_Pago_Credit_Card"
    ADD CONSTRAINT "UK_NumTarjeta" UNIQUE ("Numero_Tarjeta");


--
-- TOC entry 3005 (class 2606 OID 26101)
-- Name: Envio UK_Realiza; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Envio"
    ADD CONSTRAINT "UK_Realiza" UNIQUE ("FK_Realiza");


--
-- TOC entry 3138 (class 2606 OID 26103)
-- Name: Vehiculo_Terrestre UK_SerialCarroceria1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vehiculo_Terrestre"
    ADD CONSTRAINT "UK_SerialCarroceria1" UNIQUE ("Serial_Carroceria");


--
-- TOC entry 3140 (class 2606 OID 26105)
-- Name: Vehiculo_Terrestre UK_SerialMotor1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vehiculo_Terrestre"
    ADD CONSTRAINT "UK_SerialMotor1" UNIQUE ("Serial_Motor");


--
-- TOC entry 3132 (class 2606 OID 26107)
-- Name: Vehiculo_Maritimo UK_SerialMotor2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vehiculo_Maritimo"
    ADD CONSTRAINT "UK_SerialMotor2" UNIQUE ("Serial_Motor");


--
-- TOC entry 3124 (class 2606 OID 26109)
-- Name: Vehiculo_Aereo UK_SerialMotor3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vehiculo_Aereo"
    ADD CONSTRAINT "UK_SerialMotor3" UNIQUE ("Serial_Motor");


--
-- TOC entry 2979 (class 2606 OID 26111)
-- Name: Contabilidad UK_calcula; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contabilidad"
    ADD CONSTRAINT "UK_calcula" UNIQUE ("FK_Calcula");


--
-- TOC entry 2992 (class 2606 OID 26113)
-- Name: Empleado UK_correo2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Empleado"
    ADD CONSTRAINT "UK_correo2" UNIQUE ("Correo_Personal");


--
-- TOC entry 3116 (class 2606 OID 26115)
-- Name: Veh-Tall UK_refleja; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Veh-Tall"
    ADD CONSTRAINT "UK_refleja" UNIQUE ("FK_Refleja");


--
-- TOC entry 3108 (class 2606 OID 26117)
-- Name: Usuario UK_selecondece; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "UK_selecondece" UNIQUE ("FK_Sele_Concede");


--
-- TOC entry 3110 (class 2606 OID 26119)
-- Name: Usuario Usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3112 (class 2606 OID 26121)
-- Name: Vea-Aero Vea-Aero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vea-Aero"
    ADD CONSTRAINT "Vea-Aero_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3118 (class 2606 OID 26123)
-- Name: Veh-Tall Veh-Tall_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Veh-Tall"
    ADD CONSTRAINT "Veh-Tall_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3126 (class 2606 OID 26125)
-- Name: Vehiculo_Aereo Vehiculo_Aereo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vehiculo_Aereo"
    ADD CONSTRAINT "Vehiculo_Aereo_pkey" PRIMARY KEY ("Placa");


--
-- TOC entry 3134 (class 2606 OID 26127)
-- Name: Vehiculo_Maritimo Vehiculo_Maritimo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vehiculo_Maritimo"
    ADD CONSTRAINT "Vehiculo_Maritimo_pkey" PRIMARY KEY ("Placa");


--
-- TOC entry 3142 (class 2606 OID 26129)
-- Name: Vehiculo_Terrestre Vehiculo_Terrestre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vehiculo_Terrestre"
    ADD CONSTRAINT "Vehiculo_Terrestre_pkey" PRIMARY KEY ("Placa");


--
-- TOC entry 3146 (class 2606 OID 26131)
-- Name: Vma-Pue Vma-Pue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vma-Pue"
    ADD CONSTRAINT "Vma-Pue_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3150 (class 2606 OID 26133)
-- Name: Zona Zona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Zona"
    ADD CONSTRAINT "Zona_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 3086 (class 1259 OID 26134)
-- Name: fki_Dispositivo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Dispositivo" ON public."Telefono" USING btree ("FK_Dispositivo");


--
-- TOC entry 3059 (class 1259 OID 26135)
-- Name: fki_accede_sis; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_accede_sis ON public."Priv-Rol" USING btree ("FK_Accede_Sis");


--
-- TOC entry 3000 (class 1259 OID 26136)
-- Name: fki_adquiere_pa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_adquiere_pa ON public."Env-Rut" USING btree ("FK_Adquiere_Pa");


--
-- TOC entry 3028 (class 1259 OID 26137)
-- Name: fki_almacena; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_almacena ON public."Ofi-Paq" USING btree ("FK_Almacena");


--
-- TOC entry 3069 (class 1259 OID 26138)
-- Name: fki_asignado_puesto; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_asignado_puesto ON public."Rol" USING btree ("FK_Asignado_Puesto");


--
-- TOC entry 3070 (class 1259 OID 26139)
-- Name: fki_asignado_tipo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_asignado_tipo ON public."Rol" USING btree ("FK_Asignado_tipo");


--
-- TOC entry 2987 (class 1259 OID 26140)
-- Name: fki_asignar; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_asignar ON public."Emp-Zon" USING btree ("FK_Asignar");


--
-- TOC entry 2988 (class 1259 OID 26141)
-- Name: fki_asiste; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_asiste ON public."Emp-Zon" USING btree ("FK_Asiste");


--
-- TOC entry 2983 (class 1259 OID 26142)
-- Name: fki_asistencia; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_asistencia ON public."Emp-Hor" USING btree ("FK_Asistencia");


--
-- TOC entry 3147 (class 1259 OID 26143)
-- Name: fki_atraca; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_atraca ON public."Vma-Pue" USING btree ("FK_Atraca");


--
-- TOC entry 3017 (class 1259 OID 26144)
-- Name: fki_cada_uno; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_cada_uno ON public."Horario" USING btree ("FK_cada-uno");


--
-- TOC entry 2980 (class 1259 OID 26145)
-- Name: fki_calcula; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_calcula ON public."Contabilidad" USING btree ("FK_Calcula");


--
-- TOC entry 3032 (class 1259 OID 26146)
-- Name: fki_camino; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_camino ON public."Ofi-Rut" USING btree ("FK_Camino");


--
-- TOC entry 3033 (class 1259 OID 26147)
-- Name: fki_camino2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_camino2 ON public."Ofi-Rut" USING btree ("FK_Camino2");


--
-- TOC entry 3034 (class 1259 OID 26148)
-- Name: fki_camino3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_camino3 ON public."Ofi-Rut" USING btree ("FK_Camino3");


--
-- TOC entry 3073 (class 1259 OID 26149)
-- Name: fki_camino_ruta; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_camino_ruta ON public."Ruta" USING btree ("FK_Camino");


--
-- TOC entry 3047 (class 1259 OID 26150)
-- Name: fki_cancela1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_cancela1 ON public."Pago" USING btree ("FK_Cancela1");


--
-- TOC entry 3048 (class 1259 OID 26151)
-- Name: fki_cancela2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_cancela2 ON public."Pago" USING btree ("FK_Cancela2");


--
-- TOC entry 3049 (class 1259 OID 26152)
-- Name: fki_cancela3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_cancela3 ON public."Pago" USING btree ("FK_Cancela3");


--
-- TOC entry 3119 (class 1259 OID 26153)
-- Name: fki_chequear; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_chequear ON public."Veh-Tall" USING btree ("FK_Chequear");


--
-- TOC entry 3087 (class 1259 OID 26154)
-- Name: fki_comunicado; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_comunicado ON public."Telefono" USING btree ("FK_Comunicado");


--
-- TOC entry 3079 (class 1259 OID 26155)
-- Name: fki_conoce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_conoce ON public."Tall-Per.C" USING btree ("FK_Conoce");


--
-- TOC entry 3025 (class 1259 OID 26156)
-- Name: fki_contiene; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_contiene ON public."Modelo" USING btree ("FK_Contiene");


--
-- TOC entry 3050 (class 1259 OID 26157)
-- Name: fki_costo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_costo ON public."Pago" USING btree ("FK_Costo");


--
-- TOC entry 3127 (class 1259 OID 26158)
-- Name: fki_cuentacon1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_cuentacon1 ON public."Vehiculo_Aereo" USING btree ("FK_Cuentacon");


--
-- TOC entry 3135 (class 1259 OID 26159)
-- Name: fki_cuentacon2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_cuentacon2 ON public."Vehiculo_Maritimo" USING btree ("FK_Cuentacon");


--
-- TOC entry 3143 (class 1259 OID 26160)
-- Name: fki_cuentacon3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_cuentacon3 ON public."Vehiculo_Terrestre" USING btree ("FK_Cuentacon");


--
-- TOC entry 3148 (class 1259 OID 26161)
-- Name: fki_desembarca; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_desembarca ON public."Vma-Pue" USING btree ("FK_Desembarca");


--
-- TOC entry 3006 (class 1259 OID 26162)
-- Name: fki_destino; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_destino ON public."Envio" USING btree ("FK_Destino");


--
-- TOC entry 2967 (class 1259 OID 26163)
-- Name: fki_dispone_con; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_dispone_con ON public."Aeropuerto" USING btree ("FK_Dispone_con");


--
-- TOC entry 3151 (class 1259 OID 26164)
-- Name: fki_divide; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_divide ON public."Zona" USING btree ("FK_Divide");


--
-- TOC entry 2996 (class 1259 OID 26165)
-- Name: fki_encuentra_sta; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_encuentra_sta ON public."Env-Est" USING btree ("FK_Encuentra_Sta");


--
-- TOC entry 3053 (class 1259 OID 26166)
-- Name: fki_entrega; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_entrega ON public."Paquete" USING btree ("FK_Entrega");


--
-- TOC entry 3120 (class 1259 OID 26167)
-- Name: fki_envia2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_envia2 ON public."Veh-Tall" USING btree ("FK_Enviar2");


--
-- TOC entry 3121 (class 1259 OID 26168)
-- Name: fki_envia3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_envia3 ON public."Veh-Tall" USING btree ("FK_Enviar3");


--
-- TOC entry 3122 (class 1259 OID 26169)
-- Name: fki_enviar; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_enviar ON public."Veh-Tall" USING btree ("FK_Enviar");


--
-- TOC entry 3092 (class 1259 OID 26170)
-- Name: fki_es_de; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_es_de ON public."Tipo" USING btree ("FK_Es_de");


--
-- TOC entry 3113 (class 1259 OID 26171)
-- Name: fki_estaciona; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_estaciona ON public."Vea-Aero" USING btree ("FK_Estaciona");


--
-- TOC entry 3039 (class 1259 OID 26172)
-- Name: fki_gasta; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_gasta ON public."Ofi-Ser" USING btree ("FK_Gasta");


--
-- TOC entry 3114 (class 1259 OID 26173)
-- Name: fki_guarda; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_guarda ON public."Vea-Aero" USING btree ("FK_Guarda");


--
-- TOC entry 2993 (class 1259 OID 26174)
-- Name: fki_habitacion; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_habitacion ON public."Empleado" USING btree ("FK_Habitacion");


--
-- TOC entry 3029 (class 1259 OID 26175)
-- Name: fki_llega; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_llega ON public."Ofi-Paq" USING btree ("FK_Llega");


--
-- TOC entry 3083 (class 1259 OID 26176)
-- Name: fki_locacion; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_locacion ON public."Taller" USING btree ("FK_Locacion");


--
-- TOC entry 3020 (class 1259 OID 26177)
-- Name: fki_lugar; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_lugar ON public."Lugar" USING btree ("FK_Lugar");


--
-- TOC entry 2971 (class 1259 OID 26178)
-- Name: fki_observa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_observa ON public."Auditoria" USING btree ("FK_Observa");


--
-- TOC entry 3035 (class 1259 OID 26179)
-- Name: fki_ofi_destino; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_ofi_destino ON public."Ofi-Rut" USING btree ("FK_Ofi_Destino");


--
-- TOC entry 3036 (class 1259 OID 26180)
-- Name: fki_ofi_origen; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_ofi_origen ON public."Ofi-Rut" USING btree ("FK_Ofi_Origen");


--
-- TOC entry 3040 (class 1259 OID 26181)
-- Name: fki_ofrece; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_ofrece ON public."Ofi-Ser" USING btree ("FK_Ofrece");


--
-- TOC entry 3060 (class 1259 OID 26182)
-- Name: fki_opcion; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_opcion ON public."Priv-Rol" USING btree ("FK_Opcion");


--
-- TOC entry 3012 (class 1259 OID 26183)
-- Name: fki_origina; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_origina ON public."Falla" USING btree ("FK_Origina");


--
-- TOC entry 3013 (class 1259 OID 26184)
-- Name: fki_origina2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_origina2 ON public."Falla" USING btree ("FK_Origina2");


--
-- TOC entry 3014 (class 1259 OID 26185)
-- Name: fki_origina3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_origina3 ON public."Falla" USING btree ("FK_Origina3");


--
-- TOC entry 3041 (class 1259 OID 26186)
-- Name: fki_pago; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_pago ON public."Ofi-Ser" USING btree ("FK_Pago");


--
-- TOC entry 3088 (class 1259 OID 26187)
-- Name: fki_posee; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_posee ON public."Telefono" USING btree ("FK_Posee");


--
-- TOC entry 2984 (class 1259 OID 26188)
-- Name: fki_recibe_emp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_recibe_emp ON public."Emp-Hor" USING btree ("FK_Recibe_Emp");


--
-- TOC entry 3001 (class 1259 OID 26189)
-- Name: fki_recorre; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_recorre ON public."Env-Rut" USING btree ("FK_Recorre");


--
-- TOC entry 3080 (class 1259 OID 26190)
-- Name: fki_referente; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_referente ON public."Tall-Per.C" USING btree ("FK_Referente");


--
-- TOC entry 3128 (class 1259 OID 26191)
-- Name: fki_representa1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_representa1 ON public."Vehiculo_Aereo" USING btree ("FK_Representa");


--
-- TOC entry 3136 (class 1259 OID 26192)
-- Name: fki_representa2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_representa2 ON public."Vehiculo_Maritimo" USING btree ("FK_Representa");


--
-- TOC entry 3144 (class 1259 OID 26193)
-- Name: fki_representa3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_representa3 ON public."Vehiculo_Terrestre" USING btree ("FK_Representa");


--
-- TOC entry 2997 (class 1259 OID 26194)
-- Name: fki_revisa_sta; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_revisa_sta ON public."Env-Est" USING btree ("FK_Revisa_Sta");


--
-- TOC entry 3009 (class 1259 OID 26195)
-- Name: fki_revision; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_revision ON public."Estatus" USING btree ("FK_Revision");


--
-- TOC entry 3074 (class 1259 OID 26196)
-- Name: fki_ruta; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_ruta ON public."Ruta" USING btree ("FK_Ruta");


--
-- TOC entry 3065 (class 1259 OID 26197)
-- Name: fki_sede; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_sede ON public."Puerto" USING btree ("FK_Sede");


--
-- TOC entry 2968 (class 1259 OID 26198)
-- Name: fki_sitio; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_sitio ON public."Aeropuerto" USING btree ("FK_Sitio");


--
-- TOC entry 3089 (class 1259 OID 26199)
-- Name: fki_telefonia; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_telefonia ON public."Telefono" USING btree ("FK_Telefonia");


--
-- TOC entry 3066 (class 1259 OID 26200)
-- Name: fki_tiene_con; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_tiene_con ON public."Puerto" USING btree ("FK_Tiene_con");


--
-- TOC entry 3054 (class 1259 OID 26201)
-- Name: fki_transporta; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_transporta ON public."Paquete" USING btree ("FK_Transporta");


--
-- TOC entry 3044 (class 1259 OID 26202)
-- Name: fki_varios; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_varios ON public."Oficina" USING btree ("FK_Varios");


--
-- TOC entry 3203 (class 2606 OID 26203)
-- Name: Telefono Dispositivo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Telefono"
    ADD CONSTRAINT "Dispositivo" FOREIGN KEY ("FK_Dispositivo") REFERENCES public."Taller"("Codigo");


--
-- TOC entry 3191 (class 2606 OID 26208)
-- Name: Priv-Rol accede_sis; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Priv-Rol"
    ADD CONSTRAINT accede_sis FOREIGN KEY ("FK_Accede_Sis") REFERENCES public."Rol"("Codigo");


--
-- TOC entry 3163 (class 2606 OID 26213)
-- Name: Env-Rut adquiere_pa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Env-Rut"
    ADD CONSTRAINT adquiere_pa FOREIGN KEY ("FK_Adquiere_Pa") REFERENCES public."Ruta"("Codigo");


--
-- TOC entry 3174 (class 2606 OID 26218)
-- Name: Ofi-Paq almacena; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ofi-Paq"
    ADD CONSTRAINT almacena FOREIGN KEY ("FK_Almacena") REFERENCES public."Oficina"("Codigo");


--
-- TOC entry 3195 (class 2606 OID 26223)
-- Name: Rol asignado_puesto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol"
    ADD CONSTRAINT asignado_puesto FOREIGN KEY ("FK_Asignado_Puesto") REFERENCES public."Empleado"("Cedula");


--
-- TOC entry 3196 (class 2606 OID 26228)
-- Name: Rol asignado_tipo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol"
    ADD CONSTRAINT asignado_tipo FOREIGN KEY ("FK_Asignado_tipo") REFERENCES public."Cliente"("Cedula");


--
-- TOC entry 3158 (class 2606 OID 26233)
-- Name: Emp-Zon asignar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Emp-Zon"
    ADD CONSTRAINT asignar FOREIGN KEY ("FK_Asignar") REFERENCES public."Empleado"("Cedula");


--
-- TOC entry 3159 (class 2606 OID 26238)
-- Name: Emp-Zon asiste; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Emp-Zon"
    ADD CONSTRAINT asiste FOREIGN KEY ("FK_Asiste") REFERENCES public."Zona"("Codigo");


--
-- TOC entry 3156 (class 2606 OID 26243)
-- Name: Emp-Hor asistencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Emp-Hor"
    ADD CONSTRAINT asistencia FOREIGN KEY ("FK_Asistencia") REFERENCES public."Empleado"("Cedula");


--
-- TOC entry 3222 (class 2606 OID 26248)
-- Name: Vma-Pue atraca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vma-Pue"
    ADD CONSTRAINT atraca FOREIGN KEY ("FK_Atraca") REFERENCES public."Vehiculo_Maritimo"("Placa");


--
-- TOC entry 3171 (class 2606 OID 26253)
-- Name: Horario cada_uno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Horario"
    ADD CONSTRAINT cada_uno FOREIGN KEY ("FK_cada-uno") REFERENCES public."Empleado"("Cedula");


--
-- TOC entry 3155 (class 2606 OID 26258)
-- Name: Contabilidad calcula; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contabilidad"
    ADD CONSTRAINT calcula FOREIGN KEY ("FK_Calcula") REFERENCES public."Envio"("Codigo");


--
-- TOC entry 3176 (class 2606 OID 26263)
-- Name: Ofi-Rut camino; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ofi-Rut"
    ADD CONSTRAINT camino FOREIGN KEY ("FK_Camino") REFERENCES public."Vehiculo_Aereo"("Placa");


--
-- TOC entry 3197 (class 2606 OID 26268)
-- Name: Ruta camino; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ruta"
    ADD CONSTRAINT camino FOREIGN KEY ("FK_Camino") REFERENCES public."Lugar"("Codigo");


--
-- TOC entry 3177 (class 2606 OID 26273)
-- Name: Ofi-Rut camino2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ofi-Rut"
    ADD CONSTRAINT camino2 FOREIGN KEY ("FK_Camino2") REFERENCES public."Vehiculo_Maritimo"("Placa");


--
-- TOC entry 3178 (class 2606 OID 26278)
-- Name: Ofi-Rut camino3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ofi-Rut"
    ADD CONSTRAINT camino3 FOREIGN KEY ("FK_Camino3") REFERENCES public."Vehiculo_Terrestre"("Placa");


--
-- TOC entry 3198 (class 2606 OID 26283)
-- Name: Ruta camino_ruta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ruta"
    ADD CONSTRAINT camino_ruta FOREIGN KEY ("FK_Camino") REFERENCES public."Lugar"("Codigo");


--
-- TOC entry 3185 (class 2606 OID 26288)
-- Name: Pago cancela1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago"
    ADD CONSTRAINT cancela1 FOREIGN KEY ("FK_Cancela1") REFERENCES public."Tipo_Pago_Efectivo"("Codigo");


--
-- TOC entry 3186 (class 2606 OID 26293)
-- Name: Pago cancela2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago"
    ADD CONSTRAINT cancela2 FOREIGN KEY ("FK_Cancela2") REFERENCES public."Tipo_Pago_Credit_Card"("Codigo");


--
-- TOC entry 3187 (class 2606 OID 26298)
-- Name: Pago cancela3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago"
    ADD CONSTRAINT cancela3 FOREIGN KEY ("FK_Cancela3") REFERENCES public."Tipo_Pago_Cheque"("Codigo");


--
-- TOC entry 3211 (class 2606 OID 26303)
-- Name: Veh-Tall chequear; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Veh-Tall"
    ADD CONSTRAINT chequear FOREIGN KEY ("FK_Chequear") REFERENCES public."Taller"("Codigo");


--
-- TOC entry 3204 (class 2606 OID 26308)
-- Name: Telefono comunicado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Telefono"
    ADD CONSTRAINT comunicado FOREIGN KEY ("FK_Comunicado") REFERENCES public."Persona-Contacto"("CI");


--
-- TOC entry 3200 (class 2606 OID 26313)
-- Name: Tall-Per.C conoce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tall-Per.C"
    ADD CONSTRAINT conoce FOREIGN KEY ("FK_Conoce") REFERENCES public."Taller"("Codigo");


--
-- TOC entry 3173 (class 2606 OID 26318)
-- Name: Modelo contiene; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Modelo"
    ADD CONSTRAINT contiene FOREIGN KEY ("FK_Contiene") REFERENCES public."Marca"("Codigo");


--
-- TOC entry 3188 (class 2606 OID 26323)
-- Name: Pago costo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago"
    ADD CONSTRAINT costo FOREIGN KEY ("FK_Costo") REFERENCES public."Cliente"("Cedula");


--
-- TOC entry 3216 (class 2606 OID 26328)
-- Name: Vehiculo_Aereo cuentacon1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vehiculo_Aereo"
    ADD CONSTRAINT cuentacon1 FOREIGN KEY ("FK_Cuentacon") REFERENCES public."Oficina"("Codigo");


--
-- TOC entry 3218 (class 2606 OID 26333)
-- Name: Vehiculo_Maritimo cuentacon2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vehiculo_Maritimo"
    ADD CONSTRAINT cuentacon2 FOREIGN KEY ("FK_Cuentacon") REFERENCES public."Oficina"("Codigo");


--
-- TOC entry 3220 (class 2606 OID 26338)
-- Name: Vehiculo_Terrestre cuentacon3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vehiculo_Terrestre"
    ADD CONSTRAINT cuentacon3 FOREIGN KEY ("FK_Cuentacon") REFERENCES public."Oficina"("Codigo");


--
-- TOC entry 3223 (class 2606 OID 26343)
-- Name: Vma-Pue desembarca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vma-Pue"
    ADD CONSTRAINT desembarca FOREIGN KEY ("FK_Desembarca") REFERENCES public."Puerto"("Codigo");


--
-- TOC entry 3165 (class 2606 OID 26348)
-- Name: Envio destino; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Envio"
    ADD CONSTRAINT destino FOREIGN KEY ("FK_Destino") REFERENCES public."Lugar"("Codigo");


--
-- TOC entry 3152 (class 2606 OID 26353)
-- Name: Aeropuerto dispone_con; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Aeropuerto"
    ADD CONSTRAINT dispone_con FOREIGN KEY ("FK_Dispone_con") REFERENCES public."Oficina"("Codigo");


--
-- TOC entry 3224 (class 2606 OID 26358)
-- Name: Zona divide; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Zona"
    ADD CONSTRAINT divide FOREIGN KEY ("FK_Divide") REFERENCES public."Oficina"("Codigo");


--
-- TOC entry 3161 (class 2606 OID 26363)
-- Name: Env-Est encuentra_sta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Env-Est"
    ADD CONSTRAINT encuentra_sta FOREIGN KEY ("FK_Encuentra_Sta") REFERENCES public."Estatus"("Codigo");


--
-- TOC entry 3189 (class 2606 OID 26368)
-- Name: Paquete entrega; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT entrega FOREIGN KEY ("FK_Entrega") REFERENCES public."Cliente"("Cedula");


--
-- TOC entry 3212 (class 2606 OID 26373)
-- Name: Veh-Tall envia2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Veh-Tall"
    ADD CONSTRAINT envia2 FOREIGN KEY ("FK_Enviar2") REFERENCES public."Vehiculo_Maritimo"("Placa");


--
-- TOC entry 3213 (class 2606 OID 26378)
-- Name: Veh-Tall envia3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Veh-Tall"
    ADD CONSTRAINT envia3 FOREIGN KEY ("FK_Enviar3") REFERENCES public."Vehiculo_Terrestre"("Placa");


--
-- TOC entry 3214 (class 2606 OID 26383)
-- Name: Veh-Tall enviar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Veh-Tall"
    ADD CONSTRAINT enviar FOREIGN KEY ("FK_Enviar") REFERENCES public."Vehiculo_Aereo"("Placa");


--
-- TOC entry 3207 (class 2606 OID 26388)
-- Name: Tipo es_de; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tipo"
    ADD CONSTRAINT es_de FOREIGN KEY ("FK_Es_de") REFERENCES public."Paquete"("Numero_guia");


--
-- TOC entry 3209 (class 2606 OID 26393)
-- Name: Vea-Aero estaciona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vea-Aero"
    ADD CONSTRAINT estaciona FOREIGN KEY ("FK_Estaciona") REFERENCES public."Aeropuerto"("Codigo");


--
-- TOC entry 3181 (class 2606 OID 26398)
-- Name: Ofi-Ser gasta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ofi-Ser"
    ADD CONSTRAINT gasta FOREIGN KEY ("FK_Gasta") REFERENCES public."Oficina"("Codigo");


--
-- TOC entry 3210 (class 2606 OID 26403)
-- Name: Vea-Aero guarda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vea-Aero"
    ADD CONSTRAINT guarda FOREIGN KEY ("FK_Guarda") REFERENCES public."Vehiculo_Aereo"("Placa");


--
-- TOC entry 3160 (class 2606 OID 26408)
-- Name: Empleado habitacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Empleado"
    ADD CONSTRAINT habitacion FOREIGN KEY ("FK_Habitacion") REFERENCES public."Lugar"("Codigo");


--
-- TOC entry 3175 (class 2606 OID 26413)
-- Name: Ofi-Paq llega; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ofi-Paq"
    ADD CONSTRAINT llega FOREIGN KEY ("FK_Llega") REFERENCES public."Paquete"("Numero_guia");


--
-- TOC entry 3202 (class 2606 OID 26418)
-- Name: Taller locacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Taller"
    ADD CONSTRAINT locacion FOREIGN KEY ("FK_Locacion") REFERENCES public."Lugar"("Codigo");


--
-- TOC entry 3172 (class 2606 OID 26423)
-- Name: Lugar lugar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lugar"
    ADD CONSTRAINT lugar FOREIGN KEY ("FK_Lugar") REFERENCES public."Lugar"("Codigo");


--
-- TOC entry 3154 (class 2606 OID 26428)
-- Name: Auditoria observa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Auditoria"
    ADD CONSTRAINT observa FOREIGN KEY ("FK_Observa") REFERENCES public."Usuario"("Codigo");


--
-- TOC entry 3179 (class 2606 OID 26433)
-- Name: Ofi-Rut ofi_destino; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ofi-Rut"
    ADD CONSTRAINT ofi_destino FOREIGN KEY ("FK_Ofi_Destino") REFERENCES public."Oficina"("Codigo");


--
-- TOC entry 3180 (class 2606 OID 26438)
-- Name: Ofi-Rut ofi_origen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ofi-Rut"
    ADD CONSTRAINT ofi_origen FOREIGN KEY ("FK_Ofi_Origen") REFERENCES public."Ruta"("Codigo");


--
-- TOC entry 3182 (class 2606 OID 26443)
-- Name: Ofi-Ser ofrece; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ofi-Ser"
    ADD CONSTRAINT ofrece FOREIGN KEY ("FK_Ofrece") REFERENCES public."Servicio"("Codigo");


--
-- TOC entry 3192 (class 2606 OID 26448)
-- Name: Priv-Rol opcion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Priv-Rol"
    ADD CONSTRAINT opcion FOREIGN KEY ("FK_Opcion") REFERENCES public."Privilegio"("Codigo");


--
-- TOC entry 3168 (class 2606 OID 26453)
-- Name: Falla origina; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Falla"
    ADD CONSTRAINT origina FOREIGN KEY ("FK_Origina") REFERENCES public."Vehiculo_Aereo"("Placa");


--
-- TOC entry 3169 (class 2606 OID 26458)
-- Name: Falla origina2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Falla"
    ADD CONSTRAINT origina2 FOREIGN KEY ("FK_Origina2") REFERENCES public."Vehiculo_Maritimo"("Placa");


--
-- TOC entry 3170 (class 2606 OID 26463)
-- Name: Falla origina3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Falla"
    ADD CONSTRAINT origina3 FOREIGN KEY ("FK_Origina3") REFERENCES public."Vehiculo_Terrestre"("Placa");


--
-- TOC entry 3183 (class 2606 OID 26468)
-- Name: Ofi-Ser pago; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ofi-Ser"
    ADD CONSTRAINT pago FOREIGN KEY ("FK_Pago") REFERENCES public."Servicio"("Codigo");


--
-- TOC entry 3205 (class 2606 OID 26473)
-- Name: Telefono posee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Telefono"
    ADD CONSTRAINT posee FOREIGN KEY ("FK_Posee") REFERENCES public."Empleado"("Cedula");


--
-- TOC entry 3166 (class 2606 OID 26478)
-- Name: Envio realiza; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Envio"
    ADD CONSTRAINT realiza FOREIGN KEY ("FK_Realiza") REFERENCES public."Pago"("Numero_unico");


--
-- TOC entry 3157 (class 2606 OID 26483)
-- Name: Emp-Hor recibe_emp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Emp-Hor"
    ADD CONSTRAINT recibe_emp FOREIGN KEY ("FK_Recibe_Emp") REFERENCES public."Horario"("Codigo");


--
-- TOC entry 3164 (class 2606 OID 26488)
-- Name: Env-Rut recorre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Env-Rut"
    ADD CONSTRAINT recorre FOREIGN KEY ("FK_Recorre") REFERENCES public."Envio"("Codigo");


--
-- TOC entry 3201 (class 2606 OID 26493)
-- Name: Tall-Per.C referente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tall-Per.C"
    ADD CONSTRAINT referente FOREIGN KEY ("FK_Referente") REFERENCES public."Persona-Contacto"("CI");


--
-- TOC entry 3215 (class 2606 OID 26498)
-- Name: Veh-Tall refleja; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Veh-Tall"
    ADD CONSTRAINT refleja FOREIGN KEY ("FK_Refleja") REFERENCES public."Contabilidad"("Codigo");


--
-- TOC entry 3217 (class 2606 OID 26503)
-- Name: Vehiculo_Aereo representa1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vehiculo_Aereo"
    ADD CONSTRAINT representa1 FOREIGN KEY ("FK_Representa") REFERENCES public."Modelo"("Codigo");


--
-- TOC entry 3219 (class 2606 OID 26508)
-- Name: Vehiculo_Maritimo representa2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vehiculo_Maritimo"
    ADD CONSTRAINT representa2 FOREIGN KEY ("FK_Representa") REFERENCES public."Modelo"("Codigo");


--
-- TOC entry 3221 (class 2606 OID 26513)
-- Name: Vehiculo_Terrestre representa3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vehiculo_Terrestre"
    ADD CONSTRAINT representa3 FOREIGN KEY ("FK_Representa") REFERENCES public."Modelo"("Codigo");


--
-- TOC entry 3162 (class 2606 OID 26518)
-- Name: Env-Est revisa_sta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Env-Est"
    ADD CONSTRAINT revisa_sta FOREIGN KEY ("FK_Revisa_Sta") REFERENCES public."Envio"("Codigo");


--
-- TOC entry 3167 (class 2606 OID 26523)
-- Name: Estatus revision; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Estatus"
    ADD CONSTRAINT revision FOREIGN KEY ("FK_Revision") REFERENCES public."Empleado"("Cedula");


--
-- TOC entry 3199 (class 2606 OID 26528)
-- Name: Ruta ruta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ruta"
    ADD CONSTRAINT ruta FOREIGN KEY ("FK_Ruta") REFERENCES public."Ruta"("Codigo");


--
-- TOC entry 3193 (class 2606 OID 26533)
-- Name: Puerto sede; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Puerto"
    ADD CONSTRAINT sede FOREIGN KEY ("FK_Sede") REFERENCES public."Lugar"("Codigo");


--
-- TOC entry 3208 (class 2606 OID 26538)
-- Name: Usuario sele_concede; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT sele_concede FOREIGN KEY ("FK_Sele_Concede") REFERENCES public."Rol"("Codigo");


--
-- TOC entry 3153 (class 2606 OID 26543)
-- Name: Aeropuerto sitio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Aeropuerto"
    ADD CONSTRAINT sitio FOREIGN KEY ("FK_Sitio") REFERENCES public."Lugar"("Codigo");


--
-- TOC entry 3206 (class 2606 OID 26548)
-- Name: Telefono telefonia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Telefono"
    ADD CONSTRAINT telefonia FOREIGN KEY ("FK_Telefonia") REFERENCES public."Oficina"("Codigo");


--
-- TOC entry 3194 (class 2606 OID 26553)
-- Name: Puerto tiene_con; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Puerto"
    ADD CONSTRAINT tiene_con FOREIGN KEY ("FK_Tiene_con") REFERENCES public."Oficina"("Codigo");


--
-- TOC entry 3190 (class 2606 OID 26558)
-- Name: Paquete transporta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT transporta FOREIGN KEY ("FK_Transporta") REFERENCES public."Envio"("Codigo");


--
-- TOC entry 3184 (class 2606 OID 26563)
-- Name: Oficina varios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Oficina"
    ADD CONSTRAINT varios FOREIGN KEY ("FK_Varios") REFERENCES public."Lugar"("Codigo");


-- Completed on 2018-12-10 22:33:59

--
-- PostgreSQL database dump complete
--

