-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 24-Maio-2020 às 21:18
-- Versão do servidor: 5.6.48
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dev_sanctum`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `allowed_file_ext`
--

CREATE TABLE IF NOT EXISTS `allowed_file_ext` (
  `id` bigint(20) unsigned NOT NULL,
  `ext` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `app_configs`
--

CREATE TABLE IF NOT EXISTS `app_configs` (
  `id` bigint(20) unsigned NOT NULL,
  `config` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `app_configs`
--

INSERT INTO `app_configs` (`id`, `config`, `content`) VALUES
(1, 'app_info', '{"app_name":"Laravel Sanctum SPA","app_lang":"pt_BR"}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `conversations`
--

CREATE TABLE IF NOT EXISTS `conversations` (
  `id` bigint(20) unsigned NOT NULL,
  `from` bigint(20) unsigned NOT NULL,
  `to` bigint(20) unsigned NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `conversations`
--

INSERT INTO `conversations` (`id`, `from`, `to`, `updated_at`) VALUES
(90, 2, 8, '2020-05-23 23:42:17'),
(91, 2, 9, '2020-05-16 13:51:31');

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
--

CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, 'redis', 'default', '{"uuid":"218cd84a-fe0c-4cba-a95d-5d874e78eb7b","timeout":null,"id":"7f77xulGR5KxhQjlSUMCDJwSZH8gEIMH","data":{"command":"O:48:\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\":13:{s:11:\\"notifiables\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:15:\\"App\\\\Models\\\\User\\";s:2:\\"id\\";a:1:{i:0;i:2;}s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:12:\\"notification\\";O:39:\\"App\\\\Notifications\\\\MessengerNotification\\":10:{s:48:\\"\\u0000App\\\\Notifications\\\\MessengerNotification\\u0000message\\";a:6:{s:2:\\"id\\";i:102;s:4:\\"from\\";i:8;s:2:\\"to\\";i:2;s:12:\\"conversation\\";i:90;s:10:\\"created_at\\";s:19:\\"2020-05-21 19:24:06\\";s:7:\\"content\\";s:2:\\"oi\\";}s:2:\\"id\\";s:36:\\"582dd71f-14cb-4280-9c2c-4fa386a28282\\";s:6:\\"locale\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}s:8:\\"channels\\";a:1:{i:0;s:9:\\"broadcast\\";}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:3:\\"job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}","commandName":"Illuminate\\\\Notifications\\\\SendQueuedNotifications"},"displayName":"App\\\\Notifications\\\\MessengerNotification","maxTries":null,"maxExceptions":null,"timeoutAt":null,"job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","delay":null,"attempts":2}', 'Error: Class ''Doctrine\\Inflector\\Inflector'' not found in /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Support/Pluralizer.php:135\nStack trace:\n#0 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Support/Pluralizer.php(76): Illuminate\\Support\\Pluralizer::inflector()\n#1 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Support/Str.php(394): Illuminate\\Support\\Pluralizer::plural(''User'', 2)\n#2 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Support/Str.php(410): Illuminate\\Support\\Str::plural(''User'', 2)\n#3 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1324): Illuminate\\Support\\Str::pluralStudly(''User'')\n#4 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(1292): Illuminate\\Database\\Eloquent\\Model->getTable()\n#5 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(997): Illuminate\\Database\\Eloquent\\Builder->setModel(Object(App\\Models\\User))\n#6 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1032): Illuminate\\Database\\Eloquent\\Model->newModelQuery()\n#7 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1057): Illuminate\\Database\\Eloquent\\Model->newQueryWithoutScopes()\n#8 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/SerializesAndRestoresModelIdentifiers.php(114): Illuminate\\Database\\Eloquent\\Model->newQueryForRestoration(Array)\n#9 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/SerializesAndRestoresModelIdentifiers.php(73): Illuminate\\Notifications\\SendQueuedNotifications->getQueryForModelRestoration(Object(App\\Models\\User), Array)\n#10 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/SerializesAndRestoresModelIdentifiers.php(56): Illuminate\\Notifications\\SendQueuedNotifications->restoreCollection(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#11 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/SerializesModels.php(45): Illuminate\\Notifications\\SendQueuedNotifications->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#12 [internal function]: Illuminate\\Notifications\\SendQueuedNotifications->__wakeup()\n#13 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(53): unserialize(''O:48:"Illuminat...'')\n#14 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#15 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(356): Illuminate\\Queue\\Jobs\\Job->fire()\n#16 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(306): Illuminate\\Queue\\Worker->process(''redis'', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#17 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(132): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), ''redis'', Object(Illuminate\\Queue\\WorkerOptions))\n#18 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon(''redis'', ''default'', Object(Illuminate\\Queue\\WorkerOptions))\n#19 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker(''redis'', ''default'')\n#20 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#21 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(32): call_user_func_array(Array, Array)\n#22 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/Util.php(36): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(90): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Console/Command.php(134): Illuminate\\Container\\Container->call(Array)\n#27 /var/www/laravel-e-vue/acl-api/vendor/symfony/console/Command/Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 /var/www/laravel-e-vue/acl-api/vendor/symfony/console/Application.php(912): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /var/www/laravel-e-vue/acl-api/vendor/symfony/console/Application.php(264): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /var/www/laravel-e-vue/acl-api/vendor/symfony/console/Application.php(140): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Console/Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 /var/www/laravel-e-vue/acl-api/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 {main}', '2020-05-21 22:24:06'),
(2, 'redis', 'default', '{"uuid":"97238c8b-ba83-4a41-b8af-2c9e5f9a0e9e","timeout":null,"id":"nUQVk7IGHBuGj3uJgLisFHUlQ4Rqn9hb","data":{"command":"O:48:\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\":13:{s:11:\\"notifiables\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:15:\\"App\\\\Models\\\\User\\";s:2:\\"id\\";a:1:{i:0;i:2;}s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:12:\\"notification\\";O:39:\\"App\\\\Notifications\\\\MessengerNotification\\":10:{s:48:\\"\\u0000App\\\\Notifications\\\\MessengerNotification\\u0000message\\";a:6:{s:2:\\"id\\";i:102;s:4:\\"from\\";i:8;s:2:\\"to\\";i:2;s:12:\\"conversation\\";i:90;s:10:\\"created_at\\";s:19:\\"2020-05-21 19:24:06\\";s:7:\\"content\\";s:2:\\"oi\\";}s:2:\\"id\\";s:36:\\"582dd71f-14cb-4280-9c2c-4fa386a28282\\";s:6:\\"locale\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}s:8:\\"channels\\";a:1:{i:0;s:8:\\"database\\";}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:3:\\"job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}","commandName":"Illuminate\\\\Notifications\\\\SendQueuedNotifications"},"displayName":"App\\\\Notifications\\\\MessengerNotification","maxTries":null,"maxExceptions":null,"timeoutAt":null,"job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","delay":null,"attempts":2}', 'Error: Class ''Doctrine\\Inflector\\Inflector'' not found in /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Support/Pluralizer.php:135\nStack trace:\n#0 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Support/Pluralizer.php(76): Illuminate\\Support\\Pluralizer::inflector()\n#1 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Support/Str.php(394): Illuminate\\Support\\Pluralizer::plural(''User'', 2)\n#2 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Support/Str.php(410): Illuminate\\Support\\Str::plural(''User'', 2)\n#3 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1324): Illuminate\\Support\\Str::pluralStudly(''User'')\n#4 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(1292): Illuminate\\Database\\Eloquent\\Model->getTable()\n#5 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(997): Illuminate\\Database\\Eloquent\\Builder->setModel(Object(App\\Models\\User))\n#6 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1032): Illuminate\\Database\\Eloquent\\Model->newModelQuery()\n#7 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1057): Illuminate\\Database\\Eloquent\\Model->newQueryWithoutScopes()\n#8 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/SerializesAndRestoresModelIdentifiers.php(114): Illuminate\\Database\\Eloquent\\Model->newQueryForRestoration(Array)\n#9 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/SerializesAndRestoresModelIdentifiers.php(73): Illuminate\\Notifications\\SendQueuedNotifications->getQueryForModelRestoration(Object(App\\Models\\User), Array)\n#10 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/SerializesAndRestoresModelIdentifiers.php(56): Illuminate\\Notifications\\SendQueuedNotifications->restoreCollection(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#11 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/SerializesModels.php(45): Illuminate\\Notifications\\SendQueuedNotifications->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#12 [internal function]: Illuminate\\Notifications\\SendQueuedNotifications->__wakeup()\n#13 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(53): unserialize(''O:48:"Illuminat...'')\n#14 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#15 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(356): Illuminate\\Queue\\Jobs\\Job->fire()\n#16 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(306): Illuminate\\Queue\\Worker->process(''redis'', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#17 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(132): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), ''redis'', Object(Illuminate\\Queue\\WorkerOptions))\n#18 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon(''redis'', ''default'', Object(Illuminate\\Queue\\WorkerOptions))\n#19 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker(''redis'', ''default'')\n#20 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#21 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(32): call_user_func_array(Array, Array)\n#22 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/Util.php(36): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(90): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Console/Command.php(134): Illuminate\\Container\\Container->call(Array)\n#27 /var/www/laravel-e-vue/acl-api/vendor/symfony/console/Command/Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 /var/www/laravel-e-vue/acl-api/vendor/symfony/console/Application.php(912): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /var/www/laravel-e-vue/acl-api/vendor/symfony/console/Application.php(264): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /var/www/laravel-e-vue/acl-api/vendor/symfony/console/Application.php(140): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Console/Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 /var/www/laravel-e-vue/acl-api/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 {main}', '2020-05-21 22:24:06'),
(3, 'redis', 'default', '{"uuid":"06323a8f-6074-4ded-9396-ed403d531a77","timeout":null,"id":"mk8KYIXvT2zoFWQLq2UXDHGCju5zuWrk","data":{"command":"O:48:\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\":13:{s:11:\\"notifiables\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:15:\\"App\\\\Models\\\\User\\";s:2:\\"id\\";a:1:{i:0;i:2;}s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:12:\\"notification\\";O:39:\\"App\\\\Notifications\\\\MessengerNotification\\":10:{s:48:\\"\\u0000App\\\\Notifications\\\\MessengerNotification\\u0000message\\";a:6:{s:2:\\"id\\";i:103;s:4:\\"from\\";i:8;s:2:\\"to\\";i:2;s:12:\\"conversation\\";i:90;s:10:\\"created_at\\";s:19:\\"2020-05-21 19:24:23\\";s:7:\\"content\\";s:4:\\"olá\\";}s:2:\\"id\\";s:36:\\"21906d95-3666-4292-be5c-7dc869579ebe\\";s:6:\\"locale\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}s:8:\\"channels\\";a:1:{i:0;s:8:\\"database\\";}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:3:\\"job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}","commandName":"Illuminate\\\\Notifications\\\\SendQueuedNotifications"},"displayName":"App\\\\Notifications\\\\MessengerNotification","maxTries":null,"maxExceptions":null,"timeoutAt":null,"job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","delay":null,"attempts":2}', 'Error: Class ''Doctrine\\Inflector\\Inflector'' not found in /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Support/Pluralizer.php:135\nStack trace:\n#0 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Support/Pluralizer.php(76): Illuminate\\Support\\Pluralizer::inflector()\n#1 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Support/Str.php(394): Illuminate\\Support\\Pluralizer::plural(''User'', 2)\n#2 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Support/Str.php(410): Illuminate\\Support\\Str::plural(''User'', 2)\n#3 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1324): Illuminate\\Support\\Str::pluralStudly(''User'')\n#4 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(1292): Illuminate\\Database\\Eloquent\\Model->getTable()\n#5 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(997): Illuminate\\Database\\Eloquent\\Builder->setModel(Object(App\\Models\\User))\n#6 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1032): Illuminate\\Database\\Eloquent\\Model->newModelQuery()\n#7 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1057): Illuminate\\Database\\Eloquent\\Model->newQueryWithoutScopes()\n#8 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/SerializesAndRestoresModelIdentifiers.php(114): Illuminate\\Database\\Eloquent\\Model->newQueryForRestoration(Array)\n#9 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/SerializesAndRestoresModelIdentifiers.php(73): Illuminate\\Notifications\\SendQueuedNotifications->getQueryForModelRestoration(Object(App\\Models\\User), Array)\n#10 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/SerializesAndRestoresModelIdentifiers.php(56): Illuminate\\Notifications\\SendQueuedNotifications->restoreCollection(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#11 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/SerializesModels.php(45): Illuminate\\Notifications\\SendQueuedNotifications->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#12 [internal function]: Illuminate\\Notifications\\SendQueuedNotifications->__wakeup()\n#13 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(53): unserialize(''O:48:"Illuminat...'')\n#14 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#15 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(356): Illuminate\\Queue\\Jobs\\Job->fire()\n#16 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(306): Illuminate\\Queue\\Worker->process(''redis'', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#17 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(132): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), ''redis'', Object(Illuminate\\Queue\\WorkerOptions))\n#18 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon(''redis'', ''default'', Object(Illuminate\\Queue\\WorkerOptions))\n#19 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker(''redis'', ''default'')\n#20 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#21 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(32): call_user_func_array(Array, Array)\n#22 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/Util.php(36): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(90): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Console/Command.php(134): Illuminate\\Container\\Container->call(Array)\n#27 /var/www/laravel-e-vue/acl-api/vendor/symfony/console/Command/Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 /var/www/laravel-e-vue/acl-api/vendor/symfony/console/Application.php(912): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /var/www/laravel-e-vue/acl-api/vendor/symfony/console/Application.php(264): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /var/www/laravel-e-vue/acl-api/vendor/symfony/console/Application.php(140): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Console/Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 /var/www/laravel-e-vue/acl-api/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 {main}', '2020-05-21 22:24:24'),
(4, 'redis', 'default', '{"uuid":"118329f7-4280-4909-a75c-a92d10ce2031","timeout":null,"id":"ovLozBssN2yRBYX8hclPKO2eVO6DqQSt","data":{"command":"O:48:\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\":13:{s:11:\\"notifiables\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:15:\\"App\\\\Models\\\\User\\";s:2:\\"id\\";a:1:{i:0;i:2;}s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:12:\\"notification\\";O:39:\\"App\\\\Notifications\\\\MessengerNotification\\":10:{s:48:\\"\\u0000App\\\\Notifications\\\\MessengerNotification\\u0000message\\";a:6:{s:2:\\"id\\";i:103;s:4:\\"from\\";i:8;s:2:\\"to\\";i:2;s:12:\\"conversation\\";i:90;s:10:\\"created_at\\";s:19:\\"2020-05-21 19:24:23\\";s:7:\\"content\\";s:4:\\"olá\\";}s:2:\\"id\\";s:36:\\"21906d95-3666-4292-be5c-7dc869579ebe\\";s:6:\\"locale\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}s:8:\\"channels\\";a:1:{i:0;s:9:\\"broadcast\\";}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:3:\\"job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}","commandName":"Illuminate\\\\Notifications\\\\SendQueuedNotifications"},"displayName":"App\\\\Notifications\\\\MessengerNotification","maxTries":null,"maxExceptions":null,"timeoutAt":null,"job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","delay":null,"attempts":2}', 'Error: Class ''Doctrine\\Inflector\\Inflector'' not found in /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Support/Pluralizer.php:135\nStack trace:\n#0 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Support/Pluralizer.php(76): Illuminate\\Support\\Pluralizer::inflector()\n#1 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Support/Str.php(394): Illuminate\\Support\\Pluralizer::plural(''User'', 2)\n#2 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Support/Str.php(410): Illuminate\\Support\\Str::plural(''User'', 2)\n#3 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1324): Illuminate\\Support\\Str::pluralStudly(''User'')\n#4 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(1292): Illuminate\\Database\\Eloquent\\Model->getTable()\n#5 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(997): Illuminate\\Database\\Eloquent\\Builder->setModel(Object(App\\Models\\User))\n#6 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1032): Illuminate\\Database\\Eloquent\\Model->newModelQuery()\n#7 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1057): Illuminate\\Database\\Eloquent\\Model->newQueryWithoutScopes()\n#8 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/SerializesAndRestoresModelIdentifiers.php(114): Illuminate\\Database\\Eloquent\\Model->newQueryForRestoration(Array)\n#9 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/SerializesAndRestoresModelIdentifiers.php(73): Illuminate\\Notifications\\SendQueuedNotifications->getQueryForModelRestoration(Object(App\\Models\\User), Array)\n#10 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/SerializesAndRestoresModelIdentifiers.php(56): Illuminate\\Notifications\\SendQueuedNotifications->restoreCollection(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#11 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/SerializesModels.php(45): Illuminate\\Notifications\\SendQueuedNotifications->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#12 [internal function]: Illuminate\\Notifications\\SendQueuedNotifications->__wakeup()\n#13 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(53): unserialize(''O:48:"Illuminat...'')\n#14 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#15 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(356): Illuminate\\Queue\\Jobs\\Job->fire()\n#16 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(306): Illuminate\\Queue\\Worker->process(''redis'', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#17 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(132): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), ''redis'', Object(Illuminate\\Queue\\WorkerOptions))\n#18 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon(''redis'', ''default'', Object(Illuminate\\Queue\\WorkerOptions))\n#19 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker(''redis'', ''default'')\n#20 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#21 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(32): call_user_func_array(Array, Array)\n#22 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/Util.php(36): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(90): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Console/Command.php(134): Illuminate\\Container\\Container->call(Array)\n#27 /var/www/laravel-e-vue/acl-api/vendor/symfony/console/Command/Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 /var/www/laravel-e-vue/acl-api/vendor/symfony/console/Application.php(912): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /var/www/laravel-e-vue/acl-api/vendor/symfony/console/Application.php(264): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /var/www/laravel-e-vue/acl-api/vendor/symfony/console/Application.php(140): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Console/Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 /var/www/laravel-e-vue/acl-api/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 {main}', '2020-05-21 22:24:24'),
(5, 'redis', 'default', '{"uuid":"021768fc-60a8-4918-a83d-ba342dfc3bf6","timeout":null,"id":"cNgXCpXBqQCPVBod5ExJxY8X1onmGiWx","data":{"command":"O:48:\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\":13:{s:11:\\"notifiables\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:15:\\"App\\\\Models\\\\User\\";s:2:\\"id\\";a:1:{i:0;i:2;}s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:12:\\"notification\\";O:39:\\"App\\\\Notifications\\\\MessengerNotification\\":10:{s:48:\\"\\u0000App\\\\Notifications\\\\MessengerNotification\\u0000message\\";a:6:{s:2:\\"id\\";i:104;s:4:\\"from\\";i:8;s:2:\\"to\\";i:2;s:12:\\"conversation\\";i:90;s:10:\\"created_at\\";s:19:\\"2020-05-21 19:25:19\\";s:7:\\"content\\";s:6:\\"dfasfd\\";}s:2:\\"id\\";s:36:\\"0ec24248-07f2-45a5-87b6-8b0ae7b81e08\\";s:6:\\"locale\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}s:8:\\"channels\\";a:1:{i:0;s:8:\\"database\\";}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:3:\\"job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}","commandName":"Illuminate\\\\Notifications\\\\SendQueuedNotifications"},"displayName":"App\\\\Notifications\\\\MessengerNotification","maxTries":null,"maxExceptions":null,"timeoutAt":null,"job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","delay":null,"attempts":2}', 'Error: Class ''Doctrine\\Inflector\\Inflector'' not found in /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Support/Pluralizer.php:135\nStack trace:\n#0 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Support/Pluralizer.php(76): Illuminate\\Support\\Pluralizer::inflector()\n#1 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Support/Str.php(394): Illuminate\\Support\\Pluralizer::plural(''User'', 2)\n#2 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Support/Str.php(410): Illuminate\\Support\\Str::plural(''User'', 2)\n#3 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1324): Illuminate\\Support\\Str::pluralStudly(''User'')\n#4 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(1292): Illuminate\\Database\\Eloquent\\Model->getTable()\n#5 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(997): Illuminate\\Database\\Eloquent\\Builder->setModel(Object(App\\Models\\User))\n#6 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1032): Illuminate\\Database\\Eloquent\\Model->newModelQuery()\n#7 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1057): Illuminate\\Database\\Eloquent\\Model->newQueryWithoutScopes()\n#8 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/SerializesAndRestoresModelIdentifiers.php(114): Illuminate\\Database\\Eloquent\\Model->newQueryForRestoration(Array)\n#9 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/SerializesAndRestoresModelIdentifiers.php(73): Illuminate\\Notifications\\SendQueuedNotifications->getQueryForModelRestoration(Object(App\\Models\\User), Array)\n#10 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/SerializesAndRestoresModelIdentifiers.php(56): Illuminate\\Notifications\\SendQueuedNotifications->restoreCollection(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#11 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/SerializesModels.php(45): Illuminate\\Notifications\\SendQueuedNotifications->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#12 [internal function]: Illuminate\\Notifications\\SendQueuedNotifications->__wakeup()\n#13 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(53): unserialize(''O:48:"Illuminat...'')\n#14 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#15 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(356): Illuminate\\Queue\\Jobs\\Job->fire()\n#16 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(306): Illuminate\\Queue\\Worker->process(''redis'', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#17 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(132): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), ''redis'', Object(Illuminate\\Queue\\WorkerOptions))\n#18 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon(''redis'', ''default'', Object(Illuminate\\Queue\\WorkerOptions))\n#19 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker(''redis'', ''default'')\n#20 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#21 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(32): call_user_func_array(Array, Array)\n#22 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/Util.php(36): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(90): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Console/Command.php(134): Illuminate\\Container\\Container->call(Array)\n#27 /var/www/laravel-e-vue/acl-api/vendor/symfony/console/Command/Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 /var/www/laravel-e-vue/acl-api/vendor/symfony/console/Application.php(912): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /var/www/laravel-e-vue/acl-api/vendor/symfony/console/Application.php(264): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /var/www/laravel-e-vue/acl-api/vendor/symfony/console/Application.php(140): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Console/Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 /var/www/laravel-e-vue/acl-api/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 {main}', '2020-05-21 22:25:20');
INSERT INTO `failed_jobs` (`id`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(6, 'redis', 'default', '{"uuid":"745480e5-e53b-4420-8d78-ede6e04bb3ae","timeout":null,"id":"icM0FOSc1PxZsEHwcwY9jMtYiud7l7P5","data":{"command":"O:48:\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\":13:{s:11:\\"notifiables\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:15:\\"App\\\\Models\\\\User\\";s:2:\\"id\\";a:1:{i:0;i:2;}s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";}s:12:\\"notification\\";O:39:\\"App\\\\Notifications\\\\MessengerNotification\\":10:{s:48:\\"\\u0000App\\\\Notifications\\\\MessengerNotification\\u0000message\\";a:6:{s:2:\\"id\\";i:104;s:4:\\"from\\";i:8;s:2:\\"to\\";i:2;s:12:\\"conversation\\";i:90;s:10:\\"created_at\\";s:19:\\"2020-05-21 19:25:19\\";s:7:\\"content\\";s:6:\\"dfasfd\\";}s:2:\\"id\\";s:36:\\"0ec24248-07f2-45a5-87b6-8b0ae7b81e08\\";s:6:\\"locale\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}s:8:\\"channels\\";a:1:{i:0;s:9:\\"broadcast\\";}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:3:\\"job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}","commandName":"Illuminate\\\\Notifications\\\\SendQueuedNotifications"},"displayName":"App\\\\Notifications\\\\MessengerNotification","maxTries":null,"maxExceptions":null,"timeoutAt":null,"job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","delay":null,"attempts":2}', 'Error: Class ''Doctrine\\Inflector\\Inflector'' not found in /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Support/Pluralizer.php:135\nStack trace:\n#0 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Support/Pluralizer.php(76): Illuminate\\Support\\Pluralizer::inflector()\n#1 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Support/Str.php(394): Illuminate\\Support\\Pluralizer::plural(''User'', 2)\n#2 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Support/Str.php(410): Illuminate\\Support\\Str::plural(''User'', 2)\n#3 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1324): Illuminate\\Support\\Str::pluralStudly(''User'')\n#4 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(1292): Illuminate\\Database\\Eloquent\\Model->getTable()\n#5 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(997): Illuminate\\Database\\Eloquent\\Builder->setModel(Object(App\\Models\\User))\n#6 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1032): Illuminate\\Database\\Eloquent\\Model->newModelQuery()\n#7 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1057): Illuminate\\Database\\Eloquent\\Model->newQueryWithoutScopes()\n#8 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/SerializesAndRestoresModelIdentifiers.php(114): Illuminate\\Database\\Eloquent\\Model->newQueryForRestoration(Array)\n#9 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/SerializesAndRestoresModelIdentifiers.php(73): Illuminate\\Notifications\\SendQueuedNotifications->getQueryForModelRestoration(Object(App\\Models\\User), Array)\n#10 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/SerializesAndRestoresModelIdentifiers.php(56): Illuminate\\Notifications\\SendQueuedNotifications->restoreCollection(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#11 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/SerializesModels.php(45): Illuminate\\Notifications\\SendQueuedNotifications->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#12 [internal function]: Illuminate\\Notifications\\SendQueuedNotifications->__wakeup()\n#13 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(53): unserialize(''O:48:"Illuminat...'')\n#14 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#15 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(356): Illuminate\\Queue\\Jobs\\Job->fire()\n#16 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(306): Illuminate\\Queue\\Worker->process(''redis'', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#17 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(132): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), ''redis'', Object(Illuminate\\Queue\\WorkerOptions))\n#18 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon(''redis'', ''default'', Object(Illuminate\\Queue\\WorkerOptions))\n#19 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker(''redis'', ''default'')\n#20 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#21 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(32): call_user_func_array(Array, Array)\n#22 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/Util.php(36): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(90): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Container/Container.php(592): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Console/Command.php(134): Illuminate\\Container\\Container->call(Array)\n#27 /var/www/laravel-e-vue/acl-api/vendor/symfony/console/Command/Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 /var/www/laravel-e-vue/acl-api/vendor/symfony/console/Application.php(912): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /var/www/laravel-e-vue/acl-api/vendor/symfony/console/Application.php(264): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /var/www/laravel-e-vue/acl-api/vendor/symfony/console/Application.php(140): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Console/Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 /var/www/laravel-e-vue/acl-api/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 /var/www/laravel-e-vue/acl-api/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 {main}', '2020-05-21 22:25:20');

-- --------------------------------------------------------

--
-- Estrutura da tabela `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` bigint(20) unsigned NOT NULL,
  `slug` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `groups`
--

INSERT INTO `groups` (`id`, `slug`, `desc`, `deleted_at`) VALUES
(1, 'admins', 'Admin Users', NULL),
(2, 'support', 'Support Users', NULL),
(3, 'financial', 'Financial Group', NULL),
(4, 'general_group', 'General Group', NULL),
(5, 'create_to_dele', 'criar para deletar e restaurar!', '2020-04-22 04:56:54');

-- --------------------------------------------------------

--
-- Estrutura da tabela `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` bigint(20) unsigned NOT NULL,
  `from` bigint(20) unsigned NOT NULL,
  `to` bigint(20) unsigned NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `excluded_for` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `conversation` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `messages`
--

INSERT INTO `messages` (`id`, `from`, `to`, `content`, `excluded_for`, `created_at`, `conversation`) VALUES
(56, 2, 8, 'troca', NULL, '2020-05-16 11:34:36', 90),
(57, 2, 8, 'c', NULL, '2020-05-16 11:41:10', 90),
(58, 2, 8, 'v', NULL, '2020-05-16 11:41:29', 90),
(59, 2, 8, 'x', NULL, '2020-05-16 11:42:09', 90),
(60, 2, 8, 'z', NULL, '2020-05-16 11:43:02', 90),
(61, 2, 8, 'yy', NULL, '2020-05-16 11:43:44', 90),
(62, 2, 8, 'ddd', NULL, '2020-05-16 11:44:04', 90),
(63, 8, 2, 'receber', NULL, '2020-05-16 11:44:33', 90),
(64, 8, 2, 'não recfebido', NULL, '2020-05-16 11:45:08', 90),
(65, 8, 2, 'ffggt', NULL, '2020-05-16 11:45:24', 90),
(66, 8, 2, 'fff', NULL, '2020-05-16 11:50:38', 90),
(67, 8, 2, 'k', NULL, '2020-05-16 13:15:57', 90),
(68, 8, 2, 'enviar', NULL, '2020-05-16 13:24:16', 90),
(69, 2, 8, 'receber', NULL, '2020-05-16 13:25:58', 90),
(70, 8, 2, 'encaminhar!', NULL, '2020-05-16 13:26:18', 90),
(71, 8, 2, 'asdf  fd', NULL, '2020-05-16 13:28:13', 90),
(72, 8, 2, 'fdasd fd d', NULL, '2020-05-16 13:28:55', 90),
(73, 8, 2, 'alterado forma de pegar o id', NULL, '2020-05-16 13:36:29', 90),
(74, 2, 8, 'recebido aui', NULL, '2020-05-16 13:36:41', 90),
(75, 8, 2, 'recebe agora', NULL, '2020-05-16 13:39:56', 90),
(76, 8, 2, 'garitão', NULL, '2020-05-16 13:43:40', 90),
(77, 8, 2, 'outra coisa', NULL, '2020-05-16 13:45:05', 90),
(78, 8, 2, 'alterado propriedade', NULL, '2020-05-16 13:46:17', 90),
(79, 9, 2, 'bom dia', NULL, '2020-05-16 13:50:42', 91),
(80, 2, 9, 'bom dia', NULL, '2020-05-16 13:50:58', 91),
(81, 9, 2, 'tudo bem?', NULL, '2020-05-16 13:51:06', 91),
(82, 2, 9, 'sim', NULL, '2020-05-16 13:51:14', 91),
(83, 9, 2, 'ótimo', NULL, '2020-05-16 13:51:20', 91),
(84, 2, 9, 'e por ai/', NULL, '2020-05-16 13:51:31', 91),
(85, 2, 8, 'oi', NULL, '2020-05-18 21:43:25', 90),
(86, 8, 2, 'olá', NULL, '2020-05-18 21:43:34', 90),
(87, 2, 8, 'dfdf dfdf d', NULL, '2020-05-18 21:44:28', 90),
(88, 2, 8, 'cacasd', NULL, '2020-05-18 21:47:39', 90),
(89, 8, 2, 'ha', NULL, '2020-05-18 22:15:37', 90),
(90, 2, 8, 'oi', NULL, '2020-05-18 22:28:01', 90),
(91, 8, 2, 'blz?', NULL, '2020-05-18 22:30:28', 90),
(92, 2, 8, 'sim, funcionando o supervisor', NULL, '2020-05-18 22:30:49', 90),
(93, 2, 8, 'ok', NULL, '2020-05-18 23:55:07', 90),
(94, 8, 2, 'ainda funcionando?', NULL, '2020-05-19 00:13:32', 90),
(95, 2, 8, 'sim, funcionando', NULL, '2020-05-19 00:13:44', 90),
(96, 2, 8, 'vou reiniciar a máquina', NULL, '2020-05-19 00:13:54', 90),
(97, 2, 8, 'teste', NULL, '2020-05-19 00:59:24', 90),
(98, 8, 2, 'testado', NULL, '2020-05-19 00:59:31', 90),
(99, 8, 2, 'ainda não sei como automatizar o PM2', NULL, '2020-05-19 01:11:50', 90),
(100, 2, 8, 'alternativa co método do PM2', NULL, '2020-05-19 01:12:05', 90),
(101, 2, 8, 'hum', NULL, '2020-05-19 01:12:48', 90),
(102, 8, 2, 'oi', NULL, '2020-05-21 22:24:06', 90),
(103, 8, 2, 'olá', NULL, '2020-05-21 22:24:23', 90),
(104, 8, 2, 'dfasfd', NULL, '2020-05-21 22:25:19', 90),
(105, 2, 8, 'olá', NULL, '2020-05-21 22:29:33', 90),
(106, 8, 2, 'oláa', NULL, '2020-05-21 22:29:45', 90),
(107, 2, 8, 'Passar para SystemNotification', NULL, '2020-05-21 22:31:00', 90),
(108, 8, 2, 'user:Cris', NULL, '2020-05-21 22:32:24', 90),
(109, 2, 8, 'pm2 deve star ok', NULL, '2020-05-23 23:42:03', 90),
(110, 8, 2, 'sim', NULL, '2020-05-23 23:42:17', 90);

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2020_04_19_024830_create_messages_table_', 2),
(5, '2020_04_19_121855_create_notifications_table', 3),
(7, '2019_08_28_214253_create_allowed_file_ext_table', 4),
(8, '2019_08_28_214252_create_tickets_table', 5),
(9, '2020_04_21_155420_create_groups_table_', 6),
(10, '2020_04_21_155420_create_groups_table__', 7),
(11, '2019_08_28_214250_create_app_configs_table', 8),
(12, '2018_04_09_203320_create_roles_table', 9),
(13, '2018_04_09_203544_create_permissions_table', 9),
(14, '2018_04_14_225054_create_profiles_table', 10),
(15, '2020_04_19_024830_create_messages_table', 11),
(16, '2020_04_19_024829_create_conversations_table', 12),
(17, '2020_05_01_083709_add_mobile_no_columns_to_users_table_conversations_I', 13),
(18, '2020_05_01_083709_add_mobile_no_columns_to_users_table conversations II', 14),
(20, '2020_04_21_155420_create_groups_table', 15),
(21, '2020_05_01_083709_add_mobile_no_columns_to_users_table____', 15),
(22, '2020_05_01_083709_add_mobile_no_columns_to_users_table______', 16),
(23, '2020_05_01_083709_add_mobile_no_columns_to_users_table', 17);

-- --------------------------------------------------------

--
-- Estrutura da tabela `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0cf7bdfd-74c7-4160-b19e-d28fdaa927c2', 'App\\Notifications\\BaseApp\\TicketNotification', 'App\\Models\\User', 2, '{"notification":{"id":69,"title":"New Ticket: N\\u00e3o consigo fazer. kjdjjk dkjfjdshjjk[...]","ticket_type_id":2,"content":"The incoming form request is validated before the controller method is called, meaning you do not need to clutter your controller with any validation logic. It has already been validated!\\n\\nIf validation fails, a redirect response will be generated to[...]"}}', '2020-05-24 14:15:10', '2020-05-24 14:14:30', '2020-05-24 14:15:10'),
('39c5ac5b-faf8-494b-9564-4e7bfb2b7ad8', 'App\\Notifications\\BaseApp\\TicketNotification', 'App\\Models\\User', 2, '{"notification":{"id":2,"title":"New Ticket: Support","ticket_type_id":2,"content":"Ticket ao Suporte"}}', NULL, '2020-05-24 19:37:21', '2020-05-24 19:37:21'),
('3ae05d11-32fb-48a0-b91e-e6b1eb9360bf', 'App\\Notifications\\BaseApp\\TicketNotification', 'App\\Models\\User', 8, '{"notification":{"id":69,"title":"New Ticket: N\\u00e3o consigo fazer. kjdjjk dkjfjdshjjk[...]","ticket_type_id":2,"content":"The incoming form request is validated before the controller method is called, meaning you do not need to clutter your controller with any validation logic. It has already been validated!\\n\\nIf validation fails, a redirect response will be generated to[...]"}}', NULL, '2020-05-24 14:14:30', '2020-05-24 14:14:30'),
('3ec1319d-3813-4b49-a57a-caaa82e1abfa', 'App\\Notifications\\BaseApp\\TicketNotification', 'App\\Models\\User', 2, '{"notification":{"id":1,"title":"New Ticket: Administration","ticket_type_id":1,"content":"Ticket aos administradores"}}', NULL, '2020-05-24 19:37:10', '2020-05-24 19:37:10'),
('43d33aa0-86f4-45d9-acae-4d99ad8ce194', 'App\\Notifications\\BaseApp\\TicketNotification', 'App\\Models\\User', 1, '{"notification":{"id":1,"title":"New Ticket: Administration","ticket_type_id":1,"content":"Ticket aos administradores"}}', NULL, '2020-05-24 19:37:10', '2020-05-24 19:37:10'),
('670458ce-2f5b-45a9-9043-263a1c83183c', 'App\\Notifications\\BaseApp\\TicketNotification', 'App\\Models\\User', 1, '{"notification":{"id":69,"title":"New Ticket: N\\u00e3o consigo fazer. kjdjjk dkjfjdshjjk[...]","ticket_type_id":2,"content":"The incoming form request is validated before the controller method is called, meaning you do not need to clutter your controller with any validation logic. It has already been validated!\\n\\nIf validation fails, a redirect response will be generated to[...]"}}', NULL, '2020-05-24 14:14:30', '2020-05-24 14:14:30'),
('960e9ed4-ac1c-4e9d-86fc-acdecd208430', 'App\\Notifications\\BaseApp\\TicketNotification', 'App\\Models\\User', 2, '{"notification":{"id":68,"title":"New Ticket: N\\u00e3o consigo fazer. kjdjjk dkjfjdshjjk kd dlkfjhl  jkhjdksfhdjk h fhdjf jkdh hfkj djfh fcacectre ce de agu[...]","ticket_type_id":2,"content":"The incoming form request is validated before the controller method is called, meaning you do not need to clutter your controller with any validation logic. It has already been validated!\\n\\nIf validation fails, a redirect response will be generated to[...]"}}', NULL, '2020-05-24 14:12:26', '2020-05-24 14:12:26'),
('98589737-a628-4166-a1e2-99d45c7ad900', 'App\\Notifications\\BaseApp\\TicketNotification', 'App\\Models\\User', 1, '{"notification":{"id":68,"title":"New Ticket: N\\u00e3o consigo fazer. kjdjjk dkjfjdshjjk kd dlkfjhl  jkhjdksfhdjk h fhdjf jkdh hfkj djfh fcacectre ce de agu[...]","ticket_type_id":2,"content":"The incoming form request is validated before the controller method is called, meaning you do not need to clutter your controller with any validation logic. It has already been validated!\\n\\nIf validation fails, a redirect response will be generated to[...]"}}', NULL, '2020-05-24 14:12:26', '2020-05-24 14:12:26'),
('a5d04bd4-8e1e-4f3c-8e15-52b93ed736b3', 'App\\Notifications\\BaseApp\\TicketNotification', 'App\\Models\\User', 2, '{"notification":{"id":4,"title":"New Ticket: Meu ticket","ticket_type_id":2,"content":"Este ticket n\\u00e3o deve aparecer em minha lista para processamento1"}}', NULL, '2020-05-24 20:02:34', '2020-05-24 20:02:34'),
('c04b0a82-5ba9-4db1-b70a-b8dc3ae6d48a', 'App\\Notifications\\BaseApp\\TicketNotification', 'App\\Models\\User', 8, '{"notification":{"id":68,"title":"New Ticket: N\\u00e3o consigo fazer. kjdjjk dkjfjdshjjk kd dlkfjhl  jkhjdksfhdjk h fhdjf jkdh hfkj djfh fcacectre ce de agu[...]","ticket_type_id":2,"content":"The incoming form request is validated before the controller method is called, meaning you do not need to clutter your controller with any validation logic. It has already been validated!\\n\\nIf validation fails, a redirect response will be generated to[...]"}}', NULL, '2020-05-24 14:12:27', '2020-05-24 14:12:27'),
('f1e8cbd1-3aa4-40f1-9149-b3a8001fddb9', 'App\\Notifications\\BaseApp\\TicketNotification', 'App\\Models\\User', 8, '{"notification":{"id":1,"title":"New Ticket: Administration","ticket_type_id":1,"content":"Ticket aos administradores"}}', NULL, '2020-05-24 19:37:10', '2020-05-24 19:37:10'),
('fcd9c4bc-c34f-487b-8391-96f482cc0bac', 'App\\Notifications\\BaseApp\\TicketNotification', 'App\\Models\\User', 8, '{"notification":{"id":3,"title":"New Ticket: Financeiro","ticket_type_id":3,"content":"Ticket ao Financeiro"}}', NULL, '2020-05-24 19:37:37', '2020-05-24 19:37:37');

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(175) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `label`, `created_at`, `updated_at`) VALUES
(1, 'acl_manager', 'Manager roles and permissions', '2020-04-25 13:24:10', '2020-04-25 13:24:10'),
(2, 'acl_view', 'View roles and permissions', '2020-04-25 13:24:10', '2020-04-25 13:24:10'),
(3, 'user_view', 'View users info', '2020-04-25 13:24:10', '2020-04-25 13:24:10'),
(4, 'user_view_self', 'View own info', '2020-04-25 13:24:10', '2020-04-25 13:24:10'),
(5, 'user_create', 'Create users', '2020-04-25 13:24:10', '2020-04-25 13:24:10'),
(6, 'user_edit', 'Edit users data', '2020-04-25 13:24:10', '2020-04-25 13:24:10'),
(7, 'user_edit_self', 'Edit own data', '2020-04-25 13:24:10', '2020-04-25 13:24:10'),
(8, 'user_delete', 'Delete a user', '2020-04-25 13:24:10', '2020-04-25 13:24:10'),
(9, 'user_delete_self', 'Delete your self account', '2020-04-25 13:24:10', '2020-04-25 13:24:10'),
(10, 'system_manager', 'System Manager', '2020-04-25 13:24:10', '2020-04-25 13:24:10'),
(11, 'user_manager', 'User Manager', '2020-04-25 13:24:10', '2020-04-25 13:24:10'),
(12, 'post_manager', 'Manager the posts', '2020-04-25 13:24:10', '2020-04-25 13:24:10'),
(13, 'post_view', 'View the posts', '2020-04-25 13:24:10', '2020-04-25 13:24:10'),
(14, 'post_edit', 'Edit a post', '2020-04-25 13:24:10', '2020-04-25 13:24:10'),
(15, 'post_create', 'Create a post', '2020-04-25 13:24:10', '2020-04-25 13:24:10'),
(16, 'post_delete', 'Delete a post', '2020-04-25 13:24:10', '2020-04-25 13:24:10'),
(17, 'post_view_self', 'View own posts', '2020-04-25 13:24:10', '2020-04-25 13:24:10'),
(18, 'post_edit_self', 'Edit own posts', '2020-04-25 13:24:10', '2020-04-25 13:24:10'),
(19, 'post_create_self', 'Create a post', '2020-04-25 13:24:10', '2020-04-25 13:24:10'),
(20, 'post_delete_self', 'Delete own posts', '2020-04-25 13:24:10', '2020-04-25 13:24:10'),
(21, 'ticket_manager', 'Manager the Tickets', '2020-04-27 00:07:19', '2020-04-27 00:07:19'),
(22, 'ticket_view', 'View the tickets', '2020-04-27 00:07:48', '2020-04-27 00:07:48'),
(23, 'ticket_edit', 'Edit a ticket', '2020-04-25 13:24:10', '2020-04-25 13:24:10'),
(24, 'ticket_create', 'Create a ticket', '2020-04-27 00:08:28', '2020-04-27 00:08:28'),
(25, 'ticket_delete', 'Delete a ticket', '2020-04-27 00:08:46', '2020-04-27 00:08:46');

