--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    user_id integer NOT NULL,
    game_id integer NOT NULL,
    number_of_guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (16, 1, 640);
INSERT INTO public.games VALUES (17, 2, 738);
INSERT INTO public.games VALUES (16, 3, 142);
INSERT INTO public.games VALUES (16, 4, 704);
INSERT INTO public.games VALUES (16, 5, 172);
INSERT INTO public.games VALUES (1, 6, 3);
INSERT INTO public.games VALUES (18, 7, 282);
INSERT INTO public.games VALUES (19, 8, 27);
INSERT INTO public.games VALUES (18, 9, 119);
INSERT INTO public.games VALUES (18, 10, 369);
INSERT INTO public.games VALUES (18, 11, 993);
INSERT INTO public.games VALUES (20, 12, 567);
INSERT INTO public.games VALUES (21, 13, 912);
INSERT INTO public.games VALUES (20, 14, 71);
INSERT INTO public.games VALUES (20, 15, 436);
INSERT INTO public.games VALUES (20, 16, 381);
INSERT INTO public.games VALUES (1, 17, 6);
INSERT INTO public.games VALUES (1, 18, 0);
INSERT INTO public.games VALUES (22, 19, 985);
INSERT INTO public.games VALUES (23, 20, 729);
INSERT INTO public.games VALUES (22, 21, 38);
INSERT INTO public.games VALUES (22, 22, 114);
INSERT INTO public.games VALUES (22, 23, 401);
INSERT INTO public.games VALUES (24, 24, 531);
INSERT INTO public.games VALUES (25, 25, 954);
INSERT INTO public.games VALUES (24, 26, 265);
INSERT INTO public.games VALUES (24, 27, 393);
INSERT INTO public.games VALUES (24, 28, 76);
INSERT INTO public.games VALUES (26, 29, 755);
INSERT INTO public.games VALUES (27, 30, 416);
INSERT INTO public.games VALUES (26, 31, 380);
INSERT INTO public.games VALUES (26, 32, 94);
INSERT INTO public.games VALUES (26, 33, 877);
INSERT INTO public.games VALUES (28, 34, 791);
INSERT INTO public.games VALUES (29, 35, 408);
INSERT INTO public.games VALUES (28, 36, 531);
INSERT INTO public.games VALUES (28, 37, 267);
INSERT INTO public.games VALUES (28, 38, 78);
INSERT INTO public.games VALUES (30, 39, 616);
INSERT INTO public.games VALUES (31, 40, 472);
INSERT INTO public.games VALUES (30, 41, 93);
INSERT INTO public.games VALUES (30, 42, 802);
INSERT INTO public.games VALUES (30, 43, 601);
INSERT INTO public.games VALUES (35, 44, 538);
INSERT INTO public.games VALUES (36, 45, 790);
INSERT INTO public.games VALUES (35, 46, 863);
INSERT INTO public.games VALUES (35, 47, 531);
INSERT INTO public.games VALUES (35, 48, 852);
INSERT INTO public.games VALUES (38, 49, 358);
INSERT INTO public.games VALUES (39, 50, 313);
INSERT INTO public.games VALUES (38, 51, 357);
INSERT INTO public.games VALUES (38, 52, 943);
INSERT INTO public.games VALUES (38, 53, 749);
INSERT INTO public.games VALUES (40, 54, 699);
INSERT INTO public.games VALUES (41, 55, 601);
INSERT INTO public.games VALUES (40, 56, 6);
INSERT INTO public.games VALUES (40, 57, 474);
INSERT INTO public.games VALUES (40, 58, 17);
INSERT INTO public.games VALUES (42, 59, 811);
INSERT INTO public.games VALUES (43, 60, 595);
INSERT INTO public.games VALUES (42, 61, 632);
INSERT INTO public.games VALUES (42, 62, 111);
INSERT INTO public.games VALUES (42, 63, 647);
INSERT INTO public.games VALUES (46, 64, 7);
INSERT INTO public.games VALUES (47, 65, 385);
INSERT INTO public.games VALUES (48, 66, 714);
INSERT INTO public.games VALUES (48, 67, 643);
INSERT INTO public.games VALUES (47, 68, 33);
INSERT INTO public.games VALUES (47, 69, 172);
INSERT INTO public.games VALUES (47, 70, 856);
INSERT INTO public.games VALUES (1, 71, 2);
INSERT INTO public.games VALUES (49, 72, 959);
INSERT INTO public.games VALUES (49, 73, 700);
INSERT INTO public.games VALUES (50, 74, 962);
INSERT INTO public.games VALUES (50, 75, 128);
INSERT INTO public.games VALUES (49, 76, 313);
INSERT INTO public.games VALUES (49, 77, 302);
INSERT INTO public.games VALUES (49, 78, 40);
INSERT INTO public.games VALUES (51, 79, 343);
INSERT INTO public.games VALUES (51, 80, 168);
INSERT INTO public.games VALUES (52, 81, 537);
INSERT INTO public.games VALUES (52, 82, 750);
INSERT INTO public.games VALUES (51, 83, 215);
INSERT INTO public.games VALUES (51, 84, 583);
INSERT INTO public.games VALUES (51, 85, 30);
INSERT INTO public.games VALUES (53, 86, 62);
INSERT INTO public.games VALUES (54, 87, 407);
INSERT INTO public.games VALUES (54, 88, 826);
INSERT INTO public.games VALUES (53, 89, 127);
INSERT INTO public.games VALUES (53, 90, 800);
INSERT INTO public.games VALUES (53, 91, 257);
INSERT INTO public.games VALUES (55, 92, 265);
INSERT INTO public.games VALUES (55, 93, 141);
INSERT INTO public.games VALUES (56, 94, 808);
INSERT INTO public.games VALUES (56, 95, 534);
INSERT INTO public.games VALUES (55, 96, 855);
INSERT INTO public.games VALUES (55, 97, 545);
INSERT INTO public.games VALUES (55, 98, 539);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Andre');
INSERT INTO public.users VALUES (2, 'user_1683497760745');
INSERT INTO public.users VALUES (3, 'user_1683497760744');
INSERT INTO public.users VALUES (4, 'user_1683498063889');
INSERT INTO public.users VALUES (5, 'user_1683498063888');
INSERT INTO public.users VALUES (6, 'user_1683498289094');
INSERT INTO public.users VALUES (7, 'user_1683498289093');
INSERT INTO public.users VALUES (8, 'Berta');
INSERT INTO public.users VALUES (9, 'user_1683499736576');
INSERT INTO public.users VALUES (10, 'user_1683499736575');
INSERT INTO public.users VALUES (11, 'user_1683499787868');
INSERT INTO public.users VALUES (12, 'user_1683499787867');
INSERT INTO public.users VALUES (13, 'A');
INSERT INTO public.users VALUES (14, 'user_1683500707660');
INSERT INTO public.users VALUES (15, 'user_1683500707659');
INSERT INTO public.users VALUES (16, 'user_1683500976546');
INSERT INTO public.users VALUES (17, 'user_1683500976545');
INSERT INTO public.users VALUES (18, 'user_1683501034848');
INSERT INTO public.users VALUES (19, 'user_1683501034847');
INSERT INTO public.users VALUES (20, 'user_1683501223543');
INSERT INTO public.users VALUES (21, 'user_1683501223542');
INSERT INTO public.users VALUES (22, 'user_1683502237556');
INSERT INTO public.users VALUES (23, 'user_1683502237555');
INSERT INTO public.users VALUES (24, 'user_1683502303291');
INSERT INTO public.users VALUES (25, 'user_1683502303290');
INSERT INTO public.users VALUES (26, 'user_1683502404672');
INSERT INTO public.users VALUES (27, 'user_1683502404671');
INSERT INTO public.users VALUES (28, 'user_1683502448765');
INSERT INTO public.users VALUES (29, 'user_1683502448764');
INSERT INTO public.users VALUES (30, 'user_1683502468606');
INSERT INTO public.users VALUES (31, 'user_1683502468605');
INSERT INTO public.users VALUES (32, '[A');
INSERT INTO public.users VALUES (33, 'Alberta');
INSERT INTO public.users VALUES (34, 'Heche');
INSERT INTO public.users VALUES (35, 'user_1683502988547');
INSERT INTO public.users VALUES (36, 'user_1683502988546');
INSERT INTO public.users VALUES (37, 'Fr');
INSERT INTO public.users VALUES (38, 'user_1683503119765');
INSERT INTO public.users VALUES (39, 'user_1683503119764');
INSERT INTO public.users VALUES (40, 'user_1683503140666');
INSERT INTO public.users VALUES (41, 'user_1683503140665');
INSERT INTO public.users VALUES (42, 'user_1683503179008');
INSERT INTO public.users VALUES (43, 'user_1683503179007');
INSERT INTO public.users VALUES (44, 'B');
INSERT INTO public.users VALUES (45, 'C');
INSERT INTO public.users VALUES (46, 'D');
INSERT INTO public.users VALUES (47, 'user_1683503352310');
INSERT INTO public.users VALUES (48, 'user_1683503352309');
INSERT INTO public.users VALUES (49, 'user_1683503447191');
INSERT INTO public.users VALUES (50, 'user_1683503447190');
INSERT INTO public.users VALUES (51, 'user_1683503486855');
INSERT INTO public.users VALUES (52, 'user_1683503486854');
INSERT INTO public.users VALUES (53, 'user_1683503518933');
INSERT INTO public.users VALUES (54, 'user_1683503518932');
INSERT INTO public.users VALUES (55, 'user_1683503531003');
INSERT INTO public.users VALUES (56, 'user_1683503531002');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 98, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 56, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

