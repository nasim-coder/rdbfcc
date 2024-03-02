--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter_in_km numeric,
    description text NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    description text NOT NULL,
    galaxy_type character varying(15),
    distance_from_sun_in_ly integer,
    age_in_million_years numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    is_habitable boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    is_habitable boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    distance_from_sun_in_ly integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 950, 'Classified as a dwarf planet due to its large size and nearly spherical shape. Has a water-ice mantle beneath its rocky surface, hinting at the possibility of an internal ocean.');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, 'Vesta (minor-planet designation: 4 Vesta) is one of the largest objects in the asteroid belt, with a mean diameter of 525 kilometres (326 mi). It was discovered by the German astronomer Heinrich Wilhelm Matthias Olbers on 29 March 1807 and is named after Vesta, the virgin goddess of home and hearth from Roman mythology.');
INSERT INTO public.asteroid VALUES (3, 'Pallas', 512, 'Pallas (minor-planet designation: 2 Pallas) is the second asteroid to have been discovered, after Ceres. Like Ceres, it is believed to have a mineral composition similar to carbonaceous chondrite meteorites, though significantly less hydrated than Ceres. It is the third-largest asteroid in the Solar System by both volume and mass, and is a likely remnant protoplanet. It is 79% the mass of Vesta and 22% the mass of Ceres, constituting an estimated 7% of the mass of the asteroid belt. Its estimated volume is equivalent to a sphere 507 to 515 kilometers (315 to 320 mi) in diameter, 90–95% the volume of Vesta.');
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 434, 'Hygiea (minor-planet designation: 10 Hygiea) is a major asteroid located in the main asteroid belt. With a mean diameter of between 425 and 440 km and a mass estimated to be 3% of the total mass of the belt, it is the fourth-largest asteroid in the Solar System by both volume and mass, and is the largest of the C-type asteroids (dark asteroids with a carbonaceous surface) in classifications that use G type for 1 Ceres. It is very close to spherical, apparently because it had re-accreted after the disruptive impact that produced the large Hygiean family of asteroids.');
INSERT INTO public.asteroid VALUES (5, 'Davida', 327, 'Davida (minor planet designation: 511 Davida) is a large C-type asteroid. It is one of the largest asteroids, approximately tied for 7th place, to within measurement uncertainties, and the 5th or 6th most massive. It was discovered by R. S. Dugan in 1903. Davida is named after David Peck Todd, an astronomy professor at Amherst College.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 'The Milky Way is the galaxy that includes the Solar System, with the name describing the galaxy''s appearance from Earth: a hazy band of light seen in the night sky formed from stars that cannot be individually distinguished by the naked eye', 'spiral', 27140, 13800.0);
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 'The Andromeda Galaxy is a barred spiral galaxy and is the nearest major galaxy to the Milky Way. It was originally named the Andromeda Nebula and is cataloged as Messier 31, M31, and NGC 224. Andromeda has a diameter of about 46.56 kiloparsecs (152,000 light-years) and is approximately 765 kpc (2.5 million light-years) from Earth', 'spiral', 2500000, 10000.1);
INSERT INTO public.galaxy VALUES ('Ursa Major II', 3, 'Ursa Major II Dwarf (UMa II dSph) is a dwarf spheroidal galaxy situated in the Ursa Major constellation and discovered in 2006 in the data obtained by the Sloan Digital Sky Survey. The galaxy is located approximately 30 kpc from the Sun and moves towards the Sun with the velocity of about 116 km/s. It has an elliptical (ratio of axes ~ 2:1) shape with the half-light radius of about 140 pc', 'spheroidal', 80, 13000.0);
INSERT INTO public.galaxy VALUES ('Segue 1', 4, 'Segue 1 is a dwarf spheroidal galaxy or globular cluster situated in the Leo constellation and discovered in 2006 by Sloan Digital Sky Survey. It is located at a distance of about 23 kpc (about 75,000 light years) from the Sun and moves away from the Sun with the velocity of about 206 km/s. Segue 1 has a noticeably elongated (ratio of axes ~ 2:1) shape with the half-light radius of about 30 pc. This elongation may be caused by the tidal forces acting from the Milky Way galaxy if Segue 1 is being tidally disrupted now', 'spheroidal', 75000, 12000.0);
INSERT INTO public.galaxy VALUES ('Sagittarius Dwarf Sphr', 5, 'The Sagittarius Dwarf Spheroidal Galaxy (Sgr dSph), also known as the Sagittarius Dwarf Elliptical Galaxy (Sgr dE or Sag DEG), is an elliptical loop-shaped satellite galaxy of the Milky Way. It contains four globular clusters in its main body, with the brightest of them NGC 6715 (M54) being known well before the discovery of the galaxy itself in 1994. Sgr dSph is roughly 10,000 light-years in diameter, and is currently about 70,000 light-years from Earth, travelling in a polar orbit (an orbit passing over the Milky Way''s galactic poles) at a distance of about 50,000 light-years from the core of the Milky Way (about one third of the distance of the Large Magellanic Cloud). In its looping', 'elliptical', 70000, 8000.0);
INSERT INTO public.galaxy VALUES ('Triangulum II', 6, 'Triangulum II (Tri II or Laevens 2) is a dwarf galaxy close to the Milky Way Galaxy. Like other dwarf spheroidal galaxies, its stellar population is very old: the galaxy was quenched before 11.5 billion years ago. It contains only 1000 stars, yet is quite massive, having a solar mass to light ratio of 3600. This is an unusually high mass for such a small galaxy', 'spiral', 97800, 11500.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Earths Moon is the fifth largest moon in the solar system. It has a barren, rocky surface covered in craters, mountains, and plains called maria. The Moon has a thin exosphere and no atmosphere, which means it experiences extreme temperature variations', false, 6);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Phobos is one of the two moons of Mars and is irregularly shaped. It orbits very close to the planets surface and is thought to be a captured asteroid. Phobos has a heavily cratered surface', false, 7);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Deimos is the smaller and outermost moon of Mars. It is also irregularly shaped and heavily cratered. Deimos is believed to be a captured asteroid like Phobos', false, 7);
INSERT INTO public.moon VALUES (4, 'Io', 'Io is one of the four largest moons of Jupiter and is the most volcanically active body in the solar system. It has hundreds of active volcanoes that spew sulfur and sulfur dioxide', false, 8);
INSERT INTO public.moon VALUES (5, 'Europa', 'Europa is another of Jupiters largest moons and has a smooth, icy surface. It is believed to have a subsurface ocean of liquid water beneath its icy crust, making it a potential candidate for extraterrestrial life', true, 8);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Ganymede is the largest moon in the solar system and has its own magnetic field. It has a surface of both ice and rocky material and may have a subsurface ocean of liquid water', true, 8);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Callisto is the outermost of Jupiters four largest moons and has a heavily cratered surface. It has a mixture of ice and rock and may have a subsurface ocean', false, 8);
INSERT INTO public.moon VALUES (8, 'Titan', 'Titan is Saturns largest moon and has a thick atmosphere primarily composed of nitrogen, with hydrocarbon lakes and rivers on its surface. It is the only known celestial body other than Earth with stable bodies of surface liquid', true, 9);
INSERT INTO public.moon VALUES (9, 'Miranda', 'Miranda is one of the five major moons of Uranus and is known for its unusual surface features, including large cliffs, valleys, and grooves. It is believed to have experienced significant geological activity in its past', false, 10);
INSERT INTO public.moon VALUES (10, 'Ariel', 'Ariel is another of Uranus major moons and has a relatively smooth surface with cratered regions and valleys. It may have experienced volcanic activity in the past', false, 10);
INSERT INTO public.moon VALUES (11, 'Umbriel', 'Umbriel is one of the darkest moons of Uranus and has a heavily cratered surface. It lacks significant geological activity and appears to be geologically inactive', false, 10);
INSERT INTO public.moon VALUES (12, 'Titania', 'Titania is the largest moon of Uranus and has a relatively smooth surface with valleys, ridges, and impact craters. It may have experienced geological activity in the past', false, 10);
INSERT INTO public.moon VALUES (13, 'Oberon', 'Oberon is the second largest moon of Uranus and has a heavily cratered surface. It also has valleys and ridges and may have experienced geological activity in its history', false, 10);
INSERT INTO public.moon VALUES (14, 'Enceladus', 'Enceladus is a small, icy moon of Saturn with a smooth, bright surface and prominent surface fractures known as "tiger stripes." It is known for its geysers of water vapor and icy particles erupting from its south polar region, indicating the presence of a subsurface ocean of liquid water', true, 9);
INSERT INTO public.moon VALUES (15, 'Mimas', 'Mimas is a small moon of Saturn with a heavily cratered surface and a large impact crater called Herschel that gives it a resemblance to the Death Star from Star Wars', false, 9);
INSERT INTO public.moon VALUES (16, 'Tethys', 'Tethys is a medium-sized moon of Saturn with a heavily cratered surface and a large canyon called Ithaca Chasma running along its equator', false, 9);
INSERT INTO public.moon VALUES (17, 'Dione', 'Dione is a medium-sized moon of Saturn with a heavily cratered surface and bright, wispy streaks called "linea" across its surface', false, 9);
INSERT INTO public.moon VALUES (18, 'Rhea', 'Rhea is the second largest moon of Saturn and has a heavily cratered surface with bright, icy regions and dark, rocky areas', false, 9);
INSERT INTO public.moon VALUES (20, 'Proteus', 'Proteus is the second largest moon of Neptune and is irregularly shaped. It has a heavily cratered surface and is believed to be a captured asteroid or Kuiper Belt object', false, 11);
INSERT INTO public.moon VALUES (22, 'Amalthea', 'Amalthea is one of the inner moons of Jupiter and is irregularly shaped. It has a reddish coloration and may be composed of a mixture of ice and rock', false, 8);
INSERT INTO public.moon VALUES (23, 'Himalia', 'Himalia is one of the larger moons of Jupiter and is irregularly shaped. It is believed to be a captured asteroid or Kuiper Belt object and orbits Jupiter in a distant, inclined orbit', false, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Proxima b', 'Proxima Centauri b (or Proxima b), sometimes referred to as Alpha Centauri Cb, is an exoplanet orbiting within the habitable zone of the red dwarf star Proxima Centauri, which is the closest star to the Sun and part of the larger triple star system Alpha Centauri. It is about 4.2 light-years (1.3 parsecs) from Earth in the constellation Centaurus, making it and Proxima d, along with the currently disputed Proxima c, the closest known exoplanets to the Solar System.', true, 1);
INSERT INTO public.planet VALUES (2, 'Kepler-186f', 'Kepler-186f (also known by its Kepler object of interest designation KOI-571.05) is an Earth-sized exoplanet orbiting within the habitable zone of the red dwarf star Kepler-186, the outermost of five such planets discovered around the star by NASAs Kepler spacecraft. It is located about 580 light-years (180 parsecs) from Earth in the constellation of Cygnus', true, 2);
INSERT INTO public.planet VALUES (3, 'Kepler-18b', 'Kepler-186b (also known as KOI-571.03) is an exoplanet located around 582 light-years away from Earth. Kepler-186b is orbiting a red dwarf known as Kepler-186, named after the space telescope that found it. Kepler-186b is the innermost planet and the smallest of its system, and thus not suitable for life. The orbital period of this planet is just under four Earth days long due to its location near the parent star.', false, 2);
INSERT INTO public.planet VALUES (4, 'Mercury', 'Mercury is the smallest planet in the solar system and orbits closest to the Sun. Its surface is heavily cratered and is covered in a layer of rocky material. Mercury experiences extreme temperature variations, with scorching temperatures on its sunlit side and freezing temperatures on its dark side', false, 10);
INSERT INTO public.planet VALUES (5, 'Venus', 'Venus is often called Earths "sister planet" due to its similar size and composition, but it has a thick, toxic atmosphere composed mainly of carbon dioxide. The surface is hot enough to melt lead, with crushing atmospheric pressure. Venus is shrouded in thick clouds of sulfuric acid, making it inhospitable to life as we know it', false, 10);
INSERT INTO public.planet VALUES (6, 'Earth', 'Earth is the only planet known to support life. It has a diverse range of environments, including oceans, continents, and atmosphere that sustains a rich variety of life forms. Earths moderate temperatures and liquid water make it a unique oasis in the solar system', true, 10);
INSERT INTO public.planet VALUES (7, 'Mars', 'Mars is a cold, desert-like planet with a thin atmosphere. It has polar ice caps, evidence of past water flow, and seasonal changes similar to Earth. Mars is being explored as a potential site for future human colonization', true, 10);
INSERT INTO public.planet VALUES (8, 'Jupiter', 'Jupiter is the largest planet in the solar system, composed mostly of hydrogen and helium. It has a thick atmosphere and powerful storms, including the famous Great Red Spot. Jupiter has a large system of moons and a strong magnetic field', false, 10);
INSERT INTO public.planet VALUES (9, 'Saturn', 'Saturn is known for its beautiful rings, which are made of icy particles and rock fragments. It is similar in composition to Jupiter and has a complex system of moons, including Titan, which has an atmosphere and hydrocarbon lakes', false, 10);
INSERT INTO public.planet VALUES (10, 'Uranus', 'Uranus is an ice giant planet with a pale blue color due to the presence of methane in its atmosphere. It has a tilted axis of rotation, causing extreme seasonal variations. Uranus has a system of rings and moons', false, 10);
INSERT INTO public.planet VALUES (11, 'Neptune', 'Neptune is the outermost planet in the solar system and is similar in composition to Uranus. It has a deep blue coloration due to the presence of methane in its atmosphere. Neptune has a system of rings and moons, including Triton, which is believed to be a captured Kuiper Belt object', false, 10);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri c', 'Proxima Centauri c is another exoplanet orbiting the nearby red dwarf star Proxima Centauri. It is a super-Earth exoplanet with an estimated mass at least 6 times that of Earth. Proxima Centauri c orbits its host star at a greater distance compared to Proxima Centauri b, potentially placing it outside the habitable zone. Further observations are needed to better understand its properties and potential for habitability', false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima Centauri', 'Proxima Centauri is a small, low-mass star located 4.2465 light-years (1.3020 pc) away from the Sun in the southern constellation of Centaurus. Its Latin name means the "nearest of Centaurus". It was discovered in 1915 by Robert Innes and is the nearest-known star to the Sun. With a quiescent apparent magnitude of 11.13, it is too faint to be seen with the unaided eye. Proxima Centauri is a member of the Alpha Centauri star system, being identified as component Alpha Centauri C, and is 2.18° to the southwest of the Alpha Centauri AB pair. It is currently 12,950 AU (0.2 ly) from AB, which it orbits with a period of about 550,000 years.', 4, 1);
INSERT INTO public.star VALUES (2, 'Kepler-186', 'Kepler-186 is a main-sequence M1-type dwarf star, located 178.5 parsecs (582 light years) away in the constellation of Cygnus. The star is slightly cooler than the sun, with roughly half its metallicity. It is known to have five planets, including the first Earth-sized world discovered in the habitable zone: Kepler-186f. The star hosts four other planets discovered so far, though they all orbit interior to the habitable zone.', 582, 1);
INSERT INTO public.star VALUES (10, 'The Sun', 'The Sun is the star at the center of the Solar System. It is a massive, hot ball of plasma, inflated and heated by energy produced by nuclear fusion reactions at its core. Part of this energy is emitted from its surface as light, ultraviolet, and infrared radiation, providing most of the energy for life on Earth. The Sun has been an object of veneration in many cultures. It has been a central subject for astronomical research since ancient times.', 0, 1);
INSERT INTO public.star VALUES (11, 'M31-V1', 'This star is one of the brightest stars in the Andromeda Galaxy and has been extensively studied by astronomers. It serves as a reference point for various observations within the galaxy.', 250000, 2);
INSERT INTO public.star VALUES (12, 'M31-LLL', 'M31-LLL 1997, also known as M31 Luminous Blue Variable 1997, is a luminous blue variable star (LBV) located in the Andromeda Galaxy (M31). LBVs are a rare type of massive, evolved stars that exhibit dramatic variability in their brightness and spectral characteristics', 257000, 2);
INSERT INTO public.star VALUES (13, 'Alioth', 'Alioth, also called Epsilon Ursae Majoris, is a star in the northern constellation of Ursa Major. The designation is Latinised from ε Ursae Majoris and abbreviated Epsilon UMa or ε UMa. Despite being designated "ε" (epsilon), it is the brightest star in the constellation and at magnitude 1.77 is the thirty-third brightest star in the sky.', 82, 3);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

