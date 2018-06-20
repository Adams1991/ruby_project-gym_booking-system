DROP TABLE bookings;
DROP TABLE boxers;
DROP TABLE trainers;
DROP TABLE fitness_classes;


CREATE TABLE fitness_classes
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  capacity INT8,
  duration VARCHAR(255) not null,
  start_time TIMESTAMP,
  premium_members BOOLEAN not null
);

CREATE TABLE trainers
(
  id SERIAL8 primary key,
  first_name VARCHAR(255) not null,
  last_name VARCHAR(255) not null,
  premium_trainer BOOLEAN not null
);

CREATE TABLE boxers
(
  id SERIAL8 primary key,
  first_name VARCHAR(255) not null,
  last_name VARCHAR(255) not null,
  premium_member BOOLEAN not null,
  skill/health_mot VARCHAR(255),
  trainer_id INT8 references trainers(id) ON DELETE CASCADE
);

CREATE TABLE bookings
(
  id SERIAL8 primary key,
  boxer_id INT8 references boxers(id) ON DELETE CASCADE,
  fitness_class_id INT8 references fitness_classes(id) ON DELETE CASCADE
);
