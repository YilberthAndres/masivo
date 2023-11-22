-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: db
-- Tiempo de generación: 22-11-2023 a las 22:29:40
-- Versión del servidor: 8.2.0
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `masiva`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos`
--

CREATE TABLE `archivos` (
  `id` bigint NOT NULL,
  `nombre` varchar(650) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `descripcion` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tipo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `formato` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dir` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int DEFAULT NULL,
  `file` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `archivos`
--

INSERT INTO `archivos` (`id`, `nombre`, `descripcion`, `tipo`, `formato`, `dir`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`, `file`) VALUES
(43, 'archivo 1', '', 'image', '', '', '2023-11-18 16:32:39', '2023-11-18 16:32:39', 2, NULL, 'mesagge/multimedia/test.png'),
(44, 's1', '', 'audio', '', '', '2023-11-19 02:47:03', '2023-11-19 02:47:03', 2, NULL, 'mesagge/multimedia/sound-1-167181_WU9fLNO.mp3'),
(45, 's2', '', 'image', '', '', '2023-11-19 02:50:25', '2023-11-19 02:50:25', 2, NULL, 'mesagge/multimedia/pdf.jpeg'),
(46, 'pdf test', '', 'document', '', '', '2023-11-19 18:22:06', '2023-11-19 18:22:06', 2, NULL, 'mesagge/multimedia/prueba.pdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add destinatarios', 7, 'add_destinatarios'),
(26, 'Can change destinatarios', 7, 'change_destinatarios'),
(27, 'Can delete destinatarios', 7, 'delete_destinatarios'),
(28, 'Can view destinatarios', 7, 'view_destinatarios'),
(29, 'Can add archivos', 8, 'add_archivos'),
(30, 'Can change archivos', 8, 'change_archivos'),
(31, 'Can delete archivos', 8, 'delete_archivos'),
(32, 'Can view archivos', 8, 'view_archivos'),
(33, 'Can add maestra', 9, 'add_maestras'),
(34, 'Can change maestra', 9, 'change_maestras'),
(35, 'Can delete maestra', 9, 'delete_maestras'),
(36, 'Can view maestra', 9, 'view_maestras'),
(37, 'Can add persona', 10, 'add_personas'),
(38, 'Can change persona', 10, 'change_personas'),
(39, 'Can delete persona', 10, 'delete_personas'),
(40, 'Can view persona', 10, 'view_personas'),
(41, 'Can add modulos', 11, 'add_modulos'),
(42, 'Can change modulos', 11, 'change_modulos'),
(43, 'Can delete modulos', 11, 'delete_modulos'),
(44, 'Can view modulos', 11, 'view_modulos'),
(45, 'Can add mensajeria', 12, 'add_mensajeria'),
(46, 'Can change mensajeria', 12, 'change_mensajeria'),
(47, 'Can delete mensajeria', 12, 'delete_mensajeria'),
(48, 'Can view mensajeria', 12, 'view_mensajeria'),
(49, 'Can add chat group', 13, 'add_chatgroup'),
(50, 'Can change chat group', 13, 'change_chatgroup'),
(51, 'Can delete chat group', 13, 'delete_chatgroup'),
(52, 'Can view chat group', 13, 'view_chatgroup'),
(53, 'Can add peticion', 14, 'add_peticion'),
(54, 'Can change peticion', 14, 'change_peticion'),
(55, 'Can delete peticion', 14, 'delete_peticion'),
(56, 'Can view peticion', 14, 'view_peticion'),
(57, 'Can add crontab', 15, 'add_crontabschedule'),
(58, 'Can change crontab', 15, 'change_crontabschedule'),
(59, 'Can delete crontab', 15, 'delete_crontabschedule'),
(60, 'Can view crontab', 15, 'view_crontabschedule'),
(61, 'Can add interval', 16, 'add_intervalschedule'),
(62, 'Can change interval', 16, 'change_intervalschedule'),
(63, 'Can delete interval', 16, 'delete_intervalschedule'),
(64, 'Can view interval', 16, 'view_intervalschedule'),
(65, 'Can add periodic task', 17, 'add_periodictask'),
(66, 'Can change periodic task', 17, 'change_periodictask'),
(67, 'Can delete periodic task', 17, 'delete_periodictask'),
(68, 'Can view periodic task', 17, 'view_periodictask'),
(69, 'Can add periodic tasks', 18, 'add_periodictasks'),
(70, 'Can change periodic tasks', 18, 'change_periodictasks'),
(71, 'Can delete periodic tasks', 18, 'delete_periodictasks'),
(72, 'Can view periodic tasks', 18, 'view_periodictasks'),
(73, 'Can add solar event', 19, 'add_solarschedule'),
(74, 'Can change solar event', 19, 'change_solarschedule'),
(75, 'Can delete solar event', 19, 'delete_solarschedule'),
(76, 'Can view solar event', 19, 'view_solarschedule'),
(77, 'Can add clocked', 20, 'add_clockedschedule'),
(78, 'Can change clocked', 20, 'change_clockedschedule'),
(79, 'Can delete clocked', 20, 'delete_clockedschedule'),
(80, 'Can view clocked', 20, 'view_clockedschedule'),
(81, 'Can add conversaciones', 21, 'add_conversaciones'),
(82, 'Can change conversaciones', 21, 'change_conversaciones'),
(83, 'Can delete conversaciones', 21, 'delete_conversaciones'),
(84, 'Can view conversaciones', 21, 'view_conversaciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$YSt3G4t8LO9eDvUmqNVP3Y$R6j+6JxH0+8xJNMlDrjSknbrvtpn1GbTjtR1gD6rVeU=', '2023-08-05 18:11:18', 0, 'admin@gmail.com', '', '', '', 0, 1, '2023-07-14 13:31:39'),
(2, 'pbkdf2_sha256$390000$B8HR33eUHC36mYEd7Y40cP$CbL2z9NyBbG8VxFK1sYOZAavk9mpOH5OYF/L9sHTypc=', NULL, 0, 'admin2', '', '', '', 0, 1, '2023-11-08 17:28:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conversaciones`
--

CREATE TABLE `conversaciones` (
  `id` bigint NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by_id` int NOT NULL,
  `destinatario_id` bigint DEFAULT NULL,
  `estado_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `conversaciones`
--

INSERT INTO `conversaciones` (`id`, `created_at`, `updated_at`, `created_by_id`, `destinatario_id`, `estado_id`, `updated_by_id`) VALUES
(3, '2023-11-12 23:14:39', '2023-11-20 20:27:54', 2, 3781, 758, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destinatarios`
--

CREATE TABLE `destinatarios` (
  `id` bigint NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by_id` int NOT NULL,
  `updated_by_id` int DEFAULT NULL,
  `persona_id` bigint DEFAULT NULL,
  `estado_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `destinatarios`
--

INSERT INTO `destinatarios` (`id`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`, `persona_id`, `estado_id`) VALUES
(3780, '2023-07-18 00:06:27', '2023-07-18 00:06:27', 1, NULL, 2937, 596),
(3781, '2023-07-19 16:03:05', '2023-07-19 16:03:05', 1, NULL, 2938, 596);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_celery_beat_clockedschedule`
--

CREATE TABLE `django_celery_beat_clockedschedule` (
  `id` int NOT NULL,
  `clocked_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_celery_beat_crontabschedule`
--

CREATE TABLE `django_celery_beat_crontabschedule` (
  `id` int NOT NULL,
  `minute` varchar(240) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `hour` varchar(96) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `day_of_week` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `day_of_month` varchar(124) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `month_of_year` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `timezone` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_celery_beat_intervalschedule`
--

CREATE TABLE `django_celery_beat_intervalschedule` (
  `id` int NOT NULL,
  `every` int NOT NULL,
  `period` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_celery_beat_periodictask`
--

CREATE TABLE `django_celery_beat_periodictask` (
  `id` int NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `task` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `args` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `kwargs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `queue` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `exchange` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `routing_key` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime DEFAULT NULL,
  `total_run_count` int UNSIGNED NOT NULL,
  `date_changed` datetime NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `crontab_id` int DEFAULT NULL,
  `interval_id` int DEFAULT NULL,
  `solar_id` int DEFAULT NULL,
  `one_off` tinyint(1) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `priority` int UNSIGNED DEFAULT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `clocked_id` int DEFAULT NULL,
  `expire_seconds` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_celery_beat_periodictasks`
--

CREATE TABLE `django_celery_beat_periodictasks` (
  `ident` smallint NOT NULL,
  `last_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_celery_beat_solarschedule`
--

CREATE TABLE `django_celery_beat_solarschedule` (
  `id` int NOT NULL,
  `event` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(20, 'django_celery_beat', 'clockedschedule'),
(15, 'django_celery_beat', 'crontabschedule'),
(16, 'django_celery_beat', 'intervalschedule'),
(17, 'django_celery_beat', 'periodictask'),
(18, 'django_celery_beat', 'periodictasks'),
(19, 'django_celery_beat', 'solarschedule'),
(8, 'mensajeria', 'archivos'),
(13, 'mensajeria', 'chatgroup'),
(21, 'mensajeria', 'conversaciones'),
(7, 'mensajeria', 'destinatarios'),
(9, 'mensajeria', 'maestras'),
(12, 'mensajeria', 'mensajeria'),
(11, 'mensajeria', 'modulos'),
(10, 'mensajeria', 'personas'),
(14, 'mensajeria', 'peticion'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-07-14 13:30:40'),
(2, 'auth', '0001_initial', '2023-07-14 13:30:40'),
(3, 'admin', '0001_initial', '2023-07-14 13:30:40'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-07-14 13:30:40'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-07-14 13:30:40'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-07-14 13:30:40'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-07-14 13:30:40'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-07-14 13:30:40'),
(9, 'auth', '0004_alter_user_username_opts', '2023-07-14 13:30:40'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-07-14 13:30:40'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-07-14 13:30:40'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-07-14 13:30:40'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-07-14 13:30:41'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-07-14 13:30:41'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-07-14 13:30:41'),
(16, 'auth', '0011_update_proxy_permissions', '2023-07-14 13:30:41'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-07-14 13:30:42'),
(18, 'mensajeria', '0001_initial', '2023-07-14 13:30:42'),
(19, 'sessions', '0001_initial', '2023-07-14 13:30:42'),
(20, 'mensajeria', '0002_maestras_remove_destinatarios_celular_and_more', '2023-07-16 02:11:54'),
(21, 'mensajeria', '0003_alter_personas_identificacion_alter_personas_sexo_and_more', '2023-07-16 02:14:19'),
(22, 'mensajeria', '0004_destinatarios_estado', '2023-07-16 04:07:33'),
(23, 'mensajeria', '0005_chatgroup', '2023-07-16 14:29:55'),
(24, 'mensajeria', '0006_delete_chatgroup', '2023-07-16 14:32:30'),
(25, 'mensajeria', '0007_alter_mensajeria_celular_and_more', '2023-07-17 01:11:01'),
(26, 'mensajeria', '0008_mensajeria_destinatarios_id', '2023-07-17 01:13:54'),
(27, 'mensajeria', '0009_rename_destinatarios_id_mensajeria_destinatario', '2023-07-17 01:14:37'),
(28, 'mensajeria', '0010_peticion', '2023-07-17 01:45:31'),
(29, 'mensajeria', '0011_alter_peticion_estado', '2023-07-17 03:10:55'),
(30, 'mensajeria', '0012_mensajeria_texto', '2023-07-17 03:19:44'),
(31, 'mensajeria', '0013_mensajeria_tipo', '2023-07-17 22:16:35'),
(32, 'mensajeria', '0014_mensajeria_multimedia', '2023-07-17 22:22:55'),
(33, 'mensajeria', '0015_rename_multimedia_mensajeria_sha256_and_more', '2023-07-17 22:38:54'),
(34, 'mensajeria', '0016_mensajeria_mime_type_alter_mensajeria_multimedia_id_and_more', '2023-07-17 22:46:01'),
(35, 'django_celery_beat', '0001_initial', '2023-07-19 15:39:44'),
(36, 'django_celery_beat', '0002_auto_20161118_0346', '2023-07-19 15:39:44'),
(37, 'django_celery_beat', '0003_auto_20161209_0049', '2023-07-19 15:39:44'),
(38, 'django_celery_beat', '0004_auto_20170221_0000', '2023-07-19 15:39:44'),
(39, 'django_celery_beat', '0005_add_solarschedule_events_choices', '2023-07-19 15:39:44'),
(40, 'django_celery_beat', '0006_auto_20180322_0932', '2023-07-19 15:39:44'),
(41, 'django_celery_beat', '0007_auto_20180521_0826', '2023-07-19 15:39:44'),
(42, 'django_celery_beat', '0008_auto_20180914_1922', '2023-07-19 15:39:44'),
(43, 'django_celery_beat', '0006_auto_20180210_1226', '2023-07-19 15:39:44'),
(44, 'django_celery_beat', '0006_periodictask_priority', '2023-07-19 15:39:45'),
(45, 'django_celery_beat', '0009_periodictask_headers', '2023-07-19 15:39:45'),
(46, 'django_celery_beat', '0010_auto_20190429_0326', '2023-07-19 15:39:45'),
(47, 'django_celery_beat', '0011_auto_20190508_0153', '2023-07-19 15:39:45'),
(48, 'django_celery_beat', '0012_periodictask_expire_seconds', '2023-07-19 15:39:45'),
(49, 'django_celery_beat', '0013_auto_20200609_0727', '2023-07-19 15:39:45'),
(50, 'django_celery_beat', '0014_remove_clockedschedule_enabled', '2023-07-19 15:39:45'),
(51, 'django_celery_beat', '0015_edit_solarschedule_events_choices', '2023-07-19 15:39:45'),
(52, 'django_celery_beat', '0016_alter_crontabschedule_timezone', '2023-07-19 15:39:45'),
(53, 'django_celery_beat', '0017_alter_crontabschedule_month_of_year', '2023-07-19 15:39:45'),
(54, 'django_celery_beat', '0018_improve_crontab_helptext', '2023-07-19 15:39:45'),
(55, 'mensajeria', '0017_rename_timestamp_mensajeria_timestamp_w', '2023-07-19 20:58:54'),
(56, 'mensajeria', '0018_mensajeria_link', '2023-07-22 18:05:51'),
(57, 'mensajeria', '0019_mensajeria_filename', '2023-07-29 20:42:48'),
(58, 'mensajeria', '0020_mensajeria_voice', '2023-07-29 22:51:56'),
(59, 'mensajeria', '0021_alter_mensajeria_voice', '2023-07-29 22:53:43'),
(60, 'mensajeria', '0022_mensajeria_context_from_mensajeria_context_id', '2023-07-30 15:19:32'),
(61, 'mensajeria', '0023_conversaciones', '2023-08-05 18:09:48'),
(62, 'mensajeria', '0024_alter_mensajeria_conversacion_id', '2023-08-05 18:23:18'),
(63, 'mensajeria', '0025_rename_conversacion_id_mensajeria_conversacion', '2023-08-05 18:38:56'),
(64, 'mensajeria', '0026_alter_destinatarios_persona', '2023-08-05 18:43:41'),
(65, 'mensajeria', '0027_alter_conversaciones_destinatario', '2023-08-05 18:44:00'),
(66, 'mensajeria', '0028_alter_personas_telefonomovil_and_more', '2023-08-05 19:08:24'),
(67, 'mensajeria', '0029_archivos_file', '2023-11-16 20:13:42'),
(68, 'mensajeria', '0030_alter_archivos_file_alter_mensajeria_multimedia_id', '2023-11-19 02:37:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('d2cpnya08au5hvn1e71paahed6ie0rhm', '.eJxVjDkOwjAUBe_iGlnenVDScwbLfzEOIEeKkwpxd4iUAto3M-8lUt7WmrbOS5pInIUWp98NMj647YDuud1miXNblwnkrsiDdnmdiZ-Xw_07qLnXbz2yN8WAhxzI8qBLQRcBvGIb9cCaOCqMENgFO1pUCA4LU1FgvArBiPcHAoc4iw:1qMrZf:4Mdum-KyBOnXleZSVl9ltu874KpIOJvcy9T2Tb9cPiY', '2023-08-04 14:57:44'),
('fqa3x308fczyzsl9nvln946fdxddch9v', '.eJxVjDkOwjAUBe_iGlnenVDScwbLfzEOIEeKkwpxd4iUAto3M-8lUt7WmrbOS5pInIUWp98NMj647YDuud1miXNblwnkrsiDdnmdiZ-Xw_07qLnXbz2yN8WAhxzI8qBLQRcBvGIb9cCaOCqMENgFO1pUCA4LU1FgvArBiPcHAoc4iw:1qSLkD:_0r3nZbYhYPHQ7QwASq6PylRdx7xkFf51JgJhlqJoYs', '2023-08-19 18:11:18'),
('rj2kcpd6fcsgpol15vebuvjh7omm25tj', '.eJxVjDkOwjAUBe_iGlnenVDScwbLfzEOIEeKkwpxd4iUAto3M-8lUt7WmrbOS5pInIUWp98NMj647YDuud1miXNblwnkrsiDdnmdiZ-Xw_07qLnXbz2yN8WAhxzI8qBLQRcBvGIb9cCaOCqMENgFO1pUCA4LU1FgvArBiPcHAoc4iw:1qMqvZ:QVkU4F05ZImercs6nb8_uJ8H1R6ueFdVItLh5TfGF9w', '2023-08-04 14:16:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestras`
--

CREATE TABLE `maestras` (
  `id` int NOT NULL,
  `codigo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nombre` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `jerarquia` int DEFAULT NULL,
  `orden` int DEFAULT NULL,
  `visible` int DEFAULT NULL,
  `observacion` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` bigint DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `padre_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `maestras`
--

INSERT INTO `maestras` (`id`, `codigo`, `nombre`, `jerarquia`, `orden`, `visible`, `observacion`, `created_at`, `updated_at`, `deleted_at`, `deleted_by`, `created_by_id`, `padre_id`, `updated_by_id`) VALUES
(1, 'LIS_TIPOTABLAS', 'TIPOS DE TABLAS', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 1, NULL),
(2, 'LIS_MODULOS', 'MODULOS', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 1, NULL),
(3, 'LIS_ROLES', 'ROLES', 2, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 1, NULL),
(4, 'LIS_VISTAS', 'VISTAS', 3, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 1, NULL),
(5, 'LIS_PERFILES', 'PERFILES', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 1, NULL),
(6, NULL, 'SEGURIDAD', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 2, NULL),
(7, NULL, 'ADMINISTRADOR', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 5, NULL),
(8, 'LIS_TIPOSIDENTIFICACIONES', 'TIPOS DE IDENTIFICACIONES', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 1, NULL),
(9, 'TI', 'TARJETA DE IDENTIDAD', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 8, NULL),
(10, 'CC', 'CEDULA DE CIUDADANIA', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 8, NULL),
(11, 'NI', 'NIT', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 8, NULL),
(12, 'MS', 'MENOR SIN IDENTIFICACION', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 8, NULL),
(13, 'AS', 'ADULTO SIN IDENTIFICACION', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 8, NULL),
(14, 'CE', 'CEDULA DE EXTRANJERIA', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 8, NULL),
(15, 'RC', 'REGISTRO CIVIL', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 8, NULL),
(16, 'LIS_TIPOSCONTRATOS', 'TIPOS CONTRATOS', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 1, NULL),
(17, '1', 'CAPITADO', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 16, NULL),
(18, '2', 'POR EVENTO', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 16, NULL),
(19, '3', 'POR CASO', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 16, NULL),
(20, 'LIS_SEXOS', 'SEXOS', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 1, NULL),
(21, 'M', 'MASCULINO', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 20, NULL),
(22, 'F', 'FEMENINO', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 20, NULL),
(23, 'ND', 'NO DEFINIDO', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 20, NULL),
(24, 'LIS_ESTADOSCIVILES', 'ESTADOS CIVILES', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 1, NULL),
(25, NULL, 'SOLTERO', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 24, NULL),
(26, NULL, 'CASADO', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 24, NULL),
(27, NULL, 'UNION LIBRE', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 24, NULL),
(28, NULL, 'DIVORCIADO', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 24, NULL),
(29, NULL, 'VIUDO', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 24, NULL),
(30, 'LIS_CARGOS', 'CARGOS', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 1, NULL),
(31, NULL, 'GERENTE', NULL, NULL, NULL, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 30, NULL),
(32, NULL, 'VENDEDOR', NULL, NULL, NULL, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 30, NULL),
(33, NULL, 'INVENTARIO', NULL, NULL, NULL, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 30, NULL),
(34, NULL, 'CLIENTE', NULL, NULL, NULL, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 30, NULL),
(35, NULL, 'AUXILIAR', NULL, NULL, NULL, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 30, NULL),
(36, NULL, 'OTRO', NULL, NULL, NULL, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 30, NULL),
(37, 'LIS_TIPOSANGRE', 'TIPOS DE SANGRE', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 1, NULL),
(38, NULL, 'A', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 37, NULL),
(39, NULL, 'B', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 37, NULL),
(40, NULL, 'O', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 37, NULL),
(41, NULL, 'AB', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 37, NULL),
(42, 'LIS_RH', 'RH', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 1, NULL),
(43, 'POSITIVO', '+', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 42, NULL),
(44, 'NEGATIVO', '-', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 42, NULL),
(45, 'LIS_NIVELESEDUCATIVOS', 'NIVELES EDUCATIVOS', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 1, NULL),
(46, NULL, 'PRIMARIA', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 45, NULL),
(47, NULL, 'SECUNDARIA', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 45, NULL),
(48, NULL, 'MEDIA TECNICA', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 45, NULL),
(49, NULL, 'TECNICO', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 45, NULL),
(50, NULL, 'UNIVERSITARIO', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 45, NULL),
(51, NULL, 'OTRO', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 45, NULL),
(52, NULL, 'NO DEFINIDO (NINGUNO)', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 45, NULL),
(53, 'LIS_ETNIAS', 'ETNIAS', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 1, NULL),
(54, NULL, 'INDIGENA', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 53, NULL),
(55, NULL, 'ROM (GITANO)', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 53, NULL),
(56, NULL, 'RAIZAL (ARCHIPIELAGO DE SAN ANDRES Y PROVIDENCIA)', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 53, NULL),
(57, NULL, 'NINGUNO DE LOS ANTERIORES', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 53, NULL),
(58, 'LIS_RELIGIONES', 'RELIGIONES', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 1, NULL),
(59, NULL, 'CATOLICA', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 59, NULL),
(60, NULL, 'EVANGELICA', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 59, NULL),
(61, NULL, 'PROTESTANTE', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 59, NULL),
(62, NULL, 'NO SE TIENE INFORMACION', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 59, NULL),
(63, 'LIS_GRUPOSPOBLACIONALES', 'GRUPOS POBLACIONALES', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 1, NULL),
(64, NULL, 'HABITANTE DE LA CALLE', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 64, NULL),
(65, NULL, 'POBLACION INFANTIL A CARGO DEL ICBF', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 64, NULL),
(66, NULL, 'MADRES COMUNITARIAS', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 64, NULL),
(67, NULL, 'CREADOR O GESTOR CULTURAL', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 64, NULL),
(68, NULL, 'POBLACION SISBENIZADA', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 64, NULL),
(69, NULL, 'MENORES DESVINCULADOS DEL CONFICTO ARMADO', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 64, NULL),
(70, NULL, 'POBLACION DISCAPACITADA', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 64, NULL),
(71, NULL, 'POBLACION DESMOVILIZADA', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 64, NULL),
(72, NULL, 'POBLACION EN CONDICION DE DESPLAZAMIENTO FORZADO', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 64, NULL),
(73, NULL, 'POBLACION INFANTIL VULNERABLE', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 64, NULL),
(74, NULL, 'PROGRAMA EN PROTECCION A TESTIGOS', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 64, NULL),
(75, NULL, 'POBLACION EN CENTROS PSIQUIATRICOS', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 64, NULL),
(76, NULL, 'POBLACION RURAL MIGRATORIA', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 64, NULL),
(77, NULL, 'POBLACION RECLUSA', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 64, NULL),
(78, NULL, 'POBLACION RURAL NO MIGRATORIA', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 64, NULL),
(79, NULL, 'COMUNIDADES INDIGENAS', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 64, NULL),
(80, NULL, 'ROM (GITANOS)', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 64, NULL),
(81, NULL, 'NEGRO MULATO AFROCOLOMBIANO O AFRODESCENDIENTE', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 64, NULL),
(82, NULL, 'PALENQUERO DE SAN BACILIO', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 64, NULL),
(83, NULL, 'POBLACION CARCELARIA DEL INPEC', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 64, NULL),
(84, 'LIS_OCUPACONES', 'OCUPACIONES', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 1, NULL),
(85, NULL, 'NO TENGO INFORMACION', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(86, NULL, 'FUERZAS MILITARES', 2, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(87, NULL, 'OFICIALES DE LAS FUERZAS MILITARES', 3, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(88, NULL, 'Oficiales de las Fuerzas Militares', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(89, NULL, 'Oficiales de las Fuerzas Militares', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(90, NULL, 'SUBOFICIALES DE LAS FUERZAS MILITARES', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(91, NULL, 'Suboficiales de las Fuerzas Militares', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(92, NULL, 'Suboficiales de las Fuerzas Militares', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(93, NULL, 'OTROS MIEMBROS DE LAS FUERZAS MILITARES', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(94, NULL, 'Otros miembros de las Fuerzas Militares', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(95, NULL, 'Otros miembros de las Fuerzas Militares', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(96, NULL, 'DIRECTORES Y GERENTES', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(97, NULL, 'Directores formuladores de políticas y normas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(98, NULL, 'Directores del gobierno', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(99, NULL, 'Jefes de comunidades étnicas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(100, NULL, 'Directores y gerentes generales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(101, NULL, 'Directores y gerentes generales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(102, NULL, 'DIRECTORES ADMINISTRATIVOS Y COMERCIALES', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(103, NULL, 'Directores de administración y servicios', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(104, NULL, 'Directores financieros', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(105, NULL, 'Directores de recursos humanos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(106, NULL, 'Directores de políticas y planeación', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(107, NULL, 'Directores de ventas y comercialización', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(108, NULL, 'Directores de publicidad y relaciones públicas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(109, NULL, 'Directores de investigación y desarrollo', NULL, NULL, NULL, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(110, NULL, 'Directores de producción de piscicultura y pesca', NULL, NULL, NULL, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(111, NULL, 'Directores de industrias manufactureras', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(112, NULL, 'Directores de explotaciones de minería', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(113, NULL, 'Directores de empresas de construcción', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(114, NULL, 'Directores  y gerentes de servicios profesionales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(115, NULL, 'Directores de servicios de cuidados infantiles', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(116, NULL, 'Directores de servicios de salud', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(117, NULL, 'Directores  de servicios de bienestar social', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(118, NULL, 'Directores de servicios de educación', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(119, NULL, 'Gerentes de hoteles y restaurantes', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(120, NULL, 'Gerentes de hoteles', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(121, NULL, 'Gerentes de restaurantes', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(122, NULL, 'Gerentes de comercios al por mayor y al por menor', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(123, NULL, 'Gerentes de comercios al por mayor y al por menor', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(124, NULL, 'Otros gerentes de servicios', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(125, NULL, 'PROFESIONALES, CIENTÍFICOS E INTELECTUALES', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(126, NULL, 'PROFESIONALES DE LAS CIENCIAS Y DE LA INGENIERÍA', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(127, NULL, 'Físicos, químicos y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(128, NULL, 'Físicos y astrónomos ', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(129, NULL, 'Meteorólogos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(130, NULL, 'Químicos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(131, NULL, 'Geólogos y geofísicos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(132, NULL, 'Matemáticos, actuarios y estadísticos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(133, NULL, 'Matemáticos, actuarios y estadísticos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(134, NULL, 'Profesionales en ciencias biológicas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(135, NULL, 'Biólogos, botánicos, zoólogos y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(136, NULL, 'Agrónomos, silvicultores, zootecnistas y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(137, NULL, 'Profesionales de la protección medioambiental', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(138, NULL, 'Ingenieros industriales y de producción', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(139, NULL, 'Ingenieros civiles', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(140, NULL, 'Ingenieros medioambientales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(141, NULL, 'Ingenieros mecánicos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(142, NULL, 'Ingenieros químicos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(143, NULL, 'Ingenieros de minas, metalúrgicos y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(144, NULL, 'Ingenieros en electrotecnología', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(145, NULL, 'Ingenieros electricistas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(146, NULL, 'Ingenieros electrónicos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(147, NULL, 'Ingenieros de telecomunicaciones', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(148, NULL, 'Arquitectos constructores', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(149, NULL, 'Arquitectos paisajistas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(150, NULL, 'Diseñadores de productos y de prendas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(151, NULL, 'Planificadores urbanos, regionales y de tránsito', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(152, NULL, 'Cartógrafos y topógrafos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(153, NULL, 'Diseñadores gráficos y multimedia', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(154, NULL, 'PROFESIONALES DE LA SALUD', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(155, NULL, 'Médicos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(156, NULL, 'Médicos generales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(157, NULL, 'Médicos especialistas ', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(158, NULL, 'Profesionales de enfermería y de partería', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(159, NULL, 'Profesionales de enfermería', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(160, NULL, 'Profesionales de partería', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(161, NULL, 'Paramédicos e instrumentadores quirúrgicos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(162, NULL, 'Paramédicos e instrumentadores quirúrgicos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(163, NULL, 'Veterinarios', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(164, NULL, 'Veterinarios', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(165, NULL, 'Otros profesionales de la salud', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(166, NULL, 'Odontólogos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(167, NULL, 'Farmacéuticos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(168, NULL, 'Fisioterapeutas ', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(169, NULL, 'Dietistas y nutricionistas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(170, NULL, 'Fonoaudiólogos y terapeutas del lenguaje', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(171, NULL, 'Optómetras', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(172, NULL, 'PROFESIONALES DE LA EDUCACIÓN', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(173, NULL, 'Profesores de instituciones de educación superior', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(174, NULL, 'Profesores de instituciones de educación superior', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(175, NULL, 'Profesores de formación profesional', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(176, NULL, 'Profesores de formación profesional', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(177, NULL, 'Profesores de educación secundaria', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(178, NULL, 'Profesores de educación secundaria', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(179, NULL, 'Profesores de educación primaria', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(180, NULL, 'Profesores de primera infancia ', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(181, NULL, 'Otros profesionales de la educación', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(182, NULL, 'Especialistas en métodos pedagógicos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(183, NULL, 'Profesores de educación especial e inclusiva', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(184, NULL, 'Otros profesores de idiomas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(185, NULL, 'Otros profesores de música', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(186, NULL, 'Otros profesores de artes', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(187, NULL, 'Instructores de tecnología de la información', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(188, NULL, 'PROFESIONALES DE NEGOCIOS Y DE ADMINISTRACIÓN', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(189, NULL, 'Profesionales en finanzas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(190, NULL, 'Contadores', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(191, NULL, 'Asesores financieros y de inversiones', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(192, NULL, 'Analistas financieros', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(193, NULL, 'Profesionales de la administración', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(194, NULL, 'Analistas de gestión y organización', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(195, NULL, 'Profesionales en políticas de administración', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(196, NULL, 'Profesionales de gestión de talento humano', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(197, NULL, 'Profesionales de relaciones públicas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(198, NULL, 'Analistas de sistemas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(199, NULL, 'Desarrolladores de software', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(200, NULL, 'Desarrolladores web y multimedia', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(201, NULL, 'Programadores de aplicaciones', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(202, NULL, 'Diseñadores y administradores de bases de datos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(203, NULL, 'Administradores de sistemas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(204, NULL, 'Profesionales en redes de computadores', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(205, NULL, 'Profesionales en derecho', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(206, NULL, 'Abogados', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(207, NULL, 'Jueces', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(208, NULL, 'Bibliotecarios, archivistas y curadores de arte', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(209, NULL, 'Archivistas y curadores de arte', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(210, NULL, 'Bibliotecarios, documentalistas y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(211, NULL, 'Profesionales en ciencias sociales y religiosas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(212, NULL, 'Economistas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(213, NULL, 'Sociólogos, antropólogos y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(214, NULL, 'Psicólogos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(215, NULL, 'Profesionales del trabajo social y consejeros', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(216, NULL, 'Profesionales religiosos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(217, NULL, 'Autores, periodistas y lingúistas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(218, NULL, 'Autores y otros escritores', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(219, NULL, 'Periodistas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(220, NULL, 'Traductores, intérpretes y otros lingúistas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(221, NULL, 'Artistas creativos e interpretativos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(222, NULL, 'Escultores, pintores artísticos y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(223, NULL, 'Compositores, músicos y cantantes', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(224, NULL, 'Coreógrafos y bailarines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(225, NULL, 'Actores', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(226, NULL, 'TÉCNICOS Y PROFESIONALES DE NIVEL MEDIO', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(227, NULL, 'Técnicos en ciencias físicas y en ingeniería', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(228, NULL, 'Técnicos en ciencias físicas y químicas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(229, NULL, 'Técnicos en ingeniería civil', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(230, NULL, 'Electrotécnicos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(231, NULL, 'Técnicos en electrónica', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(232, NULL, 'Técnicos en ingeniería mecánica', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(233, NULL, 'Técnicos en química industrial', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(234, NULL, 'Técnicos de minas y metalurgia', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(235, NULL, 'Delineantes y dibujantes técnicos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(236, NULL, 'Supervisores de minas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(237, NULL, 'Supervisores de industrias manufactureras', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(238, NULL, 'Supervisores de la construcción', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(239, NULL, 'Técnicos en control de procesos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(240, NULL, 'Operadores de plantas de producción de energía', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(241, NULL, 'Controladores de procesos de producción de metales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(242, NULL, 'Técnicos agropecuarios', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(243, NULL, 'Técnicos forestales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(244, NULL, 'Oficiales maquinistas en navegación', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(245, NULL, 'Capitanes, oficiales de cubierta y prácticos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(246, NULL, 'Pilotos de aviación y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(247, NULL, 'Controladores de tráfico aéreo y marítimo', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(248, NULL, 'Técnicos en seguridad aeronáutica', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(249, NULL, 'Técnicos médicos y farmacéuticos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(250, NULL, 'Técnicos de laboratorios médicos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(251, NULL, 'Técnicos y asistentes farmacéuticos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(252, NULL, 'Técnicos de prótesis médicas y dentales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(253, NULL, 'Técnicos y asistentes veterinarios', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(254, NULL, 'Técnicos y asistentes veterinarios', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(255, NULL, 'Higienistas y asistentes odontologícos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(256, NULL, 'Técnicos en documentación sanitaria', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(257, NULL, 'Trabajadores comunitarios de la salud', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(258, NULL, 'Técnicos en optometría y ópticas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(259, NULL, 'Técnicos y asistentes terapeutas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(260, NULL, 'Asistentes médicos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(261, NULL, 'Técnicos en atención prehospitalaria', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(262, NULL, 'Pintores y empapeladores', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(263, NULL, 'Analistas de préstamos y créditos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(264, NULL, 'Técnicos de contabilidad y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(265, NULL, 'Tasadores y evaluadores', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(266, NULL, 'Agentes comerciales y corredores', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(267, NULL, 'Agentes de seguros', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(268, NULL, 'Representantes comerciales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(269, NULL, 'Agentes de compras', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(270, NULL, 'Agentes de servicios empresariales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(271, NULL, 'Declarantes o gestores de aduana', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(272, NULL, 'Organizadores de conferencias y eventos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(273, NULL, 'Agentes de empleo y contratistas de mano de obra', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(274, NULL, 'Agentes inmobiliarios', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(275, NULL, 'Secretarios administrativos y especializados', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(276, NULL, 'Supervisores de oficina', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(277, NULL, 'Secretarios jurídicos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(278, NULL, 'Secretarios administrativos y ejecutivos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(279, NULL, 'Secretarios médicos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(280, NULL, 'Agentes de aduanas e inspectores de fronteras', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(281, NULL, 'Agentes de administración tributaria', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(282, NULL, 'Agentes de servicios de seguridad social', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(283, NULL, 'Agentes gubernamentales de expedición de licencias', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(284, NULL, 'Inspectores de policía y detectives', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(285, NULL, 'Trabajadores y asistentes sociales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(286, NULL, 'Auxiliares laicos de las religiones', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(287, NULL, 'Entrenadores de deportes y aptitud física', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(288, NULL, 'Atletas y deportistas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(289, NULL, 'Fotógrafos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(290, NULL, 'Diseñadores y decoradores de interiores', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(291, NULL, 'Técnicos en galerías de arte, museos y bibliotecas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(292, NULL, 'Chefs', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(293, NULL, 'Técnicos en redes y sistemas de computación', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(294, NULL, 'Técnicos de la Web', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(295, NULL, 'Técnicos en telecomunicaciones y radiodifusión', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(296, NULL, 'Técnicos de radiodifusión y grabación audio visual', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(297, NULL, 'Técnicos de ingeniería de las telecomunicaciones', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(298, NULL, 'PERSONAL DE APOYO ADMINISTRATIVO', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(299, NULL, 'OFICINISTAS', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(300, NULL, 'Oficinistas generales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(301, NULL, 'Oficinistas generales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(302, NULL, 'Secretarios generales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(303, NULL, 'Secretarios generales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(304, NULL, 'Operadores de máquinas de oficina', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(305, NULL, 'Grabadores de datos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(306, NULL, 'EMPLEADOS DE TRATO DIRECTO CON EL PÃšBLICO', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(307, NULL, 'Pagadores y cobradores de ventanilla y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(308, NULL, 'Cajeros de bancos y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(309, NULL, 'Receptores de apuestas y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(310, NULL, 'Prestamistas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(311, NULL, 'Cobradores y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(312, NULL, 'Barnizadores y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(313, NULL, 'Empleados de servicios de información al cliente', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(314, NULL, 'Empleados y consultores de viajes', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(315, NULL, 'Empleados de centros de llamadas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(316, NULL, 'Telefonistas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(317, NULL, 'Recepcionistas de hoteles', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(318, NULL, 'Empleados de ventanillas de información', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(319, NULL, 'Recepcionistas generales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(320, NULL, 'Auxiliares contables y financieros', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(321, NULL, 'Auxiliares de contabilidad y cálculo de costos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(322, NULL, 'Auxiliares encargados de las nóminas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(323, NULL, 'Empleados de servicios de apoyo a la producción', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(324, NULL, 'Empleados de servicios de transporte', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(325, NULL, 'Otro personal de apoyo administrativo', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(326, NULL, 'Otro personal de apoyo administrativo', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(327, NULL, 'Empleados de bibliotecas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(328, NULL, 'Empleados de servicios de correos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(329, NULL, 'Escribientes públicos y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(330, NULL, 'Empleados de archivos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(331, NULL, 'Empleados del servicio de personal', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(332, NULL, 'TRABAJADORES DE LOS SERVICIOS PERSONALES', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(333, NULL, 'Personal al servicio directo de los pasajeros', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(334, NULL, 'Personal de servicio a pasajeros', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(335, NULL, 'Revisores y cobradores de los transportes públicos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(336, NULL, 'Guías', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(337, NULL, 'Cocineros', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(338, NULL, 'Cocineros', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(339, NULL, 'Meseros y bármanes', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(340, NULL, 'Meseros', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(341, NULL, 'Bármanes', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(342, NULL, 'Peluqueros', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(343, NULL, 'Especialistas en tratamientos de belleza y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(344, NULL, 'Mayordomos domésticos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(345, NULL, 'Conserjes y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(346, NULL, 'Otros trabajadores de servicios personales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(347, NULL, 'Astrólogos, adivinos y trabajadores afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(348, NULL, 'Acompañantes ', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(349, NULL, 'Personal de servicios funerarios y embalsamadores', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(350, NULL, 'Cuidadores de animales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(351, NULL, 'Instructores de conducción', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(352, NULL, 'VENDEDORES', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(353, NULL, 'Vendedores callejeros y de puestos de mercado ', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(354, NULL, 'Vendedores en quioscos y puestos de mercado', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(355, NULL, 'Comerciantes de tiendas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(356, NULL, 'Supervisores de tiendas y almacenes', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(357, NULL, 'Otros vendedores', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(358, NULL, 'Modelos de moda, arte y publicidad', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(359, NULL, 'Demostradores de tiendas, almacenes y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(360, NULL, 'Vendedores puerta a puerta ', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(361, NULL, 'Vendedores a través de medios tecnolígicos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(362, NULL, 'Expendedores de combustibles para vehículos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(363, NULL, 'Vendedores de comidas en mostrador ', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(364, NULL, 'TRABAJADORES DE LOS CUIDADOS PERSONALES', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(365, NULL, 'Cuidadores de niños y auxiliares de maestros', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(366, NULL, 'Cuidadores de niños', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(367, NULL, 'Auxiliares de maestros', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(368, NULL, 'PERSONAL DE LOS SERVICIOS DE PROTECCIÓN', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(369, NULL, 'Personal de los servicios de protecciín', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(370, NULL, 'Bomberos y rescatistas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(371, NULL, 'Policías', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(372, NULL, 'Guardianes de prisiín', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(373, NULL, 'Guardias de seguridad', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(374, NULL, 'Trabajadores forestales calificados y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(375, NULL, 'Trabajadores forestales calificados y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(376, NULL, 'Pescadores, cazadores y tramperos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(377, NULL, 'Trabajadores de explotaciones de acuicultura', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(378, NULL, 'Pescadores de agua dulce y en aguas costeras', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(379, NULL, 'Pescadores de alta mar', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(380, NULL, 'Cazadores y tramperos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(381, NULL, 'Trabajadores agrícolas de subsistencia', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(382, NULL, 'Trabajadores agrícolas de subsistencia', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(383, NULL, 'Trabajadores pecuarios de subsistencia', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(384, NULL, 'Trabajadores pecuarios de subsistencia', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(385, NULL, 'Trabajadores agropecuarios de subsistencia', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(386, NULL, 'Trabajadores agropecuarios de subsistencia', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(387, NULL, 'Constructores de casas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(388, NULL, 'Albañiles', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(389, NULL, 'Labrantes, tronzadores y grabadores de piedra', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(390, NULL, 'Operarios en cemento armado, enfoscadores y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(391, NULL, 'Carpinteros de armar y de obra blanca', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(392, NULL, 'Techadores', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(393, NULL, 'Enchapadores, parqueteros y colocadores de suelos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(394, NULL, 'Revocadores', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(395, NULL, 'Cristaleros', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(396, NULL, 'Fontaneros e instaladores de tuberías', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(397, NULL, 'Pintores, limpiadores de fachadas y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(398, NULL, 'Limpiadores de fachadas y deshollinadores', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(399, NULL, 'OFICIALES Y OPERARIOS DE LA METALURGIA', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(400, NULL, 'Moldeadores y macheros', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(401, NULL, 'Soldadores y oxicortadores', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(402, NULL, 'Chapistas y caldereros', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(403, NULL, 'Montadores de estructuras metálicas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(404, NULL, 'Aparejadores y empalmadores de cables', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(405, NULL, 'Herreros, herramentistas y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(406, NULL, 'Herreros y forjadores', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(407, NULL, 'Herramentistas y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(408, NULL, 'Ajustadores y operadores de máquinas herramientas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(409, NULL, 'Pulidores de metales y afiladores de herramientas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(410, NULL, 'Mecánicos y reparadores de máquinas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(411, NULL, 'Mecánicos y reparadores de vehículos de motor', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(412, NULL, 'Reparadores de bicicletas y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(413, NULL, 'Fabricantes y afinadores de instrumentos musicales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(414, NULL, 'Se desagrega en 7361, 7362 y 7363 por adaptación', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(415, NULL, 'Alfareros y ceramistas (barro y arcilla)', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(416, NULL, 'Rotulistas, pintores decorativos y grabadores', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(417, NULL, 'Oficiales y operarios de las artes gráficas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(418, NULL, 'Preimpresores y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(419, NULL, 'Impresores', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(420, NULL, 'Encuadernadores y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL);
INSERT INTO `maestras` (`id`, `codigo`, `nombre`, `jerarquia`, `orden`, `visible`, `observacion`, `created_at`, `updated_at`, `deleted_at`, `deleted_by`, `created_by_id`, `padre_id`, `updated_by_id`) VALUES
(421, NULL, 'Tejedores', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(422, NULL, 'Tejedores con telares', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(423, NULL, 'Tejedores con agujas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(424, NULL, 'Otros tejedores', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(425, NULL, 'Cesteros, mimbreros y sombrereros artesanales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(426, NULL, 'Cesteros y mimbreros', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(427, NULL, 'Sombrereros artesanales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(428, NULL, 'Artesanos que realizan trabajos en madera', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(429, NULL, 'Tallador piezas artesanales de madera', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(430, NULL, 'Decoradores de piezas artesanales en madera', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(431, NULL, 'Joyeros, orfebres, plateros y bisuteros', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(432, NULL, 'Joyeros', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(433, NULL, 'Orfebres y plateros', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(434, NULL, 'Bisutero', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(435, NULL, 'Artesanos del cuero', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(436, NULL, 'Artesanos del cuero', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(437, NULL, 'Artesanos de papel', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(438, NULL, 'Artesanos del hierro y otros metales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(439, NULL, 'Artesanos de las semillas y cortezas vegetales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(440, NULL, 'Instaladores y reparadores de equipos eléctricos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(441, NULL, 'Electricistas de obras y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(442, NULL, 'Ajustadores electricistas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(443, NULL, 'Instaladores y reparadores de líneas eléctricas ', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(444, NULL, 'Ajustadores e instaladores en electrónica', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(445, NULL, 'Carniceros, pescaderos y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(446, NULL, 'Panaderos, pasteleros y confiteros', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(447, NULL, 'Operarios de la elaboración de productos lácteos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(448, NULL, 'Catadores y clasificadores de alimentos y bebidas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(449, NULL, 'Operarios del tratamiento de la madera', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(450, NULL, 'Oficiales y operarios de la confección y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(451, NULL, 'Sastres, modistos, peleteros y sombrereros', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(452, NULL, 'Patronistas y cortadores de tela, cuero y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(453, NULL, 'Costureros, bordadores y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(454, NULL, 'Tapiceros, colchoneros y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(455, NULL, 'Apelambradores, pellejeros y curtidores', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(456, NULL, 'Zapateros y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(457, NULL, 'Otros oficiales, operarios y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(458, NULL, 'Buzos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(459, NULL, 'Dinamiteros y pegadores', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(460, NULL, 'OPERADORES DE INSTALACIONES FIJAS Y MAQUINAS', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(461, NULL, 'Mineros y operadores de instalaciones mineras', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(462, NULL, 'Perforadores y sondistas de pozos y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(463, NULL, 'Operadores de telares y otras máquinas tejedoras', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(464, NULL, 'Operadores de máquinas de coser', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(465, NULL, 'Operadores de máquinas de lavandería', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(466, NULL, 'Operadores de máquinas de vapor y calderas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(467, NULL, 'ENSAMBLADORES ', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(468, NULL, 'Ensambladores', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(469, NULL, 'Ensambladores de maquinaria mecánica', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(470, NULL, 'Ensambladores de equipos eléctricos y electrónicos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(471, NULL, 'Maquinistas de locomotoras y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(472, NULL, 'Maquinistas de locomotoras', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(473, NULL, 'Guardafrenos, guardagujas y agentes de maniobras', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(474, NULL, 'Conductores de motocicletas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(475, NULL, 'Se desagrega en 8323 y 8324 por adaptación', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(476, NULL, 'Conductores de camionetas y vehículos livianos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(477, NULL, 'Conductores de taxis', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(478, NULL, 'Conductores de camiones pesados y buses', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(479, NULL, 'Conductores de buses, microbuses y tranvías', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(480, NULL, 'Conductores de camiones y vehículos pesados', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(481, NULL, 'Operadores de maquinaria agrícola y forestal móvil', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(482, NULL, 'Operadores de grúas, aparatos elevadores y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(483, NULL, 'Operadores de montacargas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(484, NULL, 'Marineros de cubierta y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(485, NULL, 'Marineros de cubierta y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(486, NULL, 'OCUPACIONES ELEMENTALES', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(487, NULL, 'PERSONAL DOMESTICO Y DE ASEO', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(488, NULL, 'Personal doméstico', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(489, NULL, 'Lavanderos y planchadores manuales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(490, NULL, 'Lavadores de vehículos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(491, NULL, 'Limpiadores de ventanas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(492, NULL, 'Obreros y peones de explotaciones agrícolas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(493, NULL, 'Obreros y peones de explotaciones ganaderas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(494, NULL, 'Obreros y peones de explotaciones agropecuarias', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(495, NULL, 'Obreros y peones de jardinería y horticultura', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(496, NULL, 'Obreros y peones forestales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(497, NULL, 'Obreros y peones de pesca y acuicultura', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(498, NULL, 'Obreros y peones de la minería y la construcción', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(499, NULL, 'Obreros y peones de minas y canteras', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(500, NULL, 'Obreros y peones de obras públicas y mantenimiento', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(501, NULL, 'Obreros y peones de la construcción de edificios', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(502, NULL, 'Obreros y peones de la industria manufacturera', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(503, NULL, 'Empacadores manuales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(504, NULL, 'Obreros y peones de transporte y almacenamiento', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(505, NULL, 'Obreros y peones de carga', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(506, NULL, 'Surtidores de estanterías', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(507, NULL, 'AYUDANTES DE PREPARACION DE ALIMENTOS', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(508, NULL, 'Ayudantes de preparación de alimentos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(509, NULL, 'Cocineros de comidas rápidas', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(510, NULL, 'Ayudantes de cocina', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(511, NULL, 'Trabajadores ambulantes de servicios y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(512, NULL, 'Trabajadores ambulantes de servicios y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(513, NULL, 'Recolectores de desechos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(514, NULL, 'Recolectores de basura y material reciclable', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(515, NULL, 'Clasificadores de desechos', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(516, NULL, 'Barrenderos y afines', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(517, NULL, 'Otras ocupaciones elementales', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(518, NULL, 'Mensajeros, mandaderos, maleteros y repartidores', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(519, NULL, 'Personas que realizan trabajos varios', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(520, NULL, 'Se desagrega en 9625 y 9626 por adaptación', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(521, NULL, 'Acarreadores de agua y recolectores de leña', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(522, NULL, 'Lectores de medidores', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(523, NULL, 'SIN OCUPACION (NO APLICA)', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(524, NULL, 'Ama de casa', NULL, NULL, 1, NULL, '2022-08-26 00:15:26', NULL, NULL, NULL, 1, 84, NULL),
(525, 'LIS_REGIMES', 'REGIMENES', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 1, NULL),
(526, '1', 'CONTRIBUTIVO', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 525, NULL),
(527, '2', 'SUBSIDIADO', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 525, NULL),
(528, '3', 'VINCULADO', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 525, NULL),
(529, '4', 'PARTICULAR', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 525, NULL),
(530, '5', 'OTRO', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 525, NULL),
(531, 'LIS_TIPOSEMPRESAS', 'TIPOS EMPRESAS', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 1, NULL),
(532, NULL, 'PRIVADA', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 531, NULL),
(533, NULL, 'PUBLICA', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 531, NULL),
(534, 'LIS_TIPOSAFILIADOS', 'TIPOS AFILIADOS', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 1, NULL),
(535, NULL, 'BENEFICIARIO', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 534, NULL),
(536, NULL, 'COTIZANTE / AFILIADO', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 534, NULL),
(537, 'LIS_PARENTEZCOS', 'PARENTEZCOS', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 1, NULL),
(538, NULL, 'MADRE', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 537, NULL),
(539, NULL, 'PADRE', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 537, NULL),
(540, NULL, 'HERMANO', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 537, NULL),
(541, NULL, 'TIO', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 537, NULL),
(542, NULL, 'ABUELO', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 537, NULL),
(543, NULL, 'PRIMO', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 537, NULL),
(544, NULL, 'OTRO', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 537, NULL),
(545, 'LIS_RANGOSALARIALES', 'RANGOS SALARIALES', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 1, NULL),
(546, NULL, 'RANGO 1', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 544, NULL),
(547, NULL, 'RANGO 2', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 544, NULL),
(548, NULL, 'RANGO 3', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 544, NULL),
(549, 'LIS_ZONAS', 'ZONAS', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 1, NULL),
(550, 'U', 'URBANA', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 549, NULL),
(551, 'R', 'RURAL', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 549, NULL),
(552, 'LIS_PAISES', 'PAISES', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 1, NULL),
(553, 'CO', 'COLOMBIA', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 552, NULL),
(554, 'VE', 'VENEZUELA', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 552, NULL),
(555, 'LIS_DEPARTAMENTOS', 'DEPARTAMENTOS', 552, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 1, NULL),
(556, 'GUA', 'LA GUAJIRA', 553, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 555, NULL),
(557, 'ATL', 'ATLÁNTICO', 553, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 555, NULL),
(558, 'BOL', 'BOLÍVAR', 553, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 555, NULL),
(559, 'COR', 'CÓRDOBA', 553, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 555, NULL),
(560, 'MAG', 'MAGDALENA', 553, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 555, NULL),
(561, 'CES', 'CESAR', 553, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 555, NULL),
(562, 'SUC', 'SUCRE', 553, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 555, NULL),
(563, 'LIS_MUNICIPIOS', 'MUNICIPIOS', 555, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 1, NULL),
(564, NULL, 'RIOHACHA', 553, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 556, NULL),
(565, NULL, 'URUMITA', 553, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 556, NULL),
(566, NULL, 'VILLANUEVA', 553, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 556, NULL),
(567, NULL, 'URIBIA', 553, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 556, NULL),
(568, NULL, 'SAN JUAN DEL CESAR', 553, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 556, NULL),
(569, NULL, 'MAICAO', 553, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 556, NULL),
(570, NULL, 'LA JAGUA DEL PILAR', 553, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 556, NULL),
(571, NULL, 'HATONUEVO', 553, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 556, NULL),
(572, NULL, 'DIBULLA', 553, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 556, NULL),
(573, NULL, 'DISTRACCION', 553, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 556, NULL),
(574, NULL, 'EL MOLINO', 553, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 556, NULL),
(575, NULL, 'BARRANCAS', 553, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 556, NULL),
(576, NULL, 'ALBANIA', 553, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 556, NULL),
(577, NULL, 'MANAURE', 553, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 556, NULL),
(578, NULL, 'MAICAO', 553, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 556, NULL),
(579, NULL, 'MONTERÍA', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 556, NULL),
(580, NULL, 'VALLEDUPAR', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 556, NULL),
(581, NULL, 'FONSECA', 553, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 556, NULL),
(582, 'LIS_DISCAPACIDADES', 'DISCAPACIDADES', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 1, NULL),
(583, NULL, 'SENSORIAL', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 582, NULL),
(584, NULL, 'PSICOSOCIAL', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 582, NULL),
(585, NULL, 'COGNITIVA', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 582, NULL),
(586, NULL, 'MOTRIZ', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 582, NULL),
(587, 'LIS_NIVELSISBEN', 'NIVELES SISBEN', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 1, NULL),
(588, '1', 'UNO', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 587, NULL),
(589, '2', 'DOS', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 587, NULL),
(590, '3', 'TRES', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 587, NULL),
(591, 'LIS_TIPOSNOTAS', 'TIPOS DE NOTAS PARA PACIENTES', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 1, NULL),
(592, NULL, 'BLOQUEADO INCUMPLIMIENTO DE CITA', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 591, NULL),
(593, NULL, 'BLOQUEADO DEBE CUOTA MODERADORA', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 591, NULL),
(594, NULL, 'HABILITADO VACUNACION', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 591, NULL),
(595, 'LIS_ESTADOS', 'ESTADOS', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 1, NULL),
(596, NULL, 'ACTIVO', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 595, NULL),
(597, NULL, 'SUSPENDIDO', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 595, NULL),
(598, NULL, 'RETIRADO', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 595, NULL),
(599, 'LIS_TIPOSFUNCIONARIOS', 'TIPOS DE FUNCIONARIO', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 1, NULL),
(600, NULL, 'PERMANENTE', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 599, NULL),
(601, NULL, 'TEMPORAL', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 599, NULL),
(602, 'LIS_TIPOSPUBLICACION', 'TIPOS PUBLICACION', NULL, NULL, 1, NULL, '2022-08-26 00:29:00', NULL, NULL, NULL, 1, 1, NULL),
(603, NULL, 'COMENTARIO', NULL, NULL, 1, NULL, '2022-08-26 00:42:35', NULL, NULL, NULL, 1, 602, NULL),
(604, NULL, 'PUBLICACION', NULL, NULL, 1, NULL, '2022-08-26 00:42:35', NULL, NULL, NULL, 1, 602, NULL),
(605, NULL, 'PREGUNTA', NULL, NULL, 1, NULL, '2022-08-26 00:42:35', NULL, NULL, NULL, 1, 602, NULL),
(606, NULL, 'RESPUESTA', NULL, NULL, 1, NULL, '2022-08-26 00:42:35', NULL, NULL, NULL, 1, 602, NULL),
(607, NULL, 'LABORATORIO DESCARGADO', NULL, NULL, 1, NULL, '2022-08-26 00:42:35', NULL, NULL, NULL, 1, 602, NULL),
(608, 'LIS_RESPUESTASINO', 'RESPUESTAS SI O NO', NULL, NULL, 1, NULL, '2022-08-26 00:43:59', NULL, NULL, NULL, 1, 1, NULL),
(609, NULL, 'SI', NULL, NULL, 1, NULL, '2022-08-26 00:43:59', NULL, NULL, NULL, 1, 608, NULL),
(610, NULL, 'NO', NULL, NULL, 1, NULL, '2022-08-26 00:43:59', NULL, NULL, NULL, 1, 608, NULL),
(611, 'LIS_UNIDADESTIEMPO', 'UNIDADES TIEMPO', NULL, NULL, 1, NULL, '2022-08-26 00:43:59', NULL, NULL, NULL, 1, 1, NULL),
(612, NULL, 'SEGUNDOS', NULL, NULL, 1, NULL, '2022-08-26 00:43:59', NULL, NULL, NULL, 1, 611, NULL),
(613, NULL, 'MINUTOS', NULL, NULL, 1, NULL, '2022-08-26 00:43:59', NULL, NULL, NULL, 1, 611, NULL),
(614, NULL, 'HORAS', NULL, NULL, 1, NULL, '2022-08-26 00:43:59', NULL, NULL, NULL, 1, 611, NULL),
(615, NULL, 'DIAS', NULL, NULL, 1, NULL, '2022-08-26 00:43:59', NULL, NULL, NULL, 1, 611, NULL),
(616, NULL, 'SEMANAS', NULL, NULL, 1, NULL, '2022-08-26 00:43:59', NULL, NULL, NULL, 1, 611, NULL),
(617, NULL, 'MESES', NULL, NULL, 1, NULL, '2022-08-26 00:43:59', NULL, NULL, NULL, 1, 611, NULL),
(618, NULL, 'AÑOS', NULL, NULL, 1, NULL, '2022-08-26 00:43:59', NULL, NULL, NULL, 1, 611, NULL),
(619, 'LIS_REACCIONES', 'REACCIONES', NULL, NULL, 1, NULL, '2022-08-26 00:44:56', NULL, NULL, NULL, 1, 1, NULL),
(620, NULL, 'ME GUSTA', NULL, NULL, 1, NULL, '2022-08-26 00:44:56', NULL, NULL, NULL, 1, 619, NULL),
(621, NULL, 'ME ENCANTA', NULL, NULL, 1, NULL, '2022-08-26 00:44:56', NULL, NULL, NULL, 1, 619, NULL),
(622, NULL, 'ME DIVIERTE', NULL, NULL, 1, NULL, '2022-08-26 00:44:56', NULL, NULL, NULL, 1, 619, NULL),
(623, NULL, 'ME SORPRENDE', NULL, NULL, 1, NULL, '2022-08-26 00:44:56', NULL, NULL, NULL, 1, 619, NULL),
(624, NULL, 'ME ENTRISTECE', NULL, NULL, 1, NULL, '2022-08-26 00:44:56', NULL, NULL, NULL, 1, 619, NULL),
(625, NULL, 'ME ENOJO', NULL, NULL, 1, NULL, '2022-08-26 00:44:56', NULL, NULL, NULL, 1, 619, NULL),
(626, NULL, 'PROFESOR', NULL, NULL, 1, NULL, '2022-08-26 00:44:56', NULL, NULL, NULL, 1, 5, NULL),
(627, NULL, 'ESTUDIANTE', NULL, NULL, 1, NULL, '2022-08-26 00:44:56', NULL, NULL, NULL, 1, 5, NULL),
(628, NULL, 'PADRE', NULL, NULL, 1, NULL, '2022-08-26 00:44:56', NULL, NULL, NULL, 1, 5, NULL),
(629, 'LIS_TIPOSCAMPOS', 'TIPOS DE CAMPOS HTML', NULL, NULL, 1, NULL, '2022-08-26 00:44:56', NULL, NULL, NULL, 1, 1, NULL),
(664, 'text', 'Campos de textos', NULL, NULL, 1, NULL, '2022-08-26 00:48:29', NULL, NULL, NULL, 1, 629, NULL),
(665, 'textarea ', 'Áreas de texto', NULL, NULL, 1, NULL, '2022-08-26 00:48:29', NULL, NULL, NULL, 1, 629, NULL),
(666, 'search ', 'Campos de busqueda', NULL, NULL, 1, NULL, '2022-08-26 00:48:29', NULL, NULL, NULL, 1, 629, NULL),
(667, 'tel ', 'Campos de telefono', NULL, NULL, 1, NULL, '2022-08-26 00:48:29', NULL, NULL, NULL, 1, 629, NULL),
(668, 'url ', 'Campos de url', NULL, NULL, 1, NULL, '2022-08-26 00:48:29', NULL, NULL, NULL, 1, 629, NULL),
(669, 'email ', 'Campos de email', NULL, NULL, 1, NULL, '2022-08-26 00:48:29', NULL, NULL, NULL, 1, 629, NULL),
(670, 'date ', 'Campos de fecha', NULL, NULL, 1, NULL, '2022-08-26 00:48:29', NULL, NULL, NULL, 1, 629, NULL),
(671, 'select', 'Combos de selección', NULL, NULL, 1, NULL, '2022-08-26 00:48:29', NULL, NULL, NULL, 1, 629, NULL),
(672, 'hidden', 'Campos Ocultos', NULL, NULL, 1, NULL, '2022-08-26 00:48:29', NULL, NULL, NULL, 1, 629, NULL),
(673, 'password', 'Contraseñas', NULL, NULL, 1, NULL, '2022-08-26 00:48:29', NULL, NULL, NULL, 1, 629, NULL),
(674, 'checkbox', 'Checkbox', NULL, NULL, 1, NULL, '2022-08-26 00:48:29', NULL, NULL, NULL, 1, 629, NULL),
(675, 'radio', 'Radios', NULL, NULL, 1, NULL, '2022-08-26 00:48:29', NULL, NULL, NULL, 1, 629, NULL),
(676, 'image', 'Imágenes', NULL, NULL, 1, NULL, '2022-08-26 00:48:29', NULL, NULL, NULL, 1, 629, NULL),
(677, 'file', 'Ficheros', NULL, NULL, 1, NULL, '2022-08-26 00:48:29', NULL, NULL, NULL, 1, 629, NULL),
(678, 'button', 'Botones', NULL, NULL, 1, NULL, '2022-08-26 00:48:29', NULL, NULL, NULL, 1, 629, NULL),
(679, 'submit', 'Botones de envío', NULL, NULL, 1, NULL, '2022-08-26 00:48:29', NULL, NULL, NULL, 1, 629, NULL),
(680, 'reset', 'Botones de borrado', NULL, NULL, 1, NULL, '2022-08-26 00:48:29', NULL, NULL, NULL, 1, 629, NULL),
(681, 'LIS_TIPOMATERIA', 'TIPOS DE MATERIAS ESCOLARES', NULL, NULL, 1, NULL, '2022-08-26 01:10:49', NULL, NULL, NULL, 1, 1, NULL),
(682, NULL, 'CIENCIAS NATURALES Y EDUCACIÓN AMBIENTAL', NULL, NULL, 1, NULL, '2022-08-26 01:10:49', NULL, NULL, NULL, 1, 681, NULL),
(683, NULL, 'CIENCIAS SOCIALES', NULL, NULL, 1, NULL, '2022-08-26 01:10:49', NULL, NULL, NULL, 1, 681, NULL),
(684, NULL, 'HISTORIA', NULL, NULL, 1, NULL, '2022-08-26 01:10:49', NULL, NULL, NULL, 1, 681, NULL),
(685, NULL, 'GEOGRAFÍA', NULL, NULL, 1, NULL, '2022-08-26 01:10:49', NULL, NULL, NULL, 1, 681, NULL),
(686, NULL, 'CONSTITUCIÓN POLÍTICA Y DEMOCRACIA', NULL, NULL, 1, NULL, '2022-08-26 01:10:49', NULL, NULL, NULL, 1, 681, NULL),
(687, NULL, 'ARTÍSTICA Y CULTURAL', NULL, NULL, 1, NULL, '2022-08-26 01:10:49', NULL, NULL, NULL, 1, 681, NULL),
(688, NULL, 'ÉTICA Y EN VALORES HUMANOS', NULL, NULL, 1, NULL, '2022-08-26 01:10:49', NULL, NULL, NULL, 1, 681, NULL),
(689, NULL, 'EDUCACIÓN FÍSICA, RECREACIÓN Y DEPORTES', NULL, NULL, 1, NULL, '2022-08-26 01:10:49', NULL, NULL, NULL, 1, 681, NULL),
(690, NULL, 'RELIGION', NULL, NULL, 1, NULL, '2022-08-26 01:10:49', NULL, NULL, NULL, 1, 681, NULL),
(691, NULL, 'HUMANIDADES', NULL, NULL, 1, NULL, '2022-08-26 01:10:49', NULL, NULL, NULL, 1, 681, NULL),
(692, NULL, 'LENGUA CASTELLANA', NULL, NULL, 1, NULL, '2022-08-26 01:10:49', NULL, NULL, NULL, 1, 681, NULL),
(693, NULL, 'INGLES', NULL, NULL, 1, NULL, '2022-08-26 01:10:49', NULL, NULL, NULL, 1, 681, NULL),
(694, NULL, 'IDIOMAS EXTRANJEROS', NULL, NULL, 1, NULL, '2022-08-26 01:10:49', NULL, NULL, NULL, 1, 681, NULL),
(695, NULL, 'MATEMÁTICAS', NULL, NULL, 1, NULL, '2022-08-26 01:10:49', NULL, NULL, NULL, 1, 681, NULL),
(696, NULL, 'TECNOLOGÍA E INFORMÁTICA', NULL, NULL, 1, NULL, '2022-08-26 01:10:49', NULL, NULL, NULL, 1, 681, NULL),
(697, 'LIST_GRADOS', 'GRADOS', NULL, NULL, 1, NULL, '2022-08-26 20:57:19', NULL, NULL, NULL, 1, 1, NULL),
(698, '', 'PRIMERO', NULL, NULL, 1, NULL, '2022-08-26 20:59:14', NULL, NULL, NULL, 1, 697, NULL),
(699, '', 'SEGUNDO', NULL, NULL, 1, NULL, '2022-08-26 21:01:15', NULL, NULL, NULL, 1, 697, NULL),
(700, '', 'TERCERO', NULL, NULL, 1, NULL, '2022-08-26 21:01:32', NULL, NULL, NULL, 1, 697, NULL),
(701, '', 'CUARTO', NULL, NULL, 1, NULL, '2022-08-26 21:01:32', NULL, NULL, NULL, 1, 697, NULL),
(702, '', 'QUINTO', NULL, NULL, 1, NULL, '2022-08-26 21:01:32', NULL, NULL, NULL, 1, 697, NULL),
(703, '', 'SEXTO', NULL, NULL, 1, NULL, '2022-08-26 21:01:32', NULL, NULL, NULL, 1, 697, NULL),
(704, '', 'SEPTIMO', NULL, NULL, 1, NULL, '2022-08-26 21:01:42', NULL, NULL, NULL, 1, 697, NULL),
(705, '', 'OCTAVO', NULL, NULL, 1, NULL, '2022-08-26 21:01:52', NULL, NULL, NULL, 1, 697, NULL),
(706, '', 'NOVENO', NULL, NULL, 1, NULL, '2022-08-26 21:02:17', NULL, NULL, NULL, 1, 697, NULL),
(707, '', 'DECIMO', NULL, NULL, 1, NULL, '2022-08-26 21:02:17', NULL, NULL, NULL, 1, 697, NULL),
(708, '', 'ONCE', NULL, NULL, 1, NULL, '2022-08-26 21:03:06', NULL, NULL, NULL, 1, 697, NULL),
(709, '', 'DOCE', NULL, NULL, 1, NULL, '2022-08-26 21:03:06', NULL, NULL, NULL, 1, 697, NULL),
(710, 'LIS_DIASEMANA', 'DIAS DE LA SEMANA', NULL, NULL, 1, NULL, '2022-08-28 02:40:47', NULL, NULL, NULL, 1, 1, NULL),
(711, NULL, 'LUNES', NULL, NULL, 1, NULL, '2022-08-28 02:41:42', NULL, NULL, NULL, 1, 710, NULL),
(712, NULL, 'MARTES', NULL, NULL, 1, NULL, '2022-08-28 02:41:42', NULL, NULL, NULL, 1, 710, NULL),
(713, NULL, 'MIERCOLES', NULL, NULL, 1, NULL, '2022-08-28 02:41:42', NULL, NULL, NULL, 1, 710, NULL),
(714, NULL, 'JUEVES', NULL, NULL, 1, NULL, '2022-08-28 02:41:42', NULL, NULL, NULL, 1, 710, NULL),
(715, NULL, 'VIERNES', NULL, NULL, 1, NULL, '2022-08-28 02:41:42', NULL, NULL, NULL, 1, 710, NULL),
(716, 'LIS_CORTES', 'CORTES', NULL, NULL, 1, NULL, '2022-09-01 22:29:49', NULL, NULL, NULL, 1, 1, NULL),
(717, NULL, 'PRIMER PERIODO', NULL, NULL, 1, NULL, '2022-09-01 22:31:41', NULL, NULL, NULL, 1, 716, NULL),
(718, NULL, 'SEGUNDO PERIODO', NULL, NULL, 1, NULL, '2022-09-01 22:31:41', NULL, NULL, NULL, 1, 716, NULL),
(719, NULL, 'TERCER PERIODO', NULL, NULL, 1, NULL, '2022-09-01 22:31:41', NULL, NULL, NULL, 1, 716, NULL),
(720, NULL, 'CUARTO PERIODO', NULL, NULL, 1, NULL, '2022-09-01 22:31:41', NULL, NULL, NULL, 1, 716, NULL),
(721, NULL, 'QUINTO PERIODO', NULL, NULL, 1, NULL, '2022-09-01 22:31:41', NULL, NULL, NULL, 1, 716, NULL),
(722, 'LIS_TIPOEVENTO', 'TIPO EVENTO', NULL, NULL, 1, NULL, '2022-09-01 22:31:41', NULL, NULL, NULL, 1, 1, NULL),
(723, NULL, 'PUBLICO', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 2, 722, NULL),
(724, NULL, 'PRIVADO', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 2, 722, NULL),
(725, NULL, 'GENERAL', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 2, 722, NULL),
(726, 'LIS_AREAS', 'LISTADO DE AREAS', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 2, 1, NULL),
(727, '', 'ADMINISTRATIVA', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 2, 726, NULL),
(728, '', 'VENTAS', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 2, 726, NULL),
(729, '', 'COMPRAS', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 2, 726, NULL),
(730, '', 'DEVOLUCIONES', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 2, 726, NULL),
(731, '', 'MARKETING', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 2, 726, NULL),
(732, '', 'LOGISTICA', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 2, 726, NULL),
(733, '', 'INVENTARIOS', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 2, 726, NULL),
(734, '', 'FINANZAS', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 2, 726, NULL),
(735, '', 'RECURSOS HUMANOS', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 2, 726, NULL),
(736, '', 'INVESTIGACION Y DESARROLLO', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 2, 726, NULL),
(737, 'LIS_TIPO_EMPLEADOS', 'TIPOS DE EMPLEADOS', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 2, 1, NULL),
(738, '', 'PLANTA', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 2, 737, NULL),
(739, '', 'PRESTADOR DE SERVICIOS', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 2, 737, NULL),
(740, '', 'TEMPORAL', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 2, 737, NULL),
(741, '', 'PRACTICANTE', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 2, 737, NULL),
(742, 'LIS_TIPO_ESTADOS_MENSAJES', 'TIPOS DE ESTADOS MENSAJES', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 1, 1, NULL),
(743, '', 'PENDIENTE', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 1, 742, NULL),
(744, '', 'ENVIADO', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 1, 742, NULL),
(745, '', 'ENTREGADO', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 1, 742, NULL),
(746, '', 'LEIDO', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 1, 742, NULL),
(747, 'LIS_TIPO_MENSAJES', 'TIPOS DE MENSAJES', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 1, 1, NULL),
(748, '', 'TEXTO', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 1, 747, NULL),
(749, '', 'REACION', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 1, 747, NULL),
(750, '', 'IMAGEN', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 1, 747, NULL),
(751, '', 'DESCONOCIDO', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 1, 747, NULL),
(752, '', 'UBICACION', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 1, 747, NULL),
(753, '', 'CONTACTO', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 1, 747, NULL),
(754, '', 'TEMPLATE', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 1, 747, NULL),
(755, '', 'VIDEO', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 1, 747, NULL),
(756, '', 'DOCUMENTO', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 1, 747, NULL),
(757, 'LIS_TIPO_ESTADO_CONVERSACION', 'ESTADOS CONVERSACION', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 1, 1, NULL),
(758, '', 'ACTIVA', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 1, 757, NULL),
(759, '', 'ARCHIVADA', NULL, NULL, 1, NULL, '2022-09-27 00:51:18', NULL, NULL, NULL, 1, 757, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajeria`
--

CREATE TABLE `mensajeria` (
  `id` bigint NOT NULL,
  `mensaje_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `recipiente_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `conversacion_id` bigint DEFAULT NULL,
  `origin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `timestamp_w` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `celular` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `estado_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `destinatario_id` bigint DEFAULT NULL,
  `texto` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `tipo_id` int DEFAULT NULL,
  `sha256` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `multimedia_id_id` bigint DEFAULT NULL,
  `mime_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `link` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `filename` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `voice` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `context_from` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `context_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `mensajeria`
--

INSERT INTO `mensajeria` (`id`, `mensaje_id`, `recipiente_id`, `conversacion_id`, `origin`, `timestamp_w`, `celular`, `created_at`, `updated_at`, `created_by_id`, `estado_id`, `updated_by_id`, `destinatario_id`, `texto`, `tipo_id`, `sha256`, `multimedia_id_id`, `mime_type`, `link`, `filename`, `voice`, `context_from`, `context_id`) VALUES
(310, 'wamid.HBgMNTczMDE0NTgyODc4FQIAEhggMDMzNDI2OTJCQjc4N0MwRTVGMDQ4M0E1QTA4MUI4RDEA', '573014582878', 3, NULL, '1699832446', '573014582878', '2023-11-12 23:40:49', '2023-11-12 23:40:49', NULL, 745, NULL, NULL, 'Ytyt', 748, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(311, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNTdFQkY3NjlDMzk5RDJEM0JDAA==', '573014582878', 3, NULL, '1699832459', '573014582878', '2023-11-12 23:41:00', '2023-11-12 23:41:01', 2, 745, NULL, 3781, 'kkk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(312, 'wamid.HBgMNTczMDE0NTgyODc4FQIAEhggOTM5REFDQjNFQTAwNzZBOTE3MDMwQTkxREU5NkQwNDQA', '573014582878', 3, NULL, '1699832464', '573014582878', '2023-11-12 23:41:06', '2023-11-12 23:41:06', NULL, 745, NULL, NULL, 'Yuyu', 748, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(313, 'wamid.HBgMNTczMDE0NTgyODc4FQIAEhggQUJBRjI0QURCODhENkRFMzM2OTJCMDA3NTVGQTc0RjYA', '573014582878', 3, NULL, '1699832641', '573014582878', '2023-11-12 23:44:03', '2023-11-12 23:44:03', NULL, 745, NULL, NULL, 'Lll', 748, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(314, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQjAxMzZEQzBCQjRFOTkzQkFDAA==', '573014582878', 3, NULL, '1699832641', '573014582878', '2023-11-12 23:56:07', '2023-11-12 23:56:07', 2, 745, NULL, 3781, 'ggg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(315, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMjExMEU4MzM5NjEyQUIxN0JEAA==', '573014582878', 3, NULL, '1699832641', '573014582878', '2023-11-12 23:57:08', '2023-11-12 23:57:08', 2, 745, NULL, 3781, 'nn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(316, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQzIyNTIzNTNGRDg0QzkwQjIxAA==', '573014582878', 3, NULL, '1699832641', '573014582878', '2023-11-12 23:59:17', '2023-11-12 23:59:17', 2, 745, NULL, 3781, 'fgfgfg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(317, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNTcwQzAxREM4NkUxMDlFNTFBAA==', '573014582878', 3, NULL, '1699832641', '573014582878', '2023-11-13 14:48:29', '2023-11-13 14:48:29', 2, 745, NULL, 3781, '*Hola Yilberth* Queremos invitarte a una reunión este 20/11/2023 ☺️. Te esperamos ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(318, 'wamid.HBgMNTczMDE0NTgyODc4FQIAEhggODBDRjI4REY4NTcwNTJBOUVGNDJBMEMyMTdFMTE0NjQA', '573014582878', 3, NULL, '1699833346', '573014582878', '2023-11-16 17:43:40', '2023-11-16 17:43:40', NULL, 745, NULL, NULL, 'Ui', 748, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(319, 'wamid.HBgMNTczMDE0NTgyODc4FQIAEhggNzVDODIyMThFOTA2ODgwQjM5RkQyQkM1QjUyNjk5NjAA', '573014582878', 3, NULL, '1699895248', '573014582878', '2023-11-16 19:31:51', '2023-11-16 19:31:51', NULL, 745, NULL, NULL, '3', 748, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(320, 'wamid.HBgMNTczMDE0NTgyODc4FQIAEhggNENCRUY4MzhFRjlBNUVBNDYzQUFBRjA0ODA2MjEyRjAA', '573014582878', 3, NULL, '1699830978', '573014582878', '2023-11-16 19:33:33', '2023-11-16 19:33:33', NULL, 745, NULL, NULL, 'Uuu', 748, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(321, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRjE0QTQ2RkIwQUQzODlBRkUyAA==', '573014582878', 3, NULL, '1699832641', '573014582878', '2023-11-17 15:09:56', '2023-11-17 15:09:56', 2, NULL, NULL, 3781, '*Hola Yilberth* Queremos invitarte a una reunión este 20/11/2023 ☺️. Te esperamos ', NULL, NULL, NULL, 'document', NULL, NULL, NULL, NULL, NULL),
(322, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMTdGNENERDkyMDEyMUVENUU3AA==', '573014582878', 3, NULL, '1699832641', '573014582878', '2023-11-18 16:36:28', '2023-11-18 16:36:28', 2, NULL, NULL, 3781, '', NULL, NULL, 43, 'image/jpeg', NULL, NULL, NULL, NULL, NULL),
(323, 'wamid.HBgMNTczMDE0NTgyODc4FQIAEhggMTIyOUVCNzBEODE4OTkyODUzMDkzQzE3NTk1QjVDOTYA', '573014582878', 3, NULL, '1700325398', '573014582878', '2023-11-18 16:36:39', '2023-11-18 16:36:39', NULL, 745, NULL, NULL, 'H', 748, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(324, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSREE4QUUzOTgwQTYyOTM2NkY4AA==', '573014582878', 3, NULL, '1700325407', '573014582878', '2023-11-18 16:36:47', '2023-11-18 16:36:48', 2, 745, NULL, 3781, '', NULL, NULL, 43, 'image/jpeg', NULL, NULL, NULL, NULL, NULL),
(325, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQzlENzA4NDEzM0U3REM0QkYwAA==', '573014582878', 3, NULL, '1700325430', '573014582878', '2023-11-18 16:37:10', '2023-11-18 16:37:11', 2, 745, NULL, 3781, '', NULL, NULL, 43, 'image/jpeg', NULL, NULL, NULL, NULL, NULL),
(326, 'wamid.HBgMNTczMDE0NTgyODc4FQIAEhggNjMzRjdFQTdGMTk0MjZDMTNCOUMxMzc1QjNGRDYyRkIA', '573014582878', 3, NULL, '1699833534', '573014582878', '2023-11-19 01:30:31', '2023-11-19 01:30:31', NULL, 745, NULL, NULL, '56', 748, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(327, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRjM2NzAzMDJDNjFBMzRCNDE5AA==', '573014582878', 3, NULL, '1700360894', '573014582878', '2023-11-19 02:28:13', '2023-11-19 02:28:16', 2, 745, NULL, 3781, '', NULL, NULL, 43, 'image/jpeg', NULL, NULL, NULL, NULL, NULL),
(328, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMDJFRDQzNEIyMzA4RTYyNjY2AA==', '573014582878', 3, NULL, '1700362712', '573014582878', '2023-11-19 02:58:31', '2023-11-19 02:58:33', 2, 745, NULL, 3781, '', NULL, NULL, 43, 'image/jpeg', NULL, NULL, NULL, NULL, NULL),
(329, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRTA4MENGQjExRjA1RjRGOEI2AA==', '573014582878', 3, NULL, '1700362817', '573014582878', '2023-11-19 03:00:10', '2023-11-19 03:00:18', 2, 745, NULL, 3781, '', NULL, NULL, 43, 'image/jpeg', NULL, NULL, NULL, NULL, NULL),
(330, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQTBGMjE1RkUyOTBDRUJBRTEzAA==', '573014582878', 3, NULL, '1700362944', '573014582878', '2023-11-19 03:02:23', '2023-11-19 03:02:25', 2, 745, NULL, 3781, '', NULL, NULL, 43, 'image/jpeg', NULL, NULL, NULL, NULL, NULL),
(331, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQjczRkJGNUNEMDM4QzI4QjBEAA==', '573014582878', 3, NULL, '1700362963', '573014582878', '2023-11-19 03:02:42', '2023-11-19 03:02:44', 2, 745, NULL, 3781, '', NULL, NULL, 45, 'image/jpeg', NULL, NULL, NULL, NULL, NULL),
(332, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRTBGMjc3ODlCRDg1RDA1MzM2AA==', '573014582878', 3, NULL, '1700363168', '573014582878', '2023-11-19 03:06:07', '2023-11-19 03:06:09', 2, 745, NULL, 3781, '', NULL, NULL, 45, 'image/jpeg', NULL, NULL, NULL, NULL, NULL),
(333, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQzIzRTVFOTMxMEE4OTc0MTgyAA==', '573014582878', 3, NULL, '1700363209', '573014582878', '2023-11-19 03:06:48', '2023-11-19 03:06:50', 2, 745, NULL, 3781, '', NULL, NULL, 43, 'image/jpeg', NULL, NULL, NULL, NULL, NULL),
(334, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQjg0MDhGNTIwMjY4NDlBMzU4AA==', '573014582878', 3, NULL, '1700363256', '573014582878', '2023-11-19 03:07:35', '2023-11-19 03:07:37', 2, 745, NULL, 3781, '', NULL, NULL, 45, 'image/jpeg', NULL, NULL, NULL, NULL, NULL),
(335, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSOEE4OUY4MUIwRkRCRkFFNzE2AA==', '573014582878', 3, NULL, '1700363285', '573014582878', '2023-11-19 03:08:05', '2023-11-19 03:08:06', 2, 745, NULL, 3781, '', NULL, NULL, 45, 'image/jpeg', NULL, NULL, NULL, NULL, NULL),
(336, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQzRFREJFMzNFMzQxMTc5RjhFAA==', '573014582878', 3, NULL, '1700363294', '573014582878', '2023-11-19 03:08:13', '2023-11-19 03:08:15', 2, 745, NULL, 3781, '', NULL, NULL, 43, 'image/jpeg', NULL, NULL, NULL, NULL, NULL),
(337, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSREJCMDFCREEyQ0FBRkRFQUQzAA==', '573014582878', 3, NULL, '1700418381', '573014582878', '2023-11-19 18:26:18', '2023-11-19 18:26:21', 2, 745, NULL, 3781, '', NULL, NULL, 46, 'document', NULL, NULL, NULL, NULL, NULL),
(342, 'wamid.HBgMNTczMDE0NTgyODc4FQIAEhggMzAzQjkxRDlGMURDOUIyRDNDRkYxOTg4NUQxN0ZFM0YA', '573014582878', 3, NULL, '1700508213', '573014582878', '2023-11-20 19:23:34', '2023-11-20 19:23:34', NULL, 745, NULL, NULL, 'Q', 748, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(343, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRDE5NTBDQzE3OUU4QkIyQTIwAA==', '573014582878', 3, NULL, '1700508358', '573014582878', '2023-11-20 19:25:52', '2023-11-20 19:25:59', 2, 745, NULL, 3781, 'a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(344, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQzdGMjVENEQ5QjUxMERGRkM3AA==', '573014582878', 3, NULL, '1700508594', '573014582878', '2023-11-20 19:29:52', '2023-11-20 19:29:55', 2, 745, NULL, 3781, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(345, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSM0YyQzVBNDQ4RkI5RjJEOTFGAA==', '573014582878', 3, NULL, '1700508777', '573014582878', '2023-11-20 19:32:55', '2023-11-20 19:32:58', 2, 745, NULL, 3781, 'ddd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(346, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNEQwOUEyRDhCNzk2ODgzMDFBAA==', '573014582878', 3, NULL, '1700508823', '573014582878', '2023-11-20 19:33:43', '2023-11-20 19:33:44', 2, 745, NULL, 3781, 'dfdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(347, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRTNDRTJGQzAzOEE0QkZEMTRDAA==', '573014582878', 3, NULL, '1700509053', '573014582878', '2023-11-20 19:37:26', '2023-11-20 19:37:34', 2, 745, NULL, 3781, 'sdsd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(348, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMjQ5Q0M5OUJENDEwMDE3RUJEAA==', '573014582878', 3, NULL, '1700509091', '573014582878', '2023-11-20 19:38:11', '2023-11-20 19:38:12', 2, 745, NULL, 3781, 'ffgf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(349, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSN0ZERUJFMjYwOTM0OUZCOUFBAA==', '573014582878', 3, NULL, '1700509191', '573014582878', '2023-11-20 19:39:43', '2023-11-20 19:39:52', 2, 745, NULL, 3781, 'dtgrt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(350, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMEZCQjU4OUNBQzIxMjNDMzA0AA==', '573014582878', 3, NULL, '1700509191', '573014582878', '2023-11-20 19:39:47', '2023-11-20 19:39:52', 2, 745, NULL, 3781, 'ghgh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(351, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRjFFQkQxMUU2QjQzMEJEN0UzAA==', '573014582878', 3, NULL, '1700509191', '573014582878', '2023-11-20 19:39:51', '2023-11-20 19:39:52', 2, 745, NULL, 3781, 'fgfg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(352, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNzk5MUFDRDU1QUM0OTI3RkUyAA==', '573014582878', 3, NULL, '1700509195', '573014582878', '2023-11-20 19:39:55', '2023-11-20 19:39:56', 2, 745, NULL, 3781, 'fgfg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(353, 'wamid.HBgMNTczMDE0NTgyODc4FQIAEhggNzRBOEUzQUYwQTZEQzFFRTA3RkY1MTM2NjRCMUQwRDEA', '573014582878', 3, NULL, '1700509204', '573014582878', '2023-11-20 19:40:05', '2023-11-20 19:40:05', NULL, 745, NULL, NULL, 'Ooo', 748, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(354, 'wamid.HBgMNTczMDE0NTgyODc4FQIAEhggNEEyNzQwNzNCQjc4MjE0MDY3QTg1MjFGMTlCRkVBOTEA', '573014582878', 3, NULL, '1700509212', '573014582878', '2023-11-20 19:40:13', '2023-11-20 19:40:13', NULL, 745, NULL, NULL, 'Uyuy', 748, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(355, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRDUwNEREQzg5N0M2QUM3QTFEAA==', '573014582878', 3, NULL, '1700509367', '573014582878', '2023-11-20 19:42:40', '2023-11-20 19:42:48', 2, 745, NULL, 3781, '', NULL, NULL, 46, 'document', NULL, NULL, NULL, NULL, NULL),
(356, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMTM0OEY3MTNEOUJGMUIzOTU1AA==', '573014582878', 3, NULL, '1700509454', '573014582878', '2023-11-20 19:44:13', '2023-11-20 19:44:14', 2, 745, NULL, 3781, '', NULL, NULL, 43, 'image/jpeg', NULL, NULL, NULL, NULL, NULL),
(357, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNDM2QzgyNjM2RUFBOTRGN0QxAA==', '573014582878', 3, NULL, '1700509536', '573014582878', '2023-11-20 19:45:36', '2023-11-20 19:45:37', 2, 745, NULL, 3781, '', NULL, NULL, 46, 'document', NULL, NULL, NULL, NULL, NULL),
(358, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRDExMUY2QzFENzA0RTZFQUREAA==', '573014582878', 3, NULL, '1700509689', '573014582878', '2023-11-20 19:47:52', '2023-11-20 19:48:10', 2, 745, NULL, 3781, '', NULL, NULL, 45, 'image/jpeg', NULL, NULL, NULL, NULL, NULL),
(359, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSOTQwMkFEQUI1RkRCQ0VBQTQxAA==', '573014582878', 3, NULL, '1700510379', '573014582878', '2023-11-20 19:59:32', '2023-11-20 19:59:40', 2, 745, NULL, 3781, 'ggg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(360, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNDA4NjM5RkI1MzY1MUQ5N0Y4AA==', '573014582878', 3, NULL, '1700510844', '573014582878', '2023-11-20 20:07:08', '2023-11-20 20:07:25', 2, 745, NULL, 3781, '', NULL, NULL, 45, 'image/jpeg', NULL, NULL, NULL, NULL, NULL),
(361, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQzU2MDZEQzc4QUZFRjNGMTIzAA==', '573014582878', 3, NULL, '1700510906', '573014582878', '2023-11-20 20:08:26', '2023-11-20 20:08:27', 2, 745, NULL, 3781, '', NULL, NULL, 45, 'image/jpeg', NULL, NULL, NULL, NULL, NULL),
(362, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRjRCOUUwRUMzODcxRjE3MDc5AA==', '573014582878', 3, NULL, '1700511101', '573014582878', '2023-11-20 20:11:41', '2023-11-20 20:11:42', 2, 745, NULL, 3781, '', NULL, NULL, 43, 'image/jpeg', NULL, NULL, NULL, NULL, NULL),
(363, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRUQxMTFBRjc5NDk3NTIyOEVCAA==', '573014582878', 3, NULL, '1700511131', '573014582878', '2023-11-20 20:12:10', '2023-11-20 20:12:12', 2, 745, NULL, 3781, '', NULL, NULL, 43, 'image/jpeg', NULL, NULL, NULL, NULL, NULL),
(364, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQUVBNEEwRUJGQTg1NzNGMjNBAA==', '573014582878', 3, NULL, '1700511374', '573014582878', '2023-11-20 20:16:13', '2023-11-20 20:16:15', 2, 745, NULL, 3781, '', NULL, NULL, 43, 'image/jpeg', NULL, NULL, NULL, NULL, NULL),
(365, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRjgxOTVBMUUzMkFDOTNDODlDAA==', '573014582878', 3, NULL, '1700511629', '573014582878', '2023-11-20 20:20:28', '2023-11-20 20:20:30', 2, 745, NULL, 3781, '', NULL, NULL, 43, 'image/jpeg', NULL, NULL, NULL, NULL, NULL),
(366, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQTM2OTM1MzA1NTlDQ0E3RjE2AA==', '573014582878', 3, NULL, '1700511636', '573014582878', '2023-11-20 20:20:35', '2023-11-20 20:20:37', 2, 745, NULL, 3781, '', NULL, NULL, 46, 'document', NULL, NULL, NULL, NULL, NULL),
(367, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNzMyQzQ5Rjg4QUE0QTJDQkM5AA==', '573014582878', 3, NULL, '1700511645', '573014582878', '2023-11-20 20:20:45', '2023-11-20 20:20:46', 2, 745, NULL, 3781, '', NULL, NULL, 45, 'image/jpeg', NULL, NULL, NULL, NULL, NULL),
(368, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRTdDMDcwNEYyMUVGQzgxMzhDAA==', '573014582878', 3, NULL, '1700511706', '573014582878', '2023-11-20 20:21:35', '2023-11-20 20:21:47', 2, 745, NULL, 3781, '', NULL, NULL, 44, 'audio/mpeg', NULL, NULL, NULL, NULL, NULL),
(369, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSOUZDRUVERDhEQjkzQkE1Q0NEAA==', '573014582878', 3, NULL, '1700511948', '573014582878', '2023-11-20 20:25:36', '2023-11-20 20:25:49', 2, 745, NULL, 3781, '', NULL, NULL, 46, 'document', NULL, NULL, NULL, NULL, NULL),
(370, 'wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMUJCREZCOUYyRDUwQkFFMzdDAA==', '573014582878', 3, NULL, '1700512074', '573014582878', '2023-11-20 20:27:54', '2023-11-20 20:27:55', 2, 745, NULL, 3781, '', NULL, NULL, 44, 'audio/mpeg', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `id` bigint NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `icon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `order` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` bigint DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `dad_id` bigint DEFAULT NULL,
  `estado_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id` bigint NOT NULL,
  `identificacion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `lugarexpedicion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fechaexpedicion` date DEFAULT NULL,
  `direccion` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telefono` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telefonomovil` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `telefonowhatsapp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sendemail` tinyint(1) DEFAULT NULL,
  `fechanacimiento` date DEFAULT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `segundonombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `apellido` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `segundoapellido` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `foto` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `barrio` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `observaciones` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` bigint DEFAULT NULL,
  `ciudad_id` int DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `departamento_id` int DEFAULT NULL,
  `ocupacion_id` int DEFAULT NULL,
  `pais_id` int DEFAULT NULL,
  `sexo_id` int DEFAULT NULL,
  `tipoidentificacion_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `zona_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id`, `identificacion`, `lugarexpedicion`, `fechaexpedicion`, `direccion`, `telefono`, `telefonomovil`, `telefonowhatsapp`, `email`, `sendemail`, `fechanacimiento`, `nombre`, `segundonombre`, `apellido`, `segundoapellido`, `foto`, `barrio`, `observaciones`, `created_at`, `updated_at`, `deleted_at`, `deleted_by`, `ciudad_id`, `created_by_id`, `departamento_id`, `ocupacion_id`, `pais_id`, `sexo_id`, `tipoidentificacion_id`, `updated_by_id`, `zona_id`) VALUES
(2937, NULL, NULL, NULL, NULL, NULL, '3042115334', '573042115334', NULL, 0, NULL, 'Yilberth', '', 'Galarza', '', NULL, NULL, NULL, '2023-07-18 00:06:27', '2023-07-18 00:06:27', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2938, NULL, NULL, NULL, NULL, NULL, '3014582878', '573014582878', NULL, 0, NULL, 'Nelson', '', 'Borrego', '', NULL, NULL, NULL, '2023-07-19 16:03:05', '2023-07-19 16:03:05', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peticion`
--

CREATE TABLE `peticion` (
  `id` bigint NOT NULL,
  `estado` varchar(1091) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `peticion`
--

INSERT INTO `peticion` (`id`, `estado`) VALUES
(291, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSQjJDRUQzQjY2NzE3OTE2MUZEAA==\", \"status\": \"failed\", \"timestamp\": \"1691456798\", \"recipient_id\": \"573042115334\", \"errors\": [{\"code\": 131053, \"title\": \"Media upload error\", \"message\": \"Media upload error\", \"error_data\": {\"details\": \"Downloading media from weblink failed with http code 404, status message Not Found\"}}]}]}, \"field\": \"messages\"}]}]'),
(292, 'Fallo'),
(293, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSQkQ5RkI2MTMzMUZDMDEyNUQzAA==\", \"status\": \"failed\", \"timestamp\": \"1691457142\", \"recipient_id\": \"573042115334\", \"errors\": [{\"code\": 131053, \"title\": \"Media upload error\", \"message\": \"Media upload error\", \"error_data\": {\"details\": \"Downloading media from weblink failed with http code 404, status message Not Found\"}}]}]}, \"field\": \"messages\"}]}]'),
(294, 'Fallo'),
(295, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSQ0M1QzJGM0Q2M0Y4NkZGRjlFAA==\", \"status\": \"sent\", \"timestamp\": \"1691457573\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"expiration_timestamp\": \"1691539800\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(296, 'Fallo'),
(297, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSQ0M1QzJGM0Q2M0Y4NkZGRjlFAA==\", \"status\": \"delivered\", \"timestamp\": \"1691457573\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(298, 'Fallo'),
(299, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSNkE0QkQ0NjEyODFFMDY1MTM1AA==\", \"status\": \"sent\", \"timestamp\": \"1691458404\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"expiration_timestamp\": \"1691539800\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(300, 'Fallo'),
(301, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSNkE0QkQ0NjEyODFFMDY1MTM1AA==\", \"status\": \"delivered\", \"timestamp\": \"1691458404\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(302, 'Fallo'),
(303, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRTU0Q0ZERTAyNkE2MjVCRkE2AA==\", \"status\": \"sent\", \"timestamp\": \"1691458490\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"expiration_timestamp\": \"1691539800\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(304, 'Fallo'),
(305, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRTU0Q0ZERTAyNkE2MjVCRkE2AA==\", \"status\": \"delivered\", \"timestamp\": \"1691458490\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(306, 'Fallo'),
(307, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSQ0E0MkI2N0I5RDUxQzZCM0FDAA==\", \"status\": \"sent\", \"timestamp\": \"1691458669\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"expiration_timestamp\": \"1691539800\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(308, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSQ0E0MkI2N0I5RDUxQzZCM0FDAA==\", \"status\": \"delivered\", \"timestamp\": \"1691458670\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(309, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSOUUwMEM2Q0Q4MkYwRDU1MzBDAA==\", \"status\": \"sent\", \"timestamp\": \"1691458941\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"expiration_timestamp\": \"1691539800\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(310, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSOUUwMEM2Q0Q4MkYwRDU1MzBDAA==\", \"status\": \"delivered\", \"timestamp\": \"1691458941\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(311, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSOUY4NkFBNjMyQ0M2MzFDNDhCAA==\", \"status\": \"sent\", \"timestamp\": \"1691459049\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"expiration_timestamp\": \"1691539800\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(312, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSOUY4NkFBNjMyQ0M2MzFDNDhCAA==\", \"status\": \"delivered\", \"timestamp\": \"1691459049\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(313, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSNEE2N0YyMTlFQTY2NDAyRDJBAA==\", \"status\": \"failed\", \"timestamp\": \"1691536768\", \"recipient_id\": \"573042115334\", \"errors\": [{\"code\": 131053, \"title\": \"Media upload error\", \"message\": \"Media upload error\", \"error_data\": {\"details\": \"Downloading media from weblink failed with http code 404, status message Not Found\"}}]}]}, \"field\": \"messages\"}]}]'),
(314, 'Fallo'),
(315, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRjgwOTNCNDZCNUJDNjI3NDg2AA==\", \"status\": \"sent\", \"timestamp\": \"1691536971\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"expiration_timestamp\": \"1691539800\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(316, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRjgwOTNCNDZCNUJDNjI3NDg2AA==\", \"status\": \"delivered\", \"timestamp\": \"1691536971\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(317, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSNjFFRjRCNjQwMkZCMUYxRDhBAA==\", \"status\": \"sent\", \"timestamp\": \"1691537270\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"expiration_timestamp\": \"1691539800\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(318, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSNjFFRjRCNjQwMkZCMUYxRDhBAA==\", \"status\": \"delivered\", \"timestamp\": \"1691537270\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(319, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSQjNFNjg3MTJCQzcyMzNDRERBAA==\", \"status\": \"delivered\", \"timestamp\": \"1691537412\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(320, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSQjNFNjg3MTJCQzcyMzNDRERBAA==\", \"status\": \"sent\", \"timestamp\": \"1691537411\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"expiration_timestamp\": \"1691539800\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(321, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSMzMyNjVFRkZGMTExNjA2ODY1AA==\", \"status\": \"sent\", \"timestamp\": \"1691537555\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"expiration_timestamp\": \"1691539800\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(322, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSMzMyNjVFRkZGMTExNjA2ODY1AA==\", \"status\": \"delivered\", \"timestamp\": \"1691537557\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(323, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSN0EyNzVFMzA1MEMyMkE5MENGAA==\", \"status\": \"sent\", \"timestamp\": \"1691537659\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"expiration_timestamp\": \"1691539800\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(324, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSN0EyNzVFMzA1MEMyMkE5MENGAA==\", \"status\": \"delivered\", \"timestamp\": \"1691537661\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(325, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSREY4MDA5OEFEMTRCRjRFRUY1AA==\", \"status\": \"sent\", \"timestamp\": \"1691537711\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"expiration_timestamp\": \"1691539800\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(326, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSREY4MDA5OEFEMTRCRjRFRUY1AA==\", \"status\": \"delivered\", \"timestamp\": \"1691537712\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(327, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRDhBRkI3RTE3NDFCMjgyNjU3AA==\", \"status\": \"sent\", \"timestamp\": \"1691537730\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"expiration_timestamp\": \"1691539800\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(328, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRDhBRkI3RTE3NDFCMjgyNjU3AA==\", \"status\": \"delivered\", \"timestamp\": \"1691537730\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(329, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSNzdDRjRDNzYzMTIwQjg5NDIzAA==\", \"status\": \"sent\", \"timestamp\": \"1691538026\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"expiration_timestamp\": \"1691539800\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(330, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSNzdDRjRDNzYzMTIwQjg5NDIzAA==\", \"status\": \"delivered\", \"timestamp\": \"1691538028\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c76692afedd664c6b0ef3af3d2fa56da\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(331, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"contacts\": [{\"profile\": {\"name\": \"Yilberth Andres\"}, \"wa_id\": \"573042115334\"}], \"messages\": [{\"from\": \"573042115334\", \"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggMkIzN0IyMTVCN0QzQjcwQjc0M0E1MUJDRDc4NEFGQ0QA\", \"timestamp\": \"1691541036\", \"text\": {\"body\": \"Hola\"}, \"type\": \"text\"}]}, \"field\": \"messages\"}]}]'),
(332, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSMzM0RUYyQkE5RjJGNTc4RDcyAA==\", \"status\": \"sent\", \"timestamp\": \"1691541049\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"9bb367673fbdf8774371516539f6ce74\", \"expiration_timestamp\": \"1691627460\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(333, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSMzM0RUYyQkE5RjJGNTc4RDcyAA==\", \"status\": \"delivered\", \"timestamp\": \"1691541049\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"9bb367673fbdf8774371516539f6ce74\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(334, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRjJFMTc3OEQ4MUIxREI4QzNGAA==\", \"status\": \"sent\", \"timestamp\": \"1691541175\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"9bb367673fbdf8774371516539f6ce74\", \"expiration_timestamp\": \"1691627460\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(335, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRjJFMTc3OEQ4MUIxREI4QzNGAA==\", \"status\": \"delivered\", \"timestamp\": \"1691541176\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"9bb367673fbdf8774371516539f6ce74\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(336, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRTBEN0M5RTgzRkRCOUY1NkE5AA==\", \"status\": \"sent\", \"timestamp\": \"1691541216\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"9bb367673fbdf8774371516539f6ce74\", \"expiration_timestamp\": \"1691627460\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(337, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRTBEN0M5RTgzRkRCOUY1NkE5AA==\", \"status\": \"delivered\", \"timestamp\": \"1691541216\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"9bb367673fbdf8774371516539f6ce74\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(338, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRkZFNkI3RDJENEMwNjEwREM2AA==\", \"status\": \"delivered\", \"timestamp\": \"1691541268\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"9bb367673fbdf8774371516539f6ce74\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(339, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRkZFNkI3RDJENEMwNjEwREM2AA==\", \"status\": \"sent\", \"timestamp\": \"1691541268\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"9bb367673fbdf8774371516539f6ce74\", \"expiration_timestamp\": \"1691627460\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(340, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRDAzOUUyMzJBREQ5RENBMzY4AA==\", \"status\": \"sent\", \"timestamp\": \"1691541655\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"9bb367673fbdf8774371516539f6ce74\", \"expiration_timestamp\": \"1691627460\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(341, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRDAzOUUyMzJBREQ5RENBMzY4AA==\", \"status\": \"delivered\", \"timestamp\": \"1691541655\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"9bb367673fbdf8774371516539f6ce74\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(342, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"contacts\": [{\"profile\": {\"name\": \"Yilberth Andres\"}, \"wa_id\": \"573042115334\"}], \"messages\": [{\"from\": \"573042115334\", \"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggQkJBNkJEOUQ1Rjk1RDE3M0Q4ODAxODk1MUYyQkU1MkIA\", \"timestamp\": \"1691542621\", \"type\": \"image\", \"image\": {\"mime_type\": \"image/jpeg\", \"sha256\": \"PScjhKexFpb5O6ByfQf41mkzY//w2uMUeL0zWvN1P10=\", \"id\": \"261466763406626\"}}]}, \"field\": \"messages\"}]}]'),
(343, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"contacts\": [{\"profile\": {\"name\": \"Yilberth Andres\"}, \"wa_id\": \"573042115334\"}], \"messages\": [{\"from\": \"573042115334\", \"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggRDFFQTQ5NUMzRDVDMzM5MjE1OENCNjFBREY2NUI2RUEA\", \"timestamp\": \"1691543552\", \"text\": {\"body\": \"Hola\"}, \"type\": \"text\"}]}, \"field\": \"messages\"}]}]'),
(344, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"contacts\": [{\"profile\": {\"name\": \"Yilberth Andres\"}, \"wa_id\": \"573042115334\"}], \"messages\": [{\"from\": \"573042115334\", \"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggMzQ4RERBNzI4MjE2ODBGRkEzN0E5QjE2MTc1QkVBNjgA\", \"timestamp\": \"1691543629\", \"text\": {\"body\": \".Hola\"}, \"type\": \"text\"}]}, \"field\": \"messages\"}]}]'),
(345, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"contacts\": [{\"profile\": {\"name\": \"Yilberth Andres\"}, \"wa_id\": \"573042115334\"}], \"messages\": [{\"from\": \"573042115334\", \"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggMTQ0MEM3QUE0OTM1NkMyOEQ5NkJBODg4OUQyMjdEQTgA\", \"timestamp\": \"1691543650\", \"text\": {\"body\": \".\"}, \"type\": \"text\"}]}, \"field\": \"messages\"}]}]'),
(346, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"contacts\": [{\"profile\": {\"name\": \"Yilberth Andres\"}, \"wa_id\": \"573042115334\"}], \"messages\": [{\"from\": \"573042115334\", \"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggMjFFNEE2RTE1ODZGMzQ2MjZDNDE0OEEwRDIyQzQ4NDAA\", \"timestamp\": \"1691543695\", \"text\": {\"body\": \".....\"}, \"type\": \"text\"}]}, \"field\": \"messages\"}]}]'),
(347, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"contacts\": [{\"profile\": {\"name\": \"Yilberth Andres\"}, \"wa_id\": \"573042115334\"}], \"messages\": [{\"from\": \"573042115334\", \"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggRDQ1OTlFMzg0RDk2OEU3Q0ExRTczRjk4NEY4REY0MzkA\", \"timestamp\": \"1691543706\", \"text\": {\"body\": \"Hola\"}, \"type\": \"text\"}]}, \"field\": \"messages\"}]}]'),
(348, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSOEZFMTkxNDIwNkVEQkNGQUUyAA==\", \"status\": \"sent\", \"timestamp\": \"1691543851\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"9bb367673fbdf8774371516539f6ce74\", \"expiration_timestamp\": \"1691627460\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(349, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSOEZFMTkxNDIwNkVEQkNGQUUyAA==\", \"status\": \"delivered\", \"timestamp\": \"1691543851\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"9bb367673fbdf8774371516539f6ce74\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(350, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"contacts\": [{\"profile\": {\"name\": \"Yilberth Andres\"}, \"wa_id\": \"573042115334\"}], \"messages\": [{\"from\": \"573042115334\", \"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggRDNEMkY2M0M2QzBCMjcwNjEwNzhEMjBEOUQxQzRBN0IA\", \"timestamp\": \"1691544868\", \"type\": \"image\", \"image\": {\"mime_type\": \"image/jpeg\", \"sha256\": \"/vFqJHo6649VXiufqv/wIAQ5P98qq0+hIS6LoyGyrpA=\", \"id\": \"306709195083724\"}}]}, \"field\": \"messages\"}]}]'),
(351, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSNDY4OTQ5OUU2NDAwQTFCNzVBAA==\", \"status\": \"sent\", \"timestamp\": \"1691544959\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"9bb367673fbdf8774371516539f6ce74\", \"expiration_timestamp\": \"1691627460\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(352, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSNDY4OTQ5OUU2NDAwQTFCNzVBAA==\", \"status\": \"delivered\", \"timestamp\": \"1691544959\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"9bb367673fbdf8774371516539f6ce74\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(353, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSMTU2N0ZERUVEOTVDMTEzRUM2AA==\", \"status\": \"sent\", \"timestamp\": \"1691545283\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"9bb367673fbdf8774371516539f6ce74\", \"expiration_timestamp\": \"1691627460\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(354, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSMTU2N0ZERUVEOTVDMTEzRUM2AA==\", \"status\": \"delivered\", \"timestamp\": \"1691545283\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"9bb367673fbdf8774371516539f6ce74\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(355, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRUVEM0E3N0I0MDExODU4MDAxAA==\", \"status\": \"sent\", \"timestamp\": \"1691545291\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"9bb367673fbdf8774371516539f6ce74\", \"expiration_timestamp\": \"1691627460\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(356, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSRUVEM0E3N0I0MDExODU4MDAxAA==\", \"status\": \"delivered\", \"timestamp\": \"1691545291\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"9bb367673fbdf8774371516539f6ce74\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(357, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSMDdEQTEyMDQ3RkVGN0Q2QjY5AA==\", \"status\": \"sent\", \"timestamp\": \"1691545306\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"9bb367673fbdf8774371516539f6ce74\", \"expiration_timestamp\": \"1691627460\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(358, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSMDdEQTEyMDQ3RkVGN0Q2QjY5AA==\", \"status\": \"delivered\", \"timestamp\": \"1691545306\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"9bb367673fbdf8774371516539f6ce74\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(359, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"contacts\": [{\"profile\": {\"name\": \"Yilberth Andres\"}, \"wa_id\": \"573042115334\"}], \"messages\": [{\"from\": \"573042115334\", \"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggQUU2MjZGMkVDOTYxQTEwQzU4OEIxNzY1REE5NDZGQTUA\", \"timestamp\": \"1691545757\", \"type\": \"video\", \"video\": {\"mime_type\": \"video/mp4\", \"sha256\": \"qJ6GXJlQTvOKniQLZ+3dZPIVgF4mWwO1AtsWwKYqFTY=\", \"id\": \"837519771050729\"}}]}, \"field\": \"messages\"}]}]'),
(360, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"contacts\": [{\"profile\": {\"name\": \"Yilberth Andres\"}, \"wa_id\": \"573042115334\"}], \"messages\": [{\"from\": \"573042115334\", \"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggNzQ0QTc2Q0M1QUVFNDZCQjM3RTJDQTczODVERkUxQUEA\", \"timestamp\": \"1691546469\", \"type\": \"video\", \"video\": {\"mime_type\": \"video/mp4\", \"sha256\": \"DegOR/D0BcHcgDw7oYLhzFvKYVBmtLgQQnOrBeBNCLc=\", \"id\": \"655534253296939\"}}]}, \"field\": \"messages\"}]}]'),
(361, '[{\"id\": \"103916249443809\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550491736\", \"phone_number_id\": \"112605838565124\"}, \"contacts\": [{\"profile\": {\"name\": \"Yilberth Andres\"}, \"wa_id\": \"573042115334\"}], \"messages\": [{\"from\": \"573042115334\", \"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAEhggMENBNEE5NDFBOEExOTg0NTE1MDlDQTdCQTlEMjY4NjMA\", \"timestamp\": \"1691546900\", \"type\": \"document\", \"document\": {\"filename\": \"2.1. Art\\u00edculo.pdf\", \"mime_type\": \"application/pdf\", \"sha256\": \"BOaFxAuWyLlzU5pkT2eOk7RGLvqp/ZcaEAJ6SEMj32g=\", \"id\": \"288871103728020\"}}]}, \"field\": \"messages\"}]}]'),
(362, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSQzQ2QkEyRDNGNDNFRDFFODE2AA==\", \"status\": \"sent\", \"timestamp\": \"1699464571\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c1b14d8ea0db90ea9c0cf8be025e79b0\", \"expiration_timestamp\": \"1699544580\", \"origin\": {\"type\": \"marketing\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"marketing\"}}]}, \"field\": \"messages\"}]}]'),
(363, 'Fallo'),
(364, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSQzQ2QkEyRDNGNDNFRDFFODE2AA==\", \"status\": \"delivered\", \"timestamp\": \"1699464572\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"c1b14d8ea0db90ea9c0cf8be025e79b0\", \"origin\": {\"type\": \"marketing\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"marketing\"}}]}, \"field\": \"messages\"}]}]'),
(365, 'Fallo'),
(366, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMEU2M0JFMjE2OUU0NEU4NjNEAA==\", \"status\": \"sent\", \"timestamp\": \"1699464574\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"6c6dd22ea49b89bfc21d41e4b5717a59\", \"expiration_timestamp\": \"1699544520\", \"origin\": {\"type\": \"marketing\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"marketing\"}}]}, \"field\": \"messages\"}]}]'),
(367, 'Fallo'),
(368, 'Error peticion inicial: (\'Expecting value: line 1 column 1 (char 0)\',)'),
(369, 'Expecting value: line 1 column 1 (char 0)'),
(370, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNDExQ0ZFQjI4Qzg5MzY3NDY1AA==\", \"status\": \"sent\", \"timestamp\": \"1699831695\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"ba22f4f3023918c1cd69ed0e5f5a244b\", \"expiration_timestamp\": \"1699915920\", \"origin\": {\"type\": \"marketing\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"marketing\"}}]}, \"field\": \"messages\"}]}]'),
(371, 'Error peticion inicial: (\'Invalid request\',)'),
(372, 'Invalid request'),
(373, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNDExQ0ZFQjI4Qzg5MzY3NDY1AA==\", \"status\": \"delivered\", \"timestamp\": \"1699831696\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"ba22f4f3023918c1cd69ed0e5f5a244b\", \"origin\": {\"type\": \"marketing\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"marketing\"}}]}, \"field\": \"messages\"}]}]'),
(374, 'Error peticion inicial: (\'Invalid request\',)'),
(375, 'Invalid request'),
(376, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"contacts\": [{\"profile\": {\"name\": \"Nelson\"}, \"wa_id\": \"573014582878\"}], \"messages\": [{\"from\": \"573014582878\", \"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAEhggMUU4RkI2RTc3M0RDNzkzODY2RkY5QkUzOTIxQTA0ODkA\", \"timestamp\": \"1699832292\", \"text\": {\"body\": \"Hghghg\"}, \"type\": \"text\"}]}, \"field\": \"messages\"}]}]'),
(377, 'Fallo websockets: (\'Error -3 connecting to redis:6379. -3.\',)'),
(378, 'Error peticion inicial: (\'Invalid request\',)'),
(379, 'Invalid request'),
(380, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"contacts\": [{\"profile\": {\"name\": \"Nelson\"}, \"wa_id\": \"573014582878\"}], \"messages\": [{\"from\": \"573014582878\", \"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAEhggM0Y5RjhDNzRGOTY4M0JDMzM5QzAxMTcxOTdGMDc1RjAA\", \"timestamp\": \"1699832323\", \"text\": {\"body\": \"1234\"}, \"type\": \"text\"}]}, \"field\": \"messages\"}]}]'),
(381, 'Fallo websockets: (\'Error -3 connecting to redis:6379. -3.\',)'),
(382, 'Error peticion inicial: (\'Invalid request\',)'),
(383, 'Invalid request'),
(384, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"contacts\": [{\"profile\": {\"name\": \"Nelson\"}, \"wa_id\": \"573014582878\"}], \"messages\": [{\"from\": \"573014582878\", \"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAEhggNDc5RjA3RTg3QUFBMUMyRDBDNEM1RkIyMzk1ODI5RUUA\", \"timestamp\": \"1699831954\", \"text\": {\"body\": \"Fdd\"}, \"type\": \"text\"}]}, \"field\": \"messages\"}]}]'),
(385, 'Fallo websockets: (\'Error -3 connecting to redis:6379. -3.\',)'),
(386, 'Error peticion inicial: (\'Invalid request\',)'),
(387, 'Invalid request'),
(388, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"contacts\": [{\"profile\": {\"name\": \"Nelson\"}, \"wa_id\": \"573014582878\"}], \"messages\": [{\"from\": \"573014582878\", \"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAEhggMTA2QUU5N0IxQzVENTZGODA2OUFEN0RGNEQ2QjA5ODkA\", \"timestamp\": \"1699832367\", \"text\": {\"body\": \"567\"}, \"type\": \"text\"}]}, \"field\": \"messages\"}]}]'),
(389, 'Fallo websockets: (\'Error -3 connecting to redis:6379. -3.\',)'),
(390, 'Error peticion inicial: (\'Invalid request\',)'),
(391, 'Invalid request'),
(392, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"contacts\": [{\"profile\": {\"name\": \"Nelson\"}, \"wa_id\": \"573014582878\"}], \"messages\": [{\"from\": \"573014582878\", \"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAEhggODFFRUY3M0NCQzc1QkFCRjIzRDhCNUI3Mjc2Q0QwMTEA\", \"timestamp\": \"1699831945\", \"text\": {\"body\": \"Uaua\"}, \"type\": \"text\"}]}, \"field\": \"messages\"}]}]'),
(393, 'Fallo websockets: (\'Error -3 connecting to redis:6379. -3.\',)'),
(394, 'Error peticion inicial: (\'Invalid request\',)'),
(395, 'Invalid request'),
(396, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQTc4QkMzNUUwOTJCRDc0ODMyAA==\", \"status\": \"delivered\", \"timestamp\": \"1699831940\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"ba22f4f3023918c1cd69ed0e5f5a244b\", \"origin\": {\"type\": \"marketing\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"marketing\"}}]}, \"field\": \"messages\"}]}]'),
(397, 'Error al actualizar mensaje: '),
(398, 'Mensajeria matching query does not exist.'),
(399, 'Error peticion inicial: (\'Invalid request\',)'),
(400, 'Invalid request'),
(401, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"contacts\": [{\"profile\": {\"name\": \"Nelson\"}, \"wa_id\": \"573014582878\"}], \"messages\": [{\"from\": \"573014582878\", \"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAEhggQzRGQzc4NDI4QUU5ODc1MUE4MjlGMTcwRTExMTlDNEUA\", \"timestamp\": \"1699832410\", \"text\": {\"body\": \"Uiui\"}, \"type\": \"text\"}]}, \"field\": \"messages\"}]}]'),
(402, 'Fallo websockets: (\'Error -3 connecting to redis:6379. -3.\',)'),
(403, 'Error peticion inicial: (\'Invalid request\',)'),
(404, 'Invalid request'),
(405, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"contacts\": [{\"profile\": {\"name\": \"Nelson\"}, \"wa_id\": \"573014582878\"}], \"messages\": [{\"from\": \"573014582878\", \"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAEhggQzBFMzdENTZERENGMTQwNUE0N0ZEMzdBMENBMTVBMDUA\", \"timestamp\": \"1699831996\", \"text\": {\"body\": \"Gfgf\"}, \"type\": \"text\"}]}, \"field\": \"messages\"}]}]'),
(406, 'Fallo websockets: (\'Error -3 connecting to redis:6379. -3.\',)'),
(407, 'Error peticion inicial: (\'Invalid request\',)'),
(408, 'Invalid request'),
(409, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"contacts\": [{\"profile\": {\"name\": \"Nelson\"}, \"wa_id\": \"573014582878\"}], \"messages\": [{\"from\": \"573014582878\", \"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAEhggMDMzNDI2OTJCQjc4N0MwRTVGMDQ4M0E1QTA4MUI4RDEA\", \"timestamp\": \"1699832446\", \"text\": {\"body\": \"Ytyt\"}, \"type\": \"text\"}]}, \"field\": \"messages\"}]}]'),
(410, 'Fallo websockets: (\'Error -3 connecting to redis:6379. -3.\',)'),
(411, 'Error peticion inicial: (\'Invalid request\',)'),
(412, 'Invalid request'),
(413, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNTdFQkY3NjlDMzk5RDJEM0JDAA==\", \"status\": \"sent\", \"timestamp\": \"1699832459\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"ba22f4f3023918c1cd69ed0e5f5a244b\", \"expiration_timestamp\": \"1699915920\", \"origin\": {\"type\": \"marketing\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"marketing\"}}]}, \"field\": \"messages\"}]}]');
INSERT INTO `peticion` (`id`, `estado`) VALUES
(414, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNTdFQkY3NjlDMzk5RDJEM0JDAA==\", \"status\": \"delivered\", \"timestamp\": \"1699832459\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"ba22f4f3023918c1cd69ed0e5f5a244b\", \"origin\": {\"type\": \"marketing\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"marketing\"}}]}, \"field\": \"messages\"}]}]'),
(415, 'Error peticion inicial: (\'Invalid request\',)'),
(416, 'Invalid request'),
(417, 'Error peticion inicial: (\'Invalid request\',)'),
(418, 'Invalid request'),
(419, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"contacts\": [{\"profile\": {\"name\": \"Nelson\"}, \"wa_id\": \"573014582878\"}], \"messages\": [{\"from\": \"573014582878\", \"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAEhggOTM5REFDQjNFQTAwNzZBOTE3MDMwQTkxREU5NkQwNDQA\", \"timestamp\": \"1699832464\", \"text\": {\"body\": \"Yuyu\"}, \"type\": \"text\"}]}, \"field\": \"messages\"}]}]'),
(420, 'Fallo websockets: (\'Error -3 connecting to redis:6379. -3.\',)'),
(421, 'Error peticion inicial: (\'Invalid request\',)'),
(422, 'Invalid request'),
(423, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"contacts\": [{\"profile\": {\"name\": \"Nelson\"}, \"wa_id\": \"573014582878\"}], \"messages\": [{\"from\": \"573014582878\", \"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAEhggQUJBRjI0QURCODhENkRFMzM2OTJCMDA3NTVGQTc0RjYA\", \"timestamp\": \"1699832641\", \"text\": {\"body\": \"Lll\"}, \"type\": \"text\"}]}, \"field\": \"messages\"}]}]'),
(424, 'Fallo websockets: (\'Error -3 connecting to redis:6379. -3.\',)'),
(425, 'Error peticion inicial: (\'Invalid request\',)'),
(426, 'Invalid request'),
(427, 'Error peticion inicial: (\'Expecting value: line 1 column 1 (char 0)\',)'),
(428, 'Expecting value: line 1 column 1 (char 0)'),
(429, 'Error peticion inicial: (\'Expecting value: line 1 column 1 (char 0)\',)'),
(430, 'Expecting value: line 1 column 1 (char 0)'),
(431, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMzA3REEzN0QxRDU1MzdGRDY0AA==\", \"status\": \"sent\", \"timestamp\": \"1699829996\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"ba22f4f3023918c1cd69ed0e5f5a244b\", \"expiration_timestamp\": \"1699915920\", \"origin\": {\"type\": \"marketing\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"marketing\"}}]}, \"field\": \"messages\"}]}]'),
(432, 'Error al actualizar mensaje: '),
(433, 'Mensajeria matching query does not exist.'),
(434, 'Error peticion inicial: (\'Invalid request\',)'),
(435, 'Invalid request'),
(436, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQkJDRjA3MEI3RDJEQTA5RDZEAA==\", \"status\": \"sent\", \"timestamp\": \"1699829602\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"ba22f4f3023918c1cd69ed0e5f5a244b\", \"expiration_timestamp\": \"1699915920\", \"origin\": {\"type\": \"marketing\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"marketing\"}}]}, \"field\": \"messages\"}]}]'),
(437, 'Error al actualizar mensaje: '),
(438, 'Mensajeria matching query does not exist.'),
(439, 'Error peticion inicial: (\'Invalid request\',)'),
(440, 'Invalid request'),
(441, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQTc4QkMzNUUwOTJCRDc0ODMyAA==\", \"status\": \"sent\", \"timestamp\": \"1699831939\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"ba22f4f3023918c1cd69ed0e5f5a244b\", \"expiration_timestamp\": \"1699915920\", \"origin\": {\"type\": \"marketing\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"marketing\"}}]}, \"field\": \"messages\"}]}]'),
(442, 'Error al actualizar mensaje: '),
(443, 'Mensajeria matching query does not exist.'),
(444, 'Error peticion inicial: (\'Invalid request\',)'),
(445, 'Invalid request'),
(446, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"contacts\": [{\"profile\": {\"name\": \"Nelson\"}, \"wa_id\": \"573014582878\"}], \"messages\": [{\"from\": \"573014582878\", \"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAEhggODBDRjI4REY4NTcwNTJBOUVGNDJBMEMyMTdFMTE0NjQA\", \"timestamp\": \"1699833346\", \"text\": {\"body\": \"Ui\"}, \"type\": \"text\"}]}, \"field\": \"messages\"}]}]'),
(447, 'Fallo websockets: (\'Error -3 connecting to redis:6379. -3.\',)'),
(448, 'Error peticion inicial: (\'Invalid request\',)'),
(449, 'Invalid request'),
(450, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNEFDRTYxRDI3QTBGMTMyNDc1AA==\", \"status\": \"delivered\", \"timestamp\": \"1699829470\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"ba22f4f3023918c1cd69ed0e5f5a244b\", \"origin\": {\"type\": \"marketing\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"marketing\"}}]}, \"field\": \"messages\"}]}]'),
(451, 'Error al actualizar mensaje: '),
(452, 'Mensajeria matching query does not exist.'),
(453, 'Error peticion inicial: (\'Invalid request\',)'),
(454, 'Invalid request'),
(455, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQjgyQ0JFNEU5QkFFNkM1ODc2AA==\", \"status\": \"delivered\", \"timestamp\": \"1699831268\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"ba22f4f3023918c1cd69ed0e5f5a244b\", \"origin\": {\"type\": \"marketing\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"marketing\"}}]}, \"field\": \"messages\"}]}]'),
(456, 'Error al actualizar mensaje: '),
(457, 'Mensajeria matching query does not exist.'),
(458, 'Error peticion inicial: (\'Invalid request\',)'),
(459, 'Invalid request'),
(460, 'Error peticion inicial: (\'Expecting value: line 1 column 1 (char 0)\',)'),
(461, 'Expecting value: line 1 column 1 (char 0)'),
(462, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"contacts\": [{\"profile\": {\"name\": \"Nelson\"}, \"wa_id\": \"573014582878\"}], \"messages\": [{\"from\": \"573014582878\", \"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAEhggNzVDODIyMThFOTA2ODgwQjM5RkQyQkM1QjUyNjk5NjAA\", \"timestamp\": \"1699895248\", \"text\": {\"body\": \"3\"}, \"type\": \"text\"}]}, \"field\": \"messages\"}]}]'),
(463, 'Fallo websockets: (\'Error -3 connecting to redis:6379. -3.\',)'),
(464, 'Error peticion inicial: (\'Invalid request\',)'),
(465, 'Invalid request'),
(466, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMzA3REEzN0QxRDU1MzdGRDY0AA==\", \"status\": \"delivered\", \"timestamp\": \"1699830004\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"ba22f4f3023918c1cd69ed0e5f5a244b\", \"origin\": {\"type\": \"marketing\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"marketing\"}}]}, \"field\": \"messages\"}]}]'),
(467, 'Error al actualizar mensaje: '),
(468, 'Mensajeria matching query does not exist.'),
(469, 'Error peticion inicial: (\'Invalid request\',)'),
(470, 'Invalid request'),
(471, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"contacts\": [{\"profile\": {\"name\": \"Nelson\"}, \"wa_id\": \"573014582878\"}], \"messages\": [{\"from\": \"573014582878\", \"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAEhggNENCRUY4MzhFRjlBNUVBNDYzQUFBRjA0ODA2MjEyRjAA\", \"timestamp\": \"1699830978\", \"text\": {\"body\": \"Uuu\"}, \"type\": \"text\"}]}, \"field\": \"messages\"}]}]'),
(472, 'Fallo websockets: (\'Error -3 connecting to redis:6379. -3.\',)'),
(473, 'Error peticion inicial: (\'Invalid request\',)'),
(474, 'Invalid request'),
(475, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSMTkwMERDNjk5MEJGNDlDNUNCAA==\", \"status\": \"delivered\", \"timestamp\": \"1699829475\", \"recipient_id\": \"573042115334\", \"conversation\": {\"id\": \"03572a9d338bae41c857af80cd2fd724\", \"origin\": {\"type\": \"marketing\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"marketing\"}}]}, \"field\": \"messages\"}]}]'),
(476, 'Error al actualizar mensaje: '),
(477, 'Mensajeria matching query does not exist.'),
(478, 'Error peticion inicial: (\'Invalid request\',)'),
(479, 'Invalid request'),
(480, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSN0MzNjg5QjY2QUExM0M0QUIwAA==\", \"status\": \"delivered\", \"timestamp\": \"1699829500\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"ba22f4f3023918c1cd69ed0e5f5a244b\", \"origin\": {\"type\": \"marketing\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"marketing\"}}]}, \"field\": \"messages\"}]}]'),
(481, 'Error al actualizar mensaje: '),
(482, 'Mensajeria matching query does not exist.'),
(483, 'Error peticion inicial: (\'Invalid request\',)'),
(484, 'Invalid request'),
(485, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNTgzQzJDRkYwRkJCQkQ1MENFAA==\", \"status\": \"sent\", \"timestamp\": \"1699829512\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"ba22f4f3023918c1cd69ed0e5f5a244b\", \"expiration_timestamp\": \"1699915920\", \"origin\": {\"type\": \"marketing\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"marketing\"}}]}, \"field\": \"messages\"}]}]'),
(486, 'Error al actualizar mensaje: '),
(487, 'Mensajeria matching query does not exist.'),
(488, 'Error peticion inicial: (\'Invalid request\',)'),
(489, 'Invalid request'),
(490, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQ0I0QTYxQjVFNTM2RjA5MDE0AA==\", \"status\": \"delivered\", \"timestamp\": \"1699829066\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"a64944f73172b28c61ec259df4060df6\", \"origin\": {\"type\": \"utility\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"utility\"}}]}, \"field\": \"messages\"}]}]'),
(491, 'Error al actualizar mensaje: '),
(492, 'Mensajeria matching query does not exist.'),
(493, 'Error peticion inicial: (\'Invalid request\',)'),
(494, 'Invalid request'),
(495, 'Error peticion inicial: (\'Expecting value: line 1 column 1 (char 0)\',)'),
(496, 'Expecting value: line 1 column 1 (char 0)'),
(497, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMTdGNENERDkyMDEyMUVENUU3AA==\", \"status\": \"failed\", \"timestamp\": \"1700325389\", \"recipient_id\": \"573014582878\", \"errors\": [{\"code\": 131047, \"title\": \"Re-engagement message\", \"message\": \"Re-engagement message\", \"error_data\": {\"details\": \"Message failed to send because more than 24 hours have passed since the customer last replied to this number.\"}, \"href\": \"https://developers.facebook.com/docs/whatsapp/cloud-api/support/error-codes/\"}]}]}, \"field\": \"messages\"}]}]'),
(498, 'Error al actualizar mensaje: '),
(499, 'local variable \'estado\' referenced before assignment'),
(500, 'Error peticion inicial: (\'Invalid request\',)'),
(501, 'Invalid request'),
(502, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"contacts\": [{\"profile\": {\"name\": \"Nelson\"}, \"wa_id\": \"573014582878\"}], \"messages\": [{\"from\": \"573014582878\", \"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAEhggMTIyOUVCNzBEODE4OTkyODUzMDkzQzE3NTk1QjVDOTYA\", \"timestamp\": \"1700325398\", \"text\": {\"body\": \"H\"}, \"type\": \"text\"}]}, \"field\": \"messages\"}]}]'),
(503, 'Error peticion inicial: (\'Invalid request\',)'),
(504, 'Invalid request'),
(505, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSREE4QUUzOTgwQTYyOTM2NkY4AA==\", \"status\": \"sent\", \"timestamp\": \"1700325407\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"expiration_timestamp\": \"1700411820\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(506, 'Error peticion inicial: (\'Invalid request\',)'),
(507, 'Invalid request'),
(508, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSREE4QUUzOTgwQTYyOTM2NkY4AA==\", \"status\": \"delivered\", \"timestamp\": \"1700325407\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(509, 'Error peticion inicial: (\'Invalid request\',)'),
(510, 'Invalid request'),
(511, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQzlENzA4NDEzM0U3REM0QkYwAA==\", \"status\": \"sent\", \"timestamp\": \"1700325430\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"expiration_timestamp\": \"1700411820\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(512, 'Error peticion inicial: (\'Invalid request\',)'),
(513, 'Invalid request'),
(514, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQzlENzA4NDEzM0U3REM0QkYwAA==\", \"status\": \"delivered\", \"timestamp\": \"1700325430\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(515, 'Error peticion inicial: (\'Invalid request\',)'),
(516, 'Invalid request'),
(517, 'Error peticion inicial: (\'Expecting value: line 1 column 1 (char 0)\',)'),
(518, 'Expecting value: line 1 column 1 (char 0)'),
(519, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"contacts\": [{\"profile\": {\"name\": \"Nelson\"}, \"wa_id\": \"573014582878\"}], \"messages\": [{\"from\": \"573014582878\", \"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAEhggNjMzRjdFQTdGMTk0MjZDMTNCOUMxMzc1QjNGRDYyRkIA\", \"timestamp\": \"1699833534\", \"text\": {\"body\": \"56\"}, \"type\": \"text\"}]}, \"field\": \"messages\"}]}]'),
(520, 'Error peticion inicial: (\'Invalid request\',)'),
(521, 'Invalid request'),
(522, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMDcyNzNEQkFDMUUxMUExNjc2AA==\", \"status\": \"delivered\", \"timestamp\": \"1699829523\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"ba22f4f3023918c1cd69ed0e5f5a244b\", \"origin\": {\"type\": \"marketing\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"marketing\"}}]}, \"field\": \"messages\"}]}]'),
(523, 'Error al actualizar mensaje: '),
(524, 'Mensajeria matching query does not exist.'),
(525, 'Error peticion inicial: (\'Invalid request\',)'),
(526, 'Invalid request'),
(527, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSN0MzNjg5QjY2QUExM0M0QUIwAA==\", \"status\": \"sent\", \"timestamp\": \"1699829500\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"ba22f4f3023918c1cd69ed0e5f5a244b\", \"expiration_timestamp\": \"1699915920\", \"origin\": {\"type\": \"marketing\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"marketing\"}}]}, \"field\": \"messages\"}]}]'),
(528, 'Error al actualizar mensaje: '),
(529, 'Mensajeria matching query does not exist.'),
(530, 'Error peticion inicial: (\'Invalid request\',)'),
(531, 'Invalid request'),
(532, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMTU5RjAyNkM0NzBEQzQxNjVDAA==\", \"status\": \"sent\", \"timestamp\": \"1700360423\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"expiration_timestamp\": \"1700411820\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(533, 'Error al actualizar mensaje: '),
(534, 'Mensajeria matching query does not exist.'),
(535, 'Error peticion inicial: (\'Invalid request\',)'),
(536, 'Invalid request'),
(537, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMTU5RjAyNkM0NzBEQzQxNjVDAA==\", \"status\": \"delivered\", \"timestamp\": \"1700360424\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(538, 'Error al actualizar mensaje: '),
(539, 'Mensajeria matching query does not exist.'),
(540, 'Error peticion inicial: (\'Invalid request\',)'),
(541, 'Invalid request'),
(542, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRjM2NzAzMDJDNjFBMzRCNDE5AA==\", \"status\": \"sent\", \"timestamp\": \"1700360893\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"expiration_timestamp\": \"1700411820\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(543, 'Error peticion inicial: (\'Invalid request\',)'),
(544, 'Invalid request'),
(545, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRjM2NzAzMDJDNjFBMzRCNDE5AA==\", \"status\": \"delivered\", \"timestamp\": \"1700360894\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(546, 'Error peticion inicial: (\'Invalid request\',)'),
(547, 'Invalid request'),
(548, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNTc2QUEyODRCMTU5MDkwMkU3AA==\", \"status\": \"sent\", \"timestamp\": \"1700362080\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"expiration_timestamp\": \"1700411820\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(549, 'Error al actualizar mensaje: '),
(550, 'Mensajeria matching query does not exist.'),
(551, 'Error peticion inicial: (\'Invalid request\',)'),
(552, 'Invalid request'),
(553, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNTc2QUEyODRCMTU5MDkwMkU3AA==\", \"status\": \"delivered\", \"timestamp\": \"1700362081\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(554, 'Error al actualizar mensaje: '),
(555, 'Mensajeria matching query does not exist.'),
(556, 'Error peticion inicial: (\'Invalid request\',)'),
(557, 'Invalid request'),
(558, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSN0E3NTk4NjU0MzkwMTc3QzFFAA==\", \"status\": \"sent\", \"timestamp\": \"1700362139\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"expiration_timestamp\": \"1700411820\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(559, 'Error al actualizar mensaje: '),
(560, 'Mensajeria matching query does not exist.'),
(561, 'Error peticion inicial: (\'Invalid request\',)'),
(562, 'Invalid request'),
(563, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSN0E3NTk4NjU0MzkwMTc3QzFFAA==\", \"status\": \"delivered\", \"timestamp\": \"1700362139\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(564, 'Error al actualizar mensaje: '),
(565, 'Mensajeria matching query does not exist.'),
(566, 'Error peticion inicial: (\'Invalid request\',)'),
(567, 'Invalid request'),
(568, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQkFFNEI0MjdDMEQwNjZCMzJDAA==\", \"status\": \"sent\", \"timestamp\": \"1700362243\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"expiration_timestamp\": \"1700411820\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(569, 'Error al actualizar mensaje: '),
(570, 'Mensajeria matching query does not exist.'),
(571, 'Error peticion inicial: (\'Invalid request\',)'),
(572, 'Invalid request'),
(573, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQkFFNEI0MjdDMEQwNjZCMzJDAA==\", \"status\": \"delivered\", \"timestamp\": \"1700362244\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(574, 'Error al actualizar mensaje: '),
(575, 'Mensajeria matching query does not exist.'),
(576, 'Error peticion inicial: (\'Invalid request\',)'),
(577, 'Invalid request'),
(578, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRTNBQjJEMjAwRjAzNzg5ODhGAA==\", \"status\": \"sent\", \"timestamp\": \"1700362474\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"expiration_timestamp\": \"1700411820\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(579, 'Error al actualizar mensaje: '),
(580, 'Mensajeria matching query does not exist.'),
(581, 'Error peticion inicial: (\'Invalid request\',)'),
(582, 'Invalid request'),
(583, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRTNBQjJEMjAwRjAzNzg5ODhGAA==\", \"status\": \"delivered\", \"timestamp\": \"1700362481\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(584, 'Error al actualizar mensaje: '),
(585, 'Mensajeria matching query does not exist.'),
(586, 'Error peticion inicial: (\'Invalid request\',)'),
(587, 'Invalid request'),
(588, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQkM3QjA2QkQ4NUVFQjZCOEQyAA==\", \"status\": \"sent\", \"timestamp\": \"1700362594\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"expiration_timestamp\": \"1700411820\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(589, 'Error al actualizar mensaje: '),
(590, 'Mensajeria matching query does not exist.'),
(591, 'Error peticion inicial: (\'Invalid request\',)'),
(592, 'Invalid request'),
(593, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQkM3QjA2QkQ4NUVFQjZCOEQyAA==\", \"status\": \"delivered\", \"timestamp\": \"1700362601\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(594, 'Error al actualizar mensaje: '),
(595, 'Mensajeria matching query does not exist.'),
(596, 'Error peticion inicial: (\'Invalid request\',)'),
(597, 'Invalid request'),
(598, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSOTIwNTJCMTk3REIwNDgzNEY1AA==\", \"status\": \"sent\", \"timestamp\": \"1700362627\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"expiration_timestamp\": \"1700411820\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(599, 'Error al actualizar mensaje: '),
(600, 'Mensajeria matching query does not exist.'),
(601, 'Error peticion inicial: (\'Invalid request\',)'),
(602, 'Invalid request'),
(603, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSOTIwNTJCMTk3REIwNDgzNEY1AA==\", \"status\": \"delivered\", \"timestamp\": \"1700362628\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(604, 'Error al actualizar mensaje: '),
(605, 'Mensajeria matching query does not exist.'),
(606, 'Error peticion inicial: (\'Invalid request\',)'),
(607, 'Invalid request'),
(608, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMDQyOUQzNEQwQjM1NTM5REM0AA==\", \"status\": \"sent\", \"timestamp\": \"1700362688\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"expiration_timestamp\": \"1700411820\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(609, 'Error al actualizar mensaje: '),
(610, 'Mensajeria matching query does not exist.'),
(611, 'Error peticion inicial: (\'Invalid request\',)'),
(612, 'Invalid request'),
(613, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMDQyOUQzNEQwQjM1NTM5REM0AA==\", \"status\": \"delivered\", \"timestamp\": \"1700362688\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(614, 'Error al actualizar mensaje: '),
(615, 'Mensajeria matching query does not exist.'),
(616, 'Error peticion inicial: (\'Invalid request\',)'),
(617, 'Invalid request'),
(618, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMDJFRDQzNEIyMzA4RTYyNjY2AA==\", \"status\": \"sent\", \"timestamp\": \"1700362711\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"expiration_timestamp\": \"1700411820\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(619, 'Error peticion inicial: (\'Invalid request\',)'),
(620, 'Invalid request'),
(621, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMDJFRDQzNEIyMzA4RTYyNjY2AA==\", \"status\": \"delivered\", \"timestamp\": \"1700362712\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(622, 'Error peticion inicial: (\'Invalid request\',)'),
(623, 'Invalid request'),
(624, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRTA4MENGQjExRjA1RjRGOEI2AA==\", \"status\": \"sent\", \"timestamp\": \"1700362810\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"expiration_timestamp\": \"1700411820\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(625, 'Error peticion inicial: (\'Invalid request\',)'),
(626, 'Invalid request'),
(627, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRTA4MENGQjExRjA1RjRGOEI2AA==\", \"status\": \"delivered\", \"timestamp\": \"1700362817\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(628, 'Error peticion inicial: (\'Invalid request\',)'),
(629, 'Invalid request'),
(630, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQTBGMjE1RkUyOTBDRUJBRTEzAA==\", \"status\": \"sent\", \"timestamp\": \"1700362943\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"expiration_timestamp\": \"1700411820\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(631, 'Error peticion inicial: (\'Invalid request\',)'),
(632, 'Invalid request'),
(633, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQTBGMjE1RkUyOTBDRUJBRTEzAA==\", \"status\": \"delivered\", \"timestamp\": \"1700362944\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(634, 'Error peticion inicial: (\'Invalid request\',)'),
(635, 'Invalid request'),
(636, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQjczRkJGNUNEMDM4QzI4QjBEAA==\", \"status\": \"sent\", \"timestamp\": \"1700362962\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"expiration_timestamp\": \"1700411820\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(637, 'Error peticion inicial: (\'Invalid request\',)'),
(638, 'Invalid request'),
(639, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQjczRkJGNUNEMDM4QzI4QjBEAA==\", \"status\": \"delivered\", \"timestamp\": \"1700362963\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(640, 'Error peticion inicial: (\'Invalid request\',)'),
(641, 'Invalid request'),
(642, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRTBGMjc3ODlCRDg1RDA1MzM2AA==\", \"status\": \"sent\", \"timestamp\": \"1700363167\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"expiration_timestamp\": \"1700411820\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(643, 'Error peticion inicial: (\'Invalid request\',)'),
(644, 'Invalid request'),
(645, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRTBGMjc3ODlCRDg1RDA1MzM2AA==\", \"status\": \"delivered\", \"timestamp\": \"1700363168\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(646, 'Error peticion inicial: (\'Invalid request\',)'),
(647, 'Invalid request'),
(648, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQzIzRTVFOTMxMEE4OTc0MTgyAA==\", \"status\": \"sent\", \"timestamp\": \"1700363209\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"expiration_timestamp\": \"1700411820\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(649, 'Error peticion inicial: (\'Invalid request\',)'),
(650, 'Invalid request'),
(651, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQzIzRTVFOTMxMEE4OTc0MTgyAA==\", \"status\": \"delivered\", \"timestamp\": \"1700363209\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(652, 'Error peticion inicial: (\'Invalid request\',)'),
(653, 'Invalid request'),
(654, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQjg0MDhGNTIwMjY4NDlBMzU4AA==\", \"status\": \"sent\", \"timestamp\": \"1700363255\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"expiration_timestamp\": \"1700411820\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(655, 'Error peticion inicial: (\'Invalid request\',)'),
(656, 'Invalid request'),
(657, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQjg0MDhGNTIwMjY4NDlBMzU4AA==\", \"status\": \"delivered\", \"timestamp\": \"1700363256\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(658, 'Error peticion inicial: (\'Invalid request\',)'),
(659, 'Invalid request'),
(660, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSOEE4OUY4MUIwRkRCRkFFNzE2AA==\", \"status\": \"sent\", \"timestamp\": \"1700363285\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"expiration_timestamp\": \"1700411820\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(661, 'Error peticion inicial: (\'Invalid request\',)'),
(662, 'Invalid request'),
(663, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSOEE4OUY4MUIwRkRCRkFFNzE2AA==\", \"status\": \"delivered\", \"timestamp\": \"1700363285\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(664, 'Error peticion inicial: (\'Invalid request\',)'),
(665, 'Invalid request'),
(666, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQzRFREJFMzNFMzQxMTc5RjhFAA==\", \"status\": \"sent\", \"timestamp\": \"1700363293\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"expiration_timestamp\": \"1700411820\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(667, 'Error peticion inicial: (\'Invalid request\',)'),
(668, 'Invalid request'),
(669, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQzRFREJFMzNFMzQxMTc5RjhFAA==\", \"status\": \"delivered\", \"timestamp\": \"1700363294\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"dd62bee7357039128f3bad3d75ad61d6\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(670, 'Error peticion inicial: (\'Invalid request\',)'),
(671, 'Invalid request'),
(672, 'Error peticion inicial: (\'Expecting value: line 1 column 1 (char 0)\',)'),
(673, 'Expecting value: line 1 column 1 (char 0)'),
(674, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSREJCMDFCREEyQ0FBRkRFQUQzAA==\", \"status\": \"sent\", \"timestamp\": \"1700418379\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"7bd19ddffa1a74f5e17edd62259bebef\", \"expiration_timestamp\": \"1700504820\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(675, 'Error peticion inicial: (\'Invalid request\',)'),
(676, 'Invalid request'),
(677, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSREJCMDFCREEyQ0FBRkRFQUQzAA==\", \"status\": \"delivered\", \"timestamp\": \"1700418381\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"7bd19ddffa1a74f5e17edd62259bebef\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(678, 'Error peticion inicial: (\'Invalid request\',)'),
(679, 'Invalid request'),
(680, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDQyMTE1MzM0FQIAERgSNEU1NEU0RkJBQzUyOTA1OUIwAA==\", \"status\": \"failed\", \"timestamp\": \"1700166533\", \"recipient_id\": \"573042115334\", \"errors\": [{\"code\": 131047, \"title\": \"Re-engagement message\", \"message\": \"Re-engagement message\", \"error_data\": {\"details\": \"Message failed to send because more than 24 hours have passed since the customer last replied to this number.\"}, \"href\": \"https://developers.facebook.com/docs/whatsapp/cloud-api/support/error-codes/\"}]}]}, \"field\": \"messages\"}]}]'),
(681, 'Error al actualizar mensaje: '),
(682, 'Mensajeria matching query does not exist.'),
(683, 'Error peticion inicial: (\'Invalid request\',)'),
(684, 'Invalid request'),
(685, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSOURDOTc4NDlFNzBFRDQxREYzAA==\", \"status\": \"sent\", \"timestamp\": \"1699831233\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"ba22f4f3023918c1cd69ed0e5f5a244b\", \"expiration_timestamp\": \"1699915920\", \"origin\": {\"type\": \"marketing\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"marketing\"}}]}, \"field\": \"messages\"}]}]'),
(686, 'Error al actualizar mensaje: '),
(687, 'Mensajeria matching query does not exist.'),
(688, 'Error peticion inicial: (\'Invalid request\',)'),
(689, 'Invalid request'),
(690, 'Error peticion inicial: (\'Expecting value: line 1 column 1 (char 0)\',)');
INSERT INTO `peticion` (`id`, `estado`) VALUES
(691, 'Expecting value: line 1 column 1 (char 0)'),
(692, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQTg2ODFFQUM2RDBENzcyNTAzAA==\", \"status\": \"failed\", \"timestamp\": \"1700506778\", \"recipient_id\": \"573014582878\", \"errors\": [{\"code\": 131047, \"title\": \"Re-engagement message\", \"message\": \"Re-engagement message\", \"error_data\": {\"details\": \"Message failed to send because more than 24 hours have passed since the customer last replied to this number.\"}, \"href\": \"https://developers.facebook.com/docs/whatsapp/cloud-api/support/error-codes/\"}]}]}, \"field\": \"messages\"}]}]'),
(693, 'Error al actualizar mensaje: '),
(694, 'local variable \'estado\' referenced before assignment'),
(695, 'Error peticion inicial: (\'Invalid request\',)'),
(696, 'Invalid request'),
(697, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSOEZCQTlCMDY2MUQxOUZERkIxAA==\", \"status\": \"failed\", \"timestamp\": \"1700507320\", \"recipient_id\": \"573014582878\", \"errors\": [{\"code\": 131047, \"title\": \"Re-engagement message\", \"message\": \"Re-engagement message\", \"error_data\": {\"details\": \"Message failed to send because more than 24 hours have passed since the customer last replied to this number.\"}, \"href\": \"https://developers.facebook.com/docs/whatsapp/cloud-api/support/error-codes/\"}]}]}, \"field\": \"messages\"}]}]'),
(698, 'Error al actualizar mensaje: '),
(699, 'local variable \'estado\' referenced before assignment'),
(700, 'Error peticion inicial: (\'Invalid request\',)'),
(701, 'Invalid request'),
(702, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSODE0RDNGRUU4QzAyOTE4MzBDAA==\", \"status\": \"failed\", \"timestamp\": \"1700507497\", \"recipient_id\": \"573014582878\", \"errors\": [{\"code\": 131047, \"title\": \"Re-engagement message\", \"message\": \"Re-engagement message\", \"error_data\": {\"details\": \"Message failed to send because more than 24 hours have passed since the customer last replied to this number.\"}, \"href\": \"https://developers.facebook.com/docs/whatsapp/cloud-api/support/error-codes/\"}]}]}, \"field\": \"messages\"}]}]'),
(703, 'Error al actualizar mensaje: '),
(704, 'local variable \'estado\' referenced before assignment'),
(705, 'Error peticion inicial: (\'Invalid request\',)'),
(706, 'Invalid request'),
(707, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMzUxNDI5NDRCMjcxNDg0NzIwAA==\", \"status\": \"failed\", \"timestamp\": \"1700507663\", \"recipient_id\": \"573014582878\", \"errors\": [{\"code\": 131047, \"title\": \"Re-engagement message\", \"message\": \"Re-engagement message\", \"error_data\": {\"details\": \"Message failed to send because more than 24 hours have passed since the customer last replied to this number.\"}, \"href\": \"https://developers.facebook.com/docs/whatsapp/cloud-api/support/error-codes/\"}]}]}, \"field\": \"messages\"}]}]'),
(708, 'Error al actualizar mensaje: '),
(709, 'local variable \'estado\' referenced before assignment'),
(710, 'Error peticion inicial: (\'Invalid request\',)'),
(711, 'Invalid request'),
(712, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNjY0RTkyNUMwMUU4NThBOEQ4AA==\", \"status\": \"failed\", \"timestamp\": \"1700507908\", \"recipient_id\": \"573014582878\", \"errors\": [{\"code\": 131047, \"title\": \"Re-engagement message\", \"message\": \"Re-engagement message\", \"error_data\": {\"details\": \"Message failed to send because more than 24 hours have passed since the customer last replied to this number.\"}, \"href\": \"https://developers.facebook.com/docs/whatsapp/cloud-api/support/error-codes/\"}]}]}, \"field\": \"messages\"}]}]'),
(713, 'Error al actualizar mensaje: '),
(714, 'Mensajeria matching query does not exist.'),
(715, 'Error peticion inicial: (\'Invalid request\',)'),
(716, 'Invalid request'),
(717, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMzE3MTE0MUREOUNBNUIwNkJEAA==\", \"status\": \"failed\", \"timestamp\": \"1700507930\", \"recipient_id\": \"573014582878\", \"errors\": [{\"code\": 131047, \"title\": \"Re-engagement message\", \"message\": \"Re-engagement message\", \"error_data\": {\"details\": \"Message failed to send because more than 24 hours have passed since the customer last replied to this number.\"}, \"href\": \"https://developers.facebook.com/docs/whatsapp/cloud-api/support/error-codes/\"}]}]}, \"field\": \"messages\"}]}]'),
(718, 'Error al actualizar mensaje: '),
(719, 'Mensajeria matching query does not exist.'),
(720, 'Error peticion inicial: (\'Invalid request\',)'),
(721, 'Invalid request'),
(722, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNDZDMjhFMUZGRDc3Mjg1MjI5AA==\", \"status\": \"failed\", \"timestamp\": \"1700508059\", \"recipient_id\": \"573014582878\", \"errors\": [{\"code\": 131047, \"title\": \"Re-engagement message\", \"message\": \"Re-engagement message\", \"error_data\": {\"details\": \"Message failed to send because more than 24 hours have passed since the customer last replied to this number.\"}, \"href\": \"https://developers.facebook.com/docs/whatsapp/cloud-api/support/error-codes/\"}]}]}, \"field\": \"messages\"}]}]'),
(723, 'Error al actualizar mensaje: '),
(724, 'Mensajeria matching query does not exist.'),
(725, 'Error peticion inicial: (\'Invalid request\',)'),
(726, 'Invalid request'),
(727, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSOTBBRTVBMjlENUIzN0RGNjYwAA==\", \"status\": \"failed\", \"timestamp\": \"1700508104\", \"recipient_id\": \"573014582878\", \"errors\": [{\"code\": 131047, \"title\": \"Re-engagement message\", \"message\": \"Re-engagement message\", \"error_data\": {\"details\": \"Message failed to send because more than 24 hours have passed since the customer last replied to this number.\"}, \"href\": \"https://developers.facebook.com/docs/whatsapp/cloud-api/support/error-codes/\"}]}]}, \"field\": \"messages\"}]}]'),
(728, 'Error al actualizar mensaje: '),
(729, 'Mensajeria matching query does not exist.'),
(730, 'Error peticion inicial: (\'Invalid request\',)'),
(731, 'Invalid request'),
(732, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"contacts\": [{\"profile\": {\"name\": \"Nelson\"}, \"wa_id\": \"573014582878\"}], \"messages\": [{\"from\": \"573014582878\", \"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAEhggMzAzQjkxRDlGMURDOUIyRDNDRkYxOTg4NUQxN0ZFM0YA\", \"timestamp\": \"1700508213\", \"text\": {\"body\": \"Q\"}, \"type\": \"text\"}]}, \"field\": \"messages\"}]}]'),
(733, 'Error peticion inicial: (\'Invalid request\',)'),
(734, 'Invalid request'),
(735, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRDNFODJDQjY5NzNDNjQ2MDlFAA==\", \"status\": \"sent\", \"timestamp\": \"1700508229\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(736, 'Error al actualizar mensaje: '),
(737, 'Mensajeria matching query does not exist.'),
(738, 'Error peticion inicial: (\'Invalid request\',)'),
(739, 'Invalid request'),
(740, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRDNFODJDQjY5NzNDNjQ2MDlFAA==\", \"status\": \"delivered\", \"timestamp\": \"1700508237\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(741, 'Error al actualizar mensaje: '),
(742, 'Mensajeria matching query does not exist.'),
(743, 'Error peticion inicial: (\'Invalid request\',)'),
(744, 'Invalid request'),
(745, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRDE5NTBDQzE3OUU4QkIyQTIwAA==\", \"status\": \"sent\", \"timestamp\": \"1700508351\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(746, 'Error peticion inicial: (\'Invalid request\',)'),
(747, 'Invalid request'),
(748, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRDE5NTBDQzE3OUU4QkIyQTIwAA==\", \"status\": \"delivered\", \"timestamp\": \"1700508358\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(749, 'Error peticion inicial: (\'Invalid request\',)'),
(750, 'Invalid request'),
(751, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQzdGMjVENEQ5QjUxMERGRkM3AA==\", \"status\": \"sent\", \"timestamp\": \"1700508591\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(752, 'Error peticion inicial: (\'Invalid request\',)'),
(753, 'Invalid request'),
(754, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQzdGMjVENEQ5QjUxMERGRkM3AA==\", \"status\": \"delivered\", \"timestamp\": \"1700508594\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(755, 'Error peticion inicial: (\'Invalid request\',)'),
(756, 'Invalid request'),
(757, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSM0YyQzVBNDQ4RkI5RjJEOTFGAA==\", \"status\": \"sent\", \"timestamp\": \"1700508775\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(758, 'Error peticion inicial: (\'Invalid request\',)'),
(759, 'Invalid request'),
(760, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSM0YyQzVBNDQ4RkI5RjJEOTFGAA==\", \"status\": \"delivered\", \"timestamp\": \"1700508777\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(761, 'Error peticion inicial: (\'Invalid request\',)'),
(762, 'Invalid request'),
(763, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNEQwOUEyRDhCNzk2ODgzMDFBAA==\", \"status\": \"sent\", \"timestamp\": \"1700508822\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(764, 'Error peticion inicial: (\'Invalid request\',)'),
(765, 'Invalid request'),
(766, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNEQwOUEyRDhCNzk2ODgzMDFBAA==\", \"status\": \"delivered\", \"timestamp\": \"1700508823\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(767, 'Error peticion inicial: (\'Invalid request\',)'),
(768, 'Invalid request'),
(769, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRTNDRTJGQzAzOEE0QkZEMTRDAA==\", \"status\": \"sent\", \"timestamp\": \"1700509046\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(770, 'Error peticion inicial: (\'Invalid request\',)'),
(771, 'Invalid request'),
(772, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRTNDRTJGQzAzOEE0QkZEMTRDAA==\", \"status\": \"delivered\", \"timestamp\": \"1700509053\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(773, 'Error peticion inicial: (\'Invalid request\',)'),
(774, 'Invalid request'),
(775, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMjQ5Q0M5OUJENDEwMDE3RUJEAA==\", \"status\": \"sent\", \"timestamp\": \"1700509091\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(776, 'Error peticion inicial: (\'Invalid request\',)'),
(777, 'Invalid request'),
(778, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMjQ5Q0M5OUJENDEwMDE3RUJEAA==\", \"status\": \"delivered\", \"timestamp\": \"1700509091\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(779, 'Error peticion inicial: (\'Invalid request\',)'),
(780, 'Invalid request'),
(781, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSN0ZERUJFMjYwOTM0OUZCOUFBAA==\", \"status\": \"sent\", \"timestamp\": \"1700509183\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(782, 'Error peticion inicial: (\'Invalid request\',)'),
(783, 'Invalid request'),
(784, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMEZCQjU4OUNBQzIxMjNDMzA0AA==\", \"status\": \"sent\", \"timestamp\": \"1700509186\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(785, 'Error peticion inicial: (\'Invalid request\',)'),
(786, 'Invalid request'),
(787, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRjFFQkQxMUU2QjQzMEJEN0UzAA==\", \"status\": \"sent\", \"timestamp\": \"1700509191\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(788, 'Error peticion inicial: (\'Invalid request\',)'),
(789, 'Invalid request'),
(790, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRjFFQkQxMUU2QjQzMEJEN0UzAA==\", \"status\": \"delivered\", \"timestamp\": \"1700509191\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(791, 'Error peticion inicial: (\'Invalid request\',)'),
(792, 'Invalid request'),
(793, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSN0ZERUJFMjYwOTM0OUZCOUFBAA==\", \"status\": \"delivered\", \"timestamp\": \"1700509191\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(794, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMEZCQjU4OUNBQzIxMjNDMzA0AA==\", \"status\": \"delivered\", \"timestamp\": \"1700509191\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(795, 'Error peticion inicial: (\'Invalid request\',)'),
(796, 'Error peticion inicial: (\'Invalid request\',)'),
(797, 'Invalid request'),
(798, 'Invalid request'),
(799, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNzk5MUFDRDU1QUM0OTI3RkUyAA==\", \"status\": \"sent\", \"timestamp\": \"1700509195\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(800, 'Error peticion inicial: (\'Invalid request\',)'),
(801, 'Invalid request'),
(802, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNzk5MUFDRDU1QUM0OTI3RkUyAA==\", \"status\": \"delivered\", \"timestamp\": \"1700509195\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(803, 'Error peticion inicial: (\'Invalid request\',)'),
(804, 'Invalid request'),
(805, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"contacts\": [{\"profile\": {\"name\": \"Nelson\"}, \"wa_id\": \"573014582878\"}], \"messages\": [{\"from\": \"573014582878\", \"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAEhggNzRBOEUzQUYwQTZEQzFFRTA3RkY1MTM2NjRCMUQwRDEA\", \"timestamp\": \"1700509204\", \"text\": {\"body\": \"Ooo\"}, \"type\": \"text\"}]}, \"field\": \"messages\"}]}]'),
(806, 'Error peticion inicial: (\'Invalid request\',)'),
(807, 'Invalid request'),
(808, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"contacts\": [{\"profile\": {\"name\": \"Nelson\"}, \"wa_id\": \"573014582878\"}], \"messages\": [{\"from\": \"573014582878\", \"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAEhggNEEyNzQwNzNCQjc4MjE0MDY3QTg1MjFGMTlCRkVBOTEA\", \"timestamp\": \"1700509212\", \"text\": {\"body\": \"Uyuy\"}, \"type\": \"text\"}]}, \"field\": \"messages\"}]}]'),
(809, 'Error peticion inicial: (\'Invalid request\',)'),
(810, 'Invalid request'),
(811, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRDUwNEREQzg5N0M2QUM3QTFEAA==\", \"status\": \"sent\", \"timestamp\": \"1700509360\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(812, 'Error peticion inicial: (\'Invalid request\',)'),
(813, 'Invalid request'),
(814, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRDUwNEREQzg5N0M2QUM3QTFEAA==\", \"status\": \"delivered\", \"timestamp\": \"1700509367\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(815, 'Error peticion inicial: (\'Invalid request\',)'),
(816, 'Invalid request'),
(817, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMTM0OEY3MTNEOUJGMUIzOTU1AA==\", \"status\": \"sent\", \"timestamp\": \"1700509453\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(818, 'Error peticion inicial: (\'Invalid request\',)'),
(819, 'Invalid request'),
(820, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMTM0OEY3MTNEOUJGMUIzOTU1AA==\", \"status\": \"delivered\", \"timestamp\": \"1700509454\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(821, 'Error peticion inicial: (\'Invalid request\',)'),
(822, 'Invalid request'),
(823, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNDM2QzgyNjM2RUFBOTRGN0QxAA==\", \"status\": \"sent\", \"timestamp\": \"1700509535\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(824, 'Error peticion inicial: (\'Invalid request\',)'),
(825, 'Invalid request'),
(826, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNDM2QzgyNjM2RUFBOTRGN0QxAA==\", \"status\": \"delivered\", \"timestamp\": \"1700509536\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(827, 'Error peticion inicial: (\'Invalid request\',)'),
(828, 'Invalid request'),
(829, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRDExMUY2QzFENzA0RTZFQUREAA==\", \"status\": \"sent\", \"timestamp\": \"1700509673\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(830, 'Error peticion inicial: (\'Invalid request\',)'),
(831, 'Invalid request'),
(832, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRDExMUY2QzFENzA0RTZFQUREAA==\", \"status\": \"delivered\", \"timestamp\": \"1700509689\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(833, 'Error peticion inicial: (\'Invalid request\',)'),
(834, 'Invalid request'),
(835, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSOTQwMkFEQUI1RkRCQ0VBQTQxAA==\", \"status\": \"sent\", \"timestamp\": \"1700510372\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(836, 'Error peticion inicial: (\'Invalid request\',)'),
(837, 'Invalid request'),
(838, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSOTQwMkFEQUI1RkRCQ0VBQTQxAA==\", \"status\": \"delivered\", \"timestamp\": \"1700510379\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(839, 'Error peticion inicial: (\'Invalid request\',)'),
(840, 'Invalid request'),
(841, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNDA4NjM5RkI1MzY1MUQ5N0Y4AA==\", \"status\": \"sent\", \"timestamp\": \"1700510828\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(842, 'Error peticion inicial: (\'Invalid request\',)'),
(843, 'Invalid request'),
(844, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNDA4NjM5RkI1MzY1MUQ5N0Y4AA==\", \"status\": \"delivered\", \"timestamp\": \"1700510844\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(845, 'Error peticion inicial: (\'Invalid request\',)'),
(846, 'Invalid request'),
(847, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQzU2MDZEQzc4QUZFRjNGMTIzAA==\", \"status\": \"sent\", \"timestamp\": \"1700510906\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(848, 'Error peticion inicial: (\'Invalid request\',)'),
(849, 'Invalid request'),
(850, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQzU2MDZEQzc4QUZFRjNGMTIzAA==\", \"status\": \"delivered\", \"timestamp\": \"1700510906\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(851, 'Error peticion inicial: (\'Invalid request\',)'),
(852, 'Invalid request'),
(853, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRjRCOUUwRUMzODcxRjE3MDc5AA==\", \"status\": \"sent\", \"timestamp\": \"1700511101\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(854, 'Error peticion inicial: (\'Invalid request\',)'),
(855, 'Invalid request'),
(856, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRjRCOUUwRUMzODcxRjE3MDc5AA==\", \"status\": \"delivered\", \"timestamp\": \"1700511101\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(857, 'Error peticion inicial: (\'Invalid request\',)'),
(858, 'Invalid request'),
(859, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRUQxMTFBRjc5NDk3NTIyOEVCAA==\", \"status\": \"sent\", \"timestamp\": \"1700511130\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(860, 'Error peticion inicial: (\'Invalid request\',)'),
(861, 'Invalid request'),
(862, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRUQxMTFBRjc5NDk3NTIyOEVCAA==\", \"status\": \"delivered\", \"timestamp\": \"1700511131\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(863, 'Error peticion inicial: (\'Invalid request\',)'),
(864, 'Invalid request'),
(865, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQUVBNEEwRUJGQTg1NzNGMjNBAA==\", \"status\": \"sent\", \"timestamp\": \"1700511373\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(866, 'Error peticion inicial: (\'Invalid request\',)'),
(867, 'Invalid request'),
(868, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQUVBNEEwRUJGQTg1NzNGMjNBAA==\", \"status\": \"delivered\", \"timestamp\": \"1700511374\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(869, 'Error peticion inicial: (\'Invalid request\',)'),
(870, 'Invalid request'),
(871, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRjgxOTVBMUUzMkFDOTNDODlDAA==\", \"status\": \"sent\", \"timestamp\": \"1700511628\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(872, 'Error peticion inicial: (\'Invalid request\',)'),
(873, 'Invalid request'),
(874, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRjgxOTVBMUUzMkFDOTNDODlDAA==\", \"status\": \"delivered\", \"timestamp\": \"1700511629\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(875, 'Error peticion inicial: (\'Invalid request\',)'),
(876, 'Invalid request'),
(877, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQTM2OTM1MzA1NTlDQ0E3RjE2AA==\", \"status\": \"sent\", \"timestamp\": \"1700511635\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(878, 'Error peticion inicial: (\'Invalid request\',)'),
(879, 'Invalid request'),
(880, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSQTM2OTM1MzA1NTlDQ0E3RjE2AA==\", \"status\": \"delivered\", \"timestamp\": \"1700511636\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(881, 'Error peticion inicial: (\'Invalid request\',)'),
(882, 'Invalid request'),
(883, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNzMyQzQ5Rjg4QUE0QTJDQkM5AA==\", \"status\": \"sent\", \"timestamp\": \"1700511645\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(884, 'Error peticion inicial: (\'Invalid request\',)'),
(885, 'Invalid request'),
(886, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSNzMyQzQ5Rjg4QUE0QTJDQkM5AA==\", \"status\": \"delivered\", \"timestamp\": \"1700511645\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(887, 'Error peticion inicial: (\'Invalid request\',)'),
(888, 'Invalid request'),
(889, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRTdDMDcwNEYyMUVGQzgxMzhDAA==\", \"status\": \"sent\", \"timestamp\": \"1700511695\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(890, 'Error peticion inicial: (\'Invalid request\',)'),
(891, 'Invalid request'),
(892, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSRTdDMDcwNEYyMUVGQzgxMzhDAA==\", \"status\": \"delivered\", \"timestamp\": \"1700511706\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(893, 'Error peticion inicial: (\'Invalid request\',)'),
(894, 'Invalid request'),
(895, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSOUZDRUVERDhEQjkzQkE1Q0NEAA==\", \"status\": \"sent\", \"timestamp\": \"1700511936\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(896, 'Error peticion inicial: (\'Invalid request\',)'),
(897, 'Invalid request'),
(898, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSOUZDRUVERDhEQjkzQkE1Q0NEAA==\", \"status\": \"delivered\", \"timestamp\": \"1700511948\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(899, 'Error peticion inicial: (\'Invalid request\',)'),
(900, 'Invalid request'),
(901, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMUJCREZCOUYyRDUwQkFFMzdDAA==\", \"status\": \"sent\", \"timestamp\": \"1700512074\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"expiration_timestamp\": \"1700594640\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(902, 'Error peticion inicial: (\'Invalid request\',)'),
(903, 'Invalid request'),
(904, '[{\"id\": \"115904928131631\", \"changes\": [{\"value\": {\"messaging_product\": \"whatsapp\", \"metadata\": {\"display_phone_number\": \"15550344211\", \"phone_number_id\": \"118294544557141\"}, \"statuses\": [{\"id\": \"wamid.HBgMNTczMDE0NTgyODc4FQIAERgSMUJCREZCOUYyRDUwQkFFMzdDAA==\", \"status\": \"delivered\", \"timestamp\": \"1700512074\", \"recipient_id\": \"573014582878\", \"conversation\": {\"id\": \"3beec5d8b681cd87f1dff6c7c5914e42\", \"origin\": {\"type\": \"service\"}}, \"pricing\": {\"billable\": true, \"pricing_model\": \"CBP\", \"category\": \"service\"}}]}, \"field\": \"messages\"}]}]'),
(905, 'Error peticion inicial: (\'Invalid request\',)'),
(906, 'Invalid request'),
(907, 'Error peticion inicial: (\'Expecting value: line 1 column 1 (char 0)\',)'),
(908, 'Expecting value: line 1 column 1 (char 0)');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `archivos_created_by_id_45f66317_fk_auth_user_id` (`created_by_id`) USING BTREE,
  ADD KEY `archivos_updated_by_id_69a44904_fk_auth_user_id` (`updated_by_id`) USING BTREE;

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`) USING BTREE;

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`) USING BTREE;

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`) USING BTREE;

--
-- Indices de la tabla `conversaciones`
--
ALTER TABLE `conversaciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `conversaciones_destinatario_id_db2d6e39_uniq` (`destinatario_id`),
  ADD KEY `conversaciones_created_by_id_014c1b6c_fk_auth_user_id` (`created_by_id`) USING BTREE,
  ADD KEY `conversaciones_estado_id_f313842a_fk_maestras_id` (`estado_id`) USING BTREE,
  ADD KEY `conversaciones_updated_by_id_182bbfbc_fk_auth_user_id` (`updated_by_id`) USING BTREE;

--
-- Indices de la tabla `destinatarios`
--
ALTER TABLE `destinatarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `destinatarios_persona_id_dda68fc7_uniq` (`persona_id`),
  ADD KEY `destinatarios_created_by_id_06bab4f5_fk_auth_user_id` (`created_by_id`) USING BTREE,
  ADD KEY `destinatarios_estado_id_6746a127_fk_maestras_id` (`estado_id`) USING BTREE,
  ADD KEY `destinatarios_updated_by_id_d4b37cc3_fk_auth_user_id` (`updated_by_id`) USING BTREE;

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`) USING BTREE,
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`) USING BTREE;

--
-- Indices de la tabla `django_celery_beat_clockedschedule`
--
ALTER TABLE `django_celery_beat_clockedschedule`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_celery_beat_crontabschedule`
--
ALTER TABLE `django_celery_beat_crontabschedule`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_celery_beat_intervalschedule`
--
ALTER TABLE `django_celery_beat_intervalschedule`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_celery_beat_periodictask`
--
ALTER TABLE `django_celery_beat_periodictask`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` (`clocked_id`) USING BTREE,
  ADD KEY `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` (`crontab_id`) USING BTREE,
  ADD KEY `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` (`interval_id`) USING BTREE,
  ADD KEY `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` (`solar_id`) USING BTREE;

--
-- Indices de la tabla `django_celery_beat_periodictasks`
--
ALTER TABLE `django_celery_beat_periodictasks`
  ADD PRIMARY KEY (`ident`);

--
-- Indices de la tabla `django_celery_beat_solarschedule`
--
ALTER TABLE `django_celery_beat_solarschedule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq` (`event`,`latitude`,`longitude`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`) USING BTREE;

--
-- Indices de la tabla `maestras`
--
ALTER TABLE `maestras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `maestras_created_by_id_0d5f633f_fk_auth_user_id` (`created_by_id`) USING BTREE,
  ADD KEY `maestras_padre_id_efdba410_fk_maestras_id` (`padre_id`) USING BTREE,
  ADD KEY `maestras_updated_by_id_6785499a_fk_auth_user_id` (`updated_by_id`) USING BTREE;

--
-- Indices de la tabla `mensajeria`
--
ALTER TABLE `mensajeria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mensajeria_conversacion_id_id_2a3cd020` (`conversacion_id`) USING BTREE,
  ADD KEY `mensajeria_created_by_id_0660a5f4_fk_auth_user_id` (`created_by_id`) USING BTREE,
  ADD KEY `mensajeria_destinatario_id_d20046d0_fk_destinatarios_id` (`destinatario_id`) USING BTREE,
  ADD KEY `mensajeria_estado_id_8bce68b8_fk_maestras_id` (`estado_id`) USING BTREE,
  ADD KEY `mensajeria_tipo_id_226751bf_fk_maestras_id` (`tipo_id`) USING BTREE,
  ADD KEY `mensajeria_updated_by_id_9d97231f_fk_auth_user_id` (`updated_by_id`) USING BTREE,
  ADD KEY `mensajeria_multimedia_id_id_5e0fdc45` (`multimedia_id_id`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modulos_created_by_id_682736db_fk_auth_user_id` (`created_by_id`) USING BTREE,
  ADD KEY `modulos_dad_id_7911d8fa_fk_modulos_id` (`dad_id`) USING BTREE,
  ADD KEY `modulos_estado_id_b131b6f8_fk_maestras_id` (`estado_id`) USING BTREE,
  ADD KEY `modulos_updated_by_id_379626ca_fk_auth_user_id` (`updated_by_id`) USING BTREE;

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personas_telefonomovil_d10349bb_uniq` (`telefonomovil`),
  ADD UNIQUE KEY `personas_telefonowhatsapp_8bb213d6_uniq` (`telefonowhatsapp`),
  ADD KEY `personas_ciudad_id_33741ae6_fk_maestras_id` (`ciudad_id`) USING BTREE,
  ADD KEY `personas_created_by_id_843eac77_fk_auth_user_id` (`created_by_id`) USING BTREE,
  ADD KEY `personas_departamento_id_57efcde3_fk_maestras_id` (`departamento_id`) USING BTREE,
  ADD KEY `personas_ocupacion_id_e546e79a_fk_maestras_id` (`ocupacion_id`) USING BTREE,
  ADD KEY `personas_pais_id_45bcdd53_fk_maestras_id` (`pais_id`) USING BTREE,
  ADD KEY `personas_sexo_id_05557b10_fk_maestras_id` (`sexo_id`) USING BTREE,
  ADD KEY `personas_tipoidentificacion_id_319d71c0_fk_maestras_id` (`tipoidentificacion_id`) USING BTREE,
  ADD KEY `personas_updated_by_id_7e6ba61e_fk_auth_user_id` (`updated_by_id`) USING BTREE,
  ADD KEY `personas_zona_id_0e8ab25d_fk_maestras_id` (`zona_id`) USING BTREE;

--
-- Indices de la tabla `peticion`
--
ALTER TABLE `peticion`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `archivos`
--
ALTER TABLE `archivos`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `conversaciones`
--
ALTER TABLE `conversaciones`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `destinatarios`
--
ALTER TABLE `destinatarios`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3815;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_celery_beat_clockedschedule`
--
ALTER TABLE `django_celery_beat_clockedschedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_celery_beat_crontabschedule`
--
ALTER TABLE `django_celery_beat_crontabschedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_celery_beat_intervalschedule`
--
ALTER TABLE `django_celery_beat_intervalschedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_celery_beat_periodictask`
--
ALTER TABLE `django_celery_beat_periodictask`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_celery_beat_solarschedule`
--
ALTER TABLE `django_celery_beat_solarschedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `maestras`
--
ALTER TABLE `maestras`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=760;

--
-- AUTO_INCREMENT de la tabla `mensajeria`
--
ALTER TABLE `mensajeria`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=371;

--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2972;

--
-- AUTO_INCREMENT de la tabla `peticion`
--
ALTER TABLE `peticion`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=909;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD CONSTRAINT `archivos_created_by_id_45f66317_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `archivos_updated_by_id_69a44904_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `conversaciones`
--
ALTER TABLE `conversaciones`
  ADD CONSTRAINT `conversaciones_created_by_id_014c1b6c_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `conversaciones_destinatario_id_db2d6e39_fk_destinatarios_id` FOREIGN KEY (`destinatario_id`) REFERENCES `destinatarios` (`id`),
  ADD CONSTRAINT `conversaciones_estado_id_f313842a_fk_maestras_id` FOREIGN KEY (`estado_id`) REFERENCES `maestras` (`id`),
  ADD CONSTRAINT `conversaciones_updated_by_id_182bbfbc_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `destinatarios`
--
ALTER TABLE `destinatarios`
  ADD CONSTRAINT `destinatarios_created_by_id_06bab4f5_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `destinatarios_estado_id_6746a127_fk_maestras_id` FOREIGN KEY (`estado_id`) REFERENCES `maestras` (`id`),
  ADD CONSTRAINT `destinatarios_persona_id_dda68fc7_fk_personas_id` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `destinatarios_updated_by_id_d4b37cc3_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_celery_beat_periodictask`
--
ALTER TABLE `django_celery_beat_periodictask`
  ADD CONSTRAINT `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` FOREIGN KEY (`clocked_id`) REFERENCES `django_celery_beat_clockedschedule` (`id`),
  ADD CONSTRAINT `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` FOREIGN KEY (`crontab_id`) REFERENCES `django_celery_beat_crontabschedule` (`id`),
  ADD CONSTRAINT `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` FOREIGN KEY (`interval_id`) REFERENCES `django_celery_beat_intervalschedule` (`id`),
  ADD CONSTRAINT `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` FOREIGN KEY (`solar_id`) REFERENCES `django_celery_beat_solarschedule` (`id`);

--
-- Filtros para la tabla `maestras`
--
ALTER TABLE `maestras`
  ADD CONSTRAINT `maestras_padre_id_efdba410_fk_maestras_id` FOREIGN KEY (`padre_id`) REFERENCES `maestras` (`id`),
  ADD CONSTRAINT `maestras_updated_by_id_6785499a_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `mensajeria`
--
ALTER TABLE `mensajeria`
  ADD CONSTRAINT `mensajeria_conversacion_id_92157ae1_fk_conversaciones_id` FOREIGN KEY (`conversacion_id`) REFERENCES `conversaciones` (`id`),
  ADD CONSTRAINT `mensajeria_created_by_id_0660a5f4_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `mensajeria_destinatario_id_d20046d0_fk_destinatarios_id` FOREIGN KEY (`destinatario_id`) REFERENCES `destinatarios` (`id`),
  ADD CONSTRAINT `mensajeria_estado_id_8bce68b8_fk_maestras_id` FOREIGN KEY (`estado_id`) REFERENCES `maestras` (`id`),
  ADD CONSTRAINT `mensajeria_multimedia_id_id_5e0fdc45_fk_archivos_id` FOREIGN KEY (`multimedia_id_id`) REFERENCES `archivos` (`id`),
  ADD CONSTRAINT `mensajeria_tipo_id_226751bf_fk_maestras_id` FOREIGN KEY (`tipo_id`) REFERENCES `maestras` (`id`),
  ADD CONSTRAINT `mensajeria_updated_by_id_9d97231f_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD CONSTRAINT `modulos_created_by_id_682736db_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `modulos_dad_id_7911d8fa_fk_modulos_id` FOREIGN KEY (`dad_id`) REFERENCES `modulos` (`id`),
  ADD CONSTRAINT `modulos_estado_id_b131b6f8_fk_maestras_id` FOREIGN KEY (`estado_id`) REFERENCES `maestras` (`id`),
  ADD CONSTRAINT `modulos_updated_by_id_379626ca_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `personas_ciudad_id_33741ae6_fk_maestras_id` FOREIGN KEY (`ciudad_id`) REFERENCES `maestras` (`id`),
  ADD CONSTRAINT `personas_created_by_id_843eac77_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `personas_departamento_id_57efcde3_fk_maestras_id` FOREIGN KEY (`departamento_id`) REFERENCES `maestras` (`id`),
  ADD CONSTRAINT `personas_ocupacion_id_e546e79a_fk_maestras_id` FOREIGN KEY (`ocupacion_id`) REFERENCES `maestras` (`id`),
  ADD CONSTRAINT `personas_pais_id_45bcdd53_fk_maestras_id` FOREIGN KEY (`pais_id`) REFERENCES `maestras` (`id`),
  ADD CONSTRAINT `personas_sexo_id_05557b10_fk_maestras_id` FOREIGN KEY (`sexo_id`) REFERENCES `maestras` (`id`),
  ADD CONSTRAINT `personas_tipoidentificacion_id_319d71c0_fk_maestras_id` FOREIGN KEY (`tipoidentificacion_id`) REFERENCES `maestras` (`id`),
  ADD CONSTRAINT `personas_updated_by_id_7e6ba61e_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `personas_zona_id_0e8ab25d_fk_maestras_id` FOREIGN KEY (`zona_id`) REFERENCES `maestras` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;