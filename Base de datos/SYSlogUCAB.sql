--
-- PostgreSQL database dump
--

-- Dumped from database version 11.0
-- Dumped by pg_dump version 11.0

-- Started on 2018-11-21 17:35:35

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
-- TOC entry 201 (class 1259 OID 24788)
-- Name: Aeropuerto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Aeropuerto" (
    "Cod" character(20) NOT NULL,
    "Cantidad_Terminales" real NOT NULL,
    "Pistas" integer NOT NULL,
    "Capacidad" integer NOT NULL,
    "Hangares" integer NOT NULL
);


ALTER TABLE public."Aeropuerto" OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 24933)
-- Name: Contabilidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Contabilidad" (
    "Codigo" character(20) NOT NULL,
    "Descripcion" character(50) NOT NULL,
    "Salario" real NOT NULL,
    "Dias_Trabajados" date NOT NULL
);


ALTER TABLE public."Contabilidad" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24893)
-- Name: Envio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Envio" (
    "Codigo" character(50) NOT NULL,
    "Monto" real NOT NULL
);


ALTER TABLE public."Envio" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24903)
-- Name: Estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Estado" (
    "COD" character(50) NOT NULL,
    "Descripcion" character(50) NOT NULL
);


ALTER TABLE public."Estado" OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 24813)
-- Name: Falla; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Falla" (
    "Cod" character(20) NOT NULL,
    "Descripcion" character(20) NOT NULL
);


ALTER TABLE public."Falla" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24864)
-- Name: Horario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Horario" (
    "Codigo" character(20) NOT NULL,
    "Fecha" date NOT NULL,
    "Hora" timestamp(6) with time zone NOT NULL,
    "Descripcion" character(50) NOT NULL
);


ALTER TABLE public."Horario" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 24798)
-- Name: Lugar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Lugar" (
    "Codigo" character(20) NOT NULL,
    "Nombre" character(20),
    "Tipo" character(50)
);


ALTER TABLE public."Lugar" OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 24778)
-- Name: Marca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Marca" (
    "Codigo" character(20) NOT NULL,
    "Descripcion" character(50) NOT NULL
);


ALTER TABLE public."Marca" OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 24783)
-- Name: Modelo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Modelo" (
    "Codigo" character(20) NOT NULL,
    "Descripcion" character(50) NOT NULL
);


ALTER TABLE public."Modelo" OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 24828)
-- Name: Oficina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Oficina" (
    "Codigo" character(20) NOT NULL,
    "Nombre" character(20) NOT NULL,
    "Tamaño_deposito" real NOT NULL,
    "Cantidad_vehiculos" integer NOT NULL,
    "Cantidad_empleados" integer NOT NULL,
    "Empleado_cargo" character(20) NOT NULL
);


ALTER TABLE public."Oficina" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24908)
-- Name: Pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Pago" (
    "Numero_unico" character(20) NOT NULL,
    "Monto_total" real NOT NULL,
    "Fecha" date NOT NULL,
    "Tipo" character(20) NOT NULL,
    "Codigo_TIPO_PAGO" character(20) NOT NULL
);


ALTER TABLE public."Pago" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24898)
-- Name: Paquete; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Paquete" (
    "Numero_guia" character(50) NOT NULL,
    "Oficina_origen" character(50) NOT NULL,
    "Oficicina_destino" character(50) NOT NULL,
    "Destinatario" character(50) NOT NULL,
    "Peso" real NOT NULL,
    "Clasificacion" character(50) NOT NULL,
    "Tipo" character(50) NOT NULL,
    "Telefono_Contacto" character(20) NOT NULL
);


ALTER TABLE public."Paquete" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 24818)
-- Name: Persona_Contacto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Persona_Contacto" (
    "CI" integer NOT NULL,
    "Nombre" character(20) NOT NULL
);


ALTER TABLE public."Persona_Contacto" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24874)
-- Name: Privilegio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Privilegio" (
    "Codigo" character(20) NOT NULL,
    "Tipo" boolean NOT NULL
);


ALTER TABLE public."Privilegio" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 24793)
-- Name: Puerto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Puerto" (
    "Cod" character(20) NOT NULL,
    "Cantidad_Puertos" integer NOT NULL,
    "Area_Techada" real NOT NULL,
    "Muelles" integer NOT NULL,
    "Longitud" real NOT NULL,
    "Ancho" real NOT NULL,
    "Calado" real NOT NULL,
    "Uso" character(20) NOT NULL
);


