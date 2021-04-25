<<<<<<< HEAD
-- TABLE
CREATE TABLE "answers" ("id" integer NOT NULL PRIMARY KEY, "answer" varchar DEFAULT NULL, "created_at" integer NOT NULL, "updated_at" datetime(6) NOT NULL, "question_id" varchar DEFAULT 'f', "correct_answer" integer, "quiz_id" integer);
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE demo (id integer primary key, name varchar(20), hint text );
CREATE TABLE "questions" ("id" integer NOT NULL PRIMARY KEY, "quiz_id" integer NOT NULL, "created_at" integer DEFAULT 1569682240 NOT NULL, "updated_at" integer DEFAULT 1569682240 NOT NULL, "question" varchar DEFAULT NULL);
CREATE TABLE "quiz_categories" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "category" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE "quizzes" ("id" integer NOT NULL PRIMARY KEY, "name" varchar DEFAULT NULL, "category" varchar DEFAULT NULL, "created_at" integer DEFAULT 1569682240 NOT NULL, "updated_at" integer DEFAULT 1569682240 NOT NULL, "description" varchar DEFAULT NULL);
CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "scores" ("id" integer NOT NULL PRIMARY KEY, "quiz_id" integer DEFAULT NULL, "score" integer DEFAULT NULL, "user_id" integer DEFAULT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE "sessions" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "session_id" varchar NOT NULL, "data" text, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE "users" ("id" integer NOT NULL PRIMARY KEY, "username" varchar DEFAULT '' NOT NULL, "email" varchar DEFAULT '' NOT NULL, "password" varchar DEFAULT '' NOT NULL, "fullName" varchar DEFAULT NULL, "bio" text DEFAULT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "auth_token" varchar DEFAULT NULL, "password_reset_token" varchar DEFAULT NULL, "password_reset_sent_at" datetime DEFAULT NULL);
 
-- INDEX
CREATE UNIQUE INDEX "index_sessions_on_session_id" ON "sessions" ("session_id");
CREATE INDEX "index_sessions_on_updated_at" ON "sessions" ("updated_at");
 
-- TRIGGER
 
-- VIEW
 
=======
-- TABLE
CREATE TABLE "answers" ("id" integer NOT NULL PRIMARY KEY, "answer" varchar DEFAULT NULL, "created_at" integer NOT NULL, "updated_at" datetime(6) NOT NULL, "question_id" varchar DEFAULT 'f', "correct_answer" integer, "quiz_id" integer);
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE demo (id integer primary key, name varchar(20), hint text );
CREATE TABLE "questions" ("id" integer NOT NULL PRIMARY KEY, "quiz_id" integer NOT NULL, "created_at" integer DEFAULT 1569682240 NOT NULL, "updated_at" integer DEFAULT 1569682240 NOT NULL, "question" varchar DEFAULT NULL);
CREATE TABLE "quiz_categories" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "category" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE "quizzes" ("id" integer NOT NULL PRIMARY KEY, "name" varchar DEFAULT NULL, "category" varchar DEFAULT NULL, "created_at" integer DEFAULT 1569682240 NOT NULL, "updated_at" integer DEFAULT 1569682240 NOT NULL, "description" varchar DEFAULT NULL);
CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "scores" ("id" integer NOT NULL PRIMARY KEY, "quiz_id" integer DEFAULT NULL, "score" integer DEFAULT NULL, "user_id" integer DEFAULT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE "sessions" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "session_id" varchar NOT NULL, "data" text, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE "users" ("id" integer NOT NULL PRIMARY KEY, "username" varchar DEFAULT '' NOT NULL, "email" varchar DEFAULT '' NOT NULL, "password" varchar DEFAULT '' NOT NULL, "fullName" varchar DEFAULT NULL, "bio" text DEFAULT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "auth_token" varchar DEFAULT NULL, "password_reset_token" varchar DEFAULT NULL, "password_reset_sent_at" datetime DEFAULT NULL);
 
-- INDEX
CREATE UNIQUE INDEX "index_sessions_on_session_id" ON "sessions" ("session_id");
CREATE INDEX "index_sessions_on_updated_at" ON "sessions" ("updated_at");
 
-- TRIGGER
 
-- VIEW
 
>>>>>>> e9d2931d3bb03823003c44d26c1891c8a998f8b9
