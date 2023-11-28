--liquibase formatted sql

--changeset  hussain:view_2 runOnChange:true stripeComments:false

-- View: public.product_details

-- DROP VIEW public.product_details;

CREATE OR REPLACE VIEW public.product_details
 AS
 SELECT p.product_id,
    p.product_name,
    p.price,
    p.stock_quantity,
    c.category_name
   FROM products p
     LEFT JOIN categories c ON p.category_id = c.category_id;

ALTER TABLE public.product_details
    OWNER TO postgres;

