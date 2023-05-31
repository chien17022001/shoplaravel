-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 31, 2023 lúc 03:27 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shoplaravel`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `user_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(13, 1, 5, 1, 5599000, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `subcategory_count` int(11) NOT NULL DEFAULT 0,
  `product_cout` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `slug`, `subcategory_count`, `product_cout`, `created_at`, `updated_at`) VALUES
(1, 'Thiết Bị Điện Tử', 'thiết-bị-điện-tử', 2, 5, NULL, '2023-04-12 18:25:57'),
(2, 'Máy Tính', 'máy-tính', 2, 3, NULL, '2023-04-10 01:21:24'),
(3, 'Đồng Hồ', 'đồng-hồ', 2, 1, NULL, '2023-04-12 18:28:10'),
(4, 'Điện Thoại', 'điện-thoại', 3, 0, NULL, '2023-04-10 01:42:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_02_19_023629_laratrust_setup_tables', 1),
(6, '2023_03_04_081318_create_categories_table', 1),
(7, '2023_03_04_082428_create_sub_categories_table', 1),
(8, '2023_03_04_082918_create_products_table', 1),
(9, '2023_03_21_154159_create_carts_table', 1),
(10, '2023_03_24_131829_create_shipping_infos_table', 1),
(11, '2023_03_25_030421_create_orders_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(191) NOT NULL,
  `product_id` int(191) NOT NULL,
  `quantity` int(11) NOT NULL,
  `toltal_price` int(11) NOT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `phone_number`, `email`, `address`, `product_id`, `quantity`, `toltal_price`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 'pham van chien', '0977362671', 'phamc1702@gmail.com', 'so 5 ngach 4 ngo 1', 1, 1, 5599000, 'pending', NULL, NULL),
