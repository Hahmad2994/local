--liquibase formatted sql

--changeset  hussain:view_1 runOnChange:true stripeComments:false

-- View: public.order_details

-- DROP VIEW public.order_details;

CREATE OR REPLACE VIEW public.UsersView
 AS
 
 select * 
 from Users u

ALTER TABLE public.UsersView
    OWNER TO postgres;

