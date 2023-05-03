--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.6
-- Dumped by pg_dump version 9.5.0

-- Started on 2016-07-29 16:48:43

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 179 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2048 (class 0 OID 0)
-- Dependencies: 179
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 172 (class 1259 OID 17095)
-- Name: articulos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE articulos (
    codart character varying(8) NOT NULL,
    descrip character varying(40) NOT NULL,
    precio numeric(7,2) NOT NULL,
    stock numeric(6,0),
    stock_min numeric(6,0),
    dto numeric(2,0)
);


ALTER TABLE articulos OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 17098)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

    CREATE TABLE clientes (
        codcli numeric(5,0) NOT NULL,
        nombre character varying(50) NOT NULL,
        direccion character varying(50) NOT NULL,
        codpostal character varying(5),
        codpue character varying(5) NOT NULL
    );


    ALTER TABLE clientes OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 17101)
-- Name: facturas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE facturas (
    codfac numeric(6,0) NOT NULL,
    fecha date NOT NULL,
    codcli numeric(5,0),
    codven numeric(5,0),
    iva numeric(2,0),
    dto numeric(2,0)
);


ALTER TABLE facturas OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 17104)
-- Name: lineas_fac; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE lineas_fac (
    codfac numeric(6,0) NOT NULL,
    linea numeric(2,0) NOT NULL,
    cant numeric(5,0) NOT NULL,
    codart character varying(8) NOT NULL,
    precio numeric(7,2) NOT NULL,
    dto numeric(2,0)
);


ALTER TABLE lineas_fac OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 17107)
-- Name: provincias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE provincias (
    codpro character varying(2) NOT NULL,
    nombre character varying(30) NOT NULL
);


ALTER TABLE provincias OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 17110)
-- Name: pueblos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pueblos (
    codpue character varying(5) NOT NULL,
    nombre character varying(40) NOT NULL,
    codpro character varying(2) NOT NULL
);


ALTER TABLE pueblos OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 17113)
-- Name: vendedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE vendedores (
    codven numeric(5,0) NOT NULL,
    nombre character varying(50) NOT NULL,
    direccion character varying(50) NOT NULL,
    codpostal character varying(5),
    codpue character varying(5) NOT NULL,
    codjefe numeric(5,0)
);


ALTER TABLE vendedores OWNER TO postgres;

--
-- TOC entry 2034 (class 0 OID 17095)
-- Dependencies: 172
-- Data for Name: articulos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO articulos VALUES ('L85546', 'Tecla difusores legrand bronce', 1.05, 13, 5, 5);
INSERT INTO articulos VALUES ('N5072', 'Pulsador luz piloto Niessen trazo', 1.33, 11, 2, NULL);
INSERT INTO articulos VALUES ('P605', 'Caja 1 elem. plastimetal', 1.65, 16, 9, NULL);
INSERT INTO articulos VALUES ('TFM16', 'Curva tubo hierro 11', 0.33, 23, 13, NULL);
INSERT INTO articulos VALUES ('TH11', 'Curva tubo hierro 29', 1.42, 20, 3, NULL);
INSERT INTO articulos VALUES ('REF1X20', 'Regleta fluorescente 1x36 bajo F', 8.71, 10, 1, NULL);
INSERT INTO articulos VALUES ('S3165136', 'Bloque emergencia Satf 150 L', 4.81, 60, 3, NULL);
INSERT INTO articulos VALUES ('T4501', 'Tubo empotrar 100', 2.98, 40, 5, NULL);
INSERT INTO articulos VALUES ('TE7200', 'Doble conmutador Bjc Ibiza blanco', 13.22, 100, 1, NULL);
INSERT INTO articulos VALUES ('THC21', 'Placa mural Felmax', 1.56, 10, 1, NULL);
INSERT INTO articulos VALUES ('ZNCL', 'Base T,t lateral Ticino S, Tekne', 41.71, 12, 1, 10);
INSERT INTO articulos VALUES ('P695', 'Interruptor rotura brusca 100 A M', 13.22, 123, 1, NULL);
INSERT INTO articulos VALUES ('P924', 'Interruptor marrón dec. con visor', 2.39, 868, 3, NULL);
INSERT INTO articulos VALUES ('ME200', 'Marco Bjc Ibiza 2 elementos', 13.52, 87, 1, NULL);
INSERT INTO articulos VALUES ('L92119', 'Portalámparas 14 curvo', 5.98, 23, 1, NULL);
INSERT INTO articulos VALUES ('L85459', 'Tecla legrand marfil', 2.80, 19, 4, NULL);
INSERT INTO articulos VALUES ('im4P10L', 'Interruptor magnetotérmico 4p, 4', 32.60, 98, 1, 15);
INSERT INTO articulos VALUES ('IM3P32V', 'Interruptor magnetotérmico 4p, 2', 27.01, 187, 1, NULL);
INSERT INTO articulos VALUES ('L17055', 'Bases de fusible cuchillas T3', 7.99, 39, 3, NULL);
INSERT INTO articulos VALUES ('L76424', 'Placa 2 E. legrand serie mosaic', 2.90, 58, 2, NULL);
INSERT INTO articulos VALUES ('L14340', 'Bases de fusibles cuchillas T0', 0.51, 32, 3, NULL);
INSERT INTO articulos VALUES ('N8017BA', 'Reloj Orbis con reserva de cuerda', 3.40, 17, 4, NULL);


--
-- TOC entry 2035 (class 0 OID 17098)
-- Dependencies: 173
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO clientes VALUES (333, 'Sos Carretero, Jesús', 'Mosen Compte, 14', '12964', '53596');
INSERT INTO clientes VALUES (336, 'Miguel Archilés, Ramón', 'Bernardo Mundina, 132-5', '12652', '07766');
INSERT INTO clientes VALUES (342, 'Pinel Huerta, Vicente', 'Francisco Sempere, 37-10', '12112', '07766');
INSERT INTO clientes VALUES (345, 'López Botella, Mauro', 'Avenida del Puerto, 20-1', '12010', '12309');
INSERT INTO clientes VALUES (348, 'Palau Martínez, Jorge', 'Raval de Sant Josep, 97-2', '12003', '12309');
INSERT INTO clientes VALUES (354, 'Murría Vinaiza, José', 'Ciudadela, 90-18', '12003', '12309');
INSERT INTO clientes VALUES (357, 'Huguet Peris, Juan Ángel', 'Calle Mestre Rodrigo, 7', '12100', '12309');
INSERT INTO clientes VALUES (343, 'Lamar L. Salazar', 'Apartado núm.: 777, 6836 Vestibulum. ', '69454', '63721');
INSERT INTO clientes VALUES (620, 'Neil B. Hendricks', 'Apartado núm.: 569, 4581 Accumsan Av.', '56649', '24354');
INSERT INTO clientes VALUES (321, 'James U. Ryan', 'Apdo.:670-2803 Vel C.', '60757', '84295');
INSERT INTO clientes VALUES (850, 'Paula M. Conway', '4257 Ligula. Carretera', '53052', '36925');
INSERT INTO clientes VALUES (89, 'Tamekah P. Fletcher', 'Apartado núm.: 725, 7843 Leo. C/', '92666', '16394');
INSERT INTO clientes VALUES (947, 'Linus K. Lee', 'Apdo.:337-9908 Ultrices Avenida', '89888', '78524');
INSERT INTO clientes VALUES (716, 'Jack Q. Foley', 'Apdo.:905-1318 Pharetra. Calle', '87245', '07149');
INSERT INTO clientes VALUES (834, 'Alika K. Goff', 'Apartado núm.: 478, 8606 Nisi Avda.', '43181', '48619');
INSERT INTO clientes VALUES (572, 'Dana Q. Alvarez', 'Apartado núm.: 443, 7765 Nulla ', '16991', '51985');
INSERT INTO clientes VALUES (959, 'Christian T. Mcbride', 'Apartado núm.: 283, 359 Erat Carretera', '29917', '46332');