ALTER TABLE public."Puerto" OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 24857)
-- Name: Rol_Administrador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Rol_Administrador" (
    "Cedula" integer NOT NULL,
    "Nombre" character(20) NOT NULL,
    "Apellido" character(20) NOT NULL,
    "Correo_Personal" character(50) NOT NULL,
    "Fecha_nacimiento" date NOT NULL,
    "Estado_civil" character(15) NOT NULL,
    "Acceso_Cont" boolean NOT NULL
);


ALTER TABLE public."Rol_Administrador" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 24850)
-- Name: Rol_Cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Rol_Cliente" (
    "Cedula" integer NOT NULL,
    "Nombre" character(20) NOT NULL,
    "Apellido" character(20) NOT NULL,
    "Correo_Personal" character(50) NOT NULL,
    "Fecha_nacimiento" date NOT NULL,
    "Estado_civil" character(15) NOT NULL,
    "Empresa" character(50),
    "L_VIP" boolean,
    "Frecuente" boolean
);


ALTER TABLE public."Rol_Cliente" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 24843)
-- Name: Rol_Empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Rol_Empleado" (
    "Cedula" integer NOT NULL,
    "Nombre" character(20) NOT NULL,
    "Apellido" character(20) NOT NULL,
    "Correo_Personal" character(50) NOT NULL,
    "Fecha_nacimiento" date NOT NULL,
    "Estado_civil" character(15) NOT NULL,
    "Nivel_academico" character(50) NOT NULL,
    "Profesion" character(20) NOT NULL,
    "Num_Hijos" integer
);


ALTER TABLE public."Rol_Empleado" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24888)
-- Name: Ruta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ruta" (
    "Codigo_Ruta" character(50) NOT NULL,
    "Descripcion" character(50) NOT NULL
);


ALTER TABLE public."Ruta" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 24838)
-- Name: Servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Servicio" (
    "Codigo" character(20) NOT NULL,
    "Descripcion" character(50) NOT NULL
);


ALTER TABLE public."Servicio" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 24808)
-- Name: Taller; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Taller" (
    "Cod" character(20) NOT NULL,
    "Flota_Revision" character(20),
    "Fecha_Entrada" date,
    "Fecha_salida_prevista" date,
    "Fecha_salida_real" date,
    "Proxima_fecha" date
);


ALTER TABLE public."Taller" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 24823)
-- Name: Telefono; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Telefono" (
    "Numero" integer NOT NULL,
    "Tipo" integer NOT NULL
);


ALTER TABLE public."Telefono" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24926)
-- Name: Tipo_Pago_Cheque; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tipo_Pago_Cheque" (
    "Codigo" character(20) NOT NULL,
    "Monto" real NOT NULL,
    "Numero_Cheque" integer NOT NULL,
    "Institucion_financiera" character(20) NOT NULL
);


ALTER TABLE public."Tipo_Pago_Cheque" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 24921)
-- Name: Tipo_pago_Credit_Card; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tipo_pago_Credit_Card" (
    "Codigo" character(20) NOT NULL,
    "Monto" real NOT NULL,
    "Tipo_tarjeta" character(20) NOT NULL,
    "Banco" character(20) NOT NULL,
    "Numero_Tarjeta" integer NOT NULL
);


ALTER TABLE public."Tipo_pago_Credit_Card" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24916)
-- Name: Tipo_pago_efectivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tipo_pago_efectivo" (
    "Codigo" character(20) NOT NULL,
    "Monto" real NOT NULL,
    "Total_Billetes" real NOT NULL
);


ALTER TABLE public."Tipo_pago_efectivo" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24879)
-- Name: Usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Usuario" (
    "Clave" character(50) NOT NULL,
    "Nombre" character(50) NOT NULL,
    "Correo" character(50) NOT NULL,
    "Contraseña" character(50) NOT NULL
);


ALTER TABLE public."Usuario" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24869)
-- Name: Vacacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Vacacion" (
    "Cod" character(20) NOT NULL,
    "Descripcion" character(50) NOT NULL
);