(2, 5, 'pham van chien', '0977362671', 'phamc1702@gmail.com', 'so 5 ngach 4 ngo 1', 2, 1, 16180000, 'pending', NULL, NULL),
(3, 5, 'pham van chien', '0977362671', 'phamc1702@gmail.com', 'so 5 ngach 4 ngo 1', 4, 1, 8000000, 'pending', NULL, NULL),
(4, 5, 'pham van chien', '0977362671', 'phamc1702@gmail.com', 'so 5 ngach 4 ngo 1', 3, 1, 20000000, 'pending', NULL, NULL),
(5, 5, 'pham van chien', '0977362671', 'phamc1702@gmail.com', 'so 5 ngach 4 ngo 1', 8, 1, 599000, 'pending', NULL, NULL),
(6, 5, 'pham van chien', '0977362671', 'phamc1702@gmail.com', 'so 5 ngach 4 ngo 1', 7, 1, 599000, 'pending', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `display_name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'users-create', 'Create Users', 'Create Users', '2023-03-31 04:26:02', '2023-03-31 04:26:02'),
(2, 'users-read', 'Read Users', 'Read Users', '2023-03-31 04:26:02', '2023-03-31 04:26:02'),
(3, 'users-update', 'Update Users', 'Update Users', '2023-03-31 04:26:02', '2023-03-31 04:26:02'),
(4, 'users-delete', 'Delete Users', 'Delete Users', '2023-03-31 04:26:02', '2023-03-31 04:26:02'),
(5, 'payments-create', 'Create Payments', 'Create Payments', '2023-03-31 04:26:02', '2023-03-31 04:26:02'),
(6, 'payments-read', 'Read Payments', 'Read Payments', '2023-03-31 04:26:02', '2023-03-31 04:26:02'),
(7, 'payments-update', 'Update Payments', 'Update Payments', '2023-03-31 04:26:02', '2023-03-31 04:26:02'),
(8, 'payments-delete', 'Delete Payments', 'Delete Payments', '2023-03-31 04:26:02', '2023-03-31 04:26:02'),
(9, 'profile-read', 'Read Profile', 'Read Profile', '2023-03-31 04:26:02', '2023-03-31 04:26:02'),
(10, 'profile-update', 'Update Profile', 'Update Profile', '2023-03-31 04:26:02', '2023-03-31 04:26:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(9, 2),
(10, 1),
(10, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permission_user`
--

CREATE TABLE `permission_user` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(191) NOT NULL,
  `product_short_des` text NOT NULL,
  `product_long_des` text NOT NULL,
  `price` int(11) NOT NULL,
  `product_category_name` varchar(191) NOT NULL,
  `product_subcategory_name` varchar(191) NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `product_subcategory_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_img` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_short_des`, `product_long_des`, `price`, `product_category_name`, `product_subcategory_name`, `product_category_id`, `product_subcategory_id`, `quantity`, `product_img`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Laptop Kiwibook G22', 'Laptop Kiwibook G22 CPU J4105 - 2022 (~ i5 6200U) , ram 6G, SSD 240G, màn hình 14 inch IPS', 'Laptop KIWI BOOK G22 sở hữu ngoại hình đơn giản, hiện đại cùng những thông số kỹ thuật ổn định trong tầm giá, sẽ là một sự lựa chọn đáng cân nhắc cho người dùng học sinh, sinh viên khi đáp ứng tốt các tác vụ cơ bản hằng ngày. \r\nNgoại hình đơn giản, thanh lịch \r\nBản thân là một người ưa chuộng sự đơn giản nên em laptop này đã chiếm được cảm tình của mình ngay từ lần gặp đầu tiên với lớp vỏ nhựa được sơn màu bạc sáng, logo KIWI điêu khắc nổi bật cùng những cạnh góc bo cong tinh tế, tất cả đều tạo nên một nét đẹp tuy tối giản nhưng lại vô cùng thanh tao và cuốn hút.', 5599000, 'Máy Tính', 'Laptop', 2, 2, 23, 'upload/1761887186508738.jpg', 'laptop-kiwibook-g22', NULL, NULL),
(2, 'Laptop HP 15s-du3592TU', 'Laptop HP 15s-du3592TU/Silver/15.6\"HD/i5-1135G7/8GB RAM/512GB/Intel Graphics', 'Laptop HP 15s-du3592TU/Silver/15.6\"HD/i5-1135G7/8GB RAM/512GB SSD/Intel Graphics\r\nHệ điều hành\r\nWindows 11 Home\r\n \r\nDòng bộ xử lý\r\nBộ xử lý Intel® Core™ i5 Thế hệ 11\r\n \r\nBộ xử lý\r\nIntel® Core™ i5-1135G7 (lên đến 4,2 GHz với công nghệ Intel® Turbo Boost, bộ nhớ đệm 8 MB L3, 4 lõi) 6,71', 16180000, 'Máy Tính', 'Laptop', 2, 2, 34, 'upload/1762776177706697.jpg', 'laptop-hp-15s-du3592tu', NULL, NULL),
(3, 'Apple MacBook Air (2020)', 'Apple MacBook Air (2020) M1 Chip, 13.3-inch, 8GB, 256GB SSD', 'Máy tính xách tay mỏng và nhẹ nhất của Apple, nay siêu mạnh mẽ với chip Apple M1. Xử lý công việc giúp bạn với CPU 8 lõi nhanh như chớp. Đưa các ứng dụng và game có đồ họa khủng lên một tầm cao mới với GPU 7 lõi. Đồng thời, tăng tốc các tác vụ máy học với Neural Engine 16 lõi. Tất cả gói gọn trong một thiết kế không quạt, giảm thiểu tiếng ồn, thời lượng pin dài nhất từ trước đến nay lên đến 18 giờ (1) MacBook Air. Vẫn cực kỳ cơ động. Mà mạnh mẽ hơn nhiều.', 20000000, 'Máy Tính', 'Laptop', 2, 2, 23, 'upload/1762776306252516.png', 'apple-macbook-air-(2020)', NULL, NULL),
(4, 'Tivi Xiaomi EA', 'Tivi Xiaomi EA Màn Hình 4K Android 43 55 65 75 inch', '- Xiaomi vừa ra mắt phiên bản MI TV EA 43″ với những công nghệ hoàn toàn mới\r\n- Sử dụng hoàn toàn thân viền bằng kim loại nguyên khối và siêu mỏng giúp trải nghiệm tuyệt vời hơn\r\n- Công nghệ hình ảnh được nâng cấp vượt trội để mang lại 1 trải nghiệm tuyệt vời hơn\r\n- Công nghệ AI trí tuệ nhân tạo thông minh giúp cho người dùng dễ dàng điều khiển MI TIVI EA 43″\r\n- Chất lượng âm thanh và cấu hình mạnh mẽ mang lại những trải nghiệm tuyệt vời khi chơi game và xem phim trên sản phẩm này\r\n- Kết nối với các thiết bị thông minh trong ngôi nhà của bạn, giờ đây bạn có thể biến ngôi nhà của mình thành một ngôi nhà thông minh, điều kiển qua Tivi hoặc Smartphone', 8000000, 'Thiết Bị Điện Tử', 'Tivi', 1, 5, 34, 'upload/1762778545660113.jpg', 'Tivi-Xiaomi-EA', NULL, '2023-04-10 01:50:24'),
(5, 'Smart Tivi QLED 4K Samsung', 'Smart Tivi QLED 4K Samsung Q63B 43/ 50/ 55/ 65 Inch - Hàng Chính Hãng', '- Smart Tivi QLED 4K  Samsung Q63B sở hữu thiết AirSlim thanh mảnh, cạnh viền bằng nhựa mỏng tạo cảm giác xem mở rộng, tránh sao nhãng khi xem tivi.\r\n\r\n- Smart tivi Samsung có kích thước màn hình 43 50 55 65 inch được nâng đỡ vững chắc bởi chân đế L ánh đen cuốn hút. Tivi là sự lựa chọn phù hợp với các không gian phòng khách, phòng ngủ, phòng họp,...\r\nCông nghệ hình ảnh\r\n- Công nghệ Quantum Dot hiển thị 100% dải màu, tivi hiển thị hình ảnh với độ nét cao, mang đến thế giới màu sắc chân thực, sống động.\r\n\r\n- Công nghệ đèn nền Dual LED tích hợp công nghệ Quantum HDR giúp nâng cao độ tương phản, màu sắc chính xác, tivi Samsung cho hình ảnh đẹp mắt với độ sáng cao.\r\n\r\n- Bộ xử lý Quantum 4K Lite nâng cấp chất lượng hình ảnh đầu vào lên gần chuẩn 4K, các cảnh phim, chương trình thể thao, ca nhạc,... được trình chiếu với chất lượng hoàn hảo.', 8490000, 'Thiết Bị Điện Tử', 'Tivi', 1, 5, 12, 'upload/1762778706548408.jpg', 'Smart-Tivi-QLED-4K-Samsung', NULL, NULL),
(6, 'Smart Tivi Samsung 4K UHD', 'Smart Tivi Samsung 4K UHD 65 Inch UA65AU7002KXXV', '- Smart Tivi Samsung 4K 65 inch UA65AU7002 tỏa sáng trong mọi căn phòng với thiết kế màn hình phẳng tinh giản, sang trọng, giúp tôn lên gu thẩm mỹ đẳng cấp của mọi gia chủ. \r\n- Kích thước màn hình 65 inch, lý tưởng để bố trí trong các căn phòng khách, phòng ngủ, văn phòng làm việc có diện tích vừa và lớn.\r\n- Có chân đế dạng chữ V úp ngược nâng tivi Samsung vững vàng khi lắp đặt kiểu để bàn. Nếu muốn tăng không gian trống trong phòng, bạn có thể loại bỏ chân đế và lắp kiểu treo tường.', 12390000, 'Thiết Bị Điện Tử', 'Tivi', 1, 5, 23, 'upload/1763022039462929.jpg', 'Smart-Tivi-Samsung-4K-UHD', NULL, NULL),
(7, 'Loa Karaoke Bluetooth Ngoài Trời', 'Loa Karaoke Bluetooth Ngoài Trời Hiệu Ứng LED ROBOT RB490 Kèm Micro Công Suất 20W Nghe Nhạc Cực Đỉnh', '- Loa công suất lớn 20W, sử dụng được ngoài trời, âm thanh mạnh mẽ, nghe nhạc cực đỉnh.\r\n- Công nghệ bluetooth 5.0 cho tốc độ truyền tải nhanh hơn, kết nối ổn định trong phạm vi 10m.\r\n- Được trang bị hệ thống LED RGB với hơn 16 triệu màu chuyển đổi theo nhịp nhạc, thắp sáng bữa tiệc âm nhạc hứng khởi và sôi động hơn bao giờ hết.\r\n- Loa đi kèm Micro Karaoke, hỗ trợ loại bỏ tiếng ca sĩ trong bài hát, tận hưởng các bài hát karaoke sôi động.\r\n- Dung lượng pin 3.000 mAh, thời gian sử dụng lên đến 6h, thời gian sạc pin 3h.\r\n- Các hình thức kết nối đa dạng, đáp ứng mọi nhu cầu nghe nhạc: Bluetooth, thẻ nhớ MicroSD, USB, AUX, nghe đài FM.\r\n- Thiết kế mạnh mẽ, có quai xách bằng da, dễ dàng di chuyển khi sử dụng ngoài trời.\r\n- Lưu ý: Microphone là phụ kiện đi kèm nên sẽ không được hỗ trợ bảo hành khi xảy ra hư hỏng.', 599000, 'Thiết Bị Điện Tử', 'Loa', 1, 6, 23, 'upload/1763022230592502.jpg', 'Loa-Karaoke-Bluetooth-Ngoài-Trời', NULL, NULL),
(8, 'Loa bluetooth Baseus', 'Loa bluetooth Baseus chống nước IPX6 âm thanh siêu trầm 20W', 'Thương hiệu: BASEUS\r\nPin: Có\r\nChất liệu vỏ: Nhựa\r\nChuyển đổi âm thanh: 2 chiều\r\nKết nối: AUX\r\nKết nối: bluetooth\r\nLoại loa: Di động\r\nNguồn điện: Pin\r\nSố lượng vỏ loa: 1\r\nKênh: 2 (2.0)\r\nCông suất đầu vào (W): <25 W\r\nTrợ lý cá nhân thông minh: Trợ lý google\r\nChất liệu loa: Khác\r\nBộ giải mã: AAC\r\nChức năng phát lại: mp3\r\nChức năng phát lại: FLAC\r\nChức năng phát lại: APE\r\nChức năng phát lại: WAV\r\nMàn hình hiển thị: Không\r\nChất liệu loa siêu trầm: Kim loại', 599000, 'Thiết Bị Điện Tử', 'Loa', 1, 6, 12, 'upload/1763022374550461.jpg', 'Loa-bluetooth-Baseus', NULL, NULL),
(9, 'Đồng Hồ Quartz', 'Đồng Hồ Quartz Ba Mắt Đa Năng Dây Thép Không Gỉ Thời Trang Thể Thao Cho Nam', 'Brand: WISHDOIT (official original)\r\n\r\n Chuyển động: Bộ chuyển động thạch anh\r\n\r\n Chất liệu vỏ: Thép không gỉ\r\n\r\n Dây đồng hồ: Dây đeo bằng thép không gỉ\r\n\r\n Chống nước: Chống nước 30-50 mét, có thể bơi lội)\r\n\r\n Gương đồng hồ: Kính cường lực khoáng cứng cáp\r\n\r\n Đường kính đồng hồ: 42mm\r\n\r\n Khối lượng đồng hồ: 123.5g\r\n\r\n Độ dày đồng hồ: 12mm\r\n\r\n Chiều dài đồng hồ: 24cm\r\n\r\n Chiều rộng dây đeo đồng hồ: 22mm', 475000, 'Đồng Hồ', 'Đồng Hồ Nam', 3, 7, 54, 'upload/1763022513545941.jpg', 'Đồng-Hồ-Quartz', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `display_name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'Admin', '2023-03-31 04:26:02', '2023-03-31 04:26:02'),
(2, 'user', 'User', 'User', '2023-03-31 04:26:02', '2023-03-31 04:26:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_user`
--

CREATE TABLE `role_user` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `user_type`) VALUES
(1, 4, 'App\\Models\\User'),
(2, 5, 'App\\Models\\User');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shipping_infos`
--

CREATE TABLE `shipping_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `shipping_infos`
--