--
-- TOC entry 2036 (class 0 OID 17101)
-- Dependencies: 174
-- Data for Name: facturas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO facturas VALUES (6643, '2010-07-16', 333, 105, 18, 10);
INSERT INTO facturas VALUES (6645, '2010-07-16', 336, 105, 0, 20);
INSERT INTO facturas VALUES (6654, '2010-07-31', 357, 155, 8, 0);
INSERT INTO facturas VALUES (6659, '2010-08-08', 342, 5, 0, 0);
INSERT INTO facturas VALUES (6680, '2010-09-10', 348, 455, 8, 0);
INSERT INTO facturas VALUES (6723, '2010-11-06', 342, 5, 18, 0);
INSERT INTO facturas VALUES (6742, '2010-12-17', 333, 105, 8, 20);
INSERT INTO facturas VALUES (8647, '2012-01-04', 850, 155, 16, 15);
INSERT INTO facturas VALUES (5224, '2010-10-10', 342, 5, NULL, 10);
INSERT INTO facturas VALUES (1362, '2014-10-06', 348, 155, NULL, NULL);
INSERT INTO facturas VALUES (1808, '2012-12-21', 321, 5, 16, NULL);
INSERT INTO facturas VALUES (2868, '2011-12-11', 89, 455, NULL, 20);
INSERT INTO facturas VALUES (6749, '2015-07-14', 716, 5, 8, NULL);
INSERT INTO facturas VALUES (1343, '2014-02-07', 716, 155, NULL, NULL);
INSERT INTO facturas VALUES (1978, '2011-09-12', 572, 155, 8, 15);
INSERT INTO facturas VALUES (8159, '2012-10-27', 336, 5, NULL, NULL);
INSERT INTO facturas VALUES (2259, '2017-06-19', 572, 455, 18, NULL);
INSERT INTO facturas VALUES (5968, '2014-05-26', 947, 105, 18, 20);
INSERT INTO facturas VALUES (9953, '2014-07-20', 716, 5, 6, 15);
INSERT INTO facturas VALUES (2318, '2017-02-28', 620, 105, NULL, NULL);
INSERT INTO facturas VALUES (4359, '2014-09-16', 572, 5, 8, 10);
INSERT INTO facturas VALUES (1786, '2014-07-30', 357, 105, NULL, NULL);
INSERT INTO facturas VALUES (7306, '2016-02-22', 620, 105, 16, NULL);
INSERT INTO facturas VALUES (7375, '2017-04-07', 716, 105, NULL, 15);
INSERT INTO facturas VALUES (5875, '2010-11-01', 834, 5, NULL, 5);
INSERT INTO facturas VALUES (3529, '2014-11-17', 834, 155, 6, NULL);
INSERT INTO facturas VALUES (5375, '2013-04-11', 620, 105, NULL, 15);
INSERT INTO facturas VALUES (8484, '2012-01-29', 345, 455, NULL, 10);
INSERT INTO facturas VALUES (8536, '2016-03-02', 959, 5, 6, 20);
INSERT INTO facturas VALUES (4734, '2016-06-04', 834, 105, NULL, 5);
INSERT INTO facturas VALUES (6701, '2017-06-11', 620, 155, 6, 20);
INSERT INTO facturas VALUES (1535, '2010-11-06', 834, 105, NULL, NULL);
INSERT INTO facturas VALUES (6491, '2013-09-23', 850, 455, NULL, 20);
INSERT INTO facturas VALUES (3627, '2016-08-06', 345, 455, 18, 20);
INSERT INTO facturas VALUES (2519, '2011-10-21', 342, 5, 6, 5);
INSERT INTO facturas VALUES (2429, '2014-11-13', 345, 455, 18, NULL);
INSERT INTO facturas VALUES (4784, '2012-09-19', 959, 5, NULL, NULL);
INSERT INTO facturas VALUES (8609, '2016-08-17', 343, 455, 18, 5);
INSERT INTO facturas VALUES (2316, '2014-02-21', 572, 105, NULL, 5);
INSERT INTO facturas VALUES (2852, '2011-01-03', 620, 105, 16, 10);
INSERT INTO facturas VALUES (5935, '2011-07-12', 620, 155, NULL, NULL);
INSERT INTO facturas VALUES (1663, '2011-03-02', 321, 155, NULL, 5);
INSERT INTO facturas VALUES (8888, '2013-01-28', 620, 105, 18, NULL);
INSERT INTO facturas VALUES (2567, '2010-11-23', 572, 155, 18, NULL);
INSERT INTO facturas VALUES (6579, '2015-12-08', 834, 155, NULL, 15);
INSERT INTO facturas VALUES (6423, '2012-02-07', 345, 5, NULL, 5);
INSERT INTO facturas VALUES (9516, '2015-03-17', 342, 105, 8, 5);
INSERT INTO facturas VALUES (4927, '2011-10-21', 834, 155, 16, 15);
INSERT INTO facturas VALUES (1631, '2010-12-09', 620, 5, 6, 5);
INSERT INTO facturas VALUES (9175, '2013-01-03', 345, 105, NULL, 5);
INSERT INTO facturas VALUES (9149, '2016-02-15', 89, 455, NULL, NULL);
INSERT INTO facturas VALUES (7561, '2011-01-14', 336, 5, NULL, 5);
INSERT INTO facturas VALUES (5904, '2012-01-27', 89, 105, 6, 20);
INSERT INTO facturas VALUES (1103, '2017-05-12', 620, 5, 16, 10);
INSERT INTO facturas VALUES (8842, '2015-07-16', 345, 105, 8, 10);
INSERT INTO facturas VALUES (5906, '2017-06-02', 357, 455, 6, NULL);
INSERT INTO facturas VALUES (5181, '2016-12-11', 336, 5, NULL, 10);


