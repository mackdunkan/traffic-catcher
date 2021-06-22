

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

ALTER TABLE public.users DISABLE TRIGGER ALL;

INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts) VALUES ('35efe858-9629-4a12-9480-4275eca37e50', 'mackdunkan@gmail.com', 'sha256|17|Y32Ga1uke5CisJvVp6p2sg==|TSDuEs1+Xdaels6TYCkyCgIBHxWA/US7bvBlK0vHzvc=', NULL, 0);


ALTER TABLE public.users ENABLE TRIGGER ALL;


ALTER TABLE public.sites DISABLE TRIGGER ALL;



ALTER TABLE public.sites ENABLE TRIGGER ALL;


ALTER TABLE public.bonuses DISABLE TRIGGER ALL;



ALTER TABLE public.bonuses ENABLE TRIGGER ALL;


