CREATE DATABASE uptime;
USE uptime;

CREATE USER uptime@localhost identified by 'upt1m3_local';
GRANT ALL PRIVILEGES on uptime.* to uptime@localhost;
FLUSH PRIVILEGES;

DROP TABLE IF EXISTS `ambang`;

CREATE TABLE `ambang` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `timestamp` datetime DEFAULT NULL,
  `ip` varchar(256) DEFAULT NULL,
  `hostname` varchar(128) DEFAULT NULL,
  `ambang_cpu` int DEFAULT NULL,
  `ambang_memory` int DEFAULT NULL,
  `ambang_storage` int DEFAULT NULL,
  `value_cpu` int DEFAULT NULL,
  `value_memory` int DEFAULT NULL,
  `value_storage` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timestamp` (`timestamp`),
  KEY `hostname` (`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `res`;

CREATE TABLE `res` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `timestamp` datetime DEFAULT NULL,
  `ip` varchar(256) DEFAULT NULL,
  `machine` varchar(128) DEFAULT NULL,
  `arch` varchar(64) DEFAULT NULL,
  `platform` varchar(64) DEFAULT NULL,
  `release` varchar(128) DEFAULT NULL,
  `version` varchar(128) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `hostname` varchar(128) DEFAULT NULL,
  `uptime` decimal(30,5) DEFAULT NULL,
  `uptimeminutes` decimal(30,5) DEFAULT NULL,
  `uptimehours` decimal(30,5) DEFAULT NULL,
  `uptimedays` decimal(30,5) DEFAULT NULL,
  `totalmem` bigint DEFAULT NULL,
  `freemem` bigint DEFAULT NULL,
  `cpus` text,
  `cpucount` int DEFAULT NULL,
  `loadavg` varchar(128) DEFAULT NULL,
  `loadavgnow` decimal(6,2) DEFAULT NULL,
  `userinfo` text,
  `storagepath` varchar(128) DEFAULT NULL,
  `storagesize` bigint DEFAULT NULL,
  `storagefree` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timestamp` (`timestamp`),
  KEY `ip` (`ip`),
  KEY `machine` (`machine`),
  KEY `type` (`type`),
  KEY `hostname` (`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `uptime_alert`;

CREATE TABLE `uptime_alert` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `logId` bigint DEFAULT NULL,
  `hostname` varchar(128) DEFAULT NULL,
  `alert_on` varchar(10) DEFAULT NULL,
  `active` smallint DEFAULT '1',
  `dated` datetime DEFAULT NULL,
  `datedDeactivate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `logId` (`logId`),
  KEY `hostname` (`hostname`),
  KEY `active` (`active`),
  KEY `dated` (`dated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
