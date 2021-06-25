

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
INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts) VALUES ('b195f34e-f64c-4ef1-ad00-3c4674e08847', 'dahno@rambler.ru', 'sha256|17|Y32Ga1uke5CisJvVp6p2sg==|TSDuEs1+Xdaels6TYCkyCgIBHxWA/US7bvBlK0vHzvc=', NULL, 0);


ALTER TABLE public.users ENABLE TRIGGER ALL;


ALTER TABLE public.sites DISABLE TRIGGER ALL;

INSERT INTO public.sites (id, domain, user_id) VALUES ('36e8f7af-dd66-4ad4-b066-07ccf18dafcb', 'dogmaweb.ru', '35efe858-9629-4a12-9480-4275eca37e50');
INSERT INTO public.sites (id, domain, user_id) VALUES ('a6e96d3d-cac1-4c68-a492-ffca9b78fe0b', 'localhost:8000', 'b195f34e-f64c-4ef1-ad00-3c4674e08847');


ALTER TABLE public.sites ENABLE TRIGGER ALL;


ALTER TABLE public.bonuses DISABLE TRIGGER ALL;

INSERT INTO public.bonuses (id, site_id, title) VALUES ('a28fce86-9a72-4f92-89b3-7ba107612ec1', '36e8f7af-dd66-4ad4-b066-07ccf18dafcb', 'Булка');
INSERT INTO public.bonuses (id, site_id, title) VALUES ('fb7ea70e-8213-4e4e-be50-d10a414776f0', '36e8f7af-dd66-4ad4-b066-07ccf18dafcb', 'Корка');
INSERT INTO public.bonuses (id, site_id, title) VALUES ('97cd9230-fc68-40ab-93a9-628cc178f82d', '36e8f7af-dd66-4ad4-b066-07ccf18dafcb', 'Дырка');
INSERT INTO public.bonuses (id, site_id, title) VALUES ('2fc3d9f9-92a5-4037-bd03-bcee04cf3e20', 'a6e96d3d-cac1-4c68-a492-ffca9b78fe0b', 'Шапка');
INSERT INTO public.bonuses (id, site_id, title) VALUES ('63bead6a-dd9b-4c4c-afdc-8917ef20b410', 'a6e96d3d-cac1-4c68-a492-ffca9b78fe0b', 'Шарф');
INSERT INTO public.bonuses (id, site_id, title) VALUES ('4f3717ce-327f-4cf9-8846-ccb77a0c1a00', 'a6e96d3d-cac1-4c68-a492-ffca9b78fe0b', 'Носок');


ALTER TABLE public.bonuses ENABLE TRIGGER ALL;


ALTER TABLE public.clients DISABLE TRIGGER ALL;

INSERT INTO public.clients (id, bonuse_id, phone, name) VALUES ('d0888d23-c229-4654-a320-c45309d7cbc6', '4f3717ce-327f-4cf9-8846-ccb77a0c1a00', '1', '');
INSERT INTO public.clients (id, bonuse_id, phone, name) VALUES ('f5f9ade2-4db0-4e2b-8b8d-fa7a35f26568', '4f3717ce-327f-4cf9-8846-ccb77a0c1a00', '4566', '');
INSERT INTO public.clients (id, bonuse_id, phone, name) VALUES ('f5017c02-7f62-4dfb-b9d3-f27db449badd', '2fc3d9f9-92a5-4037-bd03-bcee04cf3e20', ' 722', 'Жопан');
INSERT INTO public.clients (id, bonuse_id, phone, name) VALUES ('fdb01df7-8346-4218-b7cf-4e325c8f0463', '2fc3d9f9-92a5-4037-bd03-bcee04cf3e20', '2234', 'sdf');
INSERT INTO public.clients (id, bonuse_id, phone, name) VALUES ('ba19b08c-2167-4827-82e8-a970b9c94de5', '4f3717ce-327f-4cf9-8846-ccb77a0c1a00', 'йцу', '123');
INSERT INTO public.clients (id, bonuse_id, phone, name) VALUES ('8c480ac5-27f7-4a13-80b0-e8e9ec46f666', '63bead6a-dd9b-4c4c-afdc-8917ef20b410', '213', '123');
INSERT INTO public.clients (id, bonuse_id, phone, name) VALUES ('ceb80c27-f6ae-41f2-b9b5-342fd1521114', '63bead6a-dd9b-4c4c-afdc-8917ef20b410', '345', '123');
INSERT INTO public.clients (id, bonuse_id, phone, name) VALUES ('dddd29a1-4e7d-4ca3-a150-0bdb3af02166', '63bead6a-dd9b-4c4c-afdc-8917ef20b410', '456456', '123');
INSERT INTO public.clients (id, bonuse_id, phone, name) VALUES ('6c64d43b-8a2e-43e0-9306-1e5b048f1528', '4f3717ce-327f-4cf9-8846-ccb77a0c1a00', ' 7777', 'Жорик');


ALTER TABLE public.clients ENABLE TRIGGER ALL;


