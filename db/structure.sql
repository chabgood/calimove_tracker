SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: exercises_before_update_row_tr(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.exercises_before_update_row_tr() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.workout_value = (SELECT (e1.test_result::FLOAT * NEW.percentage)/100 FROM exercises e1
          WHERE e1.workout_name_id = NEW.workout_name_id
          ORDER BY e1.id ASC LIMIT 1);
    RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: data_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.data_migrations (
    version character varying NOT NULL
);


--
-- Name: day_names; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.day_names (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: day_names_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.day_names_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: day_names_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.day_names_id_seq OWNED BY public.day_names.id;


--
-- Name: days; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.days (
    id bigint NOT NULL,
    day_name_id bigint,
    week_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: days_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.days_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: days_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.days_id_seq OWNED BY public.days.id;


--
-- Name: exercise_statuses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.exercise_statuses (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: exercise_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.exercise_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: exercise_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.exercise_statuses_id_seq OWNED BY public.exercise_statuses.id;


--
-- Name: exercises; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.exercises (
    id bigint NOT NULL,
    day_id bigint,
    level_id bigint,
    phase_id bigint,
    exercise_statuses_id bigint,
    number character varying,
    workout character varying,
    workout_name_id bigint,
    intensity character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    sets integer DEFAULT 0,
    rest_between_sets_id integer,
    rest_between_exercises_id integer,
    test_result integer,
    workout_value double precision,
    notes text,
    percentage integer
);


--
-- Name: exercises_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.exercises_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: exercises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.exercises_id_seq OWNED BY public.exercises.id;


--
-- Name: levels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.levels (
    id bigint NOT NULL,
    number character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: levels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.levels_id_seq OWNED BY public.levels.id;


--
-- Name: phases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.phases (
    id bigint NOT NULL,
    number character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: phases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.phases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: phases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.phases_id_seq OWNED BY public.phases.id;


--
-- Name: rest_times; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rest_times (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: rest_times_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rest_times_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rest_times_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.rest_times_id_seq OWNED BY public.rest_times.id;


--
-- Name: schedules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schedules (
    id bigint NOT NULL,
    title character varying NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.schedules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.schedules_id_seq OWNED BY public.schedules.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    ip_address character varying,
    user_agent character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: set_trackers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.set_trackers (
    id bigint NOT NULL,
    exercise_id bigint NOT NULL,
    completed boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: set_trackers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.set_trackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: set_trackers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.set_trackers_id_seq OWNED BY public.set_trackers.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email_address character varying NOT NULL,
    password_digest character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    admin boolean DEFAULT false
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: week_statuses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.week_statuses (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: week_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.week_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: week_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.week_statuses_id_seq OWNED BY public.week_statuses.id;


--
-- Name: weeks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.weeks (
    id bigint NOT NULL,
    schedule_id bigint,
    week_statuses_id bigint,
    number integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: weeks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.weeks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: weeks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.weeks_id_seq OWNED BY public.weeks.id;


--
-- Name: workout_names; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.workout_names (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: workout_names_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.workout_names_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: workout_names_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.workout_names_id_seq OWNED BY public.workout_names.id;


--
-- Name: day_names id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.day_names ALTER COLUMN id SET DEFAULT nextval('public.day_names_id_seq'::regclass);


--
-- Name: days id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.days ALTER COLUMN id SET DEFAULT nextval('public.days_id_seq'::regclass);


--
-- Name: exercise_statuses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exercise_statuses ALTER COLUMN id SET DEFAULT nextval('public.exercise_statuses_id_seq'::regclass);


--
-- Name: exercises id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exercises ALTER COLUMN id SET DEFAULT nextval('public.exercises_id_seq'::regclass);


--
-- Name: levels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.levels ALTER COLUMN id SET DEFAULT nextval('public.levels_id_seq'::regclass);


--
-- Name: phases id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phases ALTER COLUMN id SET DEFAULT nextval('public.phases_id_seq'::regclass);


--
-- Name: rest_times id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rest_times ALTER COLUMN id SET DEFAULT nextval('public.rest_times_id_seq'::regclass);


--
-- Name: schedules id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schedules ALTER COLUMN id SET DEFAULT nextval('public.schedules_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: set_trackers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.set_trackers ALTER COLUMN id SET DEFAULT nextval('public.set_trackers_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: week_statuses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.week_statuses ALTER COLUMN id SET DEFAULT nextval('public.week_statuses_id_seq'::regclass);


--
-- Name: weeks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.weeks ALTER COLUMN id SET DEFAULT nextval('public.weeks_id_seq'::regclass);


--
-- Name: workout_names id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workout_names ALTER COLUMN id SET DEFAULT nextval('public.workout_names_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: data_migrations data_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_migrations
    ADD CONSTRAINT data_migrations_pkey PRIMARY KEY (version);


--
-- Name: day_names day_names_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.day_names
    ADD CONSTRAINT day_names_pkey PRIMARY KEY (id);


--
-- Name: days days_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.days
    ADD CONSTRAINT days_pkey PRIMARY KEY (id);


--
-- Name: exercise_statuses exercise_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exercise_statuses
    ADD CONSTRAINT exercise_statuses_pkey PRIMARY KEY (id);


--
-- Name: exercises exercises_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exercises
    ADD CONSTRAINT exercises_pkey PRIMARY KEY (id);


--
-- Name: levels levels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.levels
    ADD CONSTRAINT levels_pkey PRIMARY KEY (id);


--
-- Name: phases phases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phases
    ADD CONSTRAINT phases_pkey PRIMARY KEY (id);


--
-- Name: rest_times rest_times_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rest_times
    ADD CONSTRAINT rest_times_pkey PRIMARY KEY (id);


--
-- Name: schedules schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: set_trackers set_trackers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.set_trackers
    ADD CONSTRAINT set_trackers_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: week_statuses week_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.week_statuses
    ADD CONSTRAINT week_statuses_pkey PRIMARY KEY (id);


--
-- Name: weeks weeks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.weeks
    ADD CONSTRAINT weeks_pkey PRIMARY KEY (id);


--
-- Name: workout_names workout_names_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workout_names
    ADD CONSTRAINT workout_names_pkey PRIMARY KEY (id);


--
-- Name: index_day_names_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_day_names_on_name ON public.day_names USING btree (name);


--
-- Name: index_days_on_day_name_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_days_on_day_name_id ON public.days USING btree (day_name_id);


--
-- Name: index_days_on_week_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_days_on_week_id ON public.days USING btree (week_id);


--
-- Name: index_exercises_on_day_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_exercises_on_day_id ON public.exercises USING btree (day_id);


--
-- Name: index_exercises_on_exercise_statuses_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_exercises_on_exercise_statuses_id ON public.exercises USING btree (exercise_statuses_id);


--
-- Name: index_exercises_on_level_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_exercises_on_level_id ON public.exercises USING btree (level_id);


--
-- Name: index_exercises_on_phase_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_exercises_on_phase_id ON public.exercises USING btree (phase_id);


--
-- Name: index_exercises_on_workout_name_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_exercises_on_workout_name_id ON public.exercises USING btree (workout_name_id);


--
-- Name: index_levels_on_number; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_levels_on_number ON public.levels USING btree (number);


--
-- Name: index_phases_on_number; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_phases_on_number ON public.phases USING btree (number);


--
-- Name: index_schedules_on_title_and_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_schedules_on_title_and_user_id ON public.schedules USING btree (title, user_id);


--
-- Name: index_schedules_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_schedules_on_user_id ON public.schedules USING btree (user_id);


--
-- Name: index_sessions_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sessions_on_user_id ON public.sessions USING btree (user_id);


--
-- Name: index_set_trackers_on_exercise_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_set_trackers_on_exercise_id ON public.set_trackers USING btree (exercise_id);


--
-- Name: index_users_on_email_address; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email_address ON public.users USING btree (email_address);


--
-- Name: index_weeks_on_schedule_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_weeks_on_schedule_id ON public.weeks USING btree (schedule_id);


--
-- Name: index_weeks_on_week_statuses_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_weeks_on_week_statuses_id ON public.weeks USING btree (week_statuses_id);


--
-- Name: index_workout_names_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_workout_names_on_name ON public.workout_names USING btree (name);


--
-- Name: exercises exercises_before_update_row_tr; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER exercises_before_update_row_tr BEFORE UPDATE ON public.exercises FOR EACH ROW EXECUTE FUNCTION public.exercises_before_update_row_tr();


--
-- Name: set_trackers fk_rails_05e8a805c7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.set_trackers
    ADD CONSTRAINT fk_rails_05e8a805c7 FOREIGN KEY (exercise_id) REFERENCES public.exercises(id);


--
-- Name: exercises fk_rails_08c387acdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exercises
    ADD CONSTRAINT fk_rails_08c387acdd FOREIGN KEY (exercise_statuses_id) REFERENCES public.exercise_statuses(id);


--
-- Name: exercises fk_rails_24a581eead; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exercises
    ADD CONSTRAINT fk_rails_24a581eead FOREIGN KEY (day_id) REFERENCES public.days(id);


--
-- Name: days fk_rails_379a943d41; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.days
    ADD CONSTRAINT fk_rails_379a943d41 FOREIGN KEY (day_name_id) REFERENCES public.day_names(id);


--
-- Name: schedules fk_rails_3c900465fa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT fk_rails_3c900465fa FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: sessions fk_rails_758836b4f0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT fk_rails_758836b4f0 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: exercises fk_rails_8a066a682b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exercises
    ADD CONSTRAINT fk_rails_8a066a682b FOREIGN KEY (phase_id) REFERENCES public.phases(id);


--
-- Name: days fk_rails_bfc707e786; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.days
    ADD CONSTRAINT fk_rails_bfc707e786 FOREIGN KEY (week_id) REFERENCES public.weeks(id);


--
-- Name: exercises fk_rails_c0aa1d7324; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exercises
    ADD CONSTRAINT fk_rails_c0aa1d7324 FOREIGN KEY (workout_name_id) REFERENCES public.workout_names(id);


--
-- Name: exercises fk_rails_c35342a474; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exercises
    ADD CONSTRAINT fk_rails_c35342a474 FOREIGN KEY (rest_between_exercises_id) REFERENCES public.rest_times(id);


--
-- Name: weeks fk_rails_d845741310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.weeks
    ADD CONSTRAINT fk_rails_d845741310 FOREIGN KEY (schedule_id) REFERENCES public.schedules(id);


--
-- Name: exercises fk_rails_e4f9931325; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exercises
    ADD CONSTRAINT fk_rails_e4f9931325 FOREIGN KEY (rest_between_sets_id) REFERENCES public.rest_times(id);


--
-- Name: weeks fk_rails_e84e6d10f7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.weeks
    ADD CONSTRAINT fk_rails_e84e6d10f7 FOREIGN KEY (week_statuses_id) REFERENCES public.week_statuses(id);


--
-- Name: exercises fk_rails_ea83fab3fd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exercises
    ADD CONSTRAINT fk_rails_ea83fab3fd FOREIGN KEY (level_id) REFERENCES public.levels(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20250331215026'),
('20250329205554'),
('20250328202805'),
('20250327191558'),
('20250327155738'),
('20250326022025'),
('20250320215710'),
('20250311000542'),
('20250301191724'),
('20250225231246'),
('20250223002839'),
('20250131232753'),
('20250125052608'),
('20250105005300'),
('20250103014910'),
('20241231014113'),
('20241231014112');

