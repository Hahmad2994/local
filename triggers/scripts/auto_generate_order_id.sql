--liquibase formatted sql

--changeset  hussain:trigger_1 runOnChange:true stripeComments:false splitStatements:false

-- FUNCTION: public.auto_generate_order_id()

-- DROP FUNCTION IF EXISTS public.auto_generate_order_id();

CREATE OR REPLACE FUNCTION public.auto_generate_order_id()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
BEGIN
    NEW.order_id := nextval('order_id_sequence');
    RETURN NEW;
END;
$BODY$;

ALTER FUNCTION public.auto_generate_order_id()
    OWNER TO postgres;
