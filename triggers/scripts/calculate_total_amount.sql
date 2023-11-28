--liquibase formatted sql

--changeset  hussain:trigger_2 runOnChange:true stripeComments:false splitStatements:false
-- FUNCTION: public.calculate_total_amount()

-- DROP FUNCTION IF EXISTS public.calculate_total_amount();

CREATE OR REPLACE FUNCTION public.calculate_total_amount()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
BEGIN
    NEW.total_amount := (SELECT SUM(price * quantity) FROM order_items WHERE order_id = NEW.order_id);
    RETURN NEW;
END;
$BODY$;

ALTER FUNCTION public.calculate_total_amount()
    OWNER TO postgres;
