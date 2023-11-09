

CREATE TABLE `archivos`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`nombre` VarChar( 650 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`descripcion` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`tipo` VarChar( 50 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`formato` VarChar( 50 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`dir` VarChar( 500 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`created_at` DateTime NOT NULL,
	`updated_at` DateTime NOT NULL,
	`created_by_id` Int( 0 ) NOT NULL,
	`updated_by_id` Int( 0 ) NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 33;



CREATE TABLE `auth_group`( 
	`id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 150 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `name` UNIQUE( `name` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;



CREATE TABLE `auth_group_permissions`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`group_id` Int( 0 ) NOT NULL,
	`permission_id` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` UNIQUE( `group_id`, `permission_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;



CREATE TABLE `auth_permission`( 
	`id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`content_type_id` Int( 0 ) NOT NULL,
	`codename` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `auth_permission_content_type_id_codename_01ab375a_uniq` UNIQUE( `content_type_id`, `codename` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 84;



CREATE TABLE `auth_user`( 
	`id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`password` VarChar( 128 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`last_login` DateTime NULL DEFAULT NULL,
	`is_superuser` TinyInt( 1 ) NOT NULL,
	`username` VarChar( 150 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`first_name` VarChar( 150 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`last_name` VarChar( 150 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`email` VarChar( 254 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`is_staff` TinyInt( 1 ) NOT NULL,
	`is_active` TinyInt( 1 ) NOT NULL,
	`date_joined` DateTime NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `username` UNIQUE( `username` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 2;


CREATE TABLE `auth_user_groups`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`user_id` Int( 0 ) NOT NULL,
	`group_id` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `auth_user_groups_user_id_group_id_94350c0c_uniq` UNIQUE( `user_id`, `group_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;



CREATE TABLE `auth_user_user_permissions`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`user_id` Int( 0 ) NOT NULL,
	`permission_id` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` UNIQUE( `user_id`, `permission_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;



CREATE TABLE `conversaciones`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`created_at` DateTime NOT NULL,
	`updated_at` DateTime NOT NULL,
	`created_by_id` Int( 0 ) NOT NULL,
	`destinatario_id` BigInt( 0 ) NULL DEFAULT NULL,
	`estado_id` Int( 0 ) NULL DEFAULT NULL,
	`updated_by_id` Int( 0 ) NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `conversaciones_destinatario_id_db2d6e39_uniq` UNIQUE( `destinatario_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 3;


CREATE TABLE `destinatarios`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`created_at` DateTime NOT NULL,
	`updated_at` DateTime NOT NULL,
	`created_by_id` Int( 0 ) NOT NULL,
	`updated_by_id` Int( 0 ) NULL DEFAULT NULL,
	`persona_id` BigInt( 0 ) NULL DEFAULT NULL,
	`estado_id` Int( 0 ) NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `destinatarios_persona_id_dda68fc7_uniq` UNIQUE( `persona_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 3782;


CREATE TABLE `django_admin_log`( 
	`id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`action_time` DateTime NOT NULL,
	`object_id` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`object_repr` VarChar( 200 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`action_flag` SmallInt( 0 ) UNSIGNED NOT NULL,
	`change_message` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`content_type_id` Int( 0 ) NULL DEFAULT NULL,
	`user_id` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;



CREATE TABLE `django_celery_beat_clockedschedule`( 
	`id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`clocked_time` DateTime NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;



CREATE TABLE `django_celery_beat_crontabschedule`( 
	`id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`minute` VarChar( 240 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`hour` VarChar( 96 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`day_of_week` VarChar( 64 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`day_of_month` VarChar( 124 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`month_of_year` VarChar( 64 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`timezone` VarChar( 63 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;



CREATE TABLE `django_celery_beat_intervalschedule`( 
	`id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`every` Int( 0 ) NOT NULL,
	`period` VarChar( 24 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;



CREATE TABLE `django_celery_beat_periodictask`( 
	`id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 200 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`task` VarChar( 200 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`args` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`kwargs` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`queue` VarChar( 200 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`exchange` VarChar( 200 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`routing_key` VarChar( 200 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`expires` DateTime NULL DEFAULT NULL,
	`enabled` TinyInt( 1 ) NOT NULL,
	`last_run_at` DateTime NULL DEFAULT NULL,
	`total_run_count` Int( 0 ) UNSIGNED NOT NULL,
	`date_changed` DateTime NOT NULL,
	`description` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`crontab_id` Int( 0 ) NULL DEFAULT NULL,
	`interval_id` Int( 0 ) NULL DEFAULT NULL,
	`solar_id` Int( 0 ) NULL DEFAULT NULL,
	`one_off` TinyInt( 1 ) NOT NULL,
	`start_time` DateTime NULL DEFAULT NULL,
	`priority` Int( 0 ) UNSIGNED NULL DEFAULT NULL,
	`headers` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL ,
	`clocked_id` Int( 0 ) NULL DEFAULT NULL,
	`expire_seconds` Int( 0 ) UNSIGNED NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `name` UNIQUE( `name` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;



CREATE TABLE `django_celery_beat_periodictasks`( 
	`ident` SmallInt( 0 ) NOT NULL,
	`last_update` DateTime NOT NULL,
	PRIMARY KEY ( `ident` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;


CREATE TABLE `django_celery_beat_solarschedule`( 
	`id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`event` VarChar( 24 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`latitude` Decimal( 9, 6 ) NOT NULL,
	`longitude` Decimal( 9, 6 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq` UNIQUE( `event`, `latitude`, `longitude` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;



CREATE TABLE `django_content_type`( 
	`id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`app_label` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`model` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `django_content_type_app_label_model_76bd3d3b_uniq` UNIQUE( `app_label`, `model` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 21;


CREATE TABLE `django_migrations`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`app` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`applied` DateTime NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 67;



CREATE TABLE `django_session`( 
	`session_key` VarChar( 40 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`session_data` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`expire_date` DateTime NOT NULL,
	PRIMARY KEY ( `session_key` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;



CREATE TABLE `maestras`( 
	`id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`codigo` VarChar( 200 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`nombre` VarChar( 200 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`jerarquia` Int( 0 ) NULL DEFAULT NULL,
	`orden` Int( 0 ) NULL DEFAULT NULL,
	`visible` Int( 0 ) NULL DEFAULT NULL,
	`observacion` VarChar( 200 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`created_at` DateTime NOT NULL,
	`updated_at` DateTime NULL DEFAULT NULL,
	`deleted_at` DateTime NULL DEFAULT NULL,
	`deleted_by` BigInt( 0 ) NULL DEFAULT NULL,
	`created_by_id` Int( 0 ) NOT NULL,
	`padre_id` Int( 0 ) NULL DEFAULT NULL,
	`updated_by_id` Int( 0 ) NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 759;



CREATE TABLE `mensajeria`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`mensaje_id` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`recipiente_id` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`conversacion_id` BigInt( 0 ) NULL DEFAULT NULL,
	`origin` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`timestamp_w` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`celular` VarChar( 12 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`created_at` DateTime NOT NULL,
	`updated_at` DateTime NOT NULL,
	`created_by_id` Int( 0 ) NULL DEFAULT NULL,
	`estado_id` Int( 0 ) NULL DEFAULT NULL,
	`updated_by_id` Int( 0 ) NULL DEFAULT NULL,
	`destinatario_id` BigInt( 0 ) NULL DEFAULT NULL,
	`texto` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`tipo_id` Int( 0 ) NULL DEFAULT NULL,
	`sha256` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`multimedia_id` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`mime_type` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`link` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`filename` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`voice` VarChar( 12 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`context_from` VarChar( 25 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`context_id` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 273;



CREATE TABLE `modulos`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 191 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`path` VarChar( 191 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`icon` VarChar( 191 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`order` Int( 0 ) NULL DEFAULT NULL,
	`created_at` DateTime NULL DEFAULT NULL,
	`updated_at` DateTime NULL DEFAULT NULL,
	`deleted_at` DateTime NULL DEFAULT NULL,
	`deleted_by` BigInt( 0 ) NULL DEFAULT NULL,
	`created_by_id` Int( 0 ) NOT NULL,
	`dad_id` BigInt( 0 ) NULL DEFAULT NULL,
	`estado_id` Int( 0 ) NULL DEFAULT NULL,
	`updated_by_id` Int( 0 ) NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;



CREATE TABLE `personas`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`identificacion` VarChar( 50 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`lugarexpedicion` VarChar( 50 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`fechaexpedicion` Date NULL DEFAULT NULL,
	`direccion` VarChar( 150 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`telefono` VarChar( 50 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`telefonomovil` VarChar( 10 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`telefonowhatsapp` VarChar( 50 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`email` VarChar( 50 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`sendemail` TinyInt( 1 ) NULL DEFAULT NULL,
	`fechanacimiento` Date NULL DEFAULT NULL,
	`nombre` VarChar( 50 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`segundonombre` VarChar( 50 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`apellido` VarChar( 50 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`segundoapellido` VarChar( 50 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`foto` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`barrio` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`observaciones` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`created_at` DateTime NULL DEFAULT NULL,
	`updated_at` DateTime NULL DEFAULT NULL,
	`deleted_at` DateTime NULL DEFAULT NULL,
	`deleted_by` BigInt( 0 ) NULL DEFAULT NULL,
	`ciudad_id` Int( 0 ) NULL DEFAULT NULL,
	`created_by_id` Int( 0 ) NOT NULL,
	`departamento_id` Int( 0 ) NULL DEFAULT NULL,
	`ocupacion_id` Int( 0 ) NULL DEFAULT NULL,
	`pais_id` Int( 0 ) NULL DEFAULT NULL,
	`sexo_id` Int( 0 ) NULL DEFAULT NULL,
	`tipoidentificacion_id` Int( 0 ) NULL DEFAULT NULL,
	`updated_by_id` Int( 0 ) NULL DEFAULT NULL,
	`zona_id` Int( 0 ) NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `personas_telefonomovil_d10349bb_uniq` UNIQUE( `telefonomovil` ),
	CONSTRAINT `personas_telefonowhatsapp_8bb213d6_uniq` UNIQUE( `telefonowhatsapp` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 2939;



CREATE TABLE `peticion`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`estado` VarChar( 1091 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 331;


BEGIN;

INSERT INTO `archivos`(`id`,`nombre`,`descripcion`,`tipo`,`formato`,`dir`,`created_at`,`updated_at`,`created_by_id`,`updated_by_id`) VALUES 
( '21', '', 'Hola', '', '.png', 'https://masivo.s3.amazonaws.com/hola.png?AWSAccessKeyId=AKIASBXVIQXOFSOJZYPV&Signature=q5Upswjdho0aCi1O3YTNRdUBvos%3D&Expires=1689785245', '2023-07-19 15:47:25.696325', '2023-07-19 15:47:25.696325', '1', NULL ),
( '22', '', '', '', '.jpg', 'archivos/20230807_192937.jpg', '2023-08-08 00:29:37.935406', '2023-08-08 00:29:37.935406', '1', NULL ),
( '23', '', '', '', '.jpg', 'temp/20230807_194610.jpg', '2023-08-08 00:46:10.818937', '2023-08-08 00:46:10.818937', '1', NULL ),
( '24', '', '', '', '.jpg', 'temp/20230807_194646.jpg', '2023-08-08 00:46:46.408444', '2023-08-08 00:46:46.408444', '1', NULL ),
( '25', '', '', '', '.jpg', 'temp/20230807_194903.jpg', '2023-08-08 00:49:03.619850', '2023-08-08 00:49:03.619850', '1', NULL ),
( '26', '', '', '', '.jpg', 'temp/20230807_194931.jpg', '2023-08-08 00:49:31.817929', '2023-08-08 00:49:31.817929', '1', NULL ),
( '27', '', '', '', '.jpg', 'temp/20230807_195955.jpg', '2023-08-08 00:59:55.304947', '2023-08-08 00:59:55.304947', '1', NULL ),
( '28', '', '', '', '.jpg', 'temp/20230807_200046.jpg', '2023-08-08 01:00:46.905867', '2023-08-08 01:00:46.905867', '1', NULL ),
( '29', '', '', '', '.jpg', 'temp/20230807_200131.jpg', '2023-08-08 01:01:31.780873', '2023-08-08 01:01:31.780873', '1', NULL ),
( '30', '', '', '', '.jpg', 'temp/20230807_200609.jpg', '2023-08-08 01:06:09.829708', '2023-08-08 01:06:09.829708', '1', NULL ),
( '31', '', '', '', '.jpg', 'temp/20230807_200635.jpg', '2023-08-08 01:06:35.072419', '2023-08-08 01:06:35.072419', '1', NULL ),
( '32', '', '', '', '.jpg', 'temp/20230807_201220.jpg', '2023-08-08 01:12:20.156437', '2023-08-08 01:12:20.156437', '1', NULL ),
( '33', '', '', '', '.jpg', 'temp/20230807_201930.jpg', '2023-08-08 01:19:30.699769', '2023-08-08 01:19:30.699769', '1', NULL );
COMMIT;
-- ----------------------


-- Dump data of "auth_group" -------------------------------
-- ----------------------


-- Dump data of "auth_group_permissions" -------------------
-- ----------------------


-- Dump data of "auth_permission" --------------------------
BEGIN;

INSERT INTO `auth_permission`(`id`,`name`,`content_type_id`,`codename`) VALUES 
( '1', 'Can add log entry', '1', 'add_logentry' ),
( '2', 'Can change log entry', '1', 'change_logentry' ),
( '3', 'Can delete log entry', '1', 'delete_logentry' ),
( '4', 'Can view log entry', '1', 'view_logentry' ),
( '5', 'Can add permission', '2', 'add_permission' ),
( '6', 'Can change permission', '2', 'change_permission' ),
( '7', 'Can delete permission', '2', 'delete_permission' ),
( '8', 'Can view permission', '2', 'view_permission' ),
( '9', 'Can add group', '3', 'add_group' ),
( '10', 'Can change group', '3', 'change_group' ),
( '11', 'Can delete group', '3', 'delete_group' ),
( '12', 'Can view group', '3', 'view_group' ),
( '13', 'Can add user', '4', 'add_user' ),
( '14', 'Can change user', '4', 'change_user' ),
( '15', 'Can delete user', '4', 'delete_user' ),
( '16', 'Can view user', '4', 'view_user' ),
( '17', 'Can add content type', '5', 'add_contenttype' ),
( '18', 'Can change content type', '5', 'change_contenttype' ),
( '19', 'Can delete content type', '5', 'delete_contenttype' ),
( '20', 'Can view content type', '5', 'view_contenttype' ),
( '21', 'Can add session', '6', 'add_session' ),
( '22', 'Can change session', '6', 'change_session' ),
( '23', 'Can delete session', '6', 'delete_session' ),
( '24', 'Can view session', '6', 'view_session' ),
( '25', 'Can add destinatarios', '7', 'add_destinatarios' ),
( '26', 'Can change destinatarios', '7', 'change_destinatarios' ),
( '27', 'Can delete destinatarios', '7', 'delete_destinatarios' ),
( '28', 'Can view destinatarios', '7', 'view_destinatarios' ),
( '29', 'Can add archivos', '8', 'add_archivos' ),
( '30', 'Can change archivos', '8', 'change_archivos' ),
( '31', 'Can delete archivos', '8', 'delete_archivos' ),
( '32', 'Can view archivos', '8', 'view_archivos' ),
( '33', 'Can add maestra', '9', 'add_maestras' ),
( '34', 'Can change maestra', '9', 'change_maestras' ),
( '35', 'Can delete maestra', '9', 'delete_maestras' ),
( '36', 'Can view maestra', '9', 'view_maestras' ),
( '37', 'Can add persona', '10', 'add_personas' ),
( '38', 'Can change persona', '10', 'change_personas' ),
( '39', 'Can delete persona', '10', 'delete_personas' ),
( '40', 'Can view persona', '10', 'view_personas' ),
( '41', 'Can add modulos', '11', 'add_modulos' ),
( '42', 'Can change modulos', '11', 'change_modulos' ),
( '43', 'Can delete modulos', '11', 'delete_modulos' ),
( '44', 'Can view modulos', '11', 'view_modulos' ),
( '45', 'Can add mensajeria', '12', 'add_mensajeria' ),
( '46', 'Can change mensajeria', '12', 'change_mensajeria' ),
( '47', 'Can delete mensajeria', '12', 'delete_mensajeria' ),
( '48', 'Can view mensajeria', '12', 'view_mensajeria' ),
( '49', 'Can add chat group', '13', 'add_chatgroup' ),
( '50', 'Can change chat group', '13', 'change_chatgroup' ),
( '51', 'Can delete chat group', '13', 'delete_chatgroup' ),
( '52', 'Can view chat group', '13', 'view_chatgroup' ),
( '53', 'Can add peticion', '14', 'add_peticion' ),
( '54', 'Can change peticion', '14', 'change_peticion' ),
( '55', 'Can delete peticion', '14', 'delete_peticion' ),
( '56', 'Can view peticion', '14', 'view_peticion' ),
( '57', 'Can add crontab', '15', 'add_crontabschedule' ),
( '58', 'Can change crontab', '15', 'change_crontabschedule' ),
( '59', 'Can delete crontab', '15', 'delete_crontabschedule' ),
( '60', 'Can view crontab', '15', 'view_crontabschedule' ),
( '61', 'Can add interval', '16', 'add_intervalschedule' ),
( '62', 'Can change interval', '16', 'change_intervalschedule' ),
( '63', 'Can delete interval', '16', 'delete_intervalschedule' ),
( '64', 'Can view interval', '16', 'view_intervalschedule' ),
( '65', 'Can add periodic task', '17', 'add_periodictask' ),
( '66', 'Can change periodic task', '17', 'change_periodictask' ),
( '67', 'Can delete periodic task', '17', 'delete_periodictask' ),
( '68', 'Can view periodic task', '17', 'view_periodictask' ),
( '69', 'Can add periodic tasks', '18', 'add_periodictasks' ),
( '70', 'Can change periodic tasks', '18', 'change_periodictasks' ),
( '71', 'Can delete periodic tasks', '18', 'delete_periodictasks' ),
( '72', 'Can view periodic tasks', '18', 'view_periodictasks' ),
( '73', 'Can add solar event', '19', 'add_solarschedule' ),
( '74', 'Can change solar event', '19', 'change_solarschedule' ),
( '75', 'Can delete solar event', '19', 'delete_solarschedule' ),
( '76', 'Can view solar event', '19', 'view_solarschedule' ),
( '77', 'Can add clocked', '20', 'add_clockedschedule' ),
( '78', 'Can change clocked', '20', 'change_clockedschedule' ),
( '79', 'Can delete clocked', '20', 'delete_clockedschedule' ),
( '80', 'Can view clocked', '20', 'view_clockedschedule' ),
( '81', 'Can add conversaciones', '21', 'add_conversaciones' ),
( '82', 'Can change conversaciones', '21', 'change_conversaciones' ),
( '83', 'Can delete conversaciones', '21', 'delete_conversaciones' ),
( '84', 'Can view conversaciones', '21', 'view_conversaciones' );
COMMIT;
-- ----------------------


-- Dump data of "auth_user" --------------------------------
BEGIN;

INSERT INTO `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) VALUES 
( '1', 'pbkdf2_sha256$600000$YSt3G4t8LO9eDvUmqNVP3Y$R6j+6JxH0+8xJNMlDrjSknbrvtpn1GbTjtR1gD6rVeU=', '2023-08-05 18:11:17.730918', '0', 'admin@gmail.com', '', '', '', '0', '1', '2023-07-14 13:31:38.881831' );


COMMIT;

-- ----------------------


-- Dump data of "auth_user_groups" -------------------------
-- ----------------------


-- Dump data of "auth_user_user_permissions" ---------------
-- ----------------------


-- Dump data of "conversaciones" ---------------------------
BEGIN;

INSERT INTO `conversaciones`(`id`,`created_at`,`updated_at`,`created_by_id`,`destinatario_id`,`estado_id`,`updated_by_id`) VALUES 
( '2', '2023-08-05 19:15:26.843541', '2023-08-09 02:08:23.254499', '1', '3780', '758', NULL );
COMMIT;
-- ----------------------


-- Dump data of "destinatarios" ----------------------------
BEGIN;

INSERT INTO `destinatarios`(`id`,`created_at`,`updated_at`,`created_by_id`,`updated_by_id`,`persona_id`,`estado_id`) VALUES 
( '3780', '2023-07-18 00:06:27.321321', '2023-07-18 00:06:27.322911', '1', NULL, '2937', '596' ),
( '3781', '2023-07-19 16:03:04.568250', '2023-07-19 16:03:04.568250', '1', NULL, '2938', '596' );
COMMIT;
-- ----------------------


-- Dump data of "django_admin_log" -------------------------
-- ----------------------


-- Dump data of "django_celery_beat_clockedschedule" -------
-- ----------------------


-- Dump data of "django_celery_beat_crontabschedule" -------
-- ----------------------


-- Dump data of "django_celery_beat_intervalschedule" ------
-- ----------------------


-- Dump data of "django_celery_beat_periodictask" ----------
-- ----------------------


-- Dump data of "django_celery_beat_periodictasks" ---------
-- ----------------------


-- Dump data of "django_celery_beat_solarschedule" ---------
-- ----------------------


-- Dump data of "django_content_type" ----------------------
BEGIN;

INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES 
( '1', 'admin', 'logentry' ),
( '3', 'auth', 'group' ),
( '2', 'auth', 'permission' ),
( '4', 'auth', 'user' ),
( '5', 'contenttypes', 'contenttype' ),
( '20', 'django_celery_beat', 'clockedschedule' ),
( '15', 'django_celery_beat', 'crontabschedule' ),
( '16', 'django_celery_beat', 'intervalschedule' ),
( '17', 'django_celery_beat', 'periodictask' ),
( '18', 'django_celery_beat', 'periodictasks' ),
( '19', 'django_celery_beat', 'solarschedule' ),
( '8', 'mensajeria', 'archivos' ),
( '13', 'mensajeria', 'chatgroup' ),
( '21', 'mensajeria', 'conversaciones' ),
( '7', 'mensajeria', 'destinatarios' ),
( '9', 'mensajeria', 'maestras' ),
( '12', 'mensajeria', 'mensajeria' ),
( '11', 'mensajeria', 'modulos' ),
( '10', 'mensajeria', 'personas' ),
( '14', 'mensajeria', 'peticion' ),
( '6', 'sessions', 'session' );
COMMIT;
-- ----------------------


-- Dump data of "django_migrations" ------------------------
BEGIN;

INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES 
( '1', 'contenttypes', '0001_initial', '2023-07-14 13:30:39.717634' ),
( '2', 'auth', '0001_initial', '2023-07-14 13:30:40.066747' ),
( '3', 'admin', '0001_initial', '2023-07-14 13:30:40.169068' ),
( '4', 'admin', '0002_logentry_remove_auto_add', '2023-07-14 13:30:40.177387' ),
( '5', 'admin', '0003_logentry_add_action_flag_choices', '2023-07-14 13:30:40.187016' ),
( '6', 'contenttypes', '0002_remove_content_type_name', '2023-07-14 13:30:40.270904' ),
( '7', 'auth', '0002_alter_permission_name_max_length', '2023-07-14 13:30:40.321173' ),
( '8', 'auth', '0003_alter_user_email_max_length', '2023-07-14 13:30:40.355243' ),
( '9', 'auth', '0004_alter_user_username_opts', '2023-07-14 13:30:40.365902' ),
( '10', 'auth', '0005_alter_user_last_login_null', '2023-07-14 13:30:40.420336' ),
( '11', 'auth', '0006_require_contenttypes_0002', '2023-07-14 13:30:40.444703' ),
( '12', 'auth', '0007_alter_validators_add_error_messages', '2023-07-14 13:30:40.455232' ),
( '13', 'auth', '0008_alter_user_username_max_length', '2023-07-14 13:30:40.596423' ),
( '14', 'auth', '0009_alter_user_last_name_max_length', '2023-07-14 13:30:41.132522' ),
( '15', 'auth', '0010_alter_group_name_max_length', '2023-07-14 13:30:41.278543' ),
( '16', 'auth', '0011_update_proxy_permissions', '2023-07-14 13:30:41.320738' ),
( '17', 'auth', '0012_alter_user_first_name_max_length', '2023-07-14 13:30:41.872811' ),
( '18', 'mensajeria', '0001_initial', '2023-07-14 13:30:42.047643' ),
( '19', 'sessions', '0001_initial', '2023-07-14 13:30:42.083793' ),
( '20', 'mensajeria', '0002_maestras_remove_destinatarios_celular_and_more', '2023-07-16 02:11:53.678344' ),
( '21', 'mensajeria', '0003_alter_personas_identificacion_alter_personas_sexo_and_more', '2023-07-16 02:14:18.518924' ),
( '22', 'mensajeria', '0004_destinatarios_estado', '2023-07-16 04:07:32.857784' ),
( '23', 'mensajeria', '0005_chatgroup', '2023-07-16 14:29:55.378402' ),
( '24', 'mensajeria', '0006_delete_chatgroup', '2023-07-16 14:32:30.182634' ),
( '25', 'mensajeria', '0007_alter_mensajeria_celular_and_more', '2023-07-17 01:11:01.125272' ),
( '26', 'mensajeria', '0008_mensajeria_destinatarios_id', '2023-07-17 01:13:53.530396' ),
( '27', 'mensajeria', '0009_rename_destinatarios_id_mensajeria_destinatario', '2023-07-17 01:14:36.892389' ),
( '28', 'mensajeria', '0010_peticion', '2023-07-17 01:45:31.094574' ),
( '29', 'mensajeria', '0011_alter_peticion_estado', '2023-07-17 03:10:54.899771' ),
( '30', 'mensajeria', '0012_mensajeria_texto', '2023-07-17 03:19:44.152872' ),
( '31', 'mensajeria', '0013_mensajeria_tipo', '2023-07-17 22:16:35.457781' ),
( '32', 'mensajeria', '0014_mensajeria_multimedia', '2023-07-17 22:22:54.917223' ),
( '33', 'mensajeria', '0015_rename_multimedia_mensajeria_sha256_and_more', '2023-07-17 22:38:53.764413' ),
( '34', 'mensajeria', '0016_mensajeria_mime_type_alter_mensajeria_multimedia_id_and_more', '2023-07-17 22:46:01.458674' ),
( '35', 'django_celery_beat', '0001_initial', '2023-07-19 15:39:43.898719' ),
( '36', 'django_celery_beat', '0002_auto_20161118_0346', '2023-07-19 15:39:44.050984' ),
( '37', 'django_celery_beat', '0003_auto_20161209_0049', '2023-07-19 15:39:44.127136' ),
( '38', 'django_celery_beat', '0004_auto_20170221_0000', '2023-07-19 15:39:44.133029' ),
( '39', 'django_celery_beat', '0005_add_solarschedule_events_choices', '2023-07-19 15:39:44.142844' ),
( '40', 'django_celery_beat', '0006_auto_20180322_0932', '2023-07-19 15:39:44.265083' ),
( '41', 'django_celery_beat', '0007_auto_20180521_0826', '2023-07-19 15:39:44.397321' ),
( '42', 'django_celery_beat', '0008_auto_20180914_1922', '2023-07-19 15:39:44.431672' ),
( '43', 'django_celery_beat', '0006_auto_20180210_1226', '2023-07-19 15:39:44.467843' ),
( '44', 'django_celery_beat', '0006_periodictask_priority', '2023-07-19 15:39:44.568345' ),
( '45', 'django_celery_beat', '0009_periodictask_headers', '2023-07-19 15:39:44.672162' ),
( '46', 'django_celery_beat', '0010_auto_20190429_0326', '2023-07-19 15:39:44.776961' ),
( '47', 'django_celery_beat', '0011_auto_20190508_0153', '2023-07-19 15:39:44.912716' ),
( '48', 'django_celery_beat', '0012_periodictask_expire_seconds', '2023-07-19 15:39:45.019107' ),
( '49', 'django_celery_beat', '0013_auto_20200609_0727', '2023-07-19 15:39:45.028725' ),
( '50', 'django_celery_beat', '0014_remove_clockedschedule_enabled', '2023-07-19 15:39:45.065016' ),
( '51', 'django_celery_beat', '0015_edit_solarschedule_events_choices', '2023-07-19 15:39:45.074557' ),
( '52', 'django_celery_beat', '0016_alter_crontabschedule_timezone', '2023-07-19 15:39:45.089109' ),
( '53', 'django_celery_beat', '0017_alter_crontabschedule_month_of_year', '2023-07-19 15:39:45.101603' ),
( '54', 'django_celery_beat', '0018_improve_crontab_helptext', '2023-07-19 15:39:45.110126' ),
( '55', 'mensajeria', '0017_rename_timestamp_mensajeria_timestamp_w', '2023-07-19 20:58:54.299165' ),
( '56', 'mensajeria', '0018_mensajeria_link', '2023-07-22 18:05:51.227529' ),
( '57', 'mensajeria', '0019_mensajeria_filename', '2023-07-29 20:42:47.649606' ),
( '58', 'mensajeria', '0020_mensajeria_voice', '2023-07-29 22:51:55.947438' ),
( '59', 'mensajeria', '0021_alter_mensajeria_voice', '2023-07-29 22:53:43.371555' ),
( '60', 'mensajeria', '0022_mensajeria_context_from_mensajeria_context_id', '2023-07-30 15:19:31.580852' ),
( '61', 'mensajeria', '0023_conversaciones', '2023-08-05 18:09:47.660524' ),
( '62', 'mensajeria', '0024_alter_mensajeria_conversacion_id', '2023-08-05 18:23:18.384678' ),
( '63', 'mensajeria', '0025_rename_conversacion_id_mensajeria_conversacion', '2023-08-05 18:38:56.376977' ),
( '64', 'mensajeria', '0026_alter_destinatarios_persona', '2023-08-05 18:43:41.026686' ),
( '65', 'mensajeria', '0027_alter_conversaciones_destinatario', '2023-08-05 18:44:00.477311' ),
( '66', 'mensajeria', '0028_alter_personas_telefonomovil_and_more', '2023-08-05 19:08:24.002473' );
COMMIT;
-- ----------------------


-- Dump data of "django_session" ---------------------------
BEGIN;

INSERT INTO `django_session`(`session_key`,`session_data`,`expire_date`) VALUES 
( 'd2cpnya08au5hvn1e71paahed6ie0rhm', '.eJxVjDkOwjAUBe_iGlnenVDScwbLfzEOIEeKkwpxd4iUAto3M-8lUt7WmrbOS5pInIUWp98NMj647YDuud1miXNblwnkrsiDdnmdiZ-Xw_07qLnXbz2yN8WAhxzI8qBLQRcBvGIb9cCaOCqMENgFO1pUCA4LU1FgvArBiPcHAoc4iw:1qMrZf:4Mdum-KyBOnXleZSVl9ltu874KpIOJvcy9T2Tb9cPiY', '2023-08-04 14:57:43.713320' ),
( 'fqa3x308fczyzsl9nvln946fdxddch9v', '.eJxVjDkOwjAUBe_iGlnenVDScwbLfzEOIEeKkwpxd4iUAto3M-8lUt7WmrbOS5pInIUWp98NMj647YDuud1miXNblwnkrsiDdnmdiZ-Xw_07qLnXbz2yN8WAhxzI8qBLQRcBvGIb9cCaOCqMENgFO1pUCA4LU1FgvArBiPcHAoc4iw:1qSLkD:_0r3nZbYhYPHQ7QwASq6PylRdx7xkFf51JgJhlqJoYs', '2023-08-19 18:11:17.763055' ),
( 'rj2kcpd6fcsgpol15vebuvjh7omm25tj', '.eJxVjDkOwjAUBe_iGlnenVDScwbLfzEOIEeKkwpxd4iUAto3M-8lUt7WmrbOS5pInIUWp98NMj647YDuud1miXNblwnkrsiDdnmdiZ-Xw_07qLnXbz2yN8WAhxzI8qBLQRcBvGIb9cCaOCqMENgFO1pUCA4LU1FgvArBiPcHAoc4iw:1qMqvZ:QVkU4F05ZImercs6nb8_uJ8H1R6ueFdVItLh5TfGF9w', '2023-08-04 14:16:17.406616' );
COMMIT;
-- ----------------------


-- Dump data of "maestras" ---------------------------------
BEGIN;

INSERT INTO `maestras`(`id`,`codigo`,`nombre`,`jerarquia`,`orden`,`visible`,`observacion`,`created_at`,`updated_at`,`deleted_at`,`deleted_by`,`created_by_id`,`padre_id`,`updated_by_id`) VALUES 
( '1', 'LIS_TIPOTABLAS', 'TIPOS DE TABLAS', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '2', 'LIS_MODULOS', 'MODULOS', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '3', 'LIS_ROLES', 'ROLES', '2', NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '4', 'LIS_VISTAS', 'VISTAS', '3', NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '5', 'LIS_PERFILES', 'PERFILES', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '6', NULL, 'SEGURIDAD', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '2', NULL ),
( '7', NULL, 'ADMINISTRADOR', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '5', NULL ),
( '8', 'LIS_TIPOSIDENTIFICACIONES', 'TIPOS DE IDENTIFICACIONES', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '9', 'TI', 'TARJETA DE IDENTIDAD', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '8', NULL ),
( '10', 'CC', 'CEDULA DE CIUDADANIA', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '8', NULL ),
( '11', 'NI', 'NIT', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '8', NULL ),
( '12', 'MS', 'MENOR SIN IDENTIFICACION', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '8', NULL ),
( '13', 'AS', 'ADULTO SIN IDENTIFICACION', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '8', NULL ),
( '14', 'CE', 'CEDULA DE EXTRANJERIA', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '8', NULL ),
( '15', 'RC', 'REGISTRO CIVIL', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '8', NULL ),
( '16', 'LIS_TIPOSCONTRATOS', 'TIPOS CONTRATOS', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '17', '1', 'CAPITADO', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '16', NULL ),
( '18', '2', 'POR EVENTO', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '16', NULL ),
( '19', '3', 'POR CASO', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '16', NULL ),
( '20', 'LIS_SEXOS', 'SEXOS', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '21', 'M', 'MASCULINO', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '20', NULL ),
( '22', 'F', 'FEMENINO', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '20', NULL ),
( '23', 'ND', 'NO DEFINIDO', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '20', NULL ),
( '24', 'LIS_ESTADOSCIVILES', 'ESTADOS CIVILES', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '25', NULL, 'SOLTERO', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '24', NULL ),
( '26', NULL, 'CASADO', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '24', NULL ),
( '27', NULL, 'UNION LIBRE', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '24', NULL ),
( '28', NULL, 'DIVORCIADO', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '24', NULL ),
( '29', NULL, 'VIUDO', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '24', NULL ),
( '30', 'LIS_CARGOS', 'CARGOS', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '31', NULL, 'GERENTE', NULL, NULL, NULL, NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '30', NULL ),
( '32', NULL, 'VENDEDOR', NULL, NULL, NULL, NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '30', NULL ),
( '33', NULL, 'INVENTARIO', NULL, NULL, NULL, NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '30', NULL ),
( '34', NULL, 'CLIENTE', NULL, NULL, NULL, NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '30', NULL ),
( '35', NULL, 'AUXILIAR', NULL, NULL, NULL, NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '30', NULL ),
( '36', NULL, 'OTRO', NULL, NULL, NULL, NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '30', NULL ),
( '37', 'LIS_TIPOSANGRE', 'TIPOS DE SANGRE', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '38', NULL, 'A', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '37', NULL ),
( '39', NULL, 'B', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '37', NULL ),
( '40', NULL, 'O', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '37', NULL ),
( '41', NULL, 'AB', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '37', NULL ),
( '42', 'LIS_RH', 'RH', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '43', 'POSITIVO', '+', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '42', NULL ),
( '44', 'NEGATIVO', '-', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '42', NULL ),
( '45', 'LIS_NIVELESEDUCATIVOS', 'NIVELES EDUCATIVOS', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '46', NULL, 'PRIMARIA', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '45', NULL ),
( '47', NULL, 'SECUNDARIA', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '45', NULL ),
( '48', NULL, 'MEDIA TECNICA', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '45', NULL ),
( '49', NULL, 'TECNICO', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '45', NULL ),
( '50', NULL, 'UNIVERSITARIO', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '45', NULL ),
( '51', NULL, 'OTRO', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '45', NULL ),
( '52', NULL, 'NO DEFINIDO (NINGUNO)', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '45', NULL ),
( '53', 'LIS_ETNIAS', 'ETNIAS', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '54', NULL, 'INDIGENA', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '53', NULL ),
( '55', NULL, 'ROM (GITANO)', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '53', NULL ),
( '56', NULL, 'RAIZAL (ARCHIPIELAGO DE SAN ANDRES Y PROVIDENCIA)', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '53', NULL ),
( '57', NULL, 'NINGUNO DE LOS ANTERIORES', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '53', NULL ),
( '58', 'LIS_RELIGIONES', 'RELIGIONES', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '59', NULL, 'CATOLICA', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '59', NULL ),
( '60', NULL, 'EVANGELICA', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '59', NULL ),
( '61', NULL, 'PROTESTANTE', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '59', NULL ),
( '62', NULL, 'NO SE TIENE INFORMACION', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '59', NULL ),
( '63', 'LIS_GRUPOSPOBLACIONALES', 'GRUPOS POBLACIONALES', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '64', NULL, 'HABITANTE DE LA CALLE', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '64', NULL ),
( '65', NULL, 'POBLACION INFANTIL A CARGO DEL ICBF', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '64', NULL ),
( '66', NULL, 'MADRES COMUNITARIAS', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '64', NULL ),
( '67', NULL, 'CREADOR O GESTOR CULTURAL', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '64', NULL ),
( '68', NULL, 'POBLACION SISBENIZADA', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '64', NULL ),
( '69', NULL, 'MENORES DESVINCULADOS DEL CONFICTO ARMADO', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '64', NULL ),
( '70', NULL, 'POBLACION DISCAPACITADA', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '64', NULL ),
( '71', NULL, 'POBLACION DESMOVILIZADA', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '64', NULL ),
( '72', NULL, 'POBLACION EN CONDICION DE DESPLAZAMIENTO FORZADO', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '64', NULL ),
( '73', NULL, 'POBLACION INFANTIL VULNERABLE', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '64', NULL ),
( '74', NULL, 'PROGRAMA EN PROTECCION A TESTIGOS', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '64', NULL ),
( '75', NULL, 'POBLACION EN CENTROS PSIQUIATRICOS', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '64', NULL ),
( '76', NULL, 'POBLACION RURAL MIGRATORIA', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '64', NULL ),
( '77', NULL, 'POBLACION RECLUSA', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '64', NULL ),
( '78', NULL, 'POBLACION RURAL NO MIGRATORIA', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '64', NULL ),
( '79', NULL, 'COMUNIDADES INDIGENAS', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '64', NULL ),
( '80', NULL, 'ROM (GITANOS)', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '64', NULL ),
( '81', NULL, 'NEGRO MULATO AFROCOLOMBIANO O AFRODESCENDIENTE', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '64', NULL ),
( '82', NULL, 'PALENQUERO DE SAN BACILIO', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '64', NULL ),
( '83', NULL, 'POBLACION CARCELARIA DEL INPEC', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '64', NULL ),
( '84', 'LIS_OCUPACONES', 'OCUPACIONES', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '85', NULL, 'NO TENGO INFORMACION', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '86', NULL, 'FUERZAS MILITARES', '2', NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '87', NULL, 'OFICIALES DE LAS FUERZAS MILITARES', '3', NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '88', NULL, 'Oficiales de las Fuerzas Militares', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '89', NULL, 'Oficiales de las Fuerzas Militares', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '90', NULL, 'SUBOFICIALES DE LAS FUERZAS MILITARES', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '91', NULL, 'Suboficiales de las Fuerzas Militares', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '92', NULL, 'Suboficiales de las Fuerzas Militares', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '93', NULL, 'OTROS MIEMBROS DE LAS FUERZAS MILITARES', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '94', NULL, 'Otros miembros de las Fuerzas Militares', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '95', NULL, 'Otros miembros de las Fuerzas Militares', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '96', NULL, 'DIRECTORES Y GERENTES', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '97', NULL, 'Directores formuladores de políticas y normas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '98', NULL, 'Directores del gobierno', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '99', NULL, 'Jefes de comunidades étnicas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '100', NULL, 'Directores y gerentes generales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '101', NULL, 'Directores y gerentes generales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '102', NULL, 'DIRECTORES ADMINISTRATIVOS Y COMERCIALES', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '103', NULL, 'Directores de administración y servicios', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '104', NULL, 'Directores financieros', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '105', NULL, 'Directores de recursos humanos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '106', NULL, 'Directores de políticas y planeación', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '107', NULL, 'Directores de ventas y comercialización', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '108', NULL, 'Directores de publicidad y relaciones públicas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '109', NULL, 'Directores de investigación y desarrollo', NULL, NULL, NULL, NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '110', NULL, 'Directores de producción de piscicultura y pesca', NULL, NULL, NULL, NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '111', NULL, 'Directores de industrias manufactureras', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '112', NULL, 'Directores de explotaciones de minería', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '113', NULL, 'Directores de empresas de construcción', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '114', NULL, 'Directores  y gerentes de servicios profesionales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '115', NULL, 'Directores de servicios de cuidados infantiles', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '116', NULL, 'Directores de servicios de salud', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '117', NULL, 'Directores  de servicios de bienestar social', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '118', NULL, 'Directores de servicios de educación', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '119', NULL, 'Gerentes de hoteles y restaurantes', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '120', NULL, 'Gerentes de hoteles', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '121', NULL, 'Gerentes de restaurantes', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '122', NULL, 'Gerentes de comercios al por mayor y al por menor', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '123', NULL, 'Gerentes de comercios al por mayor y al por menor', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '124', NULL, 'Otros gerentes de servicios', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '125', NULL, 'PROFESIONALES, CIENTÍFICOS E INTELECTUALES', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '126', NULL, 'PROFESIONALES DE LAS CIENCIAS Y DE LA INGENIERÍA', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '127', NULL, 'Físicos, químicos y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '128', NULL, 'Físicos y astrónomos ', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '129', NULL, 'Meteorólogos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '130', NULL, 'Químicos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '131', NULL, 'Geólogos y geofísicos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '132', NULL, 'Matemáticos, actuarios y estadísticos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '133', NULL, 'Matemáticos, actuarios y estadísticos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '134', NULL, 'Profesionales en ciencias biológicas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '135', NULL, 'Biólogos, botánicos, zoólogos y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '136', NULL, 'Agrónomos, silvicultores, zootecnistas y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '137', NULL, 'Profesionales de la protección medioambiental', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '138', NULL, 'Ingenieros industriales y de producción', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '139', NULL, 'Ingenieros civiles', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '140', NULL, 'Ingenieros medioambientales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '141', NULL, 'Ingenieros mecánicos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '142', NULL, 'Ingenieros químicos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '143', NULL, 'Ingenieros de minas, metalúrgicos y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '144', NULL, 'Ingenieros en electrotecnología', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '145', NULL, 'Ingenieros electricistas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '146', NULL, 'Ingenieros electrónicos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '147', NULL, 'Ingenieros de telecomunicaciones', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '148', NULL, 'Arquitectos constructores', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '149', NULL, 'Arquitectos paisajistas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '150', NULL, 'Diseñadores de productos y de prendas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '151', NULL, 'Planificadores urbanos, regionales y de tránsito', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '152', NULL, 'Cartógrafos y topógrafos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '153', NULL, 'Diseñadores gráficos y multimedia', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '154', NULL, 'PROFESIONALES DE LA SALUD', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '155', NULL, 'Médicos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '156', NULL, 'Médicos generales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '157', NULL, 'Médicos especialistas ', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '158', NULL, 'Profesionales de enfermería y de partería', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '159', NULL, 'Profesionales de enfermería', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '160', NULL, 'Profesionales de partería', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '161', NULL, 'Paramédicos e instrumentadores quirúrgicos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '162', NULL, 'Paramédicos e instrumentadores quirúrgicos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '163', NULL, 'Veterinarios', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '164', NULL, 'Veterinarios', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '165', NULL, 'Otros profesionales de la salud', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '166', NULL, 'Odontólogos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '167', NULL, 'Farmacéuticos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '168', NULL, 'Fisioterapeutas ', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '169', NULL, 'Dietistas y nutricionistas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '170', NULL, 'Fonoaudiólogos y terapeutas del lenguaje', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '171', NULL, 'Optómetras', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '172', NULL, 'PROFESIONALES DE LA EDUCACIÓN', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '173', NULL, 'Profesores de instituciones de educación superior', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '174', NULL, 'Profesores de instituciones de educación superior', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '175', NULL, 'Profesores de formación profesional', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '176', NULL, 'Profesores de formación profesional', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '177', NULL, 'Profesores de educación secundaria', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '178', NULL, 'Profesores de educación secundaria', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '179', NULL, 'Profesores de educación primaria', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '180', NULL, 'Profesores de primera infancia ', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '181', NULL, 'Otros profesionales de la educación', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '182', NULL, 'Especialistas en métodos pedagógicos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '183', NULL, 'Profesores de educación especial e inclusiva', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '184', NULL, 'Otros profesores de idiomas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '185', NULL, 'Otros profesores de música', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '186', NULL, 'Otros profesores de artes', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '187', NULL, 'Instructores de tecnología de la información', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '188', NULL, 'PROFESIONALES DE NEGOCIOS Y DE ADMINISTRACIÓN', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '189', NULL, 'Profesionales en finanzas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '190', NULL, 'Contadores', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '191', NULL, 'Asesores financieros y de inversiones', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '192', NULL, 'Analistas financieros', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '193', NULL, 'Profesionales de la administración', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '194', NULL, 'Analistas de gestión y organización', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '195', NULL, 'Profesionales en políticas de administración', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '196', NULL, 'Profesionales de gestión de talento humano', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '197', NULL, 'Profesionales de relaciones públicas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '198', NULL, 'Analistas de sistemas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '199', NULL, 'Desarrolladores de software', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '200', NULL, 'Desarrolladores web y multimedia', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '201', NULL, 'Programadores de aplicaciones', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '202', NULL, 'Diseñadores y administradores de bases de datos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '203', NULL, 'Administradores de sistemas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '204', NULL, 'Profesionales en redes de computadores', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '205', NULL, 'Profesionales en derecho', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '206', NULL, 'Abogados', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '207', NULL, 'Jueces', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '208', NULL, 'Bibliotecarios, archivistas y curadores de arte', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '209', NULL, 'Archivistas y curadores de arte', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '210', NULL, 'Bibliotecarios, documentalistas y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '211', NULL, 'Profesionales en ciencias sociales y religiosas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '212', NULL, 'Economistas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '213', NULL, 'Sociólogos, antropólogos y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '214', NULL, 'Psicólogos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '215', NULL, 'Profesionales del trabajo social y consejeros', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '216', NULL, 'Profesionales religiosos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '217', NULL, 'Autores, periodistas y lingúistas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '218', NULL, 'Autores y otros escritores', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '219', NULL, 'Periodistas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '220', NULL, 'Traductores, intérpretes y otros lingúistas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '221', NULL, 'Artistas creativos e interpretativos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '222', NULL, 'Escultores, pintores artísticos y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '223', NULL, 'Compositores, músicos y cantantes', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '224', NULL, 'Coreógrafos y bailarines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '225', NULL, 'Actores', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '226', NULL, 'TÉCNICOS Y PROFESIONALES DE NIVEL MEDIO', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '227', NULL, 'Técnicos en ciencias físicas y en ingeniería', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '228', NULL, 'Técnicos en ciencias físicas y químicas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '229', NULL, 'Técnicos en ingeniería civil', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '230', NULL, 'Electrotécnicos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '231', NULL, 'Técnicos en electrónica', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '232', NULL, 'Técnicos en ingeniería mecánica', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '233', NULL, 'Técnicos en química industrial', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '234', NULL, 'Técnicos de minas y metalurgia', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '235', NULL, 'Delineantes y dibujantes técnicos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '236', NULL, 'Supervisores de minas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '237', NULL, 'Supervisores de industrias manufactureras', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '238', NULL, 'Supervisores de la construcción', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '239', NULL, 'Técnicos en control de procesos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '240', NULL, 'Operadores de plantas de producción de energía', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '241', NULL, 'Controladores de procesos de producción de metales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '242', NULL, 'Técnicos agropecuarios', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '243', NULL, 'Técnicos forestales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '244', NULL, 'Oficiales maquinistas en navegación', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '245', NULL, 'Capitanes, oficiales de cubierta y prácticos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '246', NULL, 'Pilotos de aviación y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '247', NULL, 'Controladores de tráfico aéreo y marítimo', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '248', NULL, 'Técnicos en seguridad aeronáutica', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '249', NULL, 'Técnicos médicos y farmacéuticos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '250', NULL, 'Técnicos de laboratorios médicos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL );

INSERT INTO `maestras`(`id`,`codigo`,`nombre`,`jerarquia`,`orden`,`visible`,`observacion`,`created_at`,`updated_at`,`deleted_at`,`deleted_by`,`created_by_id`,`padre_id`,`updated_by_id`) VALUES 
( '251', NULL, 'Técnicos y asistentes farmacéuticos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '252', NULL, 'Técnicos de prótesis médicas y dentales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '253', NULL, 'Técnicos y asistentes veterinarios', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '254', NULL, 'Técnicos y asistentes veterinarios', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '255', NULL, 'Higienistas y asistentes odontologícos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '256', NULL, 'Técnicos en documentación sanitaria', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '257', NULL, 'Trabajadores comunitarios de la salud', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '258', NULL, 'Técnicos en optometría y ópticas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '259', NULL, 'Técnicos y asistentes terapeutas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '260', NULL, 'Asistentes médicos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '261', NULL, 'Técnicos en atención prehospitalaria', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '262', NULL, 'Pintores y empapeladores', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '263', NULL, 'Analistas de préstamos y créditos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '264', NULL, 'Técnicos de contabilidad y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '265', NULL, 'Tasadores y evaluadores', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '266', NULL, 'Agentes comerciales y corredores', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '267', NULL, 'Agentes de seguros', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '268', NULL, 'Representantes comerciales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '269', NULL, 'Agentes de compras', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '270', NULL, 'Agentes de servicios empresariales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '271', NULL, 'Declarantes o gestores de aduana', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '272', NULL, 'Organizadores de conferencias y eventos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '273', NULL, 'Agentes de empleo y contratistas de mano de obra', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '274', NULL, 'Agentes inmobiliarios', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '275', NULL, 'Secretarios administrativos y especializados', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '276', NULL, 'Supervisores de oficina', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '277', NULL, 'Secretarios jurídicos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '278', NULL, 'Secretarios administrativos y ejecutivos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '279', NULL, 'Secretarios médicos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '280', NULL, 'Agentes de aduanas e inspectores de fronteras', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '281', NULL, 'Agentes de administración tributaria', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '282', NULL, 'Agentes de servicios de seguridad social', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '283', NULL, 'Agentes gubernamentales de expedición de licencias', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '284', NULL, 'Inspectores de policía y detectives', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '285', NULL, 'Trabajadores y asistentes sociales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '286', NULL, 'Auxiliares laicos de las religiones', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '287', NULL, 'Entrenadores de deportes y aptitud física', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '288', NULL, 'Atletas y deportistas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '289', NULL, 'Fotógrafos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '290', NULL, 'Diseñadores y decoradores de interiores', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '291', NULL, 'Técnicos en galerías de arte, museos y bibliotecas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '292', NULL, 'Chefs', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '293', NULL, 'Técnicos en redes y sistemas de computación', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '294', NULL, 'Técnicos de la Web', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '295', NULL, 'Técnicos en telecomunicaciones y radiodifusión', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '296', NULL, 'Técnicos de radiodifusión y grabación audio visual', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '297', NULL, 'Técnicos de ingeniería de las telecomunicaciones', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '298', NULL, 'PERSONAL DE APOYO ADMINISTRATIVO', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '299', NULL, 'OFICINISTAS', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '300', NULL, 'Oficinistas generales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '301', NULL, 'Oficinistas generales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '302', NULL, 'Secretarios generales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '303', NULL, 'Secretarios generales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '304', NULL, 'Operadores de máquinas de oficina', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '305', NULL, 'Grabadores de datos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '306', NULL, 'EMPLEADOS DE TRATO DIRECTO CON EL PÃšBLICO', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '307', NULL, 'Pagadores y cobradores de ventanilla y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '308', NULL, 'Cajeros de bancos y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '309', NULL, 'Receptores de apuestas y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '310', NULL, 'Prestamistas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '311', NULL, 'Cobradores y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '312', NULL, 'Barnizadores y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '313', NULL, 'Empleados de servicios de información al cliente', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '314', NULL, 'Empleados y consultores de viajes', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '315', NULL, 'Empleados de centros de llamadas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '316', NULL, 'Telefonistas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '317', NULL, 'Recepcionistas de hoteles', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '318', NULL, 'Empleados de ventanillas de información', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '319', NULL, 'Recepcionistas generales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '320', NULL, 'Auxiliares contables y financieros', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '321', NULL, 'Auxiliares de contabilidad y cálculo de costos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '322', NULL, 'Auxiliares encargados de las nóminas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '323', NULL, 'Empleados de servicios de apoyo a la producción', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '324', NULL, 'Empleados de servicios de transporte', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '325', NULL, 'Otro personal de apoyo administrativo', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '326', NULL, 'Otro personal de apoyo administrativo', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '327', NULL, 'Empleados de bibliotecas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '328', NULL, 'Empleados de servicios de correos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '329', NULL, 'Escribientes públicos y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '330', NULL, 'Empleados de archivos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '331', NULL, 'Empleados del servicio de personal', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '332', NULL, 'TRABAJADORES DE LOS SERVICIOS PERSONALES', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '333', NULL, 'Personal al servicio directo de los pasajeros', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '334', NULL, 'Personal de servicio a pasajeros', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '335', NULL, 'Revisores y cobradores de los transportes públicos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '336', NULL, 'Guías', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '337', NULL, 'Cocineros', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '338', NULL, 'Cocineros', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '339', NULL, 'Meseros y bármanes', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '340', NULL, 'Meseros', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '341', NULL, 'Bármanes', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '342', NULL, 'Peluqueros', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '343', NULL, 'Especialistas en tratamientos de belleza y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '344', NULL, 'Mayordomos domésticos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '345', NULL, 'Conserjes y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '346', NULL, 'Otros trabajadores de servicios personales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '347', NULL, 'Astrólogos, adivinos y trabajadores afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '348', NULL, 'Acompañantes ', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '349', NULL, 'Personal de servicios funerarios y embalsamadores', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '350', NULL, 'Cuidadores de animales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '351', NULL, 'Instructores de conducción', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '352', NULL, 'VENDEDORES', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '353', NULL, 'Vendedores callejeros y de puestos de mercado ', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '354', NULL, 'Vendedores en quioscos y puestos de mercado', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '355', NULL, 'Comerciantes de tiendas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '356', NULL, 'Supervisores de tiendas y almacenes', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '357', NULL, 'Otros vendedores', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '358', NULL, 'Modelos de moda, arte y publicidad', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '359', NULL, 'Demostradores de tiendas, almacenes y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '360', NULL, 'Vendedores puerta a puerta ', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '361', NULL, 'Vendedores a través de medios tecnolígicos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '362', NULL, 'Expendedores de combustibles para vehículos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '363', NULL, 'Vendedores de comidas en mostrador ', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '364', NULL, 'TRABAJADORES DE LOS CUIDADOS PERSONALES', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '365', NULL, 'Cuidadores de niños y auxiliares de maestros', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '366', NULL, 'Cuidadores de niños', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '367', NULL, 'Auxiliares de maestros', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '368', NULL, 'PERSONAL DE LOS SERVICIOS DE PROTECCIÓN', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '369', NULL, 'Personal de los servicios de protecciín', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '370', NULL, 'Bomberos y rescatistas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '371', NULL, 'Policías', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '372', NULL, 'Guardianes de prisiín', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '373', NULL, 'Guardias de seguridad', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '374', NULL, 'Trabajadores forestales calificados y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '375', NULL, 'Trabajadores forestales calificados y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '376', NULL, 'Pescadores, cazadores y tramperos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '377', NULL, 'Trabajadores de explotaciones de acuicultura', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '378', NULL, 'Pescadores de agua dulce y en aguas costeras', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '379', NULL, 'Pescadores de alta mar', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '380', NULL, 'Cazadores y tramperos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '381', NULL, 'Trabajadores agrícolas de subsistencia', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '382', NULL, 'Trabajadores agrícolas de subsistencia', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '383', NULL, 'Trabajadores pecuarios de subsistencia', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '384', NULL, 'Trabajadores pecuarios de subsistencia', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '385', NULL, 'Trabajadores agropecuarios de subsistencia', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '386', NULL, 'Trabajadores agropecuarios de subsistencia', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '387', NULL, 'Constructores de casas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '388', NULL, 'Albañiles', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '389', NULL, 'Labrantes, tronzadores y grabadores de piedra', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '390', NULL, 'Operarios en cemento armado, enfoscadores y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '391', NULL, 'Carpinteros de armar y de obra blanca', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '392', NULL, 'Techadores', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '393', NULL, 'Enchapadores, parqueteros y colocadores de suelos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '394', NULL, 'Revocadores', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '395', NULL, 'Cristaleros', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '396', NULL, 'Fontaneros e instaladores de tuberías', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '397', NULL, 'Pintores, limpiadores de fachadas y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '398', NULL, 'Limpiadores de fachadas y deshollinadores', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '399', NULL, 'OFICIALES Y OPERARIOS DE LA METALURGIA', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '400', NULL, 'Moldeadores y macheros', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '401', NULL, 'Soldadores y oxicortadores', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '402', NULL, 'Chapistas y caldereros', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '403', NULL, 'Montadores de estructuras metálicas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '404', NULL, 'Aparejadores y empalmadores de cables', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '405', NULL, 'Herreros, herramentistas y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '406', NULL, 'Herreros y forjadores', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '407', NULL, 'Herramentistas y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '408', NULL, 'Ajustadores y operadores de máquinas herramientas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '409', NULL, 'Pulidores de metales y afiladores de herramientas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '410', NULL, 'Mecánicos y reparadores de máquinas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '411', NULL, 'Mecánicos y reparadores de vehículos de motor', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '412', NULL, 'Reparadores de bicicletas y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '413', NULL, 'Fabricantes y afinadores de instrumentos musicales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '414', NULL, 'Se desagrega en 7361, 7362 y 7363 por adaptación', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '415', NULL, 'Alfareros y ceramistas (barro y arcilla)', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '416', NULL, 'Rotulistas, pintores decorativos y grabadores', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '417', NULL, 'Oficiales y operarios de las artes gráficas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '418', NULL, 'Preimpresores y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '419', NULL, 'Impresores', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '420', NULL, 'Encuadernadores y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '421', NULL, 'Tejedores', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '422', NULL, 'Tejedores con telares', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '423', NULL, 'Tejedores con agujas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '424', NULL, 'Otros tejedores', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '425', NULL, 'Cesteros, mimbreros y sombrereros artesanales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '426', NULL, 'Cesteros y mimbreros', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '427', NULL, 'Sombrereros artesanales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '428', NULL, 'Artesanos que realizan trabajos en madera', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '429', NULL, 'Tallador piezas artesanales de madera', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '430', NULL, 'Decoradores de piezas artesanales en madera', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '431', NULL, 'Joyeros, orfebres, plateros y bisuteros', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '432', NULL, 'Joyeros', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '433', NULL, 'Orfebres y plateros', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '434', NULL, 'Bisutero', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '435', NULL, 'Artesanos del cuero', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '436', NULL, 'Artesanos del cuero', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '437', NULL, 'Artesanos de papel', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '438', NULL, 'Artesanos del hierro y otros metales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '439', NULL, 'Artesanos de las semillas y cortezas vegetales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '440', NULL, 'Instaladores y reparadores de equipos eléctricos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '441', NULL, 'Electricistas de obras y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '442', NULL, 'Ajustadores electricistas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '443', NULL, 'Instaladores y reparadores de líneas eléctricas ', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '444', NULL, 'Ajustadores e instaladores en electrónica', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '445', NULL, 'Carniceros, pescaderos y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '446', NULL, 'Panaderos, pasteleros y confiteros', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '447', NULL, 'Operarios de la elaboración de productos lácteos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '448', NULL, 'Catadores y clasificadores de alimentos y bebidas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '449', NULL, 'Operarios del tratamiento de la madera', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '450', NULL, 'Oficiales y operarios de la confección y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '451', NULL, 'Sastres, modistos, peleteros y sombrereros', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '452', NULL, 'Patronistas y cortadores de tela, cuero y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '453', NULL, 'Costureros, bordadores y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '454', NULL, 'Tapiceros, colchoneros y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '455', NULL, 'Apelambradores, pellejeros y curtidores', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '456', NULL, 'Zapateros y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '457', NULL, 'Otros oficiales, operarios y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '458', NULL, 'Buzos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '459', NULL, 'Dinamiteros y pegadores', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '460', NULL, 'OPERADORES DE INSTALACIONES FIJAS Y MAQUINAS', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '461', NULL, 'Mineros y operadores de instalaciones mineras', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '462', NULL, 'Perforadores y sondistas de pozos y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '463', NULL, 'Operadores de telares y otras máquinas tejedoras', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '464', NULL, 'Operadores de máquinas de coser', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '465', NULL, 'Operadores de máquinas de lavandería', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '466', NULL, 'Operadores de máquinas de vapor y calderas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '467', NULL, 'ENSAMBLADORES ', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '468', NULL, 'Ensambladores', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '469', NULL, 'Ensambladores de maquinaria mecánica', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '470', NULL, 'Ensambladores de equipos eléctricos y electrónicos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '471', NULL, 'Maquinistas de locomotoras y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '472', NULL, 'Maquinistas de locomotoras', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '473', NULL, 'Guardafrenos, guardagujas y agentes de maniobras', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '474', NULL, 'Conductores de motocicletas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '475', NULL, 'Se desagrega en 8323 y 8324 por adaptación', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '476', NULL, 'Conductores de camionetas y vehículos livianos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '477', NULL, 'Conductores de taxis', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '478', NULL, 'Conductores de camiones pesados y buses', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '479', NULL, 'Conductores de buses, microbuses y tranvías', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '480', NULL, 'Conductores de camiones y vehículos pesados', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '481', NULL, 'Operadores de maquinaria agrícola y forestal móvil', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '482', NULL, 'Operadores de grúas, aparatos elevadores y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '483', NULL, 'Operadores de montacargas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '484', NULL, 'Marineros de cubierta y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '485', NULL, 'Marineros de cubierta y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '486', NULL, 'OCUPACIONES ELEMENTALES', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '487', NULL, 'PERSONAL DOMESTICO Y DE ASEO', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '488', NULL, 'Personal doméstico', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '489', NULL, 'Lavanderos y planchadores manuales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '490', NULL, 'Lavadores de vehículos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '491', NULL, 'Limpiadores de ventanas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '492', NULL, 'Obreros y peones de explotaciones agrícolas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '493', NULL, 'Obreros y peones de explotaciones ganaderas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '494', NULL, 'Obreros y peones de explotaciones agropecuarias', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '495', NULL, 'Obreros y peones de jardinería y horticultura', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '496', NULL, 'Obreros y peones forestales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '497', NULL, 'Obreros y peones de pesca y acuicultura', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '498', NULL, 'Obreros y peones de la minería y la construcción', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '499', NULL, 'Obreros y peones de minas y canteras', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '500', NULL, 'Obreros y peones de obras públicas y mantenimiento', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL );

INSERT INTO `maestras`(`id`,`codigo`,`nombre`,`jerarquia`,`orden`,`visible`,`observacion`,`created_at`,`updated_at`,`deleted_at`,`deleted_by`,`created_by_id`,`padre_id`,`updated_by_id`) VALUES 
( '501', NULL, 'Obreros y peones de la construcción de edificios', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '502', NULL, 'Obreros y peones de la industria manufacturera', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '503', NULL, 'Empacadores manuales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '504', NULL, 'Obreros y peones de transporte y almacenamiento', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '505', NULL, 'Obreros y peones de carga', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '506', NULL, 'Surtidores de estanterías', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '507', NULL, 'AYUDANTES DE PREPARACION DE ALIMENTOS', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '508', NULL, 'Ayudantes de preparación de alimentos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '509', NULL, 'Cocineros de comidas rápidas', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '510', NULL, 'Ayudantes de cocina', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '511', NULL, 'Trabajadores ambulantes de servicios y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '512', NULL, 'Trabajadores ambulantes de servicios y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '513', NULL, 'Recolectores de desechos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '514', NULL, 'Recolectores de basura y material reciclable', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '515', NULL, 'Clasificadores de desechos', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '516', NULL, 'Barrenderos y afines', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '517', NULL, 'Otras ocupaciones elementales', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '518', NULL, 'Mensajeros, mandaderos, maleteros y repartidores', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '519', NULL, 'Personas que realizan trabajos varios', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '520', NULL, 'Se desagrega en 9625 y 9626 por adaptación', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '521', NULL, 'Acarreadores de agua y recolectores de leña', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '522', NULL, 'Lectores de medidores', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '523', NULL, 'SIN OCUPACION (NO APLICA)', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '524', NULL, 'Ama de casa', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '84', NULL ),
( '525', 'LIS_REGIMES', 'REGIMENES', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '526', '1', 'CONTRIBUTIVO', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '525', NULL ),
( '527', '2', 'SUBSIDIADO', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '525', NULL ),
( '528', '3', 'VINCULADO', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '525', NULL ),
( '529', '4', 'PARTICULAR', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '525', NULL ),
( '530', '5', 'OTRO', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '525', NULL ),
( '531', 'LIS_TIPOSEMPRESAS', 'TIPOS EMPRESAS', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '532', NULL, 'PRIVADA', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '531', NULL ),
( '533', NULL, 'PUBLICA', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '531', NULL ),
( '534', 'LIS_TIPOSAFILIADOS', 'TIPOS AFILIADOS', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '535', NULL, 'BENEFICIARIO', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '534', NULL ),
( '536', NULL, 'COTIZANTE / AFILIADO', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '534', NULL ),
( '537', 'LIS_PARENTEZCOS', 'PARENTEZCOS', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '538', NULL, 'MADRE', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '537', NULL ),
( '539', NULL, 'PADRE', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '537', NULL ),
( '540', NULL, 'HERMANO', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '537', NULL ),
( '541', NULL, 'TIO', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '537', NULL ),
( '542', NULL, 'ABUELO', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '537', NULL ),
( '543', NULL, 'PRIMO', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '537', NULL ),
( '544', NULL, 'OTRO', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '537', NULL ),
( '545', 'LIS_RANGOSALARIALES', 'RANGOS SALARIALES', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '546', NULL, 'RANGO 1', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '544', NULL ),
( '547', NULL, 'RANGO 2', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '544', NULL ),
( '548', NULL, 'RANGO 3', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '544', NULL ),
( '549', 'LIS_ZONAS', 'ZONAS', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '550', 'U', 'URBANA', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '549', NULL ),
( '551', 'R', 'RURAL', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '549', NULL ),
( '552', 'LIS_PAISES', 'PAISES', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '553', 'CO', 'COLOMBIA', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '552', NULL ),
( '554', 'VE', 'VENEZUELA', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '552', NULL ),
( '555', 'LIS_DEPARTAMENTOS', 'DEPARTAMENTOS', '552', NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '556', 'GUA', 'LA GUAJIRA', '553', NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '555', NULL ),
( '557', 'ATL', 'ATLÁNTICO', '553', NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '555', NULL ),
( '558', 'BOL', 'BOLÍVAR', '553', NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '555', NULL ),
( '559', 'COR', 'CÓRDOBA', '553', NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '555', NULL ),
( '560', 'MAG', 'MAGDALENA', '553', NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '555', NULL ),
( '561', 'CES', 'CESAR', '553', NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '555', NULL ),
( '562', 'SUC', 'SUCRE', '553', NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '555', NULL ),
( '563', 'LIS_MUNICIPIOS', 'MUNICIPIOS', '555', NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '564', NULL, 'RIOHACHA', '553', NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '556', NULL ),
( '565', NULL, 'URUMITA', '553', NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '556', NULL ),
( '566', NULL, 'VILLANUEVA', '553', NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '556', NULL ),
( '567', NULL, 'URIBIA', '553', NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '556', NULL ),
( '568', NULL, 'SAN JUAN DEL CESAR', '553', NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '556', NULL ),
( '569', NULL, 'MAICAO', '553', NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '556', NULL ),
( '570', NULL, 'LA JAGUA DEL PILAR', '553', NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '556', NULL ),
( '571', NULL, 'HATONUEVO', '553', NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '556', NULL ),
( '572', NULL, 'DIBULLA', '553', NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '556', NULL ),
( '573', NULL, 'DISTRACCION', '553', NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '556', NULL ),
( '574', NULL, 'EL MOLINO', '553', NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '556', NULL ),
( '575', NULL, 'BARRANCAS', '553', NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '556', NULL ),
( '576', NULL, 'ALBANIA', '553', NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '556', NULL ),
( '577', NULL, 'MANAURE', '553', NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '556', NULL ),
( '578', NULL, 'MAICAO', '553', NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '556', NULL ),
( '579', NULL, 'MONTERÍA', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '556', NULL ),
( '580', NULL, 'VALLEDUPAR', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '556', NULL ),
( '581', NULL, 'FONSECA', '553', NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '556', NULL ),
( '582', 'LIS_DISCAPACIDADES', 'DISCAPACIDADES', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '583', NULL, 'SENSORIAL', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '582', NULL ),
( '584', NULL, 'PSICOSOCIAL', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '582', NULL ),
( '585', NULL, 'COGNITIVA', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '582', NULL ),
( '586', NULL, 'MOTRIZ', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '582', NULL ),
( '587', 'LIS_NIVELSISBEN', 'NIVELES SISBEN', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '588', '1', 'UNO', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '587', NULL ),
( '589', '2', 'DOS', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '587', NULL ),
( '590', '3', 'TRES', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '587', NULL ),
( '591', 'LIS_TIPOSNOTAS', 'TIPOS DE NOTAS PARA PACIENTES', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '592', NULL, 'BLOQUEADO INCUMPLIMIENTO DE CITA', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '591', NULL ),
( '593', NULL, 'BLOQUEADO DEBE CUOTA MODERADORA', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '591', NULL ),
( '594', NULL, 'HABILITADO VACUNACION', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '591', NULL ),
( '595', 'LIS_ESTADOS', 'ESTADOS', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '596', NULL, 'ACTIVO', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '595', NULL ),
( '597', NULL, 'SUSPENDIDO', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '595', NULL ),
( '598', NULL, 'RETIRADO', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '595', NULL ),
( '599', 'LIS_TIPOSFUNCIONARIOS', 'TIPOS DE FUNCIONARIO', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '600', NULL, 'PERMANENTE', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '599', NULL ),
( '601', NULL, 'TEMPORAL', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '599', NULL ),
( '602', 'LIS_TIPOSPUBLICACION', 'TIPOS PUBLICACION', NULL, NULL, '1', NULL, '2022-08-26 00:29:00.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '603', NULL, 'COMENTARIO', NULL, NULL, '1', NULL, '2022-08-26 00:42:35.000000', NULL, NULL, NULL, '1', '602', NULL ),
( '604', NULL, 'PUBLICACION', NULL, NULL, '1', NULL, '2022-08-26 00:42:35.000000', NULL, NULL, NULL, '1', '602', NULL ),
( '605', NULL, 'PREGUNTA', NULL, NULL, '1', NULL, '2022-08-26 00:42:35.000000', NULL, NULL, NULL, '1', '602', NULL ),
( '606', NULL, 'RESPUESTA', NULL, NULL, '1', NULL, '2022-08-26 00:42:35.000000', NULL, NULL, NULL, '1', '602', NULL ),
( '607', NULL, 'LABORATORIO DESCARGADO', NULL, NULL, '1', NULL, '2022-08-26 00:42:35.000000', NULL, NULL, NULL, '1', '602', NULL ),
( '608', 'LIS_RESPUESTASINO', 'RESPUESTAS SI O NO', NULL, NULL, '1', NULL, '2022-08-26 00:43:59.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '609', NULL, 'SI', NULL, NULL, '1', NULL, '2022-08-26 00:43:59.000000', NULL, NULL, NULL, '1', '608', NULL ),
( '610', NULL, 'NO', NULL, NULL, '1', NULL, '2022-08-26 00:43:59.000000', NULL, NULL, NULL, '1', '608', NULL ),
( '611', 'LIS_UNIDADESTIEMPO', 'UNIDADES TIEMPO', NULL, NULL, '1', NULL, '2022-08-26 00:43:59.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '612', NULL, 'SEGUNDOS', NULL, NULL, '1', NULL, '2022-08-26 00:43:59.000000', NULL, NULL, NULL, '1', '611', NULL ),
( '613', NULL, 'MINUTOS', NULL, NULL, '1', NULL, '2022-08-26 00:43:59.000000', NULL, NULL, NULL, '1', '611', NULL ),
( '614', NULL, 'HORAS', NULL, NULL, '1', NULL, '2022-08-26 00:43:59.000000', NULL, NULL, NULL, '1', '611', NULL ),
( '615', NULL, 'DIAS', NULL, NULL, '1', NULL, '2022-08-26 00:43:59.000000', NULL, NULL, NULL, '1', '611', NULL ),
( '616', NULL, 'SEMANAS', NULL, NULL, '1', NULL, '2022-08-26 00:43:59.000000', NULL, NULL, NULL, '1', '611', NULL ),
( '617', NULL, 'MESES', NULL, NULL, '1', NULL, '2022-08-26 00:43:59.000000', NULL, NULL, NULL, '1', '611', NULL ),
( '618', NULL, 'AÑOS', NULL, NULL, '1', NULL, '2022-08-26 00:43:59.000000', NULL, NULL, NULL, '1', '611', NULL ),
( '619', 'LIS_REACCIONES', 'REACCIONES', NULL, NULL, '1', NULL, '2022-08-26 00:44:56.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '620', NULL, 'ME GUSTA', NULL, NULL, '1', NULL, '2022-08-26 00:44:56.000000', NULL, NULL, NULL, '1', '619', NULL ),
( '621', NULL, 'ME ENCANTA', NULL, NULL, '1', NULL, '2022-08-26 00:44:56.000000', NULL, NULL, NULL, '1', '619', NULL ),
( '622', NULL, 'ME DIVIERTE', NULL, NULL, '1', NULL, '2022-08-26 00:44:56.000000', NULL, NULL, NULL, '1', '619', NULL ),
( '623', NULL, 'ME SORPRENDE', NULL, NULL, '1', NULL, '2022-08-26 00:44:56.000000', NULL, NULL, NULL, '1', '619', NULL ),
( '624', NULL, 'ME ENTRISTECE', NULL, NULL, '1', NULL, '2022-08-26 00:44:56.000000', NULL, NULL, NULL, '1', '619', NULL ),
( '625', NULL, 'ME ENOJO', NULL, NULL, '1', NULL, '2022-08-26 00:44:56.000000', NULL, NULL, NULL, '1', '619', NULL ),
( '626', NULL, 'PROFESOR', NULL, NULL, '1', NULL, '2022-08-26 00:44:56.000000', NULL, NULL, NULL, '1', '5', NULL ),
( '627', NULL, 'ESTUDIANTE', NULL, NULL, '1', NULL, '2022-08-26 00:44:56.000000', NULL, NULL, NULL, '1', '5', NULL ),
( '628', NULL, 'PADRE', NULL, NULL, '1', NULL, '2022-08-26 00:44:56.000000', NULL, NULL, NULL, '1', '5', NULL ),
( '629', 'LIS_TIPOSCAMPOS', 'TIPOS DE CAMPOS HTML', NULL, NULL, '1', NULL, '2022-08-26 00:44:56.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '664', 'text', 'Campos de textos', NULL, NULL, '1', NULL, '2022-08-26 00:48:29.000000', NULL, NULL, NULL, '1', '629', NULL ),
( '665', 'textarea ', 'Áreas de texto', NULL, NULL, '1', NULL, '2022-08-26 00:48:29.000000', NULL, NULL, NULL, '1', '629', NULL ),
( '666', 'search ', 'Campos de busqueda', NULL, NULL, '1', NULL, '2022-08-26 00:48:29.000000', NULL, NULL, NULL, '1', '629', NULL ),
( '667', 'tel ', 'Campos de telefono', NULL, NULL, '1', NULL, '2022-08-26 00:48:29.000000', NULL, NULL, NULL, '1', '629', NULL ),
( '668', 'url ', 'Campos de url', NULL, NULL, '1', NULL, '2022-08-26 00:48:29.000000', NULL, NULL, NULL, '1', '629', NULL ),
( '669', 'email ', 'Campos de email', NULL, NULL, '1', NULL, '2022-08-26 00:48:29.000000', NULL, NULL, NULL, '1', '629', NULL ),
( '670', 'date ', 'Campos de fecha', NULL, NULL, '1', NULL, '2022-08-26 00:48:29.000000', NULL, NULL, NULL, '1', '629', NULL ),
( '671', 'select', 'Combos de selección', NULL, NULL, '1', NULL, '2022-08-26 00:48:29.000000', NULL, NULL, NULL, '1', '629', NULL ),
( '672', 'hidden', 'Campos Ocultos', NULL, NULL, '1', NULL, '2022-08-26 00:48:29.000000', NULL, NULL, NULL, '1', '629', NULL ),
( '673', 'password', 'Contraseñas', NULL, NULL, '1', NULL, '2022-08-26 00:48:29.000000', NULL, NULL, NULL, '1', '629', NULL ),
( '674', 'checkbox', 'Checkbox', NULL, NULL, '1', NULL, '2022-08-26 00:48:29.000000', NULL, NULL, NULL, '1', '629', NULL ),
( '675', 'radio', 'Radios', NULL, NULL, '1', NULL, '2022-08-26 00:48:29.000000', NULL, NULL, NULL, '1', '629', NULL ),
( '676', 'image', 'Imágenes', NULL, NULL, '1', NULL, '2022-08-26 00:48:29.000000', NULL, NULL, NULL, '1', '629', NULL ),
( '677', 'file', 'Ficheros', NULL, NULL, '1', NULL, '2022-08-26 00:48:29.000000', NULL, NULL, NULL, '1', '629', NULL ),
( '678', 'button', 'Botones', NULL, NULL, '1', NULL, '2022-08-26 00:48:29.000000', NULL, NULL, NULL, '1', '629', NULL ),
( '679', 'submit', 'Botones de envío', NULL, NULL, '1', NULL, '2022-08-26 00:48:29.000000', NULL, NULL, NULL, '1', '629', NULL ),
( '680', 'reset', 'Botones de borrado', NULL, NULL, '1', NULL, '2022-08-26 00:48:29.000000', NULL, NULL, NULL, '1', '629', NULL ),
( '681', 'LIS_TIPOMATERIA', 'TIPOS DE MATERIAS ESCOLARES', NULL, NULL, '1', NULL, '2022-08-26 01:10:49.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '682', NULL, 'CIENCIAS NATURALES Y EDUCACIÓN AMBIENTAL', NULL, NULL, '1', NULL, '2022-08-26 01:10:49.000000', NULL, NULL, NULL, '1', '681', NULL ),
( '683', NULL, 'CIENCIAS SOCIALES', NULL, NULL, '1', NULL, '2022-08-26 01:10:49.000000', NULL, NULL, NULL, '1', '681', NULL ),
( '684', NULL, 'HISTORIA', NULL, NULL, '1', NULL, '2022-08-26 01:10:49.000000', NULL, NULL, NULL, '1', '681', NULL ),
( '685', NULL, 'GEOGRAFÍA', NULL, NULL, '1', NULL, '2022-08-26 01:10:49.000000', NULL, NULL, NULL, '1', '681', NULL ),
( '686', NULL, 'CONSTITUCIÓN POLÍTICA Y DEMOCRACIA', NULL, NULL, '1', NULL, '2022-08-26 01:10:49.000000', NULL, NULL, NULL, '1', '681', NULL ),
( '687', NULL, 'ARTÍSTICA Y CULTURAL', NULL, NULL, '1', NULL, '2022-08-26 01:10:49.000000', NULL, NULL, NULL, '1', '681', NULL ),
( '688', NULL, 'ÉTICA Y EN VALORES HUMANOS', NULL, NULL, '1', NULL, '2022-08-26 01:10:49.000000', NULL, NULL, NULL, '1', '681', NULL ),
( '689', NULL, 'EDUCACIÓN FÍSICA, RECREACIÓN Y DEPORTES', NULL, NULL, '1', NULL, '2022-08-26 01:10:49.000000', NULL, NULL, NULL, '1', '681', NULL ),
( '690', NULL, 'RELIGION', NULL, NULL, '1', NULL, '2022-08-26 01:10:49.000000', NULL, NULL, NULL, '1', '681', NULL ),
( '691', NULL, 'HUMANIDADES', NULL, NULL, '1', NULL, '2022-08-26 01:10:49.000000', NULL, NULL, NULL, '1', '681', NULL ),
( '692', NULL, 'LENGUA CASTELLANA', NULL, NULL, '1', NULL, '2022-08-26 01:10:49.000000', NULL, NULL, NULL, '1', '681', NULL ),
( '693', NULL, 'INGLES', NULL, NULL, '1', NULL, '2022-08-26 01:10:49.000000', NULL, NULL, NULL, '1', '681', NULL ),
( '694', NULL, 'IDIOMAS EXTRANJEROS', NULL, NULL, '1', NULL, '2022-08-26 01:10:49.000000', NULL, NULL, NULL, '1', '681', NULL ),
( '695', NULL, 'MATEMÁTICAS', NULL, NULL, '1', NULL, '2022-08-26 01:10:49.000000', NULL, NULL, NULL, '1', '681', NULL ),
( '696', NULL, 'TECNOLOGÍA E INFORMÁTICA', NULL, NULL, '1', NULL, '2022-08-26 01:10:49.000000', NULL, NULL, NULL, '1', '681', NULL ),
( '697', 'LIST_GRADOS', 'GRADOS', NULL, NULL, '1', NULL, '2022-08-26 20:57:19.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '698', '', 'PRIMERO', NULL, NULL, '1', NULL, '2022-08-26 20:59:14.000000', NULL, NULL, NULL, '1', '697', NULL ),
( '699', '', 'SEGUNDO', NULL, NULL, '1', NULL, '2022-08-26 21:01:15.000000', NULL, NULL, NULL, '1', '697', NULL ),
( '700', '', 'TERCERO', NULL, NULL, '1', NULL, '2022-08-26 21:01:32.000000', NULL, NULL, NULL, '1', '697', NULL ),
( '701', '', 'CUARTO', NULL, NULL, '1', NULL, '2022-08-26 21:01:32.000000', NULL, NULL, NULL, '1', '697', NULL ),
( '702', '', 'QUINTO', NULL, NULL, '1', NULL, '2022-08-26 21:01:32.000000', NULL, NULL, NULL, '1', '697', NULL ),
( '703', '', 'SEXTO', NULL, NULL, '1', NULL, '2022-08-26 21:01:32.000000', NULL, NULL, NULL, '1', '697', NULL ),
( '704', '', 'SEPTIMO', NULL, NULL, '1', NULL, '2022-08-26 21:01:42.000000', NULL, NULL, NULL, '1', '697', NULL ),
( '705', '', 'OCTAVO', NULL, NULL, '1', NULL, '2022-08-26 21:01:52.000000', NULL, NULL, NULL, '1', '697', NULL ),
( '706', '', 'NOVENO', NULL, NULL, '1', NULL, '2022-08-26 21:02:17.000000', NULL, NULL, NULL, '1', '697', NULL ),
( '707', '', 'DECIMO', NULL, NULL, '1', NULL, '2022-08-26 21:02:17.000000', NULL, NULL, NULL, '1', '697', NULL ),
( '708', '', 'ONCE', NULL, NULL, '1', NULL, '2022-08-26 21:03:06.000000', NULL, NULL, NULL, '1', '697', NULL ),
( '709', '', 'DOCE', NULL, NULL, '1', NULL, '2022-08-26 21:03:06.000000', NULL, NULL, NULL, '1', '697', NULL ),
( '710', 'LIS_DIASEMANA', 'DIAS DE LA SEMANA', NULL, NULL, '1', NULL, '2022-08-28 02:40:47.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '711', NULL, 'LUNES', NULL, NULL, '1', NULL, '2022-08-28 02:41:42.000000', NULL, NULL, NULL, '1', '710', NULL ),
( '712', NULL, 'MARTES', NULL, NULL, '1', NULL, '2022-08-28 02:41:42.000000', NULL, NULL, NULL, '1', '710', NULL ),
( '713', NULL, 'MIERCOLES', NULL, NULL, '1', NULL, '2022-08-28 02:41:42.000000', NULL, NULL, NULL, '1', '710', NULL ),
( '714', NULL, 'JUEVES', NULL, NULL, '1', NULL, '2022-08-28 02:41:42.000000', NULL, NULL, NULL, '1', '710', NULL ),
( '715', NULL, 'VIERNES', NULL, NULL, '1', NULL, '2022-08-28 02:41:42.000000', NULL, NULL, NULL, '1', '710', NULL ),
( '716', 'LIS_CORTES', 'CORTES', NULL, NULL, '1', NULL, '2022-09-01 22:29:49.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '717', NULL, 'PRIMER PERIODO', NULL, NULL, '1', NULL, '2022-09-01 22:31:41.000000', NULL, NULL, NULL, '1', '716', NULL ),
( '718', NULL, 'SEGUNDO PERIODO', NULL, NULL, '1', NULL, '2022-09-01 22:31:41.000000', NULL, NULL, NULL, '1', '716', NULL ),
( '719', NULL, 'TERCER PERIODO', NULL, NULL, '1', NULL, '2022-09-01 22:31:41.000000', NULL, NULL, NULL, '1', '716', NULL ),
( '720', NULL, 'CUARTO PERIODO', NULL, NULL, '1', NULL, '2022-09-01 22:31:41.000000', NULL, NULL, NULL, '1', '716', NULL ),
( '721', NULL, 'QUINTO PERIODO', NULL, NULL, '1', NULL, '2022-09-01 22:31:41.000000', NULL, NULL, NULL, '1', '716', NULL ),
( '722', 'LIS_TIPOEVENTO', 'TIPO EVENTO', NULL, NULL, '1', NULL, '2022-09-01 22:31:41.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '723', NULL, 'PUBLICO', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '2', '722', NULL ),
( '724', NULL, 'PRIVADO', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '2', '722', NULL ),
( '725', NULL, 'GENERAL', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '2', '722', NULL ),
( '726', 'LIS_AREAS', 'LISTADO DE AREAS', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '2', '1', NULL ),
( '727', '', 'ADMINISTRATIVA', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '2', '726', NULL ),
( '728', '', 'VENTAS', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '2', '726', NULL ),
( '729', '', 'COMPRAS', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '2', '726', NULL ),
( '730', '', 'DEVOLUCIONES', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '2', '726', NULL ),
( '731', '', 'MARKETING', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '2', '726', NULL ),
( '732', '', 'LOGISTICA', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '2', '726', NULL ),
( '733', '', 'INVENTARIOS', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '2', '726', NULL ),
( '734', '', 'FINANZAS', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '2', '726', NULL ),
( '735', '', 'RECURSOS HUMANOS', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '2', '726', NULL ),
( '736', '', 'INVESTIGACION Y DESARROLLO', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '2', '726', NULL ),
( '737', 'LIS_TIPO_EMPLEADOS', 'TIPOS DE EMPLEADOS', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '2', '1', NULL ),
( '738', '', 'PLANTA', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '2', '737', NULL ),
( '739', '', 'PRESTADOR DE SERVICIOS', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '2', '737', NULL ),
( '740', '', 'TEMPORAL', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '2', '737', NULL ),
( '741', '', 'PRACTICANTE', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '2', '737', NULL ),
( '742', 'LIS_TIPO_ESTADOS_MENSAJES', 'TIPOS DE ESTADOS MENSAJES', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '743', '', 'PENDIENTE', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '1', '742', NULL ),
( '744', '', 'ENVIADO', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '1', '742', NULL ),
( '745', '', 'ENTREGADO', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '1', '742', NULL ),
( '746', '', 'LEIDO', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '1', '742', NULL ),
( '747', 'LIS_TIPO_MENSAJES', 'TIPOS DE MENSAJES', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '748', '', 'TEXTO', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '1', '747', NULL ),
( '749', '', 'REACION', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '1', '747', NULL ),
( '750', '', 'IMAGEN', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '1', '747', NULL ),
( '751', '', 'DESCONOCIDO', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '1', '747', NULL ),
( '752', '', 'UBICACION', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '1', '747', NULL ),
( '753', '', 'CONTACTO', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '1', '747', NULL ),
( '754', '', 'TEMPLATE', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '1', '747', NULL ),
( '755', '', 'VIDEO', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '1', '747', NULL ),
( '756', '', 'DOCUMENTO', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '1', '747', NULL ),
( '757', 'LIS_TIPO_ESTADO_CONVERSACION', 'ESTADOS CONVERSACION', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '1', '1', NULL ),
( '758', '', 'ACTIVA', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '1', '757', NULL ),
( '759', '', 'ARCHIVADA', NULL, NULL, '1', NULL, '2022-09-27 00:51:18.000000', NULL, NULL, NULL, '1', '757', NULL );
COMMIT;
-- ----------------------


-- Dump data of "mensajeria" -------------------------------
BEGIN;

INSERT INTO `mensajeria`(`id`,`mensaje_id`,`recipiente_id`,`conversacion_id`,`origin`,`timestamp_w`,`celular`,`created_at`,`updated_at`,`created_by_id`,`estado_id`,`updated_by_id`,`destinatario_id`,`texto`,`tipo_id`,`sha256`,`multimedia_id`,`mime_type`,`link`,`filename`,`voice`,`context_from`,`context_id`) VALUES 
( '273', 'wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggMkIzN0IyMTVCN0QzQjcwQjc0M0E1MUJDRDc4NEFGQ0QA', '573042115334', '2', NULL, '1691541036', '573042115334', '2023-08-09 00:30:37.526686', '2023-08-09 00:30:37.526686', NULL, '746', NULL, NULL, 'Hola', '748', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL ),
( '274', 'wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSMzM0RUYyQkE5RjJGNTc4RDcyAA==', '573042115334', '2', NULL, '1691541049', '573042115334', '2023-08-09 00:30:47.822744', '2023-08-09 00:30:49.996595', '1', '745', NULL, '3780', NULL, NULL, NULL, NULL, 'image/jpeg', 'static/temp/20230808_193046.jpg', NULL, NULL, NULL, NULL ),
( '278', 'wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRDAzOUUyMzJBREQ5RENBMzY4AA==', '573042115334', '2', NULL, '1691541655', '573042115334', '2023-08-09 00:40:55.275849', '2023-08-09 00:40:56.421705', '1', '745', NULL, '3780', 'Hola', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL ),
( '279', 'wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggQkJBNkJEOUQ1Rjk1RDE3M0Q4ODAxODk1MUYyQkU1MkIA', '573042115334', '2', NULL, '1691542621', '573042115334', '2023-08-09 00:57:03.630661', '2023-08-09 00:57:04.959550', NULL, '746', NULL, NULL, NULL, '750', 'PScjhKexFpb5O6ByfQf41mkzY//w2uMUeL0zWvN1P10=', '261466763406626', 'image/jpeg', 'static/temp/6f26b6df11ed116c053b6d976b535747.jpeg', NULL, NULL, NULL, NULL ),
( '280', 'wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggRDFFQTQ5NUMzRDVDMzM5MjE1OENCNjFBREY2NUI2RUEA', '573042115334', '2', NULL, '1691543552', '573042115334', '2023-08-09 01:12:32.936006', '2023-08-09 01:12:32.936006', NULL, '746', NULL, NULL, 'Hola', '748', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL ),
( '281', 'wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggMzQ4RERBNzI4MjE2ODBGRkEzN0E5QjE2MTc1QkVBNjgA', '573042115334', '2', NULL, '1691543629', '573042115334', '2023-08-09 01:13:49.691291', '2023-08-09 01:13:49.691291', NULL, '746', NULL, NULL, '.Hola', '748', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL ),
( '282', 'wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggMTQ0MEM3QUE0OTM1NkMyOEQ5NkJBODg4OUQyMjdEQTgA', '573042115334', '2', NULL, '1691543650', '573042115334', '2023-08-09 01:14:11.010005', '2023-08-09 01:14:11.010005', NULL, '746', NULL, NULL, '.', '748', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL ),
( '283', 'wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggMjFFNEE2RTE1ODZGMzQ2MjZDNDE0OEEwRDIyQzQ4NDAA', '573042115334', '2', NULL, '1691543695', '573042115334', '2023-08-09 01:14:55.861562', '2023-08-09 01:14:55.861562', NULL, '746', NULL, NULL, '.....', '748', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL ),
( '284', 'wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggRDQ1OTlFMzg0RDk2OEU3Q0ExRTczRjk4NEY4REY0MzkA', '573042115334', '2', NULL, '1691543706', '573042115334', '2023-08-09 01:15:07.695405', '2023-08-09 01:15:07.695405', NULL, '746', NULL, NULL, 'Hola', '748', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL ),
( '285', 'wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSOEZFMTkxNDIwNkVEQkNGQUUyAA==', '573042115334', '2', NULL, '1691543851', '573042115334', '2023-08-09 01:17:30.793406', '2023-08-09 01:17:32.135377', '1', '745', NULL, '3780', 'Hola', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL ),
( '286', 'wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggRDNEMkY2M0M2QzBCMjcwNjEwNzhEMjBEOUQxQzRBN0IA', '573042115334', '2', NULL, '1691544868', '573042115334', '2023-08-09 01:34:30.380599', '2023-08-09 01:34:31.636344', NULL, '746', NULL, NULL, NULL, '750', '/vFqJHo6649VXiufqv/wIAQ5P98qq0+hIS6LoyGyrpA=', '306709195083724', 'image/jpeg', 'static/temp/8f4075a3b0d2bf4b3e3995a7a7080c3f.jpeg', NULL, NULL, NULL, NULL ),
( '287', 'wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSNDY4OTQ5OUU2NDAwQTFCNzVBAA==', '573042115334', '2', NULL, '1691544959', '573042115334', '2023-08-09 01:35:57.431169', '2023-08-09 01:36:00.245323', '1', '745', NULL, '3780', NULL, NULL, NULL, NULL, 'image/jpeg', 'static/temp/20230808_203556.jpg', NULL, NULL, NULL, NULL ),
( '288', 'wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSMTU2N0ZERUVEOTVDMTEzRUM2AA==', '573042115334', '2', NULL, '1691545283', '573042115334', '2023-08-09 01:41:23.275552', '2023-08-09 01:41:24.352843', '1', '745', NULL, '3780', 'hola', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL ),
( '289', 'wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRUVEM0E3N0I0MDExODU4MDAxAA==', '573042115334', '2', NULL, '1691545291', '573042115334', '2023-08-09 01:41:29.696223', '2023-08-09 01:41:32.149868', '1', '745', NULL, '3780', NULL, NULL, NULL, NULL, 'image/jpeg', 'static/temp/20230808_204128.jpg', NULL, NULL, NULL, NULL ),
( '290', 'wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSMDdEQTEyMDQ3RkVGN0Q2QjY5AA==', '573042115334', '2', NULL, '1691545306', '573042115334', '2023-08-09 01:41:46.204942', '2023-08-09 01:41:47.323797', '1', '745', NULL, '3780', 'hola', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL ),
( '291', 'wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggQUU2MjZGMkVDOTYxQTEwQzU4OEIxNzY1REE5NDZGQTUA', '573042115334', '2', NULL, '1691545757', '573042115334', '2023-08-09 01:49:20.431840', '2023-08-09 01:49:22.349300', NULL, '746', NULL, NULL, NULL, '755', 'qJ6GXJlQTvOKniQLZ+3dZPIVgF4mWwO1AtsWwKYqFTY=', '837519771050729', 'video/mp4', 'static/temp/a62821867a1d90966f4b50729cb308b8.mp4', NULL, NULL, NULL, NULL ),
( '292', 'wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggNzQ0QTc2Q0M1QUVFNDZCQjM3RTJDQTczODVERkUxQUEA', '573042115334', '2', NULL, '1691546469', '573042115334', '2023-08-09 02:01:11.885955', '2023-08-09 02:01:13.857190', NULL, '746', NULL, NULL, NULL, '755', 'DegOR/D0BcHcgDw7oYLhzFvKYVBmtLgQQnOrBeBNCLc=', '655534253296939', 'video/mp4', 'static/temp/82fae06ef6748019a07395d223e5c4b2.mp4', NULL, NULL, NULL, NULL ),
( '293', 'wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggMENBNEE5NDFBOEExOTg0NTE1MDlDQTdCQTlEMjY4NjMA', '573042115334', '2', NULL, '1691546900', '573042115334', '2023-08-09 02:08:23.256562', '2023-08-09 02:08:24.697875', NULL, '746', NULL, NULL, NULL, '756', 'BOaFxAuWyLlzU5pkT2eOk7RGLvqp/ZcaEAJ6SEMj32g=', '288871103728020', 'application/pdf', 'static/temp/2.1.Artículo.pdf', '2.1. Artículo.pdf', NULL, NULL, NULL );
COMMIT;
-- ----------------------


-- Dump data of "modulos" ----------------------------------
-- ----------------------


-- Dump data of "personas" ---------------------------------
BEGIN;

INSERT INTO `personas`(`id`,`identificacion`,`lugarexpedicion`,`fechaexpedicion`,`direccion`,`telefono`,`telefonomovil`,`telefonowhatsapp`,`email`,`sendemail`,`fechanacimiento`,`nombre`,`segundonombre`,`apellido`,`segundoapellido`,`foto`,`barrio`,`observaciones`,`created_at`,`updated_at`,`deleted_at`,`deleted_by`,`ciudad_id`,`created_by_id`,`departamento_id`,`ocupacion_id`,`pais_id`,`sexo_id`,`tipoidentificacion_id`,`updated_by_id`,`zona_id`) VALUES 
( '2937', NULL, NULL, NULL, NULL, NULL, '3042115334', '573042115334', NULL, '0', NULL, 'Yilberth', '', 'Galarza', '', NULL, NULL, NULL, '2023-07-18 00:06:27.316310', '2023-07-18 00:06:27.316310', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL ),
( '2938', NULL, NULL, NULL, NULL, NULL, '3014582878', '573014582878', NULL, '0', NULL, 'Nelson', '', 'Borrego', '', NULL, NULL, NULL, '2023-07-19 16:03:04.563390', '2023-07-19 16:03:04.563390', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL );
COMMIT;
-- ----------------------


-- Dump data of "peticion" ---------------------------------
BEGIN;

INSERT INTO `peticion`(`id`,`estado`) VALUES 
( '291', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSQjJDRUQzQjY2NzE3OTE2MUZEAA==", "status": "failed", "timestamp": "1691456798", "recipient_id": "573042115334", "errors": [{"code": 131053, "title": "Media upload error", "message": "Media upload error", "error_data": {"details": "Downloading media from weblink failed with http code 404, status message Not Found"}}]}]}, "field": "messages"}]}]' ),
( '292', 'Fallo' ),
( '293', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSQkQ5RkI2MTMzMUZDMDEyNUQzAA==", "status": "failed", "timestamp": "1691457142", "recipient_id": "573042115334", "errors": [{"code": 131053, "title": "Media upload error", "message": "Media upload error", "error_data": {"details": "Downloading media from weblink failed with http code 404, status message Not Found"}}]}]}, "field": "messages"}]}]' ),
( '294', 'Fallo' ),
( '295', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSQ0M1QzJGM0Q2M0Y4NkZGRjlFAA==", "status": "sent", "timestamp": "1691457573", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "expiration_timestamp": "1691539800", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '296', 'Fallo' ),
( '297', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSQ0M1QzJGM0Q2M0Y4NkZGRjlFAA==", "status": "delivered", "timestamp": "1691457573", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '298', 'Fallo' ),
( '299', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSNkE0QkQ0NjEyODFFMDY1MTM1AA==", "status": "sent", "timestamp": "1691458404", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "expiration_timestamp": "1691539800", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '300', 'Fallo' ),
( '301', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSNkE0QkQ0NjEyODFFMDY1MTM1AA==", "status": "delivered", "timestamp": "1691458404", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '302', 'Fallo' ),
( '303', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRTU0Q0ZERTAyNkE2MjVCRkE2AA==", "status": "sent", "timestamp": "1691458490", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "expiration_timestamp": "1691539800", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '304', 'Fallo' ),
( '305', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRTU0Q0ZERTAyNkE2MjVCRkE2AA==", "status": "delivered", "timestamp": "1691458490", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '306', 'Fallo' ),
( '307', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSQ0E0MkI2N0I5RDUxQzZCM0FDAA==", "status": "sent", "timestamp": "1691458669", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "expiration_timestamp": "1691539800", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '308', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSQ0E0MkI2N0I5RDUxQzZCM0FDAA==", "status": "delivered", "timestamp": "1691458670", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '309', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSOUUwMEM2Q0Q4MkYwRDU1MzBDAA==", "status": "sent", "timestamp": "1691458941", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "expiration_timestamp": "1691539800", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '310', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSOUUwMEM2Q0Q4MkYwRDU1MzBDAA==", "status": "delivered", "timestamp": "1691458941", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '311', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSOUY4NkFBNjMyQ0M2MzFDNDhCAA==", "status": "sent", "timestamp": "1691459049", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "expiration_timestamp": "1691539800", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '312', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSOUY4NkFBNjMyQ0M2MzFDNDhCAA==", "status": "delivered", "timestamp": "1691459049", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '313', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSNEE2N0YyMTlFQTY2NDAyRDJBAA==", "status": "failed", "timestamp": "1691536768", "recipient_id": "573042115334", "errors": [{"code": 131053, "title": "Media upload error", "message": "Media upload error", "error_data": {"details": "Downloading media from weblink failed with http code 404, status message Not Found"}}]}]}, "field": "messages"}]}]' ),
( '314', 'Fallo' ),
( '315', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRjgwOTNCNDZCNUJDNjI3NDg2AA==", "status": "sent", "timestamp": "1691536971", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "expiration_timestamp": "1691539800", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '316', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRjgwOTNCNDZCNUJDNjI3NDg2AA==", "status": "delivered", "timestamp": "1691536971", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '317', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSNjFFRjRCNjQwMkZCMUYxRDhBAA==", "status": "sent", "timestamp": "1691537270", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "expiration_timestamp": "1691539800", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '318', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSNjFFRjRCNjQwMkZCMUYxRDhBAA==", "status": "delivered", "timestamp": "1691537270", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '319', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSQjNFNjg3MTJCQzcyMzNDRERBAA==", "status": "delivered", "timestamp": "1691537412", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '320', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSQjNFNjg3MTJCQzcyMzNDRERBAA==", "status": "sent", "timestamp": "1691537411", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "expiration_timestamp": "1691539800", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '321', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSMzMyNjVFRkZGMTExNjA2ODY1AA==", "status": "sent", "timestamp": "1691537555", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "expiration_timestamp": "1691539800", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '322', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSMzMyNjVFRkZGMTExNjA2ODY1AA==", "status": "delivered", "timestamp": "1691537557", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '323', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSN0EyNzVFMzA1MEMyMkE5MENGAA==", "status": "sent", "timestamp": "1691537659", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "expiration_timestamp": "1691539800", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '324', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSN0EyNzVFMzA1MEMyMkE5MENGAA==", "status": "delivered", "timestamp": "1691537661", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '325', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSREY4MDA5OEFEMTRCRjRFRUY1AA==", "status": "sent", "timestamp": "1691537711", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "expiration_timestamp": "1691539800", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '326', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSREY4MDA5OEFEMTRCRjRFRUY1AA==", "status": "delivered", "timestamp": "1691537712", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '327', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRDhBRkI3RTE3NDFCMjgyNjU3AA==", "status": "sent", "timestamp": "1691537730", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "expiration_timestamp": "1691539800", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '328', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRDhBRkI3RTE3NDFCMjgyNjU3AA==", "status": "delivered", "timestamp": "1691537730", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '329', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSNzdDRjRDNzYzMTIwQjg5NDIzAA==", "status": "sent", "timestamp": "1691538026", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "expiration_timestamp": "1691539800", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '330', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSNzdDRjRDNzYzMTIwQjg5NDIzAA==", "status": "delivered", "timestamp": "1691538028", "recipient_id": "573042115334", "conversation": {"id": "c76692afedd664c6b0ef3af3d2fa56da", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '331', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "contacts": [{"profile": {"name": "Yilberth Andres"}, "wa_id": "573042115334"}], "messages": [{"from": "573042115334", "id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggMkIzN0IyMTVCN0QzQjcwQjc0M0E1MUJDRDc4NEFGQ0QA", "timestamp": "1691541036", "text": {"body": "Hola"}, "type": "text"}]}, "field": "messages"}]}]' ),
( '332', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSMzM0RUYyQkE5RjJGNTc4RDcyAA==", "status": "sent", "timestamp": "1691541049", "recipient_id": "573042115334", "conversation": {"id": "9bb367673fbdf8774371516539f6ce74", "expiration_timestamp": "1691627460", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '333', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSMzM0RUYyQkE5RjJGNTc4RDcyAA==", "status": "delivered", "timestamp": "1691541049", "recipient_id": "573042115334", "conversation": {"id": "9bb367673fbdf8774371516539f6ce74", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '334', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRjJFMTc3OEQ4MUIxREI4QzNGAA==", "status": "sent", "timestamp": "1691541175", "recipient_id": "573042115334", "conversation": {"id": "9bb367673fbdf8774371516539f6ce74", "expiration_timestamp": "1691627460", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '335', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRjJFMTc3OEQ4MUIxREI4QzNGAA==", "status": "delivered", "timestamp": "1691541176", "recipient_id": "573042115334", "conversation": {"id": "9bb367673fbdf8774371516539f6ce74", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '336', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRTBEN0M5RTgzRkRCOUY1NkE5AA==", "status": "sent", "timestamp": "1691541216", "recipient_id": "573042115334", "conversation": {"id": "9bb367673fbdf8774371516539f6ce74", "expiration_timestamp": "1691627460", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '337', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRTBEN0M5RTgzRkRCOUY1NkE5AA==", "status": "delivered", "timestamp": "1691541216", "recipient_id": "573042115334", "conversation": {"id": "9bb367673fbdf8774371516539f6ce74", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '338', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRkZFNkI3RDJENEMwNjEwREM2AA==", "status": "delivered", "timestamp": "1691541268", "recipient_id": "573042115334", "conversation": {"id": "9bb367673fbdf8774371516539f6ce74", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '339', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRkZFNkI3RDJENEMwNjEwREM2AA==", "status": "sent", "timestamp": "1691541268", "recipient_id": "573042115334", "conversation": {"id": "9bb367673fbdf8774371516539f6ce74", "expiration_timestamp": "1691627460", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '340', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRDAzOUUyMzJBREQ5RENBMzY4AA==", "status": "sent", "timestamp": "1691541655", "recipient_id": "573042115334", "conversation": {"id": "9bb367673fbdf8774371516539f6ce74", "expiration_timestamp": "1691627460", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '341', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRDAzOUUyMzJBREQ5RENBMzY4AA==", "status": "delivered", "timestamp": "1691541655", "recipient_id": "573042115334", "conversation": {"id": "9bb367673fbdf8774371516539f6ce74", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '342', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "contacts": [{"profile": {"name": "Yilberth Andres"}, "wa_id": "573042115334"}], "messages": [{"from": "573042115334", "id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggQkJBNkJEOUQ1Rjk1RDE3M0Q4ODAxODk1MUYyQkU1MkIA", "timestamp": "1691542621", "type": "image", "image": {"mime_type": "image/jpeg", "sha256": "PScjhKexFpb5O6ByfQf41mkzY//w2uMUeL0zWvN1P10=", "id": "261466763406626"}}]}, "field": "messages"}]}]' ),
( '343', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "contacts": [{"profile": {"name": "Yilberth Andres"}, "wa_id": "573042115334"}], "messages": [{"from": "573042115334", "id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggRDFFQTQ5NUMzRDVDMzM5MjE1OENCNjFBREY2NUI2RUEA", "timestamp": "1691543552", "text": {"body": "Hola"}, "type": "text"}]}, "field": "messages"}]}]' ),
( '344', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "contacts": [{"profile": {"name": "Yilberth Andres"}, "wa_id": "573042115334"}], "messages": [{"from": "573042115334", "id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggMzQ4RERBNzI4MjE2ODBGRkEzN0E5QjE2MTc1QkVBNjgA", "timestamp": "1691543629", "text": {"body": ".Hola"}, "type": "text"}]}, "field": "messages"}]}]' ),
( '345', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "contacts": [{"profile": {"name": "Yilberth Andres"}, "wa_id": "573042115334"}], "messages": [{"from": "573042115334", "id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggMTQ0MEM3QUE0OTM1NkMyOEQ5NkJBODg4OUQyMjdEQTgA", "timestamp": "1691543650", "text": {"body": "."}, "type": "text"}]}, "field": "messages"}]}]' ),
( '346', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "contacts": [{"profile": {"name": "Yilberth Andres"}, "wa_id": "573042115334"}], "messages": [{"from": "573042115334", "id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggMjFFNEE2RTE1ODZGMzQ2MjZDNDE0OEEwRDIyQzQ4NDAA", "timestamp": "1691543695", "text": {"body": "....."}, "type": "text"}]}, "field": "messages"}]}]' ),
( '347', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "contacts": [{"profile": {"name": "Yilberth Andres"}, "wa_id": "573042115334"}], "messages": [{"from": "573042115334", "id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggRDQ1OTlFMzg0RDk2OEU3Q0ExRTczRjk4NEY4REY0MzkA", "timestamp": "1691543706", "text": {"body": "Hola"}, "type": "text"}]}, "field": "messages"}]}]' ),
( '348', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSOEZFMTkxNDIwNkVEQkNGQUUyAA==", "status": "sent", "timestamp": "1691543851", "recipient_id": "573042115334", "conversation": {"id": "9bb367673fbdf8774371516539f6ce74", "expiration_timestamp": "1691627460", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '349', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSOEZFMTkxNDIwNkVEQkNGQUUyAA==", "status": "delivered", "timestamp": "1691543851", "recipient_id": "573042115334", "conversation": {"id": "9bb367673fbdf8774371516539f6ce74", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '350', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "contacts": [{"profile": {"name": "Yilberth Andres"}, "wa_id": "573042115334"}], "messages": [{"from": "573042115334", "id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggRDNEMkY2M0M2QzBCMjcwNjEwNzhEMjBEOUQxQzRBN0IA", "timestamp": "1691544868", "type": "image", "image": {"mime_type": "image/jpeg", "sha256": "/vFqJHo6649VXiufqv/wIAQ5P98qq0+hIS6LoyGyrpA=", "id": "306709195083724"}}]}, "field": "messages"}]}]' ),
( '351', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSNDY4OTQ5OUU2NDAwQTFCNzVBAA==", "status": "sent", "timestamp": "1691544959", "recipient_id": "573042115334", "conversation": {"id": "9bb367673fbdf8774371516539f6ce74", "expiration_timestamp": "1691627460", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '352', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSNDY4OTQ5OUU2NDAwQTFCNzVBAA==", "status": "delivered", "timestamp": "1691544959", "recipient_id": "573042115334", "conversation": {"id": "9bb367673fbdf8774371516539f6ce74", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '353', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSMTU2N0ZERUVEOTVDMTEzRUM2AA==", "status": "sent", "timestamp": "1691545283", "recipient_id": "573042115334", "conversation": {"id": "9bb367673fbdf8774371516539f6ce74", "expiration_timestamp": "1691627460", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '354', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSMTU2N0ZERUVEOTVDMTEzRUM2AA==", "status": "delivered", "timestamp": "1691545283", "recipient_id": "573042115334", "conversation": {"id": "9bb367673fbdf8774371516539f6ce74", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '355', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRUVEM0E3N0I0MDExODU4MDAxAA==", "status": "sent", "timestamp": "1691545291", "recipient_id": "573042115334", "conversation": {"id": "9bb367673fbdf8774371516539f6ce74", "expiration_timestamp": "1691627460", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '356', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRUVEM0E3N0I0MDExODU4MDAxAA==", "status": "delivered", "timestamp": "1691545291", "recipient_id": "573042115334", "conversation": {"id": "9bb367673fbdf8774371516539f6ce74", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '357', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSMDdEQTEyMDQ3RkVGN0Q2QjY5AA==", "status": "sent", "timestamp": "1691545306", "recipient_id": "573042115334", "conversation": {"id": "9bb367673fbdf8774371516539f6ce74", "expiration_timestamp": "1691627460", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '358', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "statuses": [{"id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSMDdEQTEyMDQ3RkVGN0Q2QjY5AA==", "status": "delivered", "timestamp": "1691545306", "recipient_id": "573042115334", "conversation": {"id": "9bb367673fbdf8774371516539f6ce74", "origin": {"type": "service"}}, "pricing": {"billable": true, "pricing_model": "CBP", "category": "service"}}]}, "field": "messages"}]}]' ),
( '359', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "contacts": [{"profile": {"name": "Yilberth Andres"}, "wa_id": "573042115334"}], "messages": [{"from": "573042115334", "id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggQUU2MjZGMkVDOTYxQTEwQzU4OEIxNzY1REE5NDZGQTUA", "timestamp": "1691545757", "type": "video", "video": {"mime_type": "video/mp4", "sha256": "qJ6GXJlQTvOKniQLZ+3dZPIVgF4mWwO1AtsWwKYqFTY=", "id": "837519771050729"}}]}, "field": "messages"}]}]' ),
( '360', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "contacts": [{"profile": {"name": "Yilberth Andres"}, "wa_id": "573042115334"}], "messages": [{"from": "573042115334", "id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggNzQ0QTc2Q0M1QUVFNDZCQjM3RTJDQTczODVERkUxQUEA", "timestamp": "1691546469", "type": "video", "video": {"mime_type": "video/mp4", "sha256": "DegOR/D0BcHcgDw7oYLhzFvKYVBmtLgQQnOrBeBNCLc=", "id": "655534253296939"}}]}, "field": "messages"}]}]' ),
( '361', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "contacts": [{"profile": {"name": "Yilberth Andres"}, "wa_id": "573042115334"}], "messages": [{"from": "573042115334", "id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggMENBNEE5NDFBOEExOTg0NTE1MDlDQTdCQTlEMjY4NjMA", "timestamp": "1691546900", "type": "document", "document": {"filename": "2.1. Art\\u00edculo.pdf", "mime_type": "application/pdf", "sha256": "BOaFxAuWyLlzU5pkT2eOk7RGLvqp/ZcaEAJ6SEMj32g=", "id": "288871103728020"}}]}, "field": "messages"}]}]' );
COMMIT;
-- ----------------------


-- CREATE INDEX "archivos_created_by_id_45f66317_fk_auth_user_id" 
CREATE INDEX `archivos_created_by_id_45f66317_fk_auth_user_id` USING BTREE ON `archivos`( `created_by_id` );


-- CREATE INDEX "archivos_updated_by_id_69a44904_fk_auth_user_id" 
CREATE INDEX `archivos_updated_by_id_69a44904_fk_auth_user_id` USING BTREE ON `archivos`( `updated_by_id` );


-- CREATE INDEX "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" 
CREATE INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` USING BTREE ON `auth_group_permissions`( `permission_id` );


-- CREATE INDEX "auth_user_groups_group_id_97559544_fk_auth_group_id" 
CREATE INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id` USING BTREE ON `auth_user_groups`( `group_id` );


-- CREATE INDEX "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm" 
CREATE INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` USING BTREE ON `auth_user_user_permissions`( `permission_id` );


-- CREATE INDEX "conversaciones_created_by_id_014c1b6c_fk_auth_user_id" 
CREATE INDEX `conversaciones_created_by_id_014c1b6c_fk_auth_user_id` USING BTREE ON `conversaciones`( `created_by_id` );


-- CREATE INDEX "conversaciones_estado_id_f313842a_fk_maestras_id" 
CREATE INDEX `conversaciones_estado_id_f313842a_fk_maestras_id` USING BTREE ON `conversaciones`( `estado_id` );


-- CREATE INDEX "conversaciones_updated_by_id_182bbfbc_fk_auth_user_id" 
CREATE INDEX `conversaciones_updated_by_id_182bbfbc_fk_auth_user_id` USING BTREE ON `conversaciones`( `updated_by_id` );


-- CREATE INDEX "destinatarios_created_by_id_06bab4f5_fk_auth_user_id" 
CREATE INDEX `destinatarios_created_by_id_06bab4f5_fk_auth_user_id` USING BTREE ON `destinatarios`( `created_by_id` );


-- CREATE INDEX "destinatarios_estado_id_6746a127_fk_maestras_id" 
CREATE INDEX `destinatarios_estado_id_6746a127_fk_maestras_id` USING BTREE ON `destinatarios`( `estado_id` );


-- CREATE INDEX "destinatarios_updated_by_id_d4b37cc3_fk_auth_user_id" 
CREATE INDEX `destinatarios_updated_by_id_d4b37cc3_fk_auth_user_id` USING BTREE ON `destinatarios`( `updated_by_id` );


-- CREATE INDEX "django_admin_log_content_type_id_c4bce8eb_fk_django_co" 
CREATE INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co` USING BTREE ON `django_admin_log`( `content_type_id` );


-- CREATE INDEX "django_admin_log_user_id_c564eba6_fk_auth_user_id" 
CREATE INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id` USING BTREE ON `django_admin_log`( `user_id` );


-- CREATE INDEX "django_celery_beat_p_clocked_id_47a69f82_fk_django_ce" 
CREATE INDEX `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` USING BTREE ON `django_celery_beat_periodictask`( `clocked_id` );


-- CREATE INDEX "django_celery_beat_p_crontab_id_d3cba168_fk_django_ce" 
CREATE INDEX `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` USING BTREE ON `django_celery_beat_periodictask`( `crontab_id` );


-- CREATE INDEX "django_celery_beat_p_interval_id_a8ca27da_fk_django_ce" 
CREATE INDEX `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` USING BTREE ON `django_celery_beat_periodictask`( `interval_id` );


-- CREATE INDEX "django_celery_beat_p_solar_id_a87ce72c_fk_django_ce" 
CREATE INDEX `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` USING BTREE ON `django_celery_beat_periodictask`( `solar_id` );


-- CREATE INDEX "django_session_expire_date_a5c62663" ----------
CREATE INDEX `django_session_expire_date_a5c62663` USING BTREE ON `django_session`( `expire_date` );


-- CREATE INDEX "maestras_created_by_id_0d5f633f_fk_auth_user_id" 
CREATE INDEX `maestras_created_by_id_0d5f633f_fk_auth_user_id` USING BTREE ON `maestras`( `created_by_id` );


-- CREATE INDEX "maestras_padre_id_efdba410_fk_maestras_id" ----
CREATE INDEX `maestras_padre_id_efdba410_fk_maestras_id` USING BTREE ON `maestras`( `padre_id` );


-- CREATE INDEX "maestras_updated_by_id_6785499a_fk_auth_user_id" 
CREATE INDEX `maestras_updated_by_id_6785499a_fk_auth_user_id` USING BTREE ON `maestras`( `updated_by_id` );


-- CREATE INDEX "mensajeria_conversacion_id_id_2a3cd020" -------
CREATE INDEX `mensajeria_conversacion_id_id_2a3cd020` USING BTREE ON `mensajeria`( `conversacion_id` );


-- CREATE INDEX "mensajeria_created_by_id_0660a5f4_fk_auth_user_id" 
CREATE INDEX `mensajeria_created_by_id_0660a5f4_fk_auth_user_id` USING BTREE ON `mensajeria`( `created_by_id` );


-- CREATE INDEX "mensajeria_destinatario_id_d20046d0_fk_destinatarios_id" 
CREATE INDEX `mensajeria_destinatario_id_d20046d0_fk_destinatarios_id` USING BTREE ON `mensajeria`( `destinatario_id` );


-- CREATE INDEX "mensajeria_estado_id_8bce68b8_fk_maestras_id" -
CREATE INDEX `mensajeria_estado_id_8bce68b8_fk_maestras_id` USING BTREE ON `mensajeria`( `estado_id` );


-- CREATE INDEX "mensajeria_tipo_id_226751bf_fk_maestras_id" ---
CREATE INDEX `mensajeria_tipo_id_226751bf_fk_maestras_id` USING BTREE ON `mensajeria`( `tipo_id` );


-- CREATE INDEX "mensajeria_updated_by_id_9d97231f_fk_auth_user_id" 
CREATE INDEX `mensajeria_updated_by_id_9d97231f_fk_auth_user_id` USING BTREE ON `mensajeria`( `updated_by_id` );


-- CREATE INDEX "modulos_created_by_id_682736db_fk_auth_user_id" 
CREATE INDEX `modulos_created_by_id_682736db_fk_auth_user_id` USING BTREE ON `modulos`( `created_by_id` );


-- CREATE INDEX "modulos_dad_id_7911d8fa_fk_modulos_id" --------
CREATE INDEX `modulos_dad_id_7911d8fa_fk_modulos_id` USING BTREE ON `modulos`( `dad_id` );


-- CREATE INDEX "modulos_estado_id_b131b6f8_fk_maestras_id" ----
CREATE INDEX `modulos_estado_id_b131b6f8_fk_maestras_id` USING BTREE ON `modulos`( `estado_id` );


-- CREATE INDEX "modulos_updated_by_id_379626ca_fk_auth_user_id" 
CREATE INDEX `modulos_updated_by_id_379626ca_fk_auth_user_id` USING BTREE ON `modulos`( `updated_by_id` );


-- CREATE INDEX "personas_ciudad_id_33741ae6_fk_maestras_id" ---
CREATE INDEX `personas_ciudad_id_33741ae6_fk_maestras_id` USING BTREE ON `personas`( `ciudad_id` );


-- CREATE INDEX "personas_created_by_id_843eac77_fk_auth_user_id" 
CREATE INDEX `personas_created_by_id_843eac77_fk_auth_user_id` USING BTREE ON `personas`( `created_by_id` );


-- CREATE INDEX "personas_departamento_id_57efcde3_fk_maestras_id" 
CREATE INDEX `personas_departamento_id_57efcde3_fk_maestras_id` USING BTREE ON `personas`( `departamento_id` );


-- CREATE INDEX "personas_ocupacion_id_e546e79a_fk_maestras_id" 
CREATE INDEX `personas_ocupacion_id_e546e79a_fk_maestras_id` USING BTREE ON `personas`( `ocupacion_id` );


-- CREATE INDEX "personas_pais_id_45bcdd53_fk_maestras_id" -----
CREATE INDEX `personas_pais_id_45bcdd53_fk_maestras_id` USING BTREE ON `personas`( `pais_id` );


-- CREATE INDEX "personas_sexo_id_05557b10_fk_maestras_id" -----
CREATE INDEX `personas_sexo_id_05557b10_fk_maestras_id` USING BTREE ON `personas`( `sexo_id` );


-- CREATE INDEX "personas_tipoidentificacion_id_319d71c0_fk_maestras_id" 
CREATE INDEX `personas_tipoidentificacion_id_319d71c0_fk_maestras_id` USING BTREE ON `personas`( `tipoidentificacion_id` );


-- CREATE INDEX "personas_updated_by_id_7e6ba61e_fk_auth_user_id" 
CREATE INDEX `personas_updated_by_id_7e6ba61e_fk_auth_user_id` USING BTREE ON `personas`( `updated_by_id` );


-- CREATE INDEX "personas_zona_id_0e8ab25d_fk_maestras_id" -----
CREATE INDEX `personas_zona_id_0e8ab25d_fk_maestras_id` USING BTREE ON `personas`( `zona_id` );


-- CREATE LINK "archivos_created_by_id_45f66317_fk_auth_user_id" 
ALTER TABLE `archivos`
	ADD CONSTRAINT `archivos_created_by_id_45f66317_fk_auth_user_id` FOREIGN KEY ( `created_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "archivos_updated_by_id_69a44904_fk_auth_user_id" 
ALTER TABLE `archivos`
	ADD CONSTRAINT `archivos_updated_by_id_69a44904_fk_auth_user_id` FOREIGN KEY ( `updated_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" 
ALTER TABLE `auth_group_permissions`
	ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY ( `group_id` )
	REFERENCES `auth_group`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" 
ALTER TABLE `auth_group_permissions`
	ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY ( `permission_id` )
	REFERENCES `auth_permission`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "auth_permission_content_type_id_2f476e4b_fk_django_co" 
ALTER TABLE `auth_permission`
	ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY ( `content_type_id` )
	REFERENCES `django_content_type`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "auth_user_groups_group_id_97559544_fk_auth_group_id" 
ALTER TABLE `auth_user_groups`
	ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY ( `group_id` )
	REFERENCES `auth_group`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id" 
ALTER TABLE `auth_user_groups`
	ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY ( `user_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id" 
ALTER TABLE `auth_user_user_permissions`
	ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY ( `user_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm" 
ALTER TABLE `auth_user_user_permissions`
	ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY ( `permission_id` )
	REFERENCES `auth_permission`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "conversaciones_created_by_id_014c1b6c_fk_auth_user_id" 
ALTER TABLE `conversaciones`
	ADD CONSTRAINT `conversaciones_created_by_id_014c1b6c_fk_auth_user_id` FOREIGN KEY ( `created_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "conversaciones_destinatario_id_db2d6e39_fk_destinatarios_id" 
ALTER TABLE `conversaciones`
	ADD CONSTRAINT `conversaciones_destinatario_id_db2d6e39_fk_destinatarios_id` FOREIGN KEY ( `destinatario_id` )
	REFERENCES `destinatarios`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "conversaciones_estado_id_f313842a_fk_maestras_id" 
ALTER TABLE `conversaciones`
	ADD CONSTRAINT `conversaciones_estado_id_f313842a_fk_maestras_id` FOREIGN KEY ( `estado_id` )
	REFERENCES `maestras`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "conversaciones_updated_by_id_182bbfbc_fk_auth_user_id" 
ALTER TABLE `conversaciones`
	ADD CONSTRAINT `conversaciones_updated_by_id_182bbfbc_fk_auth_user_id` FOREIGN KEY ( `updated_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "destinatarios_created_by_id_06bab4f5_fk_auth_user_id" 
ALTER TABLE `destinatarios`
	ADD CONSTRAINT `destinatarios_created_by_id_06bab4f5_fk_auth_user_id` FOREIGN KEY ( `created_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "destinatarios_estado_id_6746a127_fk_maestras_id" 
ALTER TABLE `destinatarios`
	ADD CONSTRAINT `destinatarios_estado_id_6746a127_fk_maestras_id` FOREIGN KEY ( `estado_id` )
	REFERENCES `maestras`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "destinatarios_persona_id_dda68fc7_fk_personas_id" 
ALTER TABLE `destinatarios`
	ADD CONSTRAINT `destinatarios_persona_id_dda68fc7_fk_personas_id` FOREIGN KEY ( `persona_id` )
	REFERENCES `personas`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "destinatarios_updated_by_id_d4b37cc3_fk_auth_user_id" 
ALTER TABLE `destinatarios`
	ADD CONSTRAINT `destinatarios_updated_by_id_d4b37cc3_fk_auth_user_id` FOREIGN KEY ( `updated_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "django_admin_log_content_type_id_c4bce8eb_fk_django_co" 
ALTER TABLE `django_admin_log`
	ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY ( `content_type_id` )
	REFERENCES `django_content_type`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "django_admin_log_user_id_c564eba6_fk_auth_user_id" 
ALTER TABLE `django_admin_log`
	ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY ( `user_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "django_celery_beat_p_clocked_id_47a69f82_fk_django_ce" 
ALTER TABLE `django_celery_beat_periodictask`
	ADD CONSTRAINT `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` FOREIGN KEY ( `clocked_id` )
	REFERENCES `django_celery_beat_clockedschedule`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "django_celery_beat_p_crontab_id_d3cba168_fk_django_ce" 
ALTER TABLE `django_celery_beat_periodictask`
	ADD CONSTRAINT `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` FOREIGN KEY ( `crontab_id` )
	REFERENCES `django_celery_beat_crontabschedule`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "django_celery_beat_p_interval_id_a8ca27da_fk_django_ce" 
ALTER TABLE `django_celery_beat_periodictask`
	ADD CONSTRAINT `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` FOREIGN KEY ( `interval_id` )
	REFERENCES `django_celery_beat_intervalschedule`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "django_celery_beat_p_solar_id_a87ce72c_fk_django_ce" 
ALTER TABLE `django_celery_beat_periodictask`
	ADD CONSTRAINT `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` FOREIGN KEY ( `solar_id` )
	REFERENCES `django_celery_beat_solarschedule`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;



-- CREATE LINK "maestras_padre_id_efdba410_fk_maestras_id" -----
ALTER TABLE `maestras`
	ADD CONSTRAINT `maestras_padre_id_efdba410_fk_maestras_id` FOREIGN KEY ( `padre_id` )
	REFERENCES `maestras`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "maestras_updated_by_id_6785499a_fk_auth_user_id" 
ALTER TABLE `maestras`
	ADD CONSTRAINT `maestras_updated_by_id_6785499a_fk_auth_user_id` FOREIGN KEY ( `updated_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "mensajeria_conversacion_id_92157ae1_fk_conversaciones_id" 
ALTER TABLE `mensajeria`
	ADD CONSTRAINT `mensajeria_conversacion_id_92157ae1_fk_conversaciones_id` FOREIGN KEY ( `conversacion_id` )
	REFERENCES `conversaciones`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "mensajeria_created_by_id_0660a5f4_fk_auth_user_id" 
ALTER TABLE `mensajeria`
	ADD CONSTRAINT `mensajeria_created_by_id_0660a5f4_fk_auth_user_id` FOREIGN KEY ( `created_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "mensajeria_destinatario_id_d20046d0_fk_destinatarios_id" 
ALTER TABLE `mensajeria`
	ADD CONSTRAINT `mensajeria_destinatario_id_d20046d0_fk_destinatarios_id` FOREIGN KEY ( `destinatario_id` )
	REFERENCES `destinatarios`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "mensajeria_estado_id_8bce68b8_fk_maestras_id" --
ALTER TABLE `mensajeria`
	ADD CONSTRAINT `mensajeria_estado_id_8bce68b8_fk_maestras_id` FOREIGN KEY ( `estado_id` )
	REFERENCES `maestras`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "mensajeria_tipo_id_226751bf_fk_maestras_id" ----
ALTER TABLE `mensajeria`
	ADD CONSTRAINT `mensajeria_tipo_id_226751bf_fk_maestras_id` FOREIGN KEY ( `tipo_id` )
	REFERENCES `maestras`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "mensajeria_updated_by_id_9d97231f_fk_auth_user_id" 
ALTER TABLE `mensajeria`
	ADD CONSTRAINT `mensajeria_updated_by_id_9d97231f_fk_auth_user_id` FOREIGN KEY ( `updated_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "modulos_created_by_id_682736db_fk_auth_user_id" 
ALTER TABLE `modulos`
	ADD CONSTRAINT `modulos_created_by_id_682736db_fk_auth_user_id` FOREIGN KEY ( `created_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "modulos_dad_id_7911d8fa_fk_modulos_id" ---------
ALTER TABLE `modulos`
	ADD CONSTRAINT `modulos_dad_id_7911d8fa_fk_modulos_id` FOREIGN KEY ( `dad_id` )
	REFERENCES `modulos`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "modulos_estado_id_b131b6f8_fk_maestras_id" -----
ALTER TABLE `modulos`
	ADD CONSTRAINT `modulos_estado_id_b131b6f8_fk_maestras_id` FOREIGN KEY ( `estado_id` )
	REFERENCES `maestras`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "modulos_updated_by_id_379626ca_fk_auth_user_id" 
ALTER TABLE `modulos`
	ADD CONSTRAINT `modulos_updated_by_id_379626ca_fk_auth_user_id` FOREIGN KEY ( `updated_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "personas_ciudad_id_33741ae6_fk_maestras_id" ----
ALTER TABLE `personas`
	ADD CONSTRAINT `personas_ciudad_id_33741ae6_fk_maestras_id` FOREIGN KEY ( `ciudad_id` )
	REFERENCES `maestras`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "personas_created_by_id_843eac77_fk_auth_user_id" 
ALTER TABLE `personas`
	ADD CONSTRAINT `personas_created_by_id_843eac77_fk_auth_user_id` FOREIGN KEY ( `created_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "personas_departamento_id_57efcde3_fk_maestras_id" 
ALTER TABLE `personas`
	ADD CONSTRAINT `personas_departamento_id_57efcde3_fk_maestras_id` FOREIGN KEY ( `departamento_id` )
	REFERENCES `maestras`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "personas_ocupacion_id_e546e79a_fk_maestras_id" -
ALTER TABLE `personas`
	ADD CONSTRAINT `personas_ocupacion_id_e546e79a_fk_maestras_id` FOREIGN KEY ( `ocupacion_id` )
	REFERENCES `maestras`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "personas_pais_id_45bcdd53_fk_maestras_id" ------
ALTER TABLE `personas`
	ADD CONSTRAINT `personas_pais_id_45bcdd53_fk_maestras_id` FOREIGN KEY ( `pais_id` )
	REFERENCES `maestras`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "personas_sexo_id_05557b10_fk_maestras_id" ------
ALTER TABLE `personas`
	ADD CONSTRAINT `personas_sexo_id_05557b10_fk_maestras_id` FOREIGN KEY ( `sexo_id` )
	REFERENCES `maestras`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "personas_tipoidentificacion_id_319d71c0_fk_maestras_id" 
ALTER TABLE `personas`
	ADD CONSTRAINT `personas_tipoidentificacion_id_319d71c0_fk_maestras_id` FOREIGN KEY ( `tipoidentificacion_id` )
	REFERENCES `maestras`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "personas_updated_by_id_7e6ba61e_fk_auth_user_id" 
ALTER TABLE `personas`
	ADD CONSTRAINT `personas_updated_by_id_7e6ba61e_fk_auth_user_id` FOREIGN KEY ( `updated_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;


-- CREATE LINK "personas_zona_id_0e8ab25d_fk_maestras_id" ------
ALTER TABLE `personas`
	ADD CONSTRAINT `personas_zona_id_0e8ab25d_fk_maestras_id` FOREIGN KEY ( `zona_id` )
	REFERENCES `maestras`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;




