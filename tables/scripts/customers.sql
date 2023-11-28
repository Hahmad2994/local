--liquibase formatted sql

--changeset  hussain:table_4 runOnChange:true stripeComments:false
-- Table: public.customers

-- DROP TABLE IF EXISTS public.customers;

CREATE TABLE IF NOT EXISTS public.customers
(
    customer_id integer NOT NULL DEFAULT nextval('customers_customer_id_seq'::regclass),
    customer_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    contact_number character varying(15) COLLATE pg_catalog."default",
    address text COLLATE pg_catalog."default",
    CONSTRAINT customers_pkey PRIMARY KEY (customer_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.customers
    OWNER to postgres;