ALTER TABLE public."Vacacion" OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 24771)
-- Name: Vehiculo_Aereo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Vehiculo_Aereo" (
    "Placa" character(15) NOT NULL,
    "Clasificacion" character(9) NOT NULL,
    "Peso" real,
    "Capacidad" real NOT NULL,
    "Serial_Motor" character(20) NOT NULL,
    "Altura" real NOT NULL,
    "Velocidad_Maxima" integer,
    "Capacidad_Combustible" real NOT NULL,
    "Envergadura" real NOT NULL,
    "Ancho_Cabina" real NOT NULL,
    "Diametro_Fusilaje" real NOT NULL,
    "Peso_Vacio" real NOT NULL,
    "Peso_Max_Despegue" real NOT NULL,
    "Carrera_Despegue" real NOT NULL,
    "Motores" character(20) NOT NULL
);


ALTER TABLE public."Vehiculo_Aereo" OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 24762)
-- Name: Vehiculo_Maritimo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Vehiculo_Maritimo" (
    "Placa" character(15) NOT NULL,
    "Clasificacion" character(9) NOT NULL,
    "Peso" real,
    "Capacidad" real NOT NULL,
    "Serial_Motor" character(20) NOT NULL,
    "Altura" real NOT NULL,
    "Velocidad_Maxima" integer,
    "Capacidad_Combustible" real NOT NULL,
    "Nombre" character(20) NOT NULL
);


ALTER TABLE public."Vehiculo_Maritimo" OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 24752)
-- Name: Vehículo_Terrestre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Vehículo_Terrestre" (
    "Placa" character(15) NOT NULL,
    "Clasificacion" character(9) NOT NULL,
    "Peso" real,
    "Capacidad" real NOT NULL,
    "Serial_Motor" character(20) NOT NULL,
    "Altura" real NOT NULL,
    "Velocidad_Maxima" integer,
    "Capacidad_Combustible" real NOT NULL,
    "Serial_Carroceria" character(20) NOT NULL
);


ALTER TABLE public."Vehículo_Terrestre" OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 24833)
-- Name: Zona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Zona" (
    "Codigo" character(20) NOT NULL,
    "Nombre" character(20) NOT NULL,
    "Descripcion" character(50) NOT NULL,
    "Division_area" integer NOT NULL
);


ALTER TABLE public."Zona" OWNER TO postgres;

--
-- TOC entry 3016 (class 0 OID 24788)
-- Dependencies: 201
-- Data for Name: Aeropuerto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Aeropuerto" ("Cod", "Cantidad_Terminales", "Pistas", "Capacidad", "Hangares") FROM stdin;
\.


--
-- TOC entry 3041 (class 0 OID 24933)
-- Dependencies: 226
-- Data for Name: Contabilidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Contabilidad" ("Codigo", "Descripcion", "Salario", "Dias_Trabajados") FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 24893)
-- Dependencies: 219
-- Data for Name: Envio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Envio" ("Codigo", "Monto") FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 24903)
-- Dependencies: 221
-- Data for Name: Estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Estado" ("COD", "Descripcion") FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 24813)
-- Dependencies: 205
-- Data for Name: Falla; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Falla" ("Cod", "Descripcion") FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 24864)
-- Dependencies: 214
-- Data for Name: Horario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Horario" ("Codigo", "Fecha", "Hora", "Descripcion") FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 24798)
-- Dependencies: 203
-- Data for Name: Lugar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Lugar" ("Codigo", "Nombre", "Tipo") FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 24778)
-- Dependencies: 199
-- Data for Name: Marca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Marca" ("Codigo", "Descripcion") FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 24783)
-- Dependencies: 200
-- Data for Name: Modelo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Modelo" ("Codigo", "Descripcion") FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 24828)
-- Dependencies: 208
-- Data for Name: Oficina; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Oficina" ("Codigo", "Nombre", "Tamaño_deposito", "Cantidad_vehiculos", "Cantidad_empleados", "Empleado_cargo") FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 24908)
-- Dependencies: 222
-- Data for Name: Pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Pago" ("Numero_unico", "Monto_total", "Fecha", "Tipo", "Codigo_TIPO_PAGO") FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 24898)
-- Dependencies: 220
-- Data for Name: Paquete; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Paquete" ("Numero_guia", "Oficina_origen", "Oficicina_destino", "Destinatario", "Peso", "Clasificacion", "Tipo", "Telefono_Contacto") FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 24818)
-- Dependencies: 206
-- Data for Name: Persona_Contacto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Persona_Contacto" ("CI", "Nombre") FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 24874)
-- Dependencies: 216
-- Data for Name: Privilegio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Privilegio" ("Codigo", "Tipo") FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 24793)
-- Dependencies: 202
-- Data for Name: Puerto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Puerto" ("Cod", "Cantidad_Puertos", "Area_Techada", "Muelles", "Longitud", "Ancho", "Calado", "Uso") FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 24857)
-- Dependencies: 213
-- Data for Name: Rol_Administrador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Rol_Administrador" ("Cedula", "Nombre", "Apellido", "Correo_Personal", "Fecha_nacimiento", "Estado_civil", "Acceso_Cont") FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 24850)
-- Dependencies: 212
-- Data for Name: Rol_Cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Rol_Cliente" ("Cedula", "Nombre", "Apellido", "Correo_Personal", "Fecha_nacimiento", "Estado_civil", "Empresa", "L_VIP", "Frecuente") FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 24843)
-- Dependencies: 211
-- Data for Name: Rol_Empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Rol_Empleado" ("Cedula", "Nombre", "Apellido", "Correo_Personal", "Fecha_nacimiento", "Estado_civil", "Nivel_academico", "Profesion", "Num_Hijos") FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 24888)
-- Dependencies: 218
-- Data for Name: Ruta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Ruta" ("Codigo_Ruta", "Descripcion") FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 24838)
-- Dependencies: 210
-- Data for Name: Servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Servicio" ("Codigo", "Descripcion") FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 24808)
-- Dependencies: 204
-- Data for Name: Taller; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Taller" ("Cod", "Flota_Revision", "Fecha_Entrada", "Fecha_salida_prevista", "Fecha_salida_real", "Proxima_fecha") FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 24823)
-- Dependencies: 207
-- Data for Name: Telefono; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Telefono" ("Numero", "Tipo") FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 24926)
-- Dependencies: 225
-- Data for Name: Tipo_Pago_Cheque; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tipo_Pago_Cheque" ("Codigo", "Monto", "Numero_Cheque", "Institucion_financiera") FROM stdin;
\.


