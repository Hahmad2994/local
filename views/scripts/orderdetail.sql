--liquibase formatted sql

--changeset  hussain:view_1 runOnChange:true stripeComments:false

-- View: public.order_details

-- DROP VIEW public.order_details;

CREATE OR REPLACE VIEW public.order_details
 AS
 SELECT o.order_id,
    o.order_date,
    o.total_amount,
    u.username AS customer_username
   FROM orders o
     JOIN users u ON o.user_id = u.user_id;

ALTER TABLE public.order_details
    OWNER TO postgres;

