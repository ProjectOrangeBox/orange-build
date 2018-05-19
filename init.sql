#
# SQL Export
# Created by Querious (201026)
# Encoding: Unicode (UTF-8)
#

USE `skynet_development_com`;

SET @PREVIOUS_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;


DROP TABLE IF EXISTS `orange_users`;
DROP TABLE IF EXISTS `orange_user_role`;
DROP TABLE IF EXISTS `orange_settings`;
DROP TABLE IF EXISTS `orange_roles`;
DROP TABLE IF EXISTS `orange_role_permission`;
DROP TABLE IF EXISTS `orange_permissions`;
DROP TABLE IF EXISTS `orange_nav`;
DROP TABLE IF EXISTS `orange_migrations`;


CREATE TABLE `orange_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `orange_nav` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_on` datetime DEFAULT current_timestamp(),
  `created_by` int(11) unsigned NOT NULL DEFAULT 1,
  `created_ip` varchar(15) DEFAULT 'NULL',
  `updated_on` datetime DEFAULT current_timestamp(),
  `updated_by` int(11) unsigned NOT NULL DEFAULT 1,
  `updated_ip` varchar(15) DEFAULT 'NULL',
  `access` int(10) unsigned DEFAULT 0,
  `url` varchar(255) NOT NULL DEFAULT '',
  `text` varchar(255) NOT NULL DEFAULT '',
  `parent_id` int(11) unsigned NOT NULL DEFAULT 0,
  `sort` int(11) unsigned NOT NULL DEFAULT 0,
  `target` varchar(128) DEFAULT NULL,
  `class` varchar(32) DEFAULT '',
  `active` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `color` varchar(7) NOT NULL DEFAULT 'd28445',
  `icon` varchar(32) NOT NULL DEFAULT 'square',
  `internal` varchar(255) DEFAULT NULL,
  `read_role_id` int(10) unsigned DEFAULT 0,
  `edit_role_id` int(10) unsigned DEFAULT 0,
  `delete_role_id` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;


CREATE TABLE `orange_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT 'NULL',
  `group` varchar(128) DEFAULT NULL,
  `read_role_id` int(11) unsigned DEFAULT 1,
  `edit_role_id` int(11) unsigned DEFAULT 1,
  `delete_role_id` int(11) unsigned DEFAULT 1,
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned DEFAULT 3,
  `created_ip` varchar(15) DEFAULT '0.0.0.0',
  `updated_on` datetime DEFAULT NULL,
  `updated_by` int(11) unsigned DEFAULT 3,
  `updated_ip` varchar(15) DEFAULT '0.0.0.0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_key` (`key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8;


CREATE TABLE `orange_role_permission` (
  `role_id` int(10) unsigned NOT NULL DEFAULT 0,
  `permission_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `orange_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` varchar(512) COLLATE utf8_bin NOT NULL DEFAULT '',
  `read_role_id` int(11) unsigned DEFAULT 1,
  `edit_role_id` int(11) unsigned DEFAULT 1,
  `delete_role_id` int(11) unsigned DEFAULT 1,
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned DEFAULT 3,
  `created_ip` varchar(15) CHARACTER SET utf8 DEFAULT '0.0.0.0',
  `updated_on` datetime DEFAULT NULL,
  `updated_by` int(11) unsigned DEFAULT 3,
  `updated_ip` varchar(15) CHARACTER SET utf8 DEFAULT '0.0.0.0',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `orange_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT 1,
  `created_ip` varchar(16) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` int(11) unsigned NOT NULL DEFAULT 0,
  `updated_ip` varchar(16) DEFAULT NULL,
  `read_role_id` int(11) unsigned DEFAULT 1,
  `edit_role_id` int(11) unsigned DEFAULT 1,
  `delete_role_id` int(11) unsigned DEFAULT 1,
  `name` varchar(64) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `group` varchar(64) CHARACTER SET latin1 NOT NULL DEFAULT 'site',
  `value` text CHARACTER SET latin1 NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `help` varchar(255) CHARACTER SET latin1 DEFAULT '',
  `options` text DEFAULT NULL,
  `internal` varchar(64) GENERATED ALWAYS AS (lcase(concat(`group`,'::',`name`))) STORED,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


CREATE TABLE `orange_user_role` (
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `role_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `orange_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_on` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT 1,
  `created_ip` varchar(16) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` int(11) unsigned NOT NULL DEFAULT 1,
  `updated_ip` varchar(16) DEFAULT NULL,
  `deleted_on` datetime DEFAULT NULL,
  `deleted_by` int(11) unsigned DEFAULT 0,
  `deleted_ip` varchar(16) DEFAULT NULL,
  `is_deleted` tinyint(1) unsigned DEFAULT 0,
  `username` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `dashboard_url` varchar(255) DEFAULT NULL,
  `user_read_role_id` int(10) unsigned DEFAULT 3,
  `user_edit_role_id` int(10) unsigned DEFAULT 3,
  `user_delete_role_id` int(10) unsigned DEFAULT 3,
  `read_role_id` int(10) unsigned DEFAULT 1,
  `edit_role_id` int(11) unsigned DEFAULT 1,
  `delete_role_id` int(11) unsigned DEFAULT 1,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `last_login` datetime DEFAULT NULL,
  `last_ip` varchar(16) NOT NULL DEFAULT '0.0.0.0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_email_unique` (`email`) USING BTREE,
  KEY `idx_email` (`email`) USING BTREE,
  KEY `idx_password` (`password`) USING BTREE,
  KEY `idx_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;




SET FOREIGN_KEY_CHECKS = @PREVIOUS_FOREIGN_KEY_CHECKS;
