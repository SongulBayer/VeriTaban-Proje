--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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

--
-- Name: ProjeOdevi; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "ProjeOdevi" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Turkish_Turkey.1254';


ALTER DATABASE "ProjeOdevi" OWNER TO postgres;

\connect "ProjeOdevi"

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
-- Name: Bölge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Bölge" (
    "bolgeNo" character varying NOT NULL,
    "bolgeAdi" character varying,
    il character varying
);


ALTER TABLE public."Bölge" OWNER TO postgres;

--
-- Name: Duvar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Duvar" (
    "paylasimNo" integer NOT NULL,
    "paylasimAdi" character varying(30),
    "paylasimTürü" character varying(30)
);


ALTER TABLE public."Duvar" OWNER TO postgres;

--
-- Name: Duvar_paylasimNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Duvar_paylasimNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Duvar_paylasimNo_seq" OWNER TO postgres;

--
-- Name: Duvar_paylasimNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Duvar_paylasimNo_seq" OWNED BY public."Duvar"."paylasimNo";


--
-- Name: Fatura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Fatura" (
    "faturaNo" character varying NOT NULL,
    "faturaTarihi" date
);


ALTER TABLE public."Fatura" OWNER TO postgres;

--
-- Name: Il; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Il" (
    "ilNo" character varying NOT NULL,
    "ilAdi" character varying
);


ALTER TABLE public."Il" OWNER TO postgres;

--
-- Name: Ilce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ilce" (
    "ilceNo" integer NOT NULL,
    il character varying,
    "ilceAdi" character varying
);


ALTER TABLE public."Ilce" OWNER TO postgres;

--
-- Name: IletisimBilgileri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."IletisimBilgileri" (
    no character(6) NOT NULL,
    ilce character varying,
    telefon character(10),
    adres character varying,
    "kisiNo" integer NOT NULL
);


ALTER TABLE public."IletisimBilgileri" OWNER TO postgres;

--
-- Name: IletisimBilgileri_kisiNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."IletisimBilgileri_kisiNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."IletisimBilgileri_kisiNo_seq" OWNER TO postgres;

--
-- Name: IletisimBilgileri_kisiNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."IletisimBilgileri_kisiNo_seq" OWNED BY public."IletisimBilgileri"."kisiNo";


--
-- Name: KargoFirmasi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."KargoFirmasi" (
    "firmaNo" character varying NOT NULL,
    ad character varying
);


ALTER TABLE public."KargoFirmasi" OWNER TO postgres;

--
-- Name: Kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Kategori" (
    "kategoriKodu" character varying NOT NULL,
    ad character varying
);


ALTER TABLE public."Kategori" OWNER TO postgres;

--
-- Name: Kisi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Kisi" (
    "kisiNo" integer NOT NULL,
    ad character varying,
    soyad character varying,
    "kisiTuru" character varying
);


ALTER TABLE public."Kisi" OWNER TO postgres;

--
-- Name: Kisi_kisiNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Kisi_kisiNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Kisi_kisiNo_seq" OWNER TO postgres;

--
-- Name: Kisi_kisiNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Kisi_kisiNo_seq" OWNED BY public."Kisi"."kisiNo";


--
-- Name: Kitap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Kitap" (
    "kitapNo" integer NOT NULL,
    "kitapAdi" character varying,
    "kitapTuru" character varying,
    ileti character varying(30),
    duyuru character varying(30)
);


ALTER TABLE public."Kitap" OWNER TO postgres;

--
-- Name: Musteri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Musteri" (
    "kisiNo" integer NOT NULL,
    ilce integer,
    "kimlikNo" character(11)
);


ALTER TABLE public."Musteri" OWNER TO postgres;

--
-- Name: Musteri_kisiNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Musteri_kisiNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Musteri_kisiNo_seq" OWNER TO postgres;

--
-- Name: Musteri_kisiNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Musteri_kisiNo_seq" OWNED BY public."Musteri"."kisiNo";


--
-- Name: SatisTemsilcisi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SatisTemsilcisi" (
    "satisTemsilcisiNo" character varying NOT NULL,
    bolge character varying
);


ALTER TABLE public."SatisTemsilcisi" OWNER TO postgres;

