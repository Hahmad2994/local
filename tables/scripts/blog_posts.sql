--liquibase formatted sql

--changeset  hussain:table_1 runOnChange:true stripeComments:false
-- Table: public.blog_posts

-- DROP TABLE IF EXISTS public.blog_posts;

CREATE TABLE IF NOT EXISTS public.blog_posts
(
    post_id integer NOT NULL DEFAULT nextval('blog_posts_post_id_seq'::regclass),
    title character varying(255) COLLATE pg_catalog."default" NOT NULL,
    content text COLLATE pg_catalog."default",
    author_id integer,
    publish_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT blog_posts_pkey PRIMARY KEY (post_id),
    CONSTRAINT blog_posts_author_id_fkey FOREIGN KEY (author_id)
        REFERENCES public.users (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.blog_posts
    OWNER to postgres;