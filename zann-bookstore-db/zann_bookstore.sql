/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `all_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `comment_reaction` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reaction_comment_id` bigint unsigned NOT NULL,
  `reaction_user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reaction_comment_id` (`reaction_comment_id`),
  KEY `reaction_user_id` (`reaction_user_id`),
  CONSTRAINT `comment_reaction_ibfk_1` FOREIGN KEY (`reaction_comment_id`) REFERENCES `premade_comment` (`id`),
  CONSTRAINT `comment_reaction_ibfk_2` FOREIGN KEY (`reaction_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `conversation_table` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `admin_id` bigint unsigned NOT NULL,
  `member_id` bigint unsigned NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `member_id` (`member_id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `conversation_table_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `users` (`id`),
  CONSTRAINT `conversation_table_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `donation_table` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `amount` varchar(255) NOT NULL,
  `message` text,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `message_table` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` text,
  `sender_id` varchar(255) DEFAULT NULL,
  `conversation_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `conversation_id` (`conversation_id`),
  CONSTRAINT `message_table_ibfk_1` FOREIGN KEY (`conversation_id`) REFERENCES `conversation_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`),
  KEY `password_reset_tokens_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `premade_comment` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_id` bigint unsigned NOT NULL,
  `comment_user_id` bigint unsigned NOT NULL,
  `comment_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_post_id` (`comment_post_id`),
  KEY `comment_user_id` (`comment_user_id`),
  CONSTRAINT `premade_comment_ibfk_1` FOREIGN KEY (`comment_post_id`) REFERENCES `premade_posts` (`id`),
  CONSTRAINT `premade_comment_ibfk_2` FOREIGN KEY (`comment_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `premade_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `file_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1051 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `premade_like` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `premade_like_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `premade_like_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `premade_posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `premade_posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_images` json DEFAULT NULL,
  `caption` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `transaction_table` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemFile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemTitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientEmail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postalCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paymentStats` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paymentMethod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `premade_id` bigint unsigned NOT NULL,
  `shipmentDate` date DEFAULT NULL,
  `completedDate` date DEFAULT NULL,
  `item_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `premade_id` (`premade_id`),
  CONSTRAINT `transaction_table_ibfk_1` FOREIGN KEY (`premade_id`) REFERENCES `premade_items` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10042 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `file_logo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10033 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('artsbyannz|127.0.0.1', 'i:1;', 1743345359);
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('artsbyannz|127.0.0.1:timer', 'i:1743345359;', 1743345359);
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('asd|127.0.0.1', 'i:1;', 1743345689);
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('asd|127.0.0.1:timer', 'i:1743345689;', 1743345689),
('asdas|127.0.0.1', 'i:3;', 1743344884),
('asdas|127.0.0.1:timer', 'i:1743344884;', 1743344884),
('asdasd|127.0.0.1', 'i:1;', 1743345452),
('asdasd|127.0.0.1:timer', 'i:1743345452;', 1743345452),
('dstsc_admin|127.0.0.1', 'i:1;', 1743345022),
('dstsc_admin|127.0.0.1:timer', 'i:1743345022;', 1743345022),
('joven@gmail.com|127.0.0.1', 'i:1;', 1743344646),
('joven@gmail.com|127.0.0.1:timer', 'i:1743344646;', 1743344646),
('jovenmiclat28@gmail.com|127.0.0.1', 'i:3;', 1743343181),
('jovenmiclat28@gmail.com|127.0.0.1:timer', 'i:1743343181;', 1743343181);



INSERT INTO `comment_reaction` (`id`, `reaction_comment_id`, `reaction_user_id`, `created_at`, `updated_at`) VALUES
(55, 234, 3, '2025-02-02 07:49:28', '2025-02-02 07:49:28');
INSERT INTO `comment_reaction` (`id`, `reaction_comment_id`, `reaction_user_id`, `created_at`, `updated_at`) VALUES
(59, 239, 5, '2025-03-03 04:48:35', '2025-03-03 04:48:35');


INSERT INTO `conversation_table` (`id`, `created_at`, `admin_id`, `member_id`, `updated_at`) VALUES
(18, '2025-04-13 05:12:10', 3, 5, '2025-04-13 05:12:10');
INSERT INTO `conversation_table` (`id`, `created_at`, `admin_id`, `member_id`, `updated_at`) VALUES
(19, '2025-04-13 08:11:36', 3, 10032, '2025-04-13 08:11:36');


INSERT INTO `donation_table` (`id`, `amount`, `message`, `name`, `email`, `created_at`, `updated_at`, `payment`) VALUES
(1136, '219.00', NULL, 'Joven miclat', 'jovenmiclat28@gmail.com', '2025-03-30 07:31:31', '2025-03-30 07:31:31', 'Paypal');
INSERT INTO `donation_table` (`id`, `amount`, `message`, `name`, `email`, `created_at`, `updated_at`, `payment`) VALUES
(1140, '199.00', NULL, 'Uzziel ann joven', 'Uzzielann@gmail.com', '2025-03-30 08:34:27', '2025-03-30 08:34:27', 'Stripe');








INSERT INTO `message_table` (`id`, `message`, `sender_id`, `conversation_id`, `created_at`, `updated_at`) VALUES
(27, 'hello world', '5', 18, '2025-04-13 05:12:10', '2025-04-13 05:12:10');
INSERT INTO `message_table` (`id`, `message`, `sender_id`, `conversation_id`, `created_at`, `updated_at`) VALUES
(28, 'testing message', '5', 18, '2025-04-13 07:53:58', '2025-04-13 07:53:58');
INSERT INTO `message_table` (`id`, `message`, `sender_id`, `conversation_id`, `created_at`, `updated_at`) VALUES
(29, 'joven miclat', '5', 18, '2025-04-13 07:57:15', '2025-04-13 07:57:15');
INSERT INTO `message_table` (`id`, `message`, `sender_id`, `conversation_id`, `created_at`, `updated_at`) VALUES
(30, 'hello testing', '10032', 19, '2025-04-13 08:11:36', '2025-04-13 08:11:36');

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(10, '2024_12_28_033524_create_all_products_table', 2),
(11, '2025_01_04_124210_create_premade__items_table', 2),
(12, '2025_01_24_034531_create_premade_posts_table', 3),
(13, '2025_01_25_082928_create_premade_likes_table', 4),
(14, '2025_01_26_141227_create_premade_comments_table', 5),
(15, '2025_01_28_130301_create_comment_reactions_table', 6),
(17, '2025_02_18_074413_create_payments_table', 7),
(18, '2025_03_23_035030_create_password_reset_tokens_table', 8);



INSERT INTO `premade_comment` (`id`, `comment_post_id`, `comment_user_id`, `comment_text`, `parent_id`, `created_at`, `updated_at`) VALUES
(234, 28, 5, 'Loving this already! Quick question: Will the art challenges be open to all skill levels?', NULL, '2025-02-02 07:41:51', '2025-02-02 07:41:51');
INSERT INTO `premade_comment` (`id`, `comment_post_id`, `comment_user_id`, `comment_text`, `parent_id`, `created_at`, `updated_at`) VALUES
(239, 28, 3, 'Thank you! 💖 Yes, the art challenges will be open to all skill levels! Whether you\'re a beginner or experienced, you\'re welcome to join and have fun. 😊✨', 234, '2025-03-03 04:48:32', '2025-03-03 04:48:32');


INSERT INTO `premade_items` (`id`, `file_image`, `title`, `original_price`, `discount_price`, `type`, `item_class`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1029, 'images/8YlUikGbyM1MLzF3Ur0bDOV1M9bfyvI9hzoRB4i2.jpg', 'The Winter Journey: Premade Fantasy Book Cover', '259.00', '239.00', 'Book Cover', 'UNIQUE BOOK COVERS', 'Front cover only (original price)\r\nFull spread book cover (+ $50)\r\nFor full spread book cover, please include a $50 tip when you check out. It will include a plain-colored back cover with the needed blurb and other text. Instructions to receive your book cover can be seen when you checked out.\r\n\r\nNeed a beautiful and affordable illustrated book cover for your upcoming release? This premade book cover will definitely make your novel stand out from the rest!\r\n\r\nIn this book cover, you will be given a exclusive license for book cover use (meaning, this cannot be use for a different book cover). You can use this book cover for online platform posting or as a physical book cover of your book.\r\n\r\nFor a fully customizable and unique illustrated book cover for your physical book, you may also consider commissioning me!\r\n\r\n********************\r\n\r\nHi! I\'m Ann and I have 3 years experience as a freelance digital artist and I have worked with publishers like Anvil Publishing, Gantala Press and various international and local indie authors. For more work samples, please visit my portfolio at https://artsbyannz.com\r\n\r\nNote: Instructions to receive your book cover can be seen when you checked out. Please follow these so you can receive your order within 7 business days.', 1, '2025-01-13 01:12:12', '2025-02-05 01:25:20');
INSERT INTO `premade_items` (`id`, `file_image`, `title`, `original_price`, `discount_price`, `type`, `item_class`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1030, 'images/gA9MdxbUi8PTKLzRzbhnWgxY1odJBOJvRbGZu48B.jpg', 'Estrella: Premade Fantasy Book Cover', '150.00', '129.00', 'Book Cover', 'UNIQUE BOOK COVERS', 'Front cover only (original price)\r\nFull spread book cover (+ $50)\r\nFor full spread book cover, please include a $50 tip when you check out. It will include a plain-colored back cover with the needed blurb and other text. Instructions to receive your book cover can be seen when you checked out.\r\n\r\nNeed a beautiful and affordable illustrated book cover for your upcoming release? This premade book cover will definitely make your novel stand out from the rest!\r\n\r\nIn this book cover, you will be given a non-exclusive license for book cover (meaning this book cover can still be bought and use by other who buys it). You can use this book cover for online platform posting or as a physical book cover of your book.\r\n\r\nFor a fully customizable and unique illustrated book cover for your physical book, you may also consider commissioning me!\r\n\r\n\r\n********************\r\n\r\nHi! I\'m Ann and I have 3 years experience as a freelance digital artist and I have worked with publishers like Anvil Publishing, Gantala Press and various international and local indie authors. For more work samples, please visit my portfolio at https://artsbyannz.com\r\n\r\nNote: Instructions to receive your book cover can be seen when you checked out. Please follow these so you can receive your order within 7 business days.', 1, '2025-01-13 01:12:51', '2025-01-20 04:30:34');
INSERT INTO `premade_items` (`id`, `file_image`, `title`, `original_price`, `discount_price`, `type`, `item_class`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1031, 'images/koeEsFUvx9SFjUQdFFXvTTj18O9FxmTDUyUdOKhV.jpg', 'Lumiere: Premade Romance Book Cover', '135.00', '119.00', 'Book Cover', 'ROMANCE PREMADE COVERS', 'Front cover only (original price)\r\nFull spread book cover (+ $50)\r\nFor full spread book cover, please include a $50 tip when you check out. It will include a plain-colored back cover with the needed blurb and other text. Instructions to receive your book cover can be seen when you checked out.\r\n\r\nNeed a beautiful and affordable illustrated book cover for your upcoming release? This premade book cover will definitely make your novel stand out from the rest!\r\n\r\nIn this book cover, you will be given a non-exclusive license for book cover (meaning this book cover can still be bought and use by other who buys it). You can use this book cover for online platform posting or as a physical book cover of your book.\r\n\r\nFor a fully customizable and unique illustrated book cover for your physical book, you may also consider commissioning me!\r\n\r\n\r\n********************\r\n\r\nHi! I\'m Ann and I have 3 years experience as a freelance digital artist and I have worked with publishers like Anvil Publishing, Gantala Press and various international and local indie authors. For more work samples, please visit my portfolio at https://artsbyannz.com\r\n\r\nNote: Instructions to receive your book cover can be seen when you checked out. Please follow these so you can receive your order within 7 business days.', 1, '2025-01-13 01:13:22', '2025-02-02 08:31:29');
INSERT INTO `premade_items` (`id`, `file_image`, `title`, `original_price`, `discount_price`, `type`, `item_class`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1032, 'images/SvlxEpBfh0Dj5l8EJcwnCDtJxCwnyE0r4X7EObKD.jpg', 'Love Like Ours: Premade Romance Cover', '149.00', '119.00', 'Book Cover', 'ROMANCE PREMADE COVERS', 'Front cover only (original price)\r\nFull spread book cover (+ $50)\r\nFor full spread book cover, please include a $50 tip when you check out. It will include a plain-colored back cover with the needed blurb and other text. \r\n\r\nNeed a beautiful and affordable illustrated book cover for your upcoming release? This premade book cover will definitely make your novel stand out from the rest!\r\n\r\nIn this book cover, you will be given a non-exclusive license of book cover use (meaning this book cover can still be bought and use by other who buys it). You can use this book cover for online platform posting or as a physical book cover of your book.\r\n\r\nFor a fully customizable and unique illustrated book cover for your physical book, you may also consider commissioning me!\r\n\r\nHi! I\'m Ann and I have 3 years experience as a freelance digital artist and I have worked with publishers like Anvil Publishing, Gantala Press and various international and local indie authors. For more work samples, please visit my portfolio at https://artsbyannz.com\r\n\r\nNote: After placing your order, you will be redirected to my website client gallery link. You won\'t see your cover there. Please send me a message, along with the screenshot of your payment and cover details to add so I can upload your cover in the website within 7 business days. Thank you.', 1, '2025-01-13 01:14:03', '2025-01-20 04:30:46'),
(1033, 'images/9elDBsPlQUBpJmAYKAIQi2AoMKsOYvMWTlwZPfbw.jpg', 'A Guide to Living: Premade Book Cover', '220.00', '199.00', 'Book Cover', 'UNIQUE BOOK COVERS', 'Front cover only (original price)\r\nFull spread book cover (+ $50)\r\nFor full spread book cover, please include a $50 tip when you check out. It will include a plain-colored back cover with the needed blurb and other text. Instructions to receive your book cover can be seen when you checked out.\r\n\r\nNeed a beautiful and affordable illustrated book cover for your upcoming release? This premade book cover will definitely make your novel stand out from the rest!\r\n\r\nIn this book cover, you will be given a exclusive license for book cover use (meaning, this cannot be use for a different book cover). You can use this book cover for online platform posting or as a physical book cover of your book.\r\n\r\nFor a fully customizable and unique illustrated book cover for your physical book, you may also consider commissioning me!\r\n\r\n********************\r\n\r\nHi! I\'m Ann and I have 3 years experience as a freelance digital artist and I have worked with publishers like Anvil Publishing, Gantala Press and various international and local indie authors. For more work samples, please visit my portfolio at https://artsbyannz.com\r\n\r\nNote: Instructions to receive your book cover can be seen when you checked out. Please follow these so you can receive your order within 7 business days.', 1, '2025-01-13 01:16:24', '2025-01-20 04:30:55'),
(1034, 'images/rxY284MQ1r1AkncF0UC67ByaliPJTnP7ITiB8dKW.jpg', 'Like the Old Times: Premade Book Cover', '175.00', '165.00', 'Book Cover', 'UNIQUE BOOK COVERS', 'Front cover only (original price)\r\nFull spread book cover (+ $50)\r\nFor full spread book cover, please include a $50 tip when you check out. It will include a plain-colored back cover with the needed blurb and other text. Instructions to receive your book cover can be seen when you checked out.\r\n\r\nNeed a beautiful and affordable illustrated book cover for your upcoming release? This premade book cover will definitely make your novel stand out from the rest!\r\n\r\nIn this book cover, you will be given a exclusive license for book cover use (meaning, this cannot be use for a different book cover). You can use this book cover for online platform posting or as a physical book cover of your book.\r\n\r\nFor a fully customizable and unique illustrated book cover for your physical book, you may also consider commissioning me!\r\n\r\n********************\r\n\r\nHi! I\'m Ann and I have 3 years experience as a freelance digital artist and I have worked with publishers like Anvil Publishing, Gantala Press and various international and local indie authors. For more work samples, please visit my portfolio at https://artsbyannz.com\r\n\r\nNote: Instructions to receive your book cover can be seen when you checked out. Please follow these so you can receive your order within 7 business days.', 1, '2025-01-13 01:17:04', '2025-01-20 04:31:02'),
(1035, 'images/5S9rV1jQu25CyrYt4aSAOOcxS1poLCDNpRsOWJKP.jpg', 'Maybe Forever: Premade Romance Book Cover', '239.00', '219.00', 'Book Cover', 'ROMANCE PREMADE COVERS', 'Front cover only (original price)\r\nFull spread book cover (+ $50)\r\nFor full spread book cover, please include a $50 tip when you check out. It will include a plain-colored back cover with the needed blurb and other text. Instructions to receive your book cover can be seen when you checked out.\r\n\r\nNeed a beautiful and affordable illustrated book cover for your upcoming release? This premade book cover will definitely make your novel stand out from the rest!\r\n\r\nIn this book cover, you will be given a exclusive license for book cover use (meaning, this cannot be use for a different book cover). You can use this book cover for online platform posting or as a physical book cover of your book.\r\n\r\nFor a fully customizable and unique illustrated book cover for your physical book, you may also consider commissioning me!\r\n\r\n********************\r\n\r\nHi! I\'m Ann and I have 3 years experience as a freelance digital artist and I have worked with publishers like Anvil Publishing, Gantala Press and various international and local indie authors. For more work samples, please visit my portfolio at https://artsbyannz.com\r\n\r\nNote: Instructions to receive your book cover can be seen when you checked out. Please follow these so you can receive your order within 7 business days.', 1, '2025-01-13 01:17:55', '2025-01-20 04:29:34'),
(1036, 'images/PlwiwVLYif1u7yYqxqDf649O0ItDVcjdyj9j5Z8y.jpg', 'Sincerely Yours: Premade Romance Book Cover', '269.00', '239.00', 'Book Cover', 'ROMANCE PREMADE COVERS', 'Front cover only (original price)\r\nFull spread book cover (+ $50)\r\nFor full spread book cover, please include a $50 tip when you check out. It will include a plain-colored back cover with the needed blurb and other text. Instructions to receive your book cover can be seen when you checked out.\r\n\r\nNeed a beautiful and affordable illustrated book cover for your upcoming release? This premade book cover will definitely make your novel stand out from the rest!\r\n\r\nIn this book cover, you will be given a exclusive license for book cover use (meaning, this cannot be use for a different book cover). You can use this book cover for online platform posting or as a physical book cover of your book.\r\n\r\nFor a fully customizable and unique illustrated book cover for your physical book, you may also consider commissioning me!\r\n\r\n********************\r\n\r\nHi! I\'m Ann and I have 3 years experience as a freelance digital artist and I have worked with publishers like Anvil Publishing, Gantala Press and various international and local indie authors. For more work samples, please visit my portfolio at https://artsbyannz.com\r\n\r\nNote: Instructions to receive your book cover can be seen when you checked out. Please follow these so you can receive your order within 7 business days.', 1, '2025-01-13 01:18:27', '2025-01-20 04:29:03'),
(1037, 'images/zO1qwaM6iDgjx7mivyVEdYpHRARv3OSA2NOMr1GG.jpg', 'Summer Love: Premade Romance Book Cover', '249.00', '229.00', 'Book Cover', 'ROMANCE PREMADE COVERS', 'Front cover only (original price)\r\nFull spread book cover (+ $50)\r\nFor full spread book cover, please include a $50 tip when you check out. It will include a plain-colored back cover with the needed blurb and other text. Instructions to receive your book cover can be seen when you checked out.\r\n\r\nNeed a beautiful and affordable illustrated book cover for your upcoming release? This premade book cover will definitely make your novel stand out from the rest!\r\n\r\nIn this book cover, you will be given a exclusive license for book cover use (meaning, this cannot be use for a different book cover). You can use this book cover for online platform posting or as a physical book cover of your book.\r\n\r\nFor a fully customizable and unique illustrated book cover for your physical book, you may also consider commissioning me!\r\n\r\n********************\r\n\r\nHi! I\'m Ann and I have 3 years experience as a freelance digital artist and I have worked with publishers like Anvil Publishing, Gantala Press and various international and local indie authors. For more work samples, please visit my portfolio at https://artsbyannz.com\r\n\r\nNote: Instructions to receive your book cover can be seen when you checked out. Please follow these so you can receive your order within 7 business days.', 1, '2025-01-13 01:19:00', '2025-01-20 04:29:51'),
(1038, 'images/xei1ul2cIVSJ9G2Hdd4qClr4n5iiUfquwnbSS4Xq.jpg', 'The Light: Premade Fantasy Book Cover', '229.00', '210.00', 'Book Cover', 'UNIQUE BOOK COVERS', 'Front cover only (original price)\r\nFull spread book cover (+ $50)\r\nFor full spread book cover, please include a $50 tip when you check out. It will include a plain-colored back cover with the needed blurb and other text. Instructions to receive your book cover can be seen when you checked out.\r\n\r\nNeed a beautiful and affordable illustrated book cover for your upcoming release? This premade book cover will definitely make your novel stand out from the rest!\r\n\r\nIn this book cover, you will be given a exclusive license for book cover use (meaning, this cannot be use for a different book cover). You can use this book cover for online platform posting or as a physical book cover of your book.\r\n\r\nFor a fully customizable and unique illustrated book cover for your physical book, you may also consider commissioning me!\r\n\r\n********************\r\n\r\nHi! I\'m Ann and I have 3 years experience as a freelance digital artist and I have worked with publishers like Anvil Publishing, Gantala Press and various international and local indie authors. For more work samples, please visit my portfolio at https://artsbyannz.com\r\n\r\nNote: Instructions to receive your book cover can be seen when you checked out. Please follow these so you can receive your order within 7 business days.', 1, '2025-01-13 01:19:33', '2025-01-20 04:31:44'),
(1039, 'images/f1EGIoIgfgD3v3Z0FhU2fLR5fYx8PQG1FE6evbXy.jpg', 'Desert Gun: Premade Romance Book Cover', '149.00', '135.00', 'Book Cover', 'ROMANCE PREMADE COVERS', 'Front cover only (original price)\r\nFull spread book cover (+ $50)\r\nFor full spread book cover, please include a $50 tip when you check out. It will include a plain-colored back cover with the needed blurb and other text. Instructions to receive your book cover can be seen when you checked out.\r\n\r\nNeed a beautiful and affordable illustrated book cover for your upcoming release? This premade book cover will definitely make your novel stand out from the rest!\r\n\r\nIn this book cover, you will be given a non-exclusive license for book cover (meaning this book cover can still be bought and use by other who buys it). You can use this book cover for online platform posting or as a physical book cover of your book.\r\n\r\nFor a fully customizable and unique illustrated book cover for your physical book, you may also consider commissioning me!\r\n\r\n\r\n********************\r\n\r\nHi! I\'m Ann and I have 3 years experience as a freelance digital artist and I have worked with publishers like Anvil Publishing, Gantala Press and various international and local indie authors. For more work samples, please visit my portfolio at https://artsbyannz.com\r\n\r\nNote: Instructions to receive your book cover can be seen when you checked out. Please follow these so you can receive your order within 7 business days.', 1, '2025-01-13 01:19:59', '2025-01-20 04:31:55'),
(1040, 'images/bndUZjFqLQ24LsB8yAkNZRXVZVOBHZiUovjSDf0I.jpg', 'Runaway: Premade Romance Book Cover', '149.00', '135.00', 'Book Cover', 'ROMANCE PREMADE COVERS', 'Front cover only (original price)\r\nFull spread book cover (+ $50)\r\nFor full spread book cover, please include a $50 tip when you check out. It will include a plain-colored back cover with the needed blurb and other text. Instructions to receive your book cover can be seen when you checked out.\r\n\r\nNeed a beautiful and affordable illustrated book cover for your upcoming release? This premade book cover will definitely make your novel stand out from the rest!\r\n\r\nIn this book cover, you will be given a non-exclusive license for book cover (meaning this book cover can still be bought and use by other who buys it). You can use this book cover for online platform posting or as a physical book cover of your book.\r\n\r\nFor a fully customizable and unique illustrated book cover for your physical book, you may also consider commissioning me!\r\n\r\n\r\n********************\r\n\r\nHi! I\'m Ann and I have 3 years experience as a freelance digital artist and I have worked with publishers like Anvil Publishing, Gantala Press and various international and local indie authors. For more work samples, please visit my portfolio at https://artsbyannz.com\r\n\r\nNote: Instructions to receive your book cover can be seen when you checked out. Please follow these so you can receive your order within 7 business days.', 1, '2025-01-13 01:20:44', '2025-01-20 04:28:55'),
(1041, 'images/CapPhwyZ63R4uKkl2968UdBhBLZwednHJjZ7LJvR.jpg', 'Solace: Premade Poetry Book Cover', '129.00', '110.00', 'Book Cover', 'UNIQUE BOOK COVERS', 'Front cover only (original price)\r\nFull spread book cover (+ $50)\r\nFor full spread book cover, please include a $50 tip when you check out. It will include a plain-colored back cover with the needed blurb and other text. Instructions to receive your book cover can be seen when you checked out.\r\n\r\nNeed a beautiful and affordable illustrated book cover for your upcoming release? This premade book cover will definitely make your novel stand out from the rest!\r\n\r\nIn this book cover, you will be given a non-exclusive license for book cover (meaning this book cover can still be bought and use by other who buys it). You can use this book cover for online platform posting or as a physical book cover of your book.\r\n\r\nFor a fully customizable and unique illustrated book cover for your physical book, you may also consider commissioning me!\r\n\r\n\r\n********************\r\n\r\nHi! I\'m Ann and I have 3 years experience as a freelance digital artist and I have worked with publishers like Anvil Publishing, Gantala Press and various international and local indie authors. For more work samples, please visit my portfolio at https://artsbyannz.com\r\n\r\nNote: Instructions to receive your book cover can be seen when you checked out. Please follow these so you can receive your order within 7 business days.', 1, '2025-01-13 01:21:23', '2025-01-20 04:32:09'),
(1042, 'images/EmuP4291PCuVDjvS079hz2VKxrzC4FeITHkyppf4.jpg', 'Somewhere Only We Know: Premade Book Cover', '129.00', '110.00', 'Book Cover', 'UNIQUE BOOK COVERS', 'Front cover only (original price)\r\nFull spread book cover (+ $50)\r\nFor full spread book cover, please include a $50 tip when you check out. It will include a plain-colored back cover with the needed blurb and other text. Instructions to receive your book cover can be seen when you checked out.\r\n\r\nNeed a beautiful and affordable illustrated book cover for your upcoming release? This premade book cover will definitely make your novel stand out from the rest!\r\n\r\nIn this book cover, you will be given a non-exclusive license for book cover (meaning this book cover can still be bought and use by other who buys it). You can use this book cover for online platform posting or as a physical book cover of your book.\r\n\r\nFor a fully customizable and unique illustrated book cover for your physical book, you may also consider commissioning me!\r\n\r\n\r\n********************\r\n\r\nHi! I\'m Ann and I have 3 years experience as a freelance digital artist and I have worked with publishers like Anvil Publishing, Gantala Press and various international and local indie authors. For more work samples, please visit my portfolio at https://artsbyannz.com\r\n\r\nNote: Instructions to receive your book cover can be seen when you checked out. Please follow these so you can receive your order within 7 business days.', 1, '2025-01-13 01:21:48', '2025-01-20 04:32:17'),
(1048, 'images/oZKMKdBs8CwzheAcWj99LbU2qvDLp7JYunY3xMev.jpg', 'Studio Ghibli Fanart Wallpaper Art', '7.99', '5.99', 'WallPaper', NULL, 'A wallpaper set featuring Studio Ghibli fanarts by artsbyannz. \r\n\r\nThis includes magical and colorful wallpapers that you can use as your digital wallpaper for your phone. Make your digital company aesthetically-pleasing!', 1, '2025-01-18 03:14:12', '2025-01-18 03:14:12'),
(1049, 'images/o00n1V5a0kOiwkdnnfIALv54hHW5S9yJ73jF7lUm.jpg', 'The Goddesses Wallpaper Art', '7.99', '5.99', 'WallPaper', NULL, 'A wallpaper set featuring The Goddesses by artsbyannz. \r\n\r\nThis includes magical and colorful wallpapers that you can use as your digital wallpaper for your phone. Make your digital company aesthetically-pleasing!', 1, '2025-01-18 03:16:09', '2025-01-18 03:16:09'),
(1050, 'images/ImwILLGxhPD258C7govYyulxoC9hJUiCWdR83E3y.jpg', 'Slow Living Wallpaper Art', '7.99', '5.99', 'WallPaper', NULL, 'A cozy wallpaper art set by artsbyannz. \r\n\r\nThis includes cozy wallpapers that you can use as your digital wallpaper for your phone. Make your digital company aesthetically-pleasing!', 1, '2025-01-18 03:17:00', '2025-01-18 03:17:25');

INSERT INTO `premade_like` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(42, 28, 3, '2025-01-31 03:25:26', '2025-01-31 03:25:26');
INSERT INTO `premade_like` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(43, 34, 3, '2025-01-31 11:59:23', '2025-01-31 11:59:23');
INSERT INTO `premade_like` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(44, 34, 5, '2025-01-31 13:38:25', '2025-01-31 13:38:25');
INSERT INTO `premade_like` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(45, 28, 5, '2025-01-31 13:38:27', '2025-01-31 13:38:27');

INSERT INTO `premade_posts` (`id`, `post_images`, `caption`, `created_at`, `updated_at`) VALUES
(28, '[]', 'Hello, art friends!\n\nWelcome to our little our space and thank you for joining! I hope you enjoy your stay here🥰 There are so many things that we can do here! I\'ll be sharing art updates, my work in progress, some behind the scene process of my arts, earlier access to the art shop & more! We can even do some little art challenge for artists who are here!\n\nI\'m also excited to host our first Read With Me and pick the first book of the month! \n\nNeedless to say, I\'m so excited of all the fun things we can do here and I thank you already for being part of it🫶🏽\n\nBy joining, the email you\'ve used to create this account will be automatically added on A Journal of Magic newsletter. If you don\'t want this, you may unsubscribe anytime on the newsletter\n\nQ: Will you be interested to join a subscription tier in the future for as low as $2? Let me know in the comments below!', '2025-01-31 03:23:35', '2025-01-31 11:56:02');
INSERT INTO `premade_posts` (`id`, `post_images`, `caption`, `created_at`, `updated_at`) VALUES
(34, '[\"images/LfENoPaEb5cfrnbIsJjaijeUjC1e4wYMCHSubT9u.jpg\", \"images/4WLgWtgzPtmgw8XyvodlMZi4WaZOYvwuTqhmZU2D.webp\"]', 'Bookish Fanart: Vanessa Morelli (A Love Most Fatal)\r\nVanessa Morelli core🔪✨\r\n\r\nIf you want a good comedic, romantic and thrilling book, A Love Most Fatal is the book for you. And you would definitely love our girl boss, Vanessa Morelli!\r\n\r\nAlso, can we talk about THOSE gorgeous covers! the regular and paperback edition covers, even the character arts posted by the author are so gorgeous! \r\n\r\nOn top of it all, I love how badass Vanessa is as a mob boss, her love for her family and the people she considers one. Vanessa and Nate also compliment each other so well! So when I finished working on this portrait, I just knew this is how Vanessa looks like in my mind while reading it.\r\n\r\nI am really enjoying watercolor style artworks more than I expected, digitally and traditionally. The texture is top notch, also working on one layer for the colors definitely altered my work process, and I\'m just all for it! \r\n\r\n— Vanessa Morelli from A Love Most Fatal, book writen by Kath Richards\r\n\r\nQ: Do you prefer watercolor style portraits like this or the semirealistic ones?', '2025-01-31 11:58:24', '2025-01-31 11:58:24');


INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('9ENZDfUJthnOLn9m9sgbhyxO0tRRWk0IOsaeIhis', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiU0VzRnRPNFBCWmhaUjNpc1g5R2xhcVNGeFI4SkNpMExqcWlHVEdqVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9jaGF0Ym94Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mzt9', 1744532770);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('IdFrPwDzsHq4tTmFj9CUKkQAsZ6LZZN63vsGqj77', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTUswdkJueXk2SFR1RnpJYVFKRzZ1cGdlRFBiZjNzTlRnM01FenJNUiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL2NoYXRib3giO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mzt9', 1744552243);


INSERT INTO `transaction_table` (`id`, `payment_id`, `itemFile`, `itemTitle`, `quantity`, `amount`, `clientName`, `clientEmail`, `country`, `postalCode`, `paymentStats`, `paymentMethod`, `status`, `created_at`, `updated_at`, `premade_id`, `shipmentDate`, `completedDate`, `item_type`) VALUES
(10010, '50W06935WR7071325', 'images/5S9rV1jQu25CyrYt4aSAOOcxS1poLCDNpRsOWJKP.jpg', 'Maybe Forever: Premade Romance Book Cover', '2', '438.00', 'Joven Miclat', 'jovenmiclat28@gmail.com', 'Philippines', '2000', 'COMPLETED', 'Paypal', 'Completed', '2025-03-01 03:55:16', '2025-03-04 07:12:49', 1035, '2025-03-01', '2025-03-04', 'Book Cover');
INSERT INTO `transaction_table` (`id`, `payment_id`, `itemFile`, `itemTitle`, `quantity`, `amount`, `clientName`, `clientEmail`, `country`, `postalCode`, `paymentStats`, `paymentMethod`, `status`, `created_at`, `updated_at`, `premade_id`, `shipmentDate`, `completedDate`, `item_type`) VALUES
(10011, '4LY0397950571370X', 'images/bndUZjFqLQ24LsB8yAkNZRXVZVOBHZiUovjSDf0I.jpg', 'Runaway: Premade Romance Book Cover', '2', '270.00', 'Joven Miclat', 'jovenmiclat28@gmail.com', 'Hong Kong', '5000', 'COMPLETED', 'Paypal', 'Completed', '2025-03-01 11:10:02', '2025-03-04 07:13:11', 1040, '2025-03-01', '2025-01-04', 'Book Cover');
INSERT INTO `transaction_table` (`id`, `payment_id`, `itemFile`, `itemTitle`, `quantity`, `amount`, `clientName`, `clientEmail`, `country`, `postalCode`, `paymentStats`, `paymentMethod`, `status`, `created_at`, `updated_at`, `premade_id`, `shipmentDate`, `completedDate`, `item_type`) VALUES
(10012, '1740827449', 'images/CapPhwyZ63R4uKkl2968UdBhBLZwednHJjZ7LJvR.jpg', 'Solace: Premade Poetry Book Cover', '3', '330.00', 'Francis Puno', 'francis@gmail.com', 'Anguilla', '3000', 'COMPLETED', 'Stripe', 'Completed', '2025-03-01 11:11:07', '2025-03-04 07:13:13', 1041, '2025-03-01', '2025-04-04', 'Book Cover');
INSERT INTO `transaction_table` (`id`, `payment_id`, `itemFile`, `itemTitle`, `quantity`, `amount`, `clientName`, `clientEmail`, `country`, `postalCode`, `paymentStats`, `paymentMethod`, `status`, `created_at`, `updated_at`, `premade_id`, `shipmentDate`, `completedDate`, `item_type`) VALUES
(10013, '1740827517', 'images/zO1qwaM6iDgjx7mivyVEdYpHRARv3OSA2NOMr1GG.jpg', 'Summer Love: Premade Romance Book Cover', '2', '458.00', 'Uzziel Joven', 'uzziel43@gmail.com', 'Philippines', '2000', 'COMPLETED', 'Stripe', 'Completed', '2025-03-01 11:11:58', '2025-03-04 07:13:14', 1037, '2025-03-04', '2025-01-04', 'Book Cover'),
(10014, '1740827569', 'images/5S9rV1jQu25CyrYt4aSAOOcxS1poLCDNpRsOWJKP.jpg', 'Maybe Forever: Premade Romance Book Cover', '4', '876.00', 'Justine Aquino', 'Justine@gmail.com', 'Armenia', '4000', 'COMPLETED', 'Stripe', 'Completed', '2025-03-01 11:13:00', '2025-03-04 07:13:17', 1035, '2025-03-04', '2025-03-04', 'Book Cover'),
(10015, '1740827646', 'images/xei1ul2cIVSJ9G2Hdd4qClr4n5iiUfquwnbSS4Xq.jpg', 'The Light: Premade Fantasy Book Cover', '3', '630.00', 'Gabriel Aquino', 'Gabrielaquino@gmail.com', 'Philippines', '2000', 'COMPLETED', 'Stripe', 'Completed', '2025-03-01 11:14:13', '2025-03-04 07:13:19', 1038, '2025-03-04', '2025-02-04', 'Book Cover'),
(10016, '1740827711', 'images/o00n1V5a0kOiwkdnnfIALv54hHW5S9yJ73jF7lUm.jpg', 'The Goddesses Wallpaper Art', '4', '23.96', 'Laurence Aquino', 'Laurenceaquino@gmail.com', 'Philippines', '2000', 'COMPLETED', 'Stripe', 'Completed', '2025-03-01 11:15:16', '2025-03-04 07:13:20', 1049, '2025-03-04', '2025-03-04', 'WallPaper'),
(10017, '1740976880', 'images/zO1qwaM6iDgjx7mivyVEdYpHRARv3OSA2NOMr1GG.jpg', 'Summer Love: Premade Romance Book Cover', '2', '458.00', 'Joven miclat', 'jovenmiclat28@gmail.com', 'Philippines', '2000', 'COMPLETED', 'Stripe', 'Completed', '2025-03-03 04:42:12', '2025-03-04 07:13:23', 1037, '2025-03-04', '2025-02-04', 'Book Cover'),
(10018, '1741159748', 'images/bndUZjFqLQ24LsB8yAkNZRXVZVOBHZiUovjSDf0I.jpg', 'Runaway: Premade Romance Book Cover', '1', '135.00', 'Eunice Joven', 'eunice@gmail.com', 'Argentina', '8000', 'COMPLETED', 'Stripe', 'Completed', '2025-03-05 07:29:24', '2025-03-05 07:34:04', 1040, '2025-03-05', '2025-05-05', 'Book Cover'),
(10019, '1741159827', 'images/zO1qwaM6iDgjx7mivyVEdYpHRARv3OSA2NOMr1GG.jpg', 'Summer Love: Premade Romance Book Cover', '3', '687.00', 'Gel magat', 'gelmagat@gmail.com', 'Argentina', '6000', 'COMPLETED', 'Stripe', 'Completed', '2025-03-05 07:30:38', '2025-03-05 07:35:50', 1037, '2025-03-05', '2025-05-05', 'Book Cover'),
(10020, '1741159932', 'images/SvlxEpBfh0Dj5l8EJcwnCDtJxCwnyE0r4X7EObKD.jpg', 'Love Like Ours: Premade Romance Cover', '3', '357.00', 'Dania delos reyes', 'dania@gmail.com', 'Chad', '3000', 'COMPLETED', 'Stripe', 'Completed', '2025-03-05 07:32:26', '2025-03-05 07:37:12', 1032, '2025-03-05', '2025-06-05', 'Book Cover'),
(10021, '1741160009', 'images/o00n1V5a0kOiwkdnnfIALv54hHW5S9yJ73jF7lUm.jpg', 'The Goddesses Wallpaper Art', '3', '17.97', 'Matt malonzo', 'matt@gmail.com', 'Philippines', '2000', 'COMPLETED', 'Stripe', 'Completed', '2025-03-05 07:33:33', '2025-03-05 07:37:25', 1049, '2025-03-05', '2025-08-05', 'WallPaper'),
(10022, '1741160423', 'images/9elDBsPlQUBpJmAYKAIQi2AoMKsOYvMWTlwZPfbw.jpg', 'A Guide to Living: Premade Book Cover', '2', '398.00', 'Ann manuyag', 'annmanuyag@gmail.com', 'Armenia', '1000', 'COMPLETED', 'Stripe', 'Completed', '2025-03-05 07:40:43', '2025-03-05 07:43:39', 1033, '2025-03-05', '2025-09-05', 'Book Cover'),
(10023, '1741160492', 'images/bndUZjFqLQ24LsB8yAkNZRXVZVOBHZiUovjSDf0I.jpg', 'Runaway: Premade Romance Book Cover', '2', '270.00', 'Jacob miclat', 'jacob@gmail.com', 'Philippines', '2000', 'COMPLETED', 'Stripe', 'Completed', '2025-03-05 07:41:38', '2025-03-05 07:43:43', 1040, '2025-03-05', '2025-09-05', 'Book Cover'),
(10024, '1741160561', 'images/ImwILLGxhPD258C7govYyulxoC9hJUiCWdR83E3y.jpg', 'Slow Living Wallpaper Art', '3', '17.97', 'Ian libranda', 'ianlibranda@gmail.com', 'Philippines', '2000', 'COMPLETED', 'Stripe', 'Completed', '2025-03-05 07:42:42', '2025-03-05 07:43:45', 1050, '2025-03-05', '2025-12-05', 'Book Cover'),
(10026, '1741698249', 'images/SvlxEpBfh0Dj5l8EJcwnCDtJxCwnyE0r4X7EObKD.jpg', 'Love Like Ours: Premade Romance Cover', '3', '357.00', 'Macneil Mazo', 'mazomacneil@gmail.com', 'Armenia', '6000', 'COMPLETED', 'Stripe', 'Completed', '2025-03-11 13:04:24', '2025-03-11 13:24:40', 1032, '2025-03-11', '2025-03-11', 'Book Cover'),
(10027, '1741698327', 'images/bndUZjFqLQ24LsB8yAkNZRXVZVOBHZiUovjSDf0I.jpg', 'Runaway: Premade Romance Book Cover', '2', '270.00', 'Railey alviz', 'railey@gmail.com', 'Philippines', '2000', 'COMPLETED', 'Stripe', 'Completed', '2025-03-11 13:05:45', '2025-03-11 13:24:42', 1040, '2025-03-11', '2025-03-11', 'Book Cover');

INSERT INTO `users` (`id`, `username`, `password`, `remember_token`, `created_at`, `updated_at`, `file_logo`, `file_profile`, `is_admin`, `email`, `fullname`, `is_active`) VALUES
(3, 'artsbyannz', '$2y$12$a6SyEYwuj6svfSd3bHhBM.Oeisw3a3Pn7Sk7Pk5nCGZlSZAJT/V.m', NULL, '2025-01-15 02:54:49', '2025-04-13 13:48:26', 'images/xd5xpKaDytviq1hA20do8XG8UimSgu5mBf5Bg5Qz.png', 'images/qgoOlMDbTUfJYjmWuKqTGpTQiYLABd7n9xk0O8rD.jpg', 1, 'artsbyannz@gmail.com', 'Admin', 1);
INSERT INTO `users` (`id`, `username`, `password`, `remember_token`, `created_at`, `updated_at`, `file_logo`, `file_profile`, `is_admin`, `email`, `fullname`, `is_active`) VALUES
(5, 'jovenmiclatt', '$2y$12$GIufFCLGgDA8UUqf5sjXSetc05GEpgPOxnoXxlqbjc6IEgw/bkQQy', 'AWJAvnz0hyDb8MhsiV7AyEmA1oVHDgwop8kwlXeo1AgG54JRBRncUsCkFrKz', '2025-01-16 06:15:48', '2025-04-13 08:03:15', NULL, 'images/HddMdsyMouUGLZQka8BtYLtHsLzsfyREPXIA1Lr3.jpg', NULL, 'jovenmiclat28@gmail.com', 'Joven miclat', 0);
INSERT INTO `users` (`id`, `username`, `password`, `remember_token`, `created_at`, `updated_at`, `file_logo`, `file_profile`, `is_admin`, `email`, `fullname`, `is_active`) VALUES
(10029, 'eunice', '$2y$12$JEno.8b9KT3KiFsHuqC5fuV8rd3B8pC.lcOyCe06/Tr7tcwwrXRV2', NULL, '2025-03-20 11:12:51', '2025-03-20 11:14:22', NULL, 'images/Gacjo7qdSeBCuGYQU6iPidhi3T3taiieZh99KH1g.jpg', NULL, 'eunice@gmail.com', 'Eunice G. Joven', 0);
INSERT INTO `users` (`id`, `username`, `password`, `remember_token`, `created_at`, `updated_at`, `file_logo`, `file_profile`, `is_admin`, `email`, `fullname`, `is_active`) VALUES
(10030, 'johndoe', '$2y$12$6CKlial75FRRXGxCzOdR2.NBHNTzQoYa6HIOc0Uyt0/ttfQF93z4e', NULL, '2025-03-20 11:19:12', '2025-03-21 14:34:50', NULL, 'images/w37cF9HlFymAsN4QrIYzvcPiguSJ7z6x7LEwPgpG.jpg', NULL, 'johndoe@gmail.com', 'John doe', 0),
(10031, 'zann43', '$2y$12$opq2iX9I/KUD.iupxU02v.k6hlloItIIClA.lkhDA8SXum6/ou5j2', '2XSmTmUejAQEf7gEEHskxXqc4kyfRO09GKBP5YrAHDTozZvBWNO4FxQTRPwi', '2025-03-20 11:28:33', '2025-03-24 15:37:50', NULL, 'images/TGTjxULjxlSDWABRwHLuvn714HxG1mXNvWXNRYx7.jpg', NULL, 'Uzzielann@gmail.com', 'Uzziel ann Joven', 0),
(10032, 'testing', '$2y$12$YUhR86kN7LZQ5y.byKg8y.U0Doulz33EqCAQ7mq8O.xb6Bba84FQW', NULL, '2025-04-13 08:11:00', '2025-04-13 08:12:09', NULL, NULL, NULL, 'testing@gmail.com', 'testing', 0);


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;