--
-- Name: Siparis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Siparis" (
    "siparisNo" character varying NOT NULL,
    "siparisTarihi" date,
    "toplamTutar" numeric,
    "kargoFirmasi" character varying,
    "faturaNo" character(9),
    "kisiNo" integer NOT NULL,
    "satisTemsilcisiNo" character(10)
);


ALTER TABLE public."Siparis" OWNER TO postgres;

--
-- Name: SiparisUrun; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SiparisUrun" (
    no character varying NOT NULL,
    "siparisNo" character varying,
    "birimFiyati" numeric,
    miktari integer,
    "urunKodu" character(10)
);


ALTER TABLE public."SiparisUrun" OWNER TO postgres;

--
-- Name: Siparis_kisiNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Siparis_kisiNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Siparis_kisiNo_seq" OWNER TO postgres;

--
-- Name: Siparis_kisiNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Siparis_kisiNo_seq" OWNED BY public."Siparis"."kisiNo";


--
-- Name: Urun; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Urun" (
    "urunKodu" character(1) NOT NULL,
    ad character varying,
    "kategoriKodu" character(5),
    "stokMiktari" integer,
    "birimFiyati" numeric
);


ALTER TABLE public."Urun" OWNER TO postgres;

--
-- Name: Duvar paylasimNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Duvar" ALTER COLUMN "paylasimNo" SET DEFAULT nextval('public."Duvar_paylasimNo_seq"'::regclass);


--
-- Name: IletisimBilgileri kisiNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IletisimBilgileri" ALTER COLUMN "kisiNo" SET DEFAULT nextval('public."IletisimBilgileri_kisiNo_seq"'::regclass);


--
-- Name: Kisi kisiNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kisi" ALTER COLUMN "kisiNo" SET DEFAULT nextval('public."Kisi_kisiNo_seq"'::regclass);


--
-- Name: Musteri kisiNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Musteri" ALTER COLUMN "kisiNo" SET DEFAULT nextval('public."Musteri_kisiNo_seq"'::regclass);


--
-- Name: Siparis kisiNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Siparis" ALTER COLUMN "kisiNo" SET DEFAULT nextval('public."Siparis_kisiNo_seq"'::regclass);


--
-- Data for Name: Bölge; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Bölge" VALUES
	('1', 'Doğu Anadolu', NULL),
	('2', 'Marmara', NULL),
	('3', 'Ege', NULL),
	('4', 'GüneyDoğu Anadolu', NULL),
	('5', 'İç Anadolu', NULL);


--
-- Data for Name: Duvar; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Fatura; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Fatura" VALUES
	('1', '2019-01-01'),
	('2', '2019-02-01'),
	('3', '2019-03-01'),
	('4', '2019-04-01'),
	('5', '2019-05-01'),
	('6', '2019-06-01'),
	('7', '2019-07-01'),
	('8', '2019-08-01');


--
-- Data for Name: Il; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Il" VALUES
	('1', 'ERZURUM'),
	('2', 'İSTANBUL'),
	('3', 'GAZİANTEP'),
	('4', 'İZMİR'),
	('5', 'SAKARYA'),
	('6', 'ANKARA');


--
-- Data for Name: Ilce; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Ilce" VALUES
	(1, NULL, 'Hınıs'),
	(2, NULL, 'Bağcılar'),
	(3, NULL, 'Horasan'),
	(4, NULL, 'Balçova'),
	(5, NULL, 'Adapazarı'),
	(6, NULL, 'Islahiye'),
	(7, NULL, 'Keçiören'),
	(8, NULL, 'Kadıköy');


--
-- Data for Name: IletisimBilgileri; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."IletisimBilgileri" VALUES
	('123456', 'Hınıs', '1234567891', 'Aşşağı Mahalle', 1),
	('123454', 'Bağcılar', '1234567891', 'Bağlar Mahalle', 2),
	('123453', 'Horosan', '7234567891', 'Ağıllı Mahalle', 3),
	('123452', 'Bolçova', '6234567891', 'Onur Mahalle', 4),
	('123451', 'Adapazarı', '5234567891', 'Doğancılar Mahalle', 5),
	('123459', 'Islahiye', '4234567891', 'Ağabey Mahalle', 6),
	('123458', 'Keçiören', '3234567891', 'Kızıl Mahalle', 7),
	('123457', 'Kadıköy', '2234567891', 'Yukarı Mahalle', 8);


