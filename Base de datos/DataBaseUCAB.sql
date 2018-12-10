PGDMP         #        
        v         
   SYSlogUCAB    11.0    11.0 �   c           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            d           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            e           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            f           1262    24938 
   SYSlogUCAB    DATABASE     �   CREATE DATABASE "SYSlogUCAB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
    DROP DATABASE "SYSlogUCAB";
             postgres    false            �            1259    25027 
   Aeropuerto    TABLE       CREATE TABLE public."Aeropuerto" (
    "Cantidad_Terminales" integer NOT NULL,
    "Pistas" integer NOT NULL,
    "Capacidad" integer NOT NULL,
    "Hangares" integer NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Sitio" integer NOT NULL,
    "FK_Dispone_con" integer NOT NULL
);
     DROP TABLE public."Aeropuerto";
       public         postgres    false            �            1259    26884    Aeropuerto_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Aeropuerto_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Aeropuerto_Codigo_seq";
       public       postgres    false    204            g           0    0    Aeropuerto_Codigo_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Aeropuerto_Codigo_seq" OWNED BY public."Aeropuerto"."Codigo";
            public       postgres    false    240            �            1259    25136 	   Auditoria    TABLE     �   CREATE TABLE public."Auditoria" (
    "Usuario" character varying(20) NOT NULL,
    "Fecha_Ingreso" date NOT NULL,
    "Accion" character varying(50) NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Observa" integer NOT NULL
);
    DROP TABLE public."Auditoria";
       public         postgres    false            �            1259    26892    Auditoria_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Auditoria_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Auditoria_Codigo_seq";
       public       postgres    false    220            h           0    0    Auditoria_Codigo_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Auditoria_Codigo_seq" OWNED BY public."Auditoria"."Codigo";
            public       postgres    false    241            �            1259    26857    Cliente    TABLE     M  CREATE TABLE public."Cliente" (
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
    DROP TABLE public."Cliente";
       public         postgres    false            �            1259    25037    Contabilidad    TABLE     �   CREATE TABLE public."Contabilidad" (
    "Descripcion" character varying(50) NOT NULL,
    "Salario" real NOT NULL,
    "Dias_Trabajados" date NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Calcula" integer NOT NULL
);
 "   DROP TABLE public."Contabilidad";
       public         postgres    false            �            1259    26901    Contabilidad_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Contabilidad_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."Contabilidad_Codigo_seq";
       public       postgres    false    206            i           0    0    Contabilidad_Codigo_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."Contabilidad_Codigo_seq" OWNED BY public."Contabilidad"."Codigo";
            public       postgres    false    242            �            1259    25565    Emp-Hor    TABLE     �   CREATE TABLE public."Emp-Hor" (
    "Fecha" date NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Asistencia" integer NOT NULL,
    "FK_Recibe_Emp" integer NOT NULL
);
    DROP TABLE public."Emp-Hor";
       public         postgres    false            �            1259    26909    Emp-Hor_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Emp-Hor_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Emp-Hor_Codigo_seq";
       public       postgres    false    235            j           0    0    Emp-Hor_Codigo_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Emp-Hor_Codigo_seq" OWNED BY public."Emp-Hor"."Codigo";
            public       postgres    false    243            �            1259    25463    Emp-Zon    TABLE     �   CREATE TABLE public."Emp-Zon" (
    "Codigo" integer NOT NULL,
    "FK_Asiste" integer NOT NULL,
    "FK_Asignar" integer NOT NULL
);
    DROP TABLE public."Emp-Zon";
       public         postgres    false            �            1259    26917    Emp-Zon_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Emp-Zon_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Emp-Zon_Codigo_seq";
       public       postgres    false    232            k           0    0    Emp-Zon_Codigo_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Emp-Zon_Codigo_seq" OWNED BY public."Emp-Zon"."Codigo";
            public       postgres    false    244            �            1259    26866    Empleado    TABLE     e  CREATE TABLE public."Empleado" (
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
    DROP TABLE public."Empleado";
       public         postgres    false            �            1259    25495    Env-Est    TABLE     �   CREATE TABLE public."Env-Est" (
    "FK_Revisa_Sta" integer NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Encuentra_Sta" integer NOT NULL
);
    DROP TABLE public."Env-Est";
       public         postgres    false                       1259    27521    Env-Est_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Env-Est_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Env-Est_Codigo_seq";
       public       postgres    false    233            l           0    0    Env-Est_Codigo_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Env-Est_Codigo_seq" OWNED BY public."Env-Est"."Codigo";
            public       postgres    false    273            �            1259    25380    Env-Rut    TABLE     �   CREATE TABLE public."Env-Rut" (
    "Codigo" integer NOT NULL,
    "FK_Adquiere_Pa" integer NOT NULL,
    "FK_Recorre" integer NOT NULL
);
    DROP TABLE public."Env-Rut";
       public         postgres    false            �            1259    26931    Env-Rut_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Env-Rut_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Env-Rut_Codigo_seq";
       public       postgres    false    229            m           0    0    Env-Rut_Codigo_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Env-Rut_Codigo_seq" OWNED BY public."Env-Rut"."Codigo";
            public       postgres    false    245            �            1259    25097    Envio    TABLE     �   CREATE TABLE public."Envio" (
    "Monto" real NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Destino" integer NOT NULL,
    "FK_Realiza" integer NOT NULL
);
    DROP TABLE public."Envio";
       public         postgres    false            �            1259    26939    Envio_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Envio_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Envio_Codigo_seq";
       public       postgres    false    213            n           0    0    Envio_Codigo_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Envio_Codigo_seq" OWNED BY public."Envio"."Codigo";
            public       postgres    false    246            �            1259    25102    Estatus    TABLE     �   CREATE TABLE public."Estatus" (
    "Descripcion" character varying(50) NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Revision" integer NOT NULL
);
    DROP TABLE public."Estatus";
       public         postgres    false            �            1259    26947    Estatus_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Estatus_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Estatus_Codigo_seq";
       public       postgres    false    214            o           0    0    Estatus_Codigo_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Estatus_Codigo_seq" OWNED BY public."Estatus"."Codigo";
            public       postgres    false    247            �            1259    25007    Falla    TABLE       CREATE TABLE public."Falla" (
    "Descripcion" character varying(50) NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Origina" character varying(15) NOT NULL,
    "FK_Origina2" character varying(15) NOT NULL,
    "FK_Origina3" character varying(15) NOT NULL
);
    DROP TABLE public."Falla";
       public         postgres    false            �            1259    26955    Falla_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Falla_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Falla_Codigo_seq";
       public       postgres    false    201            p           0    0    Falla_Codigo_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Falla_Codigo_seq" OWNED BY public."Falla"."Codigo";
            public       postgres    false    248            �            1259    25117    Horario    TABLE       CREATE TABLE public."Horario" (
    "Dia" date NOT NULL,
    "Hora_Inicio" time(6) with time zone NOT NULL,
    "Hora_Fin" time(6) with time zone NOT NULL,
    "Descripcion" character varying(50) NOT NULL,
    "FK_cada-uno" integer NOT NULL,
    "Codigo" integer NOT NULL
);
    DROP TABLE public."Horario";
       public         postgres    false                       1259    27604    Horario_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Horario_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Horario_Codigo_seq";
       public       postgres    false    217            q           0    0    Horario_Codigo_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Horario_Codigo_seq" OWNED BY public."Horario"."Codigo";
            public       postgres    false    274            �            1259    25053    Lugar    TABLE     �   CREATE TABLE public."Lugar" (
    "Nombre" character varying(20) NOT NULL,
    "Tipo" character varying(50) NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Lugar" integer
);
    DROP TABLE public."Lugar";
       public         postgres    false            �            1259    26969    Lugar_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Lugar_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Lugar_Codigo_seq";
       public       postgres    false    209            r           0    0    Lugar_Codigo_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Lugar_Codigo_seq" OWNED BY public."Lugar"."Codigo";
            public       postgres    false    249            �            1259    25002    Marca    TABLE     q   CREATE TABLE public."Marca" (
    "Descripcion" character varying(50) NOT NULL,
    "Codigo" integer NOT NULL
);
    DROP TABLE public."Marca";
       public         postgres    false            �            1259    26977    Marca_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Marca_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Marca_Codigo_seq";
       public       postgres    false    200            s           0    0    Marca_Codigo_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Marca_Codigo_seq" OWNED BY public."Marca"."Codigo";
            public       postgres    false    250            �            1259    24997    Modelo    TABLE     �   CREATE TABLE public."Modelo" (
    "Descripcion" character varying(50) NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Contiene" integer NOT NULL
);
    DROP TABLE public."Modelo";
       public         postgres    false            �            1259    26985    Modelo_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Modelo_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Modelo_Codigo_seq";
       public       postgres    false    199            t           0    0    Modelo_Codigo_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Modelo_Codigo_seq" OWNED BY public."Modelo"."Codigo";
            public       postgres    false    251            �            1259    25415    Ofi-Paq    TABLE     �   CREATE TABLE public."Ofi-Paq" (
    "Codigo" integer NOT NULL,
    "FK_Almacena" integer NOT NULL,
    "FK_Llega" integer NOT NULL
);
    DROP TABLE public."Ofi-Paq";
       public         postgres    false            �            1259    26993    Ofi-Paq_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Ofi-Paq_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Ofi-Paq_Codigo_seq";
       public       postgres    false    231            u           0    0    Ofi-Paq_Codigo_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Ofi-Paq_Codigo_seq" OWNED BY public."Ofi-Paq"."Codigo";
            public       postgres    false    252            �            1259    25280    Ofi-Rut    TABLE     ;  CREATE TABLE public."Ofi-Rut" (
    "Costo" real NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Camino" character varying(15) NOT NULL,
    "FK_Camino2" character varying(15) NOT NULL,
    "FK_Camino3" character varying(15) NOT NULL,
    "FK_Ofi_Origen" integer NOT NULL,
    "FK_Ofi_Destino" integer NOT NULL
);
    DROP TABLE public."Ofi-Rut";
       public         postgres    false            �            1259    27002    Ofi-Rut_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Ofi-Rut_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Ofi-Rut_Codigo_seq";
       public       postgres    false    227            v           0    0    Ofi-Rut_Codigo_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Ofi-Rut_Codigo_seq" OWNED BY public."Ofi-Rut"."Codigo";
            public       postgres    false    253            �            1259    25395    Ofi-Ser    TABLE     �   CREATE TABLE public."Ofi-Ser" (
    "Codigo" integer NOT NULL,
    "FK_Gasta" integer NOT NULL,
    "FK_Pago" integer NOT NULL,
    "FK_Ofrece" integer NOT NULL
);
    DROP TABLE public."Ofi-Ser";
       public         postgres    false            �            1259    27010    Ofi-Ser_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Ofi-Ser_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Ofi-Ser_Codigo_seq";
       public       postgres    false    230            w           0    0    Ofi-Ser_Codigo_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Ofi-Ser_Codigo_seq" OWNED BY public."Ofi-Ser"."Codigo";
            public       postgres    false    254            �            1259    25048    Oficina    TABLE     �   CREATE TABLE public."Oficina" (
    "Nombre" character varying(20) NOT NULL,
    "Tamaño_Deposito" real NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Varios" integer NOT NULL
);
    DROP TABLE public."Oficina";
       public         postgres    false            �            1259    27018    Oficina_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Oficina_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Oficina_Codigo_seq";
       public       postgres    false    208            x           0    0    Oficina_Codigo_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Oficina_Codigo_seq" OWNED BY public."Oficina"."Codigo";
            public       postgres    false    255            �            1259    25122    Pago    TABLE     8  CREATE TABLE public."Pago" (
    "Monto_Total" real NOT NULL,
    "Fecha" date NOT NULL,
    "Tipo" character varying(20) NOT NULL,
    "Numero_unico" integer NOT NULL,
    "FK_Costo" integer NOT NULL,
    "FK_Cancela1" integer NOT NULL,
    "FK_Cancela2" integer NOT NULL,
    "FK_Cancela3" integer NOT NULL
);
    DROP TABLE public."Pago";
       public         postgres    false            �            1259    25087    Paquete    TABLE     o  CREATE TABLE public."Paquete" (
    "Destinatario" character varying(50) NOT NULL,
    "Peso" real NOT NULL,
    "Clasificacion" character varying(50) NOT NULL,
    "Telefono_Contacto" character varying(20) NOT NULL,
    "Dimension_Paquete" real NOT NULL,
    "Numero_guia" integer NOT NULL,
    "FK_Transporta" integer NOT NULL,
    "FK_Entrega" integer NOT NULL
);
    DROP TABLE public."Paquete";
       public         postgres    false            �            1259    26874    Persona-Contacto    TABLE     s   CREATE TABLE public."Persona-Contacto" (
    "CI" integer NOT NULL,
    "Nombre" character varying(20) NOT NULL
);
 &   DROP TABLE public."Persona-Contacto";
       public         postgres    false            �            1259    25550    Priv-Rol    TABLE     �   CREATE TABLE public."Priv-Rol" (
    "Codigo" integer NOT NULL,
    "FK_Opcion" integer NOT NULL,
    "FK_Accede_Sis" integer NOT NULL
);
    DROP TABLE public."Priv-Rol";
       public         postgres    false                        1259    27030    Priv-Rol_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Priv-Rol_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Priv-Rol_Codigo_seq";
       public       postgres    false    234            y           0    0    Priv-Rol_Codigo_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Priv-Rol_Codigo_seq" OWNED BY public."Priv-Rol"."Codigo";
            public       postgres    false    256            �            1259    25112 
   Privilegio    TABLE     �   CREATE TABLE public."Privilegio" (
    tipo character varying(2) NOT NULL,
    "Codigo" integer NOT NULL,
    CONSTRAINT "Check_tipo" CHECK ((((tipo)::text = 'si'::text) OR false))
);
     DROP TABLE public."Privilegio";
       public         postgres    false                       1259    27038    Privilegio_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Privilegio_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Privilegio_Codigo_seq";
       public       postgres    false    216            z           0    0    Privilegio_Codigo_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Privilegio_Codigo_seq" OWNED BY public."Privilegio"."Codigo";
            public       postgres    false    257            �            1259    25022    Puerto    TABLE     o  CREATE TABLE public."Puerto" (
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
    DROP TABLE public."Puerto";
       public         postgres    false                       1259    27046    Puerto_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Puerto_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Puerto_Codigo_seq";
       public       postgres    false    203            {           0    0    Puerto_Codigo_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Puerto_Codigo_seq" OWNED BY public."Puerto"."Codigo";
            public       postgres    false    258            �            1259    25092    Rol    TABLE     �   CREATE TABLE public."Rol" (
    "Tipo" character varying(50) NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Asignado_tipo" integer NOT NULL,
    "FK_Asignado_Puesto" integer NOT NULL
);
    DROP TABLE public."Rol";
       public         postgres    false                       1259    27054    Rol_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Rol_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Rol_Codigo_seq";
       public       postgres    false    212            |           0    0    Rol_Codigo_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Rol_Codigo_seq" OWNED BY public."Rol"."Codigo";
            public       postgres    false    259            �            1259    25032    Ruta    TABLE     �   CREATE TABLE public."Ruta" (
    "Descripcion" character varying(50) NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Ruta" integer,
    "FK_Camino" integer NOT NULL
);
    DROP TABLE public."Ruta";
       public         postgres    false                       1259    27062    Ruta_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Ruta_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Ruta_Codigo_seq";
       public       postgres    false    205            }           0    0    Ruta_Codigo_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Ruta_Codigo_seq" OWNED BY public."Ruta"."Codigo";
            public       postgres    false    260            �            1259    25043    Servicio    TABLE     t   CREATE TABLE public."Servicio" (
    "Descripcion" character varying(50) NOT NULL,
    "Codigo" integer NOT NULL
);
    DROP TABLE public."Servicio";
       public         postgres    false                       1259    27070    Servicio_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Servicio_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Servicio_Codigo_seq";
       public       postgres    false    207            ~           0    0    Servicio_Codigo_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Servicio_Codigo_seq" OWNED BY public."Servicio"."Codigo";
            public       postgres    false    261            �            1259    25310 
   Tall-Per.C    TABLE     �   CREATE TABLE public."Tall-Per.C" (
    "Codigo" integer NOT NULL,
    "FK_Conoce" integer NOT NULL,
    "FK_Referente" integer NOT NULL
);
     DROP TABLE public."Tall-Per.C";
       public         postgres    false                       1259    27078    Tall-Per.C_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Tall-Per.C_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Tall-Per.C_Codigo_seq";
       public       postgres    false    228                       0    0    Tall-Per.C_Codigo_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Tall-Per.C_Codigo_seq" OWNED BY public."Tall-Per.C"."Codigo";
            public       postgres    false    262            �            1259    25017    Taller    TABLE       CREATE TABLE public."Taller" (
    "Flota_Revision" character varying(20),
    "Fecha_Entrada" date,
    "Fecha_Salida_Prevista" date,
    "Fecha_Salida_Real" date,
    "Proxima_Fecha" date,
    "Codigo" integer NOT NULL,
    "FK_Locacion" integer NOT NULL
);
    DROP TABLE public."Taller";
       public         postgres    false                       1259    27086    Taller_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Taller_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Taller_Codigo_seq";
       public       postgres    false    202            �           0    0    Taller_Codigo_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Taller_Codigo_seq" OWNED BY public."Taller"."Codigo";
            public       postgres    false    263            �            1259    26879    Telefono    TABLE     J  CREATE TABLE public."Telefono" (
    "Numero" integer NOT NULL,
    tipo character varying(20) NOT NULL,
    "FK_Dispositivo" integer,
    "FK_Comunicado" integer,
    "FK_Telefonia" integer,
    "FK_Posee" integer,
    CONSTRAINT "Check_tipotelf" CHECK (((tipo)::text = (('local'::text || 'oficina'::text) || 'movil'::text)))
);
    DROP TABLE public."Telefono";
       public         postgres    false            �            1259    25107    Tipo    TABLE     �   CREATE TABLE public."Tipo" (
    "Nombre" character varying(20) NOT NULL,
    "Descripcion" character varying(50) NOT NULL,
    "Costo" real NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Es_de" integer NOT NULL
);
    DROP TABLE public."Tipo";
       public         postgres    false                       1259    27096    Tipo_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Tipo_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Tipo_Codigo_seq";
       public       postgres    false    215            �           0    0    Tipo_Codigo_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Tipo_Codigo_seq" OWNED BY public."Tipo"."Codigo";
            public       postgres    false    264            �            1259    25153    Tipo_Pago_Cheque    TABLE     �   CREATE TABLE public."Tipo_Pago_Cheque" (
    "Monto_Total" real NOT NULL,
    "Numero_Cheque" integer NOT NULL,
    "Institucion_Financiera" character varying(20) NOT NULL,
    "Codigo" integer NOT NULL
);
 &   DROP TABLE public."Tipo_Pago_Cheque";
       public         postgres    false            	           1259    27104    Tipo_Pago_Cheque_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Tipo_Pago_Cheque_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public."Tipo_Pago_Cheque_Codigo_seq";
       public       postgres    false    223            �           0    0    Tipo_Pago_Cheque_Codigo_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public."Tipo_Pago_Cheque_Codigo_seq" OWNED BY public."Tipo_Pago_Cheque"."Codigo";
            public       postgres    false    265            �            1259    25146    Tipo_Pago_Credit_Card    TABLE     �   CREATE TABLE public."Tipo_Pago_Credit_Card" (
    "Monto_Total" real NOT NULL,
    "Tipo_Tarjeta" character varying(20) NOT NULL,
    "Banco" character varying(20) NOT NULL,
    "Numero_Tarjeta" integer NOT NULL,
    "Codigo" integer NOT NULL
);
 +   DROP TABLE public."Tipo_Pago_Credit_Card";
       public         postgres    false            
           1259    27113     Tipo_Pago_Credit_Card_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Tipo_Pago_Credit_Card_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public."Tipo_Pago_Credit_Card_Codigo_seq";
       public       postgres    false    222            �           0    0     Tipo_Pago_Credit_Card_Codigo_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."Tipo_Pago_Credit_Card_Codigo_seq" OWNED BY public."Tipo_Pago_Credit_Card"."Codigo";
            public       postgres    false    266            �            1259    25141    Tipo_Pago_Efectivo    TABLE     �   CREATE TABLE public."Tipo_Pago_Efectivo" (
    "Monto_total" real NOT NULL,
    "Total_Billetes" real NOT NULL,
    "Codigo" integer NOT NULL
);
 (   DROP TABLE public."Tipo_Pago_Efectivo";
       public         postgres    false                       1259    27122    Tipo_Pago_Efectivo_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Tipo_Pago_Efectivo_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public."Tipo_Pago_Efectivo_Codigo_seq";
       public       postgres    false    221            �           0    0    Tipo_Pago_Efectivo_Codigo_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."Tipo_Pago_Efectivo_Codigo_seq" OWNED BY public."Tipo_Pago_Efectivo"."Codigo";
            public       postgres    false    267            �            1259    25127    Usuario    TABLE     �   CREATE TABLE public."Usuario" (
    "Nombre" character varying(20) NOT NULL,
    "Correo" character varying(50) NOT NULL,
    "Contraseña" character varying(50) NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Sele_Concede" integer NOT NULL
);
    DROP TABLE public."Usuario";
       public         postgres    false                       1259    27130    Usuario_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Usuario_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Usuario_Codigo_seq";
       public       postgres    false    219            �           0    0    Usuario_Codigo_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Usuario_Codigo_seq" OWNED BY public."Usuario"."Codigo";
            public       postgres    false    268            �            1259    25255    Vea-Aero    TABLE     �   CREATE TABLE public."Vea-Aero" (
    "Codigo" integer NOT NULL,
    "FK_Guarda" character varying(15) NOT NULL,
    "FK_Estaciona" integer NOT NULL
);
    DROP TABLE public."Vea-Aero";
       public         postgres    false                       1259    27140    Vea-Aero_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Vea-Aero_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Vea-Aero_Codigo_seq";
       public       postgres    false    226            �           0    0    Vea-Aero_Codigo_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Vea-Aero_Codigo_seq" OWNED BY public."Vea-Aero"."Codigo";
            public       postgres    false    269            �            1259    25210    Veh-Tall    TABLE       CREATE TABLE public."Veh-Tall" (
    "Codigo" integer NOT NULL,
    "FK_Enviar" character varying(15) NOT NULL,
    "FK_Enviar2" character varying(15) NOT NULL,
    "FK_Enviar3" character varying(15) NOT NULL,
    "FK_Chequear" integer NOT NULL,
    "FK_Refleja" integer NOT NULL
);
    DROP TABLE public."Veh-Tall";
       public         postgres    false                       1259    27148    Veh-Tall_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Veh-Tall_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Veh-Tall_Codigo_seq";
       public       postgres    false    224            �           0    0    Veh-Tall_Codigo_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Veh-Tall_Codigo_seq" OWNED BY public."Veh-Tall"."Codigo";
            public       postgres    false    270            �            1259    24990    Vehiculo_Aereo    TABLE     f  CREATE TABLE public."Vehiculo_Aereo" (
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
 $   DROP TABLE public."Vehiculo_Aereo";
       public         postgres    false            �            1259    24981    Vehiculo_Maritimo    TABLE     �  CREATE TABLE public."Vehiculo_Maritimo" (
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
 '   DROP TABLE public."Vehiculo_Maritimo";
       public         postgres    false            �            1259    24939    Vehiculo_Terrestre    TABLE     �  CREATE TABLE public."Vehiculo_Terrestre" (
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
 (   DROP TABLE public."Vehiculo_Terrestre";
       public         postgres    false            �            1259    25235    Vma-Pue    TABLE     �   CREATE TABLE public."Vma-Pue" (
    "Codigo" integer NOT NULL,
    "FK_Atraca" character varying(15) NOT NULL,
    "FK_Desembarca" integer NOT NULL
);
    DROP TABLE public."Vma-Pue";
       public         postgres    false                       1259    27156    Vma-Pue_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Vma-Pue_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Vma-Pue_Codigo_seq";
       public       postgres    false    225            �           0    0    Vma-Pue_Codigo_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Vma-Pue_Codigo_seq" OWNED BY public."Vma-Pue"."Codigo";
            public       postgres    false    271            �            1259    25082    Zona    TABLE     �   CREATE TABLE public."Zona" (
    "Nombre" character varying(20) NOT NULL,
    "Descripcion" character varying(50) NOT NULL,
    "Division_area" integer NOT NULL,
    "Codigo" integer NOT NULL,
    "FK_Divide" integer NOT NULL
);
    DROP TABLE public."Zona";
       public         postgres    false                       1259    27164    Zona_Codigo_seq    SEQUENCE     �   CREATE SEQUENCE public."Zona_Codigo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Zona_Codigo_seq";
       public       postgres    false    210            �           0    0    Zona_Codigo_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Zona_Codigo_seq" OWNED BY public."Zona"."Codigo";
            public       postgres    false    272            r           2604    26886    Aeropuerto Codigo    DEFAULT     |   ALTER TABLE ONLY public."Aeropuerto" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Aeropuerto_Codigo_seq"'::regclass);
 D   ALTER TABLE public."Aeropuerto" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    240    204            �           2604    26894    Auditoria Codigo    DEFAULT     z   ALTER TABLE ONLY public."Auditoria" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Auditoria_Codigo_seq"'::regclass);
 C   ALTER TABLE public."Auditoria" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    241    220            t           2604    26903    Contabilidad Codigo    DEFAULT     �   ALTER TABLE ONLY public."Contabilidad" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Contabilidad_Codigo_seq"'::regclass);
 F   ALTER TABLE public."Contabilidad" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    242    206            �           2604    26911    Emp-Hor Codigo    DEFAULT     v   ALTER TABLE ONLY public."Emp-Hor" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Emp-Hor_Codigo_seq"'::regclass);
 A   ALTER TABLE public."Emp-Hor" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    243    235            �           2604    26919    Emp-Zon Codigo    DEFAULT     v   ALTER TABLE ONLY public."Emp-Zon" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Emp-Zon_Codigo_seq"'::regclass);
 A   ALTER TABLE public."Emp-Zon" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    244    232            �           2604    27523    Env-Est Codigo    DEFAULT     v   ALTER TABLE ONLY public."Env-Est" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Env-Est_Codigo_seq"'::regclass);
 A   ALTER TABLE public."Env-Est" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    273    233            �           2604    26933    Env-Rut Codigo    DEFAULT     v   ALTER TABLE ONLY public."Env-Rut" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Env-Rut_Codigo_seq"'::regclass);
 A   ALTER TABLE public."Env-Rut" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    245    229            z           2604    26941    Envio Codigo    DEFAULT     r   ALTER TABLE ONLY public."Envio" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Envio_Codigo_seq"'::regclass);
 ?   ALTER TABLE public."Envio" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    246    213            {           2604    26949    Estatus Codigo    DEFAULT     v   ALTER TABLE ONLY public."Estatus" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Estatus_Codigo_seq"'::regclass);
 A   ALTER TABLE public."Estatus" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    247    214            o           2604    26957    Falla Codigo    DEFAULT     r   ALTER TABLE ONLY public."Falla" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Falla_Codigo_seq"'::regclass);
 ?   ALTER TABLE public."Falla" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    248    201                       2604    27606    Horario Codigo    DEFAULT     v   ALTER TABLE ONLY public."Horario" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Horario_Codigo_seq"'::regclass);
 A   ALTER TABLE public."Horario" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    274    217            w           2604    26971    Lugar Codigo    DEFAULT     r   ALTER TABLE ONLY public."Lugar" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Lugar_Codigo_seq"'::regclass);
 ?   ALTER TABLE public."Lugar" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    249    209            n           2604    26979    Marca Codigo    DEFAULT     r   ALTER TABLE ONLY public."Marca" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Marca_Codigo_seq"'::regclass);
 ?   ALTER TABLE public."Marca" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    250    200            m           2604    26987    Modelo Codigo    DEFAULT     t   ALTER TABLE ONLY public."Modelo" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Modelo_Codigo_seq"'::regclass);
 @   ALTER TABLE public."Modelo" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    251    199            �           2604    26995    Ofi-Paq Codigo    DEFAULT     v   ALTER TABLE ONLY public."Ofi-Paq" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Ofi-Paq_Codigo_seq"'::regclass);
 A   ALTER TABLE public."Ofi-Paq" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    252    231            �           2604    27004    Ofi-Rut Codigo    DEFAULT     v   ALTER TABLE ONLY public."Ofi-Rut" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Ofi-Rut_Codigo_seq"'::regclass);
 A   ALTER TABLE public."Ofi-Rut" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    253    227            �           2604    27012    Ofi-Ser Codigo    DEFAULT     v   ALTER TABLE ONLY public."Ofi-Ser" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Ofi-Ser_Codigo_seq"'::regclass);
 A   ALTER TABLE public."Ofi-Ser" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    254    230            v           2604    27020    Oficina Codigo    DEFAULT     v   ALTER TABLE ONLY public."Oficina" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Oficina_Codigo_seq"'::regclass);
 A   ALTER TABLE public."Oficina" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    255    208            �           2604    27032    Priv-Rol Codigo    DEFAULT     x   ALTER TABLE ONLY public."Priv-Rol" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Priv-Rol_Codigo_seq"'::regclass);
 B   ALTER TABLE public."Priv-Rol" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    256    234            }           2604    27040    Privilegio Codigo    DEFAULT     |   ALTER TABLE ONLY public."Privilegio" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Privilegio_Codigo_seq"'::regclass);
 D   ALTER TABLE public."Privilegio" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    257    216            q           2604    27048    Puerto Codigo    DEFAULT     t   ALTER TABLE ONLY public."Puerto" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Puerto_Codigo_seq"'::regclass);
 @   ALTER TABLE public."Puerto" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    258    203            y           2604    27056 
   Rol Codigo    DEFAULT     n   ALTER TABLE ONLY public."Rol" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Rol_Codigo_seq"'::regclass);
 =   ALTER TABLE public."Rol" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    259    212            s           2604    27064    Ruta Codigo    DEFAULT     p   ALTER TABLE ONLY public."Ruta" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Ruta_Codigo_seq"'::regclass);
 >   ALTER TABLE public."Ruta" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    260    205            u           2604    27072    Servicio Codigo    DEFAULT     x   ALTER TABLE ONLY public."Servicio" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Servicio_Codigo_seq"'::regclass);
 B   ALTER TABLE public."Servicio" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    261    207            �           2604    27080    Tall-Per.C Codigo    DEFAULT     |   ALTER TABLE ONLY public."Tall-Per.C" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Tall-Per.C_Codigo_seq"'::regclass);
 D   ALTER TABLE public."Tall-Per.C" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    262    228            p           2604    27088    Taller Codigo    DEFAULT     t   ALTER TABLE ONLY public."Taller" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Taller_Codigo_seq"'::regclass);
 @   ALTER TABLE public."Taller" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    263    202            |           2604    27098    Tipo Codigo    DEFAULT     p   ALTER TABLE ONLY public."Tipo" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Tipo_Codigo_seq"'::regclass);
 >   ALTER TABLE public."Tipo" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    264    215            �           2604    27106    Tipo_Pago_Cheque Codigo    DEFAULT     �   ALTER TABLE ONLY public."Tipo_Pago_Cheque" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Tipo_Pago_Cheque_Codigo_seq"'::regclass);
 J   ALTER TABLE public."Tipo_Pago_Cheque" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    265    223            �           2604    27115    Tipo_Pago_Credit_Card Codigo    DEFAULT     �   ALTER TABLE ONLY public."Tipo_Pago_Credit_Card" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Tipo_Pago_Credit_Card_Codigo_seq"'::regclass);
 O   ALTER TABLE public."Tipo_Pago_Credit_Card" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    266    222            �           2604    27124    Tipo_Pago_Efectivo Codigo    DEFAULT     �   ALTER TABLE ONLY public."Tipo_Pago_Efectivo" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Tipo_Pago_Efectivo_Codigo_seq"'::regclass);
 L   ALTER TABLE public."Tipo_Pago_Efectivo" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    267    221            �           2604    27132    Usuario Codigo    DEFAULT     v   ALTER TABLE ONLY public."Usuario" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Usuario_Codigo_seq"'::regclass);
 A   ALTER TABLE public."Usuario" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    268    219            �           2604    27142    Vea-Aero Codigo    DEFAULT     x   ALTER TABLE ONLY public."Vea-Aero" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Vea-Aero_Codigo_seq"'::regclass);
 B   ALTER TABLE public."Vea-Aero" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    269    226            �           2604    27150    Veh-Tall Codigo    DEFAULT     x   ALTER TABLE ONLY public."Veh-Tall" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Veh-Tall_Codigo_seq"'::regclass);
 B   ALTER TABLE public."Veh-Tall" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    270    224            �           2604    27158    Vma-Pue Codigo    DEFAULT     v   ALTER TABLE ONLY public."Vma-Pue" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Vma-Pue_Codigo_seq"'::regclass);
 A   ALTER TABLE public."Vma-Pue" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    271    225            x           2604    27166    Zona Codigo    DEFAULT     p   ALTER TABLE ONLY public."Zona" ALTER COLUMN "Codigo" SET DEFAULT nextval('public."Zona_Codigo_seq"'::regclass);
 >   ALTER TABLE public."Zona" ALTER COLUMN "Codigo" DROP DEFAULT;
       public       postgres    false    272    210                      0    25027 
   Aeropuerto 
   TABLE DATA               �   COPY public."Aeropuerto" ("Cantidad_Terminales", "Pistas", "Capacidad", "Hangares", "Codigo", "FK_Sitio", "FK_Dispone_con") FROM stdin;
    public       postgres    false    204   [�      *          0    25136 	   Auditoria 
   TABLE DATA               c   COPY public."Auditoria" ("Usuario", "Fecha_Ingreso", "Accion", "Codigo", "FK_Observa") FROM stdin;
    public       postgres    false    220   x�      :          0    26857    Cliente 
   TABLE DATA               �   COPY public."Cliente" ("Cedula", "Nombre", "Apellido", "Correo_Personal", "Fecha_Nacimiento", estado_civil, "Empresa", l_vip, "Frecuente") FROM stdin;
    public       postgres    false    236   ��                0    25037    Contabilidad 
   TABLE DATA               m   COPY public."Contabilidad" ("Descripcion", "Salario", "Dias_Trabajados", "Codigo", "FK_Calcula") FROM stdin;
    public       postgres    false    206   ��      9          0    25565    Emp-Hor 
   TABLE DATA               X   COPY public."Emp-Hor" ("Fecha", "Codigo", "FK_Asistencia", "FK_Recibe_Emp") FROM stdin;
    public       postgres    false    235   ��      6          0    25463    Emp-Zon 
   TABLE DATA               H   COPY public."Emp-Zon" ("Codigo", "FK_Asiste", "FK_Asignar") FROM stdin;
    public       postgres    false    232   ��      ;          0    26866    Empleado 
   TABLE DATA               �   COPY public."Empleado" ("Cedula", "Nombre", "Apellido", "Correo_Personal", "Fecha_Nacimiento", estado_civil, "Nivel_Academico", "Profesion", "Num_hijos", "FK_Habitacion") FROM stdin;
    public       postgres    false    237   	�      7          0    25495    Env-Est 
   TABLE DATA               R   COPY public."Env-Est" ("FK_Revisa_Sta", "Codigo", "FK_Encuentra_Sta") FROM stdin;
    public       postgres    false    233   &�      3          0    25380    Env-Rut 
   TABLE DATA               M   COPY public."Env-Rut" ("Codigo", "FK_Adquiere_Pa", "FK_Recorre") FROM stdin;
    public       postgres    false    229   C�      #          0    25097    Envio 
   TABLE DATA               P   COPY public."Envio" ("Monto", "Codigo", "FK_Destino", "FK_Realiza") FROM stdin;
    public       postgres    false    213   `�      $          0    25102    Estatus 
   TABLE DATA               K   COPY public."Estatus" ("Descripcion", "Codigo", "FK_Revision") FROM stdin;
    public       postgres    false    214   }�                0    25007    Falla 
   TABLE DATA               f   COPY public."Falla" ("Descripcion", "Codigo", "FK_Origina", "FK_Origina2", "FK_Origina3") FROM stdin;
    public       postgres    false    201   ��      '          0    25117    Horario 
   TABLE DATA               m   COPY public."Horario" ("Dia", "Hora_Inicio", "Hora_Fin", "Descripcion", "FK_cada-uno", "Codigo") FROM stdin;
    public       postgres    false    217   ��                0    25053    Lugar 
   TABLE DATA               I   COPY public."Lugar" ("Nombre", "Tipo", "Codigo", "FK_Lugar") FROM stdin;
    public       postgres    false    209   ��                0    25002    Marca 
   TABLE DATA               :   COPY public."Marca" ("Descripcion", "Codigo") FROM stdin;
    public       postgres    false    200   ��                0    24997    Modelo 
   TABLE DATA               J   COPY public."Modelo" ("Descripcion", "Codigo", "FK_Contiene") FROM stdin;
    public       postgres    false    199   �      5          0    25415    Ofi-Paq 
   TABLE DATA               H   COPY public."Ofi-Paq" ("Codigo", "FK_Almacena", "FK_Llega") FROM stdin;
    public       postgres    false    231   +�      1          0    25280    Ofi-Rut 
   TABLE DATA               �   COPY public."Ofi-Rut" ("Costo", "Codigo", "FK_Camino", "FK_Camino2", "FK_Camino3", "FK_Ofi_Origen", "FK_Ofi_Destino") FROM stdin;
    public       postgres    false    227   H�      4          0    25395    Ofi-Ser 
   TABLE DATA               Q   COPY public."Ofi-Ser" ("Codigo", "FK_Gasta", "FK_Pago", "FK_Ofrece") FROM stdin;
    public       postgres    false    230   e�                0    25048    Oficina 
   TABLE DATA               X   COPY public."Oficina" ("Nombre", "Tamaño_Deposito", "Codigo", "FK_Varios") FROM stdin;
    public       postgres    false    208   ��      (          0    25122    Pago 
   TABLE DATA               �   COPY public."Pago" ("Monto_Total", "Fecha", "Tipo", "Numero_unico", "FK_Costo", "FK_Cancela1", "FK_Cancela2", "FK_Cancela3") FROM stdin;
    public       postgres    false    218   ��      !          0    25087    Paquete 
   TABLE DATA               �   COPY public."Paquete" ("Destinatario", "Peso", "Clasificacion", "Telefono_Contacto", "Dimension_Paquete", "Numero_guia", "FK_Transporta", "FK_Entrega") FROM stdin;
    public       postgres    false    211   ��      <          0    26874    Persona-Contacto 
   TABLE DATA               <   COPY public."Persona-Contacto" ("CI", "Nombre") FROM stdin;
    public       postgres    false    238   ��      8          0    25550    Priv-Rol 
   TABLE DATA               L   COPY public."Priv-Rol" ("Codigo", "FK_Opcion", "FK_Accede_Sis") FROM stdin;
    public       postgres    false    234   ��      &          0    25112 
   Privilegio 
   TABLE DATA               6   COPY public."Privilegio" (tipo, "Codigo") FROM stdin;
    public       postgres    false    216   �                0    25022    Puerto 
   TABLE DATA               �   COPY public."Puerto" ("Cantidad_Puestos", "Area_Techada", "Muelles", "Longitud", "Ancho", "Calado", "Uso", "Codigo", "FK_Sede", "FK_Tiene_con") FROM stdin;
    public       postgres    false    203   0�      "          0    25092    Rol 
   TABLE DATA               [   COPY public."Rol" ("Tipo", "Codigo", "FK_Asignado_tipo", "FK_Asignado_Puesto") FROM stdin;
    public       postgres    false    212   M�                0    25032    Ruta 
   TABLE DATA               Q   COPY public."Ruta" ("Descripcion", "Codigo", "FK_Ruta", "FK_Camino") FROM stdin;
    public       postgres    false    205   j�                0    25043    Servicio 
   TABLE DATA               =   COPY public."Servicio" ("Descripcion", "Codigo") FROM stdin;
    public       postgres    false    207   ��      2          0    25310 
   Tall-Per.C 
   TABLE DATA               M   COPY public."Tall-Per.C" ("Codigo", "FK_Conoce", "FK_Referente") FROM stdin;
    public       postgres    false    228   ��                0    25017    Taller 
   TABLE DATA               �   COPY public."Taller" ("Flota_Revision", "Fecha_Entrada", "Fecha_Salida_Prevista", "Fecha_Salida_Real", "Proxima_Fecha", "Codigo", "FK_Locacion") FROM stdin;
    public       postgres    false    202   ��      =          0    26879    Telefono 
   TABLE DATA               s   COPY public."Telefono" ("Numero", tipo, "FK_Dispositivo", "FK_Comunicado", "FK_Telefonia", "FK_Posee") FROM stdin;
    public       postgres    false    239   ��      %          0    25107    Tipo 
   TABLE DATA               X   COPY public."Tipo" ("Nombre", "Descripcion", "Costo", "Codigo", "FK_Es_de") FROM stdin;
    public       postgres    false    215   ��      -          0    25153    Tipo_Pago_Cheque 
   TABLE DATA               p   COPY public."Tipo_Pago_Cheque" ("Monto_Total", "Numero_Cheque", "Institucion_Financiera", "Codigo") FROM stdin;
    public       postgres    false    223   �      ,          0    25146    Tipo_Pago_Credit_Card 
   TABLE DATA               u   COPY public."Tipo_Pago_Credit_Card" ("Monto_Total", "Tipo_Tarjeta", "Banco", "Numero_Tarjeta", "Codigo") FROM stdin;
    public       postgres    false    222   5�      +          0    25141    Tipo_Pago_Efectivo 
   TABLE DATA               Y   COPY public."Tipo_Pago_Efectivo" ("Monto_total", "Total_Billetes", "Codigo") FROM stdin;
    public       postgres    false    221   R�      )          0    25127    Usuario 
   TABLE DATA               c   COPY public."Usuario" ("Nombre", "Correo", "Contraseña", "Codigo", "FK_Sele_Concede") FROM stdin;
    public       postgres    false    219   o�      0          0    25255    Vea-Aero 
   TABLE DATA               K   COPY public."Vea-Aero" ("Codigo", "FK_Guarda", "FK_Estaciona") FROM stdin;
    public       postgres    false    226   ��      .          0    25210    Veh-Tall 
   TABLE DATA               t   COPY public."Veh-Tall" ("Codigo", "FK_Enviar", "FK_Enviar2", "FK_Enviar3", "FK_Chequear", "FK_Refleja") FROM stdin;
    public       postgres    false    224   ��                0    24990    Vehiculo_Aereo 
   TABLE DATA               &  COPY public."Vehiculo_Aereo" ("Placa", "Peso", "Capacidad", "Serial_Motor", "Altura", "Velocidad_Maxima", "Capacidad_Combustible", "Envergadura", "Ancho_Cabina", "Diametro_Fusilaje", "Peso_Vacio", "Peso_Max_Despegue", "Carrera_Despegue", "Motores", "FK_Representa", "FK_Cuentacon") FROM stdin;
    public       postgres    false    198   ��                0    24981    Vehiculo_Maritimo 
   TABLE DATA               �   COPY public."Vehiculo_Maritimo" ("Placa", "Peso", "Capacidad", "Serial_Motor", "Altura", "Velocidad_Maxima", "Capacidad_Combustible", "Nombre", "FK_Representa", "FK_Cuentacon") FROM stdin;
    public       postgres    false    197   ��                0    24939    Vehiculo_Terrestre 
   TABLE DATA               �   COPY public."Vehiculo_Terrestre" ("Placa", "Peso", "Capacidad", "Serial_Motor", "Altura", "Velocidad_Maxima", "Capacidad_Combustible", "Serial_Carroceria", "FK_Representa", "FK_Cuentacon") FROM stdin;
    public       postgres    false    196    �      /          0    25235    Vma-Pue 
   TABLE DATA               K   COPY public."Vma-Pue" ("Codigo", "FK_Atraca", "FK_Desembarca") FROM stdin;
    public       postgres    false    225   �                 0    25082    Zona 
   TABLE DATA               a   COPY public."Zona" ("Nombre", "Descripcion", "Division_area", "Codigo", "FK_Divide") FROM stdin;
    public       postgres    false    210   :�      �           0    0    Aeropuerto_Codigo_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Aeropuerto_Codigo_seq"', 1, false);
            public       postgres    false    240            �           0    0    Auditoria_Codigo_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Auditoria_Codigo_seq"', 1, false);
            public       postgres    false    241            �           0    0    Contabilidad_Codigo_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."Contabilidad_Codigo_seq"', 1, false);
            public       postgres    false    242            �           0    0    Emp-Hor_Codigo_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Emp-Hor_Codigo_seq"', 1, false);
            public       postgres    false    243            �           0    0    Emp-Zon_Codigo_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Emp-Zon_Codigo_seq"', 1, false);
            public       postgres    false    244            �           0    0    Env-Est_Codigo_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Env-Est_Codigo_seq"', 1, false);
            public       postgres    false    273            �           0    0    Env-Rut_Codigo_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Env-Rut_Codigo_seq"', 1, false);
            public       postgres    false    245            �           0    0    Envio_Codigo_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Envio_Codigo_seq"', 1, false);
            public       postgres    false    246            �           0    0    Estatus_Codigo_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Estatus_Codigo_seq"', 1, false);
            public       postgres    false    247            �           0    0    Falla_Codigo_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Falla_Codigo_seq"', 1, false);
            public       postgres    false    248            �           0    0    Horario_Codigo_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Horario_Codigo_seq"', 1, false);
            public       postgres    false    274            �           0    0    Lugar_Codigo_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Lugar_Codigo_seq"', 1, false);
            public       postgres    false    249            �           0    0    Marca_Codigo_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Marca_Codigo_seq"', 1, false);
            public       postgres    false    250            �           0    0    Modelo_Codigo_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Modelo_Codigo_seq"', 1, false);
            public       postgres    false    251            �           0    0    Ofi-Paq_Codigo_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Ofi-Paq_Codigo_seq"', 1, false);
            public       postgres    false    252            �           0    0    Ofi-Rut_Codigo_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Ofi-Rut_Codigo_seq"', 1, false);
            public       postgres    false    253            �           0    0    Ofi-Ser_Codigo_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Ofi-Ser_Codigo_seq"', 1, false);
            public       postgres    false    254            �           0    0    Oficina_Codigo_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Oficina_Codigo_seq"', 1, false);
            public       postgres    false    255            �           0    0    Priv-Rol_Codigo_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Priv-Rol_Codigo_seq"', 1, false);
            public       postgres    false    256            �           0    0    Privilegio_Codigo_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Privilegio_Codigo_seq"', 1, false);
            public       postgres    false    257            �           0    0    Puerto_Codigo_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Puerto_Codigo_seq"', 1, false);
            public       postgres    false    258            �           0    0    Rol_Codigo_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Rol_Codigo_seq"', 1, false);
            public       postgres    false    259            �           0    0    Ruta_Codigo_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Ruta_Codigo_seq"', 1, false);
            public       postgres    false    260            �           0    0    Servicio_Codigo_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Servicio_Codigo_seq"', 1, false);
            public       postgres    false    261            �           0    0    Tall-Per.C_Codigo_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Tall-Per.C_Codigo_seq"', 1, false);
            public       postgres    false    262            �           0    0    Taller_Codigo_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Taller_Codigo_seq"', 1, false);
            public       postgres    false    263            �           0    0    Tipo_Codigo_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Tipo_Codigo_seq"', 1, false);
            public       postgres    false    264            �           0    0    Tipo_Pago_Cheque_Codigo_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."Tipo_Pago_Cheque_Codigo_seq"', 1, false);
            public       postgres    false    265            �           0    0     Tipo_Pago_Credit_Card_Codigo_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."Tipo_Pago_Credit_Card_Codigo_seq"', 1, false);
            public       postgres    false    266            �           0    0    Tipo_Pago_Efectivo_Codigo_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."Tipo_Pago_Efectivo_Codigo_seq"', 1, false);
            public       postgres    false    267            �           0    0    Usuario_Codigo_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Usuario_Codigo_seq"', 1, false);
            public       postgres    false    268            �           0    0    Vea-Aero_Codigo_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Vea-Aero_Codigo_seq"', 1, false);
            public       postgres    false    269            �           0    0    Veh-Tall_Codigo_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Veh-Tall_Codigo_seq"', 1, false);
            public       postgres    false    270            �           0    0    Vma-Pue_Codigo_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Vma-Pue_Codigo_seq"', 1, false);
            public       postgres    false    271            �           0    0    Zona_Codigo_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Zona_Codigo_seq"', 1, false);
            public       postgres    false    272            �           2606    26891    Aeropuerto Aeropuerto_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Aeropuerto"
    ADD CONSTRAINT "Aeropuerto_pkey" PRIMARY KEY ("Codigo");
 H   ALTER TABLE ONLY public."Aeropuerto" DROP CONSTRAINT "Aeropuerto_pkey";
       public         postgres    false    204            �           2606    26899    Auditoria Auditoria_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Auditoria"
    ADD CONSTRAINT "Auditoria_pkey" PRIMARY KEY ("Codigo");
 F   ALTER TABLE ONLY public."Auditoria" DROP CONSTRAINT "Auditoria_pkey";
       public         postgres    false    220            @           2606    26861    Cliente Cliente_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Cliente"
    ADD CONSTRAINT "Cliente_pkey" PRIMARY KEY ("Cedula");
 B   ALTER TABLE ONLY public."Cliente" DROP CONSTRAINT "Cliente_pkey";
       public         postgres    false    236            �           2606    26908    Contabilidad Contabilidad_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."Contabilidad"
    ADD CONSTRAINT "Contabilidad_pkey" PRIMARY KEY ("Codigo");
 L   ALTER TABLE ONLY public."Contabilidad" DROP CONSTRAINT "Contabilidad_pkey";
       public         postgres    false    206            <           2606    26916    Emp-Hor Emp-Hor_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Emp-Hor"
    ADD CONSTRAINT "Emp-Hor_pkey" PRIMARY KEY ("Codigo");
 B   ALTER TABLE ONLY public."Emp-Hor" DROP CONSTRAINT "Emp-Hor_pkey";
       public         postgres    false    235            0           2606    26924    Emp-Zon Emp-Zon_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Emp-Zon"
    ADD CONSTRAINT "Emp-Zon_pkey" PRIMARY KEY ("Codigo");
 B   ALTER TABLE ONLY public."Emp-Zon" DROP CONSTRAINT "Emp-Zon_pkey";
       public         postgres    false    232            D           2606    26870    Empleado Empleado_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Empleado"
    ADD CONSTRAINT "Empleado_pkey" PRIMARY KEY ("Cedula");
 D   ALTER TABLE ONLY public."Empleado" DROP CONSTRAINT "Empleado_pkey";
       public         postgres    false    237            4           2606    27529    Env-Est Env-Est_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Env-Est"
    ADD CONSTRAINT "Env-Est_pkey" PRIMARY KEY ("Codigo");
 B   ALTER TABLE ONLY public."Env-Est" DROP CONSTRAINT "Env-Est_pkey";
       public         postgres    false    233            #           2606    26938    Env-Rut Env-Rut_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Env-Rut"
    ADD CONSTRAINT "Env-Rut_pkey" PRIMARY KEY ("Codigo");
 B   ALTER TABLE ONLY public."Env-Rut" DROP CONSTRAINT "Env-Rut_pkey";
       public         postgres    false    229            �           2606    26946    Envio Envio_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Envio"
    ADD CONSTRAINT "Envio_pkey" PRIMARY KEY ("Codigo");
 >   ALTER TABLE ONLY public."Envio" DROP CONSTRAINT "Envio_pkey";
       public         postgres    false    213            �           2606    26954    Estatus Estatus_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Estatus"
    ADD CONSTRAINT "Estatus_pkey" PRIMARY KEY ("Codigo");
 B   ALTER TABLE ONLY public."Estatus" DROP CONSTRAINT "Estatus_pkey";
       public         postgres    false    214            �           2606    26962    Falla Falla_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Falla"
    ADD CONSTRAINT "Falla_pkey" PRIMARY KEY ("Codigo");
 >   ALTER TABLE ONLY public."Falla" DROP CONSTRAINT "Falla_pkey";
       public         postgres    false    201            �           2606    27611    Horario Horario_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Horario"
    ADD CONSTRAINT "Horario_pkey" PRIMARY KEY ("Codigo");
 B   ALTER TABLE ONLY public."Horario" DROP CONSTRAINT "Horario_pkey";
       public         postgres    false    217            �           2606    26976    Lugar Lugar_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Lugar"
    ADD CONSTRAINT "Lugar_pkey" PRIMARY KEY ("Codigo");
 >   ALTER TABLE ONLY public."Lugar" DROP CONSTRAINT "Lugar_pkey";
       public         postgres    false    209            �           2606    26984    Marca Marca_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Marca"
    ADD CONSTRAINT "Marca_pkey" PRIMARY KEY ("Codigo");
 >   ALTER TABLE ONLY public."Marca" DROP CONSTRAINT "Marca_pkey";
       public         postgres    false    200            �           2606    26992    Modelo Modelo_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Modelo"
    ADD CONSTRAINT "Modelo_pkey" PRIMARY KEY ("Codigo");
 @   ALTER TABLE ONLY public."Modelo" DROP CONSTRAINT "Modelo_pkey";
       public         postgres    false    199            ,           2606    27000    Ofi-Paq Ofi-Paq_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Ofi-Paq"
    ADD CONSTRAINT "Ofi-Paq_pkey" PRIMARY KEY ("Codigo");
 B   ALTER TABLE ONLY public."Ofi-Paq" DROP CONSTRAINT "Ofi-Paq_pkey";
       public         postgres    false    231                       2606    27009    Ofi-Rut Ofi-Rut_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Ofi-Rut"
    ADD CONSTRAINT "Ofi-Rut_pkey" PRIMARY KEY ("Codigo");
 B   ALTER TABLE ONLY public."Ofi-Rut" DROP CONSTRAINT "Ofi-Rut_pkey";
       public         postgres    false    227            '           2606    27017    Ofi-Ser Ofi-Ser_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Ofi-Ser"
    ADD CONSTRAINT "Ofi-Ser_pkey" PRIMARY KEY ("Codigo");
 B   ALTER TABLE ONLY public."Ofi-Ser" DROP CONSTRAINT "Ofi-Ser_pkey";
       public         postgres    false    230            �           2606    27025    Oficina Oficina_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Oficina"
    ADD CONSTRAINT "Oficina_pkey" PRIMARY KEY ("Codigo");
 B   ALTER TABLE ONLY public."Oficina" DROP CONSTRAINT "Oficina_pkey";
       public         postgres    false    208            �           2606    27027    Pago Pago_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Pago"
    ADD CONSTRAINT "Pago_pkey" PRIMARY KEY ("Numero_unico");
 <   ALTER TABLE ONLY public."Pago" DROP CONSTRAINT "Pago_pkey";
       public         postgres    false    218            �           2606    27029    Paquete Paquete_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT "Paquete_pkey" PRIMARY KEY ("Numero_guia");
 B   ALTER TABLE ONLY public."Paquete" DROP CONSTRAINT "Paquete_pkey";
       public         postgres    false    211            I           2606    26878 &   Persona-Contacto Persona-Contacto_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."Persona-Contacto"
    ADD CONSTRAINT "Persona-Contacto_pkey" PRIMARY KEY ("CI");
 T   ALTER TABLE ONLY public."Persona-Contacto" DROP CONSTRAINT "Persona-Contacto_pkey";
       public         postgres    false    238            8           2606    27037    Priv-Rol Priv-Rol_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Priv-Rol"
    ADD CONSTRAINT "Priv-Rol_pkey" PRIMARY KEY ("Codigo");
 D   ALTER TABLE ONLY public."Priv-Rol" DROP CONSTRAINT "Priv-Rol_pkey";
       public         postgres    false    234            �           2606    27045    Privilegio Privilegio_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Privilegio"
    ADD CONSTRAINT "Privilegio_pkey" PRIMARY KEY ("Codigo");
 H   ALTER TABLE ONLY public."Privilegio" DROP CONSTRAINT "Privilegio_pkey";
       public         postgres    false    216            �           2606    27053    Puerto Puerto_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Puerto"
    ADD CONSTRAINT "Puerto_pkey" PRIMARY KEY ("Codigo");
 @   ALTER TABLE ONLY public."Puerto" DROP CONSTRAINT "Puerto_pkey";
       public         postgres    false    203            �           2606    27061    Rol Rol_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Rol"
    ADD CONSTRAINT "Rol_pkey" PRIMARY KEY ("Codigo");
 :   ALTER TABLE ONLY public."Rol" DROP CONSTRAINT "Rol_pkey";
       public         postgres    false    212            �           2606    27069    Ruta Ruta_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Ruta"
    ADD CONSTRAINT "Ruta_pkey" PRIMARY KEY ("Codigo");
 <   ALTER TABLE ONLY public."Ruta" DROP CONSTRAINT "Ruta_pkey";
       public         postgres    false    205            �           2606    27077    Servicio Servicio_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Servicio"
    ADD CONSTRAINT "Servicio_pkey" PRIMARY KEY ("Codigo");
 D   ALTER TABLE ONLY public."Servicio" DROP CONSTRAINT "Servicio_pkey";
       public         postgres    false    207                       2606    27085    Tall-Per.C Tall-Per.C_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Tall-Per.C"
    ADD CONSTRAINT "Tall-Per.C_pkey" PRIMARY KEY ("Codigo");
 H   ALTER TABLE ONLY public."Tall-Per.C" DROP CONSTRAINT "Tall-Per.C_pkey";
       public         postgres    false    228            �           2606    27093    Taller Taller_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Taller"
    ADD CONSTRAINT "Taller_pkey" PRIMARY KEY ("Codigo");
 @   ALTER TABLE ONLY public."Taller" DROP CONSTRAINT "Taller_pkey";
       public         postgres    false    202            K           2606    26883    Telefono Telefono_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Telefono"
    ADD CONSTRAINT "Telefono_pkey" PRIMARY KEY ("Numero");
 D   ALTER TABLE ONLY public."Telefono" DROP CONSTRAINT "Telefono_pkey";
       public         postgres    false    239                       2606    27112 &   Tipo_Pago_Cheque Tipo_Pago_Cheque_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."Tipo_Pago_Cheque"
    ADD CONSTRAINT "Tipo_Pago_Cheque_pkey" PRIMARY KEY ("Codigo");
 T   ALTER TABLE ONLY public."Tipo_Pago_Cheque" DROP CONSTRAINT "Tipo_Pago_Cheque_pkey";
       public         postgres    false    223                        2606    27121 0   Tipo_Pago_Credit_Card Tipo_Pago_Credit_Card_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public."Tipo_Pago_Credit_Card"
    ADD CONSTRAINT "Tipo_Pago_Credit_Card_pkey" PRIMARY KEY ("Codigo");
 ^   ALTER TABLE ONLY public."Tipo_Pago_Credit_Card" DROP CONSTRAINT "Tipo_Pago_Credit_Card_pkey";
       public         postgres    false    222            �           2606    27129 *   Tipo_Pago_Efectivo Tipo_Pago_Efectivo_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public."Tipo_Pago_Efectivo"
    ADD CONSTRAINT "Tipo_Pago_Efectivo_pkey" PRIMARY KEY ("Codigo");
 X   ALTER TABLE ONLY public."Tipo_Pago_Efectivo" DROP CONSTRAINT "Tipo_Pago_Efectivo_pkey";
       public         postgres    false    221            �           2606    27103    Tipo Tipo_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Tipo"
    ADD CONSTRAINT "Tipo_pkey" PRIMARY KEY ("Codigo");
 <   ALTER TABLE ONLY public."Tipo" DROP CONSTRAINT "Tipo_pkey";
       public         postgres    false    215            B           2606    26863    Cliente UK_Correo1 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Cliente"
    ADD CONSTRAINT "UK_Correo1" UNIQUE ("Correo_Personal");
 @   ALTER TABLE ONLY public."Cliente" DROP CONSTRAINT "UK_Correo1";
       public         postgres    false    236            �           2606    26598    Usuario UK_Correo3 
   CONSTRAINT     U   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "UK_Correo3" UNIQUE ("Correo");
 @   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "UK_Correo3";
       public         postgres    false    219            �           2606    26754    Vehiculo_Maritimo UK_Nombre 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Vehiculo_Maritimo"
    ADD CONSTRAINT "UK_Nombre" UNIQUE ("Nombre");
 I   ALTER TABLE ONLY public."Vehiculo_Maritimo" DROP CONSTRAINT "UK_Nombre";
       public         postgres    false    197            �           2606    26590    Usuario UK_Nombre2 
   CONSTRAINT     U   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "UK_Nombre2" UNIQUE ("Nombre");
 @   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "UK_Nombre2";
       public         postgres    false    219                       2606    25159    Tipo_Pago_Cheque UK_NumCheque 
   CONSTRAINT     g   ALTER TABLE ONLY public."Tipo_Pago_Cheque"
    ADD CONSTRAINT "UK_NumCheque" UNIQUE ("Numero_Cheque");
 K   ALTER TABLE ONLY public."Tipo_Pago_Cheque" DROP CONSTRAINT "UK_NumCheque";
       public         postgres    false    223                       2606    25152 #   Tipo_Pago_Credit_Card UK_NumTarjeta 
   CONSTRAINT     n   ALTER TABLE ONLY public."Tipo_Pago_Credit_Card"
    ADD CONSTRAINT "UK_NumTarjeta" UNIQUE ("Numero_Tarjeta");
 Q   ALTER TABLE ONLY public."Tipo_Pago_Credit_Card" DROP CONSTRAINT "UK_NumTarjeta";
       public         postgres    false    222            �           2606    27531    Envio UK_Realiza 
   CONSTRAINT     W   ALTER TABLE ONLY public."Envio"
    ADD CONSTRAINT "UK_Realiza" UNIQUE ("FK_Realiza");
 >   ALTER TABLE ONLY public."Envio" DROP CONSTRAINT "UK_Realiza";
       public         postgres    false    213            �           2606    26820 '   Vehiculo_Terrestre UK_SerialCarroceria1 
   CONSTRAINT     u   ALTER TABLE ONLY public."Vehiculo_Terrestre"
    ADD CONSTRAINT "UK_SerialCarroceria1" UNIQUE ("Serial_Carroceria");
 U   ALTER TABLE ONLY public."Vehiculo_Terrestre" DROP CONSTRAINT "UK_SerialCarroceria1";
       public         postgres    false    196            �           2606    26812 "   Vehiculo_Terrestre UK_SerialMotor1 
   CONSTRAINT     k   ALTER TABLE ONLY public."Vehiculo_Terrestre"
    ADD CONSTRAINT "UK_SerialMotor1" UNIQUE ("Serial_Motor");
 P   ALTER TABLE ONLY public."Vehiculo_Terrestre" DROP CONSTRAINT "UK_SerialMotor1";
       public         postgres    false    196            �           2606    26746 !   Vehiculo_Maritimo UK_SerialMotor2 
   CONSTRAINT     j   ALTER TABLE ONLY public."Vehiculo_Maritimo"
    ADD CONSTRAINT "UK_SerialMotor2" UNIQUE ("Serial_Motor");
 O   ALTER TABLE ONLY public."Vehiculo_Maritimo" DROP CONSTRAINT "UK_SerialMotor2";
       public         postgres    false    197            �           2606    26696    Vehiculo_Aereo UK_SerialMotor3 
   CONSTRAINT     g   ALTER TABLE ONLY public."Vehiculo_Aereo"
    ADD CONSTRAINT "UK_SerialMotor3" UNIQUE ("Serial_Motor");
 L   ALTER TABLE ONLY public."Vehiculo_Aereo" DROP CONSTRAINT "UK_SerialMotor3";
       public         postgres    false    198            �           2606    27358    Contabilidad UK_calcula 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Contabilidad"
    ADD CONSTRAINT "UK_calcula" UNIQUE ("FK_Calcula");
 E   ALTER TABLE ONLY public."Contabilidad" DROP CONSTRAINT "UK_calcula";
       public         postgres    false    206            F           2606    26872    Empleado UK_correo2 
   CONSTRAINT     _   ALTER TABLE ONLY public."Empleado"
    ADD CONSTRAINT "UK_correo2" UNIQUE ("Correo_Personal");
 A   ALTER TABLE ONLY public."Empleado" DROP CONSTRAINT "UK_correo2";
       public         postgres    false    237                       2606    27328    Veh-Tall UK_refleja 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Veh-Tall"
    ADD CONSTRAINT "UK_refleja" UNIQUE ("FK_Refleja");
 A   ALTER TABLE ONLY public."Veh-Tall" DROP CONSTRAINT "UK_refleja";
       public         postgres    false    224            �           2606    27580    Usuario UK_selecondece 
   CONSTRAINT     b   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "UK_selecondece" UNIQUE ("FK_Sele_Concede");
 D   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "UK_selecondece";
       public         postgres    false    219            �           2606    27139    Usuario Usuario_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("Codigo");
 B   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_pkey";
       public         postgres    false    219                       2606    27147    Vea-Aero Vea-Aero_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Vea-Aero"
    ADD CONSTRAINT "Vea-Aero_pkey" PRIMARY KEY ("Codigo");
 D   ALTER TABLE ONLY public."Vea-Aero" DROP CONSTRAINT "Vea-Aero_pkey";
       public         postgres    false    226            
           2606    27155    Veh-Tall Veh-Tall_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Veh-Tall"
    ADD CONSTRAINT "Veh-Tall_pkey" PRIMARY KEY ("Codigo");
 D   ALTER TABLE ONLY public."Veh-Tall" DROP CONSTRAINT "Veh-Tall_pkey";
       public         postgres    false    224            �           2606    26659 "   Vehiculo_Aereo Vehiculo_Aereo_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public."Vehiculo_Aereo"
    ADD CONSTRAINT "Vehiculo_Aereo_pkey" PRIMARY KEY ("Placa");
 P   ALTER TABLE ONLY public."Vehiculo_Aereo" DROP CONSTRAINT "Vehiculo_Aereo_pkey";
       public         postgres    false    198            �           2606    26708 (   Vehiculo_Maritimo Vehiculo_Maritimo_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public."Vehiculo_Maritimo"
    ADD CONSTRAINT "Vehiculo_Maritimo_pkey" PRIMARY KEY ("Placa");
 V   ALTER TABLE ONLY public."Vehiculo_Maritimo" DROP CONSTRAINT "Vehiculo_Maritimo_pkey";
       public         postgres    false    197            �           2606    26779 *   Vehiculo_Terrestre Vehiculo_Terrestre_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."Vehiculo_Terrestre"
    ADD CONSTRAINT "Vehiculo_Terrestre_pkey" PRIMARY KEY ("Placa");
 X   ALTER TABLE ONLY public."Vehiculo_Terrestre" DROP CONSTRAINT "Vehiculo_Terrestre_pkey";
       public         postgres    false    196                       2606    27163    Vma-Pue Vma-Pue_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Vma-Pue"
    ADD CONSTRAINT "Vma-Pue_pkey" PRIMARY KEY ("Codigo");
 B   ALTER TABLE ONLY public."Vma-Pue" DROP CONSTRAINT "Vma-Pue_pkey";
       public         postgres    false    225            �           2606    27171    Zona Zona_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Zona"
    ADD CONSTRAINT "Zona_pkey" PRIMARY KEY ("Codigo");
 <   ALTER TABLE ONLY public."Zona" DROP CONSTRAINT "Zona_pkey";
       public         postgres    false    210            L           1259    27382    fki_Dispositivo    INDEX     T   CREATE INDEX "fki_Dispositivo" ON public."Telefono" USING btree ("FK_Dispositivo");
 %   DROP INDEX public."fki_Dispositivo";
       public         postgres    false    239            9           1259    27572    fki_accede_sis    INDEX     P   CREATE INDEX fki_accede_sis ON public."Priv-Rol" USING btree ("FK_Accede_Sis");
 "   DROP INDEX public.fki_accede_sis;
       public         postgres    false    234            $           1259    27418    fki_adquiere_pa    INDEX     Q   CREATE INDEX fki_adquiere_pa ON public."Env-Rut" USING btree ("FK_Adquiere_Pa");
 #   DROP INDEX public.fki_adquiere_pa;
       public         postgres    false    229            -           1259    27472    fki_almacena    INDEX     K   CREATE INDEX fki_almacena ON public."Ofi-Paq" USING btree ("FK_Almacena");
     DROP INDEX public.fki_almacena;
       public         postgres    false    231            �           1259    27597    fki_asignado_puesto    INDEX     U   CREATE INDEX fki_asignado_puesto ON public."Rol" USING btree ("FK_Asignado_Puesto");
 '   DROP INDEX public.fki_asignado_puesto;
       public         postgres    false    212            �           1259    27591    fki_asignado_tipo    INDEX     Q   CREATE INDEX fki_asignado_tipo ON public."Rol" USING btree ("FK_Asignado_tipo");
 %   DROP INDEX public.fki_asignado_tipo;
       public         postgres    false    212            1           1259    27548    fki_asignar    INDEX     I   CREATE INDEX fki_asignar ON public."Emp-Zon" USING btree ("FK_Asignar");
    DROP INDEX public.fki_asignar;
       public         postgres    false    232            2           1259    27542 
   fki_asiste    INDEX     G   CREATE INDEX fki_asiste ON public."Emp-Zon" USING btree ("FK_Asiste");
    DROP INDEX public.fki_asiste;
       public         postgres    false    232            =           1259    27623    fki_asistencia    INDEX     O   CREATE INDEX fki_asistencia ON public."Emp-Hor" USING btree ("FK_Asistencia");
 "   DROP INDEX public.fki_asistencia;
       public         postgres    false    235                       1259    27260 
   fki_atraca    INDEX     G   CREATE INDEX fki_atraca ON public."Vma-Pue" USING btree ("FK_Atraca");
    DROP INDEX public.fki_atraca;
       public         postgres    false    225            �           1259    27617    fki_cada_uno    INDEX     K   CREATE INDEX fki_cada_uno ON public."Horario" USING btree ("FK_cada-uno");
     DROP INDEX public.fki_cada_uno;
       public         postgres    false    217            �           1259    27356    fki_calcula    INDEX     N   CREATE INDEX fki_calcula ON public."Contabilidad" USING btree ("FK_Calcula");
    DROP INDEX public.fki_calcula;
       public         postgres    false    206                       1259    27272 
   fki_camino    INDEX     G   CREATE INDEX fki_camino ON public."Ofi-Rut" USING btree ("FK_Camino");
    DROP INDEX public.fki_camino;
       public         postgres    false    227                       1259    27278    fki_camino2    INDEX     I   CREATE INDEX fki_camino2 ON public."Ofi-Rut" USING btree ("FK_Camino2");
    DROP INDEX public.fki_camino2;
       public         postgres    false    227                       1259    27284    fki_camino3    INDEX     I   CREATE INDEX fki_camino3 ON public."Ofi-Rut" USING btree ("FK_Camino3");
    DROP INDEX public.fki_camino3;
       public         postgres    false    227            �           1259    27412    fki_camino_ruta    INDEX     I   CREATE INDEX fki_camino_ruta ON public."Ruta" USING btree ("FK_Camino");
 #   DROP INDEX public.fki_camino_ruta;
       public         postgres    false    205            �           1259    27635    fki_cancela1    INDEX     H   CREATE INDEX fki_cancela1 ON public."Pago" USING btree ("FK_Cancela1");
     DROP INDEX public.fki_cancela1;
       public         postgres    false    218            �           1259    27641    fki_cancela2    INDEX     H   CREATE INDEX fki_cancela2 ON public."Pago" USING btree ("FK_Cancela2");
     DROP INDEX public.fki_cancela2;
       public         postgres    false    218            �           1259    27647    fki_cancela3    INDEX     H   CREATE INDEX fki_cancela3 ON public."Pago" USING btree ("FK_Cancela3");
     DROP INDEX public.fki_cancela3;
       public         postgres    false    218                       1259    27290    fki_chequear    INDEX     L   CREATE INDEX fki_chequear ON public."Veh-Tall" USING btree ("FK_Chequear");
     DROP INDEX public.fki_chequear;
       public         postgres    false    224            M           1259    27376    fki_comunicado    INDEX     P   CREATE INDEX fki_comunicado ON public."Telefono" USING btree ("FK_Comunicado");
 "   DROP INDEX public.fki_comunicado;
       public         postgres    false    239                        1259    27296 
   fki_conoce    INDEX     J   CREATE INDEX fki_conoce ON public."Tall-Per.C" USING btree ("FK_Conoce");
    DROP INDEX public.fki_conoce;
       public         postgres    false    228            �           1259    27213    fki_contiene    INDEX     J   CREATE INDEX fki_contiene ON public."Modelo" USING btree ("FK_Contiene");
     DROP INDEX public.fki_contiene;
       public         postgres    false    199            �           1259    27603 	   fki_costo    INDEX     B   CREATE INDEX fki_costo ON public."Pago" USING btree ("FK_Costo");
    DROP INDEX public.fki_costo;
       public         postgres    false    218            �           1259    27183    fki_cuentacon1    INDEX     U   CREATE INDEX fki_cuentacon1 ON public."Vehiculo_Aereo" USING btree ("FK_Cuentacon");
 "   DROP INDEX public.fki_cuentacon1;
       public         postgres    false    198            �           1259    27195    fki_cuentacon2    INDEX     X   CREATE INDEX fki_cuentacon2 ON public."Vehiculo_Maritimo" USING btree ("FK_Cuentacon");
 "   DROP INDEX public.fki_cuentacon2;
       public         postgres    false    197            �           1259    27207    fki_cuentacon3    INDEX     Y   CREATE INDEX fki_cuentacon3 ON public."Vehiculo_Terrestre" USING btree ("FK_Cuentacon");
 "   DROP INDEX public.fki_cuentacon3;
       public         postgres    false    196                       1259    27302    fki_desembarca    INDEX     O   CREATE INDEX fki_desembarca ON public."Vma-Pue" USING btree ("FK_Desembarca");
 "   DROP INDEX public.fki_desembarca;
       public         postgres    false    225            �           1259    27460    fki_destino    INDEX     G   CREATE INDEX fki_destino ON public."Envio" USING btree ("FK_Destino");
    DROP INDEX public.fki_destino;
       public         postgres    false    213            �           1259    27394    fki_dispone_con    INDEX     T   CREATE INDEX fki_dispone_con ON public."Aeropuerto" USING btree ("FK_Dispone_con");
 #   DROP INDEX public.fki_dispone_con;
       public         postgres    false    204            �           1259    27466 
   fki_divide    INDEX     D   CREATE INDEX fki_divide ON public."Zona" USING btree ("FK_Divide");
    DROP INDEX public.fki_divide;
       public         postgres    false    210            5           1259    27554    fki_encuentra_sta    INDEX     U   CREATE INDEX fki_encuentra_sta ON public."Env-Est" USING btree ("FK_Encuentra_Sta");
 %   DROP INDEX public.fki_encuentra_sta;
       public         postgres    false    233            �           1259    27508    fki_entrega    INDEX     I   CREATE INDEX fki_entrega ON public."Paquete" USING btree ("FK_Entrega");
    DROP INDEX public.fki_entrega;
       public         postgres    false    211                       1259    27248 
   fki_envia2    INDEX     I   CREATE INDEX fki_envia2 ON public."Veh-Tall" USING btree ("FK_Enviar2");
    DROP INDEX public.fki_envia2;
       public         postgres    false    224                       1259    27254 
   fki_envia3    INDEX     I   CREATE INDEX fki_envia3 ON public."Veh-Tall" USING btree ("FK_Enviar3");
    DROP INDEX public.fki_envia3;
       public         postgres    false    224                       1259    27237 
   fki_enviar    INDEX     H   CREATE INDEX fki_enviar ON public."Veh-Tall" USING btree ("FK_Enviar");
    DROP INDEX public.fki_enviar;
       public         postgres    false    224            �           1259    27514 	   fki_es_de    INDEX     B   CREATE INDEX fki_es_de ON public."Tipo" USING btree ("FK_Es_de");
    DROP INDEX public.fki_es_de;
       public         postgres    false    215                       1259    27308    fki_estaciona    INDEX     N   CREATE INDEX fki_estaciona ON public."Vea-Aero" USING btree ("FK_Estaciona");
 !   DROP INDEX public.fki_estaciona;
       public         postgres    false    226            (           1259    27478 	   fki_gasta    INDEX     E   CREATE INDEX fki_gasta ON public."Ofi-Ser" USING btree ("FK_Gasta");
    DROP INDEX public.fki_gasta;
       public         postgres    false    230                       1259    27266 
   fki_guarda    INDEX     H   CREATE INDEX fki_guarda ON public."Vea-Aero" USING btree ("FK_Guarda");
    DROP INDEX public.fki_guarda;
       public         postgres    false    226            G           1259    27454    fki_habitacion    INDEX     P   CREATE INDEX fki_habitacion ON public."Empleado" USING btree ("FK_Habitacion");
 "   DROP INDEX public.fki_habitacion;
       public         postgres    false    237            .           1259    27496 	   fki_llega    INDEX     E   CREATE INDEX fki_llega ON public."Ofi-Paq" USING btree ("FK_Llega");
    DROP INDEX public.fki_llega;
       public         postgres    false    231            �           1259    27320    fki_locacion    INDEX     J   CREATE INDEX fki_locacion ON public."Taller" USING btree ("FK_Locacion");
     DROP INDEX public.fki_locacion;
       public         postgres    false    202            �           1259    27442 	   fki_lugar    INDEX     C   CREATE INDEX fki_lugar ON public."Lugar" USING btree ("FK_Lugar");
    DROP INDEX public.fki_lugar;
       public         postgres    false    209            �           1259    27578    fki_observa    INDEX     K   CREATE INDEX fki_observa ON public."Auditoria" USING btree ("FK_Observa");
    DROP INDEX public.fki_observa;
       public         postgres    false    220                       1259    27350    fki_ofi_destino    INDEX     Q   CREATE INDEX fki_ofi_destino ON public."Ofi-Rut" USING btree ("FK_Ofi_Destino");
 #   DROP INDEX public.fki_ofi_destino;
       public         postgres    false    227                       1259    27344    fki_ofi_origen    INDEX     O   CREATE INDEX fki_ofi_origen ON public."Ofi-Rut" USING btree ("FK_Ofi_Origen");
 "   DROP INDEX public.fki_ofi_origen;
       public         postgres    false    227            )           1259    27490 
   fki_ofrece    INDEX     G   CREATE INDEX fki_ofrece ON public."Ofi-Ser" USING btree ("FK_Ofrece");
    DROP INDEX public.fki_ofrece;
       public         postgres    false    230            :           1259    27566 
   fki_opcion    INDEX     H   CREATE INDEX fki_opcion ON public."Priv-Rol" USING btree ("FK_Opcion");
    DROP INDEX public.fki_opcion;
       public         postgres    false    234            �           1259    27219    fki_origina    INDEX     G   CREATE INDEX fki_origina ON public."Falla" USING btree ("FK_Origina");
    DROP INDEX public.fki_origina;
       public         postgres    false    201            �           1259    27225    fki_origina2    INDEX     I   CREATE INDEX fki_origina2 ON public."Falla" USING btree ("FK_Origina2");
     DROP INDEX public.fki_origina2;
       public         postgres    false    201            �           1259    27231    fki_origina3    INDEX     I   CREATE INDEX fki_origina3 ON public."Falla" USING btree ("FK_Origina3");
     DROP INDEX public.fki_origina3;
       public         postgres    false    201            *           1259    27484    fki_pago    INDEX     C   CREATE INDEX fki_pago ON public."Ofi-Ser" USING btree ("FK_Pago");
    DROP INDEX public.fki_pago;
       public         postgres    false    230            N           1259    27430 	   fki_posee    INDEX     F   CREATE INDEX fki_posee ON public."Telefono" USING btree ("FK_Posee");
    DROP INDEX public.fki_posee;
       public         postgres    false    239            >           1259    27629    fki_recibe_emp    INDEX     O   CREATE INDEX fki_recibe_emp ON public."Emp-Hor" USING btree ("FK_Recibe_Emp");
 "   DROP INDEX public.fki_recibe_emp;
       public         postgres    false    235            %           1259    27424    fki_recorre    INDEX     I   CREATE INDEX fki_recorre ON public."Env-Rut" USING btree ("FK_Recorre");
    DROP INDEX public.fki_recorre;
       public         postgres    false    229            !           1259    27314    fki_referente    INDEX     P   CREATE INDEX fki_referente ON public."Tall-Per.C" USING btree ("FK_Referente");
 !   DROP INDEX public.fki_referente;
       public         postgres    false    228            �           1259    27177    fki_representa1    INDEX     W   CREATE INDEX fki_representa1 ON public."Vehiculo_Aereo" USING btree ("FK_Representa");
 #   DROP INDEX public.fki_representa1;
       public         postgres    false    198            �           1259    27189    fki_representa2    INDEX     Z   CREATE INDEX fki_representa2 ON public."Vehiculo_Maritimo" USING btree ("FK_Representa");
 #   DROP INDEX public.fki_representa2;
       public         postgres    false    197            �           1259    27201    fki_representa3    INDEX     [   CREATE INDEX fki_representa3 ON public."Vehiculo_Terrestre" USING btree ("FK_Representa");
 #   DROP INDEX public.fki_representa3;
       public         postgres    false    196            6           1259    27520    fki_revisa_sta    INDEX     O   CREATE INDEX fki_revisa_sta ON public."Env-Est" USING btree ("FK_Revisa_Sta");
 "   DROP INDEX public.fki_revisa_sta;
       public         postgres    false    233            �           1259    27560    fki_revision    INDEX     K   CREATE INDEX fki_revision ON public."Estatus" USING btree ("FK_Revision");
     DROP INDEX public.fki_revision;
       public         postgres    false    214            �           1259    27401    fki_ruta    INDEX     @   CREATE INDEX fki_ruta ON public."Ruta" USING btree ("FK_Ruta");
    DROP INDEX public.fki_ruta;
       public         postgres    false    205            �           1259    27364    fki_sede    INDEX     B   CREATE INDEX fki_sede ON public."Puerto" USING btree ("FK_Sede");
    DROP INDEX public.fki_sede;
       public         postgres    false    203            �           1259    27388 	   fki_sitio    INDEX     H   CREATE INDEX fki_sitio ON public."Aeropuerto" USING btree ("FK_Sitio");
    DROP INDEX public.fki_sitio;
       public         postgres    false    204            O           1259    27436    fki_telefonia    INDEX     N   CREATE INDEX fki_telefonia ON public."Telefono" USING btree ("FK_Telefonia");
 !   DROP INDEX public.fki_telefonia;
       public         postgres    false    239            �           1259    27370    fki_tiene_con    INDEX     L   CREATE INDEX fki_tiene_con ON public."Puerto" USING btree ("FK_Tiene_con");
 !   DROP INDEX public.fki_tiene_con;
       public         postgres    false    203            �           1259    27502    fki_transporta    INDEX     O   CREATE INDEX fki_transporta ON public."Paquete" USING btree ("FK_Transporta");
 "   DROP INDEX public.fki_transporta;
       public         postgres    false    211            �           1259    27448 
   fki_varios    INDEX     G   CREATE INDEX fki_varios ON public."Oficina" USING btree ("FK_Varios");
    DROP INDEX public.fki_varios;
       public         postgres    false    208            �           2606    27377    Telefono Dispositivo    FK CONSTRAINT     �   ALTER TABLE ONLY public."Telefono"
    ADD CONSTRAINT "Dispositivo" FOREIGN KEY ("FK_Dispositivo") REFERENCES public."Taller"("Codigo");
 B   ALTER TABLE ONLY public."Telefono" DROP CONSTRAINT "Dispositivo";
       public       postgres    false    239    202    2998            �           2606    27567    Priv-Rol accede_sis    FK CONSTRAINT     �   ALTER TABLE ONLY public."Priv-Rol"
    ADD CONSTRAINT accede_sis FOREIGN KEY ("FK_Accede_Sis") REFERENCES public."Rol"("Codigo");
 ?   ALTER TABLE ONLY public."Priv-Rol" DROP CONSTRAINT accede_sis;
       public       postgres    false    212    234    3033            �           2606    27413    Env-Rut adquiere_pa    FK CONSTRAINT     �   ALTER TABLE ONLY public."Env-Rut"
    ADD CONSTRAINT adquiere_pa FOREIGN KEY ("FK_Adquiere_Pa") REFERENCES public."Ruta"("Codigo");
 ?   ALTER TABLE ONLY public."Env-Rut" DROP CONSTRAINT adquiere_pa;
       public       postgres    false    205    229    3009            �           2606    27467    Ofi-Paq almacena    FK CONSTRAINT     �   ALTER TABLE ONLY public."Ofi-Paq"
    ADD CONSTRAINT almacena FOREIGN KEY ("FK_Almacena") REFERENCES public."Oficina"("Codigo");
 <   ALTER TABLE ONLY public."Ofi-Paq" DROP CONSTRAINT almacena;
       public       postgres    false    208    231    3020            i           2606    27592    Rol asignado_puesto    FK CONSTRAINT     �   ALTER TABLE ONLY public."Rol"
    ADD CONSTRAINT asignado_puesto FOREIGN KEY ("FK_Asignado_Puesto") REFERENCES public."Empleado"("Cedula");
 ?   ALTER TABLE ONLY public."Rol" DROP CONSTRAINT asignado_puesto;
       public       postgres    false    212    237    3140            h           2606    27586    Rol asignado_tipo    FK CONSTRAINT     �   ALTER TABLE ONLY public."Rol"
    ADD CONSTRAINT asignado_tipo FOREIGN KEY ("FK_Asignado_tipo") REFERENCES public."Cliente"("Cedula");
 =   ALTER TABLE ONLY public."Rol" DROP CONSTRAINT asignado_tipo;
       public       postgres    false    236    3136    212            �           2606    27543    Emp-Zon asignar    FK CONSTRAINT     �   ALTER TABLE ONLY public."Emp-Zon"
    ADD CONSTRAINT asignar FOREIGN KEY ("FK_Asignar") REFERENCES public."Empleado"("Cedula");
 ;   ALTER TABLE ONLY public."Emp-Zon" DROP CONSTRAINT asignar;
       public       postgres    false    3140    232    237            �           2606    27537    Emp-Zon asiste    FK CONSTRAINT     z   ALTER TABLE ONLY public."Emp-Zon"
    ADD CONSTRAINT asiste FOREIGN KEY ("FK_Asiste") REFERENCES public."Zona"("Codigo");
 :   ALTER TABLE ONLY public."Emp-Zon" DROP CONSTRAINT asiste;
       public       postgres    false    3026    232    210            �           2606    27618    Emp-Hor asistencia    FK CONSTRAINT     �   ALTER TABLE ONLY public."Emp-Hor"
    ADD CONSTRAINT asistencia FOREIGN KEY ("FK_Asistencia") REFERENCES public."Empleado"("Cedula");
 >   ALTER TABLE ONLY public."Emp-Hor" DROP CONSTRAINT asistencia;
       public       postgres    false    235    237    3140            z           2606    27255    Vma-Pue atraca    FK CONSTRAINT     �   ALTER TABLE ONLY public."Vma-Pue"
    ADD CONSTRAINT atraca FOREIGN KEY ("FK_Atraca") REFERENCES public."Vehiculo_Maritimo"("Placa");
 :   ALTER TABLE ONLY public."Vma-Pue" DROP CONSTRAINT atraca;
       public       postgres    false    225    2978    197            n           2606    27612    Horario cada_uno    FK CONSTRAINT     �   ALTER TABLE ONLY public."Horario"
    ADD CONSTRAINT cada_uno FOREIGN KEY ("FK_cada-uno") REFERENCES public."Empleado"("Cedula");
 <   ALTER TABLE ONLY public."Horario" DROP CONSTRAINT cada_uno;
       public       postgres    false    217    3140    237            b           2606    27351    Contabilidad calcula    FK CONSTRAINT     �   ALTER TABLE ONLY public."Contabilidad"
    ADD CONSTRAINT calcula FOREIGN KEY ("FK_Calcula") REFERENCES public."Envio"("Codigo");
 @   ALTER TABLE ONLY public."Contabilidad" DROP CONSTRAINT calcula;
       public       postgres    false    3037    213    206            ~           2606    27267    Ofi-Rut camino    FK CONSTRAINT     �   ALTER TABLE ONLY public."Ofi-Rut"
    ADD CONSTRAINT camino FOREIGN KEY ("FK_Camino") REFERENCES public."Vehiculo_Aereo"("Placa");
 :   ALTER TABLE ONLY public."Ofi-Rut" DROP CONSTRAINT camino;
       public       postgres    false    227    198    2984            `           2606    27402    Ruta camino    FK CONSTRAINT     x   ALTER TABLE ONLY public."Ruta"
    ADD CONSTRAINT camino FOREIGN KEY ("FK_Camino") REFERENCES public."Lugar"("Codigo");
 7   ALTER TABLE ONLY public."Ruta" DROP CONSTRAINT camino;
       public       postgres    false    3023    205    209                       2606    27273    Ofi-Rut camino2    FK CONSTRAINT     �   ALTER TABLE ONLY public."Ofi-Rut"
    ADD CONSTRAINT camino2 FOREIGN KEY ("FK_Camino2") REFERENCES public."Vehiculo_Maritimo"("Placa");
 ;   ALTER TABLE ONLY public."Ofi-Rut" DROP CONSTRAINT camino2;
       public       postgres    false    2978    197    227            �           2606    27279    Ofi-Rut camino3    FK CONSTRAINT     �   ALTER TABLE ONLY public."Ofi-Rut"
    ADD CONSTRAINT camino3 FOREIGN KEY ("FK_Camino3") REFERENCES public."Vehiculo_Terrestre"("Placa");
 ;   ALTER TABLE ONLY public."Ofi-Rut" DROP CONSTRAINT camino3;
       public       postgres    false    227    196    2970            a           2606    27407    Ruta camino_ruta    FK CONSTRAINT     }   ALTER TABLE ONLY public."Ruta"
    ADD CONSTRAINT camino_ruta FOREIGN KEY ("FK_Camino") REFERENCES public."Lugar"("Codigo");
 <   ALTER TABLE ONLY public."Ruta" DROP CONSTRAINT camino_ruta;
       public       postgres    false    3023    209    205            p           2606    27630    Pago cancela1    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pago"
    ADD CONSTRAINT cancela1 FOREIGN KEY ("FK_Cancela1") REFERENCES public."Tipo_Pago_Efectivo"("Codigo");
 9   ALTER TABLE ONLY public."Pago" DROP CONSTRAINT cancela1;
       public       postgres    false    3070    218    221            q           2606    27636    Pago cancela2    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pago"
    ADD CONSTRAINT cancela2 FOREIGN KEY ("FK_Cancela2") REFERENCES public."Tipo_Pago_Credit_Card"("Codigo");
 9   ALTER TABLE ONLY public."Pago" DROP CONSTRAINT cancela2;
       public       postgres    false    222    3072    218            r           2606    27642    Pago cancela3    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pago"
    ADD CONSTRAINT cancela3 FOREIGN KEY ("FK_Cancela3") REFERENCES public."Tipo_Pago_Cheque"("Codigo");
 9   ALTER TABLE ONLY public."Pago" DROP CONSTRAINT cancela3;
       public       postgres    false    223    3076    218            x           2606    27285    Veh-Tall chequear    FK CONSTRAINT     �   ALTER TABLE ONLY public."Veh-Tall"
    ADD CONSTRAINT chequear FOREIGN KEY ("FK_Chequear") REFERENCES public."Taller"("Codigo");
 =   ALTER TABLE ONLY public."Veh-Tall" DROP CONSTRAINT chequear;
       public       postgres    false    2998    224    202            �           2606    27371    Telefono comunicado    FK CONSTRAINT     �   ALTER TABLE ONLY public."Telefono"
    ADD CONSTRAINT comunicado FOREIGN KEY ("FK_Comunicado") REFERENCES public."Persona-Contacto"("CI");
 ?   ALTER TABLE ONLY public."Telefono" DROP CONSTRAINT comunicado;
       public       postgres    false    238    3145    239            �           2606    27291    Tall-Per.C conoce    FK CONSTRAINT        ALTER TABLE ONLY public."Tall-Per.C"
    ADD CONSTRAINT conoce FOREIGN KEY ("FK_Conoce") REFERENCES public."Taller"("Codigo");
 =   ALTER TABLE ONLY public."Tall-Per.C" DROP CONSTRAINT conoce;
       public       postgres    false    202    228    2998            V           2606    27208    Modelo contiene    FK CONSTRAINT     ~   ALTER TABLE ONLY public."Modelo"
    ADD CONSTRAINT contiene FOREIGN KEY ("FK_Contiene") REFERENCES public."Marca"("Codigo");
 ;   ALTER TABLE ONLY public."Modelo" DROP CONSTRAINT contiene;
       public       postgres    false    199    2991    200            o           2606    27598 
   Pago costo    FK CONSTRAINT     x   ALTER TABLE ONLY public."Pago"
    ADD CONSTRAINT costo FOREIGN KEY ("FK_Costo") REFERENCES public."Cliente"("Cedula");
 6   ALTER TABLE ONLY public."Pago" DROP CONSTRAINT costo;
       public       postgres    false    3136    236    218            U           2606    27178    Vehiculo_Aereo cuentacon1    FK CONSTRAINT     �   ALTER TABLE ONLY public."Vehiculo_Aereo"
    ADD CONSTRAINT cuentacon1 FOREIGN KEY ("FK_Cuentacon") REFERENCES public."Oficina"("Codigo");
 E   ALTER TABLE ONLY public."Vehiculo_Aereo" DROP CONSTRAINT cuentacon1;
       public       postgres    false    3020    198    208            S           2606    27190    Vehiculo_Maritimo cuentacon2    FK CONSTRAINT     �   ALTER TABLE ONLY public."Vehiculo_Maritimo"
    ADD CONSTRAINT cuentacon2 FOREIGN KEY ("FK_Cuentacon") REFERENCES public."Oficina"("Codigo");
 H   ALTER TABLE ONLY public."Vehiculo_Maritimo" DROP CONSTRAINT cuentacon2;
       public       postgres    false    197    3020    208            Q           2606    27202    Vehiculo_Terrestre cuentacon3    FK CONSTRAINT     �   ALTER TABLE ONLY public."Vehiculo_Terrestre"
    ADD CONSTRAINT cuentacon3 FOREIGN KEY ("FK_Cuentacon") REFERENCES public."Oficina"("Codigo");
 I   ALTER TABLE ONLY public."Vehiculo_Terrestre" DROP CONSTRAINT cuentacon3;
       public       postgres    false    3020    196    208            {           2606    27297    Vma-Pue desembarca    FK CONSTRAINT     �   ALTER TABLE ONLY public."Vma-Pue"
    ADD CONSTRAINT desembarca FOREIGN KEY ("FK_Desembarca") REFERENCES public."Puerto"("Codigo");
 >   ALTER TABLE ONLY public."Vma-Pue" DROP CONSTRAINT desembarca;
       public       postgres    false    203    225    3001            j           2606    27455    Envio destino    FK CONSTRAINT     {   ALTER TABLE ONLY public."Envio"
    ADD CONSTRAINT destino FOREIGN KEY ("FK_Destino") REFERENCES public."Lugar"("Codigo");
 9   ALTER TABLE ONLY public."Envio" DROP CONSTRAINT destino;
       public       postgres    false    209    213    3023            ^           2606    27389    Aeropuerto dispone_con    FK CONSTRAINT     �   ALTER TABLE ONLY public."Aeropuerto"
    ADD CONSTRAINT dispone_con FOREIGN KEY ("FK_Dispone_con") REFERENCES public."Oficina"("Codigo");
 B   ALTER TABLE ONLY public."Aeropuerto" DROP CONSTRAINT dispone_con;
       public       postgres    false    3020    208    204            e           2606    27461    Zona divide    FK CONSTRAINT     z   ALTER TABLE ONLY public."Zona"
    ADD CONSTRAINT divide FOREIGN KEY ("FK_Divide") REFERENCES public."Oficina"("Codigo");
 7   ALTER TABLE ONLY public."Zona" DROP CONSTRAINT divide;
       public       postgres    false    3020    210    208            �           2606    27549    Env-Est encuentra_sta    FK CONSTRAINT     �   ALTER TABLE ONLY public."Env-Est"
    ADD CONSTRAINT encuentra_sta FOREIGN KEY ("FK_Encuentra_Sta") REFERENCES public."Estatus"("Codigo");
 A   ALTER TABLE ONLY public."Env-Est" DROP CONSTRAINT encuentra_sta;
       public       postgres    false    3042    214    233            g           2606    27503    Paquete entrega    FK CONSTRAINT        ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT entrega FOREIGN KEY ("FK_Entrega") REFERENCES public."Cliente"("Cedula");
 ;   ALTER TABLE ONLY public."Paquete" DROP CONSTRAINT entrega;
       public       postgres    false    236    211    3136            v           2606    27243    Veh-Tall envia2    FK CONSTRAINT     �   ALTER TABLE ONLY public."Veh-Tall"
    ADD CONSTRAINT envia2 FOREIGN KEY ("FK_Enviar2") REFERENCES public."Vehiculo_Maritimo"("Placa");
 ;   ALTER TABLE ONLY public."Veh-Tall" DROP CONSTRAINT envia2;
       public       postgres    false    224    2978    197            w           2606    27249    Veh-Tall envia3    FK CONSTRAINT     �   ALTER TABLE ONLY public."Veh-Tall"
    ADD CONSTRAINT envia3 FOREIGN KEY ("FK_Enviar3") REFERENCES public."Vehiculo_Terrestre"("Placa");
 ;   ALTER TABLE ONLY public."Veh-Tall" DROP CONSTRAINT envia3;
       public       postgres    false    196    2970    224            u           2606    27232    Veh-Tall enviar    FK CONSTRAINT     �   ALTER TABLE ONLY public."Veh-Tall"
    ADD CONSTRAINT enviar FOREIGN KEY ("FK_Enviar") REFERENCES public."Vehiculo_Aereo"("Placa");
 ;   ALTER TABLE ONLY public."Veh-Tall" DROP CONSTRAINT enviar;
       public       postgres    false    224    2984    198            m           2606    27509 
   Tipo es_de    FK CONSTRAINT     }   ALTER TABLE ONLY public."Tipo"
    ADD CONSTRAINT es_de FOREIGN KEY ("FK_Es_de") REFERENCES public."Paquete"("Numero_guia");
 6   ALTER TABLE ONLY public."Tipo" DROP CONSTRAINT es_de;
       public       postgres    false    3029    215    211            }           2606    27303    Vea-Aero estaciona    FK CONSTRAINT     �   ALTER TABLE ONLY public."Vea-Aero"
    ADD CONSTRAINT estaciona FOREIGN KEY ("FK_Estaciona") REFERENCES public."Aeropuerto"("Codigo");
 >   ALTER TABLE ONLY public."Vea-Aero" DROP CONSTRAINT estaciona;
       public       postgres    false    204    226    3005            �           2606    27473    Ofi-Ser gasta    FK CONSTRAINT     {   ALTER TABLE ONLY public."Ofi-Ser"
    ADD CONSTRAINT gasta FOREIGN KEY ("FK_Gasta") REFERENCES public."Oficina"("Codigo");
 9   ALTER TABLE ONLY public."Ofi-Ser" DROP CONSTRAINT gasta;
       public       postgres    false    208    3020    230            |           2606    27261    Vea-Aero guarda    FK CONSTRAINT     �   ALTER TABLE ONLY public."Vea-Aero"
    ADD CONSTRAINT guarda FOREIGN KEY ("FK_Guarda") REFERENCES public."Vehiculo_Aereo"("Placa");
 ;   ALTER TABLE ONLY public."Vea-Aero" DROP CONSTRAINT guarda;
       public       postgres    false    198    226    2984            �           2606    27449    Empleado habitacion    FK CONSTRAINT     �   ALTER TABLE ONLY public."Empleado"
    ADD CONSTRAINT habitacion FOREIGN KEY ("FK_Habitacion") REFERENCES public."Lugar"("Codigo");
 ?   ALTER TABLE ONLY public."Empleado" DROP CONSTRAINT habitacion;
       public       postgres    false    237    3023    209            �           2606    27491    Ofi-Paq llega    FK CONSTRAINT     �   ALTER TABLE ONLY public."Ofi-Paq"
    ADD CONSTRAINT llega FOREIGN KEY ("FK_Llega") REFERENCES public."Paquete"("Numero_guia");
 9   ALTER TABLE ONLY public."Ofi-Paq" DROP CONSTRAINT llega;
       public       postgres    false    211    3029    231            Z           2606    27315    Taller locacion    FK CONSTRAINT     ~   ALTER TABLE ONLY public."Taller"
    ADD CONSTRAINT locacion FOREIGN KEY ("FK_Locacion") REFERENCES public."Lugar"("Codigo");
 ;   ALTER TABLE ONLY public."Taller" DROP CONSTRAINT locacion;
       public       postgres    false    3023    202    209            d           2606    27437    Lugar lugar    FK CONSTRAINT     w   ALTER TABLE ONLY public."Lugar"
    ADD CONSTRAINT lugar FOREIGN KEY ("FK_Lugar") REFERENCES public."Lugar"("Codigo");
 7   ALTER TABLE ONLY public."Lugar" DROP CONSTRAINT lugar;
       public       postgres    false    209    3023    209            t           2606    27573    Auditoria observa    FK CONSTRAINT     �   ALTER TABLE ONLY public."Auditoria"
    ADD CONSTRAINT observa FOREIGN KEY ("FK_Observa") REFERENCES public."Usuario"("Codigo");
 =   ALTER TABLE ONLY public."Auditoria" DROP CONSTRAINT observa;
       public       postgres    false    220    3065    219            �           2606    27345    Ofi-Rut ofi_destino    FK CONSTRAINT     �   ALTER TABLE ONLY public."Ofi-Rut"
    ADD CONSTRAINT ofi_destino FOREIGN KEY ("FK_Ofi_Destino") REFERENCES public."Oficina"("Codigo");
 ?   ALTER TABLE ONLY public."Ofi-Rut" DROP CONSTRAINT ofi_destino;
       public       postgres    false    208    227    3020            �           2606    27339    Ofi-Rut ofi_origen    FK CONSTRAINT     �   ALTER TABLE ONLY public."Ofi-Rut"
    ADD CONSTRAINT ofi_origen FOREIGN KEY ("FK_Ofi_Origen") REFERENCES public."Ruta"("Codigo");
 >   ALTER TABLE ONLY public."Ofi-Rut" DROP CONSTRAINT ofi_origen;
       public       postgres    false    205    227    3009            �           2606    27485    Ofi-Ser ofrece    FK CONSTRAINT     ~   ALTER TABLE ONLY public."Ofi-Ser"
    ADD CONSTRAINT ofrece FOREIGN KEY ("FK_Ofrece") REFERENCES public."Servicio"("Codigo");
 :   ALTER TABLE ONLY public."Ofi-Ser" DROP CONSTRAINT ofrece;
       public       postgres    false    3018    230    207            �           2606    27561    Priv-Rol opcion    FK CONSTRAINT     �   ALTER TABLE ONLY public."Priv-Rol"
    ADD CONSTRAINT opcion FOREIGN KEY ("FK_Opcion") REFERENCES public."Privilegio"("Codigo");
 ;   ALTER TABLE ONLY public."Priv-Rol" DROP CONSTRAINT opcion;
       public       postgres    false    3048    234    216            W           2606    27214    Falla origina    FK CONSTRAINT     �   ALTER TABLE ONLY public."Falla"
    ADD CONSTRAINT origina FOREIGN KEY ("FK_Origina") REFERENCES public."Vehiculo_Aereo"("Placa");
 9   ALTER TABLE ONLY public."Falla" DROP CONSTRAINT origina;
       public       postgres    false    201    2984    198            X           2606    27220    Falla origina2    FK CONSTRAINT     �   ALTER TABLE ONLY public."Falla"
    ADD CONSTRAINT origina2 FOREIGN KEY ("FK_Origina2") REFERENCES public."Vehiculo_Maritimo"("Placa");
 :   ALTER TABLE ONLY public."Falla" DROP CONSTRAINT origina2;
       public       postgres    false    197    2978    201            Y           2606    27226    Falla origina3    FK CONSTRAINT     �   ALTER TABLE ONLY public."Falla"
    ADD CONSTRAINT origina3 FOREIGN KEY ("FK_Origina3") REFERENCES public."Vehiculo_Terrestre"("Placa");
 :   ALTER TABLE ONLY public."Falla" DROP CONSTRAINT origina3;
       public       postgres    false    196    2970    201            �           2606    27479    Ofi-Ser pago    FK CONSTRAINT     z   ALTER TABLE ONLY public."Ofi-Ser"
    ADD CONSTRAINT pago FOREIGN KEY ("FK_Pago") REFERENCES public."Servicio"("Codigo");
 8   ALTER TABLE ONLY public."Ofi-Ser" DROP CONSTRAINT pago;
       public       postgres    false    207    3018    230            �           2606    27425    Telefono posee    FK CONSTRAINT     }   ALTER TABLE ONLY public."Telefono"
    ADD CONSTRAINT posee FOREIGN KEY ("FK_Posee") REFERENCES public."Empleado"("Cedula");
 :   ALTER TABLE ONLY public."Telefono" DROP CONSTRAINT posee;
       public       postgres    false    3140    239    237            k           2606    27532    Envio realiza    FK CONSTRAINT     �   ALTER TABLE ONLY public."Envio"
    ADD CONSTRAINT realiza FOREIGN KEY ("FK_Realiza") REFERENCES public."Pago"("Numero_unico");
 9   ALTER TABLE ONLY public."Envio" DROP CONSTRAINT realiza;
       public       postgres    false    3053    213    218            �           2606    27624    Emp-Hor recibe_emp    FK CONSTRAINT     �   ALTER TABLE ONLY public."Emp-Hor"
    ADD CONSTRAINT recibe_emp FOREIGN KEY ("FK_Recibe_Emp") REFERENCES public."Horario"("Codigo");
 >   ALTER TABLE ONLY public."Emp-Hor" DROP CONSTRAINT recibe_emp;
       public       postgres    false    3050    235    217            �           2606    27419    Env-Rut recorre    FK CONSTRAINT     }   ALTER TABLE ONLY public."Env-Rut"
    ADD CONSTRAINT recorre FOREIGN KEY ("FK_Recorre") REFERENCES public."Envio"("Codigo");
 ;   ALTER TABLE ONLY public."Env-Rut" DROP CONSTRAINT recorre;
       public       postgres    false    229    213    3037            �           2606    27309    Tall-Per.C referente    FK CONSTRAINT     �   ALTER TABLE ONLY public."Tall-Per.C"
    ADD CONSTRAINT referente FOREIGN KEY ("FK_Referente") REFERENCES public."Persona-Contacto"("CI");
 @   ALTER TABLE ONLY public."Tall-Per.C" DROP CONSTRAINT referente;
       public       postgres    false    238    228    3145            y           2606    27329    Veh-Tall refleja    FK CONSTRAINT     �   ALTER TABLE ONLY public."Veh-Tall"
    ADD CONSTRAINT refleja FOREIGN KEY ("FK_Refleja") REFERENCES public."Contabilidad"("Codigo");
 <   ALTER TABLE ONLY public."Veh-Tall" DROP CONSTRAINT refleja;
       public       postgres    false    206    224    3013            T           2606    27172    Vehiculo_Aereo representa1    FK CONSTRAINT     �   ALTER TABLE ONLY public."Vehiculo_Aereo"
    ADD CONSTRAINT representa1 FOREIGN KEY ("FK_Representa") REFERENCES public."Modelo"("Codigo");
 F   ALTER TABLE ONLY public."Vehiculo_Aereo" DROP CONSTRAINT representa1;
       public       postgres    false    2988    199    198            R           2606    27184    Vehiculo_Maritimo representa2    FK CONSTRAINT     �   ALTER TABLE ONLY public."Vehiculo_Maritimo"
    ADD CONSTRAINT representa2 FOREIGN KEY ("FK_Representa") REFERENCES public."Modelo"("Codigo");
 I   ALTER TABLE ONLY public."Vehiculo_Maritimo" DROP CONSTRAINT representa2;
       public       postgres    false    197    199    2988            P           2606    27196    Vehiculo_Terrestre representa3    FK CONSTRAINT     �   ALTER TABLE ONLY public."Vehiculo_Terrestre"
    ADD CONSTRAINT representa3 FOREIGN KEY ("FK_Representa") REFERENCES public."Modelo"("Codigo");
 J   ALTER TABLE ONLY public."Vehiculo_Terrestre" DROP CONSTRAINT representa3;
       public       postgres    false    196    2988    199            �           2606    27515    Env-Est revisa_sta    FK CONSTRAINT     �   ALTER TABLE ONLY public."Env-Est"
    ADD CONSTRAINT revisa_sta FOREIGN KEY ("FK_Revisa_Sta") REFERENCES public."Envio"("Codigo");
 >   ALTER TABLE ONLY public."Env-Est" DROP CONSTRAINT revisa_sta;
       public       postgres    false    3037    233    213            l           2606    27555    Estatus revision    FK CONSTRAINT     �   ALTER TABLE ONLY public."Estatus"
    ADD CONSTRAINT revision FOREIGN KEY ("FK_Revision") REFERENCES public."Empleado"("Cedula");
 <   ALTER TABLE ONLY public."Estatus" DROP CONSTRAINT revision;
       public       postgres    false    237    3140    214            _           2606    27396 	   Ruta ruta    FK CONSTRAINT     s   ALTER TABLE ONLY public."Ruta"
    ADD CONSTRAINT ruta FOREIGN KEY ("FK_Ruta") REFERENCES public."Ruta"("Codigo");
 5   ALTER TABLE ONLY public."Ruta" DROP CONSTRAINT ruta;
       public       postgres    false    205    205    3009            [           2606    27359    Puerto sede    FK CONSTRAINT     v   ALTER TABLE ONLY public."Puerto"
    ADD CONSTRAINT sede FOREIGN KEY ("FK_Sede") REFERENCES public."Lugar"("Codigo");
 7   ALTER TABLE ONLY public."Puerto" DROP CONSTRAINT sede;
       public       postgres    false    3023    209    203            s           2606    27581    Usuario sele_concede    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT sele_concede FOREIGN KEY ("FK_Sele_Concede") REFERENCES public."Rol"("Codigo");
 @   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT sele_concede;
       public       postgres    false    212    219    3033            ]           2606    27383    Aeropuerto sitio    FK CONSTRAINT     |   ALTER TABLE ONLY public."Aeropuerto"
    ADD CONSTRAINT sitio FOREIGN KEY ("FK_Sitio") REFERENCES public."Lugar"("Codigo");
 <   ALTER TABLE ONLY public."Aeropuerto" DROP CONSTRAINT sitio;
       public       postgres    false    204    209    3023            �           2606    27431    Telefono telefonia    FK CONSTRAINT     �   ALTER TABLE ONLY public."Telefono"
    ADD CONSTRAINT telefonia FOREIGN KEY ("FK_Telefonia") REFERENCES public."Oficina"("Codigo");
 >   ALTER TABLE ONLY public."Telefono" DROP CONSTRAINT telefonia;
       public       postgres    false    239    3020    208            \           2606    27365    Puerto tiene_con    FK CONSTRAINT     �   ALTER TABLE ONLY public."Puerto"
    ADD CONSTRAINT tiene_con FOREIGN KEY ("FK_Tiene_con") REFERENCES public."Oficina"("Codigo");
 <   ALTER TABLE ONLY public."Puerto" DROP CONSTRAINT tiene_con;
       public       postgres    false    203    3020    208            f           2606    27497    Paquete transporta    FK CONSTRAINT     �   ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT transporta FOREIGN KEY ("FK_Transporta") REFERENCES public."Envio"("Codigo");
 >   ALTER TABLE ONLY public."Paquete" DROP CONSTRAINT transporta;
       public       postgres    false    213    211    3037            c           2606    27443    Oficina varios    FK CONSTRAINT     {   ALTER TABLE ONLY public."Oficina"
    ADD CONSTRAINT varios FOREIGN KEY ("FK_Varios") REFERENCES public."Lugar"("Codigo");
 :   ALTER TABLE ONLY public."Oficina" DROP CONSTRAINT varios;
       public       postgres    false    3023    208    209                  x������ � �      *      x������ � �      :      x������ � �            x������ � �      9      x������ � �      6      x������ � �      ;      x������ � �      7      x������ � �      3      x������ � �      #      x������ � �      $      x������ � �            x������ � �      '      x������ � �            x������ � �            x������ � �            x������ � �      5      x������ � �      1      x������ � �      4      x������ � �            x������ � �      (      x������ � �      !      x������ � �      <      x������ � �      8      x������ � �      &      x������ � �            x������ � �      "      x������ � �            x������ � �            x������ � �      2      x������ � �            x������ � �      =      x������ � �      %      x������ � �      -      x������ � �      ,      x������ � �      +      x������ � �      )      x������ � �      0      x������ � �      .      x������ � �            x������ � �            x������ � �            x������ � �      /      x������ � �             x������ � �     