--
-- TOC entry 3039 (class 0 OID 24921)
-- Dependencies: 224
-- Data for Name: Tipo_pago_Credit_Card; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tipo_pago_Credit_Card" ("Codigo", "Monto", "Tipo_tarjeta", "Banco", "Numero_Tarjeta") FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 24916)
-- Dependencies: 223
-- Data for Name: Tipo_pago_efectivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tipo_pago_efectivo" ("Codigo", "Monto", "Total_Billetes") FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 24879)
-- Dependencies: 217
-- Data for Name: Usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Usuario" ("Clave", "Nombre", "Correo", "Contraseña") FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 24869)
-- Dependencies: 215
-- Data for Name: Vacacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Vacacion" ("Cod", "Descripcion") FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 24771)
-- Dependencies: 198
-- Data for Name: Vehiculo_Aereo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Vehiculo_Aereo" ("Placa", "Clasificacion", "Peso", "Capacidad", "Serial_Motor", "Altura", "Velocidad_Maxima", "Capacidad_Combustible", "Envergadura", "Ancho_Cabina", "Diametro_Fusilaje", "Peso_Vacio", "Peso_Max_Despegue", "Carrera_Despegue", "Motores") FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 24762)
-- Dependencies: 197
-- Data for Name: Vehiculo_Maritimo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Vehiculo_Maritimo" ("Placa", "Clasificacion", "Peso", "Capacidad", "Serial_Motor", "Altura", "Velocidad_Maxima", "Capacidad_Combustible", "Nombre") FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 24752)
-- Dependencies: 196
-- Data for Name: Vehículo_Terrestre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Vehículo_Terrestre" ("Placa", "Clasificacion", "Peso", "Capacidad", "Serial_Motor", "Altura", "Velocidad_Maxima", "Capacidad_Combustible", "Serial_Carroceria") FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 24833)
-- Dependencies: 209
-- Data for Name: Zona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Zona" ("Codigo", "Nombre", "Descripcion", "Division_area") FROM stdin;
\.


--
-- TOC entry 2824 (class 2606 OID 24792)
-- Name: Aeropuerto Aeropuerto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Aeropuerto"
    ADD CONSTRAINT "Aeropuerto_pkey" PRIMARY KEY ("Cod");


--
-- TOC entry 2888 (class 2606 OID 24937)
-- Name: Contabilidad Contabilidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contabilidad"
    ADD CONSTRAINT "Contabilidad_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 2870 (class 2606 OID 24897)
-- Name: Envio Envio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Envio"
    ADD CONSTRAINT "Envio_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 2874 (class 2606 OID 24907)
