-- DROP TABLE bookings;
DROP TABLE fitness_classes;
DROP TABLE boxers;

CREATE TABLE fitness_classes
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  start_time INT4
);

CREATE TABLE boxers
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);

-- CREATE TABLE bookings
-- (
--   id SERIAL8 primary key,
--   boxer_id INT8,
--   fitness_class_id INT8
-- );