--
-- TOC entry 2037 (class 0 OID 17104)
-- Dependencies: 175
-- Data for Name: lineas_fac; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO lineas_fac VALUES (6643, 1, 6, 'L14340', 0.51, 20);
INSERT INTO lineas_fac VALUES (6643, 2, 1, 'N5072', 1.33, 0);
INSERT INTO lineas_fac VALUES (6643, 3, 2, 'P695', 13.22, 0);
INSERT INTO lineas_fac VALUES (6645, 1, 10, 'ZNCL', 41.71, 0);
INSERT INTO lineas_fac VALUES (6645, 2, 6, 'N8017BA', 3.40, 0);
INSERT INTO lineas_fac VALUES (6645, 3, 3, 'TE7200', 13.22, 0);
INSERT INTO lineas_fac VALUES (6645, 4, 4, 'L92119', 5.98, 0);
INSERT INTO lineas_fac VALUES (6654, 1, 6, 'REF1X20', 8.71, 50);
INSERT INTO lineas_fac VALUES (6659, 1, 8, 'THC21', 1.56, 0);
INSERT INTO lineas_fac VALUES (6659, 2, 12, 'L17055', 7.99, 25);
INSERT INTO lineas_fac VALUES (6659, 3, 9, 'L76424', 2.90, 25);
INSERT INTO lineas_fac VALUES (6680, 1, 12, 'T4501', 2.98, 0);
INSERT INTO lineas_fac VALUES (6680, 2, 11, 'im4P10L', 32.60, 0);
INSERT INTO lineas_fac VALUES (6723, 1, 5, 'L85459', 2.80, 5);
INSERT INTO lineas_fac VALUES (6742, 1, 9, 'ME200', 13.52, 0);
INSERT INTO lineas_fac VALUES (6742, 2, 8, 'S3165136', 4.81, 5);
INSERT INTO lineas_fac VALUES (6579, 1, 14, 'ME200', 3.41, NULL);
INSERT INTO lineas_fac VALUES (4359, 2, 9, 'THC21', 0.41, NULL);
INSERT INTO lineas_fac VALUES (8647, 4, 15, 'TH11', 9.74, 10);
INSERT INTO lineas_fac VALUES (5906, 5, 14, 'T4501', 5.40, 20);
INSERT INTO lineas_fac VALUES (2852, 6, 12, 'L76424', 5.85, NULL);
INSERT INTO lineas_fac VALUES (4927, 7, 11, 'T4501', 4.35, NULL);
INSERT INTO lineas_fac VALUES (8647, 8, 5, 'N8017BA', 3.26, NULL);
INSERT INTO lineas_fac VALUES (2868, 9, 19, 'TE7200', 7.00, NULL);
INSERT INTO lineas_fac VALUES (2852, 10, 6, 'P924', 1.22, NULL);
INSERT INTO lineas_fac VALUES (8159, 11, 3, 'S3165136', 8.21, NULL);
INSERT INTO lineas_fac VALUES (2318, 12, 14, 'ZNCL', 1.72, NULL);
INSERT INTO lineas_fac VALUES (1362, 13, 20, 'L85546', 4.25, NULL);
INSERT INTO lineas_fac VALUES (8609, 14, 19, 'L76424', 3.12, 15);
INSERT INTO lineas_fac VALUES (5875, 15, 2, 'L85459', 5.73, 5);
INSERT INTO lineas_fac VALUES (9149, 16, 4, 'P695', 1.34, 20);
INSERT INTO lineas_fac VALUES (2519, 17, 1, 'TE7200', 9.80, 5);
INSERT INTO lineas_fac VALUES (7375, 18, 20, 'T4501', 1.70, NULL);
INSERT INTO lineas_fac VALUES (9175, 19, 14, 'N5072', 8.00, 10);
INSERT INTO lineas_fac VALUES (8484, 20, 7, 'THC21', 2.80, 10);
INSERT INTO lineas_fac VALUES (1786, 21, 5, 'IM3P32V', 3.66, 10);
INSERT INTO lineas_fac VALUES (2259, 22, 1, 'N8017BA', 9.69, NULL);
INSERT INTO lineas_fac VALUES (7375, 23, 10, 'REF1X20', 2.94, 15);
INSERT INTO lineas_fac VALUES (8609, 24, 2, 'ZNCL', 6.19, NULL);
INSERT INTO lineas_fac VALUES (2429, 25, 11, 'L14340', 1.01, 10);
INSERT INTO lineas_fac VALUES (6659, 26, 10, 'L14340', 9.42, 20);
INSERT INTO lineas_fac VALUES (5224, 27, 7, 'IM3P32V', 1.05, NULL);
INSERT INTO lineas_fac VALUES (8484, 28, 13, 'S3165136', 8.20, 5);
INSERT INTO lineas_fac VALUES (6749, 29, 8, 'im4P10L', 7.03, NULL);
INSERT INTO lineas_fac VALUES (1343, 30, 13, 'TE7200', 1.04, NULL);
INSERT INTO lineas_fac VALUES (1535, 31, 3, 'P924', 3.24, NULL);
INSERT INTO lineas_fac VALUES (4359, 32, 5, 'L92119', 6.92, NULL);
INSERT INTO lineas_fac VALUES (7375, 33, 15, 'ME200', 9.56, NULL);
INSERT INTO lineas_fac VALUES (4784, 34, 10, 'T4501', 1.45, 5);
INSERT INTO lineas_fac VALUES (6701, 35, 13, 'REF1X20', 2.66, 5);
INSERT INTO lineas_fac VALUES (4784, 36, 7, 'ME200', 8.98, NULL);
INSERT INTO lineas_fac VALUES (6680, 37, 2, 'L17055', 9.25, NULL);
INSERT INTO lineas_fac VALUES (5375, 38, 5, 'L17055', 4.25, 5);
INSERT INTO lineas_fac VALUES (1343, 39, 2, 'T4501', 1.46, 20);
INSERT INTO lineas_fac VALUES (1362, 40, 13, 'TE7200', 4.70, NULL);
INSERT INTO lineas_fac VALUES (1978, 41, 17, 'L85459', 5.07, NULL);
INSERT INTO lineas_fac VALUES (8159, 42, 13, 'ME200', 5.14, NULL);
INSERT INTO lineas_fac VALUES (4784, 43, 3, 'ME200', 3.41, 5);
INSERT INTO lineas_fac VALUES (4359, 44, 10, 'THC21', 8.13, NULL);
INSERT INTO lineas_fac VALUES (6701, 45, 7, 'P924', 5.82, 10);
INSERT INTO lineas_fac VALUES (2868, 46, 16, 'REF1X20', 6.42, 10);
INSERT INTO lineas_fac VALUES (5906, 47, 18, 'S3165136', 1.80, NULL);
INSERT INTO lineas_fac VALUES (6491, 48, 12, 'N8017BA', 3.31, NULL);
INSERT INTO lineas_fac VALUES (3529, 49, 1, 'L14340', 2.72, 20);
INSERT INTO lineas_fac VALUES (5375, 50, 2, 'TFM16', 6.59, NULL);
INSERT INTO lineas_fac VALUES (5935, 51, 11, 'TE7200', 3.95, NULL);
INSERT INTO lineas_fac VALUES (2519, 52, 4, 'TH11', 0.87, NULL);
INSERT INTO lineas_fac VALUES (6654, 53, 9, 'L76424', 7.31, 15);
INSERT INTO lineas_fac VALUES (2567, 54, 10, 'TFM16', 3.29, 5);
INSERT INTO lineas_fac VALUES (8888, 55, 12, 'P924', 0.31, NULL);
INSERT INTO lineas_fac VALUES (4927, 56, 14, 'P924', 7.24, 10);
INSERT INTO lineas_fac VALUES (2852, 57, 5, 'L85546', 5.24, 10);
INSERT INTO lineas_fac VALUES (2852, 58, 3, 'REF1X20', 3.58, 5);
INSERT INTO lineas_fac VALUES (5904, 59, 20, 'N5072', 0.77, NULL);
INSERT INTO lineas_fac VALUES (5968, 60, 2, 'T4501', 6.74, 15);
INSERT INTO lineas_fac VALUES (6742, 61, 13, 'P605', 7.91, 10);
INSERT INTO lineas_fac VALUES (2316, 62, 15, 'IM3P32V', 1.49, 15);
INSERT INTO lineas_fac VALUES (5968, 63, 7, 'T4501', 5.19, NULL);
INSERT INTO lineas_fac VALUES (6645, 64, 8, 'N5072', 8.65, NULL);
INSERT INTO lineas_fac VALUES (1343, 65, 11, 'TFM16', 1.67, 5);
INSERT INTO lineas_fac VALUES (1631, 66, 1, 'L14340', 0.30, NULL);
INSERT INTO lineas_fac VALUES (6701, 67, 18, 'ME200', 1.23, NULL);
INSERT INTO lineas_fac VALUES (6423, 68, 17, 'P695', 6.88, NULL);
INSERT INTO lineas_fac VALUES (3627, 69, 10, 'L85459', 8.65, 15);
INSERT INTO lineas_fac VALUES (4734, 70, 16, 'IM3P32V', 1.29, 20);
INSERT INTO lineas_fac VALUES (8536, 71, 18, 'T4501', 6.62, NULL);
INSERT INTO lineas_fac VALUES (6643, 72, 6, 'N5072', 9.91, NULL);
INSERT INTO lineas_fac VALUES (6723, 73, 18, 'L85546', 3.70, 10);
INSERT INTO lineas_fac VALUES (8647, 74, 20, 'L85546', 6.21, NULL);
INSERT INTO lineas_fac VALUES (2868, 75, 8, 'THC21', 4.44, NULL);
INSERT INTO lineas_fac VALUES (6749, 76, 6, 'TE7200', 1.63, NULL);
INSERT INTO lineas_fac VALUES (6659, 77, 3, 'S3165136', 4.01, 15);
INSERT INTO lineas_fac VALUES (6659, 78, 8, 'P695', 2.98, 10);
INSERT INTO lineas_fac VALUES (2318, 79, 5, 'TH11', 6.09, 20);
INSERT INTO lineas_fac VALUES (6579, 80, 6, 'N5072', 3.00, 10);
INSERT INTO lineas_fac VALUES (6659, 81, 10, 'L14340', 5.42, NULL);
INSERT INTO lineas_fac VALUES (4734, 82, 11, 'IM3P32V', 9.00, NULL);
INSERT INTO lineas_fac VALUES (9953, 83, 19, 'L14340', 5.44, NULL);
INSERT INTO lineas_fac VALUES (2868, 84, 5, 'TH11', 7.22, 15);
INSERT INTO lineas_fac VALUES (3627, 85, 6, 'ME200', 8.37, 10);
INSERT INTO lineas_fac VALUES (1631, 86, 14, 'P695', 9.97, NULL);
INSERT INTO lineas_fac VALUES (8888, 87, 16, 'im4P10L', 9.17, 15);
INSERT INTO lineas_fac VALUES (2567, 88, 3, 'P605', 5.77, NULL);
INSERT INTO lineas_fac VALUES (7375, 89, 3, 'ZNCL', 2.71, 5);
INSERT INTO lineas_fac VALUES (9953, 90, 14, 'N8017BA', 7.38, NULL);
INSERT INTO lineas_fac VALUES (4784, 91, 1, 'P695', 3.39, 20);
INSERT INTO lineas_fac VALUES (1808, 92, 4, 'P924', 1.89, 10);
INSERT INTO lineas_fac VALUES (7375, 93, 17, 'P605', 8.34, 10);
INSERT INTO lineas_fac VALUES (1808, 94, 5, 'ME200', 1.92, 15);
INSERT INTO lineas_fac VALUES (5968, 95, 4, 'im4P10L', 5.47, NULL);
INSERT INTO lineas_fac VALUES (2259, 96, 8, 'TFM16', 9.56, 5);
INSERT INTO lineas_fac VALUES (8888, 97, 2, 'L85459', 8.01, 15);
INSERT INTO lineas_fac VALUES (4359, 98, 5, 'TE7200', 9.05, 5);
INSERT INTO lineas_fac VALUES (1631, 99, 15, 'L14340', 4.32, 20);
INSERT INTO lineas_fac VALUES (1663, 2, 3, 'L17055', 4.77, 10);
INSERT INTO lineas_fac VALUES (1808, 3, 11, 'TFM16', 6.87, NULL);
INSERT INTO lineas_fac VALUES (3627, 4, 14, 'THC21', 0.62, 10);
INSERT INTO lineas_fac VALUES (6659, 5, 17, 'P605', 7.23, 10);
INSERT INTO lineas_fac VALUES (6579, 6, 9, 'L85546', 8.94, NULL);
INSERT INTO lineas_fac VALUES (5904, 7, 15, 'N8017BA', 4.07, 15);
INSERT INTO lineas_fac VALUES (6491, 8, 15, 'THC21', 1.55, 20);
INSERT INTO lineas_fac VALUES (5181, 9, 10, 'ME200', 5.93, 15);
INSERT INTO lineas_fac VALUES (6680, 10, 6, 'TH11', 5.12, 10);
INSERT INTO lineas_fac VALUES (8842, 11, 19, 'im4P10L', 2.44, 5);
INSERT INTO lineas_fac VALUES (6654, 12, 19, 'TH11', 2.89, NULL);
INSERT INTO lineas_fac VALUES (6491, 13, 2, 'TE7200', 4.79, 20);
INSERT INTO lineas_fac VALUES (2316, 14, 4, 'im4P10L', 4.11, NULL);
INSERT INTO lineas_fac VALUES (8536, 15, 12, 'T4501', 7.88, NULL);
INSERT INTO lineas_fac VALUES (2259, 16, 5, 'TFM16', 7.88, 5);
INSERT INTO lineas_fac VALUES (7306, 17, 18, 'L92119', 1.40, 10);
INSERT INTO lineas_fac VALUES (7561, 18, 9, 'L14340', 6.53, 5);
INSERT INTO lineas_fac VALUES (1631, 19, 7, 'L85459', 9.60, NULL);
INSERT INTO lineas_fac VALUES (5875, 20, 3, 'IM3P32V', 5.82, NULL);
INSERT INTO lineas_fac VALUES (4734, 21, 19, 'N5072', 0.49, 10);
INSERT INTO lineas_fac VALUES (6645, 22, 14, 'P924', 5.25, 10);
INSERT INTO lineas_fac VALUES (9175, 23, 7, 'P605', 5.14, 20);
INSERT INTO lineas_fac VALUES (7375, 24, 3, 'L85546', 7.86, 10);
INSERT INTO lineas_fac VALUES (1631, 25, 2, 'THC21', 3.06, NULL);
INSERT INTO lineas_fac VALUES (8609, 26, 18, 'THC21', 6.14, NULL);
INSERT INTO lineas_fac VALUES (6749, 27, 7, 'THC21', 4.35, 10);
INSERT INTO lineas_fac VALUES (9149, 28, 4, 'L76424', 7.14, NULL);
INSERT INTO lineas_fac VALUES (1362, 29, 4, 'L85546', 5.46, NULL);
INSERT INTO lineas_fac VALUES (2429, 30, 10, 'L85459', 3.36, 10);
INSERT INTO lineas_fac VALUES (2519, 31, 17, 'ME200', 9.15, NULL);
INSERT INTO lineas_fac VALUES (5375, 32, 1, 'im4P10L', 9.03, NULL);
INSERT INTO lineas_fac VALUES (1343, 33, 2, 'P605', 8.10, 10);
INSERT INTO lineas_fac VALUES (1343, 34, 10, 'L85459', 0.32, NULL);
INSERT INTO lineas_fac VALUES (1362, 35, 16, 'L92119', 9.26, 20);
INSERT INTO lineas_fac VALUES (2316, 36, 2, 'L76424', 0.75, NULL);
INSERT INTO lineas_fac VALUES (9516, 37, 11, 'L76424', 4.45, NULL);
INSERT INTO lineas_fac VALUES (5875, 38, 9, 'N5072', 2.97, NULL);
INSERT INTO lineas_fac VALUES (2567, 39, 11, 'TFM16', 3.88, NULL);
INSERT INTO lineas_fac VALUES (8842, 40, 19, 'REF1X20', 7.25, 15);
INSERT INTO lineas_fac VALUES (5935, 41, 2, 'P605', 9.89, 20);
INSERT INTO lineas_fac VALUES (6423, 42, 20, 'THC21', 5.95, NULL);
INSERT INTO lineas_fac VALUES (7375, 43, 4, 'IM3P32V', 5.92, NULL);
INSERT INTO lineas_fac VALUES (6423, 45, 1, 'P924', 5.28, 20);
INSERT INTO lineas_fac VALUES (2852, 46, 4, 'IM3P32V', 2.29, 15);
INSERT INTO lineas_fac VALUES (1978, 47, 5, 'N8017BA', 6.37, 5);
INSERT INTO lineas_fac VALUES (5904, 48, 8, 'P695', 9.93, 5);
INSERT INTO lineas_fac VALUES (1808, 49, 16, 'T4501', 0.30, 10);
INSERT INTO lineas_fac VALUES (9149, 50, 14, 'P695', 8.15, 5);
INSERT INTO lineas_fac VALUES (1103, 51, 19, 'T4501', 4.34, 20);
INSERT INTO lineas_fac VALUES (8888, 52, 18, 'L14340', 6.79, 15);
INSERT INTO lineas_fac VALUES (8609, 53, 5, 'TE7200', 1.18, NULL);
INSERT INTO lineas_fac VALUES (1631, 54, 6, 'P695', 6.65, 15);
INSERT INTO lineas_fac VALUES (5935, 55, 11, 'ME200', 5.26, 15);
INSERT INTO lineas_fac VALUES (1343, 56, 20, 'im4P10L', 6.22, 20);
INSERT INTO lineas_fac VALUES (4359, 57, 7, 'L92119', 3.62, NULL);
INSERT INTO lineas_fac VALUES (5224, 58, 4, 'TE7200', 6.09, 10);
INSERT INTO lineas_fac VALUES (5224, 59, 20, 'N5072', 6.59, 10);
INSERT INTO lineas_fac VALUES (8888, 60, 2, 'P695', 4.64, 15);
INSERT INTO lineas_fac VALUES (9953, 61, 7, 'L14340', 6.20, 5);
INSERT INTO lineas_fac VALUES (4784, 62, 15, 'TH11', 9.29, NULL);
INSERT INTO lineas_fac VALUES (5935, 63, 7, 'TH11', 7.28, NULL);
INSERT INTO lineas_fac VALUES (8888, 64, 7, 'L85546', 7.34, NULL);
INSERT INTO lineas_fac VALUES (3529, 65, 15, 'L76424', 5.63, 15);
INSERT INTO lineas_fac VALUES (1978, 66, 3, 'im4P10L', 8.39, NULL);
INSERT INTO lineas_fac VALUES (5935, 67, 16, 'N8017BA', 5.18, 10);
INSERT INTO lineas_fac VALUES (6491, 68, 20, 'REF1X20', 6.38, NULL);
INSERT INTO lineas_fac VALUES (1786, 69, 6, 'TH11', 0.21, 5);
INSERT INTO lineas_fac VALUES (2567, 70, 11, 'L92119', 7.68, 10);
INSERT INTO lineas_fac VALUES (2259, 71, 5, 'L92119', 5.15, NULL);
INSERT INTO lineas_fac VALUES (8159, 72, 2, 'L17055', 2.87, 20);
INSERT INTO lineas_fac VALUES (5935, 73, 4, 'ZNCL', 1.12, NULL);
INSERT INTO lineas_fac VALUES (9149, 74, 2, 'S3165136', 4.65, 10);
INSERT INTO lineas_fac VALUES (5906, 75, 17, 'TE7200', 3.42, NULL);
INSERT INTO lineas_fac VALUES (9175, 76, 4, 'TE7200', 7.45, 5);
INSERT INTO lineas_fac VALUES (5904, 77, 5, 'N8017BA', 1.47, NULL);
INSERT INTO lineas_fac VALUES (2868, 78, 8, 'N5072', 1.99, 10);
INSERT INTO lineas_fac VALUES (6491, 79, 17, 'N5072', 9.20, NULL);
INSERT INTO lineas_fac VALUES (1663, 80, 16, 'L85546', 9.90, NULL);
INSERT INTO lineas_fac VALUES (6701, 81, 20, 'REF1X20', 0.28, 15);
INSERT INTO lineas_fac VALUES (7375, 82, 15, 'L92119', 9.38, NULL);
INSERT INTO lineas_fac VALUES (6579, 83, 12, 'L14340', 0.63, 5);
INSERT INTO lineas_fac VALUES (8159, 84, 15, 'S3165136', 1.36, 5);
INSERT INTO lineas_fac VALUES (6742, 85, 2, 'P605', 5.30, NULL);
INSERT INTO lineas_fac VALUES (5224, 86, 3, 'ME200', 2.57, 10);
INSERT INTO lineas_fac VALUES (4784, 87, 5, 'P924', 9.37, 20);
INSERT INTO lineas_fac VALUES (4359, 88, 20, 'TFM16', 3.12, 20);
INSERT INTO lineas_fac VALUES (5224, 89, 19, 'TE7200', 8.51, NULL);
INSERT INTO lineas_fac VALUES (2316, 90, 16, 'P695', 8.30, 20);
INSERT INTO lineas_fac VALUES (1535, 91, 16, 'TH11', 7.98, NULL);
INSERT INTO lineas_fac VALUES (6643, 92, 9, 'N5072', 8.77, NULL);
INSERT INTO lineas_fac VALUES (8647, 93, 18, 'P924', 8.74, NULL);
INSERT INTO lineas_fac VALUES (9175, 94, 4, 'im4P10L', 8.25, NULL);
INSERT INTO lineas_fac VALUES (4359, 95, 5, 'TH11', 0.16, 10);
INSERT INTO lineas_fac VALUES (8888, 96, 5, 'T4501', 0.99, 5);
INSERT INTO lineas_fac VALUES (7561, 97, 16, 'im4P10L', 7.13, NULL);
INSERT INTO lineas_fac VALUES (6701, 98, 2, 'IM3P32V', 6.05, NULL);
INSERT INTO lineas_fac VALUES (3627, 99, 19, 'L14340', 9.93, NULL);
INSERT INTO lineas_fac VALUES (1631, 2, 1, 'S3165136', 0.44, NULL);
INSERT INTO lineas_fac VALUES (8484, 3, 4, 'L14340', 4.02, NULL);
INSERT INTO lineas_fac VALUES (9516, 4, 9, 'L92119', 9.29, NULL);
INSERT INTO lineas_fac VALUES (2318, 5, 7, 'TH11', 2.82, 5);
INSERT INTO lineas_fac VALUES (8842, 6, 1, 'P695', 2.26, 15);
INSERT INTO lineas_fac VALUES (2567, 7, 2, 'TH11', 8.21, NULL);
INSERT INTO lineas_fac VALUES (6645, 8, 1, 'TFM16', 5.29, 5);
INSERT INTO lineas_fac VALUES (1663, 9, 6, 'T4501', 1.15, NULL);
INSERT INTO lineas_fac VALUES (7561, 10, 3, 'P605', 5.38, NULL);
INSERT INTO lineas_fac VALUES (5375, 11, 3, 'N5072', 4.60, 20);
INSERT INTO lineas_fac VALUES (1808, 12, 7, 'L92119', 6.89, 5);
INSERT INTO lineas_fac VALUES (6680, 13, 6, 'L85546', 9.70, NULL);
INSERT INTO lineas_fac VALUES (9953, 15, 3, 'L17055', 7.61, NULL);
INSERT INTO lineas_fac VALUES (8159, 16, 11, 'T4501', 4.10, 20);
INSERT INTO lineas_fac VALUES (5181, 17, 14, 'ME200', 0.39, 15);
INSERT INTO lineas_fac VALUES (8888, 18, 12, 'REF1X20', 0.08, 10);
INSERT INTO lineas_fac VALUES (7375, 19, 11, 'REF1X20', 1.96, 10);
INSERT INTO lineas_fac VALUES (6723, 20, 15, 'im4P10L', 9.05, NULL);
INSERT INTO lineas_fac VALUES (8159, 21, 7, 'TFM16', 7.11, NULL);
INSERT INTO lineas_fac VALUES (6645, 23, 7, 'REF1X20', 2.59, 20);
INSERT INTO lineas_fac VALUES (4927, 24, 14, 'TFM16', 0.70, NULL);
INSERT INTO lineas_fac VALUES (6723, 25, 11, 'L76424', 8.21, 15);
INSERT INTO lineas_fac VALUES (5181, 26, 11, 'REF1X20', 7.03, NULL);
INSERT INTO lineas_fac VALUES (5935, 27, 6, 'THC21', 7.11, NULL);
INSERT INTO lineas_fac VALUES (3627, 28, 14, 'P605', 1.05, 10);
INSERT INTO lineas_fac VALUES (6742, 29, 3, 'P605', 3.46, 20);
INSERT INTO lineas_fac VALUES (1663, 30, 1, 'P605', 9.91, 10);
INSERT INTO lineas_fac VALUES (5181, 31, 13, 'IM3P32V', 2.90, 15);
INSERT INTO lineas_fac VALUES (1663, 32, 5, 'P605', 5.19, NULL);
INSERT INTO lineas_fac VALUES (9953, 33, 11, 'L92119', 7.95, 5);
INSERT INTO lineas_fac VALUES (2318, 34, 9, 'T4501', 6.61, 5);
INSERT INTO lineas_fac VALUES (5375, 35, 6, 'THC21', 7.85, NULL);
INSERT INTO lineas_fac VALUES (4927, 36, 12, 'L17055', 6.37, 15);
INSERT INTO lineas_fac VALUES (1103, 37, 10, 'THC21', 9.84, NULL);
INSERT INTO lineas_fac VALUES (7375, 38, 13, 'L17055', 6.31, 5);
INSERT INTO lineas_fac VALUES (1103, 39, 16, 'S3165136', 1.90, 15);
INSERT INTO lineas_fac VALUES (6749, 41, 3, 'N8017BA', 4.54, 5);
INSERT INTO lineas_fac VALUES (5375, 42, 3, 'L76424', 1.06, 10);
INSERT INTO lineas_fac VALUES (6749, 43, 3, 'T4501', 7.20, NULL);
INSERT INTO lineas_fac VALUES (6659, 44, 9, 'THC21', 9.80, 10);
INSERT INTO lineas_fac VALUES (6491, 45, 12, 'N5072', 7.89, 20);
INSERT INTO lineas_fac VALUES (1631, 46, 1, 'ME200', 3.61, 20);
INSERT INTO lineas_fac VALUES (5224, 47, 19, 'IM3P32V', 3.39, NULL);
INSERT INTO lineas_fac VALUES (1978, 48, 16, 'P605', 3.80, NULL);
INSERT INTO lineas_fac VALUES (1535, 49, 12, 'P924', 8.37, NULL);
INSERT INTO lineas_fac VALUES (5181, 50, 8, 'IM3P32V', 3.01, 15);
INSERT INTO lineas_fac VALUES (2868, 51, 5, 'ZNCL', 1.29, NULL);
INSERT INTO lineas_fac VALUES (4784, 52, 13, 'L17055', 7.81, NULL);
INSERT INTO lineas_fac VALUES (2519, 53, 3, 'L17055', 9.57, 15);
INSERT INTO lineas_fac VALUES (6654, 54, 19, 'L85546', 9.75, 15);
INSERT INTO lineas_fac VALUES (6643, 55, 1, 'N8017BA', 3.01, 10);
INSERT INTO lineas_fac VALUES (5906, 56, 15, 'L17055', 4.75, NULL);
INSERT INTO lineas_fac VALUES (2519, 57, 2, 'L85546', 7.60, NULL);
INSERT INTO lineas_fac VALUES (9149, 58, 9, 'L85546', 4.75, 10);
INSERT INTO lineas_fac VALUES (6579, 59, 6, 'T4501', 4.43, 10);
INSERT INTO lineas_fac VALUES (5181, 60, 16, 'P605', 7.20, 20);
INSERT INTO lineas_fac VALUES (6749, 61, 5, 'im4P10L', 6.63, 5);
INSERT INTO lineas_fac VALUES (5968, 62, 2, 'P924', 4.62, 20);
INSERT INTO lineas_fac VALUES (5181, 63, 6, 'P605', 4.39, 15);
INSERT INTO lineas_fac VALUES (1362, 64, 18, 'THC21', 5.19, NULL);
INSERT INTO lineas_fac VALUES (1978, 65, 4, 'T4501', 0.67, 20);
INSERT INTO lineas_fac VALUES (6659, 66, 12, 'N5072', 0.47, NULL);
INSERT INTO lineas_fac VALUES (3529, 67, 17, 'N5072', 0.39, 15);
INSERT INTO lineas_fac VALUES (6579, 68, 18, 'L17055', 4.64, NULL);
INSERT INTO lineas_fac VALUES (7375, 69, 2, 'L17055', 0.51, 20);
INSERT INTO lineas_fac VALUES (7306, 70, 12, 'P695', 3.88, NULL);
INSERT INTO lineas_fac VALUES (1631, 71, 17, 'P924', 0.21, 5);
INSERT INTO lineas_fac VALUES (1343, 72, 8, 'L85459', 7.49, 15);
INSERT INTO lineas_fac VALUES (1978, 73, 11, 'TE7200', 6.01, 5);
INSERT INTO lineas_fac VALUES (9516, 74, 2, 'N5072', 8.42, NULL);
INSERT INTO lineas_fac VALUES (9149, 75, 18, 'im4P10L', 5.91, NULL);
INSERT INTO lineas_fac VALUES (8159, 76, 14, 'TFM16', 2.76, 15);
INSERT INTO lineas_fac VALUES (1343, 77, 8, 'T4501', 3.08, 10);
INSERT INTO lineas_fac VALUES (1663, 78, 3, 'T4501', 2.46, NULL);
INSERT INTO lineas_fac VALUES (3627, 79, 7, 'L17055', 3.67, NULL);
INSERT INTO lineas_fac VALUES (5935, 80, 16, 'TH11', 8.77, 15);
INSERT INTO lineas_fac VALUES (5935, 81, 20, 'L85459', 2.71, 5);
INSERT INTO lineas_fac VALUES (8536, 82, 1, 'N8017BA', 7.01, NULL);
INSERT INTO lineas_fac VALUES (6645, 83, 10, 'TFM16', 2.48, NULL);
INSERT INTO lineas_fac VALUES (5904, 84, 19, 'IM3P32V', 3.27, 15);
INSERT INTO lineas_fac VALUES (2567, 85, 5, 'S3165136', 3.01, NULL);
INSERT INTO lineas_fac VALUES (2316, 86, 4, 'IM3P32V', 5.18, 20);
INSERT INTO lineas_fac VALUES (8484, 87, 15, 'N5072', 5.71, NULL);
INSERT INTO lineas_fac VALUES (6645, 88, 7, 'N8017BA', 6.22, NULL);
INSERT INTO lineas_fac VALUES (8536, 89, 18, 'N5072', 8.25, 20);
INSERT INTO lineas_fac VALUES (8842, 90, 9, 'im4P10L', 6.84, NULL);
INSERT INTO lineas_fac VALUES (5906, 91, 16, 'P605', 8.93, 5);
INSERT INTO lineas_fac VALUES (1786, 92, 13, 'L85546', 0.36, 5);
INSERT INTO lineas_fac VALUES (5904, 93, 13, 'N5072', 7.83, NULL);
INSERT INTO lineas_fac VALUES (9953, 94, 6, 'L76424', 5.61, 5);
INSERT INTO lineas_fac VALUES (5181, 96, 5, 'N8017BA', 0.76, NULL);
INSERT INTO lineas_fac VALUES (2852, 97, 18, 'ZNCL', 0.82, 5);
INSERT INTO lineas_fac VALUES (5875, 98, 8, 'IM3P32V', 0.84, NULL);
INSERT INTO lineas_fac VALUES (9149, 99, 2, 'L14340', 4.96, 15);


