-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE sites (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    "domain" TEXT NOT NULL UNIQUE
);
CREATE TABLE bonuses (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    site_id UUID NOT NULL,
    title TEXT NOT NULL
);
ALTER TABLE bonuses ADD CONSTRAINT bonuses_ref_site_id FOREIGN KEY (site_id) REFERENCES sites (id) ON DELETE NO ACTION;
