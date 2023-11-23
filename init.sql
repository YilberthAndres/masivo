

-- CREATE TABLE "archivos" -------------------------------------
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
	`file` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;


-- CREATE TABLE "auth_group" -----------------------------------
CREATE TABLE `auth_group`( 
	`id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 150 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `name` UNIQUE( `name` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;


-- CREATE TABLE "auth_group_permissions" -----------------------
CREATE TABLE `auth_group_permissions`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`group_id` Int( 0 ) NOT NULL,
	`permission_id` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` UNIQUE( `group_id`, `permission_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;


-- CREATE TABLE "auth_permission" ------------------------------
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
AUTO_INCREMENT = 81;-- -------------------------------------------------------------;


-- CREATE TABLE "auth_user" ------------------------------------
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
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;


-- CREATE TABLE "auth_user_groups" -----------------------------
CREATE TABLE `auth_user_groups`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`user_id` Int( 0 ) NOT NULL,
	`group_id` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `auth_user_groups_user_id_group_id_94350c0c_uniq` UNIQUE( `user_id`, `group_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;


-- CREATE TABLE "auth_user_user_permissions" -------------------
CREATE TABLE `auth_user_user_permissions`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`user_id` Int( 0 ) NOT NULL,
	`permission_id` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` UNIQUE( `user_id`, `permission_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;


-- CREATE TABLE "conversaciones" -------------------------------
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
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;


-- CREATE TABLE "destinatarios" --------------------------------
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
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;


-- CREATE TABLE "django_admin_log" -----------------------------
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
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;


-- CREATE TABLE "django_celery_beat_clockedschedule" -----------
CREATE TABLE `django_celery_beat_clockedschedule`( 
	`id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`clocked_time` DateTime NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;


-- CREATE TABLE "django_celery_beat_crontabschedule" -----------
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
ENGINE = InnoDB
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;


-- CREATE TABLE "django_celery_beat_intervalschedule" ----------
CREATE TABLE `django_celery_beat_intervalschedule`( 
	`id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`every` Int( 0 ) NOT NULL,
	`period` VarChar( 24 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;


-- CREATE TABLE "django_celery_beat_periodictask" --------------
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
	`headers` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
	`clocked_id` Int( 0 ) NULL DEFAULT NULL,
	`expire_seconds` Int( 0 ) UNSIGNED NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `name` UNIQUE( `name` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;


-- CREATE TABLE "django_celery_beat_periodictasks" -------------
CREATE TABLE `django_celery_beat_periodictasks`( 
	`ident` SmallInt( 0 ) NOT NULL,
	`last_update` DateTime NOT NULL,
	PRIMARY KEY ( `ident` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;-- -------------------------------------------------------------;


-- CREATE TABLE "django_celery_beat_solarschedule" -------------
CREATE TABLE `django_celery_beat_solarschedule`( 
	`id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`event` VarChar( 24 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`latitude` Decimal( 9, 6 ) NOT NULL,
	`longitude` Decimal( 9, 6 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq` UNIQUE( `event`, `latitude`, `longitude` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;


-- CREATE TABLE "django_content_type" --------------------------
CREATE TABLE `django_content_type`( 
	`id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`app_label` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`model` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `django_content_type_app_label_model_76bd3d3b_uniq` UNIQUE( `app_label`, `model` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 21;-- -------------------------------------------------------------;


-- CREATE TABLE "django_migrations" ----------------------------
CREATE TABLE `django_migrations`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`app` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`applied` DateTime NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 69;-- -------------------------------------------------------------;


-- CREATE TABLE "django_session" -------------------------------
CREATE TABLE `django_session`( 
	`session_key` VarChar( 40 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`session_data` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`expire_date` DateTime NOT NULL,
	PRIMARY KEY ( `session_key` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;-- -------------------------------------------------------------;


-- CREATE TABLE "maestras" -------------------------------------
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
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;


-- CREATE TABLE "mensajeria" -----------------------------------
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
	`multimedia_id_id` BigInt( 0 ) NULL DEFAULT NULL,
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
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;


-- CREATE TABLE "modulos" --------------------------------------
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
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;


-- CREATE TABLE "paises" ---------------------------------------
CREATE TABLE `paises`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`nombre` VarChar( 50 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`codigo` VarChar( 50 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;


-- CREATE TABLE "personas" -------------------------------------
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
	`pais_id` BigInt( 0 ) NULL DEFAULT NULL,
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
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;


-- CREATE TABLE "peticion" -------------------------------------
CREATE TABLE `peticion`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`estado` VarChar( 1091 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;


-- Dump data of "archivos" ---------------------------------
-- ---------------------------------------------------------


-- Dump data of "auth_group" -------------------------------
-- ---------------------------------------------------------


-- Dump data of "auth_group_permissions" -------------------
-- ---------------------------------------------------------


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
( '25', 'Can add crontab', '7', 'add_crontabschedule' ),
( '26', 'Can change crontab', '7', 'change_crontabschedule' ),
( '27', 'Can delete crontab', '7', 'delete_crontabschedule' ),
( '28', 'Can view crontab', '7', 'view_crontabschedule' ),
( '29', 'Can add interval', '8', 'add_intervalschedule' ),
( '30', 'Can change interval', '8', 'change_intervalschedule' ),
( '31', 'Can delete interval', '8', 'delete_intervalschedule' ),
( '32', 'Can view interval', '8', 'view_intervalschedule' ),
( '33', 'Can add periodic task', '9', 'add_periodictask' ),
( '34', 'Can change periodic task', '9', 'change_periodictask' ),
( '35', 'Can delete periodic task', '9', 'delete_periodictask' ),
( '36', 'Can view periodic task', '9', 'view_periodictask' ),
( '37', 'Can add periodic tasks', '10', 'add_periodictasks' ),
( '38', 'Can change periodic tasks', '10', 'change_periodictasks' ),
( '39', 'Can delete periodic tasks', '10', 'delete_periodictasks' ),
( '40', 'Can view periodic tasks', '10', 'view_periodictasks' ),
( '41', 'Can add solar event', '11', 'add_solarschedule' ),
( '42', 'Can change solar event', '11', 'change_solarschedule' ),
( '43', 'Can delete solar event', '11', 'delete_solarschedule' ),
( '44', 'Can view solar event', '11', 'view_solarschedule' ),
( '45', 'Can add clocked', '12', 'add_clockedschedule' ),
( '46', 'Can change clocked', '12', 'change_clockedschedule' ),
( '47', 'Can delete clocked', '12', 'delete_clockedschedule' ),
( '48', 'Can view clocked', '12', 'view_clockedschedule' ),
( '49', 'Can add destinatarios', '13', 'add_destinatarios' ),
( '50', 'Can change destinatarios', '13', 'change_destinatarios' ),
( '51', 'Can delete destinatarios', '13', 'delete_destinatarios' ),
( '52', 'Can view destinatarios', '13', 'view_destinatarios' ),
( '53', 'Can add archivos', '14', 'add_archivos' ),
( '54', 'Can change archivos', '14', 'change_archivos' ),
( '55', 'Can delete archivos', '14', 'delete_archivos' ),
( '56', 'Can view archivos', '14', 'view_archivos' ),
( '57', 'Can add maestra', '15', 'add_maestras' ),
( '58', 'Can change maestra', '15', 'change_maestras' ),
( '59', 'Can delete maestra', '15', 'delete_maestras' ),
( '60', 'Can view maestra', '15', 'view_maestras' ),
( '61', 'Can add persona', '16', 'add_personas' ),
( '62', 'Can change persona', '16', 'change_personas' ),
( '63', 'Can delete persona', '16', 'delete_personas' ),
( '64', 'Can view persona', '16', 'view_personas' ),
( '65', 'Can add modulos', '17', 'add_modulos' ),
( '66', 'Can change modulos', '17', 'change_modulos' ),
( '67', 'Can delete modulos', '17', 'delete_modulos' ),
( '68', 'Can view modulos', '17', 'view_modulos' ),
( '69', 'Can add mensajeria', '18', 'add_mensajeria' ),
( '70', 'Can change mensajeria', '18', 'change_mensajeria' ),
( '71', 'Can delete mensajeria', '18', 'delete_mensajeria' ),
( '72', 'Can view mensajeria', '18', 'view_mensajeria' ),
( '73', 'Can add peticion', '19', 'add_peticion' ),
( '74', 'Can change peticion', '19', 'change_peticion' ),
( '75', 'Can delete peticion', '19', 'delete_peticion' ),
( '76', 'Can view peticion', '19', 'view_peticion' ),
( '77', 'Can add conversaciones', '20', 'add_conversaciones' ),
( '78', 'Can change conversaciones', '20', 'change_conversaciones' ),
( '79', 'Can delete conversaciones', '20', 'delete_conversaciones' ),
( '80', 'Can view conversaciones', '20', 'view_conversaciones' ),
( '81', 'Can add paises', '21', 'add_paises' ),
( '82', 'Can change paises', '21', 'change_paises' ),
( '83', 'Can delete paises', '21', 'delete_paises' ),
( '84', 'Can view paises', '21', 'view_paises' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "auth_user" --------------------------------
BEGIN;

INSERT INTO `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) VALUES 
( '1', 'pbkdf2_sha256$390000$c4IBeoXybQPs4GNt99yGOt$NLcsZBZlFEe0Da75AERCnYaEN8EI4NCzR4Coj6mJeDM=', NULL, '0', 'admin', '', '', '', '0', '1', '2023-11-22 02:17:58.512827' ),
( '2', 'pbkdf2_sha256$390000$SLY96eTOP5OSP55SHo65rj$visd0TKcGnX/DAbXOAuySK0xnCzemJRUujwiQUKqYDI=', NULL, '0', 'admin2', '', '', '', '0', '1', '2023-11-22 02:25:10.838072' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "auth_user_groups" -------------------------
-- ---------------------------------------------------------


-- Dump data of "auth_user_user_permissions" ---------------
-- ---------------------------------------------------------


-- Dump data of "conversaciones" ---------------------------
-- ---------------------------------------------------------


-- Dump data of "destinatarios" ----------------------------
BEGIN;

INSERT INTO `destinatarios`(`id`,`created_at`,`updated_at`,`created_by_id`,`updated_by_id`,`persona_id`,`estado_id`) VALUES 
( '37', '2023-11-22 04:38:21.407082', '2023-11-22 04:38:21.407082', '1', NULL, '39', '596' ),
( '38', '2023-11-22 04:38:21.410595', '2023-11-22 04:38:21.410595', '1', NULL, '40', '596' ),
( '39', '2023-11-22 04:38:21.410595', '2023-11-22 04:38:21.410595', '1', NULL, '41', '596' ),
( '40', '2023-11-22 04:38:21.415154', '2023-11-22 04:38:21.415154', '1', NULL, '42', '596' ),
( '41', '2023-11-22 04:38:21.425528', '2023-11-22 04:38:21.425528', '1', NULL, '43', '596' ),
( '42', '2023-11-22 04:38:21.425528', '2023-11-22 04:38:21.425528', '1', NULL, '44', '596' ),
( '43', '2023-11-22 04:38:21.430552', '2023-11-22 04:38:21.430552', '1', NULL, '45', '596' ),
( '44', '2023-11-22 04:38:21.430552', '2023-11-22 04:38:21.430552', '1', NULL, '46', '596' ),
( '45', '2023-11-22 04:38:21.440527', '2023-11-22 04:38:21.440527', '1', NULL, '47', '596' ),
( '46', '2023-11-22 04:38:21.440527', '2023-11-22 04:38:21.440527', '1', NULL, '48', '596' ),
( '47', '2023-11-22 04:38:21.440527', '2023-11-22 04:38:21.440527', '1', NULL, '49', '596' ),
( '48', '2023-11-22 04:38:21.440527', '2023-11-22 04:38:21.440527', '1', NULL, '50', '596' ),
( '49', '2023-11-22 04:38:21.455100', '2023-11-22 04:38:21.455100', '1', NULL, '51', '596' ),
( '50', '2023-11-22 04:38:21.460121', '2023-11-22 04:38:21.460121', '1', NULL, '52', '596' ),
( '51', '2023-11-22 04:38:21.460121', '2023-11-22 04:38:21.460121', '1', NULL, '53', '596' ),
( '52', '2023-11-22 04:38:21.460121', '2023-11-22 04:38:21.460121', '1', NULL, '54', '596' ),
( '53', '2023-11-22 04:38:21.465155', '2023-11-22 04:38:21.465155', '1', NULL, '55', '596' ),
( '54', '2023-11-22 04:38:21.470184', '2023-11-22 04:38:21.470184', '1', NULL, '56', '596' ),
( '55', '2023-11-22 04:38:21.470184', '2023-11-22 04:38:21.470184', '1', NULL, '57', '596' ),
( '56', '2023-11-22 04:38:21.470184', '2023-11-22 04:38:21.470184', '1', NULL, '58', '596' ),
( '57', '2023-11-22 04:38:21.480317', '2023-11-22 04:38:21.480317', '1', NULL, '59', '596' ),
( '58', '2023-11-22 04:38:21.483871', '2023-11-22 04:38:21.483871', '1', NULL, '60', '596' ),
( '59', '2023-11-22 04:38:21.490542', '2023-11-22 04:38:21.490542', '1', NULL, '61', '596' ),
( '60', '2023-11-22 04:38:21.490542', '2023-11-22 04:38:21.490542', '1', NULL, '62', '596' ),
( '61', '2023-11-22 04:38:21.490542', '2023-11-22 04:38:21.490542', '1', NULL, '63', '596' ),
( '62', '2023-11-22 04:38:21.499638', '2023-11-22 04:38:21.499638', '1', NULL, '64', '596' ),
( '63', '2023-11-22 04:38:21.500148', '2023-11-22 04:38:21.500148', '1', NULL, '65', '596' ),
( '64', '2023-11-22 04:38:21.505203', '2023-11-22 04:38:21.505203', '1', NULL, '66', '596' ),
( '65', '2023-11-22 04:38:21.510223', '2023-11-22 04:38:21.510223', '1', NULL, '67', '596' ),
( '66', '2023-11-22 04:38:21.510223', '2023-11-22 04:38:21.510223', '1', NULL, '68', '596' ),
( '67', '2023-11-22 04:38:21.515371', '2023-11-22 04:38:21.515371', '1', NULL, '69', '596' ),
( '68', '2023-11-22 04:38:21.515371', '2023-11-22 04:38:21.515371', '1', NULL, '70', '596' ),
( '69', '2023-11-22 04:38:21.520493', '2023-11-22 04:38:21.520493', '1', NULL, '71', '596' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "django_admin_log" -------------------------
-- ---------------------------------------------------------


-- Dump data of "django_celery_beat_clockedschedule" -------
-- ---------------------------------------------------------


-- Dump data of "django_celery_beat_crontabschedule" -------
-- ---------------------------------------------------------


-- Dump data of "django_celery_beat_intervalschedule" ------
-- ---------------------------------------------------------


-- Dump data of "django_celery_beat_periodictask" ----------
-- ---------------------------------------------------------


-- Dump data of "django_celery_beat_periodictasks" ---------
-- ---------------------------------------------------------


-- Dump data of "django_celery_beat_solarschedule" ---------
-- ---------------------------------------------------------


-- Dump data of "django_content_type" ----------------------
BEGIN;

INSERT INTO `django_content_type`(`id`,`app_label`,`model`) VALUES 
( '1', 'admin', 'logentry' ),
( '3', 'auth', 'group' ),
( '2', 'auth', 'permission' ),
( '4', 'auth', 'user' ),
( '5', 'contenttypes', 'contenttype' ),
( '12', 'django_celery_beat', 'clockedschedule' ),
( '7', 'django_celery_beat', 'crontabschedule' ),
( '8', 'django_celery_beat', 'intervalschedule' ),
( '9', 'django_celery_beat', 'periodictask' ),
( '10', 'django_celery_beat', 'periodictasks' ),
( '11', 'django_celery_beat', 'solarschedule' ),
( '14', 'mensajeria', 'archivos' ),
( '20', 'mensajeria', 'conversaciones' ),
( '13', 'mensajeria', 'destinatarios' ),
( '15', 'mensajeria', 'maestras' ),
( '18', 'mensajeria', 'mensajeria' ),
( '17', 'mensajeria', 'modulos' ),
( '21', 'mensajeria', 'paises' ),
( '16', 'mensajeria', 'personas' ),
( '19', 'mensajeria', 'peticion' ),
( '6', 'sessions', 'session' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "django_migrations" ------------------------
BEGIN;

INSERT INTO `django_migrations`(`id`,`app`,`name`,`applied`) VALUES 
( '1', 'contenttypes', '0001_initial', '2023-11-22 02:14:55.773795' ),
( '2', 'auth', '0001_initial', '2023-11-22 02:14:56.338830' ),
( '3', 'admin', '0001_initial', '2023-11-22 02:14:56.469081' ),
( '4', 'admin', '0002_logentry_remove_auto_add', '2023-11-22 02:14:56.482689' ),
( '5', 'admin', '0003_logentry_add_action_flag_choices', '2023-11-22 02:14:56.488076' ),
( '6', 'contenttypes', '0002_remove_content_type_name', '2023-11-22 02:14:56.586392' ),
( '7', 'auth', '0002_alter_permission_name_max_length', '2023-11-22 02:14:56.682859' ),
( '8', 'auth', '0003_alter_user_email_max_length', '2023-11-22 02:14:56.715798' ),
( '9', 'auth', '0004_alter_user_username_opts', '2023-11-22 02:14:56.721474' ),
( '10', 'auth', '0005_alter_user_last_login_null', '2023-11-22 02:14:56.802571' ),
( '11', 'auth', '0006_require_contenttypes_0002', '2023-11-22 02:14:56.805567' ),
( '12', 'auth', '0007_alter_validators_add_error_messages', '2023-11-22 02:14:56.819296' ),
( '13', 'auth', '0008_alter_user_username_max_length', '2023-11-22 02:14:56.902436' ),
( '14', 'auth', '0009_alter_user_last_name_max_length', '2023-11-22 02:14:56.969990' ),
( '15', 'auth', '0010_alter_group_name_max_length', '2023-11-22 02:14:56.998306' ),
( '16', 'auth', '0011_update_proxy_permissions', '2023-11-22 02:14:57.006822' ),
( '17', 'auth', '0012_alter_user_first_name_max_length', '2023-11-22 02:14:57.087946' ),
( '18', 'django_celery_beat', '0001_initial', '2023-11-22 02:14:57.297452' ),
( '19', 'django_celery_beat', '0002_auto_20161118_0346', '2023-11-22 02:14:57.383717' ),
( '20', 'django_celery_beat', '0003_auto_20161209_0049', '2023-11-22 02:14:57.413151' ),
( '21', 'django_celery_beat', '0004_auto_20170221_0000', '2023-11-22 02:14:57.418179' ),
( '22', 'django_celery_beat', '0005_add_solarschedule_events_choices', '2023-11-22 02:14:57.429785' ),
( '23', 'django_celery_beat', '0006_auto_20180322_0932', '2023-11-22 02:14:57.533060' ),
( '24', 'django_celery_beat', '0007_auto_20180521_0826', '2023-11-22 02:14:57.596026' ),
( '25', 'django_celery_beat', '0008_auto_20180914_1922', '2023-11-22 02:14:57.619677' ),
( '26', 'django_celery_beat', '0006_auto_20180210_1226', '2023-11-22 02:14:57.644546' ),
( '27', 'django_celery_beat', '0006_periodictask_priority', '2023-11-22 02:14:57.745250' ),
( '28', 'django_celery_beat', '0009_periodictask_headers', '2023-11-22 02:14:57.814308' ),
( '29', 'django_celery_beat', '0010_auto_20190429_0326', '2023-11-22 02:14:58.043121' ),
( '30', 'django_celery_beat', '0011_auto_20190508_0153', '2023-11-22 02:14:58.134611' ),
( '31', 'django_celery_beat', '0012_periodictask_expire_seconds', '2023-11-22 02:14:58.230208' ),
( '32', 'django_celery_beat', '0013_auto_20200609_0727', '2023-11-22 02:14:58.243472' ),
( '33', 'django_celery_beat', '0014_remove_clockedschedule_enabled', '2023-11-22 02:14:58.267538' ),
( '34', 'django_celery_beat', '0015_edit_solarschedule_events_choices', '2023-11-22 02:14:58.279819' ),
( '35', 'django_celery_beat', '0016_alter_crontabschedule_timezone', '2023-11-22 02:14:58.290210' ),
( '36', 'django_celery_beat', '0017_alter_crontabschedule_month_of_year', '2023-11-22 02:14:58.298965' ),
( '37', 'django_celery_beat', '0018_improve_crontab_helptext', '2023-11-22 02:14:58.314349' ),
( '38', 'mensajeria', '0001_initial', '2023-11-22 02:14:58.589099' ),
( '39', 'mensajeria', '0002_maestras_remove_destinatarios_celular_and_more', '2023-11-22 02:15:00.016423' ),
( '40', 'mensajeria', '0003_alter_personas_identificacion_alter_personas_sexo_and_more', '2023-11-22 02:15:00.484845' ),
( '41', 'mensajeria', '0004_destinatarios_estado', '2023-11-22 02:15:00.561560' ),
( '42', 'mensajeria', '0005_chatgroup', '2023-11-22 02:15:00.624547' ),
( '43', 'mensajeria', '0006_delete_chatgroup', '2023-11-22 02:15:00.641608' ),
( '44', 'mensajeria', '0007_alter_mensajeria_celular_and_more', '2023-11-22 02:15:01.264531' ),
( '45', 'mensajeria', '0008_mensajeria_destinatarios_id', '2023-11-22 02:15:01.352215' ),
( '46', 'mensajeria', '0009_rename_destinatarios_id_mensajeria_destinatario', '2023-11-22 02:15:01.458747' ),
( '47', 'mensajeria', '0010_peticion', '2023-11-22 02:15:01.476967' ),
( '48', 'mensajeria', '0011_alter_peticion_estado', '2023-11-22 02:15:01.495056' ),
( '49', 'mensajeria', '0012_mensajeria_texto', '2023-11-22 02:15:01.521983' ),
( '50', 'mensajeria', '0013_mensajeria_tipo', '2023-11-22 02:15:01.639854' ),
( '51', 'mensajeria', '0014_mensajeria_multimedia', '2023-11-22 02:15:01.668665' ),
( '52', 'mensajeria', '0015_rename_multimedia_mensajeria_sha256_and_more', '2023-11-22 02:15:01.719310' ),
( '53', 'mensajeria', '0016_mensajeria_mime_type_alter_mensajeria_multimedia_id_and_more', '2023-11-22 02:15:01.885765' ),
( '54', 'mensajeria', '0017_rename_timestamp_mensajeria_timestamp_w', '2023-11-22 02:15:01.923781' ),
( '55', 'mensajeria', '0018_mensajeria_link', '2023-11-22 02:15:01.951096' ),
( '56', 'mensajeria', '0019_mensajeria_filename', '2023-11-22 02:15:01.982304' ),
( '57', 'mensajeria', '0020_mensajeria_voice', '2023-11-22 02:15:02.008696' ),
( '58', 'mensajeria', '0021_alter_mensajeria_voice', '2023-11-22 02:15:02.100121' ),
( '59', 'mensajeria', '0022_mensajeria_context_from_mensajeria_context_id', '2023-11-22 02:15:02.149304' ),
( '60', 'mensajeria', '0023_conversaciones', '2023-11-22 02:15:02.395534' ),
( '61', 'mensajeria', '0024_alter_mensajeria_conversacion_id', '2023-11-22 02:15:02.563819' ),
( '62', 'mensajeria', '0025_rename_conversacion_id_mensajeria_conversacion', '2023-11-22 02:15:02.698368' ),
( '63', 'mensajeria', '0026_alter_destinatarios_persona', '2023-11-22 02:15:02.893486' ),
( '64', 'mensajeria', '0027_alter_conversaciones_destinatario', '2023-11-22 02:15:03.053668' ),
( '65', 'mensajeria', '0028_alter_personas_telefonomovil_and_more', '2023-11-22 02:15:03.136953' ),
( '66', 'mensajeria', '0029_archivos_file', '2023-11-22 02:15:03.169812' ),
( '67', 'mensajeria', '0030_alter_archivos_file_alter_mensajeria_multimedia_id', '2023-11-22 02:15:03.398926' ),
( '68', 'sessions', '0001_initial', '2023-11-22 02:15:03.445652' ),
( '69', 'mensajeria', '0031_paises_alter_personas_pais', '2023-11-22 02:58:39.379882' ),
( '70', 'mensajeria', '0032_alter_paises_options_alter_paises_table', '2023-11-22 02:59:53.825802' ),
( '71', 'mensajeria', '0033_alter_paises_options_paises_codigo', '2023-11-22 03:07:50.778320' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "django_session" ---------------------------
-- ---------------------------------------------------------


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
( '43', 'POSITIVO', '', NULL, NULL, '1', NULL, '2022-08-26 00:15:26.000000', NULL, NULL, NULL, '1', '42', NULL ),
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
-- ---------------------------------------------------------


-- Dump data of "mensajeria" -------------------------------
-- ---------------------------------------------------------


-- Dump data of "modulos" ----------------------------------
-- ---------------------------------------------------------


-- Dump data of "paises" -----------------------------------
BEGIN;

INSERT INTO `paises`(`id`,`nombre`,`codigo`) VALUES 
( '1', 'Afganistán', '93' ),
( '2', 'Albania', '355' ),
( '3', 'Alemania', '49' ),
( '4', 'Andorra', '376' ),
( '5', 'Angola', '244' ),
( '6', 'Antigua y Barbuda', '268' ),
( '7', 'Arabia Saudita', '966' ),
( '8', 'Argelia', '213' ),
( '9', 'Argentina', '54' ),
( '10', 'Armenia', '374' ),
( '11', 'Australia', '61' ),
( '12', 'Austria', '43' ),
( '13', 'Azerbaiyán', '994' ),
( '14', 'Bahamas', '242' ),
( '15', 'Bangladés', '880' ),
( '16', 'Barbados', '246' ),
( '17', 'Baréin', '973' ),
( '18', 'Bélgica', '32' ),
( '19', 'Belice', '501' ),
( '20', 'Benín', '229' ),
( '21', 'Bhután', '975' ),
( '22', 'Bielorrusia', '375' ),
( '23', 'Bolivia', '591' ),
( '24', 'Bosnia y Herzegovina', '387' ),
( '25', 'Botsuana', '267' ),
( '26', 'Brasil', '55' ),
( '27', 'Brunéi', '673' ),
( '28', 'Bulgaria', '359' ),
( '29', 'Burkina Faso', '226' ),
( '30', 'Burundi', '257' ),
( '31', 'Camboya', '855' ),
( '32', 'Camerún', '237' ),
( '33', 'Canadá', '1' ),
( '34', 'Cabo Verde', '238' ),
( '35', 'Chad', '235' ),
( '36', 'Chile', '56' ),
( '37', 'China', '86' ),
( '38', 'Chipre', '357' ),
( '39', 'Colombia', '57' ),
( '40', 'Comoras', '269' ),
( '41', 'Congo', '242' ),
( '42', 'Congo, República Democrática del', '243' ),
( '43', 'Corea del Norte', '850' ),
( '44', 'Corea del Sur', '82' ),
( '45', 'Costa de Marfil', '225' ),
( '46', 'Costa Rica', '506' ),
( '48', 'Croacia', '385' ),
( '49', 'Cuba', '53' ),
( '50', 'Curazao', '599' ),
( '51', 'Dinamarca', '45' ),
( '52', 'Dominica', '1' ),
( '53', 'República Dominicana', '1' ),
( '54', 'Ecuador', '593' ),
( '55', 'Egipto', '20' ),
( '56', 'El Salvador', '503' ),
( '57', 'Emiratos Árabes Unidos', '971' ),
( '58', 'Eritrea', '291' ),
( '59', 'Eslovaquia', '421' ),
( '60', 'Eslovenia', '386' ),
( '61', 'España', '34' ),
( '62', 'Estados Unidos', '1' ),
( '63', 'Estonia', '372' ),
( '64', 'Etiopía', '251' ),
( '65', 'Filipinas', '63' ),
( '66', 'Finlandia', '358' ),
( '67', 'Fiyi', '679' ),
( '68', 'Francia', '33' ),
( '69', 'Gabón', '241' ),
( '70', 'Gambia', '220' ),
( '71', 'Georgia', '995' ),
( '72', 'Ghana', '233' ),
( '73', 'Gibraltar', '350' ),
( '74', 'Grecia', '30' ),
( '75', 'Grenada', '1' ),
( '76', 'Guatemala', '502' ),
( '77', 'Guinea', '224' ),
( '78', 'Guinea-Bissau', '245' ),
( '79', 'Guinea Ecuatorial', '240' ),
( '80', 'Guyana', '592' ),
( '81', 'Haití', '509' ),
( '82', 'Honduras', '504' ),
( '83', 'Hungría', '36' ),
( '84', 'India', '91' ),
( '85', 'Indonesia', '62' ),
( '86', 'Irán', '98' ),
( '87', 'Iraq', '964' ),
( '88', 'Irlanda', '353' ),
( '89', 'Islandia', '354' ),
( '90', 'Israel', '972' ),
( '91', 'Italia', '39' ),
( '92', 'Jamaica', '1' ),
( '93', 'Japón', '81' ),
( '94', 'Jordania', '962' ),
( '95', 'Kazajistán', '7' ),
( '96', 'Kenia', '254' ),
( '97', 'Kirguistán', '996' ),
( '98', 'Kiribati', '686' ),
( '99', 'Kosovo', '383' ),
( '100', 'Kuwait', '965' ),
( '101', 'Laos', '856' ),
( '102', 'Letonia', '371' ),
( '103', 'Líbano', '961' ),
( '104', 'Lesoto', '266' ),
( '105', 'Liberia', '231' ),
( '106', 'Libia', '218' ),
( '107', 'Liechtenstein', '423' ),
( '108', 'Lituania', '370' ),
( '109', 'Luxemburgo', '352' ),
( '110', 'Macedonia del Norte', '389' ),
( '111', 'Madagascar', '261' ),
( '112', 'Malasia', '60' ),
( '113', 'Malawi', '265' ),
( '114', 'Maldivas', '960' ),
( '115', 'Malí', '223' ),
( '116', 'Malta', '356' ),
( '117', 'Marruecos', '212' ),
( '118', 'Mauricio', '230' ),
( '119', 'Mauritania', '222' ),
( '120', 'México', '52' ),
( '121', 'Micronesia', '691' ),
( '122', 'Moldavia', '373' ),
( '123', 'Mónaco', '377' ),
( '124', 'Mongolia', '976' ),
( '125', 'Montenegro', '382' ),
( '126', 'Marruecos', '212' ),
( '127', 'Mozambique', '258' ),
( '128', 'Myanmar (Birmania)', '95' ),
( '129', 'Namibia', '264' ),
( '130', 'Nauru', '674' ),
( '131', 'Nepal', '977' ),
( '132', 'Países Bajos', '31' ),
( '133', 'Nueva Zelanda', '64' ),
( '134', 'Nicaragua', '505' ),
( '135', 'Níger', '227' ),
( '136', 'Nigeria', '234' ),
( '137', 'Noruega', '47' ),
( '138', 'Omán', '968' ),
( '139', 'Pakistán', '92' ),
( '140', 'Palaos', '680' ),
( '141', 'Palestina', '970' ),
( '142', 'Panamá', '507' ),
( '143', 'Papúa Nueva Guinea', '675' ),
( '144', 'Paraguay', '595' ),
( '145', 'Perú', '51' ),
( '146', 'Filipinas', '63' ),
( '147', 'Polonia', '48' ),
( '148', 'Portugal', '351' ),
( '149', 'Puerto Rico', '1' ),
( '150', 'Qatar', '974' ),
( '151', 'Reino Unido', '44' ),
( '152', 'Ruanda', '250' ),
( '153', 'Rumania', '40' ),
( '154', 'Rusia', '7' ),
( '155', 'Samoa', '685' ),
( '156', 'San Cristóbal y Nieves', '1' ),
( '157', 'San Marino', '378' ),
( '158', 'San Vicente y las Granadinas', '1' ),
( '159', 'Santa Lucía', '1' ),
( '160', 'Santo Tomé y Príncipe', '239' ),
( '161', 'Senegal', '221' ),
( '162', 'Serbia', '381' ),
( '163', 'Seychelles', '248' ),
( '164', 'Sierra Leona', '232' ),
( '165', 'Singapur', '65' ),
( '166', 'Siria', '963' ),
( '167', 'Somalia', '252' ),
( '168', 'Sri Lanka', '94' ),
( '169', 'Sudáfrica', '27' ),
( '170', 'Sudán', '249' ),
( '171', 'Sudán del Sur', '211' ),
( '172', 'Suecia', '46' ),
( '173', 'Suiza', '41' ),
( '174', 'Suriname', '597' ),
( '175', 'Tailandia', '66' ),
( '176', 'Tajikistan', '992' ),
( '177', 'Tanzania', '255' ),
( '178', 'Taylandia', '66' ),
( '179', 'Timor Oriental', '670' ),
( '180', 'Togo', '228' ),
( '181', 'Venezuela', '58' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "personas" ---------------------------------
BEGIN;

INSERT INTO `personas`(`id`,`identificacion`,`lugarexpedicion`,`fechaexpedicion`,`direccion`,`telefono`,`telefonomovil`,`telefonowhatsapp`,`email`,`sendemail`,`fechanacimiento`,`nombre`,`segundonombre`,`apellido`,`segundoapellido`,`foto`,`barrio`,`observaciones`,`created_at`,`updated_at`,`deleted_at`,`deleted_by`,`ciudad_id`,`created_by_id`,`departamento_id`,`ocupacion_id`,`pais_id`,`sexo_id`,`tipoidentificacion_id`,`updated_by_id`,`zona_id`) VALUES 
( '39', '123456789', NULL, NULL, 'calle 33', NULL, '4567890123', '574567890123', NULL, '0', '2000-11-13', 'Yilberth', '', 'García', 'Rojas', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.390296', '2023-11-22 04:38:21.390296', NULL, NULL, NULL, '1', NULL, NULL, '39', '21', NULL, NULL, NULL ),
( '40', '987654321', NULL, NULL, 'calle 34', NULL, '3456789012', '583456789012', NULL, '0', '2000-11-14', 'Marco', 'Victoria', 'Rodríguez', 'Peralta', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.407082', '2023-11-22 04:38:21.407082', NULL, NULL, NULL, '1', NULL, NULL, '181', '21', NULL, NULL, NULL ),
( '41', '6666666666', NULL, NULL, 'calle 36', NULL, '5678901234', '585678901234', NULL, '0', '2000-11-16', 'Ana', 'Isabel', 'López', 'Solís', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.410595', '2023-11-22 04:38:21.410595', NULL, NULL, NULL, '1', NULL, NULL, '181', '21', NULL, NULL, NULL ),
( '42', '2345678901', NULL, NULL, 'calle 38', NULL, '7890123456', '587890123456', NULL, '0', '2000-11-18', 'María', 'Gabriela', 'González', 'Campos', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.415154', '2023-11-22 04:38:21.415154', NULL, NULL, NULL, '1', NULL, NULL, '181', '21', NULL, NULL, NULL ),
( '43', '1111111111', NULL, NULL, 'calle 40', NULL, '9012345678', '579012345678', NULL, '0', '2000-11-20', 'Laura', 'Elena', 'Romero', '', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.420519', '2023-11-22 04:38:21.420519', NULL, NULL, NULL, '1', NULL, NULL, '39', '21', NULL, NULL, NULL ),
( '44', '2222222222', NULL, NULL, 'calle 41', NULL, '1012345678', '571012345678', NULL, '0', '2000-11-21', 'Carlos', 'Roberto', 'Torres', 'Chavarría', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.425528', '2023-11-22 04:38:21.425528', NULL, NULL, NULL, '1', NULL, NULL, '39', '21', NULL, NULL, NULL ),
( '45', '3456789012', NULL, NULL, 'calle 43', NULL, '1212345678', '561212345678', NULL, '0', '2000-11-23', 'Luis', 'Jorge', 'Ramírez', 'Zúñiga', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.430552', '2023-11-22 04:38:21.430552', NULL, NULL, NULL, '1', NULL, NULL, '36', '21', NULL, NULL, NULL ),
( '46', '2109876543', NULL, NULL, 'calle 44', NULL, '1312345678', '561312345678', NULL, '0', '2000-11-24', 'Andrea', 'Carmen', 'Ruiz', 'Aguilar', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.430552', '2023-11-22 04:38:21.430552', NULL, NULL, NULL, '1', NULL, NULL, '36', '21', NULL, NULL, NULL ),
( '47', '4444444444', NULL, NULL, 'calle 45', NULL, '', '561412345678', NULL, '0', '2000-11-25', 'Manuel', 'Guillermo', 'González', 'Navarro', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.436010', '2023-11-22 04:38:21.436010', NULL, NULL, NULL, '1', NULL, NULL, '36', '21', NULL, NULL, NULL ),
( '48', '8888888888', NULL, NULL, 'calle 46', NULL, '1512345678', '561512345678', NULL, '0', '2000-11-26', 'Marta', 'Beatriz', 'Díaz', 'Acuña', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.440527', '2023-11-22 04:38:21.440527', NULL, NULL, NULL, '1', NULL, NULL, '36', '21', NULL, NULL, NULL ),
( '49', '123487695', NULL, NULL, 'calle 49', NULL, '1812345678', '561812345678', NULL, '0', '2000-11-29', 'Miguel', '', 'Ortega', 'Ochoa', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.440527', '2023-11-22 04:38:21.440527', NULL, NULL, NULL, '1', NULL, NULL, '36', '21', NULL, NULL, NULL ),
( '50', '5551122334', NULL, NULL, 'calle 50', NULL, '1912345678', '571912345678', NULL, '0', '2000-11-30', 'Victoria', 'Ana', 'Reyes', 'Castillo', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.440527', '2023-11-22 04:38:21.440527', NULL, NULL, NULL, '1', NULL, NULL, '39', '21', NULL, NULL, NULL ),
( '51', '987654321', NULL, NULL, 'calle 51', NULL, '2012345678', '572012345678', NULL, '0', '2000-12-01', 'Antonio', 'Pedro', 'Morales', 'Segura', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.452078', '2023-11-22 04:38:21.452078', NULL, NULL, NULL, '1', NULL, NULL, '39', '21', NULL, NULL, NULL ),
( '52', '', NULL, NULL, 'calle 53', NULL, '2212345678', '572212345678', NULL, '0', '2000-12-03', 'Fernando', 'José', 'Vargas', 'González', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.455100', '2023-11-22 04:38:21.455100', NULL, NULL, NULL, '1', NULL, NULL, '39', '21', NULL, NULL, NULL ),
( '53', '8889997776', NULL, NULL, 'calle 54', NULL, '2312345678', '572312345678', NULL, '0', '2000-12-04', 'Gabriela', 'Laura', 'Rivera', 'Díaz', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.460121', '2023-11-22 04:38:21.460121', NULL, NULL, NULL, '1', NULL, NULL, '39', '21', NULL, NULL, NULL ),
( '54', '2222444455', NULL, NULL, 'calle 55', NULL, '2412345678', '572412345678', NULL, '0', '2000-12-05', 'Daniel', 'Carlos', 'Mendoza', 'Herrera', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.460121', '2023-11-22 04:38:21.460121', NULL, NULL, NULL, '1', NULL, NULL, '39', '21', NULL, NULL, NULL ),
( '55', '3456783456', NULL, NULL, 'calle 56', NULL, '2512345678', '572512345678', NULL, '0', '2000-12-06', 'Elena', 'Sofia', 'Herrera', 'Castro', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.465155', '2023-11-22 04:38:21.465155', NULL, NULL, NULL, '1', NULL, NULL, '39', '21', NULL, NULL, NULL ),
( '56', '999000111', NULL, NULL, 'calle 58', NULL, '2712345678', '572712345678', NULL, '0', '2000-12-08', 'Raquel', 'Andrea', 'Delgado', 'Reyes', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.468171', '2023-11-22 04:38:21.468171', NULL, NULL, NULL, '1', NULL, NULL, '39', '21', NULL, NULL, NULL ),
( '57', '8765123456', NULL, NULL, 'calle 59', NULL, '2812345678', '572812345678', NULL, '0', '2000-12-09', 'Jorge', 'Manuel', 'Torres', 'Morales', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.470184', '2023-11-22 04:38:21.470184', NULL, NULL, NULL, '1', NULL, NULL, '39', '21', NULL, NULL, NULL ),
( '58', '9876541987', NULL, NULL, 'calle 60', NULL, '2912345678', '572912345678', NULL, '0', '2000-12-10', 'Carmen', 'Marta', 'Méndez', 'Jiménez', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.470184', '2023-11-22 04:38:21.470184', NULL, NULL, NULL, '1', NULL, NULL, '39', '21', NULL, NULL, NULL ),
( '59', '6543212345', NULL, NULL, 'calle 62', NULL, '3112345678', '573112345678', NULL, '0', '2000-12-12', 'Beatriz', 'Paula', 'Cordero', 'Rivera', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.470184', '2023-11-22 04:38:21.470184', NULL, NULL, NULL, '1', NULL, NULL, '39', '21', NULL, NULL, NULL ),
( '60', '1357975313', NULL, NULL, 'calle 63', NULL, '3212345678', '573212345678', NULL, '0', '2000-12-13', 'Ricardo', 'Miguel', 'Cervantes', 'Mendoza', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.480317', '2023-11-22 04:38:21.480317', NULL, NULL, NULL, '1', NULL, NULL, '39', '21', NULL, NULL, NULL ),
( '61', '8765435678', NULL, NULL, 'calle 65', NULL, '3412345678', '573412345678', NULL, '0', '2000-12-15', 'Alberto', 'Antonio', 'Peralta', 'Guzmán', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.483871', '2023-11-22 04:38:21.483871', NULL, NULL, NULL, '1', NULL, NULL, '39', '21', NULL, NULL, NULL ),
( '62', '909090909', NULL, NULL, 'calle 66', NULL, '3512345678', '573512345678', NULL, '0', '2000-12-16', 'Clara', 'Isabel', 'León', 'Delgado', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.490542', '2023-11-22 04:38:21.490542', NULL, NULL, NULL, '1', NULL, NULL, '39', '21', NULL, NULL, NULL ),
( '63', '1234509876', NULL, NULL, 'calle 68', NULL, '3712345678', '573712345678', NULL, '0', '2000-12-18', 'Raúl', 'Gabriela', 'Salas', 'Méndez', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.490542', '2023-11-22 04:38:21.490542', NULL, NULL, NULL, '1', NULL, NULL, '39', '21', NULL, NULL, NULL ),
( '64', '6666555555', NULL, NULL, 'calle 70', NULL, '3912345678', '13912345678', NULL, '0', '2000-12-20', 'Natalia', 'Elena', 'Soto', 'Cordero', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.490542', '2023-11-22 04:38:21.490542', NULL, NULL, NULL, '1', NULL, NULL, '62', '21', NULL, NULL, NULL ),
( '65', '7890123456', NULL, NULL, 'calle 71', NULL, '4012345678', '14012345678', NULL, '0', '2000-12-21', 'Oscar', 'Victoria', 'Mora', 'Cervantes', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.500148', '2023-11-22 04:38:21.500148', NULL, NULL, NULL, '1', NULL, NULL, '62', '21', NULL, NULL, NULL ),
( '66', '567856789', NULL, NULL, 'calle 73', NULL, '4212345678', '14212345678', NULL, '0', '2000-12-23', 'Juan Carlos', 'Isabel', 'Araya', 'Peralta', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.505203', '2023-11-22 04:38:21.505203', NULL, NULL, NULL, '1', NULL, NULL, '62', '21', NULL, NULL, NULL ),
( '67', '1212121212', NULL, NULL, 'calle 75', NULL, '4412345678', '14412345678', NULL, '0', '2000-12-25', 'Andrés', 'Gabriela', 'Aguilar', 'Solís', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.505203', '2023-11-22 04:38:21.505203', NULL, NULL, NULL, '1', NULL, NULL, '62', '21', NULL, NULL, NULL ),
( '68', '', NULL, NULL, 'calle 77', NULL, '4612345678', '14612345678', NULL, '0', '2000-12-27', 'Gonzalo', 'Elena', 'Acuña', 'Campos', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.510223', '2023-11-22 04:38:21.510223', NULL, NULL, NULL, '1', NULL, NULL, '62', '21', NULL, NULL, NULL ),
( '69', '5555556666', NULL, NULL, 'calle 78', NULL, '4712345678', '14712345678', NULL, '0', '2000-12-28', 'Silvia', 'Roberto', 'Gutiérrez', 'Soto', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.510223', '2023-11-22 04:38:21.510223', NULL, NULL, NULL, '1', NULL, NULL, '62', '21', NULL, NULL, NULL ),
( '70', '7777888899', NULL, NULL, 'calle 79', NULL, '4812345678', '14812345678', NULL, '0', '2000-12-29', 'Angel', '', 'Avila', 'Mora', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.515371', '2023-11-22 04:38:21.515371', NULL, NULL, NULL, '1', NULL, NULL, '62', '21', NULL, NULL, NULL ),
( '71', '321321321', NULL, NULL, 'calle 81', NULL, '5012345678', '15012345678', NULL, '0', '2000-12-31', 'Guillermo', 'Carmen', 'Castillo', 'Araya', NULL, 'los olivos', NULL, '2023-11-22 04:38:21.520493', '2023-11-22 04:38:21.520493', NULL, NULL, NULL, '1', NULL, NULL, '62', '21', NULL, NULL, NULL );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "peticion" ---------------------------------
BEGIN;

INSERT INTO `peticion`(`id`,`estado`) VALUES 
( '60', '[{"id": "103916249443809", "changes": [{"value": {"messaging_product": "whatsapp", "metadata": {"display_phone_number": "15550491736", "phone_number_id": "112605838565124"}, "contacts": [{"profile": {"name": "Yilberth Andres"}, "wa_id": "573042115334"}], "messages": [{"from": "573042115334", "id": "wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggMUEwQUE0RkQyNEZBOEIwMDJBNkU0RDk4NjhFMkE0MkMA", "timestamp": "1700626921", "text": {"body": "."}, "type": "text"}]}, "field": "messages"}]}]' ),
( '61', 'Fallo websockets: (\'Error 11001 connecting to redis:6379. 11001.\',)' ),
( '62', 'Error peticion inicial: (\'Invalid request\',)' ),
( '63', 'Invalid request' );
COMMIT;
-- ---------------------------------------------------------


-- CREATE INDEX "archivos_created_by_id_45f66317_fk_auth_user_id" 
CREATE INDEX `archivos_created_by_id_45f66317_fk_auth_user_id` USING BTREE ON `archivos`( `created_by_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "archivos_updated_by_id_69a44904_fk_auth_user_id" 
CREATE INDEX `archivos_updated_by_id_69a44904_fk_auth_user_id` USING BTREE ON `archivos`( `updated_by_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" 
CREATE INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` USING BTREE ON `auth_group_permissions`( `permission_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "auth_user_groups_group_id_97559544_fk_auth_group_id" 
CREATE INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id` USING BTREE ON `auth_user_groups`( `group_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm" 
CREATE INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` USING BTREE ON `auth_user_user_permissions`( `permission_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "conversaciones_created_by_id_014c1b6c_fk_auth_user_id" 
CREATE INDEX `conversaciones_created_by_id_014c1b6c_fk_auth_user_id` USING BTREE ON `conversaciones`( `created_by_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "conversaciones_estado_id_f313842a_fk_maestras_id" 
CREATE INDEX `conversaciones_estado_id_f313842a_fk_maestras_id` USING BTREE ON `conversaciones`( `estado_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "conversaciones_updated_by_id_182bbfbc_fk_auth_user_id" 
CREATE INDEX `conversaciones_updated_by_id_182bbfbc_fk_auth_user_id` USING BTREE ON `conversaciones`( `updated_by_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "destinatarios_created_by_id_06bab4f5_fk_auth_user_id" 
CREATE INDEX `destinatarios_created_by_id_06bab4f5_fk_auth_user_id` USING BTREE ON `destinatarios`( `created_by_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "destinatarios_estado_id_6746a127_fk_maestras_id" 
CREATE INDEX `destinatarios_estado_id_6746a127_fk_maestras_id` USING BTREE ON `destinatarios`( `estado_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "destinatarios_updated_by_id_d4b37cc3_fk_auth_user_id" 
CREATE INDEX `destinatarios_updated_by_id_d4b37cc3_fk_auth_user_id` USING BTREE ON `destinatarios`( `updated_by_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "django_admin_log_content_type_id_c4bce8eb_fk_django_co" 
CREATE INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co` USING BTREE ON `django_admin_log`( `content_type_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "django_admin_log_user_id_c564eba6_fk_auth_user_id" 
CREATE INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id` USING BTREE ON `django_admin_log`( `user_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "django_celery_beat_p_clocked_id_47a69f82_fk_django_ce" 
CREATE INDEX `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` USING BTREE ON `django_celery_beat_periodictask`( `clocked_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "django_celery_beat_p_crontab_id_d3cba168_fk_django_ce" 
CREATE INDEX `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` USING BTREE ON `django_celery_beat_periodictask`( `crontab_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "django_celery_beat_p_interval_id_a8ca27da_fk_django_ce" 
CREATE INDEX `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` USING BTREE ON `django_celery_beat_periodictask`( `interval_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "django_celery_beat_p_solar_id_a87ce72c_fk_django_ce" 
CREATE INDEX `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` USING BTREE ON `django_celery_beat_periodictask`( `solar_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "django_session_expire_date_a5c62663" ----------
CREATE INDEX `django_session_expire_date_a5c62663` USING BTREE ON `django_session`( `expire_date` );-- -------------------------------------------------------------;


-- CREATE INDEX "maestras_created_by_id_0d5f633f_fk_auth_user_id" 
CREATE INDEX `maestras_created_by_id_0d5f633f_fk_auth_user_id` USING BTREE ON `maestras`( `created_by_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "maestras_padre_id_efdba410_fk_maestras_id" ----
CREATE INDEX `maestras_padre_id_efdba410_fk_maestras_id` USING BTREE ON `maestras`( `padre_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "maestras_updated_by_id_6785499a_fk_auth_user_id" 
CREATE INDEX `maestras_updated_by_id_6785499a_fk_auth_user_id` USING BTREE ON `maestras`( `updated_by_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "mensajeria_conversacion_id_id_2a3cd020" -------
CREATE INDEX `mensajeria_conversacion_id_id_2a3cd020` USING BTREE ON `mensajeria`( `conversacion_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "mensajeria_created_by_id_0660a5f4_fk_auth_user_id" 
CREATE INDEX `mensajeria_created_by_id_0660a5f4_fk_auth_user_id` USING BTREE ON `mensajeria`( `created_by_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "mensajeria_destinatario_id_d20046d0_fk_destinatarios_id" 
CREATE INDEX `mensajeria_destinatario_id_d20046d0_fk_destinatarios_id` USING BTREE ON `mensajeria`( `destinatario_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "mensajeria_estado_id_8bce68b8_fk_maestras_id" -
CREATE INDEX `mensajeria_estado_id_8bce68b8_fk_maestras_id` USING BTREE ON `mensajeria`( `estado_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "mensajeria_multimedia_id_id_5e0fdc45" ---------
CREATE INDEX `mensajeria_multimedia_id_id_5e0fdc45` USING BTREE ON `mensajeria`( `multimedia_id_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "mensajeria_tipo_id_226751bf_fk_maestras_id" ---
CREATE INDEX `mensajeria_tipo_id_226751bf_fk_maestras_id` USING BTREE ON `mensajeria`( `tipo_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "mensajeria_updated_by_id_9d97231f_fk_auth_user_id" 
CREATE INDEX `mensajeria_updated_by_id_9d97231f_fk_auth_user_id` USING BTREE ON `mensajeria`( `updated_by_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "modulos_created_by_id_682736db_fk_auth_user_id" 
CREATE INDEX `modulos_created_by_id_682736db_fk_auth_user_id` USING BTREE ON `modulos`( `created_by_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "modulos_dad_id_7911d8fa_fk_modulos_id" --------
CREATE INDEX `modulos_dad_id_7911d8fa_fk_modulos_id` USING BTREE ON `modulos`( `dad_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "modulos_estado_id_b131b6f8_fk_maestras_id" ----
CREATE INDEX `modulos_estado_id_b131b6f8_fk_maestras_id` USING BTREE ON `modulos`( `estado_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "modulos_updated_by_id_379626ca_fk_auth_user_id" 
CREATE INDEX `modulos_updated_by_id_379626ca_fk_auth_user_id` USING BTREE ON `modulos`( `updated_by_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "personas_ciudad_id_33741ae6_fk_maestras_id" ---
CREATE INDEX `personas_ciudad_id_33741ae6_fk_maestras_id` USING BTREE ON `personas`( `ciudad_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "personas_created_by_id_843eac77_fk_auth_user_id" 
CREATE INDEX `personas_created_by_id_843eac77_fk_auth_user_id` USING BTREE ON `personas`( `created_by_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "personas_departamento_id_57efcde3_fk_maestras_id" 
CREATE INDEX `personas_departamento_id_57efcde3_fk_maestras_id` USING BTREE ON `personas`( `departamento_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "personas_ocupacion_id_e546e79a_fk_maestras_id" 
CREATE INDEX `personas_ocupacion_id_e546e79a_fk_maestras_id` USING BTREE ON `personas`( `ocupacion_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "personas_pais_id_45bcdd53_fk_mensajeria_paises_id" 
CREATE INDEX `personas_pais_id_45bcdd53_fk_mensajeria_paises_id` USING BTREE ON `personas`( `pais_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "personas_sexo_id_05557b10_fk_maestras_id" -----
CREATE INDEX `personas_sexo_id_05557b10_fk_maestras_id` USING BTREE ON `personas`( `sexo_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "personas_tipoidentificacion_id_319d71c0_fk_maestras_id" 
CREATE INDEX `personas_tipoidentificacion_id_319d71c0_fk_maestras_id` USING BTREE ON `personas`( `tipoidentificacion_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "personas_updated_by_id_7e6ba61e_fk_auth_user_id" 
CREATE INDEX `personas_updated_by_id_7e6ba61e_fk_auth_user_id` USING BTREE ON `personas`( `updated_by_id` );-- -------------------------------------------------------------;


-- CREATE INDEX "personas_zona_id_0e8ab25d_fk_maestras_id" -----
CREATE INDEX `personas_zona_id_0e8ab25d_fk_maestras_id` USING BTREE ON `personas`( `zona_id` );-- -------------------------------------------------------------;


-- CREATE LINK "archivos_created_by_id_45f66317_fk_auth_user_id" 
ALTER TABLE `archivos`
	ADD CONSTRAINT `archivos_created_by_id_45f66317_fk_auth_user_id` FOREIGN KEY ( `created_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "archivos_updated_by_id_69a44904_fk_auth_user_id" 
ALTER TABLE `archivos`
	ADD CONSTRAINT `archivos_updated_by_id_69a44904_fk_auth_user_id` FOREIGN KEY ( `updated_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" 
ALTER TABLE `auth_group_permissions`
	ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY ( `group_id` )
	REFERENCES `auth_group`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" 
ALTER TABLE `auth_group_permissions`
	ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY ( `permission_id` )
	REFERENCES `auth_permission`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "auth_permission_content_type_id_2f476e4b_fk_django_co" 
ALTER TABLE `auth_permission`
	ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY ( `content_type_id` )
	REFERENCES `django_content_type`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "auth_user_groups_group_id_97559544_fk_auth_group_id" 
ALTER TABLE `auth_user_groups`
	ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY ( `group_id` )
	REFERENCES `auth_group`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id" 
ALTER TABLE `auth_user_groups`
	ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY ( `user_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id" 
ALTER TABLE `auth_user_user_permissions`
	ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY ( `user_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm" 
ALTER TABLE `auth_user_user_permissions`
	ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY ( `permission_id` )
	REFERENCES `auth_permission`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "conversaciones_created_by_id_014c1b6c_fk_auth_user_id" 
ALTER TABLE `conversaciones`
	ADD CONSTRAINT `conversaciones_created_by_id_014c1b6c_fk_auth_user_id` FOREIGN KEY ( `created_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "conversaciones_destinatario_id_db2d6e39_fk_destinatarios_id" 
ALTER TABLE `conversaciones`
	ADD CONSTRAINT `conversaciones_destinatario_id_db2d6e39_fk_destinatarios_id` FOREIGN KEY ( `destinatario_id` )
	REFERENCES `destinatarios`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "conversaciones_estado_id_f313842a_fk_maestras_id" 
ALTER TABLE `conversaciones`
	ADD CONSTRAINT `conversaciones_estado_id_f313842a_fk_maestras_id` FOREIGN KEY ( `estado_id` )
	REFERENCES `maestras`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "conversaciones_updated_by_id_182bbfbc_fk_auth_user_id" 
ALTER TABLE `conversaciones`
	ADD CONSTRAINT `conversaciones_updated_by_id_182bbfbc_fk_auth_user_id` FOREIGN KEY ( `updated_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "destinatarios_created_by_id_06bab4f5_fk_auth_user_id" 
ALTER TABLE `destinatarios`
	ADD CONSTRAINT `destinatarios_created_by_id_06bab4f5_fk_auth_user_id` FOREIGN KEY ( `created_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "destinatarios_estado_id_6746a127_fk_maestras_id" 
ALTER TABLE `destinatarios`
	ADD CONSTRAINT `destinatarios_estado_id_6746a127_fk_maestras_id` FOREIGN KEY ( `estado_id` )
	REFERENCES `maestras`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "destinatarios_persona_id_dda68fc7_fk_personas_id" 
ALTER TABLE `destinatarios`
	ADD CONSTRAINT `destinatarios_persona_id_dda68fc7_fk_personas_id` FOREIGN KEY ( `persona_id` )
	REFERENCES `personas`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "destinatarios_updated_by_id_d4b37cc3_fk_auth_user_id" 
ALTER TABLE `destinatarios`
	ADD CONSTRAINT `destinatarios_updated_by_id_d4b37cc3_fk_auth_user_id` FOREIGN KEY ( `updated_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "django_admin_log_content_type_id_c4bce8eb_fk_django_co" 
ALTER TABLE `django_admin_log`
	ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY ( `content_type_id` )
	REFERENCES `django_content_type`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "django_admin_log_user_id_c564eba6_fk_auth_user_id" 
ALTER TABLE `django_admin_log`
	ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY ( `user_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "django_celery_beat_p_clocked_id_47a69f82_fk_django_ce" 
ALTER TABLE `django_celery_beat_periodictask`
	ADD CONSTRAINT `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` FOREIGN KEY ( `clocked_id` )
	REFERENCES `django_celery_beat_clockedschedule`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "django_celery_beat_p_crontab_id_d3cba168_fk_django_ce" 
ALTER TABLE `django_celery_beat_periodictask`
	ADD CONSTRAINT `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` FOREIGN KEY ( `crontab_id` )
	REFERENCES `django_celery_beat_crontabschedule`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "django_celery_beat_p_interval_id_a8ca27da_fk_django_ce" 
ALTER TABLE `django_celery_beat_periodictask`
	ADD CONSTRAINT `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` FOREIGN KEY ( `interval_id` )
	REFERENCES `django_celery_beat_intervalschedule`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "django_celery_beat_p_solar_id_a87ce72c_fk_django_ce" 
ALTER TABLE `django_celery_beat_periodictask`
	ADD CONSTRAINT `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` FOREIGN KEY ( `solar_id` )
	REFERENCES `django_celery_beat_solarschedule`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "maestras_created_by_id_0d5f633f_fk_auth_user_id" 
ALTER TABLE `maestras`
	ADD CONSTRAINT `maestras_created_by_id_0d5f633f_fk_auth_user_id` FOREIGN KEY ( `created_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "maestras_padre_id_efdba410_fk_maestras_id" -----
ALTER TABLE `maestras`
	ADD CONSTRAINT `maestras_padre_id_efdba410_fk_maestras_id` FOREIGN KEY ( `padre_id` )
	REFERENCES `maestras`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "maestras_updated_by_id_6785499a_fk_auth_user_id" 
ALTER TABLE `maestras`
	ADD CONSTRAINT `maestras_updated_by_id_6785499a_fk_auth_user_id` FOREIGN KEY ( `updated_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "mensajeria_conversacion_id_92157ae1_fk_conversaciones_id" 
ALTER TABLE `mensajeria`
	ADD CONSTRAINT `mensajeria_conversacion_id_92157ae1_fk_conversaciones_id` FOREIGN KEY ( `conversacion_id` )
	REFERENCES `conversaciones`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "mensajeria_created_by_id_0660a5f4_fk_auth_user_id" 
ALTER TABLE `mensajeria`
	ADD CONSTRAINT `mensajeria_created_by_id_0660a5f4_fk_auth_user_id` FOREIGN KEY ( `created_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "mensajeria_destinatario_id_d20046d0_fk_destinatarios_id" 
ALTER TABLE `mensajeria`
	ADD CONSTRAINT `mensajeria_destinatario_id_d20046d0_fk_destinatarios_id` FOREIGN KEY ( `destinatario_id` )
	REFERENCES `destinatarios`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "mensajeria_estado_id_8bce68b8_fk_maestras_id" --
ALTER TABLE `mensajeria`
	ADD CONSTRAINT `mensajeria_estado_id_8bce68b8_fk_maestras_id` FOREIGN KEY ( `estado_id` )
	REFERENCES `maestras`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "mensajeria_multimedia_id_id_5e0fdc45_fk_archivos_id" 
ALTER TABLE `mensajeria`
	ADD CONSTRAINT `mensajeria_multimedia_id_id_5e0fdc45_fk_archivos_id` FOREIGN KEY ( `multimedia_id_id` )
	REFERENCES `archivos`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "mensajeria_tipo_id_226751bf_fk_maestras_id" ----
ALTER TABLE `mensajeria`
	ADD CONSTRAINT `mensajeria_tipo_id_226751bf_fk_maestras_id` FOREIGN KEY ( `tipo_id` )
	REFERENCES `maestras`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "mensajeria_updated_by_id_9d97231f_fk_auth_user_id" 
ALTER TABLE `mensajeria`
	ADD CONSTRAINT `mensajeria_updated_by_id_9d97231f_fk_auth_user_id` FOREIGN KEY ( `updated_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "modulos_created_by_id_682736db_fk_auth_user_id" 
ALTER TABLE `modulos`
	ADD CONSTRAINT `modulos_created_by_id_682736db_fk_auth_user_id` FOREIGN KEY ( `created_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "modulos_dad_id_7911d8fa_fk_modulos_id" ---------
ALTER TABLE `modulos`
	ADD CONSTRAINT `modulos_dad_id_7911d8fa_fk_modulos_id` FOREIGN KEY ( `dad_id` )
	REFERENCES `modulos`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "modulos_estado_id_b131b6f8_fk_maestras_id" -----
ALTER TABLE `modulos`
	ADD CONSTRAINT `modulos_estado_id_b131b6f8_fk_maestras_id` FOREIGN KEY ( `estado_id` )
	REFERENCES `maestras`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "modulos_updated_by_id_379626ca_fk_auth_user_id" 
ALTER TABLE `modulos`
	ADD CONSTRAINT `modulos_updated_by_id_379626ca_fk_auth_user_id` FOREIGN KEY ( `updated_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "personas_ciudad_id_33741ae6_fk_maestras_id" ----
ALTER TABLE `personas`
	ADD CONSTRAINT `personas_ciudad_id_33741ae6_fk_maestras_id` FOREIGN KEY ( `ciudad_id` )
	REFERENCES `maestras`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "personas_created_by_id_843eac77_fk_auth_user_id" 
ALTER TABLE `personas`
	ADD CONSTRAINT `personas_created_by_id_843eac77_fk_auth_user_id` FOREIGN KEY ( `created_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "personas_departamento_id_57efcde3_fk_maestras_id" 
ALTER TABLE `personas`
	ADD CONSTRAINT `personas_departamento_id_57efcde3_fk_maestras_id` FOREIGN KEY ( `departamento_id` )
	REFERENCES `maestras`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "personas_ocupacion_id_e546e79a_fk_maestras_id" -
ALTER TABLE `personas`
	ADD CONSTRAINT `personas_ocupacion_id_e546e79a_fk_maestras_id` FOREIGN KEY ( `ocupacion_id` )
	REFERENCES `maestras`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "personas_pais_id_45bcdd53_fk_mensajeria_paises_id" 
ALTER TABLE `personas`
	ADD CONSTRAINT `personas_pais_id_45bcdd53_fk_mensajeria_paises_id` FOREIGN KEY ( `pais_id` )
	REFERENCES `paises`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "personas_sexo_id_05557b10_fk_maestras_id" ------
ALTER TABLE `personas`
	ADD CONSTRAINT `personas_sexo_id_05557b10_fk_maestras_id` FOREIGN KEY ( `sexo_id` )
	REFERENCES `maestras`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "personas_tipoidentificacion_id_319d71c0_fk_maestras_id" 
ALTER TABLE `personas`
	ADD CONSTRAINT `personas_tipoidentificacion_id_319d71c0_fk_maestras_id` FOREIGN KEY ( `tipoidentificacion_id` )
	REFERENCES `maestras`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "personas_updated_by_id_7e6ba61e_fk_auth_user_id" 
ALTER TABLE `personas`
	ADD CONSTRAINT `personas_updated_by_id_7e6ba61e_fk_auth_user_id` FOREIGN KEY ( `updated_by_id` )
	REFERENCES `auth_user`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


-- CREATE LINK "personas_zona_id_0e8ab25d_fk_maestras_id" ------
ALTER TABLE `personas`
	ADD CONSTRAINT `personas_zona_id_0e8ab25d_fk_maestras_id` FOREIGN KEY ( `zona_id` )
	REFERENCES `maestras`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;-- -------------------------------------------------------------;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------