-- Name: Estado Estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Estado"
    ADD CONSTRAINT "Estado_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2832 (class 2606 OID 24817)
-- Name: Falla Falla_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Falla"
    ADD CONSTRAINT "Falla_pkey" PRIMARY KEY ("Cod");


--
-- TOC entry 2856 (class 2606 OID 24868)
-- Name: Horario Horario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Horario"
    ADD CONSTRAINT "Horario_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 2828 (class 2606 OID 24802)
-- Name: Lugar Lugar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lugar"
    ADD CONSTRAINT "Lugar_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 2820 (class 2606 OID 24782)
-- Name: Marca Marca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Marca"
    ADD CONSTRAINT "Marca_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 2822 (class 2606 OID 24787)
-- Name: Modelo Modelo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Modelo"
    ADD CONSTRAINT "Modelo_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 2838 (class 2606 OID 24832)
-- Name: Oficina Oficina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Oficina"
    ADD CONSTRAINT "Oficina_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 2876 (class 2606 OID 24912)
-- Name: Pago Pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago"
    ADD CONSTRAINT "Pago_pkey" PRIMARY KEY ("Numero_unico");


--
-- TOC entry 2872 (class 2606 OID 24902)
-- Name: Paquete Paquete_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT "Paquete_pkey" PRIMARY KEY ("Numero_guia");


--
-- TOC entry 2834 (class 2606 OID 24822)
-- Name: Persona_Contacto Persona_Contacto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Persona_Contacto"
    ADD CONSTRAINT "Persona_Contacto_pkey" PRIMARY KEY ("CI");


--
-- TOC entry 2860 (class 2606 OID 24878)
-- Name: Privilegio Privilegio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Privilegio"
    ADD CONSTRAINT "Privilegio_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 2826 (class 2606 OID 24797)
-- Name: Puerto Puerto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Puerto"
    ADD CONSTRAINT "Puerto_pkey" PRIMARY KEY ("Cod");


--
-- TOC entry 2852 (class 2606 OID 24861)
-- Name: Rol_Administrador Rol_Administrador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol_Administrador"
    ADD CONSTRAINT "Rol_Administrador_pkey" PRIMARY KEY ("Cedula");


--
-- TOC entry 2848 (class 2606 OID 24854)
-- Name: Rol_Cliente Rol_Cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol_Cliente"
    ADD CONSTRAINT "Rol_Cliente_pkey" PRIMARY KEY ("Cedula");


--
-- TOC entry 2844 (class 2606 OID 24847)
-- Name: Rol_Empleado Rol_Empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol_Empleado"
    ADD CONSTRAINT "Rol_Empleado_pkey" PRIMARY KEY ("Cedula");


--
-- TOC entry 2868 (class 2606 OID 24892)
-- Name: Ruta Ruta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ruta"
    ADD CONSTRAINT "Ruta_pkey" PRIMARY KEY ("Codigo_Ruta");


--
-- TOC entry 2842 (class 2606 OID 24842)
-- Name: Servicio Servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Servicio"
    ADD CONSTRAINT "Servicio_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 2830 (class 2606 OID 24812)
-- Name: Taller Taller_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Taller"
    ADD CONSTRAINT "Taller_pkey" PRIMARY KEY ("Cod");


--
-- TOC entry 2836 (class 2606 OID 24827)
-- Name: Telefono Telefono_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Telefono"
    ADD CONSTRAINT "Telefono_pkey" PRIMARY KEY ("Numero");


--
-- TOC entry 2884 (class 2606 OID 24930)
-- Name: Tipo_Pago_Cheque Tipo_Pago_Cheque_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tipo_Pago_Cheque"
    ADD CONSTRAINT "Tipo_Pago_Cheque_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 2882 (class 2606 OID 24925)
-- Name: Tipo_pago_Credit_Card Tipo_pago_Credit_Card_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tipo_pago_Credit_Card"
    ADD CONSTRAINT "Tipo_pago_Credit_Card_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 2880 (class 2606 OID 24920)
-- Name: Tipo_pago_efectivo Tipo_pago_efectivo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tipo_pago_efectivo"
    ADD CONSTRAINT "Tipo_pago_efectivo_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 2862 (class 2606 OID 24887)
-- Name: Usuario UK_Correo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "UK_Correo" UNIQUE ("Correo");