INSERT INTO `shipping_infos` (`id`, `user_id`, `name`, `email`, `phone_number`, `address`, `created_at`, `updated_at`) VALUES
(7, 5, 'pham van chien', 'phamc1702@gmail.com', '0977362671', 'so 5 ngach 4 ngo 1', NULL, NULL),
(8, 5, 'pham van chien', 'phamc1702@gmail.com', '0977362671', 'so 5 ngach 4 ngo 1', NULL, NULL),
(9, 5, 'pham van chien', 'phamc1702@gmail.com', '0977362671', 'so 5 ngach 4 ngo 1', NULL, NULL),
(10, 5, 'pham van chien', 'phamc1702@gmail.com', '0977362671', 'so 5 ngach 4 ngo 1', NULL, NULL),
(11, 5, 'pham van chien', 'phamc1702@gmail.com', '0977362671', 'so 5 ngach 4 ngo 1', NULL, NULL),
(12, 5, 'pham van chien', 'phamc1702@gmail.com', '0977362671', 'so 5 ngach 4 ngo 1', NULL, NULL),
(13, 5, 'pham van chien', 'phamc1702@gmail.com', '0977362671', 'so 5 ngach 4 ngo 1', NULL, NULL),
(14, 5, 'pham van chien', 'phamc1702@gmail.com', '0977362671', 'so 5 ngach 4 ngo 1', NULL, NULL),
(15, 5, 'pham van chien', 'phamc1702@gmail.com', '0977362671', 'so 5 ngach 4 ngo 1', NULL, NULL),
(16, 5, 'pham van chien', 'phamc1702@gmail.com', '0977362671', 'so 5 ngach 4 ngo 1', NULL, NULL),
(17, 5, 'pham van chien', 'phamc1702@gmail.com', '0977362671', 'so 5 ngach 4 ngo 1', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_name` varchar(191) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `category_name` varchar(191) NOT NULL,
  `product_count` int(11) NOT NULL DEFAULT 0,
  `slug` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `subcategory_name`, `category_id`, `category_name`, `product_count`, `slug`, `created_at`, `updated_at`) VALUES
(2, 'Laptop', 2, 'Máy Tính', 3, 'laptop', NULL, '2023-04-10 01:14:49'),
(4, 'Máy Tính Bàn', 2, 'Máy Tính', 0, 'máy-tính-bàn', NULL, '2023-04-10 01:21:51'),
(5, 'Tivi', 1, 'Thiết Bị Điện Tử', 3, 'Tivi', NULL, '2023-04-12 18:20:38'),
(6, 'Loa', 1, 'Thiết Bị Điện Tử', 2, 'Loa', NULL, '2023-04-12 18:25:57'),
(7, 'Đồng Hồ Nam', 3, 'Đồng Hồ', 1, 'Đồng-Hồ-Nam', NULL, '2023-04-12 18:28:10'),
(8, 'Đồng Hồ Nữ', 3, 'Đồng Hồ', 0, 'Đồng-Hồ-Nữ', NULL, NULL),
(9, 'IPhone', 4, 'Điện Thoại', 0, 'IPhone', NULL, NULL),
(10, 'SamSung', 4, 'Điện Thoại', 0, 'SamSung', NULL, NULL),
(11, 'Oppo', 4, 'Điện Thoại', 0, 'Oppo', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'ad', 'admin@gmail.com', NULL, '$2y$10$QA7EnkL21rAjAXxTwcCkMuMk0xulHkZLE.Sa5gJNtsL7FujTxRMW.', NULL, '2023-03-31 04:26:51', '2023-03-31 04:26:51'),
(5, 'chien', 'admin1@gmail.com', NULL, '$2y$10$CQYtpf3bTEs1lZJ/.OfZv.IF6SPm7jsa1HoT0fh6plELjGEOfER7S', NULL, '2023-03-31 04:27:32', '2023-03-31 04:27:32');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Chỉ mục cho bảng `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Chỉ mục cho bảng `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `permission_user_permission_id_foreign` (`permission_id`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Chỉ mục cho bảng `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Chỉ mục cho bảng `shipping_infos`
--
ALTER TABLE `shipping_infos`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `shipping_infos`
--
ALTER TABLE `shipping_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
