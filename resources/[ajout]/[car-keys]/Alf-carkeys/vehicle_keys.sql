CREATE TABLE `vehicle_keys` (
  `id` int(11) NOT NULL,
  `identifier` longtext NOT NULL,
  `plate` varchar(12) NOT NULL,
  `state` longtext,
  `label` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `vehicle_keys`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `vehicle_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

CREATE TABLE `vehicle_keys` (
  `id` int(11) NOT NULL,
  `identifier` longtext NOT NULL,
  `plate` varchar(12) NOT NULL,
  `state` longtext,
  `label` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `vehicle_keys`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `vehicle_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

CREATE TABLE `open_car` (
  `id` int NOT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  `got` varchar(50) DEFAULT NULL,
  `NB` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `open_car`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `open_car`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;
COMMIT;