--
-- TOC entry 2846 (class 2606 OID 24849)
-- Name: Rol_Empleado UK_Correo_Personal; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol_Empleado"
    ADD CONSTRAINT "UK_Correo_Personal" UNIQUE ("Correo_Personal");


--
-- TOC entry 2850 (class 2606 OID 24856)
-- Name: Rol_Cliente UK_Correo_Personal2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol_Cliente"
    ADD CONSTRAINT "UK_Correo_Personal2" UNIQUE ("Correo_Personal");


--
-- TOC entry 2854 (class 2606 OID 24863)
-- Name: Rol_Administrador UK_Correo_Personal3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol_Administrador"
    ADD CONSTRAINT "UK_Correo_Personal3" UNIQUE ("Correo_Personal");


--
-- TOC entry 2886 (class 2606 OID 24932)
-- Name: Tipo_Pago_Cheque UK_MumCheque; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tipo_Pago_Cheque"
    ADD CONSTRAINT "UK_MumCheque" UNIQUE ("Numero_Cheque");


--
-- TOC entry 2810 (class 2606 OID 24770)
-- Name: Vehiculo_Maritimo UK_Nombre; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vehiculo_Maritimo"
    ADD CONSTRAINT "UK_Nombre" UNIQUE ("Nombre");


--
-- TOC entry 2864 (class 2606 OID 24885)
-- Name: Usuario UK_Nombre1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "UK_Nombre1" UNIQUE ("Nombre");


--
-- TOC entry 2812 (class 2606 OID 24768)
-- Name: Vehiculo_Maritimo UK_Serial_Motor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vehiculo_Maritimo"
    ADD CONSTRAINT "UK_Serial_Motor" UNIQUE ("Serial_Motor");


--
-- TOC entry 2816 (class 2606 OID 24777)
-- Name: Vehiculo_Aereo UK_Serial_MotorA; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vehiculo_Aereo"
    ADD CONSTRAINT "UK_Serial_MotorA" UNIQUE ("Serial_Motor");


--
-- TOC entry 2804 (class 2606 OID 24761)
-- Name: Vehículo_Terrestre UK_Serial_carroceria; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vehículo_Terrestre"
    ADD CONSTRAINT "UK_Serial_carroceria" UNIQUE ("Serial_Carroceria");


--
-- TOC entry 2806 (class 2606 OID 24759)
-- Name: Vehículo_Terrestre UK_Serial_motor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vehículo_Terrestre"
    ADD CONSTRAINT "UK_Serial_motor" UNIQUE ("Serial_Motor");


--
-- TOC entry 2878 (class 2606 OID 24914)
-- Name: Pago UK_TIPOPAGO; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago"
    ADD CONSTRAINT "UK_TIPOPAGO" UNIQUE ("Codigo_TIPO_PAGO");


--
-- TOC entry 2866 (class 2606 OID 24883)
-- Name: Usuario Usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("Clave");


--
-- TOC entry 2858 (class 2606 OID 24873)
-- Name: Vacacion Vacacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vacacion"
    ADD CONSTRAINT "Vacacion_pkey" PRIMARY KEY ("Cod");


--
-- TOC entry 2818 (class 2606 OID 24775)
-- Name: Vehiculo_Aereo Vehiculo_Aereo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vehiculo_Aereo"
    ADD CONSTRAINT "Vehiculo_Aereo_pkey" PRIMARY KEY ("Placa");


--
-- TOC entry 2814 (class 2606 OID 24766)
-- Name: Vehiculo_Maritimo Vehiculo_Maritimo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vehiculo_Maritimo"
    ADD CONSTRAINT "Vehiculo_Maritimo_pkey" PRIMARY KEY ("Placa");


--
-- TOC entry 2808 (class 2606 OID 24756)
-- Name: Vehículo_Terrestre Vehículo_Terrestre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vehículo_Terrestre"
    ADD CONSTRAINT "Vehículo_Terrestre_pkey" PRIMARY KEY ("Placa");


--
-- TOC entry 2840 (class 2606 OID 24837)
-- Name: Zona Zona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Zona"
    ADD CONSTRAINT "Zona_pkey" PRIMARY KEY ("Codigo");


--
-- TOC entry 2889 (class 2606 OID 24803)
-- Name: Lugar FK_Lugar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lugar"
    ADD CONSTRAINT "FK_Lugar" FOREIGN KEY ("Codigo") REFERENCES public."Lugar"("Codigo");


-- Completed on 2018-11-21 17:35:40

--
-- PostgreSQL database dump complete
--