--
-- Data for Name: KargoFirmasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."KargoFirmasi" VALUES
	('1', 'A firması'),
	('2', 'B firması'),
	('3', 'C firması'),
	('4', 'D firması'),
	('5', 'E firması'),
	('6', 'F firması'),
	('7', 'G firması'),
	('8', 'S firması');


--
-- Data for Name: Kategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Kategori" VALUES
	('1', 'ROMAN'),
	('2', 'HİKAYE'),
	('3', 'DENEME'),
	('4', 'ŞİİR'),
	('5', 'GEZİ'),
	('6', 'ANI'),
	('7', 'BİYOGRAFİ'),
	('8', 'ÇOCUK KİTABI');


--
-- Data for Name: Kisi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Kisi" VALUES
	(1, 'Ahmet', 'BAYER', 'Okur'),
	(2, 'Muhammet', 'BAYER', 'Okur'),
	(3, 'Songül', 'CANSEVEN', 'Yazar'),
	(4, 'Ceyda', 'PEHLİVANOĞLU', 'Yazar'),
	(5, 'Ayşegül', 'ÖZSOY', 'Okur'),
	(6, 'Nazlı', 'ESMERSOY', 'Yazar'),
	(7, 'Begüm', 'AKTOLGA', 'Okur'),
	(8, 'Zeynep', 'HAZAN', 'Yazar');


--
-- Data for Name: Kitap; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Musteri; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Musteri" VALUES
	(1, NULL, '12345678901'),
	(2, NULL, '32165498701'),
	(3, NULL, '65478932101'),
	(4, NULL, '12345678901'),
	(5, NULL, '32165498701'),
	(6, NULL, '65478932101');


--
-- Data for Name: SatisTemsilcisi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."SatisTemsilcisi" VALUES
	('1', '1'),
	('2', '2'),
	('3', '3'),
	('4', '4'),
	('5', '5');


--
-- Data for Name: Siparis; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Siparis" VALUES
	('1', '2019-04-01', 100, NULL, NULL, 2, NULL);


--
-- Data for Name: SiparisUrun; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."SiparisUrun" VALUES
	('1', NULL, 15, 1, '123321    '),
	('2', NULL, 10, 2, '123456    '),
	('3', NULL, 10, 2, '123456    '),
	('4', NULL, 10, 2, '123456    '),
	('5', NULL, 10, 2, '123456    '),
	('6', NULL, 10, 2, '123456    '),
	('7', NULL, 10, 2, '123456    '),
	('8', NULL, 10, 2, '123456    ');


--
-- Data for Name: Urun; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Urun" VALUES
	('1', 'ROMAN', NULL, 100, 17.5),
	('2', 'HİKAYE', NULL, 10, 15.5),
	('3', 'DENEME', NULL, 50, 17.15),
	('4', 'ŞİİR', NULL, 14, 17),
	('5', 'GEZİ', NULL, 11, 12),
	('6', 'ANI', NULL, 22, 19.30),
	('7', 'BİYOGRAFİ', NULL, 34, 8),
	('8', 'ÇOCUK KİTABI', NULL, 36, 15);


--
-- Name: Duvar_paylasimNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Duvar_paylasimNo_seq"', 1, false);


--
-- Name: IletisimBilgileri_kisiNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."IletisimBilgileri_kisiNo_seq"', 8, true);


--
-- Name: Kisi_kisiNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Kisi_kisiNo_seq"', 8, true);


--
-- Name: Musteri_kisiNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Musteri_kisiNo_seq"', 6, true);


--
-- Name: Siparis_kisiNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Siparis_kisiNo_seq"', 11, true);


--
-- Name: Fatura FaturaNoPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fatura"
    ADD CONSTRAINT "FaturaNoPK" PRIMARY KEY ("faturaNo");


--
-- Name: KargoFirmasi FirmaNoPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KargoFirmasi"
    ADD CONSTRAINT "FirmaNoPK" PRIMARY KEY ("firmaNo");


--
-- Name: Ilce IlceNoFK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ilce"
    ADD CONSTRAINT "IlceNoFK" PRIMARY KEY ("ilceNo");


--
-- Name: Kategori KategoriKoduPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kategori"
    ADD CONSTRAINT "KategoriKoduPK" PRIMARY KEY ("kategoriKodu");