--
-- TOC entry 2038 (class 0 OID 17107)
-- Dependencies: 176
-- Data for Name: provincias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO provincias VALUES ('03', 'Alicante');
INSERT INTO provincias VALUES ('12', 'Castellón');
INSERT INTO provincias VALUES ('46', 'Valencia');
INSERT INTO provincias VALUES ('91', 'Catalunya');
INSERT INTO provincias VALUES ('32', 'Canarias');
INSERT INTO provincias VALUES ('24', 'Illes Balears');
INSERT INTO provincias VALUES ('19', 'Comunitat Valenciana');
INSERT INTO provincias VALUES ('78', 'Castilla - La Mancha');
INSERT INTO provincias VALUES ('26', 'Euskadi');
INSERT INTO provincias VALUES ('43', 'Madrid');
INSERT INTO provincias VALUES ('87', 'Galicia');


--
-- TOC entry 2039 (class 0 OID 17110)
-- Dependencies: 177
-- Data for Name: pueblos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pueblos VALUES ('07766', 'Burriana', '12');
INSERT INTO pueblos VALUES ('12309', 'Castellón', '12');
INSERT INTO pueblos VALUES ('17859', 'Enramona', '12');
INSERT INTO pueblos VALUES ('46332', 'Soneja', '12');
INSERT INTO pueblos VALUES ('53596', 'Vila-real', '12');
INSERT INTO pueblos VALUES ('56019', 'Coihueco', '87');
INSERT INTO pueblos VALUES ('75733', 'Castel di Tora', '43');
INSERT INTO pueblos VALUES ('43077', 'Bossire', '19');
INSERT INTO pueblos VALUES ('03131', 'Dindigul', '26');
INSERT INTO pueblos VALUES ('67455', 'Melazzo', '12');
INSERT INTO pueblos VALUES ('87984', 'Fratta Todina', '91');
INSERT INTO pueblos VALUES ('85882', 'Priolo Gargallo', '43');
INSERT INTO pueblos VALUES ('16072', 'Rycroft', '12');
INSERT INTO pueblos VALUES ('08932', 'Menai Bridge', '46');
INSERT INTO pueblos VALUES ('08637', 'Beaconsfield', '87');
INSERT INTO pueblos VALUES ('66041', 'Leeds', '19');
INSERT INTO pueblos VALUES ('84295', 'Piła', '26');
INSERT INTO pueblos VALUES ('77374', 'Vandoeuvre-lès-Nancy', '19');
INSERT INTO pueblos VALUES ('79553', 'Rochester', '24');
INSERT INTO pueblos VALUES ('93474', 'Jaipur', '19');
INSERT INTO pueblos VALUES ('36925', 'Rennes', '26');
INSERT INTO pueblos VALUES ('78414', 'Bozeman', '32');
INSERT INTO pueblos VALUES ('73793', 'Outremont', '12');
INSERT INTO pueblos VALUES ('69848', 'Pradamano', '46');
INSERT INTO pueblos VALUES ('54292', 'Loy', '03');
INSERT INTO pueblos VALUES ('03853', 'Bad Ischl', '12');
INSERT INTO pueblos VALUES ('79338', 'Alma', '43');
INSERT INTO pueblos VALUES ('28165', 'Castiglione di Sicilia', '12');
INSERT INTO pueblos VALUES ('78524', 'Landshut', '46');
INSERT INTO pueblos VALUES ('45532', 'Fossato Serralta', '26');
INSERT INTO pueblos VALUES ('43757', 'Barddhaman', '78');
INSERT INTO pueblos VALUES ('25052', 'Eugene', '43');
INSERT INTO pueblos VALUES ('44289', 'Kungälv', '03');
INSERT INTO pueblos VALUES ('91291', 'Huntingdon', '24');
INSERT INTO pueblos VALUES ('55599', 'Colombes', '46');
INSERT INTO pueblos VALUES ('76086', 'Cardiff', '91');
INSERT INTO pueblos VALUES ('65012', 'Newark', '87');
INSERT INTO pueblos VALUES ('16816', 'Dortmund', '91');
INSERT INTO pueblos VALUES ('62161', 'Saint-Brieuc', '26');
INSERT INTO pueblos VALUES ('22449', 'Jodoigne-Souveraine', '26');
INSERT INTO pueblos VALUES ('52752', 'Sulzano', '46');
INSERT INTO pueblos VALUES ('27214', 'Burhaniye', '03');
INSERT INTO pueblos VALUES ('46419', 'Olmen', '87');
INSERT INTO pueblos VALUES ('34778', 'Juazeiro do Norte', '87');
INSERT INTO pueblos VALUES ('91619', 'Épinal', '78');
INSERT INTO pueblos VALUES ('56674', 'Zamość', '24');
INSERT INTO pueblos VALUES ('54092', 'Petit-Thier', '91');
INSERT INTO pueblos VALUES ('75945', 'Balen', '32');
INSERT INTO pueblos VALUES ('19186', 'Juan Fernández', '26');
INSERT INTO pueblos VALUES ('11764', 'South Perth', '46');
INSERT INTO pueblos VALUES ('47437', 'Broken Hill', '43');
INSERT INTO pueblos VALUES ('39082', 'Merdorp', '91');
INSERT INTO pueblos VALUES ('76281', 'Limena', '12');
INSERT INTO pueblos VALUES ('59371', 'Werbomont', '24');
INSERT INTO pueblos VALUES ('87928', 'Nijkerk', '91');
INSERT INTO pueblos VALUES ('19165', 'Asnières-sur-Seine', '87');
INSERT INTO pueblos VALUES ('57386', 'Saint-Rhémy-en-Bosses', '46');
INSERT INTO pueblos VALUES ('47193', 'Igboho', '32');
INSERT INTO pueblos VALUES ('69764', 'Quemchi', '91');
INSERT INTO pueblos VALUES ('45497', 'Ferrandina', '03');
INSERT INTO pueblos VALUES ('32136', 'Lacombe County', '46');
INSERT INTO pueblos VALUES ('65728', 'Northumberland', '46');
INSERT INTO pueblos VALUES ('03787', 'Boston', '03');
INSERT INTO pueblos VALUES ('55436', 'Côte Saint-Luc', '43');
INSERT INTO pueblos VALUES ('08459', 'Boussu-lez-Walcourt', '46');
INSERT INTO pueblos VALUES ('48676', 'Salamanca', '43');
INSERT INTO pueblos VALUES ('76832', 'Tacoma', '46');
INSERT INTO pueblos VALUES ('02686', 'Erchie', '24');
INSERT INTO pueblos VALUES ('79929', 'Glendon', '91');
INSERT INTO pueblos VALUES ('76349', 'Siquirres', '26');
INSERT INTO pueblos VALUES ('05366', 'New Bombay', '12');
INSERT INTO pueblos VALUES ('04845', 'Giardinello', '87');
INSERT INTO pueblos VALUES ('55393', 'Precenicco', '19');
INSERT INTO pueblos VALUES ('49462', 'Cambiago', '78');
INSERT INTO pueblos VALUES ('73451', 'Annan', '24');
INSERT INTO pueblos VALUES ('62858', 'Crystal Springs', '26');
INSERT INTO pueblos VALUES ('99315', 'Erie', '46');
INSERT INTO pueblos VALUES ('45765', 'Roosbeek', '26');
INSERT INTO pueblos VALUES ('11389', 'Jabalpur', '19');
INSERT INTO pueblos VALUES ('76998', 'Wimborne Minster', '12');
INSERT INTO pueblos VALUES ('48619', 'Mödling', '03');
INSERT INTO pueblos VALUES ('41122', 'Siena', '46');
INSERT INTO pueblos VALUES ('25365', 'Lake Cowichan', '26');
INSERT INTO pueblos VALUES ('14052', 'Oudegem', '24');
INSERT INTO pueblos VALUES ('64769', 'Spormaggiore', '26');
INSERT INTO pueblos VALUES ('63198', 'Reus', '91');
INSERT INTO pueblos VALUES ('07149', 'Mobile', '91');
INSERT INTO pueblos VALUES ('01944', 'Kapolei', '46');
INSERT INTO pueblos VALUES ('68898', 'Sahiwal', '19');
INSERT INTO pueblos VALUES ('03261', 'Frankfort', '32');
INSERT INTO pueblos VALUES ('85625', 'San Felice a Cancello', '03');
INSERT INTO pueblos VALUES ('77133', 'Donosti', '24');
INSERT INTO pueblos VALUES ('16358', 'Vicuña', '03');
INSERT INTO pueblos VALUES ('42616', 'Hamilton', '91');
INSERT INTO pueblos VALUES ('71785', 'Hamburg', '87');
INSERT INTO pueblos VALUES ('43056', 'Miranda', '26');
INSERT INTO pueblos VALUES ('69886', 'Waver', '32');
INSERT INTO pueblos VALUES ('63721', 'Kawartha Lakes', '43');
INSERT INTO pueblos VALUES ('57549', 'Westmount', '12');
INSERT INTO pueblos VALUES ('14836', 'Gontrode', '32');
INSERT INTO pueblos VALUES ('24354', 'Chiauci', '43');
INSERT INTO pueblos VALUES ('27267', 'Knoxville', '26');
INSERT INTO pueblos VALUES ('51985', 'Port Alice', '03');
INSERT INTO pueblos VALUES ('16394', 'Kendal', '43');
INSERT INTO pueblos VALUES ('44797', 'Sint-Katherina-Lombeek', '24');


