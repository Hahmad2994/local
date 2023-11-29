--liquibase formatted sql

--changeset  hussain:table_8 runOnChange:true stripeComments:false

-- Table: public.Roles

-- DROP TABLE IF EXISTS public.Roles;

CREATE TABLE IF NOT EXISTS public.Roles
(
    Id integer NOT NULL,
    Name character varying(50)
    
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.Roles
    OWNER to postgres;