-- --------------------------------------------------------

--
-- Estrutura da tabela `permission_role`
--

CREATE TABLE IF NOT EXISTS `permission_role` (
  `id` bigint(20) unsigned NOT NULL,
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES
(1, 1, 2),
(2, 2, 2),
(3, 10, 2),
(4, 11, 2),
(5, 4, 5),
(6, 7, 5),
(7, 9, 5),
(8, 12, 3),
(9, 17, 4),
(10, 18, 4),
(11, 19, 4),
(12, 20, 4),
(13, 21, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `personal_access_tokens`
--

CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(7, 'App\\User', 2, 'browser', '2fc94ed92afe63256052f7a1654aec2254b08ad5dcecf6a61740427bfc30b2dc', '["*"]', '2020-05-25 00:16:17', '2020-05-24 20:04:40', '2020-05-25 00:16:17');

-- --------------------------------------------------------

--
-- Estrutura da tabela `profiles`
--

CREATE TABLE IF NOT EXISTS `profiles` (
  `id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `branch_line` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(105) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sector` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(105) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `branch_line`, `address`, `sector`, `full_name`, `avatar`) VALUES
(1, 1, '0000', 'Administration Sector', 'TI', 'System Super Administrator', NULL),
(2, 2, '0000', 'Administration Sector', 'Admins', 'Crebs', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(175) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `roles`
--

INSERT INTO `roles` (`id`, `name`, `label`, `created_at`, `updated_at`) VALUES
(1, 'super-admin', 'Adiministrador total do sistema', '2020-04-25 13:24:10', '2020-04-25 13:24:10'),
(2, 'admin', 'Administrador limitado do sistema', '2020-04-25 13:24:10', '2020-04-25 13:24:10'),
(3, 'reviewer', 'Edita, publica e libera publicações no sistema', '2020-04-25 13:24:10', '2020-04-25 13:24:10'),
(4, 'publisher', 'Realiza suas próprias publicações', '2020-04-25 13:24:10', '2020-04-25 13:24:10'),
(5, 'user', 'Usuário registrado, sem mais privilégios', '2020-04-25 13:24:10', '2020-04-25 13:24:10'),
(6, 'none', 'none', '2020-04-25 10:43:49', '2020-04-25 10:43:49');

-- --------------------------------------------------------

--
-- Estrutura da tabela `role_user`
--

CREATE TABLE IF NOT EXISTS `role_user` (
  `id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `role_user`
--

INSERT INTO `role_user` (`id`, `user_id`, `role_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 2, 3),
(4, 8, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tickets`
--

CREATE TABLE IF NOT EXISTS `tickets` (
  `id` bigint(20) unsigned NOT NULL,
  `ticket_type_id` bigint(20) unsigned NOT NULL,
  `title` varchar(105) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) DEFAULT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `assigned` bigint(20) unsigned DEFAULT NULL,
  `closed_by` bigint(20) unsigned DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tickets`
--

INSERT INTO `tickets` (`id`, `ticket_type_id`, `title`, `content`, `priority`, `data`, `user_id`, `created_at`, `updated_at`, `assigned`, `closed_by`) VALUES
(1, 1, 'Administration', 'Ticket aos administradores', NULL, '[{"date":"2020-05-24 20:29:01","name":"closed by #2 Cleber Martins","details":"fechar"},{"date":"2020-05-24 20:38:05","name":"#2 Cleber Martins","details":"fechar ticket"},{"date":"2020-05-24 20:38:14","name":"closed by #2 Cleber Martins","details":"fechando como administrador"},{"date":"2020-05-24 21:03:46","name":"#8 Cris","details":"respondendo ticket"},{"date":"2020-05-24 21:04:11","name":"#2 Cleber Martins","details":"tudo ok"},{"date":"2020-05-24 21:04:23","name":"closed by #8 Cris","details":"fehcado por Cris"},{"date":"2020-05-24 21:15:39","name":"closed by #2 Cleber Martins","details":"Closed"},{"date":"2020-05-24 21:16:08","name":"closed by #8 Cris","details":"Closed"}]', 8, '2020-05-24 19:37:00', '2020-05-25 00:16:08', 2, 8),
(2, 2, 'Support', 'Ticket ao Suporte', NULL, '[{"date":"2020-05-24 20:41:44","name":"#2 Cleber Martins","details":"testar pegar s\\u00f3o neces\\u00e1rio no banco"},{"date":"2020-05-24 20:41:59","name":"#2 Cleber Martins","details":"na mensagem est\\u00e1 ok"},{"date":"2020-05-24 20:42:06","name":"closed by #2 Cleber Martins","details":"fechar e ver"},{"date":"2020-05-24 20:46:43","name":"#2 Cleber Martins","details":"analisar erros"},{"date":"2020-05-24 20:48:40","name":"#2 Cleber Martins","details":"for\\u00e7ar erro de novo"},{"date":"2020-05-24 20:49:31","name":"#2 Cleber Martins","details":"corrigido?"},{"date":"2020-05-24 20:49:38","name":"#2 Cleber Martins","details":"sim"},{"date":"2020-05-24 20:50:42","name":"closed by #2 Cleber Martins","details":"fechar"}]', 8, '2020-05-24 19:37:18', '2020-05-24 23:50:42', NULL, 2),
(3, 3, 'Financeiro', 'Ticket ao Financeiro', NULL, NULL, 8, '2020-05-24 19:37:37', '2020-05-24 19:37:37', NULL, NULL),
(4, 2, 'Meu ticket', 'Este ticket não deve aparecer em minha lista para processamento1', NULL, '[{"date":"2020-05-24 20:11:11","name":"#2 Cleber Martins","details":"Enviar mensagem"},{"date":"2020-05-24 20:11:24","name":"#2 Cleber Martins","details":"Outra"},{"date":"2020-05-24 20:11:36","name":"closed by #2 Cleber Martins","details":"resolvido"},{"date":"2020-05-24 20:43:29","name":"#2 Cleber Martins","details":"Tesar mensagem para quem criiou"},{"date":"2020-05-24 20:44:04","name":"#2 Cleber Martins","details":"for\\u00e7ar erro.OK"},{"date":"2020-05-24 20:44:20","name":"closed by #2 Cleber Martins","details":"fechar de vez"}]', 2, '2020-05-24 20:02:34', '2020-05-24 23:44:20', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tickets_groups`
--

CREATE TABLE IF NOT EXISTS `tickets_groups` (
  `id` bigint(20) unsigned NOT NULL,
  `group_id` bigint(20) unsigned NOT NULL,
  `ticket_type_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tickets_groups`
--

INSERT INTO `tickets_groups` (`id`, `group_id`, `ticket_type_id`, `created_at`) VALUES
(1, 1, 1, '2020-05-24 18:57:12'),
(2, 2, 2, '2020-05-24 18:57:12'),
(3, 3, 3, '2020-05-24 19:00:44');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ticket_types`
--

CREATE TABLE IF NOT EXISTS `ticket_types` (
  `id` bigint(20) unsigned NOT NULL,
  `slug` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `ticket_types`
--

INSERT INTO `ticket_types` (`id`, `slug`, `desc`) VALUES
(1, 'administration', 'Administration'),
(2, 'support', 'Support'),
(3, 'financial', 'Financial');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'System', 'root@mail.com', NULL, '$2y$10$OQftfx2Wp2Q9YyhARVzAnOhvadrMwPDYvGeLAkHRDY6rPrv1aDw.O', NULL, '2020-04-10 04:13:11', '2020-04-10 04:13:11', NULL),
(2, 'Cleber Martins', 'crebs.m@gmail.com', NULL, '$2y$10$TI10tKns3pEtMY0RDtEAaOk1E3UusVo4Ukm7dS9lBY0B9EzMfLJqC', NULL, '2020-04-14 14:35:58', '2020-04-14 14:35:58', NULL),
(8, 'Cris', 'cris@mail.com', NULL, '$2y$10$va5MsVLaoRPtWzpnFaKT2OKlvcROSTNQGpFTYNdLKfz/xM6Yoxxe.', NULL, '2020-04-14 15:47:40', '2020-04-14 15:47:40', NULL),
(9, 'João Pedro', 'joao@mail.com', NULL, '$2y$10$BPV991q6kHN2shUarQ.6duqWeT2hjOuvqIEYZtx2ZUWf95mjApwi2', NULL, '2020-04-27 03:09:30', '2020-04-27 03:09:30', NULL),
(10, 'Pedro Otavio', 'pedro@mail.com', NULL, '$2y$10$sBbTUrlACTbhZVs0S.ucceVibi4tncldZ/VA8O6q45ryG3ya3wu6e', NULL, '2020-04-27 03:11:04', '2020-04-27 03:11:04', NULL),
(11, 'Atilio Miguel', 'atilio@mail.com', NULL, '$2y$10$r.cFuSXNxgTDzPdES9/dR.KxTD9rU19UcI2ox3zI9DNL4LA9vwZWi', NULL, '2020-04-27 03:11:35', '2020-04-27 03:11:35', NULL),
(12, 'Marlucia', 'mama@mail.com', NULL, '$2y$10$31Xa1QHB4so0yaNAvTqZDOLBs0p3gXFKNLQWRYo57dQJafuxAK8sW', NULL, '2020-04-27 03:19:54', '2020-04-27 03:19:54', NULL),
(13, 'Other', 'other@mail.com', NULL, '$2y$10$BeUrwRmTJQygQj9Md3qmwOwmVwOM5UKa07T6c9JVvw9O9DBy/BECW', NULL, '2020-04-27 04:36:22', '2020-04-27 04:36:22', NULL),
(14, 'Vickie Hudson V', 'witting.neva@example.com', '2020-05-01 15:28:39', '$2y$10$JcQp6Pin2.W4GD6K1st1wOyH.DI5kNZhxvPgphlMDvZSvx3NKajK2', 'PZvQyWpAyP', '2020-05-01 15:28:43', '2020-05-01 15:28:43', NULL),
(15, 'Tracy Walsh', 'garfield74@example.net', '2020-05-01 15:28:39', '$2y$10$CY/7McGB.7B5wVLurbUi1.pP/lirZTgCnFwe7PfME8M2ppUGhQ3mO', 'ZQlEcRxHlA', '2020-05-01 15:28:43', '2020-05-01 15:28:43', NULL),
(16, 'Miss Magali Mayert', 'zulauf.freeman@example.com', '2020-05-01 15:28:39', '$2y$10$OY0GHGYX4ks/LNnjzwOmHeVwwApHMshaArr46ZJ70pF7OcphZxUNy', 'TeP2tPfXl3', '2020-05-01 15:28:43', '2020-05-01 15:28:43', NULL),
(17, 'Dr. Coleman Wisozk', 'nikita27@example.com', '2020-05-01 15:28:39', '$2y$10$7d8J9aOb61k4MLsjPapN5unstRtYDZ2HoZBsPmOdgPYvqWlyQGjz2', 'cYCbryYdN0', '2020-05-01 15:28:43', '2020-05-01 15:28:43', NULL),
(18, 'Mr. Taylor Kemmer', 'annabel35@example.org', '2020-05-01 15:28:39', '$2y$10$argjZQqxAIAJMgghyShV0eWiL69w9PhXC0Tf4o7jU6ypeZPXCZYzS', 'zS56jBzen5', '2020-05-01 15:28:43', '2020-05-01 15:28:43', NULL),
(19, 'Prof. Francis McLaughlin', 'hegmann.kaleb@example.org', '2020-05-01 15:28:39', '$2y$10$8KCXZUdzDhPx.dpsXz4Kx.gHKjYuDQUsvozj7Zo6iWyrPt5qr8c4q', 'KhF0N0NDxW', '2020-05-01 15:28:43', '2020-05-01 15:28:43', NULL),
(20, 'Lucius Keebler', 'ada94@example.org', '2020-05-01 15:28:40', '$2y$10$sxADx/lAnVorn3kjSMnmKO7lsly4cYz9KR/AOlbnSqmQP5tF10EBK', 'X7t5LPDvy7', '2020-05-01 15:28:43', '2020-05-01 15:28:43', NULL),
(21, 'Lester Anderson', 'anjali05@example.net', '2020-05-01 15:28:40', '$2y$10$TETSQ3m32PNZn8P2DJIzvOtJWusfj1wnAxNRNPseyGqt8sSpBAX8C', 'CSf7pZsOBL', '2020-05-01 15:28:43', '2020-05-01 15:28:43', NULL),
(22, 'Marcelo Schowalter III', 'fzboncak@example.org', '2020-05-01 15:28:40', '$2y$10$ClND3gWJQ1tSCwZ4gvYn7OK4mnRReD8ABbZ6xZDiHpv3g74mlDQOG', 'xaRzlGdtwY', '2020-05-01 15:28:44', '2020-05-01 15:28:44', NULL),
(23, 'Cortez Weber', 'maxwell36@example.org', '2020-05-01 15:28:40', '$2y$10$ye8zjUXFf9mrejtPintt6uxcCsJtmVBDhAsyBmUSDiNnObLTj0xgC', 'YXnEWZ4wpP', '2020-05-01 15:28:44', '2020-05-01 15:28:44', NULL),
(24, 'Tod Hirthe V', 'gabriella49@example.net', '2020-05-01 15:28:40', '$2y$10$YtOc7bzkWea5PTopJY3VfeU9pxN2Wu4RX5.D8rBU7mrJICjxhvpcq', 'jIdsk5v9qZ', '2020-05-01 15:28:44', '2020-05-01 15:28:44', NULL),
(25, 'Ms. Jeanne Tillman', 'adelia.padberg@example.net', '2020-05-01 15:28:40', '$2y$10$4/OQcZeHaUhpP18ttKoF7.vHytBbRwIl5DCurSn0./R.VrgAT04hW', 'hHRidhGhar', '2020-05-01 15:28:44', '2020-05-01 15:28:44', NULL),
(26, 'Torrey Kris', 'janie.schamberger@example.org', '2020-05-01 15:28:40', '$2y$10$XJMmX6QiLsRq1mACCMQST.C1JJu0nqhkqb7CIDmHwnjGHl6tcIM06', 'miiJ2fDJSu', '2020-05-01 15:28:44', '2020-05-01 15:28:44', NULL),
(27, 'Dr. Justyn Bins DVM', 'little.johnathan@example.com', '2020-05-01 15:28:41', '$2y$10$6Ss.u6iW0c.5Z/ccGYNrKOF/efMc5br2C/F/ZXaWY0Kl76d69EtGi', 'WR9lXo0UiB', '2020-05-01 15:28:44', '2020-05-01 15:28:44', NULL),
(28, 'Mr. Josiah Berge MD', 'ole25@example.net', '2020-05-01 15:28:41', '$2y$10$BVJBCgZpeT/ROKMBAYqHX.EesbfiF7vnBgQTCNE.XAQv.UeLU.4xW', '0eXUqdg5eY', '2020-05-01 15:28:44', '2020-05-01 15:28:44', NULL),
(29, 'Maxine Kuhic', 'hamill.herta@example.com', '2020-05-01 15:28:41', '$2y$10$fG5e96FGoghJ/2XAgIVkYuGfZjS2/uxscB.ttKlx4kr9tsO3XsFLG', 'KECYgKKQYR', '2020-05-01 15:28:44', '2020-05-01 15:28:44', NULL),
(30, 'Dr. Raquel Ratke', 'carolyne.heller@example.net', '2020-05-01 15:28:41', '$2y$10$iMxeha/SvtmPIQ/4rYokduMab2CKF0ZTXKsC5iPKrM4.sXHWnw5fq', 'rICGZulpdM', '2020-05-01 15:28:44', '2020-05-01 15:28:44', NULL),
(31, 'Prof. Griffin Powlowski PhD', 'caterina.cummerata@example.net', '2020-05-01 15:28:41', '$2y$10$AugNEzasGYYIgwSIks.cG.6EWIgpIuGHvKY6irFSBawlWx4JugaCS', 'uuiQIwiYR6', '2020-05-01 15:28:44', '2020-05-01 15:28:44', NULL),
(32, 'Mr. Forest Bins DVM', 'lurline.mcdermott@example.com', '2020-05-01 15:28:41', '$2y$10$reByHJgWM/xZotgygsHPO.KAmKAsfPtO6HgR8jUNdjzhrtT/2ZwdO', 'uFJpSBzdu8', '2020-05-01 15:28:44', '2020-05-01 15:28:44', NULL),
(33, 'Monique Ernser', 'ylarkin@example.org', '2020-05-01 15:28:42', '$2y$10$ZCS/jcLWadj7.BGRiIVPAO.VFWyD.pGYoVVlxCaQRz.CgYC/OCd/i', 'HXaTqBIO1X', '2020-05-01 15:28:44', '2020-05-01 15:28:44', NULL),
(34, 'Yessenia Hessel', 'zcorkery@example.net', '2020-05-01 15:28:42', '$2y$10$X3HMdPb7Qdy86RU6TNeS2.9jlNmVLz9vpQbwdX64h0AsxaI8l6MDO', '3KxJqeisyB', '2020-05-01 15:28:44', '2020-05-01 15:28:44', NULL),
(35, 'Mr. Donato Rowe DDS', 'larkin.josefa@example.net', '2020-05-01 15:28:42', '$2y$10$m3xewte81CCHtjMV7GudDOiPT2H8cZRn6civ5jQBGxv.xyt7.El7u', '2PF1YRVORS', '2020-05-01 15:28:44', '2020-05-01 15:28:44', NULL),
(36, 'Precious Haley', 'emmie50@example.org', '2020-05-01 15:28:42', '$2y$10$K4hAca7Rm3yhIXujE3jsP.FJVnmqiL2cQbsQ5R.L.r5uble4Av9W.', '0ixrKzNIbs', '2020-05-01 15:28:44', '2020-05-01 15:28:44', NULL),
(37, 'Willard Bogan', 'monte.cartwright@example.org', '2020-05-01 15:28:42', '$2y$10$JemHQDn8PcEIl/sr9IEyXuhodtHc4IRzJz2hy1tI.tgzxqauR5tHu', 'R1f6FlpkRe', '2020-05-01 15:28:44', '2020-05-01 15:28:44', NULL),
(38, 'Daryl Olson', 'lkovacek@example.com', '2020-05-01 15:28:42', '$2y$10$YlibZeVCLNQeaTNtQouImum0gsKcTWQtzv/qr2yN9e8XF6yBRjzCe', 'UphoVNvYHJ', '2020-05-01 15:28:44', '2020-05-01 15:28:44', NULL),
(39, 'Oleta Heaney', 'keshawn61@example.org', '2020-05-01 15:28:42', '$2y$10$sIMsDd3bPSxsQNyGaUqxkuNuFu3/XBktDUyl/qoG2GLTZ9piQ3iPW', 'DV2ScXWmjB', '2020-05-01 15:28:44', '2020-05-01 15:28:44', NULL),
(40, 'Darion Macejkovic', 'kavon.bailey@example.com', '2020-05-01 15:28:43', '$2y$10$yJj3BFrjfbOCK8WSxfi9beLYXuDPIGN1loqk9ydBHZbrGgORHJwde', 'q2zvVMUyCh', '2020-05-01 15:28:44', '2020-05-01 15:28:44', NULL),
(41, 'Lucas Kautzer', 'dylan.cronin@example.com', '2020-05-01 15:28:43', '$2y$10$D9CRunt/mmMowaAEZ/gewO6emAgy1TWeZKgzpvsh1AI77sLqO6jme', 'ToGvYBoDJ4', '2020-05-01 15:28:44', '2020-05-01 15:28:44', NULL),
(42, 'Marcos Douglas', 'kunde.leilani@example.net', '2020-05-01 15:28:43', '$2y$10$VqQ5whqlEiBtO0L80xqfKey5YkxGcmPoxsVKvKlLIhQlgdspc5sjC', '3f2H3GCkOu', '2020-05-01 15:28:44', '2020-05-01 15:28:44', NULL),
(43, 'Noemy Schaefer', 'rodger77@example.org', '2020-05-01 15:28:43', '$2y$10$1vIOqrupnCzTcUaFtBJOROstC85sQSlXgn1YSSvEumN3DAVe.kVg.', 'i0bskkYr3S', '2020-05-01 15:28:44', '2020-05-01 15:28:44', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users_groups`
--

CREATE TABLE IF NOT EXISTS `users_groups` (
  `id` bigint(20) unsigned NOT NULL,
  `group_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users_groups`
--

INSERT INTO `users_groups` (`id`, `group_id`, `user_id`, `created_at`) VALUES
(1, 1, 1, '2020-05-24 18:53:30'),
(2, 1, 2, '2020-05-24 18:53:30'),
(3, 1, 8, '2020-05-24 18:53:30'),
(4, 2, 2, '2020-05-24 18:53:30'),
(5, 3, 8, '2020-05-24 18:55:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allowed_file_ext`
--
ALTER TABLE `allowed_file_ext`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_configs`
--
ALTER TABLE `app_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversations_from_foreign` (`from`),
  ADD KEY `conversations_to_foreign` (`to`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `groups_slug_unique` (`slug`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_from_foreign` (`from`),
  ADD KEY `messages_to_foreign` (`to`),
  ADD KEY `messages_conversation_foreign` (`conversation`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_user_id_foreign` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_ticket_type_id_foreign` (`ticket_type_id`),
  ADD KEY `tickets_user_id_foreign` (`user_id`),
  ADD KEY `tickets_assigned_foreign` (`assigned`),
  ADD KEY `tickets_closed_by_foreign` (`closed_by`);

--
-- Indexes for table `tickets_groups`
--
ALTER TABLE `tickets_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_groups_group_id_foreign` (`group_id`),
  ADD KEY `tickets_groups_ticket_type_id_foreign` (`ticket_type_id`);

--
-- Indexes for table `ticket_types`
--
ALTER TABLE `ticket_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_group_group_id_foreign` (`group_id`),
  ADD KEY `user_group_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allowed_file_ext`
--
ALTER TABLE `allowed_file_ext`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `app_configs`
--
ALTER TABLE `app_configs`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=111;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tickets_groups`
--
ALTER TABLE `tickets_groups`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ticket_types`
--
ALTER TABLE `ticket_types`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `conversations`
--
ALTER TABLE `conversations`
  ADD CONSTRAINT `conversations_from_foreign` FOREIGN KEY (`from`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `conversations_to_foreign` FOREIGN KEY (`to`) REFERENCES `users` (`id`);

--
-- Limitadores para a tabela `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_conversation_foreign` FOREIGN KEY (`conversation`) REFERENCES `conversations` (`id`),
  ADD CONSTRAINT `messages_from_foreign` FOREIGN KEY (`from`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `messages_to_foreign` FOREIGN KEY (`to`) REFERENCES `users` (`id`);

--
-- Limitadores para a tabela `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Limitadores para a tabela `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_assigned_foreign` FOREIGN KEY (`assigned`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tickets_closed_by_foreign` FOREIGN KEY (`closed_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tickets_ticket_type_id_foreign` FOREIGN KEY (`ticket_type_id`) REFERENCES `ticket_types` (`id`),
  ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Limitadores para a tabela `tickets_groups`
--
ALTER TABLE `tickets_groups`
  ADD CONSTRAINT `tickets_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `tickets_groups_ticket_type_id_foreign` FOREIGN KEY (`ticket_type_id`) REFERENCES `ticket_types` (`id`);

--
-- Limitadores para a tabela `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `user_group_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `user_group_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
