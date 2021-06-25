-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE sites (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    "domain" TEXT NOT NULL UNIQUE,
    user_id UUID NOT NULL
);
CREATE TABLE bonuses (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    site_id UUID NOT NULL,
    title TEXT NOT NULL
);
CREATE TABLE users (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    email TEXT NOT NULL,
    password_hash TEXT NOT NULL,
    locked_at TIMESTAMP WITH TIME ZONE DEFAULT NULL,
    failed_login_attempts INT DEFAULT 0 NOT NULL
);
CREATE TABLE clients (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    bonuse_id UUID NOT NULL,
    phone TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL
);
ALTER TABLE bonuses ADD CONSTRAINT bonuses_ref_site_id FOREIGN KEY (site_id) REFERENCES sites (id) ON DELETE NO ACTION;
ALTER TABLE clients ADD CONSTRAINT clients_ref_bonuse_id FOREIGN KEY (bonuse_id) REFERENCES bonuses (id) ON DELETE NO ACTION;
ALTER TABLE sites ADD CONSTRAINT sites_ref_user_id FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE NO ACTION;
