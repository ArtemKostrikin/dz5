use dz5;

CREATE TABLE stations
(
train_id INT NOT NULL,
station varchar(20) NOT NULL,
station_time TIME NOT NULL
);
INSERT stations(train_id, station, station_time)
VALUES (110, "SanFrancisco", "10:00:00"),
(110, "Redwood Sity", "10:54:00"),
(110, "Palo Alto", "11:02:00"),
(110, "San Jose", "12:35:00"),
(120, "SanFrancisco", "11:00:00"),
(120, "Palo Alto", "12:49:00"),
(120, "San Jose", "13:30:00");

SELECT * FROM stations;

ALTER TABLE stations
ADD COLUMN time_to_next_station TIME;

UPDATE stations AS s1
JOIN stations AS s2 ON s1.train_id = s2.train_id AND s1.station_time < s2.station_time
SET s1.time_to_next_station = TIMEDIFF(s2.station_time, s1.station_time);

