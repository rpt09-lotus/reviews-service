DROP SCHEMA public CASCADE;

CREATE SCHEMA public;

CREATE TABLE reviews (
  review_id SERIAL PRIMARY KEY,
  user_id integer,
  trail_id integer,
  description text,
  rating integer,
  date text,
  act_id int,
  act_id REFERENCES activities(activity_id),
  PRIMARY KEY (review_id, act_id)
);

CREATE TABLE activities (
  activity_id SERIAL PRIMARY KEY,
  body text,
);

INSERT INTO activities (body) VALUES ('Backpacking');
INSERT INTO activities (body) VALUES ('Birding');
INSERT INTO activities (body) VALUES ('Camping');
INSERT INTO activities (body) VALUES ('Cross Country Skiing');
INSERT INTO activities (body) VALUES ('Hiking');
INSERT INTO activities (body) VALUES ('Horseback Riding');
INSERT INTO activities (body) VALUES ('Mountain Biking');
INSERT INTO activities (body) VALUES ('Nature Trips');
INSERT INTO activities (body) VALUES ('Off Road Driving');
INSERT INTO activities (body) VALUES ('Paddle Sports');
INSERT INTO activities (body) VALUES ('Road Biking ');
INSERT INTO activities (body) VALUES ('Rock Climbing');
INSERT INTO activities (body) VALUES ('Scenic Driving');
INSERT INTO activities (body) VALUES ('Snow Shoeing');
INSERT INTO activities (body) VALUES ('Skiing');
INSERT INTO activities (body) VALUES ('Walking');
