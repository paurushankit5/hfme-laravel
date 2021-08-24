-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE TABLE "migrations" -----------------------------------
CREATE TABLE `migrations`( 
	`id` Int( 10 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`migration` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`batch` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 14;
-- -------------------------------------------------------------


-- CREATE TABLE "oauth_access_tokens" --------------------------
CREATE TABLE `oauth_access_tokens`( 
	`id` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`user_id` BigInt( 20 ) NULL,
	`client_id` Int( 10 ) UNSIGNED NOT NULL,
	`name` VarChar( 191 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`scopes` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`revoked` TinyInt( 1 ) NOT NULL,
	`created_at` Timestamp NULL,
	`updated_at` Timestamp NULL,
	`expires_at` DateTime NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "oauth_auth_codes" -----------------------------
CREATE TABLE `oauth_auth_codes`( 
	`id` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`user_id` BigInt( 20 ) NOT NULL,
	`client_id` Int( 10 ) UNSIGNED NOT NULL,
	`scopes` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`revoked` TinyInt( 1 ) NOT NULL,
	`expires_at` DateTime NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "oauth_clients" --------------------------------
CREATE TABLE `oauth_clients`( 
	`id` Int( 10 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`user_id` BigInt( 20 ) NULL,
	`name` VarChar( 191 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`secret` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`redirect` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`personal_access_client` TinyInt( 1 ) NOT NULL,
	`password_client` TinyInt( 1 ) NOT NULL,
	`revoked` TinyInt( 1 ) NOT NULL,
	`created_at` Timestamp NULL,
	`updated_at` Timestamp NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- -------------------------------------------------------------


-- CREATE TABLE "oauth_personal_access_clients" ----------------
CREATE TABLE `oauth_personal_access_clients`( 
	`id` Int( 10 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`client_id` Int( 10 ) UNSIGNED NOT NULL,
	`created_at` Timestamp NULL,
	`updated_at` Timestamp NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- -------------------------------------------------------------


-- CREATE TABLE "oauth_refresh_tokens" -------------------------
CREATE TABLE `oauth_refresh_tokens`( 
	`id` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`access_token_id` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`revoked` TinyInt( 1 ) NOT NULL,
	`expires_at` DateTime NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "password_resets" ------------------------------
CREATE TABLE `password_resets`( 
	`email` VarChar( 191 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`token` VarChar( 191 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`created_at` Timestamp NULL )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "users" ----------------------------------------
CREATE TABLE `users`( 
	`id` BigInt( 20 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`name` VarChar( 191 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`email` VarChar( 191 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`email_verified_at` Timestamp NULL,
	`password` VarChar( 191 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`remember_token` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`created_at` Timestamp NULL,
	`updated_at` Timestamp NULL,
	`is_superuser` TinyInt( 1 ) NOT NULL DEFAULT 0,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `users_email_unique` UNIQUE( `email` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 4;
-- -------------------------------------------------------------


-- CREATE TABLE "vehicle_types" --------------------------------
CREATE TABLE `vehicle_types`( 
	`id` BigInt( 20 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`name` VarChar( 191 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`created_at` Timestamp NULL,
	`updated_at` Timestamp NULL,
	`pricing_rule` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- -------------------------------------------------------------


-- CREATE TABLE "slots" ----------------------------------------
CREATE TABLE `slots`( 
	`id` BigInt( 20 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`vehicle_type_id` BigInt( 20 ) UNSIGNED NULL,
	`created_at` Timestamp NULL,
	`updated_at` Timestamp NULL,
	`is_slot_free` TinyInt( 1 ) NOT NULL DEFAULT 1,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 10;
-- -------------------------------------------------------------


-- CREATE TABLE "booked_slots" ---------------------------------
CREATE TABLE `booked_slots`( 
	`id` BigInt( 20 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`vehicle_number` VarChar( 191 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`slot_id` BigInt( 20 ) UNSIGNED NULL,
	`entry_time` DateTime NOT NULL,
	`exit_time` DateTime NULL,
	`is_vehicle_inside` TinyInt( 1 ) NOT NULL DEFAULT 1,
	`price` Int( 11 ) NOT NULL DEFAULT 0,
	`created_at` Timestamp NULL,
	`updated_at` Timestamp NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- Dump data of "migrations" -------------------------------
BEGIN;

INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES 
( '1', '2014_10_12_000000_create_users_table', '1' ),
( '2', '2014_10_12_100000_create_password_resets_table', '1' ),
( '3', '2016_06_01_000001_create_oauth_auth_codes_table', '2' ),
( '4', '2016_06_01_000002_create_oauth_access_tokens_table', '2' ),
( '5', '2016_06_01_000003_create_oauth_refresh_tokens_table', '2' ),
( '6', '2016_06_01_000004_create_oauth_clients_table', '2' ),
( '7', '2016_06_01_000005_create_oauth_personal_access_clients_table', '2' ),
( '8', '2021_08_24_101707_add_superuser_to_users', '3' ),
( '9', '2021_08_24_114548_create_vehicle_types_table', '4' ),
( '10', '2021_08_24_114717_create_slots_table', '5' ),
( '11', '2021_08_24_120215_create_booked_slots_table', '6' ),
( '12', '2021_08_24_120643_add_is_slot_free_to_slots', '7' ),
( '13', '2021_08_24_121211_add_pricing_rule_to_vehicle_type', '8' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "oauth_access_tokens" ----------------------
BEGIN;

INSERT INTO `oauth_access_tokens`(`id`,`user_id`,`client_id`,`name`,`scopes`,`revoked`,`created_at`,`updated_at`,`expires_at`) VALUES 
( '177bd9396f215c8052f055024b9bdd43210384546c62b4fcbeae37b923cbbce9154b44d5d072c0e4', '1', '1', 'Personal Access Token', '[]', '0', '2021-08-16 16:50:05', '2021-08-16 16:50:05', '2022-08-16 16:50:05' ),
( '42691e2f7a20f40118161f9df31dab58cf221618e5e2ad9ee0dda92237eab1d2fd28cbc819b0345e', '1', '1', 'Personal Access Token', '[]', '0', '2021-08-24 09:27:31', '2021-08-24 09:27:31', '2021-08-31 09:27:31' ),
( '49fcf6d935cf0988474cdcefe805778edb6aa0b531f9f1297eb592ed0d41e2d02bf87c5359008fc8', '1', '1', NULL, '[]', '0', '2021-08-16 16:48:04', '2021-08-16 16:48:04', '2022-08-16 16:48:04' ),
( '96a9022dee69d2c6bc78ff31d083a73b4449df95dec0c0aed946ef2e228342a6caad0cac33f05f26', '1', '1', 'Personal Access Token', '[]', '0', '2021-08-16 16:51:00', '2021-08-16 16:51:00', '2021-08-23 16:51:00' ),
( 'b16409b54b9f4b957037a31a2d58e0e3d72091d36253149e18a2cf76bcf09d7a548cc21449f841a3', '1', '1', 'Personal Access Token', '[]', '0', '2021-08-16 16:50:50', '2021-08-16 16:50:50', '2021-08-23 16:50:50' ),
( 'cfb057f2f4e78f941ded3945246ebdd6558e8cc0b1691bfa892bea987036fcd0818ec1cdb8c94b13', '1', '1', 'Personal Access Token', '[]', '0', '2021-08-16 16:50:44', '2021-08-16 16:50:44', '2021-08-23 16:50:44' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "oauth_auth_codes" -------------------------
-- ---------------------------------------------------------


-- Dump data of "oauth_clients" ----------------------------
BEGIN;

INSERT INTO `oauth_clients`(`id`,`user_id`,`name`,`secret`,`redirect`,`personal_access_client`,`password_client`,`revoked`,`created_at`,`updated_at`) VALUES 
( '1', NULL, 'Laravel Personal Access Client', 'YpCyiafdtmldp6j0eUE2vnrWsNGMUV8IHBsiMBrn', 'http://localhost', '1', '0', '0', '2021-08-16 16:27:24', '2021-08-16 16:27:24' ),
( '2', NULL, 'Laravel Password Grant Client', 'qmo5ivaS8Vuqnf7hLHdX1BTAs5TeUQTHCRA8C7LG', 'http://localhost', '0', '1', '0', '2021-08-16 16:27:24', '2021-08-16 16:27:24' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "oauth_personal_access_clients" ------------
BEGIN;

INSERT INTO `oauth_personal_access_clients`(`id`,`client_id`,`created_at`,`updated_at`) VALUES 
( '1', '1', '2021-08-16 16:27:24', '2021-08-16 16:27:24' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "oauth_refresh_tokens" ---------------------
-- ---------------------------------------------------------


-- Dump data of "password_resets" --------------------------
-- ---------------------------------------------------------


-- Dump data of "users" ------------------------------------
BEGIN;

INSERT INTO `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`,`is_superuser`) VALUES 
( '1', 'Rahul', 'admin@gmail.com', NULL, '$2y$10$EbRBU4d3lG3.iZY4RQi1Uu4aaBC62rWOCv3fnF0LB4SrI3GIsnRg.', 'qwPAcD3981ldtU4Y2pI1ewyULrAdhM5zYfK9dpMxhhTBkYPSPXmfluYp6tsZ', '2021-08-16 16:20:23', '2021-08-16 16:20:23', '1' ),
( '2', 'test', 'test@gmail.com', NULL, '$2y$10$Y1k415LByuXvoSW68EdY0.J.P.kpaRMwAu8TXyIXU4wjVv/X.Hhb.', NULL, '2021-08-18 08:45:57', '2021-08-18 08:45:57', '0' ),
( '3', 'hello', 'hello@gmail.com', NULL, '$2y$10$JF29nu1KKhDmxW5TW/kYsOiLCXIzflHhXNIHUklSOYe72fDqRF8x2', NULL, '2021-08-18 08:47:15', '2021-08-18 08:47:15', '0' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "vehicle_types" ----------------------------
BEGIN;

INSERT INTO `vehicle_types`(`id`,`name`,`created_at`,`updated_at`,`pricing_rule`) VALUES 
( '1', 'Two Wheelers', NULL, NULL, '[
  {
    "min_duration" : 0,
    "max_duration" : 120,
    "price" : 20
  },
  {
    "min_duration" : 121,
    "max_duration" : 240,
    "price" : 50
  },
  {
    "min_duration" : 241,
    "max_duration" : 1440,
    "price" : 100
  },
  {
    "per_day" : 120
  }
]' ),
( '2', 'Cars', NULL, NULL, '[
  {
    "min_duration" : 0,
    "max_duration" : 120,
    "price" : 40
  },
  {
    "min_duration" : 121,
    "max_duration" : 240,
    "price" : 100
  },
  {
    "min_duration" : 241,
    "max_duration" : 1440,
    "price" : 200
  },
  {
    "per_day" : 240
  }
]' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "slots" ------------------------------------
BEGIN;

INSERT INTO `slots`(`id`,`vehicle_type_id`,`created_at`,`updated_at`,`is_slot_free`) VALUES 
( '10', '1', '2021-08-24 13:17:37', '2021-08-24 13:25:01', '1' ),
( '11', '1', '2021-08-24 13:17:37', '2021-08-24 13:17:37', '1' ),
( '12', '1', '2021-08-24 13:17:37', '2021-08-24 13:17:37', '1' ),
( '13', '1', '2021-08-24 13:17:37', '2021-08-24 13:17:37', '1' ),
( '14', '1', '2021-08-24 13:17:37', '2021-08-24 13:17:37', '1' ),
( '15', '2', '2021-08-24 13:17:37', '2021-08-24 13:24:40', '0' ),
( '16', '2', '2021-08-24 13:17:37', '2021-08-24 13:17:37', '1' ),
( '17', '2', '2021-08-24 13:17:37', '2021-08-24 13:17:37', '1' ),
( '18', '2', '2021-08-24 13:17:37', '2021-08-24 13:17:37', '1' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "booked_slots" -----------------------------
BEGIN;

INSERT INTO `booked_slots`(`id`,`vehicle_number`,`slot_id`,`entry_time`,`exit_time`,`is_vehicle_inside`,`price`,`created_at`,`updated_at`) VALUES 
( '8', 'KA12342', '10', '2021-08-24 13:19:30', '2021-08-24 13:25:01', '0', '480', '2021-08-24 13:19:30', '2021-08-24 13:25:01' ),
( '9', 'KA12342', '15', '2021-08-24 13:24:40', NULL, '1', '0', '2021-08-24 13:24:40', '2021-08-24 13:24:40' );
COMMIT;
-- ---------------------------------------------------------


-- CREATE INDEX "oauth_access_tokens_user_id_index" ------------
CREATE INDEX `oauth_access_tokens_user_id_index` USING BTREE ON `oauth_access_tokens`( `user_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "oauth_clients_user_id_index" ------------------
CREATE INDEX `oauth_clients_user_id_index` USING BTREE ON `oauth_clients`( `user_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "oauth_personal_access_clients_client_id_index" 
CREATE INDEX `oauth_personal_access_clients_client_id_index` USING BTREE ON `oauth_personal_access_clients`( `client_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "oauth_refresh_tokens_access_token_id_index" ---
CREATE INDEX `oauth_refresh_tokens_access_token_id_index` USING BTREE ON `oauth_refresh_tokens`( `access_token_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "password_resets_email_index" ------------------
CREATE INDEX `password_resets_email_index` USING BTREE ON `password_resets`( `email` );
-- -------------------------------------------------------------


-- CREATE INDEX "slots_vehicle_type_id_foreign" ----------------
CREATE INDEX `slots_vehicle_type_id_foreign` USING BTREE ON `slots`( `vehicle_type_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "booked_slots_slot_id_foreign" -----------------
CREATE INDEX `booked_slots_slot_id_foreign` USING BTREE ON `booked_slots`( `slot_id` );
-- -------------------------------------------------------------


-- CREATE LINK "slots_vehicle_type_id_foreign" -----------------
ALTER TABLE `slots`
	ADD CONSTRAINT `slots_vehicle_type_id_foreign` FOREIGN KEY ( `vehicle_type_id` )
	REFERENCES `vehicle_types`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------


-- CREATE LINK "booked_slots_slot_id_foreign" ------------------
ALTER TABLE `booked_slots`
	ADD CONSTRAINT `booked_slots_slot_id_foreign` FOREIGN KEY ( `slot_id` )
	REFERENCES `slots`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


