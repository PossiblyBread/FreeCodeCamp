--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    game_id integer NOT NULL,
    username character varying(100) NOT NULL,
    games_played integer,
    best_game integer
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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (13, 'user_1768936128479', 2, 71);
INSERT INTO public.games VALUES (3, 'user_1768935878870', 2, 126);
INSERT INTO public.games VALUES (12, 'user_1768936128480', 5, 27);
INSERT INTO public.games VALUES (2, 'user_1768935878871', 5, 57);
INSERT INTO public.games VALUES (5, 'user_1768935937157', 2, 666);
INSERT INTO public.games VALUES (15, 'user_1768936254214', 2, 566);
INSERT INTO public.games VALUES (4, 'user_1768935937158', 5, 310);
INSERT INTO public.games VALUES (14, 'user_1768936254215', 5, 121);
INSERT INTO public.games VALUES (7, 'user_1768936026597', 2, 439);
INSERT INTO public.games VALUES (6, 'user_1768936026598', 5, 207);
INSERT INTO public.games VALUES (42, 'user_1769019752842', 2, 663);
INSERT INTO public.games VALUES (41, 'user_1769019752843', 5, 462);
INSERT INTO public.games VALUES (9, 'user_1768936057080', 2, 247);
INSERT INTO public.games VALUES (8, 'user_1768936057081', 5, 52);
INSERT INTO public.games VALUES (11, 'user_1768936098510', 2, 183);
INSERT INTO public.games VALUES (44, 'user_1769020300099', 2, 76);
INSERT INTO public.games VALUES (10, 'user_1768936098511', 5, 143);
INSERT INTO public.games VALUES (43, 'user_1769020300100', 5, 1);
INSERT INTO public.games VALUES (45, '500', 1, 9);
INSERT INTO public.games VALUES (1, 'Adrian', 6, 1);
INSERT INTO public.games VALUES (47, 'user_1769020697704', 2, 347);
INSERT INTO public.games VALUES (46, 'user_1769020697705', 5, 114);
INSERT INTO public.games VALUES (49, 'user_1769020966069', 2, 434);
INSERT INTO public.games VALUES (48, 'user_1769020966070', 5, 99);
INSERT INTO public.games VALUES (51, 'user_1769021005160', 2, 377);
INSERT INTO public.games VALUES (50, 'user_1769021005161', 5, 25);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 51, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- PostgreSQL database dump complete
--

