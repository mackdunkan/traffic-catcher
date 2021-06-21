

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


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.bonuses DISABLE TRIGGER ALL;

INSERT INTO public.bonuses (id, site_id, title) VALUES ('ba2671d0-710f-46d8-8fc1-9ed15cb00b69', '00000000-0000-0000-0000-000000000000', '123');


ALTER TABLE public.bonuses ENABLE TRIGGER ALL;


ALTER TABLE public.sites DISABLE TRIGGER ALL;

INSERT INTO public.sites (id, domain) VALUES ('ab4a9c75-2745-412b-853e-a83bed548891', 'dogmaweb.ru');
INSERT INTO public.sites (id, domain) VALUES ('ea1a9b5a-cab4-4023-8116-11658bbf2a1c', 'test.loc');


ALTER TABLE public.sites ENABLE TRIGGER ALL;