--
-- TOC entry 2040 (class 0 OID 17113)
-- Dependencies: 178
-- Data for Name: vendedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO vendedores VALUES (105, 'Poy Omella, Paloma', 'Sanchis Tarazona, 103-1', '12257', '46332', NULL);
INSERT INTO vendedores VALUES (155, 'Rubert Cano, Diego', 'Benicarló Residencial, 154', '12425', '17859', 5);
INSERT INTO vendedores VALUES (455, 'Agost Tirado, Jorge', 'Pasaje Peñagolosa, 21-19', '12914', '53596', 5);
INSERT INTO vendedores VALUES (5, 'Guillén Vilar, Natalia', 'Sant Josep, 110', '12597', '53596', 105);


--
-- TOC entry 1904 (class 2606 OID 17117)
-- Name: articulos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY articulos
    ADD CONSTRAINT articulos_pkey PRIMARY KEY (codart);


--
-- TOC entry 1906 (class 2606 OID 17119)
-- Name: clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (codcli);


--
-- TOC entry 1908 (class 2606 OID 17121)
-- Name: facturas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_pkey PRIMARY KEY (codfac);


--
-- TOC entry 1910 (class 2606 OID 17123)
-- Name: lineas_fac_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lineas_fac
    ADD CONSTRAINT lineas_fac_pkey PRIMARY KEY (codfac, linea);


