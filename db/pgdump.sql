--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: answers; Type: TABLE; Schema: public; Owner: app49565; Tablespace: 
--

CREATE TABLE answers (
    id integer NOT NULL,
    item_id integer,
    ref character varying(255),
    taken_id integer,
    answer character varying(255),
    score integer,
    correct integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.answers OWNER TO app49565;

--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: app49565
--

CREATE SEQUENCE answers_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.answers_id_seq OWNER TO app49565;

--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app49565
--

ALTER SEQUENCE answers_id_seq OWNED BY answers.id;


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app49565
--

SELECT pg_catalog.setval('answers_id_seq', 589, true);


--
-- Name: items; Type: TABLE; Schema: public; Owner: app49565; Tablespace: 
--

CREATE TABLE items (
    id integer NOT NULL,
    ref character varying(255),
    type2 integer,
    url character varying(255),
    text text,
    points double precision,
    c1 character varying(255),
    c2 character varying(255),
    c3 character varying(255),
    c4 character varying(255),
    c5 character varying(255),
    answer character varying(255),
    explanation text,
    context character varying(255),
    pc_error integer,
    capitalize integer,
    levenshtein integer,
    order_index integer,
    quiz_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.items OWNER TO app49565;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: app49565
--

CREATE SEQUENCE items_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO app49565;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app49565
--

ALTER SEQUENCE items_id_seq OWNED BY items.id;


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app49565
--

SELECT pg_catalog.setval('items_id_seq', 336, true);


--
-- Name: libraries; Type: TABLE; Schema: public; Owner: app49565; Tablespace: 
--

CREATE TABLE libraries (
    id integer NOT NULL,
    ref character varying(255),
    user_id integer,
    name character varying(255),
    rand_allowed integer,
    public_read integer,
    public_write integer,
    description character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.libraries OWNER TO app49565;

--
-- Name: libraries_id_seq; Type: SEQUENCE; Schema: public; Owner: app49565
--

CREATE SEQUENCE libraries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.libraries_id_seq OWNER TO app49565;

--
-- Name: libraries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app49565
--

ALTER SEQUENCE libraries_id_seq OWNED BY libraries.id;


--
-- Name: libraries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app49565
--

SELECT pg_catalog.setval('libraries_id_seq', 1, false);


--
-- Name: parts; Type: TABLE; Schema: public; Owner: app49565; Tablespace: 
--

CREATE TABLE parts (
    id integer NOT NULL,
    ref character varying(255),
    type2 integer,
    url character varying(255),
    text text,
    points double precision,
    c1 character varying(255),
    c2 character varying(255),
    c3 character varying(255),
    c4 character varying(255),
    c5 character varying(255),
    answer character varying(255),
    explanation text,
    context character varying(255),
    pc_error integer,
    capitalize integer,
    levenshtein integer,
    order_index integer,
    library_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.parts OWNER TO app49565;

--
-- Name: parts_id_seq; Type: SEQUENCE; Schema: public; Owner: app49565
--

CREATE SEQUENCE parts_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.parts_id_seq OWNER TO app49565;

--
-- Name: parts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app49565
--

ALTER SEQUENCE parts_id_seq OWNED BY parts.id;


--
-- Name: parts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app49565
--

SELECT pg_catalog.setval('parts_id_seq', 5, true);


--
-- Name: quizzes; Type: TABLE; Schema: public; Owner: app49565; Tablespace: 
--

CREATE TABLE quizzes (
    id integer NOT NULL,
    ref character varying(255),
    password_protect integer,
    "password" character varying(255),
    startdate timestamp without time zone,
    enddate timestamp without time zone,
    attempts integer,
    total integer,
    scale integer,
    name character varying(255),
    searchable integer,
    theme_id integer,
    user_id integer,
    loadfile character varying(255),
    random_quiz integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.quizzes OWNER TO app49565;

--
-- Name: quizzes_id_seq; Type: SEQUENCE; Schema: public; Owner: app49565
--

CREATE SEQUENCE quizzes_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.quizzes_id_seq OWNER TO app49565;

--
-- Name: quizzes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app49565
--

ALTER SEQUENCE quizzes_id_seq OWNED BY quizzes.id;


--
-- Name: quizzes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app49565
--

SELECT pg_catalog.setval('quizzes_id_seq', 55, true);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: app49565; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO app49565;

--
-- Name: takens; Type: TABLE; Schema: public; Owner: app49565; Tablespace: 
--

CREATE TABLE takens (
    id integer NOT NULL,
    ref character varying(255),
    quiz_id integer,
    status integer,
    user_id integer,
    score double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.takens OWNER TO app49565;

--
-- Name: takens_id_seq; Type: SEQUENCE; Schema: public; Owner: app49565
--

CREATE SEQUENCE takens_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.takens_id_seq OWNER TO app49565;

--
-- Name: takens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app49565
--

ALTER SEQUENCE takens_id_seq OWNED BY takens.id;


--
-- Name: takens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app49565
--

SELECT pg_catalog.setval('takens_id_seq', 160, true);


--
-- Name: themes; Type: TABLE; Schema: public; Owner: app49565; Tablespace: 
--

CREATE TABLE themes (
    id integer NOT NULL,
    ref character varying(255),
    css_rel character varying(255),
    items_per_page integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.themes OWNER TO app49565;

--
-- Name: themes_id_seq; Type: SEQUENCE; Schema: public; Owner: app49565
--

CREATE SEQUENCE themes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.themes_id_seq OWNER TO app49565;

--
-- Name: themes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app49565
--

ALTER SEQUENCE themes_id_seq OWNED BY themes.id;


--
-- Name: themes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app49565
--

SELECT pg_catalog.setval('themes_id_seq', 1, false);


--
-- Name: users; Type: TABLE; Schema: public; Owner: app49565; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(255),
    ref character varying(255),
    email character varying(255),
    username character varying(255),
    ip character varying(255),
    last_login timestamp without time zone,
    useragent character varying(255),
    "password" character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO app49565;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: app49565
--

CREATE SEQUENCE users_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO app49565;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app49565
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app49565
--

SELECT pg_catalog.setval('users_id_seq', 21, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app49565
--

ALTER TABLE answers ALTER COLUMN id SET DEFAULT nextval('answers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app49565
--

ALTER TABLE items ALTER COLUMN id SET DEFAULT nextval('items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app49565
--

ALTER TABLE libraries ALTER COLUMN id SET DEFAULT nextval('libraries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app49565
--

ALTER TABLE parts ALTER COLUMN id SET DEFAULT nextval('parts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app49565
--

ALTER TABLE quizzes ALTER COLUMN id SET DEFAULT nextval('quizzes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app49565
--

ALTER TABLE takens ALTER COLUMN id SET DEFAULT nextval('takens_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app49565
--

ALTER TABLE themes ALTER COLUMN id SET DEFAULT nextval('themes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app49565
--

ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: app49565
--

COPY answers (id, item_id, ref, taken_id, answer, score, correct, created_at, updated_at) FROM stdin;
436	238	ZgwfbmVqVnWeUGrLa6tXU07gl7zAc6ei	126	A	\N	1	2009-02-27 01:26:56.827487	2009-02-27 01:26:56.827487
437	239	pkaI9aF7IBgYg0UlEEtWtRzVdv6cnePL	126	A	\N	1	2009-02-27 01:26:57.86123	2009-02-27 01:26:57.86123
438	240	39vViARld14wVocCgG66VHgm90ADcKiG	126	A	\N	1	2009-02-27 01:26:58.690654	2009-02-27 01:26:58.690654
439	183	UVNjjpnaeZDScXQiGI247XMu7cgcaDGh	127	state graph	\N	1	2009-02-27 01:32:42.1427	2009-02-27 01:32:42.1427
440	186	v2bTReMBAVzrMYBWjiQAx4uaB6EMFJWA	127	digraph	\N	1	2009-02-27 01:32:43.828881	2009-02-27 01:32:43.828881
441	187	XrZv4ESTVRn3BB7XvT5JywewiwAPValZ	127	de Bruijn	\N	1	2009-02-27 01:33:02.04092	2009-02-27 01:33:02.04092
442	197	eRGPsAKsmhpdnma3IEe0Tm3RhGwkYwLR	127	B	\N	1	2009-02-27 01:33:02.355833	2009-02-27 01:33:02.355833
443	191	3ORMhwPCoVLrZ1CXXzUsHAPPgMdO9Er2	127	node	\N	1	2009-02-27 01:33:02.552618	2009-02-27 01:33:02.552618
444	192	29WyzaW9OSpZQ0yMd72FAT3vJHM1En3m	127	E	\N	1	2009-02-27 01:33:02.836663	2009-02-27 01:33:02.836663
445	190	YFQe1PvQVmiSROdSTZprukGsPbFji8te	127	B	\N	1	2009-02-27 01:33:03.452115	2009-02-27 01:33:03.452115
446	188	lDXnf9E27E4kFIhROArmWs3utEnjlXyT	127	V	\N	1	2009-02-27 01:33:03.732508	2009-02-27 01:33:03.732508
447	201	l94Z3AftqFPytAczlk0sko2al8JYcGsb	127	3	\N	1	2009-02-27 01:33:04.028177	2009-02-27 01:33:04.028177
448	204	zQx2mNgEJhMxBN1Al8gzzeb3sK4GQpVS	127	0	\N	1	2009-02-27 01:33:04.523868	2009-02-27 01:33:04.523868
449	206	22ZA4jqk7pCFLrlQPob3OPjPnR0x9svi	127	5	\N	1	2009-02-27 01:33:04.836762	2009-02-27 01:33:04.836762
450	208	DP9dYOirGS9YWRLc5GFIjOiaBKpIdMDl	127	vertices	\N	1	2009-02-27 01:33:04.99532	2009-02-27 01:33:04.99532
451	198	yHjQ6gH1bJfHuEMQev8KTVzhwUEZl1DZ	127	D	\N	1	2009-02-27 01:33:05.493142	2009-02-27 01:33:05.493142
452	207	QleoTTIEtQpVhNTXB1x34rqV0VoiI7TE	127	edges	\N	1	2009-02-27 01:33:05.929811	2009-02-27 01:33:05.929811
453	205	vCADEpfHwmrkRvgJJ5s8ig6Kg7iRO5UM	127	2	\N	1	2009-02-27 01:33:06.081395	2009-02-27 01:33:06.081395
454	209	sZePjJj7yAIh2UQxoT2DgWF5oUrE6nlH	127	weakly	\N	1	2009-02-27 01:33:06.729452	2009-02-27 01:33:06.729452
455	210	0LGmitU4kgRe0u1AueJUC6uGm7CpHqyZ	127	E	\N	1	2009-02-27 01:33:08.720836	2009-02-27 01:33:08.720836
456	241	I8i1gHSS79oXWQClHBBUl5LP8DBv8OqU	131	A	\N	1	2009-02-28 03:50:56.806942	2009-02-28 03:50:56.806942
457	242	Q4q0OYQ7XqXkaKGFdoAfygyk7RphWClt	131	A	\N	1	2009-02-28 03:50:58.530933	2009-02-28 03:50:58.530933
458	243	qC4TtJe6x7IgAN4dQYKZ72G1lEWLd2yy	131	A	\N	1	2009-02-28 03:51:01.989379	2009-02-28 03:51:01.989379
459	244	8nFvTmkm9qfJI464uojolQEvcYbM7fuQ	131	A	\N	1	2009-02-28 03:51:03.521492	2009-02-28 03:51:03.521492
460	245	mzfl6cUR5w3p5pFn7Zigo1upfCGM8IDJ	131	A	\N	1	2009-02-28 03:51:05.963299	2009-02-28 03:51:05.963299
461	248	csxSBQR7vVlfoZT6WSFdFu8FJhxPLRFI	132	A	\N	1	2009-02-28 04:23:04.855093	2009-02-28 04:23:04.855093
462	249	rf1qWNHCjgadvvqo8b4EfmYcLB9mLauf	132	1250	\N	1	2009-02-28 04:23:42.559731	2009-02-28 04:23:42.559731
463	248	v6ZPiiKoNnRlqQhH6WpeIi26ohhpHXrH	133	A	\N	1	2009-02-28 04:25:19.655932	2009-02-28 04:25:19.655932
464	249	zRL0vuCknPE2gnTBx8lTpgmla8TAXWMn	133	1200	\N	0	2009-02-28 04:25:22.834924	2009-02-28 04:25:22.834924
465	197	ZLYm5y8UHt0z4xTaKvDAZPsgRQ3gje7i	134	B	\N	1	2009-03-01 04:02:36.358989	2009-03-01 04:02:36.358989
466	250	pPYPpxeXCAhAELgAgfVJIAFrhlCrLFmn	136	C	\N	0	2009-03-01 04:26:21.53137	2009-03-01 04:26:21.53137
467	253	wZj0JQgWRBZfmfx4WqIEdDIBe4zwNM7s	138	81	\N	0	2009-03-01 04:29:10.198132	2009-03-01 04:29:10.198132
468	213	juY2rB8FTT37Fqq7UCydiYL7jc8jElYs	141	E	\N	1	2009-03-01 04:36:42.496371	2009-03-01 04:36:42.496371
469	211	3Xr38SpYfQIshlJt4140o3M4Zcvwv11u	141	C	\N	1	2009-03-01 04:36:43.159319	2009-03-01 04:36:50.690613
470	212	2YNk8tTIM7pWC0Fp4tSw78GV3OzAe2ty	141	A	\N	0	2009-03-01 04:36:56.803198	2009-03-01 04:36:56.803198
472	216	NCNIo7wBm4mQnkrjYHXxnoTO7mRBuCd6	141	E	\N	0	2009-03-01 04:37:31.057115	2009-03-01 04:37:31.057115
473	218	qsHm113pb0jQzqeuP28OZzRByoQD7FrC	141	B	\N	1	2009-03-01 04:37:40.005519	2009-03-01 04:37:40.005519
471	215	B5t56Ht0KiyLRO2lUaa1V5Ui6m27zfr2	141	D	\N	1	2009-03-01 04:37:06.366264	2009-03-01 04:37:46.146645
474	219	HYCRg1PLl6y5nsSIkTMTrodLWMsNyhEJ	141	D	\N	0	2009-03-01 04:37:57.91117	2009-03-01 04:37:57.91117
475	217	WCNgzGOzFdW2d9u16BYRkijfVu1TFqe5	141	D	\N	0	2009-03-01 04:37:59.313625	2009-03-01 04:38:08.454677
476	220	CNjyq4QPmxmPNmzWkGFubqA9hxAnbhK0	141	B	\N	1	2009-03-01 04:38:14.761516	2009-03-01 04:38:14.761516
477	223	Jq2kdAADEQ16dchtdBX7QEMgejrlxuu1	141	D	\N	1	2009-03-01 04:43:55.565567	2009-03-01 04:43:55.565567
478	228	Zr5SFojYsKS47kvOhdqEsKAi2Mi9S6U7	141	tenement	\N	0	2009-03-01 04:47:04.335564	2009-03-01 04:47:04.335564
479	229	guqOLLXE5GBt8jZ5iRn7zBMNTTmLHuP5	141	C	\N	1	2009-03-01 04:47:07.005005	2009-03-01 04:47:07.005005
480	211	SuIIuBLvykeldqkeBl65eyMQxQMK5t3B	144	C	\N	1	2009-03-02 05:24:05.920132	2009-03-02 05:24:05.920132
481	213	2Mix2qlG4VIz7RZm6XYVSaHM4G6Wazhy	144	E	\N	1	2009-03-02 05:24:10.361711	2009-03-02 05:24:10.361711
482	212	sEJ9wOLreFyr9AtvrCJOPcIbnMQMboIw	144	D	\N	1	2009-03-02 05:24:17.680998	2009-03-02 05:24:17.680998
483	215	I3SXVDTOHi5AccKwPGrfF9M7q6XnflpV	144	D	\N	1	2009-03-02 05:24:19.492523	2009-03-02 05:24:20.236315
484	216	6HUZv0lieDK2sYNaL92z0Z43HSjz8d6B	144	E	\N	0	2009-03-02 05:24:21.752461	2009-03-02 05:24:21.752461
485	217	qfJpzVuuqr0MUrmoqFNjLmLHCs50Mag6	144	A	\N	1	2009-03-02 05:24:23.203688	2009-03-02 05:24:23.203688
486	218	hQvp8XXhsm5KR9TDUSB1A3qgrPnsIhXn	144	B	\N	1	2009-03-02 05:24:25.726774	2009-03-02 05:24:25.726774
487	219	S9O9wiSETIbkRHv0DagYG8HaO7nnN2g7	144	A	\N	1	2009-03-02 05:24:27.14875	2009-03-02 05:24:31.623508
488	220	fHNaO6WP2GT3P7a9UFhuwIdmtGgcRV22	144	B	\N	1	2009-03-02 05:24:32.648345	2009-03-02 05:24:32.648345
489	223	ASraPAazaRtSBqOATpBLylrAwtWS7ExN	144	D	\N	1	2009-03-02 05:24:40.501325	2009-03-02 05:24:40.501325
490	228	k3Q1LQqSpgKYL1dt3Rt69nJAut0IdM7z	144	tenement	\N	1	2009-03-05 06:49:50.829174	2009-03-05 06:49:50.829174
491	229	zzmAUWTtuvxdhXkpZNxunH01i8P3ivBM	144	C	\N	1	2009-03-05 06:49:52.87231	2009-03-05 06:49:52.87231
492	260	F58QwkxLgiKjYl6AbraqpvK9x0ZjhvT8	145	A	\N	1	2009-03-05 06:54:37.075491	2009-03-05 06:54:37.075491
493	261	5vrumon7WiLWO4xLUeqiAVwUbUvG6iHs	145	A	\N	1	2009-03-05 06:54:39.541639	2009-03-05 06:54:39.541639
494	262	osCZUuWm5QcGd2e97IxjXthY7qLWuRWD	145	A	\N	1	2009-03-05 06:54:40.511461	2009-03-05 06:54:40.511461
495	263	m4DykGgFv9xbau5fTTnd7aVXaw9XY67I	145	A	\N	1	2009-03-05 06:54:49.56085	2009-03-05 06:54:49.56085
496	264	1Di6RNjQccgKjJUsfijXzEi39ANCxAJo	145	A	\N	1	2009-03-05 06:54:51.372766	2009-03-05 06:54:51.372766
497	265	cBLmYx4OSwhZ586KxT5bG75o8nqAb3I4	145	A	\N	1	2009-03-05 06:54:52.376581	2009-03-05 06:54:52.376581
498	266	Oi0jdXs9DR5x5GkK9Fx1q5Ebtpfnphx2	145	A	\N	1	2009-03-05 06:54:53.273666	2009-03-05 06:54:53.273666
499	267	2qlfjBch3BPa7fQ0ubTu6j1PNMUtpWnp	145	A	\N	1	2009-03-05 06:54:53.914652	2009-03-05 06:54:53.914652
500	268	9NXiEL4D0OvBzwVlMp6YLnKLbe0UMUEK	145	A	\N	1	2009-03-05 06:54:54.729289	2009-03-05 06:54:54.729289
501	269	vkC92ZekypG1z2ws4VO824yCaDNZRt1h	145	A	\N	1	2009-03-05 06:54:58.481355	2009-03-05 06:54:58.481355
502	271	wj7IkL1JQR7MDmR18RBnZWrmYL8sXohr	145	A	\N	1	2009-03-05 06:55:00.650723	2009-03-05 06:55:00.650723
503	272	BvMH7x8Sqx9XXXJs2XmETy9QqMSelnJF	145	A	\N	1	2009-03-05 06:55:01.303053	2009-03-05 06:55:01.303053
504	273	XjQwaJrKiLfzonnEZQA6Tix68eF4otxa	145	A	\N	1	2009-03-05 06:55:03.332919	2009-03-05 06:55:03.332919
505	274	PfnyQwQFpQd9w6wgqmujySAFM25uoL27	145	A	\N	1	2009-03-05 06:55:05.862748	2009-03-05 06:55:05.862748
507	276	JNTgxvSj9zt441lyWolxiTHTEqfA6nO3	145	A	\N	1	2009-03-05 06:55:10.106407	2009-03-05 06:55:10.106407
508	277	YOwvsRLzx03IcCgxWDixZVm2qT7XRKlh	145	A	\N	1	2009-03-05 06:55:13.674522	2009-03-05 06:55:13.674522
506	275	W2H681bfvAK8EyMsiWWeUFrNG4Kb1EN7	145	A	\N	1	2009-03-05 06:55:06.629416	2009-03-05 06:55:15.012065
509	278	N0l8jhrWUrrN7fXwzT6nTbxPIytvWtqe	145	A	\N	1	2009-03-05 06:55:16.627747	2009-03-05 06:55:16.627747
510	279	0BjHTlgoN19z62rBCVJY0c1II0VrvVUG	145	A	\N	1	2009-03-05 06:55:21.243881	2009-03-05 06:55:21.243881
511	280	gvfLgynh5mWqyWDYIXOQiwd8YPJDh95z	145	A	\N	1	2009-03-05 06:55:22.545852	2009-03-05 06:55:22.545852
512	281	8wfsv7YXJb2R8UpYR8kmJP2glxidRoOb	145	A	\N	1	2009-03-05 06:55:23.133763	2009-03-05 06:55:23.133763
513	282	CQQIIs12J7ZTqQGmS1sZPNXyZQpww5z8	145	A	\N	1	2009-03-05 06:55:24.249393	2009-03-05 06:55:24.249393
514	283	G5X8owrs9H90dmTZfoe0jllHGNzouU3H	145	A	\N	1	2009-03-05 06:55:25.260559	2009-03-05 06:55:25.260559
515	284	7hf70umrB1VGWAnPSTm4pCGs9oOhOQOq	145	A	\N	1	2009-03-05 06:55:26.45399	2009-03-05 06:55:26.45399
516	286	7IHQxjRdLK1VakFIe2X0U423mM9U1Asu	145	answer	\N	1	2009-03-05 06:55:29.366479	2009-03-05 06:55:29.366479
517	287	PUX2828XfBm4NGxXbvw2B1lLZSMXDSEc	145	answer	\N	1	2009-03-05 06:55:30.518512	2009-03-05 06:55:30.518512
518	288	8LAnSRWwWO5l7nwKpGgPCxqazeftLQni	145	answer	\N	1	2009-03-05 06:55:34.008914	2009-03-05 06:55:34.008914
519	183	iGd9rUvMVvPhfsQQSdxnxvLZpZ2dMYSr	146	state graph	\N	1	2009-03-12 22:21:29.463214	2009-03-12 22:21:29.463214
520	186	uwPQhx7PJlSamoIcHzlDAVwoG4qaYxyi	146	digraph	\N	1	2009-03-12 22:21:32.172033	2009-03-12 22:21:40.835951
521	187	2NeUKsEYxIVplgxQi1V4PXeT54etVkxP	146	de Bru	\N	1	2009-03-12 22:21:42.850891	2009-03-12 22:21:42.850891
522	188	DsPWLxbyOhRWdYY0gyJPpivcIIEuZtZg	146	V	\N	1	2009-03-12 22:21:44.972964	2009-03-12 22:21:44.972964
523	191	j2guR9mH1ILgyekR7qtuip6JI3Wiob1D	146	node	\N	1	2009-03-12 22:21:48.553938	2009-03-12 22:21:48.553938
524	197	HWzz1Fg889AhB99NoSsIbO8hJW6KEKa9	146	B	\N	1	2009-03-12 22:21:51.407644	2009-03-12 22:21:51.407644
525	201	SIniPbV27lL8W5zIA1QBzcxJsnkgbRaZ	146	3	\N	1	2009-03-12 22:21:54.435359	2009-03-12 22:21:54.435359
526	204	Mh4DuS8VO6noU4vAXaxdRsh72nVdK8Tx	146	0	\N	1	2009-03-12 22:22:02.306136	2009-03-12 22:22:02.306136
527	205	zr87tlyInfvvc3pPleJyzabE42OMsXjR	146	2	\N	1	2009-03-12 22:22:04.951981	2009-03-12 22:22:04.951981
528	198	LevjsDSc5V8iW7fmVBdpNLSGbalrj9Y8	146	B	\N	0	2009-03-12 22:22:10.063	2009-03-12 22:22:10.063
529	206	4fbAYhX1NejYY8VDI6dbiHPPjZSJiTzu	146	5	\N	1	2009-03-12 22:22:19.079921	2009-03-12 22:22:19.079921
530	207	XRqBJJdsBYdaVqlsxajENgAButl3rwh6	146	edges	\N	1	2009-03-12 22:22:21.201309	2009-03-12 22:22:21.201309
531	208	mhzsH4pZXxSGOl22xFfQBRe18ZNWHJPQ	146	vertices	\N	1	2009-03-12 22:22:23.400241	2009-03-12 22:22:23.400241
532	209	b14FHMDTTtki5UQBSS6E7dpy9ApEs6Gy	146	weakly	\N	1	2009-03-12 22:22:25.607111	2009-03-12 22:22:25.607111
533	210	0QszOOofckKuKrS7jvgjfSriOqPp4Pei	146	E	\N	1	2009-03-12 22:22:32.207261	2009-03-12 22:22:32.207261
534	291	95gXZvXe6nN6NdGhJUyn6EdWg91Arlgd	149	9472910010	\N	1	2009-03-12 22:27:01.957051	2009-03-12 22:27:01.957051
535	291	fOgXlGz3nrIapZbSkj8IEeWfY1cJHBuy	150	9.472910000e9	\N	1	2009-03-12 22:27:21.34099	2009-03-12 22:27:21.34099
536	291	xxDkKDDHUE6kmhG5cLa2It1iQiHjRggS	151	9000000000   472910000	\N	1	2009-03-12 22:28:02.805424	2009-03-12 22:28:02.805424
537	291	5WUURDkyWq0dMWqTIyUzyjo4t8V2rqSQ	152	1.35327286e9 x 7	\N	0	2009-03-12 22:28:47.667024	2009-03-12 22:28:47.667024
538	291	s4tCb7Sp0i3kO5dIvFWYucj3BfMf5U6Q	153	9e2	\N	1	2009-03-12 22:29:47.238869	2009-03-12 22:29:47.238869
539	291	SEmjRPK15T2fE7IvTYbmvMHEBj381MZg	154	9!	\N	0	2009-03-12 22:31:28.751815	2009-03-12 22:31:34.422192
540	309	3HMpAI9rsEq7TNllx37QqJ6KYjq7Vplv	155	B	\N	1	2009-03-13 17:48:30.816853	2009-03-13 17:48:30.816853
541	306	QvNPvspDuARHql9WI4yTMdUPJt8NGYmP	155	D	\N	1	2009-03-13 17:49:30.236601	2009-03-13 17:49:30.236601
542	317	7s1Rrpfm0jguVPJhZqd9890pft9IsU1c	156	A	\N	1	2009-03-14 04:34:46.827326	2009-03-14 04:34:46.827326
543	318	7FtkqVubWItUUjemGbZ10FLKLBbEylVI	156	2.1e-10	\N	1	2009-03-14 04:34:58.867745	2009-03-14 04:34:58.867745
544	310	P5HzJvnTvGG6PCLCadoNDtLNTCdxewrv	157	A	\N	1	2009-03-15 21:50:14.774123	2009-03-15 21:50:14.774123
545	309	lKPN6871hSX7LSn4uSwlRhFu4UWVnzUZ	157	E	\N	0	2009-03-15 23:35:25.244167	2009-03-15 23:35:25.244167
546	294	sAlgCoLDtruDn1kw7I2FSOh8bltZUCjB	158	C	\N	1	2009-03-16 03:59:01.273284	2009-03-16 03:59:14.564105
547	297	bWvebMCBTlbk44oRffALzAHFKEc2QKtR	158	A	\N	0	2009-03-16 03:59:20.93678	2009-03-16 03:59:27.267864
548	298	L0HOnIHxAWqvYr1PaEPzYKJ3alCkxFPv	158	B	\N	1	2009-03-16 03:59:56.293363	2009-03-16 03:59:56.293363
550	300	hksuOCff386egRxcbIWlGtBSfAYxgAUj	158	ford	\N	0	2009-03-16 04:00:39.026325	2009-03-16 04:00:39.026325
549	299	Joqf4aYmb4ts7e2A8y3mI4yR5Tdny8Hn	158	E	\N	1	2009-03-16 04:00:15.02386	2009-03-16 04:00:40.005421
551	301	Uut2ExisxZJEapCM2PYBNtK9GTnJgBGZ	158	B	\N	1	2009-03-16 04:02:22.509661	2009-03-16 04:02:54.710715
552	302	zJTkJ9DrHVdx6ECn8amavGYhscjz6aXG	158	automobile	\N	1	2009-03-16 04:05:02.258056	2009-03-16 04:05:02.258056
553	310	xZgaiL5Nw4QMBYfk03gMueNTfv9CnjFU	158	A	\N	1	2009-03-16 04:05:03.103701	2009-03-16 04:05:03.103701
554	309	VvSdrvFc8lN0Hd5vgWlB9GVYMEqkUiDn	158	B	\N	1	2009-03-16 04:05:03.271705	2009-03-16 04:05:03.271705
555	308	JpX5NN3N2dSVNlVuhGhuqLjlBJZotcYx	158	automobile	\N	0	2009-03-16 04:05:03.884132	2009-03-16 04:05:03.884132
556	306	yHdq5tpdt0j0h7Yd7TW9PDwzIwXUcfzw	158	D	\N	1	2009-03-16 04:05:04.381199	2009-03-16 04:05:04.381199
557	311	ipE11C3G0o0vL0GUMYFSffD3PLM9OdNp	158	D	\N	1	2009-03-16 04:05:41.752005	2009-03-16 04:05:41.752005
558	320	FX63QSY6lnpzOsTyymSWwydDnrEBR5fd	158	C	\N	1	2009-03-16 04:05:50.690713	2009-03-16 04:05:50.690713
559	321	nZH1YcEZrIAtqf8XAoI5tqeLfYAmL6dE	158	B	\N	1	2009-03-16 04:06:05.509602	2009-03-16 04:06:07.898153
560	322	lEQjRxN2nIUSkb1AuRlxI7YQkalYR1px	158	E	\N	0	2009-03-16 04:06:23.721303	2009-03-16 04:06:27.217695
561	323	vve964GlAZWZ2PNxTAH0PlEsASGkK8ys	158	E	\N	1	2009-03-16 04:06:35.366433	2009-03-16 04:07:01.756093
562	324	3E41d2JfYNYh8W66GCYonDeblPl57Pw2	158	D	\N	0	2009-03-16 04:07:46.258077	2009-03-16 04:07:46.258077
563	326	AlQrBlz1vU2ZobB0mo4eJJZoJnYw6BEH	158	verticle 	\N	0	2009-03-16 04:08:26.247071	2009-03-16 04:08:26.247071
564	327	UFf1ymn4F92un3REH9qSAiJ1QWexOUri	158	D	\N	1	2009-03-16 04:08:26.625819	2009-03-16 04:09:50.301166
565	328	9XL0PC60lAOlqieEmfwl5HymayNMaFHO	158	A	\N	1	2009-03-16 04:10:13.682927	2009-03-16 04:10:13.682927
566	329	vb4sVkVT9uNihhHZS0ew6WCoAgqpKc8s	158	A	\N	1	2009-03-16 04:11:21.684029	2009-03-16 04:11:21.684029
567	330	bwVuMxXSLV3zww5wjfP0ZlRqtbAzPkhc	158	agriculture	\N	0	2009-03-16 04:12:37.753377	2009-03-16 04:12:37.753377
568	331	PzdT6zmPPx9F3yTfkOoZyI4n6l3QkmZm	158	E	\N	1	2009-03-16 04:12:38.040623	2009-03-16 04:12:44.196728
569	332	IrQvs2Avo36kGu0gc7LXx5L5JoeHh0LW	158	E	\N	1	2009-03-16 04:13:03.515329	2009-03-16 04:13:03.515329
570	333	MeQz0AgXCYZEFhGgSLk5IvSTPeLu4zWL	158	E	\N	1	2009-03-16 04:13:25.170601	2009-03-16 04:14:15.888068
571	335	czV2LNo3tUmYggz8JZgcimhqGM32cHYv	158	investment	\N	1	2009-03-16 04:15:11.834044	2009-03-16 04:15:11.834044
572	336	myGkSaSUmcDYhFVQjRF5FlpU2YSRQZrz	158	C	\N	1	2009-03-16 04:15:12.395855	2009-03-16 04:15:12.395855
573	183	xvTBDBrvbVrTrTUnvqrcOQ4i8u4qhZEU	148	state graph	\N	1	2009-03-21 07:10:14.181654	2009-03-21 07:10:14.181654
574	186	Or7ItgwypngxCx29a9u7XFSC3YAqio9N	148	digraph	\N	1	2009-03-21 07:10:16.210864	2009-03-21 07:10:16.210864
575	187	Ny5TQ3fSVmc1VOIoHSD3aF3eytfYF2c3	148	de Bruijn	\N	1	2009-03-21 07:10:35.163115	2009-03-21 07:10:35.163115
576	197	UMVZBWLuHu4DOcIjUBgeNaKvzNyBmnow	148	B	\N	1	2009-03-21 07:10:35.556082	2009-03-21 07:10:35.556082
577	191	PAYcYOURXWwBvtVInhADElhd70J085rX	148	node	\N	1	2009-03-21 07:10:36.033016	2009-03-21 07:10:36.033016
578	192	67tGNSDVVIt9kp8K0hgZADEGaZxuFt6U	148	E	\N	1	2009-03-21 07:10:36.243032	2009-03-21 07:10:36.243032
579	190	ox7dt6KMDnjLRzz2PGAIU9ewKsWEySRt	148	B	\N	1	2009-03-21 07:10:37.115209	2009-03-21 07:10:37.115209
580	188	akqRrixpyUAoNEo1L8i0jXeZnfkJkIkH	148	V	\N	1	2009-03-21 07:10:37.798157	2009-03-21 07:10:37.798157
581	201	VIJYElk6dgf9TGG4VV6xB0Wltpg1krk0	148	3	\N	1	2009-03-21 07:10:37.958052	2009-03-21 07:10:37.958052
582	204	VkKnkmukV0jhHiB7GAKche6OXbAtzlE4	148	0	\N	1	2009-03-21 07:10:38.454779	2009-03-21 07:10:38.454779
583	205	8V0kVLCJUaWScRFF3qiV1B3kGxenvJ4w	148	2	\N	1	2009-03-21 07:10:44.285133	2009-03-21 07:10:44.285133
584	198	KHoMtTAitClkKkPhJ87PjoA7ZeyWc4og	148	D	\N	1	2009-03-21 07:10:44.471617	2009-03-21 07:10:44.471617
585	206	9slSDZVeNIU5msM7hveksoUxyXoHRrTW	148	5	\N	1	2009-03-21 07:10:46.927998	2009-03-21 07:10:46.927998
586	207	1K6t1IODhUd6DiTN48O9ZzIT0UXKQt3R	148	edges	\N	1	2009-03-21 07:10:48.9738	2009-03-21 07:10:48.9738
587	208	UqEENIgacjrVpM14myuUmIRsT6i8m0hT	148	vertices	\N	1	2009-03-21 07:10:50.597462	2009-03-21 07:10:50.597462
588	209	zLSFcc3WtDbGh3MV1cQYbi2SpOvCr7Mb	148	weakly	\N	1	2009-03-21 07:10:57.082544	2009-03-21 07:10:57.082544
589	210	RKdSTi9Zy7VwjUL0zaTGI69UWjyew4Md	148	E	\N	1	2009-03-21 07:10:57.331534	2009-03-21 07:10:57.331534
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: app49565
--

COPY items (id, ref, type2, url, text, points, c1, c2, c3, c4, c5, answer, explanation, context, pc_error, capitalize, levenshtein, order_index, quiz_id, created_at, updated_at) FROM stdin;
139	JNAsQrkdgOPbnGteCRdykzjBDcSG84Kd	1		Multiple-Choice Section	\N									\N	\N	\N	0	20	2008-12-25 18:29:47.28553	2008-12-25 18:30:03.73215
130	QwZGHQDXXPei9myfvXbh2NsgAKA3mDDT	3	http://www.stmary.ws/physics/home/hand_4/regentsReviewSheets/Dynami4.gif		\N	198	226	236	270					\N	\N	\N	1	20	2008-12-25 05:51:03.48865	2008-12-25 18:33:00.589442
132	QFVVINmzye5ryfXLpeTFP9eGs2qIVfr9	3	http://www.stmary.ws/physics/home/hand_4/regentsReviewSheets/elongation.gif		\N	268	204	310	236					\N	\N	\N	3	20	2008-12-25 05:57:46.131203	2008-12-25 18:33:10.599227
141	Jgq2a0j3FlSHDzzYOdwqewFBEG3ky6So	3	http://www.webassign.net/sfhs99/6-13.gif		\N	116	89	224	171					\N	\N	\N	5	20	2008-12-25 18:34:27.984711	2008-12-26 02:55:41.533134
131	b9wYnK08y8XRWeN1pQYi2IzQNX2JevKb	4		Which graph best represents the\nrelationship between gravitational potential energy (PE) and\nheight (h) above the\nground for an object near the surface of Earth? 	1	1	2	3	4		A	mgh is linear. The only linear, non-constant graph is 1.		\N	\N	\N	2	20	2008-12-25 05:52:12.925696	2008-12-28 02:04:13.965402
144	xk0GmB5IyYXqkme3UK9WWgCuiSCbwFY1	5		A tennis player places a 58 kg ball machine on a frictionless surface. The machine fires a 0.057 kg tennis ball horizontally with a velocity of 31 m/s toward the north. What is the final velocity of the machine?	5	m/s to the south	2.5				0.03			\N	\N	\N	6	20	2008-12-26 02:27:35.512014	2008-12-28 02:04:29.850686
146	xDigiuPpsjVIzkhfQqHl9tUghmfipzDx	5		What is measured in newton seconds?	2		2.0				Impulse			\N	\N	\N	7	20	2008-12-26 03:50:21.914735	2008-12-28 02:04:34.53316
133	2HIZhsHH6FxfAEdNfMll4G0g1OPBFDkY	4		The graph above shows elongation as a function of the applied force for two springs,  A and B.  Compared to the spring constant for spring A, the spring constant for spring B is 	2	Greater than that of A	The same as that of A	Less than that of A	     		A	The graph shows that B requires the same force to stretch a lesser distance. Thus it has more force per meter, and a GREATER SPRING CONSTANT.		\N	\N	\N	4	20	2008-12-25 06:02:11.145076	2008-12-28 02:40:32.524777
149	i7SvfVaKa1KIskeFLJETJmeWADjfm1Rx	3	http://www.webassign.net/giancoli5/2_29.gif		\N	0	0	300	138					\N	\N	\N	0	26	2008-12-28 22:34:49.269105	2009-01-02 21:42:03.943525
158	rPLGMGPeJfQx5ZaV5Y440sNJLLerLSBb	5		The magnitude of C - A - B	1		3.0				114.75			\N	\N	\N	7	26	2008-12-28 22:55:13.186329	2009-01-02 21:42:04.021414
159	kJumvbVM8cTO5Xava1V1ahsJrGV2viR8	5		The direction of C - A - B\n	1	° (counterclockwise from the +x axis is positive)	3.0				-107			\N	\N	\N	8	26	2008-12-28 22:55:58.594988	2009-01-02 21:42:04.025347
160	RqijprX7pMy1ciXXGj01krT1qkkvNOgD	2		A swimmer is capable of swimming 0.95 m/s in still water.	\N									\N	\N	\N	9	26	2008-12-28 22:57:18.840989	2009-01-02 21:42:04.029328
161	KPPFlkt5iwvX5ZLvpeCuACYoOOvnPm1u	5		If she aims her body directly across a 150 m wide river whose current is 0.60 m/s, how far downstream (from a point opposite her starting point) will she land? 	1	m	3.0				94.74			\N	\N	\N	10	26	2008-12-29 01:28:33.721337	2009-01-02 21:42:04.033258
162	MtB2f9z5NOSLfpnHo8CG83PCs6jGrndp	5		How long will it take her to reach the other side?	1	s	3.0				157.89			\N	\N	\N	11	26	2008-12-29 01:51:19.256895	2009-01-02 21:42:04.036971
151	Rw629VmIexy7CmYJiBVBvw9PFVGPNMay	2		A person driving her car at 59 km/h approaches an intersection just as the traffic light turns yellow. She knows that the yellow light lasts only 2.0 s before turning to red, and she is 30 m away from the near side of the intersection. Should she try to stop, or should she make a run for it? The intersection is 15 m wide. Her car's maximum deceleration is -6.8 m/s2, whereas it can accelerate from 59 km/h to 70 km/h in 3.3 s. Ignore the length of her car and her reaction time. 	\N									\N	\N	\N	1	26	2008-12-28 22:37:34.56274	2009-01-02 21:42:06.98395
152	tL7OWFvgZk44lv1JlQNUbIE16j2Av0To	5		If she hits the brakes, how far will she travel before stopping?	1	m	5.0				19.75			\N	\N	\N	2	26	2008-12-28 22:38:59.724567	2009-01-02 21:42:16.468726
153	3tZrMWSjoRuHcq3Ca9ppBLRoqjHrVQof	5		If she hits the gas instead, how far will she travel before the light turns red?	1	m	5.0				34.62			\N	\N	\N	3	26	2008-12-28 22:40:25.670333	2009-01-02 21:42:16.506859
154	rBeNkf8YxIiWQTCvF9L0BLJbP6aipLYc	5		A rock is dropped from a sea cliff and the sound of it striking the ocean is heard 6.2 s later. If the speed of sound is 340 m/s, how high is the cliff? 	1	m	3.0				161			\N	\N	\N	4	26	2008-12-28 22:41:51.135914	2009-01-02 21:42:16.511867
156	IwWraRIPZR96XDsTwOMajHJbWCwKQNxy	3	http://www.webassign.net/giancoli5/3_35alt.gif		\N	243	203	243	203					\N	\N	\N	5	26	2008-12-28 22:45:25.540968	2009-01-02 21:42:22.800443
157	30jUbh6NVoebDzc5mr8nr8TtXuRVDb1u	2		For the vectors shown in the figure (A = 63.0 and θ = 56.5°), determine the following.	\N									\N	\N	\N	6	26	2008-12-28 22:46:01.868081	2009-01-02 21:42:22.954206
163	ZcHFGKD8fATnCWiljYp9fLug3GgNysJf	4		What is the name of the Auto Pilot in Wall-e?	1	M-O	AUTO	EVEA	Captain	Aut-o	B	No explanation provided. Add one?		\N	\N	\N	0	27	2009-01-02 21:26:22.199995	2009-01-02 21:50:56.994137
164	Rbjuo47FqAZ718sZ3fkfccXbMWSRkcTv	3	/images/diagram.gif		\N	0	0	0	0					\N	\N	\N	1	27	2009-01-02 21:27:33.4411	2009-01-02 21:50:57.459391
165	v7SOIHNXATWHbajCL4pcAvS2Jlad68d1	5		What is the name of the room where EVE gets repaired?	1	The ______________					The Repair Ward			\N	\N	\N	4	27	2009-01-02 21:27:59.945012	2009-01-02 21:54:50.084014
168	A1iPyvBLUTB7erMNEPfu4V6iyrZYsTNc	5		Who is this?	1		2				Auto			\N	\N	\N	3	27	2009-01-02 21:54:44.019666	2009-01-04 02:33:30.00051
167	Uf8lo9chads3lgsl5XGdjrZwZQlBzjuv	3	http://img205.imageshack.us/img205/2033/picture1ks0.png		\N	194	223	318	365					\N	\N	\N	2	27	2009-01-02 21:54:20.640052	2009-01-02 21:55:34.461106
169	oDYz6xRpgSMB0z54dXfYdEsgUpY9UBTU	4		Which is the best dick?	1	Big	Small	Bigish Small	Smallish big	not right	A			\N	\N	\N	1	28	2009-01-04 02:30:10.672437	2009-01-04 02:31:05.320696
170	vS88hdMYdLLSSbskSf1qtHa0avlmQfya	4		Hello	1	你号      	你好     	再见     			B	Each pronunciation has multiple characters associated with it. 		\N	\N	\N	1	29	2009-01-17 05:19:22.693627	2009-01-17 05:24:01.661414
171	xpXujcNd7VTOXZyhaxnF5cmieqitmDbz	4		Goodbye	1	在见   	在间   	再见  	在建  	再好 	C			\N	\N	\N	2	29	2009-01-17 05:20:22.416948	2009-01-17 05:24:13.014414
172	lER5Uvdi7cDYkxkV3XkYeVDxmXLo4KqI	5		You (informal) came very early	2		1				你来得真早	To describe the act of coming, 得 must be used		\N	\N	\N	3	29	2009-01-17 05:25:36.071738	2009-01-19 22:41:07.862988
180	UijxMHcGPWNd9NvZKWp7GNukSA7JQkWw	1		Terms & Concepts Section	\N									\N	\N	\N	0	31	2009-01-22 03:50:41.548832	2009-01-22 03:51:22.555461
182	WqMJrWyiiPcZp8vU05pwECEyu7DaQHTZ	1		Problems Section	\N									\N	\N	\N	1	31	2009-01-22 03:51:05.460869	2009-01-22 03:51:23.486439
188	757qIQHqCP0nVTkgslD07kfeATtakv3Y	5		The variable for the set of all points:	1						V			\N	\N	\N	4	30	2009-01-22 04:50:34.435074	2009-01-22 05:37:32.496173
189	d8HsgZQl7nucEDxTZ63eAdhXJC91aEBu	2		Consider A = {5, 3} B = (2, 1) C = {3, 5} D = (1, 2)	\N									\N	\N	\N	5	30	2009-01-22 04:55:16.751724	2009-01-22 05:37:33.934867
190	cQOPsga8rYyCZ1B4Xk0YjuLHjRNNY6WM	4		Which two are the same?	1	BD	AC	None			B			\N	\N	\N	6	30	2009-01-22 04:56:38.311511	2009-01-22 05:37:34.931348
196	BgYGmyGU6glS7vGj81HWn8qumItc71Sn	3	http://www-math.cudenver.edu/~wcherowi/courses/m4408/gtaln3p1.gif		\N	363	144	363	144					\N	\N	\N	10	30	2009-01-22 05:29:46.178115	2009-01-22 05:38:47.963786
202	c5vNlErmPbu0mmchL18T2DJZfQ9RLqGN	2		Use the below graphs for the next few questions:	\N									\N	\N	\N	9	30	2009-01-22 05:38:37.547397	2009-01-22 05:39:00.431868
210	agk6ZhCUqpZxOgF76zYbl1pzNzTrv5y0	4		Which of the following conditions makes a digraph a tree?	1	With edge directions removed, it is cyclic	With edge directions removed, it is acyclic	All vertices except one have indegree 1	All vertices above the bottom level have outdegree 2	B and C	E			\N	\N	\N	20	30	2009-01-22 05:57:26.679446	2009-01-22 06:00:33.971678
187	pEYZ1zuOL95Uo2ZRzRU5IDtH6HSDXGFv	5		The hotel keypad sequence problem uses 	2	cycles	3				de Bruijn			\N	\N	\N	3	30	2009-01-22 04:44:52.1174	2009-01-22 06:01:03.848721
207	tgL91Z5sEtekzTD5dl1cHLeFlNv8KWTu	5		An Eulerian path is all	0.5						edges			\N	\N	\N	17	30	2009-01-22 05:47:59.073813	2009-01-22 06:03:15.034493
208	vv4hdu1sFanBDKXmn9hdi0CbNEzjgkjy	5		A Hamiltonian path is all 	0.5						vertices			\N	\N	\N	18	30	2009-01-22 05:48:27.395013	2009-01-22 06:03:44.361521
212	vVIJ1H7VUtsZM4IXGvzKUzg7lXOx3bD9	4		Between 1860 and 1910, the rural population..	1	decreased	dramatically decreased	increased	dramatically increased	remained stagnant	D			\N	\N	\N	2	32	2009-01-22 23:58:22.601776	2009-01-23 00:00:46.460919
201	KegcQLXlCB8zrnTzxDy2e2lWdNDkBwB9	5		What is the degree of vertex 1 in the left graph?	1						3			\N	\N	\N	12	30	2009-01-22 05:38:21.293641	2009-01-28 21:57:53.888756
204	rMRnewPyehDcsiI3zlZlMgTqlzqHsIDb	5		What is the indegree of vertex 7 in question #2?	1						0			\N	\N	\N	13	30	2009-01-22 05:41:48.914663	2009-01-28 21:57:54.651297
205	BaTduCD34hBarZIOfAYzbCyNiGS7aDCU	5		What is its outdegree?	1						2			\N	\N	\N	14	30	2009-01-22 05:42:19.236551	2009-01-28 21:57:55.538022
198	jVKUPLBuZETpqTlsPxFSGsPgddBF9ZiA	4		Graph isomorphism is..	2	Symmetric	Transitive	Reflexive	An equivalence relation	none of the above	D			\N	\N	\N	15	30	2009-01-22 05:31:34.66233	2009-01-28 21:57:56.630424
192	JZuntJmbgQWjS5nsDEkFYu2CEI3x0KUB	4		A loop..	1	Is a multi-set	Adds 2 to the degree of a vertex	Can only be found in multigraphs	A and C	All are correct	E			\N	\N	\N	7	30	2009-01-22 05:08:46.683739	2009-01-28 21:57:58.62188
191	lSBP7YEETOopkLWWaU4EDcz28Ba2Sr8d	5		Complete the analogy: Vertex is to edge as 	2	is to branch					node			\N	\N	\N	8	30	2009-01-22 05:01:45.669612	2009-01-28 21:57:59.494428
211	WZ84n1pcXyWqKeY3v0wD7qCtvjDqCzW2	4		Urban growth was motivated by all of the following except..	1	workers seeking higher wages	immigration 	natural growth	a desire to be with friends and relatives	glitter and excitement	C			\N	\N	\N	0	32	2009-01-22 23:54:10.317795	2009-01-29 22:32:24.794208
217	TqotV4bVgFPSyzUoLklQH2Cx4FQpeT4s	4		Which factor was most responsible for the transformation of city architecture?	1	Technology	The migration of skilled architects and businessmen to the cities	A large workforce	Lower material costs	Government grants	A			\N	\N	\N	5	32	2009-01-23 00:15:57.452195	2009-01-29 22:32:28.516528
218	aqCONkC8C5S7Jsb2ZaC7Pj4HMRD3YWDI	4		The architectural revolution began in..	1	New York City	Chicago	Philadelphia	Boston	Baltimore	B			\N	\N	\N	6	32	2009-01-23 00:18:59.27532	2009-01-29 22:32:29.495321
219	vq1RYGgNthTbCmCQgK0k2h7KtVR4hPr9	4		All of the following were famous architects except..	1	William Howells	Louis Sullivan	Frank Lloyd Wright	John Root	James Ware	A			\N	\N	\N	7	32	2009-01-23 00:40:44.039046	2009-01-29 22:32:30.521787
220	woJEQZA38Ufs8dm4sMnqK3HsAwE6aoTq	4		Which architect is most associated with the rise of the skyscraper?	1	William Howells	Louis Sullivan	Frank Lloyd Wright	John Root	James Ware	B			\N	\N	\N	8	32	2009-01-23 00:44:48.454427	2009-01-29 22:32:31.525129
223	Ttx0MNLlri5IMKK4v4HopwskkzXrWtfo	4		The development of streetcars and subways led to all of the following except..	1	Increased urban size	The growth of suburbs	Segregation of districts	Improved conditions	Segregation of classes	D			\N	\N	\N	9	32	2009-01-23 00:54:01.712583	2009-01-29 22:32:32.480006
227	YbU8a6dVqRNKpYPXhNoiEE78Byio5XJX	3	http://www.todaysteacher.com/TheGreatDepressionWebQuest/images/tenement.gif		\N	128	128	64	64					\N	\N	\N	10	32	2009-01-23 01:05:47.174221	2009-01-29 22:32:33.474732
229	BDylnp3TkYhIJ0YOTjSc30hwKJCITFN2	4		The author of How the Other Half Lives	1	Samuel Loomis	H. L. Mencken	Jacob Riis	Jane Addams	William Howells	C			\N	\N	\N	12	32	2009-01-23 01:11:20.504557	2009-01-29 22:32:35.325665
215	A0fpMKgkf0iZy7bEONB0fj1LHalrIv9q	4		This journalist reflected the country's fascination with the city	1	Jacob Riis	Louis Sullivan	H. L. Mencken	William White	Samuel Loomis	D			\N	\N	\N	3	32	2009-01-23 00:06:44.109297	2009-02-18 05:34:33.025814
216	fLa1iGgJ9qDMTdnDKRwa9TWeDPrtbOdT	4		By 1920, what percentage of Americans lived in cities of eight thousand people or more?	1	15%	25%	33%	50%	75%	D			\N	\N	\N	4	32	2009-01-23 00:10:49.36555	2009-02-18 05:34:38.38179
213	epwffnylA4gLWugvtI8Xa6PBtIUt8TXw	4		Which group saw the most significant migration?	3	Irish	Germans	Chinese	Polish	African Americans	E			\N	\N	\N	1	32	2009-01-23 00:01:28.487527	2009-02-19 02:13:09.687632
230	b9gSV29zHcjB78jK0bDTqvpLGUVCjHGx	1		Dijkstra	\N									\N	\N	\N	1	34	2009-02-19 04:16:27.509636	2009-02-19 04:16:54.869806
231	qUYhSdvL7g5AA8VbkQWQoi0B5sSCxdgG	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	1	35	2009-02-20 20:55:03.200919	2009-02-20 20:55:03.200919
209	DffSNauF2PM7TGRhqSlw9byWh3lfLpX5	5		The graph in #2 is 	1	connected					weakly	Remember, the definition of weakly connected is that the underlying graph is <em>connected</em> when the directions are removed.		\N	\N	\N	19	30	2009-01-22 05:55:41.732942	2009-02-26 04:42:58.060558
206	94NBVGnQ0HIWI60J02I50ow1qBdfypyX	5		How many edges does a graph with vertices of degree 3, 4, 2, and 1 have?	2						5	The sum of the degrees of the vertices is two times the number of edges.		\N	\N	\N	16	30	2009-01-22 05:44:51.095523	2009-02-26 05:11:19.571186
197	VTAaaYvBEpzpi4cTv0YgEkWRN0Vcyj3k	4		Are the above two graphs isomorphic?	1	Yes	No				B			\N	\N	\N	11	30	2009-01-22 05:30:54.139958	2009-02-26 05:16:38.509806
183	aWileafeLV1vv1Irq4yEf5loygvudZLn	5		A graph in which each vertex represents a possible configuration:	1						state graph			\N	\N	\N	0	30	2009-01-22 04:34:00.790481	2009-02-26 05:24:52.538519
232	mpZ7EvqaO1nMjeUoa4ERxCtg9xT0ZkQH	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	1	36	2009-02-26 05:29:52.721256	2009-02-26 05:29:52.721256
233	D6Ne5jjT00PvflNOzf5lYPOBvrqHjIFQ	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	1	37	2009-02-26 05:33:15.33969	2009-02-26 05:33:15.33969
234	nSLlx1BBLUP7aXD6uazSJp37koJ3bPzH	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	1	38	2009-02-26 05:37:19.511255	2009-02-26 05:37:19.511255
235	ZEc467bGfrJmC6K9KrCTYOBxFHo5R92s	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	1	39	2009-02-26 05:56:54.199627	2009-02-26 05:56:54.199627
236	g2juzSq3Wh9wtnHLG58uNRt6PxHa98fq	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	1	40	2009-02-26 05:58:23.144824	2009-02-26 05:58:23.144824
237	kXbMagr4q5ce9jssvppk77P4fpqLimDs	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	1	41	2009-02-26 05:58:51.54118	2009-02-26 05:58:51.54118
186	zkVnMmA5QguX1lEzbY9L22ElKsFv5KR4	5		The above is an example of a:	1		1				digraph			\N	\N	\N	2	30	2009-01-22 04:44:24.825037	2009-02-27 00:57:32.788846
238	szgnRKxTfE62ZbL9wv7jIIawwPneOtn2	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	1	43	2009-02-27 01:26:33.938835	2009-02-27 01:26:33.938835
239	j05fG1ijGI3H4lzmmgHncixNYnkzEvH8	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	2	43	2009-02-27 01:26:35.170405	2009-02-27 01:26:35.170405
240	msAzrNB8jc8pWijQ2WstZv3812h7oPcp	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	3	43	2009-02-27 01:26:35.998683	2009-02-27 01:26:35.998683
241	IdgtG2Z42Z4gjFAN0F0D3IedQrCvTC19	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	1	44	2009-02-27 01:33:53.844217	2009-02-27 01:33:53.844217
242	yjXntWAtXrdfEr3hE7mqlXqlMB5Ww6Mv	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	2	44	2009-02-27 01:33:56.010101	2009-02-27 01:33:56.010101
243	e0UxzJXNhEBH1O7xoeO3YWYa7z4ySgRU	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	3	44	2009-02-27 01:33:56.573202	2009-02-27 01:33:56.573202
244	2apfl4GWjr548ZlkbAjMsAHf9cD3V1VD	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	4	44	2009-02-27 01:33:58.943383	2009-02-27 01:33:58.943383
245	5GLORYEQsBY2qSyQaNTaCkM8GOlYZo7j	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	5	44	2009-02-27 01:33:59.276631	2009-02-27 01:33:59.276631
246	Rd7l7MnKCgipa2wtOZRJZxWUCvnKHFUY	1		Remote Sensing Quiz	\N									\N	\N	\N	1	45	2009-02-28 04:20:39.028603	2009-02-28 04:20:45.528035
247	Fs4g1A3jyAX8NN9Bey4seVYXWQOB4a28	2		This quiz features two parts: a sensing part and a global warming part.	\N									\N	\N	\N	2	45	2009-02-28 04:20:49.882083	2009-02-28 04:21:15.411866
248	1FxQnglS82sXjJbc1PrR9mBEIbVagcIG	4		Remote sensing refers to the process of..	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	3	45	2009-02-28 04:21:18.607284	2009-02-28 04:21:29.490657
249	QW7dUwxr68YT6Fquh0CegVv6a7BIKy3l	5		What is the solar constant?	1	watts/meter squared	5.0				1300			\N	\N	\N	4	45	2009-02-28 04:21:43.098179	2009-02-28 04:23:25.614917
255	BBsvcuK0zxWjoEo3E5HexeyBYm42WsYl	3	/images/diagram.gif		\N	64	64	0	0					\N	\N	\N	2	48	2009-03-01 04:27:46.487556	2009-03-01 04:28:04.703569
254	58sbh2aXqG71KEx5D2EE9lOogM98RLUY	3	/images/diagram.gif		\N	0	0	0	0					\N	\N	\N	1	48	2009-03-01 04:27:45.805064	2009-03-01 04:28:19.244477
256	K5UH6d9lf9PuFeeriI10PTs8SlMy2EKT	3	/images/diagram.gif		\N	128	128	64	64					\N	\N	\N	3	48	2009-03-01 04:27:47.9503	2009-03-01 04:28:24.089297
228	5IIOvv5AZji3CZ8yrNuw7blmfAycZ7WR	5		The above picture depicts a 	1		2				tenement			\N	\N	\N	11	32	2009-01-23 01:06:31.417666	2009-03-02 19:44:31.630246
257	1jQkAZzjwBTNwAPHbFsyLqWaMTWXNv3s	1		Chapter 21 Questions	\N									\N	\N	\N	0	50	2009-03-02 22:11:23.737074	2009-03-02 22:11:51.034018
260	H627IPu265KyNNGAONLK1oYCM4DGYgOR	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	2	50	2009-03-02 22:12:35.676783	2009-03-02 22:12:47.772492
261	u0scpL1P1bRX8HY1xbJcuV7mIcLbIniA	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	3	50	2009-03-02 22:12:36.7661	2009-03-02 22:12:47.777283
262	M31kd21mrd0xZS9xiMXC0kAKVyEQavNT	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	4	50	2009-03-02 22:12:37.709414	2009-03-02 22:12:54.176119
263	aP2XYfLQdx8dr2sFumxAykqYh5uqHLZn	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	5	50	2009-03-02 22:12:38.603587	2009-03-02 22:12:54.181836
264	s4um3ywkm3OiGdTP4QIx36vGqIFvvT2Z	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	6	50	2009-03-02 22:12:39.115211	2009-03-02 22:12:54.186147
265	ysZcCobl2iyCoWueJXdZQQIjxCjRKOB6	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	7	50	2009-03-02 22:12:39.383863	2009-03-02 22:12:54.189996
266	uU2KsOieFSj8NJVu2P3s1CsDMZZO0hFs	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	8	50	2009-03-02 22:12:39.823741	2009-03-02 22:13:00.474589
267	x3KfRrzwckyUSRUzWsBcv1xOb1uwRd5T	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	9	50	2009-03-02 22:12:40.376009	2009-03-02 22:13:00.479706
268	GNXLssG6fWGo1jaeAb4PqAarItwzSRQU	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	10	50	2009-03-02 22:12:41.086932	2009-03-02 22:13:00.483514
269	cjZzqExeH5WIJlPZxdd5VP1jWdLTvX6y	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	11	50	2009-03-02 22:13:23.178204	2009-03-02 22:13:35.814873
270	5r9e3ZhPfocxbu5xrEQZLz8Wgk9coSnh	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	12	50	2009-03-02 22:13:23.696043	2009-03-02 22:13:36.099647
271	WMwq3YjQ5RGUj30bhFJiGg5rppLfrpEi	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	13	50	2009-03-02 22:13:24.501882	2009-03-02 22:13:36.104427
272	uly8RlHmTUG2hFSdO0ZTLRr6ATmS1Q4Q	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	14	50	2009-03-02 22:13:25.066207	2009-03-02 22:13:43.179402
273	KLb8cQyMIxpmMAw2l5yDGvwc4a0AbPCJ	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	15	50	2009-03-02 22:13:25.225425	2009-03-02 22:13:43.186417
274	xbolKkJSIXbY0qe9oOgqCwTgBjkm74He	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	16	50	2009-03-02 22:13:25.7071	2009-03-02 22:13:43.190491
258	Btu3Q9YXznMwNaEfMlRvy26MdjMZdoO7	1		Chapter 24 Questions	\N									\N	\N	\N	17	50	2009-03-02 22:11:33.043873	2009-03-02 22:13:43.194819
275	h5OMPrNdkM8ViVDojqjLb1FW89k6jR4Z	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	18	50	2009-03-02 22:13:48.962184	2009-03-02 22:13:48.962184
276	ZHKhTbTatiPEp9IBzcJnl26xM9GX2ZlV	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	19	50	2009-03-02 22:13:49.300209	2009-03-02 22:13:49.300209
277	Rspyh7ADKXVqXf7lBh2wlh1LRsmVVPLX	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	20	50	2009-03-02 22:13:49.670709	2009-03-02 22:13:49.670709
278	WCAINpFYvg9Zg6DiQcmw82hDM5TL3DDA	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	21	50	2009-03-02 22:13:50.183022	2009-03-02 22:13:50.183022
279	uug0SHssUHbInNnRXXjh3moBp60u5Pq9	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	22	50	2009-03-02 22:13:50.408797	2009-03-02 22:13:50.408797
280	tqWAxeQo9B9c6I6bb0dxMK2SkiGdskXN	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	23	50	2009-03-02 22:13:50.878733	2009-03-02 22:13:50.878733
281	zR5XnizYXq7Febj1UyZENLsHFYlcZdQO	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	24	50	2009-03-02 22:13:51.253987	2009-03-02 22:13:51.253987
282	OB62ktEPfQQ5CQB6mafpyfcWNvmzMzEt	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	25	50	2009-03-02 22:13:51.888795	2009-03-02 22:13:51.888795
283	T1t4qup2ZiM9Pe9maLwJKS7KEg4nSLQb	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	26	50	2009-03-02 22:13:52.071269	2009-03-02 22:13:52.071269
284	oc3rJOZnXCmbF42qFAe4vg6YCkiiKOGU	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	27	50	2009-03-02 22:13:52.875803	2009-03-02 22:13:52.875803
286	ObCFQFsCwA9f2TA97itl0iIzXYamfhPH	5		What is the answer to this question?	1	Insert units here (e.g m, un, cm2)					answer			\N	\N	\N	28	50	2009-03-04 02:10:49.115804	2009-03-04 02:10:49.115804
287	WBUdd0qAfbQtdd3fPAFrGojNHdlOoKUR	5		What is the answer to this question?	1	Insert units here (e.g m, un, cm2)					answer			\N	\N	\N	29	50	2009-03-04 02:10:49.279542	2009-03-04 02:10:49.279542
288	s1JxQLyUMhlcIQu4no9UAwDXl7q9ik5Q	5		What is the answer to this question?	1	Insert units here (e.g m, un, cm2)					answer			\N	\N	\N	30	50	2009-03-04 02:10:49.692527	2009-03-04 02:10:49.692527
200	uVabayXkIEQg5OjcZP4SPOmAKC2GYBOk	3	http://upload.wikimedia.org/wikipedia/commons/0/08/Directed_acyclic_graph.png		\N	163	144	260	231					\N	\N	\N	1	30	2009-01-22 05:36:15.404578	2009-03-12 22:17:40.406495
291	Me73xJvxQI8j9KtEMniVpTQNWrCPy5JO	5		What is the answer?	1	units	0				362880			\N	\N	\N	1	51	2009-03-12 22:23:41.412668	2009-03-12 22:31:12.366678
297	vds9yjL3UM1lBUaQcXK7iAa0XWAK2VrV	4		Which of the following was seen as the "hallmark" of American industry?	1	Technology	Labor Force	Entrepreneurs	Laissez Faire	Mass Production	E	See page 735.		\N	\N	\N	2	52	2009-03-13 02:10:07.522345	2009-03-13 02:12:15.169615
294	dfjWz6n53MhAo91uSH3cS2ZiquXuNPWT	4		A new, unprecedented industrial site..	1	Highland Park	Gary	River Rouge	Detroit	Lowell	C	See page 735.		\N	\N	\N	1	52	2009-03-13 02:04:14.063636	2009-03-13 02:29:57.107879
300	PNEsJMMiFNovOcSY0UI5MkBZYJdZJosS	5		The great industrialist of the time..	1	(Last name only)					Ford	See page 735.		\N	\N	\N	5	52	2009-03-13 02:30:20.001779	2009-03-13 02:32:09.669742
298	0hSci0woVIGq7hrtlwPyAImbeBPQxFoJ	4		Which of the following did leading industrialists NOT emphasize the importance of?\n	1	Low Prices	Skilled Workers	Uniformity	Stationary Workers	Vertical Integration	B	See page 736.		\N	\N	\N	3	52	2009-03-13 02:11:42.617658	2009-03-13 02:32:19.927016
299	SWwjPMxcHGTGYsk33cVXOWyPVcJKTQel	4		Which of the following resulted from the rise of mass production?	1	The overall quality of life improved	The railroad industry declined	Increased conformity	A dramatic decline in the rural population	A and C	E	See page 736.		\N	\N	\N	4	52	2009-03-13 02:22:39.096078	2009-03-13 02:35:58.411677
301	hcoQoSaOGC03Og9gAmCh4GyhHFYW2gtR	4		The 1920s could best be characterized as a time of..	1	Trouble and strife	Realization and escapism	Political and civic growth	Bitterness and regret	None of the above	B	See page 736.		\N	\N	\N	6	52	2009-03-13 02:36:24.85513	2009-03-13 02:43:08.836896
305	TJTZbF0WHwbvTG2Xv6jh4sV1B4Yxwszv	5		During the 1920s, America saw the second	1		3				industrial revolution	See page 736.		\N	\N	\N	8	52	2009-03-13 02:49:41.409825	2009-03-13 02:51:09.933019
308	UIQb3DZ32bCYipX5NIKg3yXu0GFcv8E5	5		This industry not only best reflected the nature of the consumer goods industry, but also was America's largest in the 1920s	1						Automobile	See page 736.		\N	\N	\N	10	52	2009-03-13 03:06:41.439022	2009-03-13 03:44:00.712637
306	q1PHVJsDEZlqJ7lNPIpTuWDqow17IU1o	4		In 1929, American workers became the highest paid in history. Which of the following was largely responsible for this new affluence?	1	Labor Reform	High purchasing power	New banking systems	Technology	C and D	D	See page 736.		\N	\N	\N	9	52	2009-03-13 02:52:06.263342	2009-03-13 03:43:46.12519
317	Qj1AqIOHiNMj8AznPS4MS5tnlB0YsNWY	4		which is the best?	1	Tom	Ben	Ira	Erisa's Math Grade	Tom's Math Grade	A			\N	\N	\N	6	53	2009-03-14 04:32:15.860764	2009-03-14 04:32:56.734707
314	fDbkRZclVRhFUfEgNXn2HqcHIw1HncAL	2			\N									\N	\N	\N	3	53	2009-03-14 04:31:27.227136	2009-03-14 04:33:12.979101
316	9DGcT7C0iD4x4vkDVNixybz988sAA3k4	2			\N									\N	\N	\N	5	53	2009-03-14 04:32:01.88978	2009-03-14 04:33:24.236203
313	zlwoZg4A5H8CwrkH9881AM7vO4MDkegW	1			\N									\N	\N	\N	2	53	2009-03-14 04:31:24.354293	2009-03-14 04:33:27.168253
318	xo02j6KVaCXTwEerOtVv240Yxd72rNVy	5		write 2e-10	1	haha!	26				2e-10			\N	\N	\N	7	53	2009-03-14 04:33:47.458772	2009-03-14 04:34:32.6149
309	kzYXpMDmI8Kv82y6iMKUbtz8K8Q1BIIr	4		Which of the following did the rise of the automobile reveal about industry..	1	There is unlimited demand for certain products	Marketing is as crucial as production	Labor unions must be dealt with	Markets do not become saturated easily	Consumers are willing to accept low-quality goods in exchange for low prices	B	See page 736.		\N	\N	\N	11	52	2009-03-13 03:07:54.050106	2009-03-15 23:56:27.061942
310	pfNA7H2GAdrp2bfEvN4KBWbLIdQTq8Si	4		The emerging economic instability	1	Went unnoticed	Worried many	Affected consumers the most	Was refuted as unlikely	B and C	A	See page 737.		\N	\N	\N	12	52	2009-03-13 03:29:17.109017	2009-03-16 00:01:31.967034
311	vz7BZEanBLOmu94ykYfivuUk18TdGqCs	4		All of the following were effects of the rise of the automobile EXCEPT..	1	Shopping centers and plazas began to sprout up	The distribution of housing became more widespread	Americans depended less on the railroad	Increased segregation of districts	A marketing revolution	D	See page 736.		\N	\N	\N	13	52	2009-03-13 03:33:15.714873	2009-03-16 00:13:12.637936
302	nliV9nBwNvFjadSlDHDQyo4azjZxYn99	5		The new "icon" of American life was the	1		4				automobile	See page 736 and 737.		\N	\N	\N	7	52	2009-03-13 02:43:16.63551	2009-03-16 00:30:18.042962
320	7kGlr3qGxWyg0UmUG66uOl5EIO3esv21	4		All of the following industries saw tremendous progress in the 1920s EXCEPT..	1	automobile	electrical power	railroad	radio and film	chemicals	C	See page 737.		\N	\N	\N	14	52	2009-03-16 00:15:00.125557	2009-03-16 00:42:15.404738
323	CZB20wPbbabEi9nmwALs0T3tHKtnawwy	4		Amos'n Andy was..	1	An early radio show	An early TV show	A comedy featuring "blackface" vaudevillians	A popular comic	A and C	E	See page 737.		\N	\N	\N	17	52	2009-03-16 00:34:50.030635	2009-03-16 00:55:31.975679
322	cnYTlajPG3ZBl1DnW6zhhLkRtqJTHb02	4		The dominant economic unit in the 1920s was the..	1	Household	Firm	Bank	Corporation	Trust	D	See page 737.		\N	\N	\N	16	52	2009-03-16 00:22:57.415671	2009-03-16 00:55:41.276906
324	Cs4t22MEFLlSYYt3OEKRGA61XBOxy6Qs	4		All of the following were major changes occurring in corporations except..	1	Individuals and families ceased to own major stakes	Managers became less dependent on investment bankers	Capitalists sought increased social responsibility in business	A and C	All of the following were major changes	E	See page 737.		\N	\N	\N	18	52	2009-03-16 00:44:23.522481	2009-03-16 00:55:51.687357
326	bqR2vYfrqttpQfOAElbzshuqDT3XU9E0	5		The 1920s saw a gross abuse of 	1	Integration					Horizontal	See page 737.		\N	\N	\N	19	52	2009-03-16 00:51:18.567199	2009-03-16 00:56:11.229112
327	lRB1DfsrLOeDSFOCI0urKUp8aVgYl0mD	4		The most distinctive feature of the new consumer-oriented economy was..	1	Technology	Mass Production	A higher standard of living	Marketing	The automobile	D	See page 737.		\N	\N	\N	20	52	2009-03-16 00:56:52.809115	2009-03-16 01:01:18.8332
328	RNDXiRwv8TAmzdBOsEIQli27j6whRAZS	4		All of the following were consequences of mass production EXCEPT..	1	A decreased emphasis on individualism	Standardization of dress	Disappearance of regional accents	A higher standard of living	All of the following were consequences	A	See page 737.		\N	\N	\N	21	52	2009-03-16 01:01:55.906826	2009-03-16 01:06:41.781672
329	SWjDvDVG6ybRiPdF2Nz6ClWSLlqukuuD	4		Traditional industries in the 1920s..	1	Declined unnoticed due to the consumer-goods industry's rise	Thrived due to the need for raw materials	Saw the advent of new labor reforms	Remained stagnant	B and C	A	See page 738.		\N	\N	\N	22	52	2009-03-16 01:08:58.267824	2009-03-16 01:21:12.598674
330	rPzaua0aIMWKBfdwuEgtgFlzDDFjKCLc	5		This industry suffered the deepest blow in the 1920s	1						Agriculture	See page 738.		\N	\N	\N	23	52	2009-03-16 01:18:31.692512	2009-03-16 01:21:27.046463
331	WjN4NaaKA1gHCaDZXH3l9BPZ5BUFcFBz	4		Factory Workers in the 1920s..	1	Were better of than farmers	Saw significant increases in wages	Did not share fully in the decade's affluence	Saw an increased quality of life	A, C, and D are all correct	E	See page 738.		\N	\N	\N	24	52	2009-03-16 01:26:08.464735	2009-03-16 01:34:25.410859
296	qHfKQPji5HmfHxqHJtTD5EyOKhZkwfdQ	2		Please keep in mind that almost everything in the "The Second Industrial Revolution" is covered, so don't be surprised if you cannot remember everything. 	\N									\N	\N	\N	0	52	2009-03-13 02:05:52.826688	2009-03-16 01:35:00.177464
332	Ef9cGTS1drwGuweyJVpzRGWLIIQK6LGu	4		Organized labor failed to advance the interests of workers in the 1920s due to..	1	Conservative leadership	A "radical" image	yellow-dog contracts	Welfare Capitalism	All the above are correct	E			\N	\N	\N	25	52	2009-03-16 01:35:41.331822	2009-03-16 01:41:56.123305
333	fGgzhMn7pOj7ztwWGlH80Nw6lbgprz4R	4		Most African Americans found work..	1	In northern industries	On southern farms	In service areas	In factories	B and C	E	See page 738.		\N	\N	\N	26	52	2009-03-16 01:42:23.976171	2009-03-16 01:52:56.239288
335	20Bwj6stZli5a0HQZIhY1ivYm6fmJr1X	5		For the first time, most middle and upper-class Americans saw increased income from..	1						investment	See page 739.		\N	\N	\N	27	52	2009-03-16 01:58:48.159742	2009-03-16 01:59:26.517099
336	wUBsLuNgCsxxCgwsJ0voIPNl895OXYpA	4		All of the following were causes of economic instability EXCEPT..	1	an unequal distribution of wealth	the overselling of consumer goods	vertical integration	investment	market saturation	C	See page 739.		\N	\N	\N	28	52	2009-03-16 02:08:57.762168	2009-03-16 02:13:37.640654
321	mxGDKnfwidGMNa5bV7EvZrc1xK5aO7gF	4		The first radio station..	1	NBC	KDKA	CBS	NPR	WLS	B	See page 737.		\N	\N	\N	15	52	2009-03-16 00:20:46.820647	2009-03-16 17:58:27.880038
\.


--
-- Data for Name: libraries; Type: TABLE DATA; Schema: public; Owner: app49565
--

COPY libraries (id, ref, user_id, name, rand_allowed, public_read, public_write, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: parts; Type: TABLE DATA; Schema: public; Owner: app49565
--

COPY parts (id, ref, type2, url, text, points, c1, c2, c3, c4, c5, answer, explanation, context, pc_error, capitalize, levenshtein, order_index, library_id, created_at, updated_at) FROM stdin;
4	text-section	2		This is a text section. Click to edit.	\N									\N	\N	\N	\N	\N	2008-12-24 11:21:45.754317	2008-12-24 11:33:28.433964
5	diagram	3	/images/diagram.gif		\N									\N	\N	\N	\N	\N	2008-12-24 14:44:56.883284	2008-12-24 21:47:49.26241
2	header	1		This is a header. Click to edit.	\N									\N	\N	\N	\N	\N	2008-12-24 00:52:13.252786	2008-12-25 10:13:19.477882
1	mc-question	4		Which of the following is the correct answer? 	1	Choice A	Choice B	Choice C	Choice D	Choice E	A			\N	\N	\N	\N	\N	2008-12-24 00:28:59.803036	2008-12-25 10:16:32.609799
3	exact-answer	5		What is the answer to this question?	1	Insert units here (e.g m, un, cm2)					answer			\N	\N	\N	\N	\N	2008-12-24 01:06:45.029704	2008-12-25 18:26:33.871111
\.


--
-- Data for Name: quizzes; Type: TABLE DATA; Schema: public; Owner: app49565
--

COPY quizzes (id, ref, password_protect, "password", startdate, enddate, attempts, total, scale, name, searchable, theme_id, user_id, loadfile, random_quiz, created_at, updated_at) FROM stdin;
20	sjrW75jefzUAmOrPcfLcMOjPLHJbmnKP	0	secret	\N	\N	3	0	1	Visual Physics Quiz	0	1	4	\N	\N	2008-12-25 01:04:45.585457	2008-12-28 04:01:50.278593
26	bAzidTm9WjYjx9bUzQfiXsucf8D1qX3c	0		\N	\N	0	0	1	Best of Webassign	0	1	4	\N	\N	2008-12-28 15:10:38.918657	2008-12-28 15:10:38.918657
27	FkOpr4uAotIwlw9nlHuRmuptVsEH6vus	0		\N	\N	0	0	1	WALL-E	1	1	7		\N	2009-01-02 21:26:17.505094	2009-02-17 22:12:32.864875
34	F6gafDBjbPLUEqQJMjfUeCqPOxFUu7Hm	0		\N	\N	0	0	1	Path Lengths	1	1	13	\N	\N	2009-02-19 04:16:20.869748	2009-02-19 04:16:20.869748
29	QZDk1z2HltPxF8keAbR8dfg0znOSpbE8	1	chinese	\N	\N	0	0	1	Chinese Quiz 1	1	1	4		\N	2009-01-17 05:19:15.361618	2009-02-25 22:07:49.872699
42	PS35QlpebNHbtCECsqjlN7Ap9LSxXwha	2		\N	\N	1	0	1	Test Quiz	0	1	0	\N	\N	2009-02-27 01:26:29.005578	2009-02-27 01:26:52.05079
43	Vdtoh4OxsJ812h8BElMbxgHEHvO3YItY	2		\N	\N	1	0	1	Test Quiz	0	1	0	\N	\N	2009-02-27 01:26:31.698064	2009-02-27 01:27:07.3179
44	4LdF3BvY8mSW0HiAbFGXUrBmo5tLcn5x	2		\N	\N	1	0	1	Test quiz	0	1	0	\N	\N	2009-02-27 01:33:46.423761	2009-02-28 03:51:20.759377
46	LN98BaMPzIxPmi1iQJg3IRxWGbjAdKfy	0		\N	\N	0	0	1	Naruto Trivia	1	1	15	\N	\N	2009-03-01 04:24:25.813657	2009-03-01 04:24:25.813657
47	29DtLdzfZtIjUxkB1sk0BmwqOszB7x1h	2		\N	\N	1	0	1	Test Quiz	0	1	0	\N	\N	2009-03-01 04:24:59.115047	2009-03-01 04:29:56.410572
48	H5drATJ0OQcaT7g4fZmucOLaYYYpkge2	2		\N	\N	1	0	1	Test Quiz	0	1	0	\N	\N	2009-03-01 04:24:59.722602	2009-03-01 04:29:57.988017
45	rspyfktASJvD14T7CGQiiu0XihchJCtw	2		\N	\N	1	0	1	RS1	0	1	0	\N	\N	2009-02-28 04:20:30.595647	2009-03-01 04:31:32.299884
30	vXIZzn2UfZnX97BMmxiSSDUNmHK5SUce	1	DAM3.1	\N	\N	0	0	1	Math 3.1	1	1	9		\N	2009-01-22 03:32:16.547326	2009-02-28 20:46:53.215146
32	4HT0S8lHcRgLknetkB64KyUJL8u8iwL4	0		\N	\N	6	0	1	549-558	0	1	9		\N	2009-01-22 23:54:02.82206	2009-02-28 20:47:16.359063
50	hztB7GVRFSjPTKAoAIoIOl8lc0gtUIQA	0		\N	\N	0	0	1	APUSH Review 21, 24	1	1	9	\N	\N	2009-03-02 22:11:20.879529	2009-03-02 22:11:20.879529
49	dpvt90ZAEQqBN4qdoP8uMzaSMpHvJNm8	2		\N	\N	1	0	1	APUSH Chapter 21	0	1	0	\N	\N	2009-03-02 22:10:51.697885	2009-03-05 06:59:42.910899
51	5YPdFQbjAg4fUsDyp9SQnaWXiGmwD1LU	2		\N	\N	1	0	1	MATH	0	1	0	\N	\N	2009-03-12 22:23:38.031783	2009-03-13 01:56:29.260398
52	SvydEqIReNkba1ywvzZ91pjl5MY5jV1V	1	Plank7	\N	\N	0	0	1	AP Chapter 25: Part I	1	1	16	\N	\N	2009-03-13 02:00:59.276953	2009-03-21 03:45:14.953793
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: app49565
--

COPY schema_migrations (version) FROM stdin;
20081221191048
20081221192334
20081221221229
20081221224642
20081222162313
20081222162935
20081222173945
20081222200744
20081224084337
20081224085908
20081227222142
20081227222509
20090226052342
\.


--
-- Data for Name: takens; Type: TABLE DATA; Schema: public; Owner: app49565
--

COPY takens (id, ref, quiz_id, status, user_id, score, created_at, updated_at) FROM stdin;
126	Es7ZXNPY9iO23ec74WDC8GYx7VBivO4x	43	4	9	3	2009-02-27 01:26:54.030095	2009-02-27 01:45:40.183606
133	hbOdDxkgtrdbDJu1GewilI9TIpbN25R8	45	4	9	1	2009-02-28 04:25:11.615631	2009-02-28 06:01:24.032572
132	8AQjqFbQhtpKfphxdszEv9v77LvJcx9a	45	4	9	2	2009-02-28 04:22:34.152571	2009-03-01 04:31:52.317929
131	33tJmSSA7V1StxImhM2SfTdTjZ80IQOT	44	4	9	5	2009-02-28 03:50:50.084392	2009-03-01 04:31:53.189442
127	pk1gHRX0UkjSCIpkTlRs2XksaJ13ObZ2	30	4	9	20	2009-02-27 01:32:37.0389	2009-03-01 04:31:54.54683
144	Kpu6GLqKGPVgdmZf0HVZTJojuWHRypBO	32	1	9	13	2009-03-01 04:53:25.411813	2009-03-05 06:49:55.045893
145	l42JQqLpEaPHB4fORQEAYxls0qRR7pp8	50	1	9	27	2009-03-05 06:53:20.432181	2009-03-05 06:55:35.739487
156	RAiomIj2kw15AGbThR8joHAtEc4aTruj	53	1	17	2	2009-03-14 04:34:43.625832	2009-03-14 04:34:59.571559
155	saH1tEhvPPKQ3zsWl1k3V8feUMsUwnI2	52	4	16	2	2009-03-13 17:45:48.365358	2009-03-15 21:47:04.993221
158	y7TgPkL1vcpXf9hFZ3jH7jxKe70LVv6D	52	1	18	28	2009-03-16 03:57:57.740129	2009-03-21 07:06:10.451749
148	9iUyyGe9pRrOU5VdDcIlJgPtxAPLBkH1	30	1	9	20	2009-03-12 22:23:26.32437	2009-03-21 07:15:37.633714
146	yWVBmq7UK8xALNUVg4PYTpVDfzShPGIY	30	1	9	17	2009-03-05 06:59:00.926606	2009-03-21 23:02:38.881713
151	uZzAxO6OUOHERSUfVQHcG3xUATtmGzOX	51	4	9	1	2009-03-12 22:27:42.131421	2009-03-21 23:03:14.77438
150	uUBT3rIG9rrBQXmwSa9ZopdC5HvnR6uK	51	4	9	1	2009-03-12 22:27:08.175686	2009-03-21 23:03:15.911374
153	08qGLzgCTb374oN6EZoaJZf6Oj1d7nw4	51	4	9	1	2009-03-12 22:29:17.689844	2009-03-21 23:03:35.284903
149	jfX2FICGVYpLLXwWVebiTnw6qmv3VHs7	51	4	9	1	2009-03-12 22:26:46.49315	2009-03-21 23:03:36.972258
\.


--
-- Data for Name: themes; Type: TABLE DATA; Schema: public; Owner: app49565
--

COPY themes (id, ref, css_rel, items_per_page, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: app49565
--

COPY users (id, name, ref, email, username, ip, last_login, useragent, "password", created_at, updated_at) FROM stdin;
7	foreigncontaminant	Ye8DrWbXnnzDdPHBKqxOSCHolwYByCN1		foreigncontaminant	67.36.181.207	2009-01-04 02:31:42.336687	Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; en-us) AppleWebKit/525.27.1 (KHTML, like Gecko) Version/3.2.1 Safari/525.27.1	foreigncontaminant	2009-01-02 21:25:58.99596	2009-01-04 02:31:42.340521
4	Marc	Hn33oV0F7k	comprug@gmail.com	comprug	64.107.156.252	2009-01-20 18:56:17.463203	Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_4; en-us) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.2 Safari/525.20.1	mesinu1	2008-12-23 17:08:34.907649	2009-01-20 18:56:17.468275
10	crap	HtBLvHfT8oicLvPmbJeN1n6Khf1e1kgL	\N	crap	130.126.61.202	2009-01-22 06:07:31.152011	Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.5) Gecko/2008120122 Firefox/3.0.5	crapcrap	2009-01-22 06:07:31.15554	2009-01-22 06:07:31.15554
11	benV	2Bxxod0suUavv57BUBUMTjj1fIIAnkAM	\N	ben	24.13.231.140	2009-02-01 23:15:28.975083	Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_4; en-us) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.2 Safari/525.20.1	mesinu1	2009-02-01 23:15:28.980373	2009-02-01 23:15:28.980373
12	jacob	zi23ZUIUQ9T2sT9YRCwv9z0XE214kyY7	\N	chili	67.163.21.247	2009-02-18 04:01:02.061812	Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6	chili	2009-02-18 04:01:02.065796	2009-02-18 04:01:02.065796
13	Marc Vishny	FBe0IEIdXsfTbxWJyICMcy63DcBt4smz	bvishny@me.com	mvishny	24.13.231.140	2009-02-19 04:12:36.920281	Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_4; en-us) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.2 Safari/525.20.1	MTUv8DpN	2009-02-19 04:12:36.923889	2009-02-19 04:30:23.577838
14	BenV	oYmojh9t5LcAAKk3QcjiQFjI0RRz0ui1	\N	bvishny2	24.13.231.140	2009-02-26 05:55:28.633195	Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6	MTUv8DpN	2009-02-26 05:55:28.63728	2009-02-26 05:55:28.63728
15	anna	XiljL3Im16ngzi2zYvg0dPAcyJx6eMOf	\N	kanga-kun	24.13.231.140	2009-03-01 04:43:34.41653	Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; en-us) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16	xiaotian05	2009-03-01 04:23:13.893594	2009-03-01 04:43:34.419278
17	tom s.	m1u4MMkqlYuA7GNA4WAmkzkFE28bQgb9	\N	tom	68.253.209.4	2009-03-14 04:29:36.489633	Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.7) Gecko/2009021910 Firefox/3.0.7	schulz	2009-03-14 04:29:36.492999	2009-03-14 04:29:36.492999
18	Irasp	Q6qnYRHgMMHd0a4wOSOhajOtitfo6msX	\N	ira	24.13.226.9	2009-03-16 03:57:56.611365	Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.0.7) Gecko/2009021910 Firefox/3.0.7	irasp	2009-03-16 03:57:37.398218	2009-03-16 03:57:56.646748
19	test	uDri2xqQ9eMOmy2hWPaVZQZd88dtBLFX	\N	test	24.13.231.140	2009-03-21 02:45:11.226445	Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.7) Gecko/2009021906 Firefox/3.0.7	test123	2009-03-21 02:45:11.229974	2009-03-21 02:45:11.229974
20	BVISH	CKyw63WdanX5Fw979WC2kLN8hAHTS9Io	\N	bv1234	24.13.231.140	2009-03-21 02:55:34.518739	Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.7) Gecko/2009021906 Firefox/3.0.7	bv12344	2009-03-21 02:55:34.611147	2009-03-21 02:55:34.611147
21	BVISH	lyalT5Ubk8DLLXfwl1ux6NJRYvCiVsjL	\N	bvish	24.13.231.140	2009-03-21 02:59:09.33582	Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.7) Gecko/2009021906 Firefox/3.0.7	bvish1	2009-03-21 02:59:09.339963	2009-03-21 02:59:09.339963
16	APUSH	HLBtSXCnbFnOj04N8KZu6LfJ76n0gtug		apush	24.13.231.140	2009-03-21 03:13:25.923558	Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.7) Gecko/2009021906 Firefox/3.0.7	apush	2009-03-13 01:57:14.462605	2009-03-21 03:13:25.92614
9	Ben Vishny	COejH88GMBaTgEoWsXEZBn31QP3eIyc0	bvishny@me.com	bvishny	24.13.231.140	2009-03-21 07:09:46.385654	Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.7) Gecko/2009021906 Firefox/3.0.7	MTUv8DpN	2009-01-21 03:48:46.949998	2009-03-21 07:09:46.388022
\.


--
-- Name: answers_pkey; Type: CONSTRAINT; Schema: public; Owner: app49565; Tablespace: 
--

ALTER TABLE ONLY answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: items_pkey; Type: CONSTRAINT; Schema: public; Owner: app49565; Tablespace: 
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: libraries_pkey; Type: CONSTRAINT; Schema: public; Owner: app49565; Tablespace: 
--

ALTER TABLE ONLY libraries
    ADD CONSTRAINT libraries_pkey PRIMARY KEY (id);


--
-- Name: parts_pkey; Type: CONSTRAINT; Schema: public; Owner: app49565; Tablespace: 
--

ALTER TABLE ONLY parts
    ADD CONSTRAINT parts_pkey PRIMARY KEY (id);


--
-- Name: quizzes_pkey; Type: CONSTRAINT; Schema: public; Owner: app49565; Tablespace: 
--

ALTER TABLE ONLY quizzes
    ADD CONSTRAINT quizzes_pkey PRIMARY KEY (id);


--
-- Name: takens_pkey; Type: CONSTRAINT; Schema: public; Owner: app49565; Tablespace: 
--

ALTER TABLE ONLY takens
    ADD CONSTRAINT takens_pkey PRIMARY KEY (id);


--
-- Name: themes_pkey; Type: CONSTRAINT; Schema: public; Owner: app49565; Tablespace: 
--

ALTER TABLE ONLY themes
    ADD CONSTRAINT themes_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: app49565; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_answers_on_item_id; Type: INDEX; Schema: public; Owner: app49565; Tablespace: 
--

CREATE INDEX index_answers_on_item_id ON answers USING btree (item_id);


--
-- Name: index_answers_on_ref; Type: INDEX; Schema: public; Owner: app49565; Tablespace: 
--

CREATE INDEX index_answers_on_ref ON answers USING btree (ref);


--
-- Name: index_answers_on_taken_id; Type: INDEX; Schema: public; Owner: app49565; Tablespace: 
--

CREATE INDEX index_answers_on_taken_id ON answers USING btree (taken_id);


--
-- Name: index_items_on_quiz_id; Type: INDEX; Schema: public; Owner: app49565; Tablespace: 
--

CREATE INDEX index_items_on_quiz_id ON items USING btree (quiz_id);


--
-- Name: index_items_on_ref; Type: INDEX; Schema: public; Owner: app49565; Tablespace: 
--

CREATE INDEX index_items_on_ref ON items USING btree (ref);


--
-- Name: index_libraries_on_ref; Type: INDEX; Schema: public; Owner: app49565; Tablespace: 
--

CREATE INDEX index_libraries_on_ref ON libraries USING btree (ref);


--
-- Name: index_libraries_on_user_id; Type: INDEX; Schema: public; Owner: app49565; Tablespace: 
--

CREATE INDEX index_libraries_on_user_id ON libraries USING btree (user_id);


--
-- Name: index_parts_on_library_id; Type: INDEX; Schema: public; Owner: app49565; Tablespace: 
--

CREATE INDEX index_parts_on_library_id ON parts USING btree (library_id);


--
-- Name: index_parts_on_ref; Type: INDEX; Schema: public; Owner: app49565; Tablespace: 
--

CREATE INDEX index_parts_on_ref ON parts USING btree (ref);


--
-- Name: index_quizzes_on_ref; Type: INDEX; Schema: public; Owner: app49565; Tablespace: 
--

CREATE INDEX index_quizzes_on_ref ON quizzes USING btree (ref);


--
-- Name: index_quizzes_on_theme_id; Type: INDEX; Schema: public; Owner: app49565; Tablespace: 
--

CREATE INDEX index_quizzes_on_theme_id ON quizzes USING btree (theme_id);


--
-- Name: index_quizzes_on_user_id; Type: INDEX; Schema: public; Owner: app49565; Tablespace: 
--

CREATE INDEX index_quizzes_on_user_id ON quizzes USING btree (user_id);


--
-- Name: index_takens_on_quiz_id; Type: INDEX; Schema: public; Owner: app49565; Tablespace: 
--

CREATE INDEX index_takens_on_quiz_id ON takens USING btree (quiz_id);


--
-- Name: index_takens_on_ref; Type: INDEX; Schema: public; Owner: app49565; Tablespace: 
--

CREATE INDEX index_takens_on_ref ON takens USING btree (ref);


--
-- Name: index_takens_on_user_id; Type: INDEX; Schema: public; Owner: app49565; Tablespace: 
--

CREATE INDEX index_takens_on_user_id ON takens USING btree (user_id);


--
-- Name: index_themes_on_ref; Type: INDEX; Schema: public; Owner: app49565; Tablespace: 
--

CREATE INDEX index_themes_on_ref ON themes USING btree (ref);


--
-- Name: index_users_on_ref; Type: INDEX; Schema: public; Owner: app49565; Tablespace: 
--

CREATE INDEX index_users_on_ref ON users USING btree (ref);


--
-- Name: index_users_on_username; Type: INDEX; Schema: public; Owner: app49565; Tablespace: 
--

CREATE INDEX index_users_on_username ON users USING btree (username);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: app49565; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

