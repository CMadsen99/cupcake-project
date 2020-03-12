-- noinspection SqlDialectInspectionForFile

-- noinspection SqlNoDataSourceInspectionForFile

CREATE DATABASE  IF NOT EXISTS `cupcake`;


USE `cupcake`;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(90) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'customer',
  `balance` int(11) DEFAULT 0,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `paid` boolean DEFAULT false,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `type` varchar(90) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`product_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details` (
  `orderdetail_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `topping_id` int(11) NOT NULL,
  `bottom_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`orderdetail_id`),
  KEY `order_id` (`order_id`),
  KEY `topping_id` (`topping_id`),
  KEY `bottom_id` (`bottom_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`topping_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`bottom_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO products (product_name, type, price) VALUES
("Chocolate", "Bottom", 5),
("Vanilla", "Bottom", 5),
("Nutmeg", "Bottom", 5),
("Pistacio", "Bottom", 6),
("Almond", "Bottom", 7),
("Chocolate", "Topping", 5),
("Blueberry", "Topping", 5),
("Raspberry", "Topping", 5),
("Crispy", "Topping", 6),
("Strawberry", "Topping", 6),
("Rum/Raisin", "Topping", 7),
("Orange", "Topping", 8),
("Lemon", "Topping", 8),
("Blue cheese", "Topping", 9);