--
-- Name: Kisi KisiNoPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kisi"
    ADD CONSTRAINT "KisiNoPK" PRIMARY KEY ("kisiNo");


--
-- Name: IletisimBilgileri NoPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IletisimBilgileri"
    ADD CONSTRAINT "NoPK" PRIMARY KEY (no);


--
-- Name: Urun UrunKodu; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Urun"
    ADD CONSTRAINT "UrunKodu" PRIMARY KEY ("urunKodu");


--
-- Name: Bölge bolgeNoPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Bölge"
    ADD CONSTRAINT "bolgeNoPK" PRIMARY KEY ("bolgeNo");


--
-- Name: Il ilNoFK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Il"
    ADD CONSTRAINT "ilNoFK" PRIMARY KEY ("ilNo");


--
-- Name: Musteri kisiNoPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Musteri"
    ADD CONSTRAINT "kisiNoPK" PRIMARY KEY ("kisiNo");


--
-- Name: Kitap kitapNoPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kitap"
    ADD CONSTRAINT "kitapNoPK" PRIMARY KEY ("kitapNo");


--
-- Name: SiparisUrun noPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SiparisUrun"
    ADD CONSTRAINT "noPK" PRIMARY KEY (no);


--
-- Name: Duvar paylasimNoPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Duvar"
    ADD CONSTRAINT "paylasimNoPK" PRIMARY KEY ("paylasimNo");


--
-- Name: SatisTemsilcisi satisTemsilcisiNopK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SatisTemsilcisi"
    ADD CONSTRAINT "satisTemsilcisiNopK" PRIMARY KEY ("satisTemsilcisiNo");


--
-- Name: Siparis siparisNoPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Siparis"
    ADD CONSTRAINT "siparisNoPK" PRIMARY KEY ("siparisNo");


--
-- Name: Siparis FaturaNoFK2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Siparis"
    ADD CONSTRAINT "FaturaNoFK2" FOREIGN KEY ("faturaNo") REFERENCES public."Fatura"("faturaNo");


--
-- Name: Ilce IlFK1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ilce"
    ADD CONSTRAINT "IlFK1" FOREIGN KEY (il) REFERENCES public."Il"("ilNo");


--
-- Name: Siparis KargoFirmasiFK1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Siparis"
    ADD CONSTRAINT "KargoFirmasiFK1" FOREIGN KEY ("kargoFirmasi") REFERENCES public."KargoFirmasi"("firmaNo");


--
-- Name: Urun KategoriKoduFK1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Urun"
    ADD CONSTRAINT "KategoriKoduFK1" FOREIGN KEY ("kategoriKodu") REFERENCES public."Kategori"("kategoriKodu");


--
-- Name: IletisimBilgileri KisiNoFK1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IletisimBilgileri"
    ADD CONSTRAINT "KisiNoFK1" FOREIGN KEY ("kisiNo") REFERENCES public."Kisi"("kisiNo");


--
-- Name: SatisTemsilcisi bolgeFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SatisTemsilcisi"
    ADD CONSTRAINT "bolgeFK" FOREIGN KEY (bolge) REFERENCES public."Bölge"("bolgeNo");


--
-- Name: Bölge ilFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Bölge"
    ADD CONSTRAINT "ilFK" FOREIGN KEY (il) REFERENCES public."Il"("ilNo");


--
-- Name: Musteri ilceFK1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Musteri"
    ADD CONSTRAINT "ilceFK1" FOREIGN KEY (ilce) REFERENCES public."Ilce"("ilceNo");


--
-- Name: Siparis kisiNoFK3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Siparis"
    ADD CONSTRAINT "kisiNoFK3" FOREIGN KEY ("kisiNo") REFERENCES public."Kisi"("kisiNo");


--
-- Name: Siparis satisTemsilcisiNoFK4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Siparis"
    ADD CONSTRAINT "satisTemsilcisiNoFK4" FOREIGN KEY ("satisTemsilcisiNo") REFERENCES public."SatisTemsilcisi"("satisTemsilcisiNo");


--
-- Name: SiparisUrun siparisNoFK1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SiparisUrun"
    ADD CONSTRAINT "siparisNoFK1" FOREIGN KEY ("siparisNo") REFERENCES public."Siparis"("siparisNo");


--
-- PostgreSQL database dump complete
--

