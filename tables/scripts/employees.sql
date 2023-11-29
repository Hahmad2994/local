--liquibase formatted sql

--changeset  hussain:table_5 runOnChange:true stripeComments:false
-- Table: public.employees

-- DROP TABLE IF EXISTS public.employees;

CREATE TABLE IF NOT EXISTS public.employees
(
    employee_id integer NOT NULL DEFAULT nextval('employees_employee_id_seq'::regclass),
    first_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    hire_date date,
    "position" character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT employees_pkey PRIMARY KEY (employee_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.employees
    OWNER to postgres;