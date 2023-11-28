--liquibase formatted sql

--changeset  hussain:table_6 runOnChange:true stripeComments:false
-- Table: public.orders

-- DROP TABLE IF EXISTS public.orders;

CREATE TABLE IF NOT EXISTS public.orders
(
    order_id integer NOT NULL DEFAULT nextval('orders_order_id_seq'::regclass),
    user_id integer,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    total_amount numeric(10,2) NOT NULL,
    CONSTRAINT orders_pkey PRIMARY KEY (order_id),
    CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.users (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.orders
    OWNER to postgres;

-- Trigger: auto_generate_order_id_trigger

-- DROP TRIGGER IF EXISTS auto_generate_order_id_trigger ON public.orders;

-- CREATE TRIGGER auto_generate_order_id_trigger
--     BEFORE INSERT
--     ON public.orders
--     FOR EACH ROW
--     EXECUTE FUNCTION public.auto_generate_order_id();

-- Trigger: calculate_total_amount_trigger

-- DROP TRIGGER IF EXISTS calculate_total_amount_trigger ON public.orders;

-- CREATE TRIGGER calculate_total_amount_trigger
--     BEFORE INSERT
--     ON public.orders
--     FOR EACH ROW
--     EXECUTE FUNCTION public.calculate_total_amount(); 