--
-- TOC entry 1912 (class 2606 OID 17125)
-- Name: provincias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY provincias
    ADD CONSTRAINT provincias_pkey PRIMARY KEY (codpro);


--
-- TOC entry 1914 (class 2606 OID 17127)
-- Name: pueblos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pueblos
    ADD CONSTRAINT pueblos_pkey PRIMARY KEY (codpue);


--
-- TOC entry 1916 (class 2606 OID 17129)
-- Name: vendedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vendedores
    ADD CONSTRAINT vendedores_pkey PRIMARY KEY (codven);


--
-- TOC entry 1917 (class 2606 OID 17130)
-- Name: clientes_codpue_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT clientes_codpue_fkey FOREIGN KEY (codpue) REFERENCES pueblos(codpue);


--
-- TOC entry 1918 (class 2606 OID 17135)
-- Name: facturas_codcli_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_codcli_fkey FOREIGN KEY (codcli) REFERENCES clientes(codcli);


--
-- TOC entry 1919 (class 2606 OID 17140)
-- Name: facturas_codven_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_codven_fkey FOREIGN KEY (codven) REFERENCES vendedores(codven);


--
-- TOC entry 1920 (class 2606 OID 17145)
-- Name: lineas_fac_codart_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lineas_fac
    ADD CONSTRAINT lineas_fac_codart_fkey FOREIGN KEY (codart) REFERENCES articulos(codart);


--
-- TOC entry 1921 (class 2606 OID 17150)
-- Name: lineas_fac_codfac_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lineas_fac
    ADD CONSTRAINT lineas_fac_codfac_fkey FOREIGN KEY (codfac) REFERENCES facturas(codfac);


--
-- TOC entry 1922 (class 2606 OID 17155)
-- Name: pueblos_codpro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pueblos
    ADD CONSTRAINT pueblos_codpro_fkey FOREIGN KEY (codpro) REFERENCES provincias(codpro);


--
-- TOC entry 1923 (class 2606 OID 17160)
-- Name: vendedores_codjefe_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vendedores
    ADD CONSTRAINT vendedores_codjefe_fkey FOREIGN KEY (codjefe) REFERENCES vendedores(codven);


--
-- TOC entry 1924 (class 2606 OID 17165)
-- Name: vendedores_codpue_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vendedores
    ADD CONSTRAINT vendedores_codpue_fkey FOREIGN KEY (codpue) REFERENCES pueblos(codpue);


--
-- TOC entry 2047 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-07-29 16:48:43

--
-- PostgreSQL database dump complete
--

