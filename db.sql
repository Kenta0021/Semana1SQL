CREATE TABLE "users" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" varchar(2) DEFAULT 18
);

CREATE TABLE "courses" (
  "id" serial PRIMARY KEY,
  "user_id" serial,
  "title" varchar,
  "description" varchar,
  "level" varchar,
  "teacher" varchar
);

CREATE TABLE "course_video" (
  "id" serial PRIMARY KEY,
  "course_id" serial,
  "title" varchar,
  "url" varchar UNIQUE
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "course_video_id" serial,
  "course_video" serial,
  "name" varchar
);

ALTER TABLE "courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "course_video" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "categories" ADD FOREIGN KEY ("course_video_id") REFERENCES "course_video" ("id");

ALTER TABLE "categories" ADD FOREIGN KEY ("course_video") REFERENCES "courses" ("id");
