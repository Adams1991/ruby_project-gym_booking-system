DROP TABLE bookings;
DROP TABLE fitness_classes;
DROP TABLE boxers;

CREATE TABLE fitness_classes
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE boxers
(
  id SERIAL8 primary key,
  first_name VARCHAR(255) not null,
  last_name VARCHAR(255) not null
);

CREATE TABLE bookings
(
  id SERIAL8 primary key,
  boxer_id INT8 references boxers(id),
  fitness_class_id INT8 references fitness_classes(id)
);
