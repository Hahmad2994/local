--liquibase formatted sql

-- FUNCTION: public.calculate_total_price(integer, numeric)

-- DROP FUNCTION IF EXISTS public.calculate_total_price(integer, numeric);

CREATE OR REPLACE FUNCTION public.calculate_total_price(
	order_id integer)
    RETURNS numeric
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE
    total DECIMAL;
BEGIN
    SELECT SUM(p.price * oi.quantity)
    INTO total
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    WHERE oi.order_id = order_id;

    RETURN total;
END;
$BODY$;

ALTER FUNCTION public.calculate_total_price(integer)
    OWNER TO postgres;
