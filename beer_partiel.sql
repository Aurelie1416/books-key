CREATE TABLE `admin_carts` (
  `id` int(11) NOT NULL , 
  `update_at` datetime NOT NULL DEFAULT current_timestamp(),
  `number_raw_materials` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `fk_quotations_id` int(11) DEFAULT NULL
);
INSERT INTO `admin_carts` (`id`, `update_at`, `number_raw_materials`, `total_price`, `fk_quotations_id`) VALUES
(1, '2022-06-09 11:14:30', 2, '99.99', 1);
ALTER TABLE `admin_carts`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_quotations_id` (`fk_quotations_id`);
ALTER TABLE `admin_carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `admin_cart_raw_material` (
  `fk_raw_materials_id` int(11) NOT NULL,
  `fk_admin_carts_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `price` decimal(10,2) NOT NULL
);
INSERT INTO `admin_cart_raw_material` (`fk_raw_materials_id`, `fk_admin_carts_id`, `quantity`, `price`) VALUES
(4, 1, '10.00', '49.99'),
(6, 1, '10.00', '50.00');
ALTER TABLE `admin_cart_raw_material`
  ADD KEY `fk_raw_materials_id` (`fk_raw_materials_id`),
  ADD KEY `fk_admin_carts_id` (`fk_admin_carts_id`);

CREATE TABLE `beers` (
  `id` int(11) NOT NULL , 
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price_liter` decimal(10,2) NOT NULL,
  `quantity_liter` decimal(10,2) NOT NULL,
  `date_tanking_at` datetime NOT NULL,
  `fk_beer_types_id` int(11) NOT NULL
);
INSERT INTO `beers` (`id`, `name`, `description`, `price_liter`, `quantity_liter`, `date_tanking_at`, `fk_beer_types_id`) VALUES
(1, 'Bière Chazotte', '', '15.49', '10.00', '2022-06-01 10:05:29', 2),
(2, 'Bière Gizelle', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sem nibh, dapibus elementum massa nec, tristique luctus leo. Praesent laoreet, tellus eu varius dictum, nulla quam dignissim nisi, sit amet dignissim justo dui feugiat massa. Donec et gravida nibh, ultricies rutrum sem. Aliquam lectus augue, sollicitudin cursus fermentum non, tristique nec nibh. Aliquam dignissim ligula et augue bibendum vehicula. Duis quis est bibendum mauris molestie tincidunt et a neque. Curabitur sit amet congue ante. Donec cursus felis vel diam varius, vel malesuada risus egestas. Sed sem enim, placerat id libero quis, tempus rhoncus est. Donec et maximus augue.', '15.49', '20.00', '2022-06-07 10:05:29', 1),
(3, 'Bière Julien', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sem nibh, dapibus elementum massa nec, tristique luctus leo. Praesent laoreet, tellus eu varius dictum, nulla quam dignissim nisi, sit amet dignissim justo dui feugiat massa. Donec et gravida nibh, ultricies rutrum sem. Aliquam lectus augue, sollicitudin cursus fermentum non, tristique nec nibh. Aliquam dignissim ligula et augue bibendum vehicula. Duis quis est bibendum mauris molestie tincidunt et a neque. Curabitur sit amet congue ante. Donec cursus felis vel diam varius, vel malesuada risus egestas. Sed sem enim, placerat id libero quis, tempus rhoncus est. Donec et maximus augue.', '15.49', '5.00', '2022-06-01 10:07:11', 2),
(4, 'Bière Test ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sem nibh, dapibus elementum massa nec, tristique luctus leo. Praesent laoreet, tellus eu varius dictum, nulla quam dignissim nisi, sit amet dignissim justo dui feugiat massa. Donec et gravida nibh, ultricies rutrum sem. Aliquam lectus augue, sollicitudin cursus fermentum non, tristique nec nibh. Aliquam dignissim ligula et augue bibendum vehicula. Duis quis est bibendum mauris molestie tincidunt et a neque. Curabitur sit amet congue ante. Donec cursus felis vel diam varius, vel malesuada risus egestas. Sed sem enim, placerat id libero quis, tempus rhoncus est. Donec et maximus augue.', '15.49', '20.00', '2022-06-04 10:07:52', 3);
ALTER TABLE `beers`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_beer_types_id` (`fk_beer_types_id`);
ALTER TABLE `beers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `beers_orders` (
  `id` int(11) NOT NULL , 
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `expedition_at` datetime DEFAULT NULL,
  `delivery_at` datetime DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `fk_order_status_id` int(11) NOT NULL,
  `fk_users_id` int(11) NOT NULL,
  `fk_shipping_methods_id` int(11) DEFAULT NULL,
  `fk_invoices_id` int(11) DEFAULT NULL
);
INSERT INTO `beers_orders` (`id`, `created_at`, `expedition_at`, `delivery_at`, `total_price`, `customer_email`, `fk_order_status_id`, `fk_users_id`, `fk_shipping_methods_id`, `fk_invoices_id`) VALUES
(1, '2022-06-10 11:10:02', NULL, NULL, '49.99', 'toto.brouette@gmail.com', 1, 3, 1, NULL),
(2, '2022-06-01 11:06:54', '2022-06-10 11:06:54', NULL, '49.99', 'jasper.brouette@gmail.com', 2, 4, 2, 2),
(3, '2022-06-02 11:09:19', '2022-06-07 11:09:19', '2022-06-10 11:09:19', '49.99', 'pepito.brouette@gmail.com', 3, 6, 3, 3);
ALTER TABLE `beers_orders`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_status_id` (`fk_order_status_id`),
  ADD KEY `fk_users_id` (`fk_users_id`),
  ADD KEY `fk_shipping_methods_id` (`fk_shipping_methods_id`),
  ADD KEY `fk_invoices_id` (`fk_invoices_id`);
ALTER TABLE `beers_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `beer_beers_order` (
  `fk_beers_orders_id` int(11) NOT NULL,
  `fk_beers_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity_liter` decimal(10,2) NOT NULL
);
INSERT INTO `beer_beers_order` (`fk_beers_orders_id`, `fk_beers_id`, `price`, `quantity_liter`) VALUES
(1, 1, '49.99', '40.00'),
(2, 2, '29.99', '20.00'),
(2, 3, '20.00', '20.00'),
(3, 4, '29.99', '20.00'),
(3, 3, '20.00', '20.00');
ALTER TABLE `beer_beers_order`
  ADD KEY `fk_beers_id` (`fk_beers_id`),
  ADD KEY `fk_beers_orders_id` (`fk_beers_orders_id`);

CREATE TABLE `beer_exchange` (
  `fk_exchanges_id` int(11) NOT NULL,
  `fk_beers_id` int(11) NOT NULL,
  `quantity_liter` decimal(10,2) NOT NULL
);
INSERT INTO `beer_exchange` (`fk_exchanges_id`, `fk_beers_id`, `quantity_liter`) VALUES
(1, 1, '10.00'),
(2, 2, '5.00'),
(2, 3, '5.00');
ALTER TABLE `beer_exchange`
  ADD KEY `fk_beers_id` (`fk_beers_id`),
  ADD KEY `fk_exchanges_id` (`fk_exchanges_id`);

CREATE TABLE `beer_raw_material` (
  `fk_beers_id` int(11) NOT NULL,
  `fk_raw_materials_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL
);
INSERT INTO `beer_raw_material` (`fk_beers_id`, `fk_raw_materials_id`, `quantity`) VALUES
(1, 2, '10.00'),
(1, 3, '10.00'),
(1, 5, '10.00'),
(1, 7, '10.00'),
(2, 1, '10.00'),
(2, 6, '10.00'),
(2, 4, '10.00'),
(2, 8, '10.00'),
(3, 1, '10.00'),
(3, 3, '10.00'),
(3, 5, '10.00'),
(3, 8, '10.00'),
(3, 9, '10.00'),
(4, 2, '10.00'),
(4, 6, '10.00'),
(4, 7, '10.00'),
(4, 4, '10.00'),
(4, 9, '10.00');
ALTER TABLE `beer_raw_material`
  ADD KEY `fk_beers_id` (`fk_beers_id`),
  ADD KEY `fk_raw_materials_id` (`fk_raw_materials_id`);

CREATE TABLE `beer_types` (
  `id` int(11) NOT NULL , 
  `type` varchar(75) NOT NULL,
  `description` text NOT NULL
);
INSERT INTO `beer_types` (`id`, `type`, `description`) VALUES
(1, 'Blonde', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sem nibh, dapibus elementum massa nec, tristique luctus leo. Praesent laoreet, tellus eu varius dictum, nulla quam dignissim nisi, sit amet dignissim justo dui feugiat massa. Donec et gravida nibh, ultricies rutrum sem. Aliquam lectus augue, sollicitudin cursus fermentum non, tristique nec nibh. Aliquam dignissim ligula et augue bibendum vehicula. Duis quis est bibendum mauris molestie tincidunt et a neque. Curabitur sit amet congue ante. Donec cursus felis vel diam varius, vel malesuada risus egestas. Sed sem enim, placerat id libero quis, tempus rhoncus est. Donec et maximus augue.'),
(2, 'Brune', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sem nibh, dapibus elementum massa nec, tristique luctus leo. Praesent laoreet, tellus eu varius dictum, nulla quam dignissim nisi, sit amet dignissim justo dui feugiat massa. Donec et gravida nibh, ultricies rutrum sem. Aliquam lectus augue, sollicitudin cursus fermentum non, tristique nec nibh. Aliquam dignissim ligula et augue bibendum vehicula. Duis quis est bibendum mauris molestie tincidunt et a neque. Curabitur sit amet congue ante. Donec cursus felis vel diam varius, vel malesuada risus egestas. Sed sem enim, placerat id libero quis, tempus rhoncus est. Donec et maximus augue.'),
(3, 'Ambrée', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sem nibh, dapibus elementum massa nec, tristique luctus leo. Praesent laoreet, tellus eu varius dictum, nulla quam dignissim nisi, sit amet dignissim justo dui feugiat massa. Donec et gravida nibh, ultricies rutrum sem. Aliquam lectus augue, sollicitudin cursus fermentum non, tristique nec nibh. Aliquam dignissim ligula et augue bibendum vehicula. Duis quis est bibendum mauris molestie tincidunt et a neque. Curabitur sit amet congue ante. Donec cursus felis vel diam varius, vel malesuada risus egestas. Sed sem enim, placerat id libero quis, tempus rhoncus est. Donec et maximus augue.');
ALTER TABLE `beer_types`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `beer_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `beer_user` (
  `fk_users_id` int(11) NOT NULL,
  `fk_beers_id` int(11) NOT NULL
);
INSERT INTO `beer_user` (`fk_users_id`, `fk_beers_id`) VALUES
(6, 2),
(4, 4),
(4, 3);
ALTER TABLE `beer_user`
  ADD KEY `fk_beers_id` (`fk_beers_id`),
  ADD KEY `fk_users_id` (`fk_users_id`);

CREATE TABLE `beer_user_cart` (
  `fk_beers_id` int(11) NOT NULL,
  `fk_user_carts_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `price` decimal(10,2) NOT NULL
);
INSERT INTO `beer_user_cart` (`fk_beers_id`, `fk_user_carts_id`, `quantity`, `price`) VALUES
(1, 1, '20.00', '49.99'),
(2, 2, '10.00', '29.99'),
(3, 2, '10.00', '20.00'),
(4, 3, '20.00', '49.99');
ALTER TABLE `beer_user_cart`
  ADD KEY `fk_beers_id` (`fk_beers_id`),
  ADD KEY `fk_user_carts_id` (`fk_user_carts_id`);


CREATE TABLE `exchanges` (
  `id` int(11) NOT NULL , 
  `exchanged_at` date NOT NULL,
  `returned_at` date DEFAULT NULL,
  `quantity_gram_hop_exhanged` decimal(10,2) NOT NULL,
  `fk_users_id` int(11) DEFAULT NULL
);
INSERT INTO `exchanges` (`id`, `exchanged_at`, `returned_at`, `quantity_gram_hop_exhanged`, `fk_users_id`) VALUES
(1, '2022-06-03', NULL, '20.00', 5),
(2, '2022-06-01', '2022-06-10', '20.00', 3);
ALTER TABLE `exchanges`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_id` (`fk_users_id`);
ALTER TABLE `exchanges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `exchange_raw_material` (
  `fk_exchanges_id` int(11) NOT NULL,
  `fk_raw_materials_id` int(11) NOT NULL,
  `quantity_gram_raw-material` decimal(10,2) NOT NULL
);
INSERT INTO `exchange_raw_material` (`fk_exchanges_id`, `fk_raw_materials_id`, `quantity_gram_raw-material`) VALUES
(1, 5, '10.00'),
(1, 6, '10.00'),
(2, 5, '20.00');
ALTER TABLE `exchange_raw_material`
  ADD KEY `fk_exchanges_id` (`fk_exchanges_id`),
  ADD KEY `fk_raw_materials_id` (`fk_raw_materials_id`);

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL , 
  `customer_name` varchar(255) NOT NULL,
  `seller_name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `total_price` decimal(10,2) NOT NULL
);
INSERT INTO `invoices` (`id`, `customer_name`, `seller_name`, `created_at`, `total_price`) VALUES
(1, 'Micro Brewery Chazotte-Brouette', 'Brouette inc', '2022-06-10 10:37:08', '99.99'),
(2, 'Jasper Brouette', 'Micro Brewery Chazotte-Brouette', '2022-06-10 10:37:08', '49.99'),
(3, 'Pépito Brouette', 'Micro Brewery Chazotte-Brouette', '2022-06-10 10:38:00', '49.99');
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `messages` (
  `id` int(11) NOT NULL , 
  `message` text NOT NULL,
  `written_at` datetime NOT NULL DEFAULT current_timestamp(),
  `resolve_at` datetime DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `firsy_name` varchar(50) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `fk_users_id` int(11) DEFAULT NULL,
  `fk_message_status_id` int(11) NOT NULL
);
INSERT INTO `messages` (`id`, `message`, `written_at`, `resolve_at`, `last_name`, `firsy_name`, `phone`, `email`, `fk_users_id`, `fk_message_status_id`) VALUES
(1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vestibulum auctor metus, in bibendum nisl facilisis et. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras mollis enim turpis, eleifend convallis massa laoreet eget. Ut sagittis tincidunt odio, sit amet bibendum diam elementum a. Nam dui sapien, pharetra ut nulla eu, ornare auctor mi. Integer ac tortor quis erat posuere mattis vitae in urna. In ornare erat et bibendum porta. Morbi tincidunt turpis ut turpis mollis auctor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas posuere gravida libero ac tempor. Morbi quis lorem quis neque scelerisque pharetra nec vel enim. Aliquam tincidunt vehicula justo non tempor. Cras vulputate elit felis, sit amet congue felis ultricies eget.', '2022-06-10 10:49:34', NULL, 'Brouette', 'Toto', '0601010101', 'toto.brouette@gmail.com', 3, 1),
(2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vestibulum auctor metus, in bibendum nisl facilisis et. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras mollis enim turpis, eleifend convallis massa laoreet eget. Ut sagittis tincidunt odio, sit amet bibendum diam elementum a. Nam dui sapien, pharetra ut nulla eu, ornare auctor mi. Integer ac tortor quis erat posuere mattis vitae in urna. In ornare erat et bibendum porta. Morbi tincidunt turpis ut turpis mollis auctor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas posuere gravida libero ac tempor. Morbi quis lorem quis neque scelerisque pharetra nec vel enim. Aliquam tincidunt vehicula justo non tempor. Cras vulputate elit felis, sit amet congue felis ultricies eget.', '2022-06-01 10:47:32', '2022-06-09 10:47:32', 'Test', NULL, '0602020202', 'test.test@gmail.com', NULL, 3),
(3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vestibulum auctor metus, in bibendum nisl facilisis et. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras mollis enim turpis, eleifend convallis massa laoreet eget. Ut sagittis tincidunt odio, sit amet bibendum diam elementum a. Nam dui sapien, pharetra ut nulla eu, ornare auctor mi. Integer ac tortor quis erat posuere mattis vitae in urna. In ornare erat et bibendum porta. Morbi tincidunt turpis ut turpis mollis auctor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas posuere gravida libero ac tempor. Morbi quis lorem quis neque scelerisque pharetra nec vel enim. Aliquam tincidunt vehicula justo non tempor. Cras vulputate elit felis, sit amet congue felis ultricies eget.', '2022-06-08 10:48:55', NULL, 'Test', 'Test', '', 'test.test@gmail.com', NULL, 2);
ALTER TABLE `messages`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_id` (`fk_users_id`),
  ADD KEY `fk_message_status_id` (`fk_message_status_id`);
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL , 
  `statu` varchar(50) NOT NULL
);
INSERT INTO `order_status` (`id`, `statu`) VALUES
(1, 'En cours de préparation'),
(2, 'En cours d\'expédition'),
(3, 'Livré'),
(4, 'Annulé'),
(5, 'Remboursé');
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `message_status` (
  `int` int(11) NOT NULL,
  `statu` varchar(75) NOT NULL
);
INSERT INTO `message_status` (`int`, `statu`) VALUES
(1, 'Nouveau'),
(2, 'En cours de traitement'),
(3, 'Clôturer');
ALTER TABLE `message_status`
  ADD PRIMARY KEY (`int`);
ALTER TABLE `message_status`
  MODIFY `int` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `quotations` (
  `id` int(11) NOT NULL , 
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `customer_name` varchar(75) NOT NULL,
  `seller_name` varchar(75) NOT NULL,
  `total_price` decimal(10,2) NOT NULL
);
INSERT INTO `quotations` (`id`, `created_at`, `customer_name`, `seller_name`, `total_price`) VALUES
(1, '2022-06-10 09:53:06', 'Micro Brewery Chazotte-Brouette', 'Brouette Inc', '99.99'),
(2, '2022-06-10 09:53:06', 'Pepito Brouette', 'Micro Brewery Chazotte-Brouette', '49.99'),
(3, '2022-06-10 09:53:06', 'Jasper Brouette', 'Micro Brewery Chazotte-Brouette', '49.99');
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `quotations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `raw_materials` (
  `id` int(11) NOT NULL , 
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `fk_raw_material_types_id` int(11) NOT NULL
);
INSERT INTO `raw_materials` (`id`, `name`, `description`, `quantity`, `price`, `fk_raw_material_types_id`) VALUES
(1, 'Eau Brouette', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vestibulum auctor metus, in bibendum nisl facilisis et. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras mollis enim turpis, eleifend convallis massa laoreet eget. Ut sagittis tincidunt odio, sit amet bibendum diam elementum a. Nam dui sapien, pharetra ut nulla eu, ornare auctor mi. Integer ac tortor quis erat posuere mattis vitae in urna. In ornare erat et bibendum porta. Morbi tincidunt turpis ut turpis mollis auctor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas posuere gravida libero ac tempor. Morbi quis lorem quis neque scelerisque pharetra nec vel enim. Aliquam tincidunt vehicula justo non tempor. Cras vulputate elit felis, sit amet congue felis ultricies eget.', '50.00', '10.50', 1),
(2, 'Eau Chazottes', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vestibulum auctor metus, in bibendum nisl facilisis et. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras mollis enim turpis, eleifend convallis massa laoreet eget. Ut sagittis tincidunt odio, sit amet bibendum diam elementum a. Nam dui sapien, pharetra ut nulla eu, ornare auctor mi. Integer ac tortor quis erat posuere mattis vitae in urna. In ornare erat et bibendum porta. Morbi tincidunt turpis ut turpis mollis auctor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas posuere gravida libero ac tempor. Morbi quis lorem quis neque scelerisque pharetra nec vel enim. Aliquam tincidunt vehicula justo non tempor. Cras vulputate elit felis, sit amet congue felis ultricies eget.', '50.00', '10.50', 1),
(3, 'Malt Chazottes', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vestibulum auctor metus, in bibendum nisl facilisis et. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras mollis enim turpis, eleifend convallis massa laoreet eget. Ut sagittis tincidunt odio, sit amet bibendum diam elementum a. Nam dui sapien, pharetra ut nulla eu, ornare auctor mi. Integer ac tortor quis erat posuere mattis vitae in urna. In ornare erat et bibendum porta. Morbi tincidunt turpis ut turpis mollis auctor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas posuere gravida libero ac tempor. Morbi quis lorem quis neque scelerisque pharetra nec vel enim. Aliquam tincidunt vehicula justo non tempor. Cras vulputate elit felis, sit amet congue felis ultricies eget.', '100.00', '20.50', 2),
(4, 'Malt Brouette', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vestibulum auctor metus, in bibendum nisl facilisis et. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras mollis enim turpis, eleifend convallis massa laoreet eget. Ut sagittis tincidunt odio, sit amet bibendum diam elementum a. Nam dui sapien, pharetra ut nulla eu, ornare auctor mi. Integer ac tortor quis erat posuere mattis vitae in urna. In ornare erat et bibendum porta. Morbi tincidunt turpis ut turpis mollis auctor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas posuere gravida libero ac tempor. Morbi quis lorem quis neque scelerisque pharetra nec vel enim. Aliquam tincidunt vehicula justo non tempor. Cras vulputate elit felis, sit amet congue felis ultricies eget.', '100.00', '20.50', 2),
(5, 'Houblon Chazottes', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vestibulum auctor metus, in bibendum nisl facilisis et. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras mollis enim turpis, eleifend convallis massa laoreet eget. Ut sagittis tincidunt odio, sit amet bibendum diam elementum a. Nam dui sapien, pharetra ut nulla eu, ornare auctor mi. Integer ac tortor quis erat posuere mattis vitae in urna. In ornare erat et bibendum porta. Morbi tincidunt turpis ut turpis mollis auctor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas posuere gravida libero ac tempor. Morbi quis lorem quis neque scelerisque pharetra nec vel enim. Aliquam tincidunt vehicula justo non tempor. Cras vulputate elit felis, sit amet congue felis ultricies eget.', '100.00', '20.50', 4),
(6, 'Houblon Brouette', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vestibulum auctor metus, in bibendum nisl facilisis et. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras mollis enim turpis, eleifend convallis massa laoreet eget. Ut sagittis tincidunt odio, sit amet bibendum diam elementum a. Nam dui sapien, pharetra ut nulla eu, ornare auctor mi. Integer ac tortor quis erat posuere mattis vitae in urna. In ornare erat et bibendum porta. Morbi tincidunt turpis ut turpis mollis auctor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas posuere gravida libero ac tempor. Morbi quis lorem quis neque scelerisque pharetra nec vel enim. Aliquam tincidunt vehicula justo non tempor. Cras vulputate elit felis, sit amet congue felis ultricies eget.', '100.00', '20.50', 4),
(7, 'Levure Chazottes', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vestibulum auctor metus, in bibendum nisl facilisis et. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras mollis enim turpis, eleifend convallis massa laoreet eget. Ut sagittis tincidunt odio, sit amet bibendum diam elementum a. Nam dui sapien, pharetra ut nulla eu, ornare auctor mi. Integer ac tortor quis erat posuere mattis vitae in urna. In ornare erat et bibendum porta. Morbi tincidunt turpis ut turpis mollis auctor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas posuere gravida libero ac tempor. Morbi quis lorem quis neque scelerisque pharetra nec vel enim. Aliquam tincidunt vehicula justo non tempor. Cras vulputate elit felis, sit amet congue felis ultricies eget.', '100.00', '10.50', 3),
(8, 'Levure Brouette', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vestibulum auctor metus, in bibendum nisl facilisis et. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras mollis enim turpis, eleifend convallis massa laoreet eget. Ut sagittis tincidunt odio, sit amet bibendum diam elementum a. Nam dui sapien, pharetra ut nulla eu, ornare auctor mi. Integer ac tortor quis erat posuere mattis vitae in urna. In ornare erat et bibendum porta. Morbi tincidunt turpis ut turpis mollis auctor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas posuere gravida libero ac tempor. Morbi quis lorem quis neque scelerisque pharetra nec vel enim. Aliquam tincidunt vehicula justo non tempor. Cras vulputate elit felis, sit amet congue felis ultricies eget.', '100.00', '10.50', 3),
(9, 'Siros Brouette', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vestibulum auctor metus, in bibendum nisl facilisis et. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras mollis enim turpis, eleifend convallis massa laoreet eget. Ut sagittis tincidunt odio, sit amet bibendum diam elementum a. Nam dui sapien, pharetra ut nulla eu, ornare auctor mi. Integer ac tortor quis erat posuere mattis vitae in urna. In ornare erat et bibendum porta. Morbi tincidunt turpis ut turpis mollis auctor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas posuere gravida libero ac tempor. Morbi quis lorem quis neque scelerisque pharetra nec vel enim. Aliquam tincidunt vehicula justo non tempor. Cras vulputate elit felis, sit amet congue felis ultricies eget.', '100.00', '15.50', 5);
ALTER TABLE `raw_materials`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_raw_material_types_id` (`fk_raw_material_types_id`);
ALTER TABLE `raw_materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `raw_materials_orders` (
  `id` int(11) NOT NULL , 
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `expedition_at` datetime DEFAULT NULL,
  `delivery_at` date DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `fk_order_status_id` int(11) NOT NULL,
  `fk_invoices_id` int(11) DEFAULT NULL,
  `fk_vendors_id` int(11) NOT NULL
);
INSERT INTO `raw_materials_orders` (`id`, `created_at`, `expedition_at`, `delivery_at`, `total_price`, `fk_order_status_id`, `fk_invoices_id`, `fk_vendors_id`) VALUES
(1, '2022-06-02 10:40:55', '2022-06-09 10:40:55', '2022-06-10', '99.99', 3, 1, 1),
(2, '2022-06-10 10:43:04', NULL, NULL, '99.99', 1, NULL, 2);
ALTER TABLE `raw_materials_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_status_id` (`fk_order_status_id`),
  ADD KEY `fk_invoices_id` (`fk_invoices_id`),
  ADD KEY `fk_vendors_id` (`fk_vendors_id`);
ALTER TABLE `raw_materials_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `raw_material_types` (
  `id` int(11) NOT NULL , 
  `type` varchar(50) NOT NULL,
  `description` text NOT NULL
);
INSERT INTO `raw_material_types` (`id`, `type`, `description`) VALUES
(1, 'Eau', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vestibulum auctor metus, in bibendum nisl facilisis et. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras mollis enim turpis, eleifend convallis massa laoreet eget. Ut sagittis tincidunt odio, sit amet bibendum diam elementum a. Nam dui sapien, pharetra ut nulla eu, ornare auctor mi. Integer ac tortor quis erat posuere mattis vitae in urna. In ornare erat et bibendum porta. Morbi tincidunt turpis ut turpis mollis auctor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas posuere gravida libero ac tempor. Morbi quis lorem quis neque scelerisque pharetra nec vel enim. Aliquam tincidunt vehicula justo non tempor. Cras vulputate elit felis, sit amet congue felis ultricies eget.'),
(2, 'Malt', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vestibulum auctor metus, in bibendum nisl facilisis et. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras mollis enim turpis, eleifend convallis massa laoreet eget. Ut sagittis tincidunt odio, sit amet bibendum diam elementum a. Nam dui sapien, pharetra ut nulla eu, ornare auctor mi. Integer ac tortor quis erat posuere mattis vitae in urna. In ornare erat et bibendum porta. Morbi tincidunt turpis ut turpis mollis auctor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas posuere gravida libero ac tempor. Morbi quis lorem quis neque scelerisque pharetra nec vel enim. Aliquam tincidunt vehicula justo non tempor. Cras vulputate elit felis, sit amet congue felis ultricies eget.'),
(3, 'Levure', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vestibulum auctor metus, in bibendum nisl facilisis et. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras mollis enim turpis, eleifend convallis massa laoreet eget. Ut sagittis tincidunt odio, sit amet bibendum diam elementum a. Nam dui sapien, pharetra ut nulla eu, ornare auctor mi. Integer ac tortor quis erat posuere mattis vitae in urna. In ornare erat et bibendum porta. Morbi tincidunt turpis ut turpis mollis auctor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas posuere gravida libero ac tempor. Morbi quis lorem quis neque scelerisque pharetra nec vel enim. Aliquam tincidunt vehicula justo non tempor. Cras vulputate elit felis, sit amet congue felis ultricies eget.'),
(4, 'Houblon', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vestibulum auctor metus, in bibendum nisl facilisis et. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras mollis enim turpis, eleifend convallis massa laoreet eget. Ut sagittis tincidunt odio, sit amet bibendum diam elementum a. Nam dui sapien, pharetra ut nulla eu, ornare auctor mi. Integer ac tortor quis erat posuere mattis vitae in urna. In ornare erat et bibendum porta. Morbi tincidunt turpis ut turpis mollis auctor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas posuere gravida libero ac tempor. Morbi quis lorem quis neque scelerisque pharetra nec vel enim. Aliquam tincidunt vehicula justo non tempor. Cras vulputate elit felis, sit amet congue felis ultricies eget.'),
(5, 'Siros', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vestibulum auctor metus, in bibendum nisl facilisis et. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras mollis enim turpis, eleifend convallis massa laoreet eget. Ut sagittis tincidunt odio, sit amet bibendum diam elementum a. Nam dui sapien, pharetra ut nulla eu, ornare auctor mi. Integer ac tortor quis erat posuere mattis vitae in urna. In ornare erat et bibendum porta. Morbi tincidunt turpis ut turpis mollis auctor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas posuere gravida libero ac tempor. Morbi quis lorem quis neque scelerisque pharetra nec vel enim. Aliquam tincidunt vehicula justo non tempor. Cras vulputate elit felis, sit amet congue felis ultricies eget.');
ALTER TABLE `raw_material_types`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `raw_material_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `raw_material_raw_materials_order` (
  `fk_raw_materials_orders_id` int(11) NOT NULL,
  `fk_raw_materials_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` decimal(10,2) NOT NULL
);
INSERT INTO `raw_material_raw_materials_order` (`fk_raw_materials_orders_id`, `fk_raw_materials_id`, `price`, `quantity`) VALUES
(1, 4, '49.99', '10.00'),
(1, 9, '50.00', '20.00'),
(2, 7, '99.99', '50.00');
ALTER TABLE `raw_material_raw_materials_order`
  ADD KEY `fk_raw_materials_id` (`fk_raw_materials_id`),
  ADD KEY `fk_raw_materials_orders_id` (`fk_raw_materials_orders_id`);

CREATE TABLE `raw_material_vendor` (
  `fk_raw_materials_id` int(11) NOT NULL,
  `fk_vendors_id` int(11) NOT NULL
);
INSERT INTO `raw_material_vendor` (`fk_raw_materials_id`, `fk_vendors_id`) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 1),
(5, 2),
(6, 1),
(7, 2),
(8, 1),
(9, 1),
(9, 2);
ALTER TABLE `raw_material_vendor`
  ADD KEY `fk_raw_materials_id` (`fk_raw_materials_id`),
  ADD KEY `fk_vendors_id` (`fk_vendors_id`);

CREATE TABLE `recipe_steps` (
  `id` int(11) NOT NULL , 
  `step` text NOT NULL,
  `nulber_step` int(11) NOT NULL,
  `fk_beers_id` int(11) NOT NULL
);
INSERT INTO `recipe_steps` (`id`, `step`, `nulber_step`, `fk_beers_id`) VALUES
(1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed.', 1, 1),
(2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed.', 2, 1),
(3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed.', 3, 1),
(4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed.', 4, 1),
(5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed.', 5, 1),
(6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed.', 1, 2),
(7, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed.', 2, 2),
(8, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed.', 3, 2),
(9, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed.', 4, 2),
(10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed.', 1, 3),
(11, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed.', 2, 3),
(12, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed.', 3, 3),
(13, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed.', 4, 3),
(14, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed.', 5, 3),
(15, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed.', 1, 4),
(16, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed.', 2, 4),
(17, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed.', 3, 4),
(18, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed.', 4, 4),
(19, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed.', 5, 4);
ALTER TABLE `recipe_steps`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_beers_id` (`fk_beers_id`);
ALTER TABLE `recipe_steps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `shipping_methods` (
  `id` int(11) NOT NULL , 
  `shipping_method` varchar(75) NOT NULL,
  `price` decimal(10,2) NOT NULL
);
INSERT INTO `shipping_methods` (`id`, `shipping_method`, `price`) VALUES
(1, 'Livraison à Domicile', '4.99'),
(2, 'Livraison point relais', '3.99'),
(3, 'Livraison sur place', '0.00');
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `shipping_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `stages` (
  `id` int(11) NOT NULL , 
  `date_at` date NOT NULL,
  `number_place` int(11) NOT NULL,
  `number_intern_registered` int(11) NOT NULL DEFAULT 0,
  `presentation` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `country` varchar(75) NOT NULL,
  `city` varchar(75) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `street` varchar(255) NOT NULL,
  `street_bis` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
);
INSERT INTO `stages` (`id`, `date_at`, `number_place`, `number_intern_registered`, `presentation`, `email`, `country`, `city`, `postal_code`, `street`, `street_bis`, `price`) VALUES
(1, '2022-06-10', 10, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sem nibh, dapibus elementum massa nec, tristique luctus leo. Praesent laoreet, tellus eu varius dictum, nulla quam dignissim nisi, sit amet dignissim justo dui feugiat massa. Donec et gravida nibh, ultricies rutrum sem. Aliquam lectus augue, sollicitudin cursus fermentum non, tristique nec nibh. Aliquam dignissim ligula et augue bibendum vehicula. Duis quis est bibendum mauris molestie tincidunt et a neque. Curabitur sit amet congue ante. Donec cursus felis vel diam varius, vel malesuada risus egestas. Sed sem enim, placerat id libero quis, tempus rhoncus est. Donec et maximus augue.', 'thibault.chazotte@gmail.com', 'France', 'Brouette City', '12000', '1 avenue de la Brouette', 'Dans le placard, sous l\'escalier', '69.99'),
(2, '2022-06-25', 10, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sem nibh, dapibus elementum massa nec, tristique luctus leo. Praesent laoreet, tellus eu varius dictum, nulla quam dignissim nisi, sit amet dignissim justo dui feugiat massa. Donec et gravida nibh, ultricies rutrum sem. Aliquam lectus augue, sollicitudin cursus fermentum non, tristique nec nibh. Aliquam dignissim ligula et augue bibendum vehicula. Duis quis est bibendum mauris molestie tincidunt et a neque. Curabitur sit amet congue ante. Donec cursus felis vel diam varius, vel malesuada risus egestas. Sed sem enim, placerat id libero quis, tempus rhoncus est. Donec et maximus augue.', 'thibault.chazotte@gmail.com', 'France', 'Brouette City', '', '1 avenue de la Brouette', 'Dans le placard, sous l\'escalier', '69.99');
ALTER TABLE `stages`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `stages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `stage_user` (
  `fk_users_id` int(11) NOT NULL,
  `fk_stages_id` int(11) NOT NULL
);
INSERT INTO `stage_user` (`fk_users_id`, `fk_stages_id`) VALUES
(3, 1),
(4, 1),
(5, 1),
(6, 1);
ALTER TABLE `stage_user`
  ADD KEY `fk_users_id` (`fk_users_id`),
  ADD KEY `fk_stages_id` (`fk_stages_id`);

CREATE TABLE `users` (
  `id` int(11) NOT NULL , 
  `first_name` varchar(75) NOT NULL,
  `last_name` varchar(75) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subscription_at` datetime NOT NULL,
  `role` longtext NOT NULL DEFAULT '\'USER\''
);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `password`, `email`, `subscription_at`, `role`) VALUES
(1, 'Thibault ', 'Chazottes', 'Test123', 'thibault.chazotte@gmail.com', '2022-06-10 09:18:53', 'ADMIN'),
(2, 'Giselle', 'Brouette', 'Test123', 'giselle.brouette@gmail.com', '2022-06-10 09:18:53', 'ADMIN'),
(3, 'Toto', 'Brouette', 'Test123', 'toto.brouette@gmail.com', '2022-06-10 09:25:09', 'USER'),
(4, 'Jasper', 'Brouette', 'Test123', 'jasper.brouette@gmail.com', '0000-00-00 00:00:00', 'USER'),
(5, 'Prosper', 'Brouette', 'Test123', 'prosper.brouette@gmail.com', '2022-06-10 09:25:09', 'USER'),
(6, 'Pépito', 'Brouette', 'Test123', 'pepito.brouette@gmail.com', '2022-06-10 09:25:09', 'USER');
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `user_addresses` (
  `id` int(11) NOT NULL , 
  `country` varchar(75) NOT NULL,
  `city` varchar(75) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `street` varchar(255) NOT NULL,
  `street_bis` varchar(255) DEFAULT NULL,
  `fk_users_id` int(11) NOT NULL
);
INSERT INTO `user_addresses` (`id`, `country`, `city`, `postal_code`, `street`, `street_bis`, `fk_users_id`) VALUES
(1, 'France', 'Brouette City', '12000', '1 avenue de la Brouette', 'Dans le placard, sous l\'escalier', 1),
(2, 'France', 'Brouette City', '12000', '2 avenue de la Brouette', NULL, 2),
(3, 'France', 'Brouette City', '12000', '3 avenue de la Brouette', 'Dans le placard, sous l\'escalier', 4),
(4, 'France', 'Brouette City', '12000', '4 avenue de la Brouette', NULL, 4),
(5, 'France', 'Brouette City', '12000', '5 avenue de la Brouette', 'Dans le placard, sous l\'escalier', 5),
(6, 'France', 'Brouette City', '12000', '6 avenue de la Brouette', NULL, 6);
ALTER TABLE `user_addresses`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_id` (`fk_users_id`);
ALTER TABLE `user_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `user_carts` (
  `id` int(11) NOT NULL , 
  `update_at` datetime NOT NULL DEFAULT current_timestamp(),
  `beers_quantity` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `fk_users_id` int(11) NOT NULL,
  `fk_quotations_id` int(11) DEFAULT NULL
);
INSERT INTO `user_carts` (`id`, `update_at`, `beers_quantity`, `total_price`, `fk_users_id`, `fk_quotations_id`) VALUES
(1, '2022-06-10 09:59:47', 1, '49.99', 4, 3),
(2, '2022-06-10 09:59:47', 2, '69.99', 5, NULL),
(3, '2022-06-10 09:59:47', 1, '49.99', 6, 2);
ALTER TABLE `user_carts`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_id` (`fk_users_id`),
  ADD KEY `fk_quotations_id` (`fk_quotations_id`);
ALTER TABLE `user_carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `tanks` (
  `id` int(11) NOT NULL , 
  `start_vating_at` datetime NOT NULL,
  `end_vating_at` datetime NOT NULL,
  `fk_beers_id` int(11) NOT NULL,
  `number_tanks` int(11) NOT NULL
);
INSERT INTO `tanks` (`id`, `start_vating_at`, `end_vating_at`, `fk_beers_id`, `number_tanks`) VALUES
(1, '2022-06-01 10:05:29', '2022-06-10 10:10:03', 1, 1),
(2, '2022-06-07 10:05:29', '2022-06-10 10:10:03', 2, 2),
(3, '2022-06-01 10:07:11', '2022-06-16 10:11:15', 3, 0),
(4, '2022-06-04 10:07:52', '2022-06-18 10:11:59', 4, 4);
ALTER TABLE `tanks`
    ADD PRIMARY KEY (`id`),
  ADD KEY `fk_beers_id` (`fk_beers_id`);
ALTER TABLE `tanks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `vendors` (
  `id` int(11) NOT NULL , 
  `name` varchar(100) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `email` varchar(255) NOT NULL
);
INSERT INTO `vendors` (`id`, `name`, `phone`, `email`) VALUES
(1, 'Brouette inc', '0601010101', 'brouette.corporation@gmail.com'),
(2, 'Beer Fournisseur', '0602020202', 'beer.fournisseur@gmail.com');
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `admin_carts`
  ADD CONSTRAINT `fk_admin_carts_quotation_id` FOREIGN KEY (`fk_quotations_id`) REFERENCES `quotations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `admin_cart_raw_material`
  ADD CONSTRAINT `fk_admin_cart_raw_material_raw_materials_id` FOREIGN KEY (`fk_raw_materials_id`) REFERENCES `raw_materials` (`id`),
  ADD CONSTRAINT `fk_admin_cart_raw_material_admin_carts_id` FOREIGN KEY (`fk_admin_carts_id`) REFERENCES `admin_carts` (`id`);

ALTER TABLE `beers`
  ADD CONSTRAINT `fk_beers_beer_types_id` FOREIGN KEY (`fk_beer_types_id`) REFERENCES `beer_types` (`id`);

ALTER TABLE `beers_orders`
  ADD CONSTRAINT `fk_beers_orders_invoices_id` FOREIGN KEY (`fk_invoices_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `fk_beers_orders_users_id` FOREIGN KEY (`fk_users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_beers_orders_order_status_id` FOREIGN KEY (`fk_order_status_id`) REFERENCES `order_status` (`id`),
  ADD CONSTRAINT `fk_beers_orders_shipping_methods_id` FOREIGN KEY (`fk_shipping_methods_id`) REFERENCES `shipping_methods` (`id`);

ALTER TABLE `beer_beers_order`
  ADD CONSTRAINT `fk_beer_beers_order_beers_orders_id` FOREIGN KEY (`fk_beers_orders_id`) REFERENCES `beers_orders` (`id`),
  ADD CONSTRAINT `fk_beer_beers_order_beers_id` FOREIGN KEY (`fk_beers_id`) REFERENCES `beers` (`id`);

ALTER TABLE `beer_exchange`
  ADD CONSTRAINT `fk_beer_exchange_exchanges_id` FOREIGN KEY (`fk_exchanges_id`) REFERENCES `exchanges` (`id`),
  ADD CONSTRAINT `fk_beer_exchange_beers_id` FOREIGN KEY (`fk_beers_id`) REFERENCES `beers` (`id`);

ALTER TABLE `beer_raw_material`
  ADD CONSTRAINT `fk_beer_raw_material_raw_materials_id` FOREIGN KEY (`fk_raw_materials_id`) REFERENCES `raw_materials` (`id`),
  ADD CONSTRAINT `fk_beer_raw_material_beers_id` FOREIGN KEY (`fk_beers_id`) REFERENCES `beers` (`id`);

ALTER TABLE `beer_user`
  ADD CONSTRAINT `fk_beer_user_users_id` FOREIGN KEY (`fk_users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_beer_user_beers_id` FOREIGN KEY (`fk_beers_id`) REFERENCES `beers` (`id`);

ALTER TABLE `beer_user_cart`
  ADD CONSTRAINT `fk_beer_user_cart_beers_id` FOREIGN KEY (`fk_beers_id`) REFERENCES `beers` (`id`),
  ADD CONSTRAINT `fk_beer_user_cart_user_carts_id` FOREIGN KEY (`fk_user_carts_id`) REFERENCES `user_carts` (`id`);

ALTER TABLE `exchanges`
  ADD CONSTRAINT `fk_exchanges_users_id` FOREIGN KEY (`fk_users_id`) REFERENCES `users` (`id`);

ALTER TABLE `exchange_raw_material`
  ADD CONSTRAINT `fk_exchange_raw_material_exchanges_id` FOREIGN KEY (`fk_exchanges_id`) REFERENCES `exchanges` (`id`),
  ADD CONSTRAINT `fk_exchange_raw_material_raw_materials_id` FOREIGN KEY (`fk_raw_materials_id`) REFERENCES `raw_materials` (`id`);

ALTER TABLE `messages`
  ADD CONSTRAINT `fk_messages_users_id` FOREIGN KEY (`fk_users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_messages_message_status_id` FOREIGN KEY (`fk_message_status_id`) REFERENCES `message_status` (`int`);

ALTER TABLE `raw_materials`
  ADD CONSTRAINT `fk_raw_materials_raw_material_types_id` FOREIGN KEY (`fk_raw_material_types_id`) REFERENCES `raw_material_types` (`id`);

ALTER TABLE `raw_materials_orders`
  ADD CONSTRAINT `fk_raw_materials_orders_vendors_id` FOREIGN KEY (`fk_vendors_id`) REFERENCES `vendors` (`id`),
  ADD CONSTRAINT `fk_raw_materials_orders_order_status_id` FOREIGN KEY (`fk_order_status_id`) REFERENCES `order_status` (`id`),
  ADD CONSTRAINT `fk_raw_materials_orders_invoices_id` FOREIGN KEY (`fk_invoices_id`) REFERENCES `invoices` (`id`);

ALTER TABLE `raw_material_raw_materials_order`
  ADD CONSTRAINT `fk_raw_material_raw_materials_order_raw_materials_id1` FOREIGN KEY (`fk_raw_materials_id`) REFERENCES `raw_materials` (`id`),
  ADD CONSTRAINT `fk_raw_material_raw_materials_order_raw_materials_orders_id` FOREIGN KEY (`fk_raw_materials_orders_id`) REFERENCES `raw_materials_orders` (`id`);

ALTER TABLE `raw_material_vendor`
  ADD CONSTRAINT `fk_raw_material_vendor_vendors_id` FOREIGN KEY (`fk_vendors_id`) REFERENCES `vendors` (`id`),
  ADD CONSTRAINT `fk_raw_material_vendor_raw_materials_id` FOREIGN KEY (`fk_raw_materials_id`) REFERENCES `raw_materials` (`id`);

ALTER TABLE `recipe_steps`
  ADD CONSTRAINT `fk_recipe_steps_beers_id` FOREIGN KEY (`fk_beers_id`) REFERENCES `beers` (`id`);

ALTER TABLE `stage_user`
  ADD CONSTRAINT `fk_stage_user_stages_id` FOREIGN KEY (`fk_stages_id`) REFERENCES `stages` (`id`),
  ADD CONSTRAINT `fk_stage_user_users_id` FOREIGN KEY (`fk_users_id`) REFERENCES `users` (`id`);

ALTER TABLE `tanks`
  ADD CONSTRAINT `fk_tanks_beers_id` FOREIGN KEY (`fk_beers_id`) REFERENCES `beers` (`id`);

ALTER TABLE `user_addresses`
  ADD CONSTRAINT `fk_user_addresses_users_id` FOREIGN KEY (`fk_users_id`) REFERENCES `users` (`id`);

ALTER TABLE `user_carts`
  ADD CONSTRAINT `fk_user_carts_users_id` FOREIGN KEY (`fk_users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_user_carts_quotations_id` FOREIGN KEY (`fk_quotations_id`) REFERENCES `quotations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;