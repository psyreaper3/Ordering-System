-- Table structure for table `orders` 
CREATE TABLE `orders` (
  `order_id` int(255) NOT NULL AUTO_INCREMENT,
  `table_number` int(11) DEFAULT NULL,
  `pax` int(11) DEFAULT NULL,
  `waiter_name` varchar(255) NOT NULL,
  `status` enum('occupied','available') DEFAULT 'available',
  `order_status` enum('pending','in_progress','completed') DEFAULT 'pending',
  `order_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `bill_out_by` varchar(255) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3619 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `order_items` 
CREATE TABLE `order_items` (
  `item_id` int(255) NOT NULL AUTO_INCREMENT,
  `order_id` int(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `note_data` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `waiter_name` varchar(255) NOT NULL,
  `is_additional` varchar(255) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27593 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Table structure for table `employee` 
CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `biometric_id` int(255) NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `middle_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `address` varchar(225) NOT NULL,
  `contact_number` bigint(255) NOT NULL,
  `date_started` date NOT NULL DEFAULT current_timestamp(),
  `date_of_birth` date NOT NULL DEFAULT current_timestamp(),
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `date_resigned` date DEFAULT NULL,
  `remarks` mediumtext NOT NULL,
  `brgy_clearance` varchar(225) NOT NULL,
  `bir_form_2316` varchar(225) NOT NULL,
  `birth_cert` varchar(225) NOT NULL,
  `coe` varchar(225) NOT NULL,
  `id_2x2` varchar(225) NOT NULL,
  `mdf` varchar(225) NOT NULL,
  `health_card` varchar(225) NOT NULL,
  `vaccine_card` varchar(225) NOT NULL,
  `medical_exam` varchar(225) NOT NULL,
  `nbi_police_clearance` varchar(225) NOT NULL,
  `mdr` varchar(225) NOT NULL,
  `drivers_license` varchar(225) NOT NULL,
  `signature` varchar(225) NOT NULL,
  `sss_number` varchar(225) NOT NULL,
  `tin` varchar(225) NOT NULL,
  `tor` varchar(225) NOT NULL,
  `mdr_img` varchar(225) NOT NULL,
  `mdf_img` varchar(225) NOT NULL,
  `sss_number_img` varchar(225) NOT NULL,
  `tin_img` varchar(255) NOT NULL,
  `health_card_expiry` date NOT NULL DEFAULT current_timestamp(),
  `company_position` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `is_admin` varchar(3) NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
INSERT INTO employee VALUES ('1', '1', 'Test', 'Employee', 'Employee', 'Address or City', '9245693232', '2023-08-22', '1993-03-30', '1', '', '', '', '', '', '', '', '234269161297', '', '', '', '', '233514298484', '', '', '28-2652874-2', '312-127-344-123', '', '', '', '', '', '2024-07-26', 'I.T. Specialist', '480', '');

-- Table structure for table `employee_schedule` 
CREATE TABLE `employee_schedule` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `biometric_id` int(11) NOT NULL,
  `day_off` varchar(25) NOT NULL,
  `monday` time DEFAULT NULL,
  `tuesday` time DEFAULT NULL,
  `wednesday` time DEFAULT NULL,
  `thursday` time DEFAULT NULL,
  `friday` time DEFAULT NULL,
  `saturday` time DEFAULT NULL,
  `sunday` time DEFAULT NULL,
  `monday_lunch_break_duration` int(11) DEFAULT NULL,
  `tuesday_lunch_break_duration` int(11) DEFAULT NULL,
  `wednesday_lunch_break_duration` int(11) DEFAULT NULL,
  `thursday_lunch_break_duration` int(11) DEFAULT NULL,
  `friday_lunch_break_duration` int(11) DEFAULT NULL,
  `saturday_lunch_break_duration` int(11) DEFAULT NULL,
  `sunday_lunch_break_duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO employee_schedule VALUES ('1', '1', 'Sun', '07:50:00', '07:50:00', '07:50:00', '07:50:00', '07:50:00', '07:50:00', '00:00:00', '60', '60', '60', '60', '60', '60', '0');

-- Table structure for table `inventory` 
CREATE TABLE `inventory` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_code` varchar(200) NOT NULL,
  `address` varchar(10) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `product_image` varchar(100) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_description` text NOT NULL,
  `product_category` varchar(40) NOT NULL,
  `product_classification` varchar(225) NOT NULL,
  `cooking_station` varchar(50) NOT NULL,
  `variety` varchar(100) NOT NULL,
  `location` varchar(200) NOT NULL,
  `code` int(11) NOT NULL,
  `remarks` text NOT NULL,
  `inventory_valuation_method` varchar(200) NOT NULL,
  `unit_price` float NOT NULL,
  `stock_quantity` float NOT NULL,
  `uom` varchar(200) NOT NULL,
  `weight_volume` varchar(200) NOT NULL,
  `date_expiry` date DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1024 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO inventory VALUES ('1', 'equipment', '', '0', '', '78.jpg', 'Hampton Shake glass', '', 'Drinkware', '', '', '', '', '0', '', '', '50', '1', '0', '0', '0000-00-00');
INSERT INTO inventory VALUES ('2', 'menu_item', '', '0', '', '116.jpg', 'Kani Salad', 'crabsticks, mangoes, Japanese mayo, greens, sesame seeds', 'Salads', '', 'cold_side', '', '', '0', '', '', '280', '18', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('3', 'menu_item', '', '0', '', '31.jpg', 'Avodah Vegetarian Salad', 'mangoes, apples, Malagos cheese, candied mixed nuts, vinaigrette', 'Salads', '', 'cold_side', '', '', '0', '', '', '299', '10', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('4', 'equipment', '', '0', '', '87.jpg', 'Blue dot  ( Dinner Plate )', '', 'Tableware', '', '', '', '', '0', '', '', '10', '84', '0', '0', '0000-00-00');
INSERT INTO inventory VALUES ('5', 'menu_item', '', '0', '', '48.jpg', 'Margherita', 'tomatoes, mozzarella, fresh basil, olive oil', 'Pizza', '', 'pizza_side', '', '', '0', '', '', '400', '19', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('6', 'menu_item', '', '0', '', '', 'Diavola', 'red sauce, mozzarella, beef italian sausage, red and green bell peppers, chili fingers, white onions', 'Pizza', '', 'pizza_side', '', '', '0', 'Spicy', '', '550', '19', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('7', 'menu_item', '', '0', '', '119.jpg', 'Carbonara', 'white sauce, mozzarella, beef bacon, fresh egg, grana padano', 'Pizza', '', 'pizza_side', '', '', '0', 'Best Seller', '', '600', '6', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('8', 'menu_item', '', '0', '', '37.jpg', 'Beef Bulgogi Pizza', 'beef bulgogi, white onions, bell peppers, spring onions, white sauce', 'Pizza', '', 'pizza_side', '', '', '0', 'Best Seller', '', '650', '3', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('9', 'menu_item', '', '0', '', '38.jpg', 'Lechon Kawali', 'deep fried pork belly, served with crispy kangkong', 'To Share', 'Pork', 'fryer', '', '', '0', '', '', '329', '1', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('10', 'menu_item', '', '0', '', '54.jpg', 'Lemonade', '', 'Drinks', 'Fruit Based', '', '', '', '0', 'Best Seller', '', '120', '104', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('11', 'menu_item', '', '0', '', '46.jpg', 'Calamari Fritti', 'battered squid rings with savory white sauce', 'Appetizers', '', 'fryer', '', '', '0', 'House Specialty', '', '340', '0', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('12', 'menu_item', '', '0', '', '79.jpg', 'Enoki Bites', 'deep fried enoki mushrooms, wasabi mayo', 'Appetizers', '', 'fryer', '', '', '0', '', '', '199', '4', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('13', 'menu_item', '', '0', '', '22.jpg', 'Crispy Kangkong', 'deep fried kangkong chips served with savory dip', 'Appetizers', '', 'fryer', '', '', '0', '', '', '150', '0', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('14', 'menu_item', '', '0', '', '63.jpg', 'Crispy Crablets', 'deep fried extra crispy baby crabs served with house spiced vinegar dip', 'Appetizers', '', 'fryer', '', '', '0', '', '', '300', '3', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('15', 'menu_item', '', '0', '', '21.jpg', 'Kinilaw', 'malasugi, vinegar, calamansi, red onions, chili', 'Appetizers', '', 'cold_side', '', '', '0', 'House Specialty', '', '289', '0', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('17', 'menu_item', '', '0', '', '66.jpg', 'Tortilla w/ crabmeat dip', 'tortilla chips made with crab meat and cream cheese', 'Appetizers', '', 'hot_side', '', '', '0', 'Best Seller', '', '320', '0', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('18', 'menu_item', '', '0', '', '', 'Rice Shiitake', '', 'Appetizers', '', 'hot_side', '', '', '0', '', '', '60', '957', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('19', 'menu_item', '', '0', '', '50.jpg', 'Tuna Palapa Fried Rice', '', 'Appetizers', 'Platter', 'hot_side', '', '', '0', 'Spicy', '', '249', '25', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('20', 'menu_item', '', '0', '', '25.jpg', 'Solo Rice', '', 'Appetizers', '', 'cold_side', '', '', '0', '', '', '40', '999508', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('21', 'menu_item', '', '0', '', '32.jpg', 'Rice Platter', 'SERVES 2-3', 'Appetizers', 'Platter', 'cold_side', '', '', '0', '', '', '150', '8903', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('22', 'menu_item', '', '0', '', '23.jpg', 'Aligue Fried Rice', '', 'Appetizers', 'Platter', 'hot_side', '', '', '0', 'Best Seller', '', '299', '10', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('23', 'menu_item', '', '0', '', '80.jpg', 'Chicken Potato Salad', 'breaded chicken, potatoes, apples, mixed cheese, greens', 'Salads', '', 'cold_side', '', '', '0', 'Best Seller', '', '299', '10', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('24', 'menu_item', '', '0', '', '82.jpg', 'Watermelon Manchego Salad', 'diced watermelon, basil, manchego, pumpkin seeds, lemon olive oil dressing, sesame seeds', 'Salads', '', 'cold_side', '', '', '0', '', '', '299', '18', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('25', 'menu_item', '', '0', '', '', 'Amatriciana', 'spicy red sauce pasta with garlic, olive oil, beef bacon', 'Pasta', '', 'hot_side', '', '', '0', 'Best Seller', '', '289', '5', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('26', 'menu_item', '', '0', '', '36.jpg', 'Marinara Peperoncino ', 'spicy red sauce pasta with shrimp and squid', 'Pasta', '', 'hot_side', '', '', '0', 'Very Spicy', '', '380', '6', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('27', 'menu_item', '', '0', '', '81.jpg', 'Aligue Pasta Negra', 'mixed seafood, parmesan, aligue white sauce', 'Pasta', '', 'hot_side', '', '', '0', 'House Specialty', '', '380', '9', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('28', 'menu_item', '', '0', '', '28.jpg', 'Penne Rustica', 'vegetarian pasta with olives, pine nuts, tomatoes', 'Pasta', '', 'hot_side', '', '', '0', '', '', '299', '26', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('29', 'menu_item', '', '0', '', '', 'Pesto Penne', 'fresh basil pesto, garlic, grana padano and olive oil', 'Pasta', '', 'hot_side', '', '', '0', '', '', '359', '3', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('30', 'menu_item', '', '0', '', '', 'Pomodoro Mozzarella', 'tomato sauce, mozzarella, white onions, grana padano', 'Pasta', '', 'hot_side', '', '', '0', '', '', '329', '870', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('31', 'menu_item', '', '0', '', '30.jpg', 'Quattro Formaggi Pizza', 'mozzarella, teta Cieese, blue cheese, grana padano', 'Pizza', '', 'pizza_side', '', '', '0', '', '', '650', '8', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('32', 'menu_item', '', '0', '', '117.jpg', 'Avodah Chicken BBQ', 'barbecued chicken leg quarter glazed with Avodah signature sauce, comes with rice.', 'Solo Meal', '', 'hot_side', '', '', '0', 'Best Seller', '', '259', '2', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('33', 'menu_item', '', '0', '', '', 'Bulgogi Deop-bap', 'beef bulgogi rice bowl with mixed vegetables', 'Solo Meal', '', 'hot_side', '', '', '0', '', '', '299', '0', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('34', 'menu_item', '', '0', '', '67.jpg', 'Sesame Pepper Tuna', 'sesame crusted local tuna, pechay, shiitake fried rice and black pepper sauce', 'Solo Meal', '', 'hot_side', '', '', '0', 'House Specialty', '', '349', '3', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('35', 'menu_item', '', '0', '', '', 'Angus Striploin Steak', '', 'Solo Meal', '', 'hot_side', '', '', '0', '', '', '1699', '15', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('36', 'menu_item', '', '0', '', '83.jpg', 'Avodah Crispy Pork', 'deep fried pork loin, tossed with egg floss', 'To Share', 'Pork', 'fryer', '', '', '0', '', '', '300', '9', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('37', 'menu_item', '', '0', '', '57.jpg', 'Bagnet Karekare', 'deep fried pork belly in thickpeanut sauce, served with bagoong', 'To Share', 'Pork', 'fryer', '', '', '0', '', '', '499', '0', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('38', 'menu_item', '', '0', '', '74.jpg', 'BBQ Pork Back Ribs', 'fall-off-the-bone pork ribs, truffle parmesan fries and home made coleslaw', 'To Share', 'Pork', 'hot_side', '', '', '0', '', '', '729', '0', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('39', 'menu_item', '', '0', '', '45.jpg', 'Buttered Chicken', 'savory and crispy fried chicken, chips', 'To Share', '', 'fryer', '', '', '0', '', '', '300', '13', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('40', 'menu_item', '', '0', '', '26.jpg', 'Chicken Wings - Buffalo', 'chicken wings and thin potato slices', 'To Share', '', 'fryer', '', '', '0', 'House Specialty', '', '289', '0', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('41', 'menu_item', '', '0', '', '', 'Chicken Wings - Garlic Parmesan', 'chicken wings and thin potato slices', 'To Share', '', 'fryer', '', '', '0', 'House Specialty', '', '289', '16', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('42', 'menu_item', '', '0', '', '75.jpg', 'Crispy Pata Medium', 'deep fried pork leg with house recipe dipping sauce', 'To Share', 'Pork', 'fryer', '', '', '0', '', '', '759', '2', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('44', 'menu_item', '', '0', '', '20.jpg', 'Galbi-Jjim', 'braised beef short ribs topped with mozzarella cheese', 'To Share', '', 'hot_side', '', '', '0', 'Best Seller', '', '499', '21', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('45', 'menu_item', '', '0', '', '51.jpg', 'Grilled Tuna Belly', 'grilled tuna belly served with tomato salsa', 'To Share', '', 'hot_side', '', '', '0', 'Best Seller', '', '399', '10', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('46', 'menu_item', '', '0', '', '47.jpg', 'Japchae', 'sweet potato glass noodles with mixed vegetables', 'To Share', '', 'hot_side', '', '', '0', '', '', '299', '1', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('47', 'menu_item', '', '0', '', '56.jpg', 'Nilarang', 'a spicy and sour fish stew with tomatoes and garlic', 'To Share', '', 'hot_side', '', '', '0', '', '', '300', '2', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('48', 'menu_item', '', '0', '', '33.jpg', 'Seollongtang', 'Korean ox bone soup (also known as collagen soup!)', 'To Share', '', 'hot_side', '', '', '0', '', '', '400', '7', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('49', 'menu_item', '', '0', '', '', 'Aglio e Olio', 'Spaghetti with fresh garlic and olive oil, served with a side of chicken parmigiana', 'Pasta', '', 'pizza_side', '', '', '0', '', '', '395', '4', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('50', 'menu_item', '', '0', '', '', 'Parmigiana - Eggplant', 'parmesan, provolone, tomatoes, basil, white sauce', 'To Share', '', 'pizza_side', '', '', '0', '', '', '395', '919', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('51', 'menu_item', '', '0', '', '', 'Roasted Herbed Chicken', 'roasted herbed chicken halve, spiced rice with local palapa', 'To Share', '', 'hot_side', '', '', '0', '', '', '389', '0', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('52', 'menu_item', '', '0', '', '27.jpg', 'Salted Egg Palapa Shrimp', 'shrimp, salted egg, curry leaves, palapa, red onions', 'To Share', '', 'hot_side', '', '', '0', '', '', '349', '7', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('53', 'menu_item', '', '0', '', '55.jpg', 'Sizzling Bulalo', 'Beef shank with house recipe gravy', 'To Share', '', 'hot_side', '', '', '0', 'Best Seller', '', '729', '8', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('54', 'menu_item', '', '0', '', '34.jpg', 'Sizzling Sisig', 'minced pork with white onions and chili, egg', 'To Share', 'Pork', 'hot_side', '', '', '0', 'Best Seller', '', '329', '0', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('55', 'menu_item', '', '0', '', '44.jpg', 'Steamed Pompano', 'steamed pompano with soy ginger sauce', 'To Share', '', 'hot_side', '', '', '0', '', '', '329', '20', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('56', 'menu_item', '', '0', '', '', 'Plank Salmon', '', 'To Share', '', 'hot_side', '', '', '0', '', '', '529', '0', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('57', 'menu_item', '', '0', '', '86.jpg', 'Beef Rendang', 'Avodah white sauce, beef rendang', 'Pizza', '', 'pizza_side', '', '', '0', 'House Specialty', '', '650', '18', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('58', 'menu_item', '', '0', '', '118.jpg', 'Cappricciosa Overload', 'red sauce, italian sausage, parma ham, mushroom, black olives, white onions, cooked ham, mozzarella', 'Pizza', 'Pork', 'pizza_side', '', '', '0', '', '', '650', '19', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('59', 'menu_item', '', '0', '', '29.jpg', 'Prosciutto e Funghi', 'Avodah white sauce, mozzarella, prosciutto, grana padano, mushroom, white onions', 'Pizza', 'Pork', 'pizza_side', '', '', '0', 'Best Seller', '', '650', '18', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('60', 'menu_item', '', '0', '', '', 'Spinach Pecorino', 'spinach, artichokes, pecorino, prosciutto cotto spalla, white sauce', 'Pizza', 'Pork', 'pizza_side', '', '', '0', '', '', '650', '19', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('61', 'menu_item', '', '0', '', '', 'Sweet Chicken BBQ', 'chicken, sweet barbecue sauce, white onions', 'Pizza', '', 'pizza_side', '', '', '0', '', '', '500', '9', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('62', 'menu_item', '', '0', '', '', 'Tropicana', '', 'Pizza', '', 'pizza_side', '', '', '0', '', '', '650', '20', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('63', 'menu_item', '', '0', '', '', 'Vegetariana Pizza', 'redsauce, mozzarella red and green bell peppers, mushrooms, eggplant, white onions, pineapples, fresh tomatoes', 'Pizza', '', 'pizza_side', '', '', '0', '', '', '550', '4', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('64', 'menu_item', '', '0', '', '', 'Quattro Formaggi Pasta', 'mozzarella, feta, blue cheese, grana padano', 'Pasta', '', 'hot_side', '', '', '0', '', '', '329', '891', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('65', 'menu_item', '', '0', '', '', 'Pistacchio Burratina', '', 'Pizza', '', 'pizza_side', '', '', '0', '', '', '700', '17', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('66', 'menu_item', '', '0', '', '65.jpg', 'Affogato', '', 'Desserts', '', 'cold_side', '', '', '0', '', '', '279', '15', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('67', 'menu_item', '', '0', '', '73.jpg', 'Banana Nutella Pizza', '', 'Desserts', '', 'fryer', '', '', '0', 'Best Seller', '', '499', '932', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('68', 'menu_item', '', '0', '', '35.jpg', 'Berries & Cream Cake', '', 'Desserts', '', 'cold_side', '', '', '0', '', '', '279', '0', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('69', 'menu_item', '', '0', '', '', 'Berries & Cream Whole', '', 'Desserts', '', '', '', '', '0', '', '', '2230', '0', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('70', 'menu_item', '', '0', '', '68.jpg', 'Black Forest', '', 'Desserts', '', 'cold_side', '', '', '0', 'Best Seller', '', '259', '0', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('71', 'menu_item', '', '0', '', '', 'Black Forest Whole', '', 'Desserts', '', '', '', '', '0', '', '', '2072', '0', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('72', 'menu_item', '', '0', '', '64.jpg', 'Chocolate Monster', '', 'Desserts', '', 'cold_side', '', '', '0', '', '', '159', '0', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('73', 'menu_item', '', '0', '', '76.jpg', 'Chocolate Monster Whole', '', 'Desserts', '', '', '', '', '0', '', '', '1272', '0', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('74', 'menu_item', '', '0', '', '', 'Chocolate Peppermint Cheesecake', '', 'Desserts', '', 'cold_side', '', '', '0', '', '', '159', '0', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('75', 'menu_item', '', '0', '', '77.jpg', 'Chocolate Peppermint Cheesecake Whole', '', 'Desserts', '', '', '', '', '0', '', '', '1272', '0', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('76', 'menu_item', '', '0', '', '', 'Pistacchio Sans Rival', '', 'Desserts', '', 'cold_side', '', '', '0', '', '', '320', '0', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('77', 'menu_item', '', '0', '', '', 'Pistacchio Sans Rival Whole', '', 'Desserts', '', '', '', '', '0', '', '', '2560', '0', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('78', 'menu_item', '', '0', '', '62.jpg', 'Watermelon Choux-Choux', '', 'Desserts', '', 'cold_side', '', '', '0', '', '', '229', '18', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('79', 'menu_item', '', '0', '', '', 'Bottled Water', '', 'Drinks', '', '', '', '', '0', '', '', '25', '698', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('80', 'menu_item', '', '0', '', '72.jpg', 'Cucumber-Pineapple Refresher', '', 'Drinks', 'Fruit Based', 'cold_side', '', '', '0', '', '', '130', '571', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('81', 'menu_item', '', '0', '', '53.jpg', 'Kiwi Refresher', '', 'Drinks', 'Fruit Based', '', '', '', '0', '', '', '160', '796', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('82', 'menu_item', '', '0', '', '52.jpg', 'Strawberry Refresher', '', 'Drinks', 'Fruit Based', '', '', '', '0', '', '', '160', '4', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('83', 'menu_item', '', '0', '', '70.jpg', 'Mango Crush', '', 'Drinks', 'Fruit Based', '', '', '', '0', 'Best Seller', '', '160', '309', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('84', 'menu_item', '', '0', '', '', 'Watermelon Refresher', '', 'Drinks', 'Fruit Based', '', '', '', '0', '', '', '130', '226', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('85', 'menu_item', '', '0', '', '59.jpg', 'Coke In Can - Regular', '', 'Drinks', 'Soda', '', '', '', '0', '', '', '75', '999347', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('86', 'menu_item', '', '0', '', '58.jpg', 'Coke In Can - Zero', '', 'Drinks', 'Soda', '', '', '', '0', '', '', '75', '65049', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('87', 'menu_item', '', '0', '', '60.jpg', 'Sprite In Can', '', 'Drinks', 'Soda', '', '', '', '0', '', '', '75', '716', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('88', 'menu_item', '', '0', '', '61.jpg', 'Royal In Can', '', 'Drinks', 'Soda', '', '', '', '0', '', '', '75', '908', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('89', 'menu_item', '', '0', '', '', 'Americano Hot', '', 'Drinks', 'Coffee', '', '', '', '0', '', '', '130', '771', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('90', 'menu_item', '', '0', '', '', 'Americano Iced', '', 'Drinks', 'Coffee', '', '', '', '0', '', '', '130', '956', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('91', 'menu_item', '', '0', '', '', 'Brewed Coffee', '', 'Drinks', 'Coffee', '', '', '', '0', '', '', '110', '934', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('92', 'menu_item', '', '0', '', '', 'Cappuccino Hot', '', 'Drinks', 'Coffee', '', '', '', '0', '', '', '150', '888', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('93', 'menu_item', '', '0', '', '', 'Cappuccino Iced', '', 'Drinks', 'Coffee', '', '', '', '0', '', '', '150', '984', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('96', 'menu_item', '', '0', '', '', 'Caramel Macchiato Hot', '', 'Drinks', 'Coffee', '', '', '', '0', 'Best Seller', '', '180', '902', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('97', 'menu_item', '', '0', '', '', 'Caramel Macchiato Iced', '', 'Drinks', 'Coffee', '', '', '', '0', 'Best Seller', '', '180', '676', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('98', 'menu_item', '', '0', '', '', 'Dark Mocha Hot', '', 'Drinks', 'Coffee', '', '', '', '0', '', '', '160', '979', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('99', 'menu_item', '', '0', '', '', 'Dark Mocha Iced', '', 'Drinks', 'Coffee', '', '', '', '0', '', '', '160', '948', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('100', 'menu_item', '', '0', '', '', 'Espresso Shot', '', 'Drinks', '', '', '', '', '0', '', '', '80', '993', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('101', 'menu_item', '', '0', '', '', 'Hazelnut Latte Hot', '', 'Drinks', 'Coffee', '', '', '', '0', '', '', '170', '167', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('102', 'menu_item', '', '0', '', '', 'Hazelnut Latte Iced', '', 'Drinks', 'Coffee', '', '', '', '0', '', '', '170', '133', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('103', 'menu_item', '', '0', '', '', 'Latte Hot', '', 'Drinks', 'Coffee', '', '', '', '0', '', '', '150', '911', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('104', 'menu_item', '', '0', '', '', 'Latte Iced', '', 'Drinks', 'Coffee', '', '', '', '0', '', '', '150', '933', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('105', 'menu_item', '', '0', '', '', 'Matcha Espresso Hot', '', 'Drinks', '', '', '', '', '0', '', '', '200', '979', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('106', 'menu_item', '', '0', '', '', 'Matcha Espresso Iced', '', 'Drinks', '', '', '', '', '0', '', '', '200', '954', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('107', 'menu_item', '', '0', '', '', 'Salted Caramel Latte Hot', '', 'Drinks', 'Coffee', '', '', '', '0', '', '', '170', '961', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('108', 'menu_item', '', '0', '', '', 'Salted Caramel Latte Iced', '', 'Drinks', 'Coffee', '', '', '', '0', '', '', '170', '867', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('109', 'menu_item', '', '0', '', '', 'White Mocha Hot', '', 'Drinks', 'Coffee', '', '', '', '0', '', '', '170', '971', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('110', 'menu_item', '', '0', '', '', 'White Mocha Iced', '', 'Drinks', 'Coffee', '', '', '', '0', '', '', '170', '927', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('111', 'menu_item', '', '0', '', '', 'Oat Milk Spanish Latte Hot', '', 'Drinks', 'Coffee', '', '', '', '0', '', '', '180', '950', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('112', 'menu_item', '', '0', '', '', 'Oat Milk Spanish Latte Iced', '', 'Drinks', 'Coffee', '', '', '', '0', '', '', '180', '764', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('113', 'menu_item', '', '0', '', '84.jpg', 'Oat Milk Macadamia Hot', '', 'Drinks', 'Coffee', '', '', '', '0', 'Best Seller', '', '190', '957', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('114', 'menu_item', '', '0', '', '', 'Chocolate Hot', '', 'Drinks', '', '', '', '', '0', '', '', '200', '986', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('115', 'menu_item', '', '0', '', '', 'Chocolate Iced', '', 'Drinks', '', '', '', '', '0', '', '', '200', '947', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('116', 'menu_item', '', '0', '', '', 'Cinnamon Crush', '', 'Drinks', '', '', '', '', '0', '', '', '220', '999', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('117', 'menu_item', '', '0', '', '', 'Popcorn Crush', '', 'Drinks', 'Coffee', '', '', '', '0', '', '', '210', '987', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('118', 'menu_item', '', '0', '', '39.jpg', 'Salted Caramel Crush', '', 'Drinks', 'Coffee', '', '', '', '0', '', '', '210', '906', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('119', 'menu_item', '', '0', '', '120.jpg', 'Java Chip', '', 'Drinks', 'Coffee', '', '', '', '0', '', '', '210', '903', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('120', 'menu_item', '', '0', '', '40.jpg', 'Ice Cream Crush', '', 'Drinks', 'Coffee', '', '', '', '0', 'Best Seller', '', '210', '898', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('121', 'menu_item', '', '0', '', '71.jpg', 'Matcha Crush', '', 'Drinks', 'Ice Blended', '', '', '', '0', '', '', '210', '858', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('122', 'menu_item', '', '0', '', '', 'Matcha Latte Hot', '', 'Drinks', 'Flavored Lattes', '', '', '', '0', '', '', '200', '984', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('123', 'menu_item', '', '0', '', '', 'Matcha Latte Iced', '', 'Drinks', 'Flavored Lattes', '', '', '', '0', '', '', '200', '876', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('124', 'menu_item', '', '0', '', '', 'Mixed Berry Crush', '', 'Drinks', 'Ice Blended', '', '', '', '0', 'Best Seller', '', '210', '9', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('125', 'menu_item', '', '0', '', '', 'Oreo Crush', '', 'Drinks', 'Ice Blended', '', '', '', '0', 'Best Seller', '', '210', '472', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('126', 'menu_item', '', '0', '', '', 'Pink Latte', '', 'Drinks', 'Flavored Lattes', '', '', '', '0', '', '', '200', '19', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('127', 'menu_item', '', '0', '', '', 'Peppermint Mocha Hot', '', 'Drinks', 'Coffee', '', '', '', '0', '', '', '180', '988', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('128', 'menu_item', '', '0', '', '42.jpg', 'Choco Hazelnut Coldbrew', '', 'Drinks', 'Coffee', '', '', '', '0', 'Best Seller', '', '180', '0', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('129', 'menu_item', '', '0', '', '41.jpg', 'Irish Coldbrew', '', 'Drinks', 'Coffee', '', '', '', '0', '', '', '180', '0', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('130', 'menu_item', '', '0', '', '', 'Oatmilk add-on', '', 'Drinks', '', '', '', '', '0', '', '', '50', '998', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('131', 'menu_item', '', '0', '', '', 'London Fog Tea', '', 'Drinks', 'Tea Selections', '', '', '', '0', '', '', '150', '995', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('132', 'menu_item', '', '0', '', '', 'Green Tea', '', 'Drinks', 'Tea Selections', '', '', '', '0', '', '', '100', '967', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('133', 'menu_item', '', '0', '', '', 'Earl Grey', '', 'Drinks', 'Tea Selections', '', '', '', '0', '', '', '100', '997', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('134', 'menu_item', '', '0', '', '', 'English Breakfast', '', 'Drinks', 'Tea Selections', '', '', '', '0', '', '', '100', '995', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('135', 'menu_item', '', '0', '', '', 'Lemon Ginger', '', 'Drinks', 'Tea Selections', '', '', '', '0', '', '', '100', '888', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('136', 'menu_item', '', '0', '', '', 'Honey Citron', '', 'Drinks', 'Tea Selections', '', '', '', '0', '', '', '100', '937', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('137', 'menu_item', '', '0', '', '', 'Mint', '', 'Drinks', 'Tea Selections', '', '', '', '0', '', '', '100', '988', '', '0', '0000-00-00');
INSERT INTO inventory VALUES ('139', 'menu_item', '', '0', '', '', 'Packaging 750 ML', '', 'Others', '', '', '', '', '0', '', '', '25', '972', '', '0', '');
INSERT INTO inventory VALUES ('140', 'menu_item', '', '0', '', '', 'Packaging 1000 ML', '', 'Others', '', '', '', '', '0', '', '', '30', '897', '', '0', '');
INSERT INTO inventory VALUES ('141', 'menu_item', '', '0', '', '', 'Packaging Large', '', 'Others', '', '', '', '', '0', '', '', '45', '985', '', '0', '');
INSERT INTO inventory VALUES ('142', 'menu_item', '', '0', '', '', 'Paperbag', '', 'Others', '', '', '', '', '0', '', '', '5', '9998', '', '0', '');
INSERT INTO inventory VALUES ('143', 'menu_item', '', '0', '', '', 'Paperbag w/ Handle', '', 'Others', '', '', '', '', '0', '', '', '50', '998', '', '0', '');
INSERT INTO inventory VALUES ('144', 'menu_item', '', '0', '', '', 'Choco Matcha', '', 'Drinks', '', '', '', '', '0', '', '', '210', '998', '', '0', '');
INSERT INTO inventory VALUES ('145', 'menu_item', '', '0', '', '', 'Matcha Red Bean', '', 'Drinks', '', '', '', '', '0', '', '', '210', '999', '', '0', '');
INSERT INTO inventory VALUES ('146', 'menu_item', '', '0', '', '', 'Red Bean Latte', '', 'Drinks', '', '', '', '', '0', '', '', '200', '999', '', '0', '');
INSERT INTO inventory VALUES ('147', 'menu_item', '', '0', '', '', 'Dipping Sauce Add-on', '', 'Others', '', '', '', '', '0', '', '', '30', '991', '', '0', '');
INSERT INTO inventory VALUES ('148', 'menu_item', '', '0', '', '', 'Palapa Add-on', '', 'Others', '', '', '', '', '0', '', '', '30', '998', '', '0', '');
INSERT INTO inventory VALUES ('149', 'menu_item', '', '0', '', '', 'Pizza Sauce Add-on', '', 'Others', '', '', '', '', '0', '', '', '50', '999', '', '0', '');
INSERT INTO inventory VALUES ('150', 'menu_item', '', '0', '', '', 'Corkage Add-on', '', 'Others', '', '', '', '', '0', '', '', '500', '10000000', '', '0', '');
INSERT INTO inventory VALUES ('151', 'menu_item', '', '0', '', '', 'Espresso Shot Extra', '', 'Others', '', '', '', '', '0', '', '', '30', '99999', '', '0', '');
INSERT INTO inventory VALUES ('152', 'menu_item', '', '0', '', '', 'Regular Milk Add-on', '', 'Others', '', '', '', '', '0', '', '', '20', '997', '', '0', '');
INSERT INTO inventory VALUES ('153', 'menu_item', '', '0', '', '', 'Syrup Add-on', '', 'Others', '', '', '', '', '0', '', '', '30', '999996', '', '0', '');
INSERT INTO inventory VALUES ('154', 'menu_item', '', '0', '', '', 'Whipped Cream Add-on', '', 'Others', '', '', '', '', '0', '', '', '30', '9999', '', '0', '');
INSERT INTO inventory VALUES ('155', 'menu_item', '', '0', '', '', 'Drinking Glass - Breakage', '', 'Others', '', '', '', '', '0', '', '', '50', '10000000', '', '0', '');
INSERT INTO inventory VALUES ('156', 'menu_item', '', '0', '', '', 'Lemonade Glass - Breakage', '', 'Others', '', '', '', '', '0', '', '', '120', '10000000', '', '0', '');
INSERT INTO inventory VALUES ('157', 'menu_item', '', '0', '', '', 'Dinner Plates - Breakage', '', 'Others', '', '', '', '', '0', '', '', '100', '99999', '', '0', '');
INSERT INTO inventory VALUES ('158', 'menu_item', '', '0', '', '', 'Baked Scallops', '', 'Secret Menu', '', '', '', '', '0', '', '', '349', '0', '', '0', '');
INSERT INTO inventory VALUES ('159', 'menu_item', '', '0', '', '', 'Chocolate Babka', '', 'Breads', '', '', '', '', '0', '', '', '289', '0', '', '0', '');
INSERT INTO inventory VALUES ('160', 'menu_item', '', '0', '', '', 'Raisin Loaf', '', 'Breads', '', '', '', '', '0', '', '', '229', '0', '', '0', '');
INSERT INTO inventory VALUES ('161', 'menu_item', '', '0', '', '', 'Choco Swirl', '', 'Breads', '', '', '', '', '0', '', '', '249', '0', '', '0', '');
INSERT INTO inventory VALUES ('162', 'menu_item', '', '0', '', '', 'Red Velvet', '', 'Breads', '', '', '', '', '0', '', '', '299', '0', '', '0', '');
INSERT INTO inventory VALUES ('163', 'menu_item', '', '0', '', '69.jpg', 'Matcha Kurogoma Cake', '', 'Desserts', '', '', '', '', '0', '', '', '320', '0', '', '', '');
INSERT INTO inventory VALUES ('164', 'equipment', '2A', '0', '', '', 'Crème de Cacao White', '', 'Ingredient', '', '', '', '', '0', '', '', '640', '1', 'bottle', '750ml', '');
INSERT INTO inventory VALUES ('165', 'equipment', '2A', '0', '', '', 'Cabernet Sauvenon Vinegar', '', 'Ingredient', '', '', '', '', '0', '', '', '599.2', '1', 'bottle', '750ml', '');
INSERT INTO inventory VALUES ('166', 'equipment', '2A', '0', '', '', 'Crema Balsamic Vinegar', '', 'Ingredient', '', '', '', '', '0', '', '', '282.24', '4', 'bottle', '250ml', '');
INSERT INTO inventory VALUES ('167', 'equipment', '2A', '0', '', '', 'Chianti Red Wine', '', 'Ingredient', '', '', '', '', '0', '', '', '929.6', '1', 'bottle', '750ml', '');
INSERT INTO inventory VALUES ('168', 'equipment', '2A', '0', '', '', 'Master of Mixes Mojito', '', 'Ingredient', '', '', '', '', '0', '', '', '979', '1', 'bottle', '1750ml', '');
INSERT INTO inventory VALUES ('169', 'equipment', '2A', '0', '', '', 'Moscato White Wine', '', 'Ingredient', '', '', '', '', '0', '', '', '504', '2', 'bottle', '750ml', '');
INSERT INTO inventory VALUES ('170', 'equipment', '2A', '0', '', '', 'La Colombara Lambrusco Dell Emilia', '', 'Ingredient', '', '', '', '', '0', '', '', '575', '1', 'bottle', '1000ml', '');
INSERT INTO inventory VALUES ('171', 'equipment', '2A', '0', '', '', 'Passion Fruit', '', 'Ingredient', '', '', '', '', '0', '', '', '500', '1', 'Jar', '1kg', '');
INSERT INTO inventory VALUES ('172', 'equipment', '2A', '0', '', '', 'Honey Citron & Ginger', '', 'Ingredient', '', '', '', '', '0', '', '', '486', '2', 'Jar', '2kg', '');
INSERT INTO inventory VALUES ('173', 'equipment', '2A', '0', '', '', 'Honey Citron ', '', 'Ingredient', '', '', '', '', '0', '', '', '442', '2', 'Jar', '2kgs', '');
INSERT INTO inventory VALUES ('174', 'equipment', '2A', '0', '', '', 'Monin Rose', '', 'Ingredient', '', '', '', '', '0', '', '', '600', '1', 'bottle', '750ml', '');
INSERT INTO inventory VALUES ('175', 'equipment', '2A', '0', '', '', 'Monin Coconut', '', 'Ingredient', '', '', '', '', '0', '', '', '650', '1', 'bottle', '750ml', '');
INSERT INTO inventory VALUES ('176', 'equipment', '2A', '0', '', '', 'Cantine Intorcia Marsala Wine', '', 'Ingredient', '', '', '', '', '0', '', '', '899', '1', 'bottle', '1000ml', '');
INSERT INTO inventory VALUES ('177', 'equipment', '2A', '0', '', '', 'Pagano Divino Rosso', '', 'Ingredient', '', '', '', '', '0', '', '', '550', '1', 'bottle', '2000ml', '');
INSERT INTO inventory VALUES ('178', 'equipment', '2A', '0', '', '', 'Pinot Grigio Wine Delle Venezie', '', 'Ingredient', '', '', '', '', '0', '', '', '436.8', '4', 'bottle', '750ml', '');
INSERT INTO inventory VALUES ('179', 'equipment', '2A', '0', '', '', 'Rose Wine', '', 'Ingredient', '', '', '', '', '0', '', '', '722.4', '1', 'bottle', '750ml', '');
INSERT INTO inventory VALUES ('180', 'equipment', '2A', '0', '', '', 'San Pellegrino', '', 'Ingredient', '', '', '', '', '0', '', '', '199', '5', 'bottle', '250ml', '');
INSERT INTO inventory VALUES ('181', 'equipment', '1A', '0', '', '121.png', 'Allegro Premium Beans', '', 'Ingredient', '', '', '', '', '0', '', '', '930', '28', '0', '500gms', '');
INSERT INTO inventory VALUES ('182', 'equipment', '1A', '0', '', '122.png', 'Allegro Silver Ground', '', 'Ingredient', '', '', '', '', '0', '', '', '830', '5', '0', '800gms', '');
INSERT INTO inventory VALUES ('183', 'equipment', '1A', '0', '', '128.jpg', 'Allegro Varako Ground', '', 'Ingredient', '', '', '', '', '0', '', '', '679', '1', '0', '800gms', '');
INSERT INTO inventory VALUES ('184', 'equipment', '1A', '0', '', '129.jpg', 'Allegro Whole Bean Varako', '', 'Ingredient', '', '', '', '', '0', '', '', '679', '3', '0', '950', '');
INSERT INTO inventory VALUES ('185', 'equipment', '1A', '0', '', '130.jpg', 'Nescafe Classic', '', 'Ingredient', '', '', '', '', '0', '', '', '170', '3', '185', '755', '');
INSERT INTO inventory VALUES ('186', 'equipment', '1A', '0', '', '', 'Allegro Black Tea', '', 'Ingredient', '', '', '', '', '0', '', '', '900', '2', 'kg', '2368', '');
INSERT INTO inventory VALUES ('187', 'equipment', '1A', '0', '', '', 'Nescafe Riche', '', 'Ingredient', '', '', '', '', '0', '', '', '855', '1', '475gms', '500', '');
INSERT INTO inventory VALUES ('188', 'equipment', '1A', '0', '', '131.png', 'Biadgi Dark Chocolate Sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '1340', '10', '1.89', '0', '');
INSERT INTO inventory VALUES ('189', 'equipment', '1A', '0', '', '132.png', 'Biadgi White Chocolate Sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '1340', '9', '1.89', '17557ml', '');
INSERT INTO inventory VALUES ('190', 'equipment', '1A', '0', '', '133.png', 'Allegro Vanilla Powder', '', 'Ingredient', '', '', '', '', '0', '', '', '698', '28', '0', '0', '');
INSERT INTO inventory VALUES ('191', 'equipment', '1A', '0', '', '134.png', 'Allegro Matcha Powder', '', 'Ingredient', '', '', '', '', '0', '', '', '925', '40', '0', '0', '');
INSERT INTO inventory VALUES ('192', 'equipment', '1A', '0', '', '135.jpg', 'Lemonsito Puree', '', 'Ingredient', '', '', '', '', '0', '', '', '275', '34', '0', '0', '');
INSERT INTO inventory VALUES ('193', 'equipment', '1A', '0', '', '136.png', 'Allegro Strawberry Ripple', '', 'Ingredient', '', '', '', '', '0', '', '', '759', '11', '0', '0', '');
INSERT INTO inventory VALUES ('194', 'equipment', '1A', '0', '', '137.png', 'Allegro  Kiwi Ripple', '', 'Ingredient', '', '', '', '', '0', '', '', '760', '11', '0', '0', '');
INSERT INTO inventory VALUES ('195', 'equipment', '1A', '0', '', '138.png', 'Allegro Blueberry Ripple', '', 'Ingredient', '', '', '', '', '0', '', '', '760', '12', '0', '0', '');
INSERT INTO inventory VALUES ('196', 'equipment', '1A', '0', '', '139.jpg', 'Allegro Lemon Ginger tea', '', 'Ingredient', '', '', '', '', '0', '', '', '200', '11', '0', '0', '');
INSERT INTO inventory VALUES ('197', 'equipment', '1A', '0', '', '140.jpeg', 'Allegro Mint tea', '', 'Ingredient', '', '', '', '', '0', '', '', '200', '8', '0', '0', '');
INSERT INTO inventory VALUES ('198', 'equipment', '1A', '0', '', '141.jpg', 'Allegro Green tea', '', 'Ingredient', '', '', '', '', '0', '', '', '200', '9', '0', '0', '');
INSERT INTO inventory VALUES ('199', 'equipment', '1A', '0', '', '142.jpg', 'Allegro Earl Grey', '', 'Ingredient', '', '', '', '', '0', '', '', '200', '1', '0', '0', '');
INSERT INTO inventory VALUES ('200', 'equipment', '1A', '0', '', '143.jpeg', '1883 Routin Salted Caramel Syrup', '', 'Ingredient', '', '', '', '', '0', '', '', '780', '6', '1', '0', '');
INSERT INTO inventory VALUES ('201', 'equipment', '1A', '0', '', '144.jpeg', '1883 Routin Hazel Nut Chocolate', '', 'Ingredient', '', '', '', '', '0', '', '', '780', '3', '1', '0', '');
INSERT INTO inventory VALUES ('202', 'equipment', '1A', '0', '', '145.png', '1883 Routin Hazel Nut Chocolate Bar', '', 'Ingredient', '', '', '', '', '0', '', '', '780', '5', '1', '0', '');
INSERT INTO inventory VALUES ('203', 'equipment', '1A', '0', '', '146.jpeg', '1883 Routin Vanilla', '', 'Ingredient', '', '', '', '', '0', '', '', '780', '21', '1', '0', '');
INSERT INTO inventory VALUES ('204', 'equipment', '1A', '0', '', '147.jpeg', '1883 Routin Peppermint', '', 'Ingredient', '', '', '', '', '0', '', '', '780', '5', '1', '0', '');
INSERT INTO inventory VALUES ('205', 'equipment', '1A', '0', '', '148.jpeg', '1883 Routin Popcorn', '', 'Ingredient', '', '', '', '', '0', '', '', '780', '9', '1', '0', '');
INSERT INTO inventory VALUES ('206', 'equipment', '1A', '0', '', '150.jpeg', '1883 Routin Macademia', '', 'Ingredient', '', '', '', '', '0', '', '', '780', '8', '1', '0', '');
INSERT INTO inventory VALUES ('207', 'equipment', '1A', '0', '', '149.jpeg', '1883 Routin Irish Crème', '', 'Ingredient', '', '', '', '', '0', '', '', '780', '6', '1', '0', '');
INSERT INTO inventory VALUES ('208', 'equipment', '1A', '0', '', '151.jpeg', '1883 Routin Caramel', '', 'Ingredient', '', '', '', '', '0', '', '', '780', '5', '1', '0', '');
INSERT INTO inventory VALUES ('209', 'equipment', 'C3', '0', '', '', 'Allegro Strawberry Gourmet', '', 'Ingredient', '', '', '', '', '0', '', '', '395', '3', '750ml', '0', '');
INSERT INTO inventory VALUES ('210', 'equipment', 'C3', '0', '', '', 'Mandarin Orange ', '', 'Ingredient', '', '', '', '', '0', '', '', '90', '4', '1.5L', '0', '');
INSERT INTO inventory VALUES ('211', 'equipment', 'C3', '0', '', '', 'Allegro Oatside Barista Milk', '', 'Ingredient', '', '', '', '', '0', '', '', '380', '38', '1L', '0', '');
INSERT INTO inventory VALUES ('212', 'equipment', 'C3', '0', '', '', 'Allegro Oatside Chocolate', '', 'Ingredient', '', '', '', '', '0', '', '', '400', '30', '1L', '0', '');
INSERT INTO inventory VALUES ('213', 'equipment', 'C3', '0', '', '', 'Carnation Condensed Milk', '', 'Ingredient', '', '', '', '', '0', '', '', '72', '10', '388g', '0', '');
INSERT INTO inventory VALUES ('214', 'equipment', 'C3', '0', '', '', 'Classic Sweetened Condensed', '', 'Ingredient', '', '', '', '', '0', '', '', '68.4', '6', '377g', '0', '');
INSERT INTO inventory VALUES ('215', 'equipment', 'C3', '0', '', '', 'DLA Naturals Strawberry Filling & Topping', '', 'Ingredient', '', '', '', '', '0', '', '', '235', '7', '610g', '0', '');
INSERT INTO inventory VALUES ('216', 'equipment', 'C3', '0', '', '', 'Duncan Hines Original Blueberry Pie Filling', '', 'Ingredient', '', '', '', '', '0', '', '', '254', '5', '595g', '0', '');
INSERT INTO inventory VALUES ('217', 'equipment', 'C3', '0', '', '', 'Olivia Pie Filling Topping', '', 'Ingredient', '', '', '', '', '0', '', '', '290', '1', '595g', '0', '');
INSERT INTO inventory VALUES ('218', 'menu_item', '', '0', '', '85.jpg', 'Oat milk Macadamia Iced', '', 'Drinks', 'Coffee', '', '', '', '0', 'Best Seller', '', '190', '872', '', '', '');
INSERT INTO inventory VALUES ('219', 'menu_item', '', '0', '', '', 'Peppermint Mocha Iced', '', 'Drinks', 'Coffee', '', '', '', '0', '', '', '180', '975', '', '', '');
INSERT INTO inventory VALUES ('220', 'menu_item', '', '0', '', '', 'Additional Espresso shot', '', 'Others', '', '', '', '', '0', '', '', '30', '999', '', '', '');
INSERT INTO inventory VALUES ('221', 'equipment', 'FA', '0', '', '', 'Eco Prima 48-plate Jackstack trolley', '', 'Kitchen Equipment', '', '', '', '', '0', '', '', '22500', '1', 'Pc', '0', '');
INSERT INTO inventory VALUES ('222', 'equipment', 'FA', '0', '', '', 'Eco Prima Wood Sugar Creamer Case', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '4800', '1', 'Pc', '0', '');
INSERT INTO inventory VALUES ('223', 'equipment', 'FA', '0', '', '', 'Eco Prima 3-Layer Wooden Stand', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '6000', '1', 'Pc', '0', '');
INSERT INTO inventory VALUES ('224', 'equipment', 'FA', '0', '', '', 'Eco Prima Bread Display (265x325x200)', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '6780', '1', 'Pc', '0', '');
INSERT INTO inventory VALUES ('225', 'equipment', 'FA', '0', '', '', 'Eco Prima Bread Display (265x325x120)', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '6300', '1', 'Pc', '0', '');
INSERT INTO inventory VALUES ('226', 'equipment', 'FA', '0', '', '', 'Eco Prima Medium Light Brown Wood Crate 300x180', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '3000', '1', 'Pc', '0', '');
INSERT INTO inventory VALUES ('227', 'equipment', 'FA', '0', '', '', 'Eco Prima Large Light Brown Wood Crate 300x260', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '3900', '1', 'Pc', '0', '');
INSERT INTO inventory VALUES ('228', 'equipment', 'FA', '0', '', '', 'Eco Prima XL Light Brown Wood Crate 230x460', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '5750', '1', 'Pc', '0', '');
INSERT INTO inventory VALUES ('229', 'equipment', 'FA', '0', '', '', 'Chicken Fry Basket', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '2880', '1', 'Pc', '0', '');
INSERT INTO inventory VALUES ('230', 'equipment', 'FA', '0', '', '', 'Thin Fry Basket', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '3000', '1', 'Pc', '0', '');
INSERT INTO inventory VALUES ('231', 'equipment', 'FA', '0', '', '', 'Round platter - bamboo', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '299.25', '12', 'Pc', '0', '');
INSERT INTO inventory VALUES ('232', 'equipment', 'FA', '0', '', '', 'Pizza cutter', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '115', '2', 'Pc', '0', '');
INSERT INTO inventory VALUES ('233', 'equipment', 'FA', '0', '', '', 'Saucer dish - porcelain ', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '25', '42', 'Pc', '0', '');
INSERT INTO inventory VALUES ('234', 'equipment', 'FA', '0', '', '', 'Square sizzling plate with wooden handle', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '540', '1', 'Pc', '0 ', '');
INSERT INTO inventory VALUES ('235', 'equipment', 'FA', '0', '', '', 'Round tray fiber', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '249', '10', 'Pc', '0', '');
INSERT INTO inventory VALUES ('236', 'equipment', 'FA', '0', '', '', 'Winox Borosilicate Double Wall', '', 'Drinkware', '', '', '', '', '0', '', '', '249.75', '9', 'Pc', '0', '');
INSERT INTO inventory VALUES ('237', 'equipment', 'FA', '0', '', '', 'Mandolin Slicer (Smart Multifunctional) ', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '4000', '1', 'Pc', '0', '');
INSERT INTO inventory VALUES ('238', 'equipment', 'FA', '0', '', '', '1L White Squeeze Bottle Dispenser', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '120', '2', 'Pc', '0', '');
INSERT INTO inventory VALUES ('239', 'equipment', 'FA', '0', '', '', '16.5in Heatproof Spatula', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '750', '1', 'Pc', '0', '');
INSERT INTO inventory VALUES ('240', 'equipment', 'FA', '0', '', '', 'Pepper Mill 8in', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '420', '1', 'Pc', '0', '');
INSERT INTO inventory VALUES ('241', 'equipment', 'FA', '0', '', '', 'Egg Slicer', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '935', '1', 'Pc', '0', '');
INSERT INTO inventory VALUES ('242', 'equipment', 'FA', '0', '', '', 'Can opener (Black grip) ', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '800', '1', 'Pc', '0', '');
INSERT INTO inventory VALUES ('243', 'equipment', 'FA', '0', '', '', 'Ice Cream Scooper (2,5x2 Non-Stick)', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '340', '2', 'Pc', '0', '');
INSERT INTO inventory VALUES ('244', 'equipment', 'FA', '0', '', '', 'Curved grater', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '380', '1', 'Pc', '0', '');
INSERT INTO inventory VALUES ('245', 'equipment', 'FA', '0', '', '', 'Fish scaler', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '180', '1', 'Pc', '0', '');
INSERT INTO inventory VALUES ('246', 'equipment', 'C3', '0', '', '', 'Cinnamon Toast Crunch', '', 'Ingredient', '', '', '', '', '0', '', '', '723', '3', '1.4kg', '', '');
INSERT INTO inventory VALUES ('247', 'equipment', 'C3', '0', '', '', 'Almonds Cereal', '', 'Ingredient', '', '', '', '', '0', '', '', '380', '1', '300gms', '', '');
INSERT INTO inventory VALUES ('248', 'equipment', 'C3', '0', '', '', 'Act 11 Butter Flavor', '', 'Ingredient', '', '', '', '', '0', '', '', '179.8', '2', '255gms', '', '');
INSERT INTO inventory VALUES ('249', 'equipment', 'C3', '0', '', '', 'Chocolate Forest Mini Wafer', '', 'Ingredient', '', '', '', '', '0', '', '', '359', '6', '100gms', '', '');
INSERT INTO inventory VALUES ('250', 'equipment', 'C3', '0', '', '', 'Piknik ', '', 'Ingredient', '', '', '', '', '0', '', '', '255', '1', '396gms', '', '');
INSERT INTO inventory VALUES ('251', 'equipment', 'C3', '0', '', '', 'Oreo Choco Coated ', '', 'Ingredient', '', '', '', '', '0', '', '', '75', '1', '200gms', '', '');
INSERT INTO inventory VALUES ('252', 'equipment', 'C3', '0', '', '', 'Crushed  Graham', '', 'Ingredient', '', '', '', '', '0', '', '', '212', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('253', 'equipment', 'C3', '0', '', '', 'Oreo Crush', '', 'Ingredient', '', '', '', '', '0', '', '', '162', '3', '54gms', '', '');
INSERT INTO inventory VALUES ('254', 'equipment', 'C3', '0', '', '', 'Natural Cracker Sour Cream & Chives', '', 'Ingredient', '', '', '', '', '0', '', '', '299', '1', '160gms', '', '');
INSERT INTO inventory VALUES ('255', 'equipment', 'C3', '0', '', '', 'Natural Cracker Farm House CHeddar', '', 'Ingredient', '', '', '', '', '0', '', '', '299', '1', '160gms', '', '');
INSERT INTO inventory VALUES ('256', 'equipment', 'C3', '0', '', '', 'Truffetes Tuiles', '', 'Ingredient', '', '', '', '', '0', '', '', '398', '3', '125gms', '', '');
INSERT INTO inventory VALUES ('257', 'equipment', 'C3', '0', '', '', 'Chocolate Chips  200gms', '', 'Ingredient', '', '', '', '', '0', '', '', '168', '1', '200gms', '', '');
INSERT INTO inventory VALUES ('258', 'equipment', 'C3', '0', '', '', 'Chocolate Stone', '', 'Ingredient', '', '', '', '', '0', '', '', '250', '1', '200gms', '', '');
INSERT INTO inventory VALUES ('259', 'equipment', 'C3', '0', '', '', 'Kraspers Bread Crumbs', '', 'Ingredient', '', '', '', '', '0', '', '', '131', '4', '1kg', '', '');
INSERT INTO inventory VALUES ('260', 'equipment', 'C3', '0', '', '', 'The Original SAF Instant', '', 'Ingredient', '', '', '', '', '0', '', '', '211', '1', '500g', '', '');
INSERT INTO inventory VALUES ('261', 'equipment', 'C3', '0', '', '', 'Puratos Sweet Glaze', '', 'Ingredient', '', '', '', '', '0', '', '', '296', '2', '1L', '', '');
INSERT INTO inventory VALUES ('262', 'equipment', 'C3', '0', '', '', 'Peotraco Caster Sugar ', '', 'Ingredient', '', '', '', '', '0', '', '', '70', '1', '1L', '', '');
INSERT INTO inventory VALUES ('263', 'equipment', 'C3', '0', '', '', 'Puratos Ambiente Plant based whippable topping', '', 'Ingredient', '', '', '', '', '0', '', '', '267.75', '2', '1L', '', '');
INSERT INTO inventory VALUES ('264', 'equipment', 'C3', '0', '', '', 'Hersheys Cocoa', '', 'Ingredient', '', '', '', '', '0', '', '', '402', '1', '650g', '', '');
INSERT INTO inventory VALUES ('265', 'equipment', 'D2', '0', '', '', 'Rice Noodles', '', 'Ingredient', '', '', '', '', '0', '', '', '336', '1', '454G', '', '');
INSERT INTO inventory VALUES ('266', 'equipment', 'D2', '0', '', '', 'Xiangnian Henan Traditional Sliced noodles', '', 'Ingredient', '', '', '', '', '0', '', '', '60', '2', '454g', '', '');
INSERT INTO inventory VALUES ('267', 'equipment', 'D2', '0', '', '', 'Perfect Earth Organic Chia Pasta', '', 'Ingredient', '', '', '', '', '0', '', '', '140', '1', '225g', '', '');
INSERT INTO inventory VALUES ('268', 'equipment', 'D3', '0', '', '', 'Todays Mixed Fruits', '', 'Ingredient', '', '', '', '', '0', '', '', '226', '1', '3033kg', '', '');
INSERT INTO inventory VALUES ('269', 'equipment', 'D4', '0', '', '', 'Franks Red Hot Sauce ', '', 'Ingredient', '', '', '', '', '0', '', '', '1319', '2', '3.78L', '', '');
INSERT INTO inventory VALUES ('270', 'equipment', 'D5', '0', '', '', 'Knorr Liquid Seasoning', '', 'Ingredient', '', '', '', '', '0', '', '', '1135', '1', '1gal', '', '');
INSERT INTO inventory VALUES ('271', 'equipment', 'D5', '0', '', '', 'Star Margarine Classic', '', 'Ingredient', '', '', '', '', '0', '', '', '493', '2', 'tub', '', '');
INSERT INTO inventory VALUES ('272', 'equipment', 'FA', '0', '', '', '8IN DOUBLE SIDED MEAT TENDERIZER MALLET', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '900', '1', 'PC', '0', '');
INSERT INTO inventory VALUES ('273', 'equipment', 'FA', '0', '', '', 'TRANSPARENT HANDLE SILICON BRUSH ', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '180', '2', 'PC', '0', '');
INSERT INTO inventory VALUES ('274', 'equipment', 'FA', '0', '', '', 'YELLOW LEMON HAND JUICER', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '250', '1', 'PC', '0', '');
INSERT INTO inventory VALUES ('275', 'equipment', 'FA', '0', '', '', 'FRUIT AND VEG PEELER', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '250', '2', 'PC', '0', '');
INSERT INTO inventory VALUES ('276', 'equipment', 'FA', '0', '', '', 'PLAIN COLOR SILICON CUPCAKE MOLD', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '30', '12', 'PC', '0', '');
INSERT INTO inventory VALUES ('277', 'equipment', 'FA', '0', '', '', 'BLACK GRIP GARLIC PRESS MINCER', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '330', '1', 'PC', '0', '');
INSERT INTO inventory VALUES ('278', 'equipment', 'FA', '0', '', '', '8IN BLACK/GREEN STONE PLATE', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '290', '13', 'PC', '0', '');
INSERT INTO inventory VALUES ('279', 'equipment', 'FA', '0', '', '', '3*3 IN BLACK/GREEN STONE CUP', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '120', '1', 'PC', '0', '');
INSERT INTO inventory VALUES ('280', 'equipment', 'FA', '0', '', '', 'SML ROUND CAST IRON BOWL WITH WOOD COVER', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '980', '1', 'PC', '0', '');
INSERT INTO inventory VALUES ('281', 'equipment', 'C5', '0', '', '', 'Tabasco', '', 'Ingredient', '', '', '', '', '0', '', '', '293', '7', '150ml', '', '');
INSERT INTO inventory VALUES ('282', 'equipment', 'C5', '0', '', '', 'Jincing Shaoxing Hua Diao Rice Wine', '', 'Ingredient', '', '', '', '', '0', '', '', '409', '13', '750ml', '', '');
INSERT INTO inventory VALUES ('283', 'equipment', 'C5', '0', '', '', 'Lee Kum Kee Oyster Sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '218', '1', '907g', '', '');
INSERT INTO inventory VALUES ('284', 'equipment', 'C5', '0', '', '', 'ABC Saus Manis Sweet Sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '295', '1', '620ml', '', '');
INSERT INTO inventory VALUES ('285', 'equipment', 'C5', '0', '', '', 'Guangdong Famous Superior light Soy Sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '250', '1', '300ml', '', '');
INSERT INTO inventory VALUES ('286', 'equipment', 'C5', '0', '', '', 'Lee Kum Kee Selected 5 Spices Marinade', '', 'Ingredient', '', '', '', '', '0', '', '', '165.5', '1', '410ml', '', '');
INSERT INTO inventory VALUES ('287', 'equipment', 'C5', '0', '', '', 'Lea & Perrins Worcestershire Sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '232.6', '1', '290ml', '', '');
INSERT INTO inventory VALUES ('288', 'equipment', 'C5', '0', '', '', 'Suree Fish Sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '140', '2', '690ml', '', '');
INSERT INTO inventory VALUES ('289', 'equipment', 'C5', '0', '', '', 'Pee Thai Fish Sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '320', '1', '690ml', '', '');
INSERT INTO inventory VALUES ('290', 'equipment', 'C5', '0', '', '', 'Pagoda Brand Shao Hsing Tiao Chiew', '', 'Ingredient', '', '', '', '', '0', '', '', '385', '2', '640ml', '', '');
INSERT INTO inventory VALUES ('291', 'equipment', 'C5', '0', '', '', 'Suree Sweet Chiwi Dipping Sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '169', '2', '690ml', '', '');
INSERT INTO inventory VALUES ('292', 'equipment', 'C5', '0', '', '', 'Suree Sweet Sour Sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '169', '18', '690ml', '', '');
INSERT INTO inventory VALUES ('293', 'equipment', 'C2', '0', '', '', 'Coco Mama', '', 'Ingredient', '', '', '', '', '0', '', '', '31.25', '5', '200ml', '', '');
INSERT INTO inventory VALUES ('294', 'equipment', 'C2', '0', '', '', 'Kraft Tartar Sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '279', '4', '354ml', '', '');
INSERT INTO inventory VALUES ('295', 'equipment', 'C2', '0', '', '', 'Silver Swan Salted Black Beans', '', 'Ingredient', '', '', '', '', '0', '', '', '39', '3', '100g', '', '');
INSERT INTO inventory VALUES ('296', 'equipment', 'C2', '0', '', '', 'Mindanao Bukidnon Honey', '', 'Ingredient', '', '', '', '', '0', '', '', '362', '4', '410 ml', '', '');
INSERT INTO inventory VALUES ('297', 'equipment', 'C2', '0', '', '', 'Sabatino Tarufi Truffled Hot Sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '599', '1', '283.5ml', '', '');
INSERT INTO inventory VALUES ('298', 'equipment', 'C2', '0', '', '', 'Wasabi Paste', '', 'Ingredient', '', '', '', '', '0', '', '', '449', '1', '175g', '', '');
INSERT INTO inventory VALUES ('299', 'equipment', 'C2', '0', '', '', 'Wasabi Paste', '', 'Ingredient', '', '', '', '', '0', '', '', '449', '1', '175g', '', '');
INSERT INTO inventory VALUES ('300', 'equipment', 'C2', '0', '', '', 'A1 Sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '192', '2', '425g', '', '');
INSERT INTO inventory VALUES ('301', 'equipment', 'C2', '0', '', '', 'Bohol Bee Farm Honeyed Hot Sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '280', '1', '250ml', '', '');
INSERT INTO inventory VALUES ('302', 'equipment', 'C2', '0', '', '', 'Lugio Turtufo Olive Oil', '', 'Ingredient', '', '', '', '', '0', '', '', '695', '1', '250ml', '', '');
INSERT INTO inventory VALUES ('303', 'equipment', 'C2', '0', '', '', 'Bella Sun Lugi California Vinagrette', '', 'Ingredient', '', '', '', '', '0', '', '', '1010', '2', '354ml', '', '');
INSERT INTO inventory VALUES ('304', 'equipment', 'C2', '0', '', '', 'Yamagen Sweet Sushi Sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '349', '1', '95g', '', '');
INSERT INTO inventory VALUES ('305', 'equipment', 'C2', '0', '', '', 'Yamagen Sweet Sushi Sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '349', '1', '95g', '', '');
INSERT INTO inventory VALUES ('306', 'equipment', 'C2', '0', '', '', 'Tuna Intestine Dayok Appetizer', '', 'Ingredient', '', '', '', '', '0', '', '', '70', '1', '180ml', '', '');
INSERT INTO inventory VALUES ('307', 'equipment', 'C2', '0', '', '', 'Mothers Best Hot Sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '26.95', '1', '95g', '', '');
INSERT INTO inventory VALUES ('308', 'equipment', 'C2', '0', '', '', 'Bez Acre Tugnos Salted Fish', '', 'Ingredient', '', '', '', '', '0', '', '', '170', '1', '130ml', '', '');
INSERT INTO inventory VALUES ('309', 'equipment', 'C2', '0', '', '', 'Knorr Liquid Seasoning Chili', '', 'Ingredient', '', '', '', '', '0', '', '', '59', '1', '130ml', '', '');
INSERT INTO inventory VALUES ('310', 'equipment', 'C2', '0', '', '', 'Fish Intestine', '', 'Ingredient', '', '', '', '', '0', '', '', '32.5', '1', '280g', '', '');
INSERT INTO inventory VALUES ('311', 'equipment', 'C2', '0', '', '', 'LA Terra Det Sapora Anchovy Fillet 440g', '', 'Ingredient', '', '', '', '', '0', '', '', '330', '3', '440g', '', '');
INSERT INTO inventory VALUES ('312', 'equipment', 'C2', '0', '', '', 'Gourmet Ginamos', '', 'Ingredient', '', '', '', '', '0', '', '', '120', '3', '245g', '', '');
INSERT INTO inventory VALUES ('313', 'equipment', 'C2', '0', '', '', 'Kweichow Foods Chili Paste Garlic ', '', 'Ingredient', '', '', '', '', '0', '', '', '180', '1', '245g', '', '');
INSERT INTO inventory VALUES ('314', 'equipment', 'C2', '0', '', '', 'Tamarind Paste Dee Thai', '', 'Ingredient', '', '', '', '', '0', '', '', '108', '2', '227g', '', '');
INSERT INTO inventory VALUES ('315', 'equipment', 'C2', '0', '', '', 'Maintal Rose Hip Front Spread', '', 'Ingredient', '', '', '', '', '0', '', '', '188', '1', '300g', '', '');
INSERT INTO inventory VALUES ('316', 'equipment', 'C2', '0', '', '', 'Nortindal Cuttle Fish Ink', '', 'Ingredient', '', '', '', '', '0', '', '', '825', '2', '468g', '', '');
INSERT INTO inventory VALUES ('317', 'equipment', 'C2', '0', '', '', 'Baishanzu Shitake Mushroom Sauce ', '', 'Ingredient', '', '', '', '', '0', '', '', '249', '6', '500g', '', '');
INSERT INTO inventory VALUES ('318', 'equipment', 'C2', '0', '', '', 'Lee Kum Kee Toban Djan', '', 'Ingredient', '', '', '', '', '0', '', '', '300', '1', '368g', '', '');
INSERT INTO inventory VALUES ('319', 'equipment', 'C2', '0', '', '', 'Sanoma Gourmet Pizza Sauce Organic', '', 'Ingredient', '', '', '', '', '0', '', '', '429', '1', '468g', '', '');
INSERT INTO inventory VALUES ('320', 'equipment', 'C2', '0', '', '', 'Mc Cormick Cream of Tartar', '', 'Ingredient', '', '', '', '', '0', '', '', '82', '1', '45g', '', '');
INSERT INTO inventory VALUES ('321', 'equipment', 'C2', '0', '', '', 'Mc Cormick Spanish Paprika Ground', '', 'Ingredient', '', '', '', '', '0', '', '', '93.65', '2', '34g', '', '');
INSERT INTO inventory VALUES ('322', 'equipment', 'C2', '0', '', '', 'Mc Cormick Meat Tenderizer', '', 'Ingredient', '', '', '', '', '0', '', '', '49', '2', '60g', '', '');
INSERT INTO inventory VALUES ('323', 'equipment', 'C2', '0', '', '', 'Master Foods Chili Flakes', '', 'Ingredient', '', '', '', '', '0', '', '', '110', '1', '18g', '', '');
INSERT INTO inventory VALUES ('324', 'equipment', 'C2', '0', '', '', 'Lee Kum Kee Hoisin Sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '166.95', '2', '240g', '', '');
INSERT INTO inventory VALUES ('325', 'equipment', 'C2', '0', '', '', 'Colmans Mustard Mint Sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '109', '5', '240g', '', '');
INSERT INTO inventory VALUES ('326', 'equipment', 'C2', '0', '', '', 'Master Foods Mint Jelly', '', 'Ingredient', '', '', '', '', '0', '', '', '132.5', '3', '290g', '', '');
INSERT INTO inventory VALUES ('327', 'equipment', 'C2', '0', '', '', 'Alaska Condensada', '', 'Ingredient', '', '', '', '', '0', '', '', '36', '10', '370g', '', '');
INSERT INTO inventory VALUES ('328', 'equipment', 'C2', '0', '', '', 'Century Tuna Lite', '', 'Ingredient', '', '', '', '', '0', '', '', '59.6', '12', '180g', '', '');
INSERT INTO inventory VALUES ('329', 'equipment', 'C2', '0', '', '', 'Mega Sardines in Tomato Sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '25', '3', '180g', '', '');
INSERT INTO inventory VALUES ('330', 'equipment', 'C2', '0', '', '', 'Hormel Chili with Beans', '', 'Ingredient', '', '', '', '', '0', '', '', '279', '1', '425g', '', '');
INSERT INTO inventory VALUES ('331', 'equipment', 'C2', '0', '', '', 'Weini Foodstuff Pork Floss', '', 'Ingredient', '', '', '', '', '0', '', '', '582', '1', '200g', '', '');
INSERT INTO inventory VALUES ('332', 'equipment', 'C2', '0', '', '', 'Jolly Shitake Mushroom', '', 'Ingredient', '', '', '', '', '0', '', '', '36.8', '2', '198g', '', '');
INSERT INTO inventory VALUES ('333', 'equipment', 'C2', '0', '', '', 'Purefoods Liver Spread', '', 'Ingredient', '', '', '', '', '0', '', '', '31.5', '7', '85g', '', '');
INSERT INTO inventory VALUES ('334', 'equipment', 'C2', '0', '', '', 'Lotte Foods Luncheon Meat Chicken', '', 'Ingredient', '', '', '', '', '0', '', '', '178', '1', '340g', '', '');
INSERT INTO inventory VALUES ('335', 'equipment', 'C2', '0', '', '', 'Angel Evaporada', '', 'Ingredient', '', '', '', '', '0', '', '', '39', '1', '410ml', '', '');
INSERT INTO inventory VALUES ('336', 'equipment', 'C2', '0', '', '', 'Todays Mixed Fruit', '', 'Ingredient', '', '', '', '', '0', '', '', '60', '1', '432g', '', '');
INSERT INTO inventory VALUES ('337', 'equipment', 'C2', '0', '', '', 'Del Monte Quality Pineapple Tidbits ', '', 'Ingredient', '', '', '', '', '0', '', '', '98.5', '1', '822G', '', '');
INSERT INTO inventory VALUES ('338', 'equipment', 'C1', '0', '', '', 'Winter Harvest Roasted seaweed', '', 'Ingredient', '', '', '', '', '0', '', '', '65', '14', '12G', '', '');
INSERT INTO inventory VALUES ('339', 'equipment', 'C1', '0', '', '', 'Guandy Marsmallows', '', 'Ingredient', '', '', '', '', '0', '', '', '180', '2', '340g', '', '');
INSERT INTO inventory VALUES ('340', 'equipment', 'C1', '0', '', '', 'Mello Marsmallow', '', 'Ingredient', '', '', '', '', '0', '', '', '160', '1', '680g', '', '');
INSERT INTO inventory VALUES ('341', 'equipment', 'C1', '0', '', '', 'Ottogi Cut Seaweed', '', 'Ingredient', '', '', '', '', '0', '', '', '169', '1', '50g', '', '');
INSERT INTO inventory VALUES ('342', 'equipment', 'C1', '0', '', '', 'Roasted Seaweed with Sesame', '', 'Ingredient', '', '', '', '', '0', '', '', '219', '1', '70g', '', '');
INSERT INTO inventory VALUES ('343', 'equipment', 'C1', '0', '', '', 'Reksu Hot Cake Mix', '', 'Ingredient', '', '', '', '', '0', '', '', '71.4', '1', '400g', '', '');
INSERT INTO inventory VALUES ('344', 'equipment', 'C1', '0', '', '', 'Innobake Ube Powder purple yam', '', 'Ingredient', '', '', '', '', '0', '', '', '370', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('345', 'equipment', 'C1', '0', '', '', 'Sweet House Baking Supplies Crm of TarTar', '', 'Ingredient', '', '', '', '', '0', '', '', '255', '1', '500g', '', '');
INSERT INTO inventory VALUES ('346', 'equipment', 'C1', '0', '', '', 'Sweet House Baking Supplies Crm of TarTar', '', 'Ingredient', '', '', '', '', '0', '', '', '255', '1', '500g', '', '');
INSERT INTO inventory VALUES ('347', 'equipment', 'C1', '0', '', '', 'Caro& Marie Xanthan Gum', '', 'Ingredient', '', '', '', '', '0', '', '', '300', '1', '250g', '', '');
INSERT INTO inventory VALUES ('348', 'equipment', 'C1', '0', '', '', 'Stevia Sugar Blend Sugarlyte', '', 'Ingredient', '', '', '', '', '0', '', '', '98', '1', '250g', '', '');
INSERT INTO inventory VALUES ('349', 'equipment', 'C1', '0', '', '', 'Gogo Quinda White Blanc', '', 'Ingredient', '', '', '', '', '0', '', '', '975', '1', '1.81kg', '', '');
INSERT INTO inventory VALUES ('350', 'equipment', 'C1', '0', '', '', 'Sweet House Baking Supplies All Matcha Powder', '', 'Ingredient', '', '', '', '', '0', '', '', '236', '1', '100g', '', '');
INSERT INTO inventory VALUES ('351', 'equipment', 'C1', '0', '', '', 'Décor-IT Sprinkles', '', 'Ingredient', '', '', '', '', '0', '', '', '195', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('352', 'equipment', 'C1', '0', '', '', 'Bakersfield Fudge it Caramel', '', 'Ingredient', '', '', '', '', '0', '', '', '330', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('353', 'equipment', 'C1', '0', '', '', 'Finissimo Premium Super Fudge Yema', '', 'Ingredient', '', '', '', '', '0', '', '', '315', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('354', 'equipment', 'C1', '0', '', '', 'Monin Yogurt Smoothie base', '', 'Ingredient', '', '', '', '', '0', '', '', '899', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('355', 'equipment', 'C1', '0', '', '', 'La Creama Salted Caramel Fudge ', '', 'Ingredient', '', '', '', '', '0', '', '', '240', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('356', 'equipment', 'C1', '0', '', '', 'Sweet House Baking Supplies Almond Flour', '', 'Ingredient', '', '', '', '', '0', '', '', '240', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('357', 'equipment', 'C1', '0', '', '', 'No Brand Buko Pandan', '', 'Ingredient', '', '', '', '', '0', '', '', '425', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('358', 'equipment', 'C1', '0', '', '', 'No Brand Salted Caramel Powder flavor', '', 'Ingredient', '', '', '', '', '0', '', '', '260', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('360', 'equipment', 'C1', '0', '', '', 'Desert Rose Rice Flour', '', 'Ingredient', '', '', '', '', '0', '', '', '229', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('361', 'equipment', 'C1', '0', '', '', 'Caro & Marie Rice Flour', '', 'Ingredient', '', '', '', '', '0', '', '', '50', '2', '500g', '', '');
INSERT INTO inventory VALUES ('362', 'equipment', 'C1', '0', '', '', 'Moulin Rouge Holland Potato Starch Wonder Powder', '', 'Ingredient', '', '', '', '', '0', '', '', '125', '6', '500g', '', '');
INSERT INTO inventory VALUES ('363', 'equipment', 'C1', '0', '', '', 'HN Foods Pumpkin seeds', '', 'Ingredient', '', '', '', '', '0', '', '', '100', '4', '50g', '', '');
INSERT INTO inventory VALUES ('364', 'equipment', 'C1', '0', '', '', 'HN Foods chocolate stone', '', 'Ingredient', '', '', '', '', '0', '', '', '150', '2', '150g', '', '');
INSERT INTO inventory VALUES ('365', 'equipment', 'C1', '0', '', '', 'HN Foods Colored Vermicelli', '', 'Ingredient', '', '', '', '', '0', '', '', '180', '1', '250g', '', '');
INSERT INTO inventory VALUES ('366', 'equipment', 'C1', '0', '', '', 'HN Foods Chocolate Vermicelli', '', 'Ingredient', '', '', '', '', '0', '', '', '170', '2', '500g', '', '');
INSERT INTO inventory VALUES ('367', 'equipment', 'C1', '0', '', '', 'No Brand Rice Crispies', '', 'Ingredient', '', '', '', '', '0', '', '', '75', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('368', 'equipment', 'C1', '0', '', '', 'kai kitchen Fried Garlic slices', '', 'Ingredient', '', '', '', '', '0', '', '', '275', '1', '500g', '', '');
INSERT INTO inventory VALUES ('369', 'equipment', 'C1', '0', '', '', 'Sago', '', 'Ingredient', '', '', '', '', '0', '', '', '150', '2', '1kg', '', '');
INSERT INTO inventory VALUES ('370', 'equipment', 'C1', '0', '', '', 'Sago', '', 'Ingredient', '', '', '', '', '0', '', '', '60', '1', '500g', '', '');
INSERT INTO inventory VALUES ('371', 'equipment', 'C1', '0', '', '', 'RLB Organic Organic Coriander Seeds', '', 'Ingredient', '', '', '', '', '0', '', '', '99', '1', '100g', '', '');
INSERT INTO inventory VALUES ('372', 'equipment', 'C1', '0', '', '', 'Knorr cream of mushroom', '', 'Ingredient', '', '', '', '', '0', '', '', '53', '8', '62g', '', '');
INSERT INTO inventory VALUES ('373', 'equipment', 'C1', '0', '', '', 'MC Cormick mushroom gravy seasoning mix', '', 'Ingredient', '', '', '', '', '0', '', '', '27.1', '6', '25g', '', '');
INSERT INTO inventory VALUES ('374', 'equipment', 'C1', '0', '', '', 'MC Cormick chicken gravy seasoning mix', '', 'Ingredient', '', '', '', '', '0', '', '', '28', '11', '25g', '', '');
INSERT INTO inventory VALUES ('375', 'equipment', 'C1', '0', '', '', 'Sado Korean Seafoods stocks', '', 'Ingredient', '', '', '', '', '0', '', '', '90', '3', '90g', '', '');
INSERT INTO inventory VALUES ('376', 'equipment', 'C1', '0', '', '', 'Daesang Korean Fish Stocks', '', 'Ingredient', '', '', '', '', '0', '', '', '276', '3', '80g', '', '');
INSERT INTO inventory VALUES ('377', 'equipment', 'C1', '0', '', '', 'Beksol Korean Colagen Powder', '', 'Ingredient', '', '', '', '', '0', '', '', '376', '1', '500g', '', '');
INSERT INTO inventory VALUES ('378', 'equipment', 'E2', '0', '', '', 'Sunny Woods Harvesters Sinandomeng Rice', '', 'Kitchen Supplies', '', '', '', '', '0', '', '', '462', '1', '5kg', '', '');
INSERT INTO inventory VALUES ('379', 'equipment', 'E2', '0', '', '', 'Niigata Japanese Rice', '', 'Kitchen Supplies', '', '', '', '', '0', '', '', '170', '3', '1Kg', '', '');
INSERT INTO inventory VALUES ('381', 'equipment', 'E2', '0', '', '', 'Tabs Spices Banana Blossom', '', 'Ingredient', '', '', '', '', '0', '', '', '129', '2', '30g', '', '');
INSERT INTO inventory VALUES ('382', 'equipment', 'E2', '0', '', '', 'Aji-no-moto Umami Seasoning', '', 'Ingredient', '', '', '', '', '0', '', '', '221', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('383', 'equipment', 'E2', '0', '', '', 'Knorr Chicken Broth Cubes', '', 'Ingredient', '', '', '', '', '0', '', '', '318.2', '1', '600g', '', '');
INSERT INTO inventory VALUES ('384', 'equipment', 'E2', '0', '', '', 'Knorr Beef Broth Cubes', '', 'Ingredient', '', '', '', '', '0', '', '', '318.2', '1', '600g', '', '');
INSERT INTO inventory VALUES ('385', 'equipment', 'E2', '0', '', '', 'MC Cormick Iodized Salt', '', 'Ingredient', '', '', '', '', '0', '', '', '50', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('386', 'equipment', 'E2', '0', '', '', 'RAM California Seedless Raisins', '', 'Ingredient', '', '', '', '', '0', '', '', '96.7', '3', '200g', '', '');
INSERT INTO inventory VALUES ('387', 'equipment', 'E2', '0', '', '', 'Knorr Sinigang sa Sampalok Mix Original', '', 'Ingredient', '', '', '', '', '0', '', '', '66', '5', '44g', '', '');
INSERT INTO inventory VALUES ('388', 'equipment', 'E2', '0', '', '', 'Nestle All Purpose Cream', '', 'Ingredient', '', '', '', '', '0', '', '', '283', '2', '1L', '', '');
INSERT INTO inventory VALUES ('389', 'equipment', 'E2', '0', '', '', 'Brown Sugar', '', 'Ingredient', '', '', '', '', '0', '', '', '116', '2', '1kg', '', '');
INSERT INTO inventory VALUES ('390', 'equipment', 'FA', '0', '', '', '15CM CAST IRON ROUND SKILLET', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '520', '1', 'PC', '0', '');
INSERT INTO inventory VALUES ('391', 'equipment', 'FA', '0', '', '', '6-COMPARTMENT CONDIMENT TRAY DISPENSER', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '1500', '1', 'PC', '0', '');
INSERT INTO inventory VALUES ('392', 'equipment', 'FA', '0', '', '', '4-COMPARTMENT CONDIMENT TRAY DISPENSER', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '1500', '1', 'PC', '0', '');
INSERT INTO inventory VALUES ('393', 'equipment', 'FA', '0', '', '', 'MUFFIN MOLDER', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '250', '2', 'PC', '0', '');
INSERT INTO inventory VALUES ('394', 'equipment', 'FA', '0', '', '', 'CHEESE CLOTH', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '180', '3', 'PC', '0', '');
INSERT INTO inventory VALUES ('395', 'equipment', 'FA', '0', '', '', 'NS ROLLING PIN', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '300', '1', 'PC', '0', '');
INSERT INTO inventory VALUES ('396', 'equipment', 'FA', '0', '', '', 'WOODEN ROLLING PIN', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '200', '1', 'PC', '0', '');
INSERT INTO inventory VALUES ('397', 'equipment', 'FA', '0', '', '', 'MARINADE INJECTOR', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '110', '1', 'PC', '0', '');
INSERT INTO inventory VALUES ('398', 'equipment', 'E1', '0', '', '', 'S&R Jumbo Roll Tissue', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '435', '4', 'rolls', '', '');
INSERT INTO inventory VALUES ('399', 'equipment', 'E1', '0', '', '', 'Jade Bathroom Tissue', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '0', '434', '10', 'pc', '');
INSERT INTO inventory VALUES ('400', 'equipment', 'E1', '0', '', '', 'Baumann Temperature Glass Top Warming Tray', '', 'Kitchen Equipment', '', '', '', '', '0', '', '', '3695', '8', 'pc', '', '');
INSERT INTO inventory VALUES ('402', 'equipment', 'E3', '0', '', '', 'Cheers Flat Napkin / Table Napkins', '', 'Tableware', '', '', '', '', '0', '', '', '67', '32', 'pack', '', '');
INSERT INTO inventory VALUES ('404', 'equipment', 'E3', '0', '', '', 'Baking paper', '', 'Kitchen Supplies', '', '', '', '', '0', '', '', '80', '1', 'pack', '', '');
INSERT INTO inventory VALUES ('406', 'equipment', 'E4', '0', '', '', 'Parchment Paper', '', 'Kitchen Supplies', '', '', '', '', '0', '', '', '45', '13', '100pcs', '', '');
INSERT INTO inventory VALUES ('407', 'equipment', 'E4', '0', '', '', 'Kraft Paper #80', '', 'FOH Tools', '', '', '', '', '0', '', '', '170', '1', '36X48 10s', '', '');
INSERT INTO inventory VALUES ('408', 'equipment', 'E4', '0', '', '', 'Paper Bag #25', '', 'FOH Tools', '', '', '', '', '0', '', '', '2.89', '2', '10x100s', '', '');
INSERT INTO inventory VALUES ('409', 'equipment', 'E4', '0', '', '', 'Paper Bag #4', '', 'FOH Tools', '', '', '', '', '0', '', '', '67.5', '2', '100s', '', '');
INSERT INTO inventory VALUES ('410', 'equipment', 'E4', '0', '', '', 'Paper for Rice Pre Cut 4x 10', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '50', '6', '100s', '', '');
INSERT INTO inventory VALUES ('411', 'equipment', 'E4', '0', '', '', 'RM Baking Essential Grease Proof Paper Pre Cut 9x9', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '80', '3', '100s', '', '');
INSERT INTO inventory VALUES ('412', 'equipment', 'E4', '0', '', '', 'wax paper printed dice cut 7x7', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '85', '2', '50s', '', '');
INSERT INTO inventory VALUES ('413', 'equipment', 'E4', '0', '', '', 'RM Baking Essential Grease Proof Paper Pre Cut 6 RD', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '58', '4', '100s', '', '');
INSERT INTO inventory VALUES ('414', 'equipment', 'E4', '0', '', '', 'Little Chef Cocktail Toothpick Assorted Colors', '', 'FOH Tools', '', '', '', '', '0', '', '', '155', '4', 'box', '', '');
INSERT INTO inventory VALUES ('415', 'equipment', 'E4', '0', '', '', 'Little Chef Umbrella sticks assorted Colors', '', 'FOH Tools', '', '', '', '', '0', '', '', '155', '8', 'box', '', '');
INSERT INTO inventory VALUES ('416', 'equipment', 'E4', '0', '', '', 'Little Chef Minted wooden toothpick', '', 'FOH Tools', '', '', '', '', '0', '', '', '155', '4', '1000 pcs', '', '');
INSERT INTO inventory VALUES ('417', 'equipment', 'E4', '0', '', '', 'Members Value Plastic Forks ', '', 'Tableware', '', '', '', '', '0', '', '', '299', '1', '250 pcs', '', '');
INSERT INTO inventory VALUES ('418', 'equipment', 'E4', '0', '', '', 'Members Value Plastic Spoons', '', 'Tableware', '', '', '', '', '0', '', '', '299', '1', '250 pcs', '', '');
INSERT INTO inventory VALUES ('419', 'equipment', 'E4', '0', '', '', 'Members Value wooden forks', '', 'Tableware', '', '', '', '', '0', '', '', '299', '1', '150pcs', '', '');
INSERT INTO inventory VALUES ('420', 'equipment', 'E4', '0', '', '', 'Members Value wooden spoons', '', 'Tableware', '', '', '', '', '0', '', '', '299', '1', '150pcs', '', '');
INSERT INTO inventory VALUES ('422', 'equipment', 'E4', '0', '', '', 'Natures Apothecary Blue Butterfly Pea', '', 'Ingredient', '', '', '', '', '0', '', '', '195', '1', '30g', '', '');
INSERT INTO inventory VALUES ('423', 'equipment', 'E4', '0', '', '', 'Natural Roam800 Aroma Diffuser', '', 'FOH Tools', '', '', '', '', '0', '', '', '450', '1', '100pc', '', '');
INSERT INTO inventory VALUES ('424', 'equipment', 'E4', '0', '', '', 'Happy Bee Paper Straw ', '', 'Drinkware', '', '', '', '', '0', '', '', '70', '3', '3pcs', '', '');
INSERT INTO inventory VALUES ('425', 'equipment', 'E4', '0', '', '', 'Members Value paper straws', '', 'Drinkware', '', '', '', '', '0', '', '', '199', '2', '250pcs', '', '');
INSERT INTO inventory VALUES ('426', 'equipment', 'E4', '0', '', '', 'Starex Ice bag 3x16', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '24', '10', '100pcs', '', '');
INSERT INTO inventory VALUES ('427', 'equipment', 'E4', '0', '', '', 'Twin Flying Horse Take out plastic cups double', '', 'Drinkware', '', '', '', '', '0', '', '', '60', '7', '100pcs', '', '');
INSERT INTO inventory VALUES ('428', 'equipment', 'E4', '0', '', '', 'Twin Flying Horse Take out plastic cups single', '', 'Drinkware', '', '', '', '', '0', '', '', '80', '2', '100pcs', '', '');
INSERT INTO inventory VALUES ('429', 'equipment', 'E4', '0', '', '', 'take out plastic medium', '', 'Packaging Materials', '', '', '', '', '0', '', '', '129', '2', '100pcs', '', '');
INSERT INTO inventory VALUES ('430', 'equipment', 'E4', '0', '', '', 'take out plastic large', '', 'Packaging Materials', '', '', '', '', '0', '', '', '159', '3', '100pcs', '', '');
INSERT INTO inventory VALUES ('431', 'equipment', 'E4', '0', '', '', 'pastry bag disposable large', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '110', '6', '100pcs', '', '');
INSERT INTO inventory VALUES ('432', 'equipment', 'E4', '0', '', '', 'Mister eco Sando bag Large', '', 'Packaging Materials', '', '', '', '', '0', '', '', '130', '1', '50pcs', '', '');
INSERT INTO inventory VALUES ('433', 'equipment', 'E4', '0', '', '', 'White Dove Sando bag Large', '', 'Packaging Materials', '', '', '', '', '0', '', '', '130', '1', '50pcs', '', '');
INSERT INTO inventory VALUES ('434', 'equipment', 'E4', '0', '', '', 'Original Buffalo Sando Bag large', '', 'Packaging Materials', '', '', '', '', '0', '', '', '249', '1', '50pcs', '', '');
INSERT INTO inventory VALUES ('435', 'equipment', 'E4', '0', '', '', 'Tulips 5x10 Plastic', '', 'Packaging Materials', '', '', '', '', '0', '', '', '249', '14', 'packs', '', '');
INSERT INTO inventory VALUES ('436', 'equipment', 'E4', '0', '', '', 'Done Well Roll bag 10x16', '', 'Packaging Materials', '', '', '', '', '0', '', '', '175', '10', '200pcs', '', '');
INSERT INTO inventory VALUES ('437', 'equipment', 'E4', '0', '', '', 'Done Well Roll bag 20x30', '', 'Packaging Materials', '', '', '', '', '0', '', '', '208', '11', '100pcs', '', '');
INSERT INTO inventory VALUES ('438', 'equipment', 'E5', '0', '', '', 'S&R Laminated Paper Plates', '', 'Tableware', '', '', '', '', '0', '', '', '389', '1', '150pcs', '', '');
INSERT INTO inventory VALUES ('439', 'equipment', 'E5', '0', '', '', 'Coffe Stirrer 11CM ', '', 'Drinkware', '', '', '', '', '0', '', '', '100', '7', '500pcs', '', '');
INSERT INTO inventory VALUES ('440', 'equipment', 'E5', '0', '', '', 'Party time Party Spoon short clear', '', 'Tableware', '', '', '', '', '0', '', '', '89', '5', '30 pcs', '', '');
INSERT INTO inventory VALUES ('441', 'equipment', 'E5', '0', '', '', 'black plastic stick for dessert', '', 'Tableware', '', '', '', '', '0', '', '', '189', '2', '500pcs', '', '');
INSERT INTO inventory VALUES ('442', 'equipment', 'E5', '0', '', '', 'Happy Fathers Day Design', '', 'Marketing Supplies', '', '', '', '', '0', '', '', '50', '1', '5pcs', '', '');
INSERT INTO inventory VALUES ('443', 'equipment', 'F2', '0', '', '', 'S&R Heavy Duty Trash bag XXL', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '529', '2', '60 bags', '', '');
INSERT INTO inventory VALUES ('444', 'equipment', 'F2', '0', '', '', 'S&R Heavy Duty Trash bag XL', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '399', '1', '60 bags', '', '');
INSERT INTO inventory VALUES ('445', 'equipment', 'F2', '0', '', '', 'S&R Bleach Zonrox Original', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '199', '2', '3785 ML', '', '');
INSERT INTO inventory VALUES ('446', 'equipment', 'F2', '0', '', '', 'Downy Sunrise Fresh', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '50', '5', '38ML', '', '');
INSERT INTO inventory VALUES ('447', 'equipment', 'F2', '0', '', '', 'Les Perfumes De Farcent Floral Breeze', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '500', '3', '1 set', '', '');
INSERT INTO inventory VALUES ('448', 'equipment', 'F3', '0', '', '', 'Method All purpose Cleaner', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '299', '5', '828 ML', '', '');
INSERT INTO inventory VALUES ('449', 'equipment', 'F3', '0', '', '', 'Fasclean Bacterial with Sampaguita Scent', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '299', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('450', 'equipment', 'F4', '0', '', '', 'Flying Tiger Alcohol Fuels & Cleans', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '350', '2', '350ml', '', '');
INSERT INTO inventory VALUES ('451', 'equipment', 'F4', '0', '', '', 'Spence Colorful bubble Refill', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '129', '1', '1L', '', '');
INSERT INTO inventory VALUES ('452', 'equipment', 'F4', '0', '', '', 'Sure Buy Antibac Moisturizing hand Soap Lavender & Camomile', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '499', '1', '1Gal', '', '');
INSERT INTO inventory VALUES ('453', 'equipment', 'F4', '0', '', '', 'Arm & Hammer Clean Sensation', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '449', '1', '510g', '', '');
INSERT INTO inventory VALUES ('454', 'equipment', 'F4', '0', '', '', 'Lysol All in 1 Disinfectant Surface cleaner marine', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '299', '2', '2L', '', '');
INSERT INTO inventory VALUES ('455', 'equipment', 'F4', '0', '', '', 'Lysol All in 1 Disinfectant Surface cleaner marine', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '299', '2', '2L', '', '');
INSERT INTO inventory VALUES ('456', 'equipment', 'F4', '0', '', '', 'Lysol Disinfectant Spray Eliminates Odor', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '150', '1', '454ml', '', '');
INSERT INTO inventory VALUES ('457', 'equipment', 'F4', '0', '', '', 'surf powerfull surf with fabcon', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '356', '1', '360g', '', '');
INSERT INTO inventory VALUES ('458', 'equipment', 'E3', '0', '', '', 'Kai Kitchen Compressed Towels', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '99', '4', '50pcs', '', '');
INSERT INTO inventory VALUES ('459', 'equipment', 'E3', '0', '', '', 'Done Well Hinged Cup', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '50.18', '50', 'pack', '', '');
INSERT INTO inventory VALUES ('460', 'equipment', 'E1', '0', '', '', 'Interfolded Paper Towels', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '93', '6', 'pack', '', '');
INSERT INTO inventory VALUES ('461', 'equipment', 'Bread Pack', '0', '', '', 'RM Boxes Pastry Box 7¼ x 10⅝ x 2¼ classic gold', '', 'Packaging Materials', '', '', '', '', '0', '', '', '20.5', '20', '20pcs', '', '');
INSERT INTO inventory VALUES ('462', 'equipment', 'Bread Pack', '0', '', '', 'RM boxes Pastry box 4x6x2', '', 'Packaging Materials', '', '', '', '', '0', '', '', '16', '2', '20pcs', '', '');
INSERT INTO inventory VALUES ('463', 'equipment', 'Bread Pack', '0', '', '', 'RM Boxes White Pastry box rectangle', '', 'Packaging Materials', '', '', '', '', '0', '', '', '15', '13', '13', '', '');
INSERT INTO inventory VALUES ('464', 'equipment', 'Bread Pack', '0', '', '', 'RM boxes Gelamine Sheet', '', 'Packaging Materials', '', '', '', '', '0', '', '', '15', '24', '24', '', '');
INSERT INTO inventory VALUES ('465', 'equipment', 'Bread Pack', '0', '', '', 'RM boxes packaging esstentials Best before', '', 'Packaging Materials', '', '', '', '', '0', '', '', '25', '3', '8', '', '');
INSERT INTO inventory VALUES ('466', 'equipment', 'Bread Pack', '0', '', '', 'Caro & marie Bread bag white Kraft 35x21x9cm', '', 'Packaging Materials', '', '', '', '', '0', '', '', '15', '19', '25pcs', '', '');
INSERT INTO inventory VALUES ('467', 'equipment', 'Bread Pack', '0', '', '', 'Bread bag large', '', 'Packaging Materials', '', '', '', '', '0', '', '', '20', '6', '10pcs', '', '');
INSERT INTO inventory VALUES ('468', 'equipment', 'Bread Pack', '0', '', '', 'RM boxes Fruit Cake boxes 6½ x 3¼ x 2¼', '', 'Packaging Materials', '', '', '', '', '0', '', '', '15', '3', '20pcs', '', '');
INSERT INTO inventory VALUES ('469', 'equipment', 'Bread Pack', '0', '', '', 'Half Roll Box 9¾ x 5½ x 4', '', 'Packaging Materials', '', '', '', '', '0', '', '', '15', '2', '20', '', '');
INSERT INTO inventory VALUES ('470', 'equipment', 'Bread Pack', '0', '', '', 'Paper twin', '', 'Packaging Materials', '', '', '', '', '0', '', '', '25', '2', '1', '', '');
INSERT INTO inventory VALUES ('471', 'equipment', 'Box #4', '0', '', '', 'Peotralo Premium Confectioners powdered Sugar', '', 'Ingredient', '', '', '', '', '0', '', '', '66', '3', '2272g', '', '');
INSERT INTO inventory VALUES ('472', 'equipment', 'Box #4', '0', '', '', 'Penco Poure cane confectioners sugar powder', '', 'Ingredient', '', '', '', '', '0', '', '', '245', '1', '2272g', '', '');
INSERT INTO inventory VALUES ('473', 'equipment', 'Box #4', '0', '', '', 'Caro & marie skim milk powder', '', 'Ingredient', '', '', '', '', '0', '', '', '175', '7', '1kg', '', '');
INSERT INTO inventory VALUES ('474', 'equipment', 'Box #4', '0', '', '', 'Puratos  Cremfil Bavarian Filling', '', 'Ingredient', '', '', '', '', '0', '', '', '440', '4', '1kg', '', '');
INSERT INTO inventory VALUES ('475', 'equipment', 'Box #4', '0', '', '', 'Puratos bread improver for soft breads', '', 'Ingredient', '', '', '', '', '0', '', '', '440', '2', '1kg', '', '');
INSERT INTO inventory VALUES ('476', 'equipment', 'Box #4', '0', '', '', 'puratos  Moon Purpose dough improver', '', 'Ingredient', '', '', '', '', '0', '', '', '440', '2', '1kg', '', '');
INSERT INTO inventory VALUES ('477', 'equipment', 'Box #4', '0', '', '', 'Puratos  Yeast Raised Doughnuts', '', 'Ingredient', '', '', '', '', '0', '', '', '220', '4', '1kg', '', '');
INSERT INTO inventory VALUES ('478', 'equipment', 'Box #1', '0', '', '', 'Magic Charcoal', '', 'Kitchen Supplies', '', '', '', '', '0', '', '', '175', '1', 'kg', '', '');
INSERT INTO inventory VALUES ('479', 'equipment', 'Box #1', '0', '', '', 'Sonic Butane Gas Cylinder', '', 'Kitchen Supplies', '', '', '', '', '0', '', '', '75', '3', 'g', '', '');
INSERT INTO inventory VALUES ('480', 'equipment', 'Box #1', '0', '', '', 'MF Curtains The back holder nick silver', '', 'Misc Materials', '', '', '', '', '0', '', '', '99', '3', 'pcs', '', '');
INSERT INTO inventory VALUES ('481', 'equipment', 'Box #1', '0', '', '', 'Steel wall', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '45', '3', 'pcs', '', '');
INSERT INTO inventory VALUES ('482', 'equipment', 'Box #1', '0', '', '', 'Pine Sol Heavy Duty Stainless Steel Scrubbers', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '338', '3', 'pcs', '', '');
INSERT INTO inventory VALUES ('483', 'equipment', 'Box #1', '0', '', '', 'Uni City Mini Wire Brush set', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '50', '3', 'pcs', '', '');
INSERT INTO inventory VALUES ('484', 'equipment', 'Box #1', '0', '', '', 'Pine Sol Non scratch Scouring Pads', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '38', '5', 'pcs', '', '');
INSERT INTO inventory VALUES ('485', 'equipment', 'Box #1', '0', '', '', 'Libman Power scrub Brush', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '66.24', '1', 'pcs', '', '');
INSERT INTO inventory VALUES ('486', 'equipment', 'Box #1', '0', '', '', 'MR Diy Multipurpose Gas torch burner', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '299', '2', 'pcs', '', '');
INSERT INTO inventory VALUES ('487', 'equipment', 'Box #1', '0', '', '', 'Heitmann Bio Rapid limescale Remover', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '299', '5', '25g', '', '');
INSERT INTO inventory VALUES ('488', 'equipment', 'Box #2', '0', '', '', 'Clean AIO Commercial Microfiber 16x16 ', '', 'Kitchen Supplies', '', '', '', '', '0', '', '', '40', '14', 'pcs', '', '');
INSERT INTO inventory VALUES ('489', 'equipment', 'Box #2', '0', '', '', 'Organic Kitchen Towel 43cm x 71cm ', '', 'Kitchen Supplies', '', '', '', '', '0', '', '', '466.75', '2', 'x3s', '', '');
INSERT INTO inventory VALUES ('490', 'equipment', 'Box #2', '0', '', '', 'K cannon White towel', '', 'Kitchen Supplies', '', '', '', '', '0', '', '', '128', '12', '12pcs', '', '');
INSERT INTO inventory VALUES ('491', 'equipment', 'Pasta', '0', '', '', 'Ideal Gourmet Squid Ink Spaghetti', '', 'Ingredient', '', '', '', '', '0', '', '', '167', '16', '500g', '', '');
INSERT INTO inventory VALUES ('492', 'equipment', 'Pasta', '0', '', '', 'Donna Chara Spaghetti', '', 'Ingredient', '', '', '', '', '0', '', '', '99', '16', '500G', '', '');
INSERT INTO inventory VALUES ('493', 'equipment', 'Pasta', '0', '', '', 'Donna Chara Pasta', '', 'Ingredient', '', '', '', '', '0', '', '', '99', '16', '500g', '', '');
INSERT INTO inventory VALUES ('494', 'equipment', 'Pasta', '0', '', '', 'Ideal Gourmet Lasagna', '', 'Ingredient', '', '', '', '', '0', '', '', '127', '10', '454g', '', '');
INSERT INTO inventory VALUES ('495', 'equipment', 'Pasta', '0', '', '', 'Novi Conserviamo LA Tradizione Italian whole Peeled Tomatoes', '', 'Ingredient', '', '', '', '', '0', '', '', '650', '32', '2500g', '', '');
INSERT INTO inventory VALUES ('496', 'equipment', 'Pasta', '0', '', '', 'Oranoro Farina ', '', 'Ingredient', '', '', '', '', '0', '', '', '199', '2', '1kg', '', '');
INSERT INTO inventory VALUES ('497', 'equipment', 'Pasta', '0', '', '', 'Cranoro Semola Rimacinata', '', 'Ingredient', '', '', '', '', '0', '', '', '210', '3', '1kg', '', '');
INSERT INTO inventory VALUES ('498', 'equipment', 'Pasta', '0', '', '', 'Italian Iodized salt', '', 'Ingredient', '', '', '', '', '0', '', '', '210', '3', '1kg', '', '');
INSERT INTO inventory VALUES ('499', 'equipment', 'Pasta', '0', '', '', 'La terra Dei Sapori Pomodoro Sundried Tomatoes', '', 'Ingredient', '', '', '', '', '0', '', '', '775', '3', '1kg', '', '');
INSERT INTO inventory VALUES ('500', 'equipment', 'Pasta', '0', '', '', 'Primo Chef Pomace Olive oil', '', 'Ingredient', '', '', '', '', '0', '', '', '1900', '8', '5L', '', '');
INSERT INTO inventory VALUES ('501', 'equipment', 'Pasta', '0', '', '', 'La terra Dei Sapori Black Olives in brine', '', 'Ingredient', '', '', '', '', '0', '', '', '1396', '2', '4100g', '', '');
INSERT INTO inventory VALUES ('502', 'equipment', 'Pasta', '0', '', '', 'Quarter Of artichokes Natura', '', 'Ingredient', '', '', '', '', '0', '', '', '2000', '3', '2550g', '', '');
INSERT INTO inventory VALUES ('503', 'equipment', 'Pasta', '0', '', '', 'Gran cucina', '', 'Ingredient', '', '', '', '', '0', '', '', '278', '35', '500g', '', '');
INSERT INTO inventory VALUES ('504', 'equipment', 'Pasta', '0', '', '', 'La Gustosa Origano Mediterraneo Blend', '', 'Ingredient', '', '', '', '', '0', '', '', '450', '1', '500g', '', '');
INSERT INTO inventory VALUES ('505', 'equipment', 'Nuts', '0', '', '', 'No brand Pistacho Whole', '', 'Ingredient', '', '', '', '', '0', '', '', '990', '3', '¼kg', '', '');
INSERT INTO inventory VALUES ('506', 'equipment', 'Nuts', '0', '', '', 'No brand Pistacho Minced', '', 'Ingredient', '', '', '', '', '0', '', '', '990', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('507', 'equipment', 'Nuts', '0', '', '', 'Caro & marie Skinless peanuts', '', 'Ingredient', '', '', '', '', '0', '', '', '450', '1.5', '1kg', '', '');
INSERT INTO inventory VALUES ('508', 'equipment', 'Nuts', '0', '', '', 'Cashew Nuts', '', 'Ingredient', '', '', '', '', '0', '', '', '550', '2', '1kg', '', '');
INSERT INTO inventory VALUES ('509', 'equipment', 'Korean', '0', '', '', 'Takara Hon Mirin', '', 'Ingredient', '', '', '', '', '0', '', '', '738', '2', '1.8ml', '', '');
INSERT INTO inventory VALUES ('510', 'equipment', 'Korean', '0', '', '', 'Kiko man', '', 'Ingredient', '', '', '', '', '0', '', '', '359', '7', '1L', '', '');
INSERT INTO inventory VALUES ('511', 'equipment', 'Korean', '0', '', '', 'Sempio Soy sauce Rich & savory', '', 'Ingredient', '', '', '', '', '0', '', '', '319', '3', '1.7L', '', '');
INSERT INTO inventory VALUES ('512', 'equipment', 'Korean', '0', '', '', 'Sempio Soy sauce Rich & savory', '', 'Ingredient', '', '', '', '', '0', '', '', '91', '1', '500ml', '', '');
INSERT INTO inventory VALUES ('513', 'equipment', 'Korean', '0', '', '', 'Sempio Soy sauce Rich & delicate', '', 'Ingredient', '', '', '', '', '0', '', '', '319', '2', '1.7L', '', '');
INSERT INTO inventory VALUES ('514', 'equipment', 'Korean', '0', '', '', 'Mizkan soy sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '319', '1', '1.7L', '', '');
INSERT INTO inventory VALUES ('515', 'equipment', 'Korean', '0', '', '', 'Sempio Soy sauce Rich & mellow', '', 'Ingredient', '', '', '', '', '0', '', '', '91', '1', '15L', '', '');
INSERT INTO inventory VALUES ('516', 'equipment', 'Nuts', '0', '', '', 'Cashew Nuts', '', 'Ingredient', '', '', '', '', '0', '', '', '550', '1.5', '1kg', '', '');
INSERT INTO inventory VALUES ('517', 'equipment', 'Korean', '0', '', '', 'Sempio Soy sauce Rich & mellow', '', 'Ingredient', '', '', '', '', '0', '', '', '91', '1', '15L', '', '');
INSERT INTO inventory VALUES ('518', 'equipment', 'Korean', '0', '', '', 'Ottogi corn oil', '', 'Ingredient', '', '', '', '', '0', '', '', '129', '0', '900ml', '', '');
INSERT INTO inventory VALUES ('519', 'equipment', 'Korean', '0', '', '', 'Ottogi mihyang cooking wine', '', 'Ingredient', '', '', '', '', '0', '', '', '346', '0', '900ml', '', '');
INSERT INTO inventory VALUES ('520', 'equipment', 'Korean', '0', '', '', 'Ottogi corn syrup', '', 'Ingredient', '', '', '', '', '0', '', '', '1050', '10', 'kg', '', '');
INSERT INTO inventory VALUES ('521', 'equipment', 'Korean', '0', '', '', 'Sempio Soy sauce Rich & mellow', '', 'Ingredient', '', '', '', '', '0', '', '', '91', '1', ' 15L', '', '');
INSERT INTO inventory VALUES ('522', 'equipment', 'Korean', '0', '', '', 'Ottogi corn oil', '', 'Ingredient', '', '', '', '', '0', '', '', '129', '0', '900ml', '', '');
INSERT INTO inventory VALUES ('523', 'equipment', 'Korean', '0', '', '', 'Ottogi mihyang cooking wine', '', 'Ingredient', '', '', '', '', '0', '', '', '346', '0', '900ml', '', '');
INSERT INTO inventory VALUES ('524', 'equipment', 'Korean', '0', '', '', 'Ottogi corn syrup', '', 'Ingredient', '', '', '', '', '0', '', '', '1050', '10', 'kg', '', '');
INSERT INTO inventory VALUES ('525', 'equipment', 'Korean', '0', '', '', 'Bulgogi sauce for beef', '', 'Ingredient', '', '', '', '', '0', '', '', '174', '10', 'kg', '', '');
INSERT INTO inventory VALUES ('526', 'equipment', 'Korean', '0', '', '', 'Ottogi sesami oil', '', 'Ingredient', '', '', '', '', '0', '', '', '390', '22', '450ml', '', '');
INSERT INTO inventory VALUES ('527', 'equipment', 'Korean', '0', '', '', 'Crown joly pong', '', 'Ingredient', '', '', '', '', '0', '', '', '89', '27', '49g', '', '');
INSERT INTO inventory VALUES ('528', 'equipment', 'Korean', '0', '', '', 'Daesang Jinqookdashi', '', 'Ingredient', '', '', '', '', '0', '', '', '286', '17', 'kg', '', '');
INSERT INTO inventory VALUES ('529', 'equipment', 'Korean', '0', '', '', 'Red course chili', '', 'Ingredient', '', '', '', '', '0', '', '', '398', '4', 'kg', '', '');
INSERT INTO inventory VALUES ('530', 'equipment', 'Korean', '0', '', '', 'Sempio red pepper powder for kimchi', '', 'Ingredient', '', '', '', '', '0', '', '', '455', '3', 'kg', '', '');
INSERT INTO inventory VALUES ('531', 'equipment', 'Korean', '0', '', '', 'Sempio red pepper powder for grind', '', 'Ingredient', '', '', '', '', '0', '', '', '455', '8', 'kg', '', '');
INSERT INTO inventory VALUES ('532', 'equipment', 'Korean', '0', '', '', 'Becksul fried chicken mix for cooking', '', 'Ingredient', '', '', '', '', '0', '', '', '280', '4.5', '1kg', '', '');
INSERT INTO inventory VALUES ('533', 'equipment', 'Korean', '0', '', '', 'Hotdog mix', '', 'Ingredient', '', '', '', '', '0', '', '', '250', '2', '2kg', '', '');
INSERT INTO inventory VALUES ('534', 'equipment', 'Korean', '0', '', '', 'Ottogi beef bone powder', '', 'Ingredient', '', '', '', '', '0', '', '', '559', '4', '500g', '', '');
INSERT INTO inventory VALUES ('535', 'equipment', 'Korean', '0', '', '', 'CJ foods korean bbq original sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '300', '25', '840g', '', '');
INSERT INTO inventory VALUES ('536', 'equipment', 'Korean', '0', '', '', 'CJ foods bulgogi sauce for beef', '', 'Ingredient', '', '', '', '', '0', '', '', '300', '5', '840g', '', '');
INSERT INTO inventory VALUES ('537', 'equipment', 'Korean', '0', '', '', 'Red bean', '', 'Ingredient', '', '', '', '', '0', '', '', '450', '9', '850g', '', '');
INSERT INTO inventory VALUES ('538', 'equipment', 'Korean', '0', '', '', 'Mizkan soy sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '270', '3', '360ml', '', '');
INSERT INTO inventory VALUES ('539', 'equipment', '1A', '0', '', '125.jpg', 'SHOT GLASS', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '20', '12', '0', '0', '');
INSERT INTO inventory VALUES ('540', 'equipment', '1A', '0', '', '', 'TEACUPS', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '18', '12', 'PC', '0', '');
INSERT INTO inventory VALUES ('541', 'equipment', '1A', '0', '', '126.jpg', 'WET FLOOR SIGNAGE', '', 'FOH Tools', '', '', '', '', '0', '', '', '300', '2', '0', '0', '');
INSERT INTO inventory VALUES ('542', 'equipment', '1A', '0', '', '', 'SMALL CUPS', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '10', '12', 'PC', '0', '');
INSERT INTO inventory VALUES ('543', 'equipment', '1A', '0', '', '127.jpeg', '3*3 IN BLACK/GREEN REMI STONE CUP', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '120', '12', '0', '0', '');
INSERT INTO inventory VALUES ('544', 'equipment', '1A', '0', '', '123.jpg', 'HK SERVING SPOON', '', 'Tableware', '', '', '', '', '0', '', '', '70', '24', '0', '0', '');
INSERT INTO inventory VALUES ('545', 'equipment', '1A', '0', '', '124.jpg', 'HK SERVING FORK', '', 'Tableware', '', '', '', '', '0', '', '', '70', '24', '0', '0', '');
INSERT INTO inventory VALUES ('546', 'equipment', 'Korean', '0', '', '', 'CJ foods gochujang hot pepper paste', '', 'Ingredient', '', '', '', '', '0', '', '', '895', '2', '3kg', '', '');
INSERT INTO inventory VALUES ('547', 'equipment', 'Korean', '0', '', '', 'Chung jung one sweet potato glass', '', 'Ingredient', '', '', '', '', '0', '', '', '2200', '1', '14kg', '', '');
INSERT INTO inventory VALUES ('548', 'equipment', 'Korean', '0', '', '', 'Ottogi Wheat Noodles thin round', '', 'Ingredient', '', '', '', '', '0', '', '', '299', '2', '1.5kg', '', '');
INSERT INTO inventory VALUES ('549', 'equipment', 'Korean', '0', '', '', 'Heng Bing Mushroom flavored dark soy sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '319', '1', '1.8L', '', '');
INSERT INTO inventory VALUES ('550', 'equipment', 'Korean', '0', '', '', 'Heng Bing Hoisin sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '442', '1', '2.2kg', '', '');
INSERT INTO inventory VALUES ('551', 'equipment', 'A2', '0', '', '', 'Grace Of earth Shitake Mushroom', '', 'Ingredient', '', '', '', '', '0', '', '', '189', '1', '400g', '', '');
INSERT INTO inventory VALUES ('552', 'equipment', 'A2', '0', '', '', 'Haccp Ten roasted grain powder', '', 'Ingredient', '', '', '', '', '0', '', '', '350', '1', '374.2g', '', '');
INSERT INTO inventory VALUES ('553', 'equipment', 'A2', '0', '', '', 'Beskul soft flour', '', 'Ingredient', '', '', '', '', '0', '', '', '295', '1', '2.5kg', '', '');
INSERT INTO inventory VALUES ('554', 'equipment', 'A2', '0', '', '', 'Beskul soft flour', '', 'Ingredient', '', '', '', '', '0', '', '', '125', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('555', 'equipment', 'A2', '0', '', '', 'Krisper bread crumbs 1kg', '', 'Ingredient', '', '', '', '', '0', '', '', '150', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('556', 'equipment', 'A2', '0', '', '', 'Daesang Jinqookdashi', '', 'Ingredient', '', '', '', '', '0', '', '', '270', '1', '243g', '', '');
INSERT INTO inventory VALUES ('557', 'equipment', 'A2', '0', '', '', 'Sempio red pepper for kimchi', '', 'Ingredient', '', '', '', '', '0', '', '', '450', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('558', 'equipment', 'A2', '0', '', '', 'Sempio red pepper grind', '', 'Ingredient', '', '', '', '', '0', '', '', '470', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('559', 'equipment', 'A2', '0', '', '', 'Sempio red pepper fine grind', '', 'Ingredient', '', '', '', '', '0', '', '', '250', '1', '285g', '', '');
INSERT INTO inventory VALUES ('560', 'equipment', 'A2', '0', '', '', 'Moi salted egg seasoning powder', '', 'Ingredient', '', '', '', '', '0', '', '', '405', '2', '500g', '', '');
INSERT INTO inventory VALUES ('561', 'equipment', 'A2', '0', '', '', 'Fry & pop shrimp crackers', '', 'Ingredient', '', '', '', '', '0', '', '', '77', '1', '400g', '', '');
INSERT INTO inventory VALUES ('562', 'equipment', 'A2', '0', '', '', 'Fry & pop shrimp crackers', '', 'Ingredient', '', '', '', '', '0', '', '', '62.5', '1', '141g', '', '');
INSERT INTO inventory VALUES ('563', 'equipment', 'A2', '0', '', '', 'Dona elena lasagna al dente', '', 'Ingredient', '', '', '', '', '0', '', '', '127', '1', '246g', '', '');
INSERT INTO inventory VALUES ('564', 'equipment', 'A2', '0', '', '', 'Ideal gourmet squid ink spaghetti', '', 'Ingredient', '', '', '', '', '0', '', '', '167', '3', '500g', '', '');
INSERT INTO inventory VALUES ('565', 'equipment', 'A2', '0', '', '', 'Dona chiara penne pasta', '', 'Ingredient', '', '', '', '', '0', '', '', '109', '2', '500g', '', '');
INSERT INTO inventory VALUES ('566', 'equipment', 'A2', '0', '', '', 'Ottogi wheat noodles thin round', '', 'Ingredient', '', '', '', '', '0', '', '', '299', '1', '1.5kg', '', '');
INSERT INTO inventory VALUES ('567', 'equipment', 'A2', '0', '', '', 'Longi vermicelli sotanghon', '', 'Ingredient', '', '', '', '', '0', '', '', '179', '1', '700g', '', '');
INSERT INTO inventory VALUES ('568', 'equipment', 'A2', '0', '', '', 'Ottogi wheat noodles white', '', 'Ingredient', '', '', '', '', '0', '', '', '95', '1', '249g', '', '');
INSERT INTO inventory VALUES ('569', 'equipment', 'A2', '0', '', '', 'Ottogi beef bone powder', '', 'Ingredient', '', '', '', '', '0', '', '', '559', '1', '277g', '', '');
INSERT INTO inventory VALUES ('570', 'equipment', 'A2', '0', '', '', 'No brand Choco ring cereals', '', 'Ingredient', '', '', '', '', '0', '', '', '447.8', '1', '251g', '', '');
INSERT INTO inventory VALUES ('571', 'equipment', 'A2', '0', '', '', 'Caro & Marie Skinless peanuts', '', 'Ingredient', '', '', '', '', '0', '', '', '520', '1', '713g', '', '');
INSERT INTO inventory VALUES ('572', 'equipment', 'A2', '0', '', '', 'Décor-it Sprinkles', '', 'Ingredient', '', '', '', '', '0', '', '', '89', '1', '318g', '', '');
INSERT INTO inventory VALUES ('573', 'equipment', 'A2', '0', '', '', 'Calumet Double acting baking powder', '', 'Ingredient', '', '', '', '', '0', '', '', '179', '1', '440g', '', '');
INSERT INTO inventory VALUES ('574', 'equipment', 'A2', '0', '', '', 'RAM baking soda', '', 'Ingredient', '', '', '', '', '0', '', '', '43.95', '1', '250g', '', '');
INSERT INTO inventory VALUES ('575', 'equipment', 'A2', '0', '', '', 'Corriender seeds', '', 'Ingredient', '', '', '', '', '0', '', '', '56', '1', '90g', '', '');
INSERT INTO inventory VALUES ('576', 'equipment', 'A2', '0', '', '', 'Brown sugar', '', 'Ingredient', '', '', '', '', '0', '', '', '95', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('577', 'equipment', 'A2', '0', '', '', 'Pumpkin seeds', '', 'Ingredient', '', '', '', '', '0', '', '', '320', '1', '250g', '', '');
INSERT INTO inventory VALUES ('578', 'equipment', 'A2', '0', '', '', 'Caro & Marie multi grain mix', '', 'Ingredient', '', '', '', '', '0', '', '', '230', '1', '250g', '', '');
INSERT INTO inventory VALUES ('579', 'equipment', 'A2', '0', '', '', 'Knorr sinigang mix original', '', 'Ingredient', '', '', '', '', '0', '', '', '52', '1', '44g', '', '');
INSERT INTO inventory VALUES ('580', 'equipment', 'A2', '0', '', '', 'Kai kitchen garlic minced', '', 'Ingredient', '', '', '', '', '0', '', '', '28', '1', '417g', '', '');
INSERT INTO inventory VALUES ('581', 'equipment', 'A2', '0', '', '', 'Pine nuts', '', 'Ingredient', '', '', '', '', '0', '', '', '625', '1', '140g', '', '');
INSERT INTO inventory VALUES ('582', 'equipment', 'A3', '0', '', '', 'Frnks red hot original caynne pepper sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '1475', '1', '3.7L', '', '');
INSERT INTO inventory VALUES ('583', 'equipment', 'A3', '0', '', '', 'Andrea milano aceto balsamico de modena', '', 'Ingredient', '', '', '', '', '0', '', '', '950', '1', '1L', '', '');
INSERT INTO inventory VALUES ('584', 'equipment', 'A3', '0', '', '', 'Sunbest sesame oil', '', 'Ingredient', '', '', '', '', '0', '', '', '499', '1', '650ml', '', '');
INSERT INTO inventory VALUES ('585', 'equipment', 'A3', '0', '', '', 'Lee kum kee panda brand oyster sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '299', '1', '907g', '', '');
INSERT INTO inventory VALUES ('586', 'equipment', 'A3', '0', '', '', 'Robinsons palm oil', '', 'Ingredient', '', '', '', '', '0', '', '', '329', '1', '1L', '', '');
INSERT INTO inventory VALUES ('587', 'equipment', 'A3', '0', '', '', 'Suree sweet chili dipping sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '178', '1', '690ml', '', '');
INSERT INTO inventory VALUES ('588', 'equipment', 'A3', '0', '', '', 'Tito urs original sinamak', '', 'Ingredient', '', '', '', '', '0', '', '', '250', '1', '300ml', '', '');
INSERT INTO inventory VALUES ('589', 'equipment', 'A3', '0', '', '', 'Heinz apple cider vinegar', '', 'Ingredient', '', '', '', '', '0', '', '', '488', '1', '946ml', '', '');
INSERT INTO inventory VALUES ('590', 'equipment', 'A3', '0', '', '', 'Ottogi corn oil', '', 'Ingredient', '', '', '', '', '0', '', '', '199', '1', '900ml', '', '');
INSERT INTO inventory VALUES ('591', 'equipment', 'A3', '0', '', '', 'Crying thaiger sriracha hot chili sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '249', '1', '740ml', '', '');
INSERT INTO inventory VALUES ('592', 'equipment', 'A3', '0', '', '', 'Original blend ketchup', '', 'Ingredient', '', '', '', '', '0', '', '', '55', '1', '250g', '', '');
INSERT INTO inventory VALUES ('593', 'equipment', 'A3', '0', '', '', 'Mc cornmick basil leaves whole', '', 'Ingredient', '', '', '', '', '0', '', '', '129', '1', 'pc', '', '');
INSERT INTO inventory VALUES ('594', 'equipment', 'A3', '0', '', '', 'Sweey baby rays bbq sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '449', '2', '1.13kg', '', '');
INSERT INTO inventory VALUES ('595', 'equipment', 'A3', '0', '', '', 'Ulasic sweet relish', '', 'Ingredient', '', '', '', '', '0', '', '', '249', '1', '710ml', '', '');
INSERT INTO inventory VALUES ('596', 'equipment', 'A3', '0', '', '', 'Instant oats', '', 'Ingredient', '', '', '', '', '0', '', '', '125', '1', '250g', '', '');
INSERT INTO inventory VALUES ('597', 'equipment', 'A3', '0', '', '', 'Sugong spiced coconut vinegar', '', 'Ingredient', '', '', '', '', '0', '', '', '55', '1', '250ml', '', '');
INSERT INTO inventory VALUES ('598', 'equipment', 'A3', '0', '', '', 'Sukang caroo pinahalang', '', 'Ingredient', '', '', '', '', '0', '', '', '55', '1', '250ml', '', '');
INSERT INTO inventory VALUES ('599', 'equipment', 'A3', '0', '', '', 'Dipping sesami sauce for pork cutlet', '', 'Ingredient', '', '', '', '', '0', '', '', '260', '1', '470g', '', '');
INSERT INTO inventory VALUES ('600', 'equipment', 'A3', '0', '', '', 'Marca pina cooking wine', '', 'Ingredient', '', '', '', '', '0', '', '', '221', '1', '350ml', '', '');
INSERT INTO inventory VALUES ('601', 'equipment', 'A3', '0', '', '', 'Ferrero nutella', '', 'Ingredient', '', '', '', '', '0', '', '', '512', '1', '900g', '', '');
INSERT INTO inventory VALUES ('602', 'equipment', 'A3', '0', '', '', 'Del monte pineapple tid bits', '', 'Ingredient', '', '', '', '', '0', '', '', '396', '1', '822g', '', '');
INSERT INTO inventory VALUES ('603', 'equipment', 'A3', '0', '', '', 'emborg full cream milk', '', 'Ingredient', '', '', '', '', '0', '', '', '99', '11', '1L', '', '');
INSERT INTO inventory VALUES ('604', 'equipment', 'A3', '0', '', '', 'nestle all purpose cream', '', 'Ingredient', '', '', '', '', '0', '', '', '264', '2', '1L', '', '');
INSERT INTO inventory VALUES ('605', 'equipment', 'A3', '0', '', '', 'silver swan salted black beans', '', 'Ingredient', '', '', '', '', '0', '', '', '39', '1', '100g', '', '');
INSERT INTO inventory VALUES ('606', 'equipment', 'A3', '0', '', '', 'alaska condensada', '', 'Ingredient', '', '', '', '', '0', '', '', '36', '6', '370g', '', '');
INSERT INTO inventory VALUES ('607', 'equipment', 'A3', '0', '', '', 'century tuna flake in oil', '', 'Ingredient', '', '', '', '', '0', '', '', '160', '3', '180g', '', '');
INSERT INTO inventory VALUES ('608', 'equipment', 'A3', '0', '', '', 'kewpie mayonnaise japanese style', '', 'Ingredient', '', '', '', '', '0', '', '', '489', '2', '500g', '', '');
INSERT INTO inventory VALUES ('609', 'equipment', 'A3', '0', '', '', 'mayonnaise japanese style', '', 'Ingredient', '', '', '', '', '0', '', '', '388', '2', '300g', '', '');
INSERT INTO inventory VALUES ('610', 'equipment', 'A3', '0', '', '', 'wish bone creamy caesar dressing', '', 'Ingredient', '', '', '', '', '0', '', '', '500', '1', '444ml', '', '');
INSERT INTO inventory VALUES ('611', 'equipment', 'A3', '0', '', '', 'mindanao bukidnon honey', '', 'Ingredient', '', '', '', '', '0', '', '', '350', '1', '410ml', '', '');
INSERT INTO inventory VALUES ('612', 'equipment', 'A3', '0', '', '', 'san marino tuna spread', '', 'Ingredient', '', '', '', '', '0', '', '', '146', '6', '85g', '', '');
INSERT INTO inventory VALUES ('613', 'equipment', 'A3', '0', '', '', 'pure foods liver spread', '', 'Ingredient', '', '', '', '', '0', '', '', '31.5', '1', '85g', '', '');
INSERT INTO inventory VALUES ('614', 'equipment', 'A3', '0', '', '', 'ottogi sesami oil', '', 'Ingredient', '', '', '', '', '0', '', '', '389', '1', '450ml', '', '');
INSERT INTO inventory VALUES ('615', 'equipment', 'A3', '0', '', '', 'kraft parmesan cheese', '', 'Ingredient', '', '', '', '', '0', '', '', '199', '1', '453ml', '', '');
INSERT INTO inventory VALUES ('616', 'equipment', 'A3', '0', '', '', 'peotraco glucose syrup', '', 'Ingredient', '', '', '', '', '0', '', '', '95', '1', '750g', '', '');
INSERT INTO inventory VALUES ('617', 'equipment', 'A3', '0', '', '', 'lee kum kee chili garlic sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '112', '1', '226g', '', '');
INSERT INTO inventory VALUES ('618', 'equipment', 'A3', '0', '', '', 'liubiju sesame paste', '', 'Ingredient', '', '', '', '', '0', '', '', '149', '1', '200g', '', '');
INSERT INTO inventory VALUES ('619', 'equipment', 'A3', '0', '', '', 'ottogi white roasted sesame seeds', '', 'Ingredient', '', '', '', '', '0', '', '', '210', '2', '100g', '', '');
INSERT INTO inventory VALUES ('620', 'equipment', 'A3', '0', '', '', 'mango hot sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '250', '1', '200ml', '', '');
INSERT INTO inventory VALUES ('621', 'equipment', 'A3', '0', '', '', 'alaska 2 in 1 crema & sada', '', 'Ingredient', '', '', '', '', '0', '', '', '68', '1', '370ml', '', '');
INSERT INTO inventory VALUES ('622', 'equipment', 'A3', '0', '', '', 'fern liquid food color fuchsia', '', 'Ingredient', '', '', '', '', '0', '', '', '95', '1', '30ml', '', '');
INSERT INTO inventory VALUES ('623', 'equipment', 'A3', '0', '', '', 'fern liquid food color egg yellow', '', 'Ingredient', '', '', '', '', '0', '', '', '95', '1', '30ml', '', '');
INSERT INTO inventory VALUES ('624', 'equipment', 'A3', '0', '', '', 'mc cornmick blue food color', '', 'Ingredient', '', '', '', '', '0', '', '', '49', '1', '20ml', '', '');
INSERT INTO inventory VALUES ('625', 'equipment', 'A3', '0', '', '', 'mc cornmick green food color', '', 'Ingredient', '', '', '', '', '0', '', '', '49', '1', '20ml', '', '');
INSERT INTO inventory VALUES ('626', 'equipment', 'A3', '0', '', '', 'mc cornmick buko pandan flavor', '', 'Ingredient', '', '', '', '', '0', '', '', '49', '1', '20ml', '', '');
INSERT INTO inventory VALUES ('627', 'equipment', 'A3', '0', '', '', 'mc cornmick almond flavor', '', 'Ingredient', '', '', '', '', '0', '', '', '49', '1', '20ml', '', '');
INSERT INTO inventory VALUES ('628', 'equipment', 'G1', '0', '', '', 'Black Liner for Eniki Bites', '', 'Ingredient', '', '', '', '', '0', '', '', '99', '8', '', '', '');
INSERT INTO inventory VALUES ('629', 'equipment', 'G1', '0', '', '', 'Smart cook Cheese cloth', '', 'Kitchen Supplies', '', '', '', '', '0', '', '', '65', '1', '', '', '');
INSERT INTO inventory VALUES ('630', 'equipment', 'G1', '0', '', '', 'Con-Tau Brand Grip Premium', '', 'Ingredient', '', '', '', '', '0', '', '', '99', '1', '', '', '');
INSERT INTO inventory VALUES ('631', 'equipment', 'G1', '0', '', '', 'Heng Bing Hoisin sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '289', '2', '', '', '');
INSERT INTO inventory VALUES ('632', 'equipment', 'G2', '0', '', '', 'cream white vanilla bean', '', 'Kitchen Supplies', '', '', '', '', '0', '', '', '50', '19', '9x2', '9x2', '');
INSERT INTO inventory VALUES ('633', 'equipment', 'G2', '0', '', '', 'S&R Wire Edge Ribbon', '', 'Office Supplies', '', '', '', '', '0', '', '', '650', '1', '4cm x 45.7m', '', '');
INSERT INTO inventory VALUES ('634', 'equipment', 'G2', '0', '', '', 'S&R Food handling disposable gloves', '', 'Kitchen Supplies', '', '', '', '', '0', '', '', '189', '14', 'box', '', '');
INSERT INTO inventory VALUES ('635', 'equipment', 'G2', '0', '', '', 'CB Brand CB Chopstick', '', 'Kitchen Supplies', '', '', '', '', '0', '', '', '150', '1', '25pcs', '', '');
INSERT INTO inventory VALUES ('636', 'equipment', 'G2', '0', '', '', 'S&R disposable vinyl gloves', '', 'Kitchen Supplies', '', '', '', '', '0', '', '', '350', '2', 'box', '', '');
INSERT INTO inventory VALUES ('637', 'equipment', 'G2', '0', '', '', 'S&R Industrial Nirtile Gloves L', '', 'Kitchen Supplies', '', '', '', '', '0', '', '', '350', '2', 'box', '', '');
INSERT INTO inventory VALUES ('638', 'equipment', 'G2', '0', '', '', 'Hagens Powder free TPE Gloves', '', 'Kitchen Supplies', '', '', '', '', '0', '', '', '585', '1', '100pcs', '', '');
INSERT INTO inventory VALUES ('639', 'equipment', 'G2', '0', '', '', 'Disposable Blue Hairnet', '', 'Kitchen Supplies', '', '', '', '', '0', '', '', '190', '4', '100pcs', '', '');
INSERT INTO inventory VALUES ('640', 'equipment', 'G2', '0', '', '', 'Made in china Plastic transparent mask', '', 'Kitchen Supplies', '', '', '', '', '0', '', '', '99', '1', '20pcs', '', '');
INSERT INTO inventory VALUES ('641', 'equipment', 'G2', '0', '', '', 'Cross café Sanitary Mask', '', 'Kitchen Supplies', '', '', '', '', '0', '', '', '100', '1', '4pcs', '', '');
INSERT INTO inventory VALUES ('642', 'equipment', 'G2', '0', '', '', 'national bookstore Avi4 memo pad 3x5', '', 'Office Supplies', '', '', '', '', '0', '', '', '50', '6', '400pcs', '', '');
INSERT INTO inventory VALUES ('643', 'equipment', 'G2', '0', '', '', 'national bookstore Avi4 memo cube 800 sqm', '', 'Office Supplies', '', '', '', '', '0', '', '', '60', '2', '480pcs', '', '');
INSERT INTO inventory VALUES ('644', 'equipment', 'G2', '0', '', '', 'national bookstore armak stationary tape 18mm', '', 'Office Supplies', '', '', '', '', '0', '', '', '55', '8', '1roll', '', '');
INSERT INTO inventory VALUES ('645', 'equipment', 'G2', '0', '', '', 'national bookstore tape dispenser', '', 'Office Supplies', '', '', '', '', '0', '', '', '35', '1', 'small', '', '');
INSERT INTO inventory VALUES ('646', 'equipment', 'A2', '0', '', '', 'Julies Peanut Butter', '', 'Ingredient', '', '', '', '', '0', '', '', '155', '1', '500g', '', '');
INSERT INTO inventory VALUES ('647', 'equipment', 'A2', '0', '', '', 'Vlasic Sweet Relish', '', 'Ingredient', '', '', '', '', '0', '', '', '249.75', '1', '710ml', '', '');
INSERT INTO inventory VALUES ('648', 'equipment', 'A2', '0', '', '', 'Alaska Condensed', '', 'Ingredient', '', '', '', '', '0', '', '', '52.45', '1', '370g', '', '');
INSERT INTO inventory VALUES ('649', 'equipment', 'A2', '0', '', '', 'Century Tuna lite', '', 'Ingredient', '', '', '', '', '0', '', '', '57.9', '1', '180g', '', '');
INSERT INTO inventory VALUES ('650', 'equipment', 'A2', '0', '', '', 'Cks Yema Spread', '', 'Ingredient', '', '', '', '', '0', '', '', '150', '2', '8oz', '', '');
INSERT INTO inventory VALUES ('651', 'equipment', 'A2', '0', '', '', 'Glucose Syrup', '', 'Ingredient', '', '', '', '', '0', '', '', '120', '1', '750g', '', '');
INSERT INTO inventory VALUES ('652', 'equipment', 'A2', '0', '', '', 'Cucumber portion', '', 'Ingredient', '', '', '', '', '0', '', '', '70', '1', 'kg', '', '');
INSERT INTO inventory VALUES ('653', 'equipment', 'A2', '0', '', '', 'Mango Crush portion', '', 'Ingredient', '', '', '', '', '0', '', '', '120', '1', 'kg', '', '');
INSERT INTO inventory VALUES ('654', 'equipment', 'A3', '0', '', '', 'Aligue', '', 'Ingredient', '', '', '', '', '0', '', '', '330', '18', '286g', '', '');
INSERT INTO inventory VALUES ('655', 'equipment', 'A3', '0', '', '', 'Puratos Bavarian Cream', '', 'Ingredient', '', '', '', '', '0', '', '', '155', '2', '1kg', '', '');
INSERT INTO inventory VALUES ('656', 'equipment', 'A3', '0', '', '', 'S pellegrino Acqua Minerale Naturale', '', 'Ingredient', '', '', '', '', '0', '', '', '150', '4', 'bot', '', '');
INSERT INTO inventory VALUES ('657', 'equipment', 'A4', '0', '', '', 'Anchor Shredded Mozzarella Cheese', '', 'Ingredient', '', '', '', '', '0', '', '', '1488', '1', '1418g', '', '');
INSERT INTO inventory VALUES ('658', 'equipment', 'A4', '0', '', '', 'Aria Mozzarella cheese', '', 'Ingredient', '', '', '', '', '0', '', '', '1400', '1', '2.5', '', '');
INSERT INTO inventory VALUES ('659', 'equipment', 'A4', '0', '', '', 'Anchor pure New zealand Lamination butter', '', 'Ingredient', '', '', '', '', '0', '', '', '5800', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('660', 'equipment', 'A4', '0', '', '', 'eden cheese', '', 'Ingredient', '', '', '', '', '0', '', '', '35', '4', '45g', '', '');
INSERT INTO inventory VALUES ('661', 'equipment', 'A4', '0', '', '', 'anchor unsalted pure new zealand butter', '', 'Ingredient', '', '', '', '', '0', '', '', '159', '38', '227g', '', '');
INSERT INTO inventory VALUES ('662', 'equipment', 'A4', '0', '', '', 'bravo butter creme', '', 'Ingredient', '', '', '', '', '0', '', '', '42', '22', '225g', '', '');
INSERT INTO inventory VALUES ('663', 'equipment', 'A5', '0', '', '', 'Dry Yeast', '', 'Ingredient', '', '', '', '', '0', '', '', '40', '16', '10g', '', '');
INSERT INTO inventory VALUES ('664', 'equipment', 'A5', '0', '', '', 'Chop garlic', '', 'Ingredient', '', '', '', '', '0', '', '', '150', '1', '200g', '', '');
INSERT INTO inventory VALUES ('665', 'equipment', 'A5', '0', '', '', 'Yakult Probiotics cultured milk', '', 'Ingredient', '', '', '', '', '0', '', '', '50', '60', '80ml', '', '');
INSERT INTO inventory VALUES ('666', 'equipment', 'A5', '0', '', '', 'sprite can', '', 'Ingredient', '', '', '', '', '0', '', '', '47', '1', '320ml', '', '');
INSERT INTO inventory VALUES ('667', 'equipment', 'A5', '0', '', '', 'coca cola zero', '', 'Ingredient', '', '', '', '', '0', '', '', '47', '1', '320ml', '', '');
INSERT INTO inventory VALUES ('668', 'equipment', 'A5', '0', '', '', 'Coca cola Original Taste', '', 'Ingredient', '', '', '', '', '0', '', '', '47', '4', '320ml', '', '');
INSERT INTO inventory VALUES ('669', 'equipment', 'A5', '0', '', '', 'Pineapple cuts', '', 'Ingredient', '', '', '', '', '0', '', '', '175', '1', '2kg', '', '');
INSERT INTO inventory VALUES ('670', 'equipment', 'F1', '0', '', '', 'antoniou fillo pastry', '', 'Ingredient', '', '', '', '', '0', '', '', '270', '1', '375g', '', '');
INSERT INTO inventory VALUES ('671', 'equipment', 'F1', '0', '', '', 'Spinach balls', '', 'Ingredient', '', '', '', '', '0', '', '', '255', '5', '1kg', '', '');
INSERT INTO inventory VALUES ('672', 'equipment', 'F1', '0', '', '', 'Parma ham', '', 'Ingredient', '', '', '', '', '0', '', '', '170', '10', '180g', '', '');
INSERT INTO inventory VALUES ('673', 'equipment', 'F1', '0', '', '', 'ittalian Foods Parma ham', '', 'Ingredient', '', '', '', '', '0', '', '', '210', '9', '250g', '', '');
INSERT INTO inventory VALUES ('674', 'equipment', 'F2', '0', '', '', 'Hotos Feta Cheese', '', 'Ingredient', '', '', '', '', '0', '', '', '397', '7', '200g', '', '');
INSERT INTO inventory VALUES ('675', 'equipment', 'F2', '0', '', '', 'Italian foods Provolone', '', 'Ingredient', '', '', '', '', '0', '', '', '350', '2', '250g', '', '');
INSERT INTO inventory VALUES ('676', 'equipment', 'F2', '0', '', '', 'Italian foods Provolone', '', 'Ingredient', '', '', '', '', '0', '', '', '281', '1', '180g', '', '');
INSERT INTO inventory VALUES ('677', 'equipment', 'F2', '0', '', '', 'Virginia Honey Cured Bacon', '', 'Ingredient', '', '', '', '', '0', '', '', '149', '5', '200g', '', '');
INSERT INTO inventory VALUES ('678', 'equipment', 'F2', '0', '', '', 'Bayern land Mozzarella Valfiorita', '', 'Ingredient', '', '', '', '', '0', '', '', '139', '11', '100g', '', '');
INSERT INTO inventory VALUES ('679', 'equipment', 'F2', '0', '', '', 'Italian foods Grand padano', '', 'Ingredient', '', '', '', '', '0', '', '', '1480', '1', 'kg', '', '');
INSERT INTO inventory VALUES ('680', 'equipment', 'F2', '0', '', '', 'Pecorino romano', '', 'Ingredient', '', '', '', '', '0', '', '', '2410', '1', 'kg', '', '');
INSERT INTO inventory VALUES ('681', 'equipment', 'F2', '0', '', '', 'Maldera Mozzarella Frozen Di latte di bufala', '', 'Ingredient', '', '', '', '', '0', '', '', '389', '17', '260g', '', '');
INSERT INTO inventory VALUES ('682', 'equipment', 'F2', '0', '', '', 'Maldera buratina Frozen', '', 'Ingredient', '', '', '', '', '0', '', '', '439', '11', '250g', '', '');
INSERT INTO inventory VALUES ('683', 'equipment', 'F2', '0', '', '', 'Southern Valley Spinach Balls', '', 'Ingredient', '', '', '', '', '0', '', '', '255', '7', '1kg', '', '');
INSERT INTO inventory VALUES ('684', 'equipment', 'F2', '0', '', '', 'Duca dei poggi Italian Pizza', '', 'Ingredient', '', '', '', '', '0', '', '', '1500', '6', '2kg', '', '');
INSERT INTO inventory VALUES ('685', 'equipment', 'F2', '0', '', '', 'Red sauce Novi', '', 'Ingredient', '', '', '', '', '0', '', '', '650', '1', '3kgs', '', '');
INSERT INTO inventory VALUES ('686', 'equipment', 'F2', '0', '', '', 'Mozzarella', '', 'Ingredient', '', '', '', '', '0', '', '', '75', '32', '100g', '', '');
INSERT INTO inventory VALUES ('687', 'equipment', 'F2', '0', '', '', 'Egg plant', '', 'Ingredient', '', '', '', '', '0', '', '', '45', '2', 'kg', '', '');
INSERT INTO inventory VALUES ('688', 'equipment', 'F2', '0', '', '', 'Pizza dough', '', 'Ingredient', '', '', '', '', '0', '', '', '40', '7', 'pc', '', '');
INSERT INTO inventory VALUES ('689', 'equipment', 'F2', '0', '', '', 'S&R Proscuito Crudo', '', 'Ingredient', '', '', '', '', '0', '', '', '360', '2', '250g', '', '');
INSERT INTO inventory VALUES ('690', 'equipment', 'F2', '0', '', '', 'Black Olives', '', 'Ingredient', '', '', '', '', '0', '', '', '1300', '2', 'kg', '', '');
INSERT INTO inventory VALUES ('691', 'equipment', 'F2', '0', '', '', 'Feta Cheese', '', 'Ingredient', '', '', '', '', '0', '', '', '265', '7', '250g', '', '');
INSERT INTO inventory VALUES ('692', 'equipment', 'F2', '0', '', '', 'Arla  Mozzarella', '', 'Ingredient', '', '', '', '', '0', '', '', '1300', '1', '2.3kg', '', '');
INSERT INTO inventory VALUES ('693', 'equipment', 'F2', '0', '', '', 'Magnolia Quick melt', '', 'Ingredient', '', '', '', '', '0', '', '', '398', '2', '900g', '', '');
INSERT INTO inventory VALUES ('694', 'equipment', 'F2', '0', '', '', 'Latteria Sorrentina Mozzarella', '', 'Ingredient', '', '', '', '', '0', '', '', '557', '1', '250g', '', '');
INSERT INTO inventory VALUES ('695', 'equipment', 'F2', '0', '', '', 'S&R Beef Salame', '', 'Ingredient', '', '', '', '', '0', '', '', '600', '1', '506g', '', '');
INSERT INTO inventory VALUES ('696', 'equipment', 'F3', '0', '', '', 'Pork sisig', '', 'Ingredient', '', '', '', '', '0', '', '', '350', '4', 'kg', '', '');
INSERT INTO inventory VALUES ('697', 'equipment', 'F3', '0', '', '', 'spaghetti', '', 'Ingredient', '', '', '', '', '0', '', '', '190', '4', 'kg', '', '');
INSERT INTO inventory VALUES ('698', 'equipment', 'F3', '0', '', '', 'penne pasta', '', 'Ingredient', '', '', '', '', '0', '', '', '190', '2', 'kg', '', '');
INSERT INTO inventory VALUES ('699', 'equipment', 'F3', '0', '', '', 'black spaghetti', '', 'Ingredient', '', '', '', '', '0', '', '', '250', '2', 'kg', '', '');
INSERT INTO inventory VALUES ('700', 'equipment', 'F3', '0', '', '', 'chicken whole', '', 'Ingredient', '', '', '', '', '0', '', '', '220', '7', 'kg', '', '');
INSERT INTO inventory VALUES ('701', 'equipment', 'F3', '0', '', '', 'japchae noodles', '', 'Ingredient', '', '', '', '', '0', '', '', '140', '3', 'kg', '', '');
INSERT INTO inventory VALUES ('702', 'equipment', 'F4', '0', '', '', 'Swan All purpose Flour', '', 'Ingredient', '', '', '', '', '0', '', '', '1680', '1', '25kg', '', '');
INSERT INTO inventory VALUES ('703', 'equipment', 'F4', '0', '', '', 'Pilmico Kutitap', '', 'Ingredient', '', '', '', '', '0', '', '', '1293', '1', '25kg', '', '');
INSERT INTO inventory VALUES ('704', 'equipment', 'F4', '0', '', '', 'Novi Tomato Peeled', '', 'Ingredient', '', '', '', '', '0', '', '', '725', '3', '2500g', '', '');
INSERT INTO inventory VALUES ('705', 'equipment', 'F4', '0', '', '', 'Granoro pasta', '', 'Ingredient', '', '', '', '', '0', '', '', '155', '1', '493g', '', '');
INSERT INTO inventory VALUES ('706', 'equipment', 'F4', '0', '', '', 'Granoro semola Rimacinata', '', 'Ingredient', '', '', '', '', '0', '', '', '210', '1', '700g', '', '');
INSERT INTO inventory VALUES ('707', 'equipment', 'F4', '0', '', '', 'Saf instant', '', 'Ingredient', '', '', '', '', '0', '', '', '189', '1', '363g', '', '');
INSERT INTO inventory VALUES ('708', 'equipment', 'F4', '0', '', '', 'white sugar', '', 'Ingredient', '', '', '', '', '0', '', '', '69', '1', 'kg', '', '');
INSERT INTO inventory VALUES ('709', 'equipment', 'F4', '0', '', '', 'italian salt', '', 'Ingredient', '', '', '', '', '0', '', '', '150', '1', '200g', '', '');
INSERT INTO inventory VALUES ('710', 'equipment', 'F4', '0', '', '', 'oat meal', '', 'Ingredient', '', '', '', '', '0', '', '', '200', '1', '500g', '', '');
INSERT INTO inventory VALUES ('711', 'equipment', 'F4', '0', '', '', 'Cinnamon Crunch', '', 'Ingredient', '', '', '', '', '0', '', '', '495', '1', '745g', '', '');
INSERT INTO inventory VALUES ('712', 'equipment', 'F4', '0', '', '', 'Oregano Flakes', '', 'Ingredient', '', '', '', '', '0', '', '', '400', '1', '380g', '', '');
INSERT INTO inventory VALUES ('713', 'equipment', 'F4', '0', '', '', 'Barbecue Sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '250', '1', '318g', '', '');
INSERT INTO inventory VALUES ('714', 'equipment', 'F4', '0', '', '', 'Pik-nik Original Shoestring potatoes', '', 'Ingredient', '', '', '', '', '0', '', '', '249', '1', '396g', '', '');
INSERT INTO inventory VALUES ('715', 'equipment', 'F4', '0', '', '', 'Ferrero Nutella', '', 'Ingredient', '', '', '', '', '0', '', '', '625', '1', '900g', '', '');
INSERT INTO inventory VALUES ('716', 'equipment', 'LG1', '0', '', '', 'Butter for steak', '', 'Ingredient', '', '', '', '', '0', '', '', '20', '1', '30pcs', '', '');
INSERT INTO inventory VALUES ('717', 'equipment', 'LG1', '0', '', '', 'Affogato Portion', '', 'Ingredient', '', '', '', '', '0', '', '', '80', '4', 'pc', '', '');
INSERT INTO inventory VALUES ('718', 'equipment', 'LG1', '0', '', '', 'Water melon Choux', '', 'Ingredient', '', '', '', '', '0', '', '', '25', '1', 'pc', '', '');
INSERT INTO inventory VALUES ('719', 'equipment', 'LG1', '0', '', '', 'caseificio valcolatte riccotta latte italiano', '', 'Ingredient', '', '', '', '', '0', '', '', '336', '12', '250g', '', '');
INSERT INTO inventory VALUES ('720', 'equipment', 'LG1', '0', '', '', 'mango sublime', '', 'Ingredient', '', '', '', '', '0', '', '', '425', '12', 'pc', '', '');
INSERT INTO inventory VALUES ('721', 'equipment', 'LG1', '0', '', '', 'vanilla ice cream', '', 'Ingredient', '', '', '', '', '0', '', '', '250', '1', '500ml', '', '');
INSERT INTO inventory VALUES ('722', 'equipment', 'LG1', '0', '', '', 'ube ice cream', '', 'Ingredient', '', '', '', '', '0', '', '', '350', '1', '1.5L', '', '');
INSERT INTO inventory VALUES ('723', 'equipment', 'LG1', '0', '', '', 'frozen blue berry', '', 'Ingredient', '', '', '', '', '0', '', '', '450', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('724', 'equipment', 'LG1', '0', '', '', 'cream cheese', '', 'Ingredient', '', '', '', '', '0', '', '', '459', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('725', 'equipment', 'LG1', '0', '', '', 'malagos Kesong puti', '', 'Ingredient', '', '', '', '', '0', '', '', '500', '4', '250g', '', '');
INSERT INTO inventory VALUES ('726', 'equipment', 'LG1', '0', '', '', 'malagos goats milk feta', '', 'Ingredient', '', '', '', '', '0', '', '', '500', '3', '250g', '', '');
INSERT INTO inventory VALUES ('727', 'equipment', 'LG1', '0', '', '', 'malagos goats milk ricotta', '', 'Ingredient', '', '', '', '', '0', '', '', '500', '5', '200g', '', '');
INSERT INTO inventory VALUES ('728', 'equipment', 'LG1', '0', '', '', 'malagos chevre', '', 'Ingredient', '', '', '', '', '0', '', '', '500', '4', '150g', '', '');
INSERT INTO inventory VALUES ('729', 'equipment', 'LG2', '0', '', '', 'Water melon', '', 'Ingredient', '', '', '', '', '0', '', '', '250', '1', '500g', '', '');
INSERT INTO inventory VALUES ('730', 'equipment', 'LG2', '0', '', '', 'saf instant', '', 'Ingredient', '', '', '', '', '0', '', '', '211', '1', '500g', '', '');
INSERT INTO inventory VALUES ('731', 'equipment', 'LG2', '0', '', '', 'black forest cake', '', 'Ingredient', '', '', '', '', '0', '', '', '259', '26', 'pc', '', '');
INSERT INTO inventory VALUES ('732', 'equipment', 'LG2', '0', '', '', 'pistacho sans rival cake', '', 'Ingredient', '', '', '', '', '0', '', '', '329', '16', '', '', '');
INSERT INTO inventory VALUES ('733', 'equipment', 'LG2', '0', '', '', 'pepper mint cake', '', 'Ingredient', '', '', '', '', '0', '', '', '169', '12', '', '', '');
INSERT INTO inventory VALUES ('734', 'equipment', 'LG2', '0', '', '', 'mixed berries', '', 'Ingredient', '', '', '', '', '0', '', '', '279', '10', '', '', '');
INSERT INTO inventory VALUES ('735', 'equipment', 'LG2', '0', '', '', 'Baked Nurs', '', 'Ingredient', '', '', '', '', '0', '', '', '450', '2', 'kg', '', '');
INSERT INTO inventory VALUES ('736', 'equipment', 'LG3', '0', '', '', 'Italian Kitchen California vinaigrette', '', 'Ingredient', '', '', '', '', '0', '', '', '325', '1', '254ml', '', '');
INSERT INTO inventory VALUES ('737', 'equipment', 'LG3', '0', '', '', 'cholula hot sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '220', '1', '260ml', '', '');
INSERT INTO inventory VALUES ('738', 'equipment', 'LG3', '0', '', '', 'Goya Chocolate syrup', '', 'Ingredient', '', '', '', '', '0', '', '', '131', '1', '350ml', '', '');
INSERT INTO inventory VALUES ('739', 'equipment', 'LG3', '0', '', '', 'mater foods Teriyaki marinade', '', 'Ingredient', '', '', '', '', '0', '', '', '124', '1', '150g', '', '');
INSERT INTO inventory VALUES ('740', 'equipment', 'LG3', '0', '', '', 'Orchid grenadine cordial', '', 'Ingredient', '', '', '', '', '0', '', '', '148.5', '1', '300ml', '', '');
INSERT INTO inventory VALUES ('741', 'equipment', 'LG3', '0', '', '', 'Ajinomoto Hondashi stock', '', 'Ingredient', '', '', '', '', '0', '', '', '140', '1', '26pcs', '', '');
INSERT INTO inventory VALUES ('742', 'equipment', 'LG3', '0', '', '', 'clara ole pancake syrup', '', 'Ingredient', '', '', '', '', '0', '', '', '103.75', '1', '355ml', '', '');
INSERT INTO inventory VALUES ('743', 'equipment', 'LG3', '0', '', '', 'American Garden U.S Mustard', '', 'Ingredient', '', '', '', '', '0', '', '', '243', '1', '200g', '', '');
INSERT INTO inventory VALUES ('744', 'equipment', 'LG3', '0', '', '', 'Mazza Chef italia Black truffle', '', 'Ingredient', '', '', '', '', '0', '', '', '650', '1', '250ml', '', '');
INSERT INTO inventory VALUES ('745', 'equipment', 'LG3', '0', '', '', 'Allegro Strawberry Gourmet Syrup', '', 'Ingredient', '', '', '', '', '0', '', '', '395', '1', '200ml', '', '');
INSERT INTO inventory VALUES ('746', 'equipment', 'LG3', '0', '', '', 'Korean seasoned soy bean paste', '', 'Ingredient', '', '', '', '', '0', '', '', '341', '1', '500g', '', '');
INSERT INTO inventory VALUES ('747', 'equipment', 'LG3', '0', '', '', 'Fudge it ube topping & filling', '', 'Ingredient', '', '', '', '', '0', '', '', '468.75', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('748', 'equipment', 'LG3', '0', '', '', 'HM foods Beryls white chip', '', 'Ingredient', '', '', '', '', '0', '', '', '319.75', '1', '500g', '', '');
INSERT INTO inventory VALUES ('749', 'equipment', 'LG3', '0', '', '', 'founding farmers roasted edame sea salt', '', 'Ingredient', '', '', '', '', '0', '', '', '89', '1', '50g', '', '');
INSERT INTO inventory VALUES ('750', 'equipment', 'LG3', '0', '', '', 'specialy selected nuts of the world', '', 'Ingredient', '', '', '', '', '0', '', '', '159', '1', '74g', '', '');
INSERT INTO inventory VALUES ('751', 'equipment', 'LG3', '0', '', '', 'Sexiest Gardener Freeze Dried Durian', '', 'Ingredient', '', '', '', '', '0', '', '', '375', '1', '50g', '', '');
INSERT INTO inventory VALUES ('752', 'equipment', 'LG3', '0', '', '', '65% dark chocolate', '', 'Ingredient', '', '', '', '', '0', '', '', '75', '2', '500g', '', '');
INSERT INTO inventory VALUES ('753', 'equipment', 'LG3', '0', '', '', 'auro chocolate Mocha crunch', '', 'Ingredient', '', '', '', '', '0', '', '', '75', '1', '60g', '', '');
INSERT INTO inventory VALUES ('754', 'equipment', 'LG3', '0', '', '', 'guilang tableya premium', '', 'Ingredient', '', '', '', '', '0', '', '', '272', '1', '335g', '', '');
INSERT INTO inventory VALUES ('755', 'equipment', 'CS2', '0', '', '', 'Grava padano Shreded', '', 'Ingredient', '', '', '', '', '0', '', '', '2980', '1', '8g', '', '');
INSERT INTO inventory VALUES ('756', 'equipment', 'CS2', '0', '', '', 'Roasted Seaweed', '', 'Ingredient', '', '', '', '', '0', '', '', '450', '1', '4g', '', '');
INSERT INTO inventory VALUES ('757', 'equipment', 'CS2', '0', '', '', 'Roasted Crushed', '', 'Ingredient', '', '', '', '', '0', '', '', '596', '1', 'kg', '', '');
INSERT INTO inventory VALUES ('758', 'equipment', 'CS2', '0', '', '', 'pepper tuna sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '250', '1', '278g', '', '');
INSERT INTO inventory VALUES ('759', 'equipment', 'CS2', '0', '', '', 'pompano sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '650', '1', '1L', '', '');
INSERT INTO inventory VALUES ('760', 'equipment', 'FC1', '0', '', '', 'Apple', '', 'Ingredient', '', '', '', '', '0', '', '', '45', '9', '', '', '');
INSERT INTO inventory VALUES ('761', 'equipment', 'FC1', '0', '', '', 'Pineapple', '', 'Ingredient', '', '', '', '', '0', '', '', '193', '2', '', '', '');
INSERT INTO inventory VALUES ('762', 'equipment', 'FC1', '0', '', '', 'Manggo', '', 'Ingredient', '', '', '', '', '0', '', '', '140', '0.5', '', '', '');
INSERT INTO inventory VALUES ('763', 'equipment', 'FC1', '0', '', '', 'Ice Berge Lettuce', '', 'Ingredient', '', '', '', '', '0', '', '', '190', '0.5', '', '', '');
INSERT INTO inventory VALUES ('764', 'equipment', 'FC1', '0', '', '', 'Curly Lettuce', '', 'Ingredient', '', '', '', '', '0', '', '', '190', '0.25', '', '', '');
INSERT INTO inventory VALUES ('765', 'equipment', 'FC1', '0', '', '', 'Violey Cabbage', '', 'Ingredient', '', '', '', '', '0', '', '', '65', '0.25', '', '', '');
INSERT INTO inventory VALUES ('766', 'equipment', 'FC1', '0', '', '', 'Argula Leaves', '', 'Ingredient', '', '', '', '', '0', '', '', '77', '160', '', '', '');
INSERT INTO inventory VALUES ('767', 'equipment', 'FC1', '0', '', '', 'Paresley', '', 'Ingredient', '', '', '', '', '0', '', '', '65', '125', '', '', '');
INSERT INTO inventory VALUES ('768', 'equipment', 'FC1', '0', '', '', 'White Onion Slices', '', 'Ingredient', '', '', '', '', '0', '', '', '25', '100', '', '', '');
INSERT INTO inventory VALUES ('769', 'equipment', 'FC2', '0', '', '', 'US Mustard', '', 'Ingredient', '', '', '', '', '0', '', '', '221', '1', '397g', '', '');
INSERT INTO inventory VALUES ('770', 'equipment', 'FC2', '0', '', '', 'Wishbone Creamy Caesar', '', 'Ingredient', '', '', '', '', '0', '', '', '500', '2', '65ml', '', '');
INSERT INTO inventory VALUES ('771', 'equipment', 'FC2', '0', '', '', 'S&R Grated Raw wasabi paste', '', 'Ingredient', '', '', '', '', '0', '', '', '369', '2', '175g', '', '');
INSERT INTO inventory VALUES ('772', 'equipment', 'FC2', '0', '', '', 'Grace of Earth Coji Berry', '', 'Ingredient', '', '', '', '', '0', '', '', '421', '1', '80g', '', '');
INSERT INTO inventory VALUES ('773', 'equipment', 'FC2', '0', '', '', 'Water melon sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '60', '1', '200ml', '', '');
INSERT INTO inventory VALUES ('774', 'equipment', 'FC2', '0', '', '', 'wasabi mayo', '', 'Ingredient', '', '', '', '', '0', '', '', '720', '1', '400ml', '', '');
INSERT INTO inventory VALUES ('775', 'equipment', 'FC2', '0', '', '', 'water melon monchigo sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '65', '1', '350ml', '', '');
INSERT INTO inventory VALUES ('776', 'equipment', 'FC2', '0', '', '', 'chocolate sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '78', '1', '350ml', '', '');
INSERT INTO inventory VALUES ('777', 'equipment', 'FC2', '0', '', '', 'water melon monchigo sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '334', '1', '1L', '', '');
INSERT INTO inventory VALUES ('778', 'equipment', 'FC2', '0', '', '', 'kani sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '250', '1', '400ml', '', '');
INSERT INTO inventory VALUES ('779', 'equipment', 'FC2', '0', '', '', 'strawberry sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '221', '1', '350ml', '', '');
INSERT INTO inventory VALUES ('780', 'equipment', 'FC2', '0', '', '', 'pompano sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '10', '1', '30', '', '');
INSERT INTO inventory VALUES ('781', 'equipment', 'FC2', '0', '', '', 'tuna palapa', '', 'Ingredient', '', '', '', '', '0', '', '', '25', '2', '', '', '');
INSERT INTO inventory VALUES ('782', 'equipment', 'FC2', '0', '', '', 'water melon cubes', '', 'Ingredient', '', '', '', '', '0', '', '', '125', '2', '1052g', '', '');
INSERT INTO inventory VALUES ('783', 'equipment', 'FC2', '0', '', '', 'mango for salad', '', 'Ingredient', '', '', '', '', '0', '', '', '50', '1', '147g', '', '');
INSERT INTO inventory VALUES ('784', 'equipment', 'FC2', '0', '', '', 'lemon grass sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '23', '1', '331g', '', '');
INSERT INTO inventory VALUES ('785', 'equipment', 'FC2', '0', '', '', 'sundried tomatoes', '', 'Ingredient', '', '', '', '', '0', '', '', '235', '1', '343g', '', '');
INSERT INTO inventory VALUES ('786', 'equipment', 'FC3', '0', '', '', 'Pipino for kinilaw', '', 'Ingredient', '', '', '', '', '0', '', '', '5', '2', '548g', '', '');
INSERT INTO inventory VALUES ('787', 'equipment', 'FC3', '0', '', '', 'Pipino for salad', '', 'Ingredient', '', '', '', '', '0', '', '', '5', '2', '549g', '', '');
INSERT INTO inventory VALUES ('788', 'equipment', 'FC3', '0', '', '', 'pumpkin seeds', '', 'Ingredient', '', '', '', '', '0', '', '', '19', '1', '65g', '', '');
INSERT INTO inventory VALUES ('789', 'equipment', 'FC3', '0', '', '', 'shitake slices', '', 'Ingredient', '', '', '', '', '0', '', '', '175', '1', '147g', '', '');
INSERT INTO inventory VALUES ('790', 'equipment', 'FC3', '0', '', '', 'grated cheese', '', 'Ingredient', '', '', '', '', '0', '', '', '140', '1', '70g', '', '');
INSERT INTO inventory VALUES ('791', 'equipment', 'FC3', '0', '', '', 'manchigo cheese', '', 'Ingredient', '', '', '', '', '0', '', '', '125', '1', '58g', '', '');
INSERT INTO inventory VALUES ('792', 'equipment', 'FC3', '0', '', '', 'curly onions', '', 'Ingredient', '', '', '', '', '0', '', '', '25', '1', '46g', '', '');
INSERT INTO inventory VALUES ('793', 'equipment', 'FC3', '0', '', '', 'potato salad dressing', '', 'Ingredient', '', '', '', '', '0', '', '', '169', '1', '2.3kg', '', '');
INSERT INTO inventory VALUES ('794', 'equipment', 'FC3', '0', '', '', 'ginger for pompano', '', 'Ingredient', '', '', '', '', '0', '', '', '8', '1', '48g', '', '');
INSERT INTO inventory VALUES ('795', 'equipment', 'FC3', '0', '', '', 'parmenyana cheese', '', 'Ingredient', '', '', '', '', '0', '', '', '420', '1', '347g', '', '');
INSERT INTO inventory VALUES ('796', 'equipment', 'FC3', '0', '', '', 'pickled onion', '', 'Ingredient', '', '', '', '', '0', '', '', '52', '1', '116g', '', '');
INSERT INTO inventory VALUES ('797', 'equipment', 'FC3', '0', '', '', 'veggie for steak', '', 'Ingredient', '', '', '', '', '0', '', '', '68', '1', '152g', '', '');
INSERT INTO inventory VALUES ('798', 'equipment', 'FC3', '0', '', '', 'atchara', '', 'Ingredient', '', '', '', '', '0', '', '', '98', '1', '430g', '', '');
INSERT INTO inventory VALUES ('799', 'equipment', 'FC3', '0', '', '', 'sliced mango', '', 'Ingredient', '', '', '', '', '0', '', '', '45', '1', '64g', '', '');
INSERT INTO inventory VALUES ('800', 'equipment', 'FC3', '0', '', '', 'apple sliced', '', 'Ingredient', '', '', '', '', '0', '', '', '54', '1', '115g', '', '');
INSERT INTO inventory VALUES ('801', 'equipment', 'FC4', '0', '', '', 'Chopped chili', '', 'Ingredient', '', '', '', '', '0', '', '', '45', '1', '29g', '', '');
INSERT INTO inventory VALUES ('802', 'equipment', 'FC4', '0', '', '', 'grated ginger', '', 'Ingredient', '', '', '', '', '0', '', '', '21', '1', '36g', '', '');
INSERT INTO inventory VALUES ('803', 'equipment', 'FC4', '0', '', '', 'sliced suha & lemon', '', 'Ingredient', '', '', '', '', '0', '', '', '94', '1', '101g', '', '');
INSERT INTO inventory VALUES ('804', 'equipment', 'FC4', '0', '', '', 'minced cube tomato', '', 'Ingredient', '', '', '', '', '0', '', '', '27', '1', '113g', '', '');
INSERT INTO inventory VALUES ('805', 'equipment', 'FC4', '0', '', '', 'parmesan sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '654', '1', '1.198g', '', '');
INSERT INTO inventory VALUES ('806', 'equipment', 'FC4', '0', '', '', 'aligue suace', '', 'Ingredient', '', '', '', '', '0', '', '', '3800', '1', '897g', '', '');
INSERT INTO inventory VALUES ('807', 'equipment', 'FC4', '0', '', '', 'ladies choice real mayonnaise', '', 'Ingredient', '', '', '', '', '0', '', '', '987', '1', '1150g', '', '');
INSERT INTO inventory VALUES ('808', 'equipment', 'FC4', '0', '', '', 'kani sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '541', '1', '797g', '', '');
INSERT INTO inventory VALUES ('809', 'equipment', 'FC4', '0', '', '', 'buffalo sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '920', '1', '1830g', '', '');
INSERT INTO inventory VALUES ('810', 'equipment', 'FC4', '0', '', '', 'palapa', '', 'Ingredient', '', '', '', '', '0', '', '', '458', '1', '855g', '', '');
INSERT INTO inventory VALUES ('811', 'equipment', 'FC4', '0', '', '', 'taugi for deop bap', '', 'Ingredient', '', '', '', '', '0', '', '', '41', '1', '693g', '', '');
INSERT INTO inventory VALUES ('812', 'equipment', 'FC4', '0', '', '', 'cabbage for deop bap', '', 'Ingredient', '', '', '', '', '0', '', '', '25', '1', '371g', '', '');
INSERT INTO inventory VALUES ('813', 'equipment', 'FC4', '0', '', '', 'carrots noodles', '', 'Ingredient', '', '', '', '', '0', '', '', '78', '1', '451g', '', '');
INSERT INTO inventory VALUES ('814', 'equipment', 'FC4', '0', '', '', 'romaine for salad', '', 'Ingredient', '', '', '', '', '0', '', '', '350', '1', '994g', '', '');
INSERT INTO inventory VALUES ('815', 'equipment', 'FC4', '0', '', '', 'crab stick', '', 'Ingredient', '', '', '', '', '0', '', '', '741', '1', '447g', '', '');
INSERT INTO inventory VALUES ('816', 'equipment', 'FC5', '0', '', '', 'Galbi beef Ribs', '', 'Ingredient', '', '', '', '', '0', '', '', '400', '5', '310g', '', '');
INSERT INTO inventory VALUES ('817', 'equipment', 'FC5', '0', '', '', 'chicken for barbecue', '', 'Ingredient', '', '', '', '', '0', '', '', '150', '13', '383g', '', '');
INSERT INTO inventory VALUES ('818', 'equipment', 'FC5', '0', '', '', 'fried rice pack', '', 'Ingredient', '', '', '', '', '0', '', '', '55', '6', '700g', '', '');
INSERT INTO inventory VALUES ('819', 'equipment', 'FC5', '0', '', '', 'lechon kawali', '', 'Ingredient', '', '', '', '', '0', '', '', '390', '22', '300g', '', '');
INSERT INTO inventory VALUES ('820', 'equipment', 'FC5', '0', '', '', 'pork pata crispy pata', '', 'Ingredient', '', '', '', '', '0', '', '', '450', '5', '1019g', '', '');
INSERT INTO inventory VALUES ('821', 'equipment', 'FC5', '0', '', '', 'beef steak', '', 'Ingredient', '', '', '', '', '0', '', '', '420', '4', '258g', '', '');
INSERT INTO inventory VALUES ('822', 'equipment', 'FC5', '0', '', '', 'steamed pompano', '', 'Ingredient', '', '', '', '', '0', '', '', '320', '2', '463g', '', '');
INSERT INTO inventory VALUES ('823', 'equipment', 'FC5', '0', '', '', 'crispy crablets', '', 'Ingredient', '', '', '', '', '0', '', '', '125', '1', '250g', '', '');
INSERT INTO inventory VALUES ('824', 'equipment', 'PA1', '0', '', '', 'Barbecue sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '25.22', '9', '1 Food keeper', '', '');
INSERT INTO inventory VALUES ('825', 'equipment', 'PA1', '0', '', '', 'pork bulgogi', '', 'Ingredient', '', '', '', '', '0', '', '', '31.25', '4', '1 Food keeper', '', '');
INSERT INTO inventory VALUES ('826', 'equipment', 'PA1', '0', '', '', 'beef randang', '', 'Ingredient', '', '', '', '', '0', '', '', '27.93', '16', '1 Food keeper', '', '');
INSERT INTO inventory VALUES ('827', 'equipment', 'PA1', '0', '', '', 'grated grana padano', '', 'Ingredient', '', '', '', '', '0', '', '', '1250', '2', '1000 ml', '', '');
INSERT INTO inventory VALUES ('828', 'equipment', 'PA1', '0', '', '', 'italian sausages', '', 'Ingredient', '', '', '', '', '0', '', '', '28.5', '10', '1 f/k', '', '');
INSERT INTO inventory VALUES ('829', 'equipment', 'PA1', '0', '', '', 'white sauces', '', 'Ingredient', '', '', '', '', '0', '', '', '84', '5', '1000 ml', '', '');
INSERT INTO inventory VALUES ('830', 'equipment', 'PA1', '0', '', '', 'artichokes', '', 'Ingredient', '', '', '', '', '0', '', '', '63', '7', '1 f/k', '', '');
INSERT INTO inventory VALUES ('831', 'equipment', 'PA1', '0', '', '', 'tomato peele', '', 'Ingredient', '', '', '', '', '0', '', '', '489', '1', '1000ml', '', '');
INSERT INTO inventory VALUES ('832', 'equipment', 'PA1', '0', '', '', 'parma ham', '', 'Ingredient', '', '', '', '', '0', '', '', '16.27', '22', '1 f/k', '', '');
INSERT INTO inventory VALUES ('833', 'equipment', 'PA1', '0', '', '', 'mushroom', '', 'Ingredient', '', '', '', '', '0', '', '', '16.05', '20', '1 f/k', '', '');
INSERT INTO inventory VALUES ('834', 'equipment', 'PA1', '0', '', '', 'cooked ham', '', 'Ingredient', '', '', '', '', '0', '', '', '37.63', '11', '1 f/k', '', '');
INSERT INTO inventory VALUES ('835', 'equipment', 'PA1', '0', '', '', 'pesto sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '236', '1', '1000 ml', '', '');
INSERT INTO inventory VALUES ('836', 'equipment', 'PA1', '0', '', '', 'black olives', '', 'Ingredient', '', '', '', '', '0', '', '', '8.12', '8', '1 f/k', '', '');
INSERT INTO inventory VALUES ('837', 'equipment', 'PA1', '0', '', '', 'pizza dough', '', 'Ingredient', '', '', '', '', '0', '', '', '20', '16', '2 f/k', '', '');
INSERT INTO inventory VALUES ('838', 'equipment', 'PA1', '0', '', '', 'salame picante', '', 'Ingredient', '', '', '', '', '0', '', '', '121.66', '3', '250g', '', '');
INSERT INTO inventory VALUES ('839', 'equipment', 'PA1', '0', '', '', 'italian foods salame picante', '', 'Ingredient', '', '', '', '', '0', '', '', '121.66', '3', '250g', '', '');
INSERT INTO inventory VALUES ('840', 'equipment', 'PA1', '0', '', '', 'spanish chorizo', '', 'Ingredient', '', '', '', '', '0', '', '', '51', '5', '100g', '', '');
INSERT INTO inventory VALUES ('841', 'equipment', 'PA1', '0', '', '', 'verginia beef bacon', '', 'Ingredient', '', '', '', '', '0', '', '', '383', '1', '200g', '', '');
INSERT INTO inventory VALUES ('842', 'equipment', 'PA1', '0', '', '', 'Salametto contrady Cinghiale', '', 'Ingredient', '', '', '', '', '0', '', '', '251', '1', '50g', '', '');
INSERT INTO inventory VALUES ('843', 'equipment', 'PA1', '0', '', '', 'Cream cheese', '', 'Ingredient', '', '', '', '', '0', '', '', '950', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('844', 'equipment', 'PA1', '0', '', '', 'provolone', '', 'Ingredient', '', '', '', '', '0', '', '', '2500', '1', '1040g', '', '');
INSERT INTO inventory VALUES ('845', 'equipment', 'PA1', '0', '', '', 'pecorino romano', '', 'Ingredient', '', '', '', '', '0', '', '', '1900', '1', '760g', '', '');
INSERT INTO inventory VALUES ('846', 'equipment', 'PAF1', '0', '', '', 'Italian Mozzarella', '', 'Ingredient', '', '', '', '', '0', '', '', '1400', '6', '2kg', '', '');
INSERT INTO inventory VALUES ('847', 'equipment', 'PAF1', '0', '', '', 'Vanilla ice cream', '', 'Ingredient', '', '', '', '', '0', '', '', '420', '3', '3.8L', '', '');
INSERT INTO inventory VALUES ('848', 'equipment', 'PAF1', '0', '', '', 'Ube ice cream', '', 'Ingredient', '', '', '', '', '0', '', '', '410', '1', '3.8L', '', '');
INSERT INTO inventory VALUES ('849', 'equipment', 'PAF1', '0', '', '', 'Jumbo Strawberry', '', 'Ingredient', '', '', '', '', '0', '', '', '410', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('850', 'equipment', 'PAF1', '0', '', '', 'Beef salami', '', 'Ingredient', '', '', '', '', '0', '', '', '323', '1', '542g', '', '');
INSERT INTO inventory VALUES ('851', 'equipment', 'PAF1', '0', '', '', 'bambi Tortillas mexcian', '', 'Ingredient', '', '', '', '', '0', '', '', '120', '2', '12pcs', '', '');
INSERT INTO inventory VALUES ('852', 'equipment', 'PAF1', '0', '', '', 'nestle crunch', '', 'Ingredient', '', '', '', '', '0', '', '', '65', '11', '60ml', '', '');
INSERT INTO inventory VALUES ('853', 'equipment', 'PAF1', '0', '', '', 'oreo oreo ice cream', '', 'Ingredient', '', '', '', '', '0', '', '', '174', '1', '110ml', '', '');
INSERT INTO inventory VALUES ('854', 'equipment', 'PAF2', '0', '', '', 'Ice bird ice cubes', '', 'Ingredient', '', '', '', '', '0', '', '', '125', '5', '4pck', '', '');
INSERT INTO inventory VALUES ('855', 'equipment', 'CO1', '0', '', '', 'star anise', '', 'Ingredient', '', '', '', '', '0', '', '', '65', '1', '101g', '', '');
INSERT INTO inventory VALUES ('856', 'equipment', 'CO1', '0', '', '', 'bay leaves', '', 'Ingredient', '', '', '', '', '0', '', '', '25', '1', '178g', '', '');
INSERT INTO inventory VALUES ('857', 'equipment', 'CO1', '0', '', '', 'brown sugar', '', 'Ingredient', '', '', '', '', '0', '', '', '98', '1', '692g', '', '');
INSERT INTO inventory VALUES ('858', 'equipment', 'CO1', '0', '', '', 'onion powder', '', 'Ingredient', '', '', '', '', '0', '', '', '156', '1', '774g', '', '');
INSERT INTO inventory VALUES ('859', 'equipment', 'CO1', '0', '', '', 'pine nuts', '', 'Ingredient', '', '', '', '', '0', '', '', '1200', '1', '929g', '', '');
INSERT INTO inventory VALUES ('860', 'equipment', 'CO1', '0', '', '', 'white sesame seeds', '', 'Ingredient', '', '', '', '', '0', '', '', '423', '1', '479g', '', '');
INSERT INTO inventory VALUES ('861', 'equipment', 'CO1', '0', '', '', 'black pepper corn', '', 'Ingredient', '', '', '', '', '0', '', '', '25', '1', '158g', '', '');
INSERT INTO inventory VALUES ('862', 'equipment', 'CO1', '0', '', '', 'garlic powder', '', 'Ingredient', '', '', '', '', '0', '', '', '456', '1', '888g', '', '');
INSERT INTO inventory VALUES ('863', 'equipment', 'CO1', '0', '', '', 'black pepper ground', '', 'Ingredient', '', '', '', '', '0', '', '', '224', '1', '321g', '', '');
INSERT INTO inventory VALUES ('864', 'equipment', 'CO1', '0', '', '', 'cumin powder', '', 'Ingredient', '', '', '', '', '0', '', '', '124', '1', '307g', '', '');
INSERT INTO inventory VALUES ('865', 'equipment', 'CO1', '0', '', '', 'cumin seeds', '', 'Ingredient', '', '', '', '', '0', '', '', '124', '1', '206g', '', '');
INSERT INTO inventory VALUES ('866', 'equipment', 'CO1', '0', '', '', 'oregano flakes', '', 'Ingredient', '', '', '', '', '0', '', '', '65', '1', '262g', '', '');
INSERT INTO inventory VALUES ('867', 'equipment', 'CO1', '0', '', '', 'currey powder', '', 'Ingredient', '', '', '', '', '0', '', '', '98', '1', '546g', '', '');
INSERT INTO inventory VALUES ('868', 'equipment', 'CO1', '0', '', '', 'turmeric powder butter milk powder', '', 'Ingredient', '', '', '', '', '0', '', '', '451', '1', '442g', '', '');
INSERT INTO inventory VALUES ('869', 'equipment', 'CO1', '0', '', '', 'butter milk powder', '', 'Ingredient', '', '', '', '', '0', '', '', '320', '1', '1kg', '', '');
INSERT INTO inventory VALUES ('870', 'equipment', 'CO1', '0', '', '', 'chicken powder', '', 'Ingredient', '', '', '', '', '0', '', '', '68', '1', '120g', '', '');
INSERT INTO inventory VALUES ('871', 'equipment', 'CO1', '0', '', '', 'umami seasoning', '', 'Ingredient', '', '', '', '', '0', '', '', '59', '1', '245g', '', '');
INSERT INTO inventory VALUES ('872', 'equipment', 'CO1', '0', '', '', 'raisins sultanas', '', 'Ingredient', '', '', '', '', '0', '', '', '854', '1', '610g', '', '');
INSERT INTO inventory VALUES ('873', 'equipment', 'CO1', '0', '', '', 'ground paprika', '', 'Ingredient', '', '', '', '', '0', '', '', '124', '1', '180g', '', '');
INSERT INTO inventory VALUES ('874', 'equipment', 'CO1', '0', '', '', 'white pepper plain', '', 'Ingredient', '', '', '', '', '0', '', '', '120', '1', '137g', '', '');
INSERT INTO inventory VALUES ('875', 'equipment', 'CO1', '0', '', '', 'spice pepper', '', 'Ingredient', '', '', '', '', '0', '', '', '231', '1', '400g', '', '');
INSERT INTO inventory VALUES ('876', 'equipment', 'CO1', '0', '', '', 'cinamon powder', '', 'Ingredient', '', '', '', '', '0', '', '', '220', '1', '367g', '', '');
INSERT INTO inventory VALUES ('877', 'equipment', 'CO1', '0', '', '', 'sundried tomatoes', '', 'Ingredient', '', '', '', '', '0', '', '', '324', '1', '290g', '', '');
INSERT INTO inventory VALUES ('878', 'equipment', 'CO1', '0', '', '', 'turmeric powder butter milk powder', '', 'Ingredient', '', '', '', '', '0', '', '', '227', '1', '143g', '', '');
INSERT INTO inventory VALUES ('879', 'equipment', 'CO1', '0', '', '', 'iso malt', '', 'Ingredient', '', '', '', '', '0', '', '', '223', '1', '386g', '', '');
INSERT INTO inventory VALUES ('880', 'equipment', 'CO1', '0', '', '', 'garlic spicy mix', '', 'Ingredient', '', '', '', '', '0', '', '', '102', '1', '28g', '', '');
INSERT INTO inventory VALUES ('881', 'equipment', 'CO1', '0', '', '', 'sea salt', '', 'Ingredient', '', '', '', '', '0', '', '', '28', '1', '171g', '', '');
INSERT INTO inventory VALUES ('882', 'equipment', 'SA1', '0', '', '', 'Papa banana ketsup', '', 'Ingredient', '', '', '', '', '0', '', '', '259', '1', '1.9L', '', '');
INSERT INTO inventory VALUES ('883', 'equipment', 'SA1', '0', '', '', 'japchea oil', '', 'Ingredient', '', '', '', '', '0', '', '', '369', '1', '1.9L', '', '');
INSERT INTO inventory VALUES ('884', 'equipment', 'CO1', '0', '', '', 'knorr liquid seasoning', '', 'Ingredient', '', '', '', '', '0', '', '', '1033', '1', '1.79L', '', '');
INSERT INTO inventory VALUES ('885', 'equipment', 'SA1', '0', '', '', 'franks red hot original ceynne pepper', '', 'Ingredient', '', '', '', '', '0', '', '', '259', '1', '0.25g', '', '');
INSERT INTO inventory VALUES ('886', 'equipment', 'SA1', '0', '', '', 'datu puti soy sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '29', '1', '0.25g', '', '');
INSERT INTO inventory VALUES ('887', 'equipment', 'SA3', '0', '', '', 'Liquid Seasoning', '', 'Ingredient', '', '', '', '', '0', '', '', '1020', '1', 'bot', '', '');
INSERT INTO inventory VALUES ('888', 'equipment', 'SA3', '0', '', '', 'Nilarang Oil', '', 'Ingredient', '', '', '', '', '0', '', '', '250', '1', '1 bot', '', '');
INSERT INTO inventory VALUES ('889', 'equipment', 'SA3', '0', '', '', 'Minola oil', '', 'Ingredient', '', '', '', '', '0', '', '', '129', '1', '0.75 bot', '', '');
INSERT INTO inventory VALUES ('890', 'equipment', 'SA3', '0', '', '', 'Mizkan Soy sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '280', '1', '0.75 bot', '', '');
INSERT INTO inventory VALUES ('891', 'equipment', 'SA3', '0', '', '', 'Rice wine', '', 'Ingredient', '', '', '', '', '0', '', '', '170', '1', '0.25 bot', '', '');
INSERT INTO inventory VALUES ('892', 'equipment', 'SA3', '0', '', '', 'Toyo', '', 'Ingredient', '', '', '', '', '0', '', '', '120', '1', '0.75 bot', '', '');
INSERT INTO inventory VALUES ('893', 'equipment', 'SA3', '0', '', '', 'Japchea oil', '', 'Ingredient', '', '', '', '', '0', '', '', '60', '1', '0.5 bot', '', '');
INSERT INTO inventory VALUES ('894', 'equipment', 'SA3', '0', '', '', 'sesame oil', '', 'Ingredient', '', '', '', '', '0', '', '', '89', '1', '0.25 bot', '', '');
INSERT INTO inventory VALUES ('895', 'equipment', 'SA3', '0', '', '', 'sempio soy sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '189', '1', '1 bot', '', '');
INSERT INTO inventory VALUES ('896', 'equipment', 'SA3', '0', '', '', 'olive oil', '', 'Ingredient', '', '', '', '', '0', '', '', '360', '1', '0.5 bot', '', '');
INSERT INTO inventory VALUES ('897', 'equipment', 'SA3', '0', '', '', 'chop garlic', '', 'Ingredient', '', '', '', '', '0', '', '', '62', '1', '195g', '', '');
INSERT INTO inventory VALUES ('898', 'equipment', 'SA3', '0', '', '', 'chicken powder', '', 'Ingredient', '', '', '', '', '0', '', '', '460', '1', '338g', '', '');
INSERT INTO inventory VALUES ('899', 'equipment', 'SA3', '0', '', '', 'msg', '', 'Ingredient', '', '', '', '', '0', '', '', '285', '1', '267g', '', '');
INSERT INTO inventory VALUES ('900', 'equipment', 'SA3', '0', '', '', 'iodize salt', '', 'Ingredient', '', '', '', '', '0', '', '', '290', '1', '570g', '', '');
INSERT INTO inventory VALUES ('901', 'equipment', 'SA3', '0', '', '', 'white sugar', '', 'Ingredient', '', '', '', '', '0', '', '', '65', '1', '202g', '', '');
INSERT INTO inventory VALUES ('902', 'equipment', 'SA3', '0', '', '', 'oyster sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '175', '1', '500g', '', '');
INSERT INTO inventory VALUES ('903', 'equipment', 'SA3', '0', '', '', 'chop chili', '', 'Ingredient', '', '', '', '', '0', '', '', '35', '1', '23g', '', '');
INSERT INTO inventory VALUES ('904', 'equipment', 'SA3', '0', '', '', 'chop spring onion', '', 'Ingredient', '', '', '', '', '0', '', '', '45', '1', '132g', '', '');
INSERT INTO inventory VALUES ('905', 'equipment', 'SA3', '0', '', '', 'minced garlic', '', 'Ingredient', '', '', '', '', '0', '', '', '45', '1', '198g', '', '');
INSERT INTO inventory VALUES ('906', 'equipment', 'SA3', '0', '', '', 'nut meg', '', 'Ingredient', '', '', '', '', '0', '', '', '100', '1', '37g', '', '');
INSERT INTO inventory VALUES ('907', 'equipment', 'SA3', '0', '', '', 'red chili coarse', '', 'Ingredient', '', '', '', '', '0', '', '', '250', '1', '300g', '', '');
INSERT INTO inventory VALUES ('908', 'equipment', 'SA3', '0', '', '', 'beef bone powder', '', 'Ingredient', '', '', '', '', '0', '', '', '65', '1', '33g', '', '');
INSERT INTO inventory VALUES ('909', 'equipment', 'SA3', '0', '', '', 'jinqookdashi', '', 'Ingredient', '', '', '', '', '0', '', '', '286', '1', '365g', '', '');
INSERT INTO inventory VALUES ('910', 'equipment', 'SA3', '0', '', '', 'beef broth cubes', '', 'Ingredient', '', '', '', '', '0', '', '', '304', '1', '400g', '', '');
INSERT INTO inventory VALUES ('911', 'equipment', 'SA3', '0', '', '', 'chicken broth cubes', '', 'Ingredient', '', '', '', '', '0', '', '', '352', '1', '360g', '', '');
INSERT INTO inventory VALUES ('912', 'equipment', 'SA3', '0', '', '', 'Cj foods korean bbq original sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '349', '1', '840g', '', '');
INSERT INTO inventory VALUES ('913', 'equipment', 'SA3', '0', '', '', 'Sweet baby Rays Barbecue Sauce', '', 'Ingredient', '', '', '', '', '0', '', '', '389', '1', '1.13kg', '', '');
INSERT INTO inventory VALUES ('914', 'equipment', 'SA3', '0', '', '', 'Mc ilhenny Co Tabasco', '', 'Ingredient', '', '', '', '', '0', '', '', '499', '1', '350ml', '', '');
INSERT INTO inventory VALUES ('915', 'equipment', 'BA1', '0', '', '', 'S&R Dinner napkin', '', 'Tableware', '', '', '', '', '0', '', '', '289', '4', 'packs', '', '');
INSERT INTO inventory VALUES ('916', 'equipment', 'BA1', '0', '', '', 'S&R Interfolded paper tower', '', 'Tableware', '', '', '', '', '0', '', '', '289', '6', 'packs', '', '');
INSERT INTO inventory VALUES ('917', 'equipment', 'BA1', '0', '', '', 'Jade Value Table Napkin 2000 sheets', '', 'Tableware', '', '', '', '', '0', '', '', '150', '2', 'packs', '', '');
INSERT INTO inventory VALUES ('918', 'equipment', 'BA1', '0', '', '', 'S&R Jumbo roll tissue', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '489', '4', 'packs', '', '');
INSERT INTO inventory VALUES ('919', 'equipment', 'BA2', '0', '', '', 'Flat lids (iced)', '', 'Drinkware', '', '', '', '', '0', '', '', '1', '100', '100pcs', '', '');
INSERT INTO inventory VALUES ('920', 'equipment', 'BA2', '0', '', '', 'Dome Lids (iced)', '', 'Drinkware', '', '', '', '', '0', '', '', '1', '500', '100pcs', '', '');
INSERT INTO inventory VALUES ('921', 'equipment', 'BA2', '0', '', '', 'Strawless Lids(iced)', '', 'Drinkware', '', '', '', '', '0', '', '', '1', '1700', '100pcs', '', '');
INSERT INTO inventory VALUES ('922', 'equipment', 'BA2', '0', '', '', '9mm coffee lids', '', 'Drinkware', '', '', '', '', '0', '', '', '1.2', '4200', '100pcs', '', '');
INSERT INTO inventory VALUES ('923', 'equipment', 'BA2', '0', '', '', 'plastic cups 9s 16oz', '', 'Drinkware', '', '', '', '', '0', '', '', '3.3', '2900', '50pcs', '', '');
INSERT INTO inventory VALUES ('924', 'equipment', 'BA2', '0', '', '', '12 oz double wall', '', 'Drinkware', '', '', '', '', '0', '', '', '5.3', '3800', '25pcs', '', '');
INSERT INTO inventory VALUES ('925', 'equipment', 'BA2', '0', '', '', 'paper straw white (big)', '', 'Drinkware', '', '', '', '', '0', '', '', '160', '6', '25pcs', '', '');
INSERT INTO inventory VALUES ('926', 'equipment', 'BA2', '0', '', '', 'black plastic straw(big)', '', 'Drinkware', '', '', '', '', '0', '', '', '150', '2', '50pcs', '', '');
INSERT INTO inventory VALUES ('927', 'equipment', 'BA2', '0', '', '', 'paper straw white(small)', '', 'Drinkware', '', '', '', '', '0', '', '', '85', '12', '50pcs', '', '');
INSERT INTO inventory VALUES ('928', 'equipment', 'BA2', '0', '', '', 'paper bag printer w/ handle', '', 'Packaging Materials', '', '', '', '', '0', '', '', '14', '3000', '300pcs', '', '');
INSERT INTO inventory VALUES ('929', 'equipment', 'ND1', '0', '', '', 'La carne cebu Striploin PNCI', '', 'Ingredient', '', '', '', '', '0', '', '', '743.75', '20', '260g', '', '');
INSERT INTO inventory VALUES ('930', 'equipment', 'SR1', '0', '', '', 'Tuna Belly', '', 'Ingredient', '', '', '', '', '0', '', '', '335', '18', 'kg', '', '');
INSERT INTO inventory VALUES ('931', 'equipment', 'SR1', '0', '', '', 'Sesame pepper tuna', '', 'Ingredient', '', '', '', '', '0', '', '', '335', '7', 'kg', '', '');
INSERT INTO inventory VALUES ('932', 'equipment', 'SR1', '0', '', '', 'pompano', '', 'Ingredient', '', '', '', '', '0', '', '', '255', '9', 'kg', '', '');
INSERT INTO inventory VALUES ('933', 'equipment', 'SR1', '0', '', '', 'crablets', '', 'Ingredient', '', '', '', '', '0', '', '', '290', '15', 'kg', '', '');
INSERT INTO inventory VALUES ('934', 'equipment', 'SR1', '0', '', '', 'kinilaw', '', 'Ingredient', '', '', '', '', '0', '', '', '550', '17', 'kg', '', '');
INSERT INTO inventory VALUES ('935', 'equipment', 'SR1', '0', '', '', 'buttered chicken', '', 'Ingredient', '', '', '', '', '0', '', '', '150', '44', 'kg', '', '');
INSERT INTO inventory VALUES ('936', 'equipment', 'SR1', '0', '', '', 'wings', '', 'Ingredient', '', '', '', '', '0', '', '', '210', '12', 'kg', '', '');
INSERT INTO inventory VALUES ('937', 'equipment', 'SR1', '0', '', '', 'Galbi Beef', '', 'Ingredient', '', '', '', '', '0', '', '', '420', '3', 'kg', '', '');
INSERT INTO inventory VALUES ('938', 'equipment', 'SR1', '0', '', '', 'Bulalo', '', 'Ingredient', '', '', '', '', '0', '', '', '650', '26', 'kg', '', '');
INSERT INTO inventory VALUES ('939', 'equipment', 'SR1', '0', '', '', 'Pata whole', '', 'Ingredient', '', '', '', '', '0', '', '', '380', '10', 'kg', '', '');
INSERT INTO inventory VALUES ('940', 'equipment', 'SR1', '0', '', '', 'Lechon Kawali', '', 'Ingredient', '', '', '', '', '0', '', '', '380', '10', 'kg', '', '');
INSERT INTO inventory VALUES ('941', 'equipment', 'SR1', '0', '', '', 'Crispy pork', '', 'Ingredient', '', '', '', '', '0', '', '', '320', '3', 'kg', '', '');
INSERT INTO inventory VALUES ('942', 'equipment', 'SR1', '0', '', '', 'Calamari', '', 'Ingredient', '', '', '', '', '0', '', '', '225', '22', 'kg', '', '');
INSERT INTO inventory VALUES ('943', 'equipment', 'SR1', '0', '', '', 'Crabmeat', '', 'Ingredient', '', '', '', '', '0', '', '', '250', '5', 'kg', '', '');
INSERT INTO inventory VALUES ('944', 'equipment', 'TA1', '0', '', '', 'Fresh Egg', '', 'Ingredient', '', '', '', '', '0', '', '', '6', '270', 'tray', '', '');
INSERT INTO inventory VALUES ('945', 'equipment', 'TA1', '0', '', '', 'Queen-J Pack 1000ML', '', 'Packaging Materials', '', '', '', '', '0', '', '', '15', '32', 'pcs', '', '');
INSERT INTO inventory VALUES ('946', 'equipment', 'TA1', '0', '', '', 'tabasco', '', 'Ingredient', '', '', '', '', '0', '', '', '130', '7', '100ml', '', '');
INSERT INTO inventory VALUES ('947', 'equipment', 'TA1', '0', '', '', 'paper bag w/handle', '', 'Packaging Materials', '', '', '', '', '0', '', '', '15', '15', 'pcs', '', '');
INSERT INTO inventory VALUES ('948', 'equipment', 'TA1', '0', '', '', 'paper food keeper (m)', '', 'Packaging Materials', '', '', '', '', '0', '', '', '9', '45', 'pcs', '', '');
INSERT INTO inventory VALUES ('949', 'equipment', 'TA1', '0', '', '', 'plastic twine', '', 'Packaging Materials', '', '', '', '', '0', '', '', '50', '1', 'pcs', '', '');
INSERT INTO inventory VALUES ('950', 'equipment', 'SW1', '0', '', '', 'Wilkins pure water 500ml', '', '------', '', '', '', '', '0', '', '', '11', '38', 'bot', '', '');
INSERT INTO inventory VALUES ('951', 'equipment', 'SW1', '0', '', '', 'Coca cola (320 ml)', '', '------', '', '', '', '', '0', '', '', '33', '136', 'can', '', '');
INSERT INTO inventory VALUES ('952', 'equipment', 'SW1', '0', '', '', 'royal tru-orange (320 ml)', '', '------', '', '', '', '', '0', '', '', '33', '1', 'can', '', '');
INSERT INTO inventory VALUES ('953', 'equipment', 'SW1', '0', '', '', 'coca cola zero sugar (320ml)', '', '------', '', '', '', '', '0', '', '', '33', '6', 'can', '', '');
INSERT INTO inventory VALUES ('954', 'equipment', 'SW1', '0', '', '', 'Sprite 1.5L', '', '------', '', '', '', '', '0', '', '', '82', '6', '1.5L', '', '');
INSERT INTO inventory VALUES ('955', 'equipment', 'SW1', '0', '', '', 'sprite in can', '', '------', '', '', '', '', '0', '', '', '33', '53', 'can', '', '');
INSERT INTO inventory VALUES ('956', 'menu_item', '', '0', '', '', 'Salted Dulce and Chocolate Cake ', '', 'Desserts', '', '', '', '', '0', '', '', '650', '0', '', '', '');
INSERT INTO inventory VALUES ('957', 'equipment', 'FA', '0', '', '', 'HK SERVING FORK', '', 'Tableware', '', '', '', '', '0', '', '', '70', '24', 'PC', '0', '');
INSERT INTO inventory VALUES ('958', 'equipment', 'FA', '0', '', '', 'HK SOUP SPOON ', '', 'Tableware', '', '', '', '', '0', '', '', '48', '30', 'PC', '', '');
INSERT INTO inventory VALUES ('959', 'equipment', 'FA', '0', '', '', 'HK DINNER SPOON', '', 'Tableware', '', '', '', '', '0', '', '', '38', '50', '50', '', '');
INSERT INTO inventory VALUES ('960', 'equipment', 'FA', '0', '', '', 'HK DINNER FORK ', '', 'Tableware', '', '', '', '', '0', '', '', '38', '50', 'PC', '', '');
INSERT INTO inventory VALUES ('961', 'equipment', 'FA', '0', '', '', 'HK SODA SPOON', '', 'Tableware', '', '', '', '', '0', '', '', '45', '30', 'PC', '', '');
INSERT INTO inventory VALUES ('962', 'equipment', 'FA', '0', '', '', 'HK CHOP KNIFE', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '850', '1', 'PC', '', '');
INSERT INTO inventory VALUES ('963', 'equipment', 'FA', '0', '', '', '10\" KITCHEN KNIFE', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '600', '2', 'PC', '', '');
INSERT INTO inventory VALUES ('964', 'equipment', 'FA', '0', '', '', '12\" KITCHEN KNIFE', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '700', '1', 'PC', '', '');
INSERT INTO inventory VALUES ('965', 'menu_item', '', '0', '', '', 'Pistacchio Cheesecake ', '', 'Desserts', '', '', '', '', '0', '', '', '240', '1', '', '', '');
INSERT INTO inventory VALUES ('966', 'equipment', '', '0', '', '88.jpg', 'Plain grey  (Dinner Plate)', '', 'Tableware', '', '', '', '', '0', '', '', '10', '75', '0', '', '');
INSERT INTO inventory VALUES ('967', 'equipment', '', '0', '', '89.jpg', 'Dark grey ( Dinner Plate)', '', 'Tableware', '', '', '', '', '0', '', '', '10', '104', '0', '0', '');
INSERT INTO inventory VALUES ('968', 'equipment', '', '0', '', '90.jpg', 'Galbi Plate ( Dark Grey)', '', 'Tableware', '', '', '', '', '0', '', '', '10', '32', 'Pcs', '0', '');
INSERT INTO inventory VALUES ('969', 'equipment', '', '0', '', '91.jpg', 'Galbi Plate (Plain grey)', '', 'Tableware', '', '', '', '', '0', '', '', '10', '12', 'Pcs', '0', '');
INSERT INTO inventory VALUES ('970', 'equipment', '', '0', '', '92.jpg', 'White Small Plate ( Solo Rice)', '', 'Tableware', '', '', '', '', '0', '', '', '10', '63', 'Pcs', '0', '');
INSERT INTO inventory VALUES ('971', 'equipment', '', '0', '', '93.jpg', 'White Big Plate ( For Pizza)', '', 'Tableware', '', '', '', '', '0', '', '', '10', '12', 'Pcs', '0', '');
INSERT INTO inventory VALUES ('972', 'equipment', '', '0', '', '94.jpg', 'White plate (For Allegue Pasta)', '', 'Tableware', '', '', '', '', '0', '', '', '10', '14', 'Pcs', '0', '');
INSERT INTO inventory VALUES ('973', 'equipment', '', '0', '', '95.jpg', 'Ceramic Plate ( For Grilled tuna)', '', 'Tableware', '', '', '', '', '0', '', '', '10', '24', 'Pcs', '0', '');
INSERT INTO inventory VALUES ('974', 'equipment', '', '0', '', '96.jpg', 'White Plate (For Parmejana)', '', 'Tableware', '', '', '', '', '0', '', '', '10', '19', 'Pcs', '0', '');
INSERT INTO inventory VALUES ('975', 'equipment', '', '0', '', '97.jpg', 'Grey Plate ( For Cake)', '', 'Tableware', '', '', '', '', '0', '', '', '10', '15', 'Pcs', '0', '');
INSERT INTO inventory VALUES ('976', 'equipment', '', '0', '', '98.jpg', 'White Plate ( For Spaghetti)', '', 'Tableware', '', '', '', '', '0', '', '', '10', '20', 'Pcs', '0', '');
INSERT INTO inventory VALUES ('977', 'equipment', '', '0', '', '99.jpg', 'Black Liner ( For Sollontang)', '', 'Tableware', '', '', '', '', '0', '', '', '10', '27', 'Pcs', '0', '');
INSERT INTO inventory VALUES ('978', 'equipment', '', '0', '', '100.jpg', 'Black Plate', '', 'Tableware', '', '', '', '', '0', '', '', '10', '66', 'Pcs', '0', '');
INSERT INTO inventory VALUES ('979', 'equipment', '', '0', '', '101.jpg', 'Vegetarian Salad Plate', '', 'Tableware', '', '', '', '', '0', '', '', '10', '16', 'Pcs', '0', '');
INSERT INTO inventory VALUES ('980', 'equipment', '', '0', '', '102.jpg', 'Yellow Plate(For Potato Salad)', '', 'Tableware', '', '', '', '', '0', '', '', '10', '14', 'Pcs', '0', '');
INSERT INTO inventory VALUES ('981', 'equipment', '', '0', '', '103.jpg', 'Black Round Slate Plate ', '', 'Tableware', '', '', '', '', '0', '', '', '10', '11', 'Pcs', '0', '');
INSERT INTO inventory VALUES ('982', 'equipment', '', '0', '', '104.jpg', 'Black Big rectangle Plate ', '', 'Tableware', '', '', '', '', '0', '', '', '10', '6', 'Pcs', '0', '');
INSERT INTO inventory VALUES ('983', 'equipment', '', '0', '', '105.jpg', 'Black Small Slate Plate ', '', 'Tableware', '', '', '', '', '0', '', '', '10', '18', 'Pcs', '0', '');
INSERT INTO inventory VALUES ('984', 'equipment', '', '0', '', '106.jpg', 'Sizzling Plate', '', 'Tableware', '', '', '', '', '0', '', '', '10', '17', 'Pcs', '0', '');
INSERT INTO inventory VALUES ('985', 'equipment', '', '0', '', '107.jpg', 'Rectangle White (For Steamed Pompano)', '', 'Tableware', '', '', '', '', '0', '', '', '244', '24', '0', '0', '');
INSERT INTO inventory VALUES ('986', 'equipment', '', '0', '', '108.jpg', 'White Small Plate ( liner for cup)', '', 'Tableware', '', '', '', '', '0', '', '', '10', '26', 'Pcs', '0', '');
INSERT INTO inventory VALUES ('987', 'equipment', '', '0', '', '109.jpg', 'Stainless Liner Plate for Affogato', '', 'Tableware', '', '', '', '', '0', '', '', '10', '4', 'Pcs', '0', '');
INSERT INTO inventory VALUES ('988', 'equipment', '', '0', '', '110.jpg', 'Rice Plater Bowl', '', 'Tableware', '', '', '', '', '0', '', '', '10', '50', 'Pcs', '0', '');
INSERT INTO inventory VALUES ('989', 'equipment', '', '0', '', '111.jpg', 'White Bowl(For Bagnet)', '', 'Tableware', '', '', '', '', '0', '', '', '10', '14', 'Pcs', '0', '');
INSERT INTO inventory VALUES ('990', 'equipment', '', '0', '', '112.jpg', 'Salad Bowl White ', '', 'Tableware', '', '', '', '', '0', '', '', '10', '12', 'Pcs', '0', '');
INSERT INTO inventory VALUES ('991', 'equipment', '', '0', '', '113.jpg', 'Black Bowl', '', 'Tableware', '', '', '', '', '0', '', '', '10', '21', 'Pcs', '0', '');
INSERT INTO inventory VALUES ('992', 'equipment', '', '0', '', '114.jpg', 'Soup Bowl', '', 'Tableware', '', '', '', '', '0', '', '', '10', '95', 'Pcs', '0', '');
INSERT INTO inventory VALUES ('993', 'equipment', '', '0', '', '', 'Casserole Brown ', '', 'Tableware', '', '', '', '', '0', '', '', '10', '20', 'Pcs', '0', '');
INSERT INTO inventory VALUES ('994', 'equipment', '', '0', '', '115.jpg', 'Kani Salad Bowl', '', 'Tableware', '', '', '', '', '0', '', '', '10', '9', 'Pcs', '0', '');
INSERT INTO inventory VALUES ('995', 'menu_item', '', '0', '', '', 'Crispy Pata Large', '', 'To Share', 'Pork', '', '', '', '0', '', '', '859', '0', '', '', '');
INSERT INTO inventory VALUES ('996', 'menu_item', '', '0', '', '', 'Crispy Pata Small', '', 'To Share', 'Pork', '', '', '', '0', '', '', '659', '1', '', '', '');
INSERT INTO inventory VALUES ('997', 'menu_item', '', '0', '', '', 'Coldbrew', '', 'Drinks', 'Coffee', '', '', '', '0', '', '', '140', '0', '', '', '');
INSERT INTO inventory VALUES ('998', 'menu_item', '', '0', '', '', 'Almond Chocolate Cake', '', 'Desserts', '', '', '', '', '0', '', '', '520', '0', '', '', '');
INSERT INTO inventory VALUES ('999', 'equipment', '', '0', '', '152.jpg', 'Trash can (green)', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '5245', '1', '0', '0', '');
INSERT INTO inventory VALUES ('1000', 'equipment', '', '0', '', '153.jpg', 'Heavy duty trash can (black)', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '2207', '1', '', 'Pc', '');
INSERT INTO inventory VALUES ('1001', 'equipment', 'Back', '0', '4806516221207', '', 'Dinner napkins ', '', 'Packaging Materials', '', '', '', '', '0', '', '', '309', '8', '4p 50 each 2ply', 'Pack', '');
INSERT INTO inventory VALUES ('1002', 'equipment', 'Back', '0', '4809010657329', '154.jpg', 'Jumbo tissue roll', '', 'Packaging Materials', '', '', '', '', '0', '', '', '309', '3', '200m 4 rolls', '', '');
INSERT INTO inventory VALUES ('1003', 'equipment', '', '0', '733734000', '155.jpg', 'Multi storage box medium ', '', 'Kitchen Equipment', '', '', '', '', '0', '', '', '140', '3', '11 Liter ', '', '');
INSERT INTO inventory VALUES ('1004', 'equipment', '', '0', '', '156.jpg', 'Stainless german mixing', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '115', '4', '20cm', '', '');
INSERT INTO inventory VALUES ('1005', 'equipment', '', '0', '', '157.jpg', 'Stainless measuring bowl', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '235', '2', '18 cm', '', '');
INSERT INTO inventory VALUES ('1006', 'equipment', '', '0', '', '158.jpg', 'Walis tibay', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '289', '6', '1 set', '', '');
INSERT INTO inventory VALUES ('1007', 'equipment', '', '0', '', '159.jpg', 'Brush with handle ', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '290', '4', 'Pcs', 'Pcs', '');
INSERT INTO inventory VALUES ('1008', 'equipment', '', '0', '', '160.jpg', 'Window squeegee ', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '82', '4', 'Short', '', '');
INSERT INTO inventory VALUES ('1009', 'equipment', '', '0', '', '161.jpg', 'Antenna hanger', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '145', '2', '', '', '');
INSERT INTO inventory VALUES ('1010', 'equipment', 'Blue ', '0', '', '162.jpg', 'Super jumbo hanger', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '434', '1', 'Pcs', 'Pcs', '');
INSERT INTO inventory VALUES ('1011', 'equipment', '', '0', '', '163.jpg', 'Dust pan', '', 'Cleaning Supplies', '', '', '', '', '0', '', '', '586', '1', '', '', '');
INSERT INTO inventory VALUES ('1012', 'equipment', 'Pantry', '0', '6933315512378', '164.jpg', 'Wooden pepper mill', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '206', '1', '', '', '');
INSERT INTO inventory VALUES ('1013', 'equipment', 'Pantry', '0', '', '165.jpg', 'Stainless egg ring', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '71', '2', 'LS', '', '');
INSERT INTO inventory VALUES ('1014', 'equipment', 'Pantry', '0', '', '166.jpg', 'Working gloves', '', 'Construction Materials', '', '', '', '', '0', '', '', '40', '4', '#300', '', '');
INSERT INTO inventory VALUES ('1015', 'equipment', 'Pantry', '0', '', '167.jpg', 'Raincoat heavy duty', '', 'Construction Materials', '', '', '', '', '0', '', '', '345', '4', '', '', '');
INSERT INTO inventory VALUES ('1016', 'equipment', 'Pantry', '0', '', '168.jpg', 'Toothpick acrylic holder square', '', 'FOH Tools', '', '', '', '', '0', '', '', '53', '6', '', '', '');
INSERT INTO inventory VALUES ('1017', 'equipment', 'Pantry', '0', '', '169.jpg', 'Edge oval sizzling plate with wooden holder', '', 'Tableware', '', '', '', '', '0', '', '', '990', '5', '', '', '');
INSERT INTO inventory VALUES ('1018', 'equipment', 'Pantry', '0', '', '170.jpg', 'Tall shot glass clear', '', 'Drinkware', '', '', '', '', '0', '', '', '19', '12', '', '', '');
INSERT INTO inventory VALUES ('1019', 'equipment', 'Bar', '0', '', '171.jpg', 'Culinary whip cream', '', 'Kitchen Tools', '', '', '', '', '0', '', '', '3125', '1', '0.5 Liter', '', '');
INSERT INTO inventory VALUES ('1020', 'menu_item', '', '0', '', '', 'Chai Hot', '', 'Drinks', '', '', '', '', '0', '', '', '150', '100', '', '', '');
INSERT INTO inventory VALUES ('1021', 'menu_item', '', '0', '', '', 'Chai Iced', '', 'Drinks', '', '', '', '', '0', '', '', '150', '99', '', '', '');
INSERT INTO inventory VALUES ('1022', 'menu_item', '', '0', '', '', 'Wagyu Stir Fry', '', 'To Share', '', '', '', '', '0', '', '', '399', '0', '', '', '');
INSERT INTO inventory VALUES ('1023', 'menu_item', '', '0', '', '', 'Ginataang Salmon', '', 'To Share', '', '', '', '', '0', '', '', '489', '2', '', '', '');

-- Table structure for table `pantry_products` 
CREATE TABLE `pantry_products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `barcode` varchar(50) DEFAULT NULL,
  `barcode_image` text DEFAULT NULL,
  `uom` varchar(50) DEFAULT NULL,
  `department` varchar(50) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=436 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `ratings` 
CREATE TABLE `ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `overall_rating` int(11) DEFAULT NULL,
  `cleanliness_rating` int(11) DEFAULT NULL,
  `speed_rating` int(11) DEFAULT NULL,
  `quality_rating` int(11) DEFAULT NULL,
  `courtesy_rating` int(11) DEFAULT NULL,
  `concerns` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO ratings VALUES ('1', '5', '5', '5', '5', '5', 'None. Very nice people.\r\n', '2024-05-31 18:37:29');
INSERT INTO ratings VALUES ('2', '4', '5', '4', '4', '5', 'Nice place and nice services', '2024-05-31 18:39:37');
INSERT INTO ratings VALUES ('3', '4', '5', '4', '5', '4', '', '2024-05-31 18:46:26');
INSERT INTO ratings VALUES ('4', '4', '5', '4', '4', '4', '', '2024-05-31 19:21:45');
INSERT INTO ratings VALUES ('5', '5', '5', '5', '5', '5', '', '2024-05-31 19:41:20');
INSERT INTO ratings VALUES ('6', '4', '4', '4', '4', '4', 'Place and ambiance are very nice, food are delicious.', '2024-05-31 19:45:41');
INSERT INTO ratings VALUES ('7', '5', '5', '5', '5', '5', '', '2024-05-31 19:48:37');
INSERT INTO ratings VALUES ('8', '5', '5', '5', '5', '5', 'So good and nice ambiance', '2024-05-31 19:50:43');
INSERT INTO ratings VALUES ('9', '5', '5', '5', '5', '5', '', '2024-05-31 19:56:34');
INSERT INTO ratings VALUES ('10', '0', '0', '5', '5', '5', 'daghang salamat sa pagpatilaw namo og perting lamiang mga pagkaon 🙏', '2024-06-01 20:41:40');
INSERT INTO ratings VALUES ('11', '5', '5', '5', '5', '5', '', '2024-06-02 20:05:09');
INSERT INTO ratings VALUES ('12', '5', '5', '5', '5', '5', '', '2024-06-02 20:05:50');
INSERT INTO ratings VALUES ('13', '5', '4', '5', '5', '5', 'May langaw.\r\n', '2024-06-02 20:07:47');
INSERT INTO ratings VALUES ('14', '3', '5', '4', '3', '4', 'Gamay ra ang kapilian sa food', '2024-06-02 20:23:58');
INSERT INTO ratings VALUES ('15', '5', '5', '5', '5', '5', 'Everything is organize, the food is great and the service is good.', '2024-06-02 20:26:15');
INSERT INTO ratings VALUES ('16', '0', '0', '0', '0', '5', '', '2024-06-02 20:35:19');
INSERT INTO ratings VALUES ('17', '5', '5', '5', '5', '5', '', '2024-06-02 21:17:21');
INSERT INTO ratings VALUES ('18', '0', '0', '0', '0', '5', '', '2024-06-03 12:57:25');
INSERT INTO ratings VALUES ('19', '3', '3', '3', '3', '3', '', '2024-06-03 16:59:56');
INSERT INTO ratings VALUES ('20', '4', '5', '5', '5', '4', 'The owner should expand the place', '2024-06-03 19:29:04');
INSERT INTO ratings VALUES ('21', '5', '5', '4', '5', '5', 'None', '2024-06-03 19:31:40');
INSERT INTO ratings VALUES ('22', '5', '5', '4', '5', '5', '', '2024-06-03 19:34:37');
INSERT INTO ratings VALUES ('23', '5', '5', '5', '5', '5', 'Food and services is excellent', '2024-06-03 19:41:09');
INSERT INTO ratings VALUES ('24', '5', '5', '3', '4', '5', '', '2024-06-03 19:42:16');
INSERT INTO ratings VALUES ('25', '5', '5', '5', '5', '4', '10/10 I don\'t have any concern but I will rate it 10/10 will definitely back here, them!', '2024-06-03 19:53:09');
INSERT INTO ratings VALUES ('26', '5', '5', '5', '5', '5', '', '2024-06-03 19:56:05');
INSERT INTO ratings VALUES ('27', '5', '5', '5', '5', '5', '', '2024-06-03 19:56:05');
INSERT INTO ratings VALUES ('28', '5', '5', '5', '5', '5', '', '2024-06-03 20:02:41');
INSERT INTO ratings VALUES ('29', '5', '5', '5', '5', '5', '', '2024-06-03 20:08:54');
INSERT INTO ratings VALUES ('30', '4', '5', '4', '4', '4', '', '2024-06-03 20:10:01');
INSERT INTO ratings VALUES ('31', '5', '4', '4', '4', '5', '', '2024-06-03 20:10:48');
INSERT INTO ratings VALUES ('32', '5', '5', '5', '5', '5', '', '2024-06-03 20:19:07');
INSERT INTO ratings VALUES ('33', '4', '3', '4', '4', '4', '', '2024-06-04 15:01:49');
INSERT INTO ratings VALUES ('34', '5', '5', '5', '5', '5', '', '2024-06-04 17:49:41');
INSERT INTO ratings VALUES ('35', '4', '4', '4', '4', '5', '', '2024-06-04 18:07:42');
INSERT INTO ratings VALUES ('36', '5', '5', '5', '5', '5', '', '2024-06-04 18:08:12');
INSERT INTO ratings VALUES ('37', '4', '4', '4', '4', '5', 'If you can add more on the cakes to go with your coffee, that will make the experience so much better. ', '2024-06-04 18:21:43');
INSERT INTO ratings VALUES ('38', '5', '5', '5', '5', '5', 'Ordering is taking so much time', '2024-06-04 18:23:10');
INSERT INTO ratings VALUES ('39', '4', '4', '5', '4', '5', '', '2024-06-04 18:28:52');
INSERT INTO ratings VALUES ('40', '4', '5', '4', '4', '4', '', '2024-06-04 18:46:50');
INSERT INTO ratings VALUES ('41', '4', '5', '5', '5', '5', '', '2024-06-04 19:50:05');
INSERT INTO ratings VALUES ('42', '4', '5', '5', '5', '5', '', '2024-06-04 19:50:05');
INSERT INTO ratings VALUES ('43', '4', '5', '5', '5', '5', '', '2024-06-04 19:50:05');
INSERT INTO ratings VALUES ('44', '4', '5', '5', '5', '5', '', '2024-06-04 19:50:07');
INSERT INTO ratings VALUES ('45', '4', '5', '4', '4', '4', '', '2024-06-04 19:57:17');
INSERT INTO ratings VALUES ('46', '4', '5', '5', '5', '5', 'Low class rice\r\n', '2024-06-04 20:13:37');
INSERT INTO ratings VALUES ('47', '5', '5', '5', '5', '5', '', '2024-06-04 20:14:58');
INSERT INTO ratings VALUES ('48', '5', '5', '4', '4', '5', '', '2024-06-05 19:35:37');
INSERT INTO ratings VALUES ('49', '5', '5', '5', '5', '5', '', '2024-06-05 19:44:05');
INSERT INTO ratings VALUES ('50', '5', '5', '5', '5', '5', '', '2024-06-05 19:45:14');
INSERT INTO ratings VALUES ('51', '5', '5', '5', '5', '5', 'Please find ways to improve the water supply of your comfort room 🙂', '2024-06-05 20:05:13');
INSERT INTO ratings VALUES ('52', '5', '5', '5', '5', '5', 'Very nice ambiance 🙂', '2024-06-05 20:10:27');
INSERT INTO ratings VALUES ('53', '5', '4', '5', '5', '5', '', '2024-06-05 20:13:52');
INSERT INTO ratings VALUES ('54', '5', '5', '5', '5', '5', 'Accommodating staff. 👍👍👍', '2024-06-05 20:19:38');
INSERT INTO ratings VALUES ('55', '4', '5', '2', '5', '5', 'The food was great but the speed of the service is a bit bad their are too slow to respond to the customers', '2024-06-05 20:20:51');
INSERT INTO ratings VALUES ('56', '5', '5', '5', '5', '5', 'Food was really delicious and the waitress was so nice and good service. ', '2024-06-06 11:26:46');
INSERT INTO ratings VALUES ('57', '5', '5', '5', '5', '5', '', '2024-06-06 11:49:54');
INSERT INTO ratings VALUES ('58', '5', '5', '4', '5', '5', '', '2024-06-07 14:17:36');
INSERT INTO ratings VALUES ('59', '5', '5', '4', '4', '5', '', '2024-06-07 14:20:05');
INSERT INTO ratings VALUES ('60', '5', '4', '5', '5', '5', 'Naay Langaw', '2024-06-07 15:17:05');
INSERT INTO ratings VALUES ('61', '5', '5', '5', '5', '4', '', '2024-06-07 18:05:04');
INSERT INTO ratings VALUES ('62', '5', '5', '5', '5', '5', 'Love the food', '2024-06-07 18:23:26');
INSERT INTO ratings VALUES ('63', '5', '5', '5', '4', '5', '', '2024-06-07 18:48:30');
INSERT INTO ratings VALUES ('64', '5', '5', '4', '5', '5', '', '2024-06-07 18:54:47');
INSERT INTO ratings VALUES ('65', '4', '5', '5', '5', '5', '', '2024-06-07 18:58:01');
INSERT INTO ratings VALUES ('66', '5', '5', '5', '5', '5', 'Excellent food and fast service. Waiters and servers are genuinely looking for the needs of the customers.', '2024-06-07 18:58:33');
INSERT INTO ratings VALUES ('67', '5', '5', '5', '5', '5', '', '2024-06-07 19:03:56');
INSERT INTO ratings VALUES ('68', '5', '5', '5', '5', '5', '', '2024-06-07 19:37:23');
INSERT INTO ratings VALUES ('69', '4', '4', '3', '4', '4', '', '2024-06-07 20:02:55');
INSERT INTO ratings VALUES ('70', '5', '5', '5', '5', '5', 'Nice experience ', '2024-06-07 20:19:05');
INSERT INTO ratings VALUES ('71', '5', '4', '5', '5', '5', 'Food is great.. keep it up', '2024-06-07 20:23:26');
INSERT INTO ratings VALUES ('72', '4', '3', '4', '5', '5', 'None.', '2024-06-07 20:55:48');
INSERT INTO ratings VALUES ('73', '5', '5', '5', '5', '5', '', '2024-06-08 17:53:17');
INSERT INTO ratings VALUES ('74', '4', '4', '4', '3', '4', '', '2024-06-08 18:37:16');
INSERT INTO ratings VALUES ('75', '5', '5', '5', '5', '5', '', '2024-06-08 19:23:27');
INSERT INTO ratings VALUES ('76', '5', '5', '5', '4', '5', '', '2024-06-09 18:58:56');
INSERT INTO ratings VALUES ('77', '5', '5', '5', '5', '5', '', '2024-06-09 19:08:44');
INSERT INTO ratings VALUES ('78', '5', '5', '4', '5', '4', '', '2024-06-09 19:25:57');
INSERT INTO ratings VALUES ('79', '5', '5', '5', '5', '4', '', '2024-06-09 19:39:06');
INSERT INTO ratings VALUES ('80', '5', '5', '5', '5', '5', '', '2024-06-10 13:53:40');
INSERT INTO ratings VALUES ('81', '5', '4', '4', '4', '5', '', '2024-06-10 13:57:30');
INSERT INTO ratings VALUES ('82', '5', '5', '5', '5', '5', '', '2024-06-10 14:13:41');
INSERT INTO ratings VALUES ('83', '5', '5', '5', '5', '5', 'Delicious food', '2024-06-10 16:22:16');
INSERT INTO ratings VALUES ('84', '4', '4', '4', '4', '4', 'Congrats you u know how to take good care of it customer.', '2024-06-10 20:51:22');
INSERT INTO ratings VALUES ('85', '5', '5', '5', '5', '5', 'Foods are delicious. The staffs are approachable. Good service', '2024-06-10 20:52:29');
INSERT INTO ratings VALUES ('86', '5', '5', '5', '5', '5', 'Wonderful restaurant, top quality cuisine, and an amazing view of Iligan 😀', '2024-06-10 21:54:34');
INSERT INTO ratings VALUES ('87', '5', '5', '4', '5', '5', 'We\'re very satisfied with the overall Courtney & service.', '2024-06-10 21:55:24');
INSERT INTO ratings VALUES ('88', '4', '5', '3', '3', '5', '', '2024-06-11 11:19:40');
INSERT INTO ratings VALUES ('89', '5', '4', '5', '5', '4', 'Food was delectable. Server needs to be more attentive. ', '2024-06-11 16:51:30');
INSERT INTO ratings VALUES ('90', '5', '5', '5', '5', '4', '', '2024-06-11 16:57:35');
INSERT INTO ratings VALUES ('91', '5', '5', '5', '5', '5', '', '2024-06-11 17:38:34');
INSERT INTO ratings VALUES ('92', '4', '4', '4', '3', '5', '', '2024-06-11 17:40:42');
INSERT INTO ratings VALUES ('93', '5', '4', '5', '4', '5', '', '2024-06-11 18:43:11');
INSERT INTO ratings VALUES ('94', '5', '5', '5', '5', '5', 'Great food and service', '2024-06-11 19:18:51');
INSERT INTO ratings VALUES ('95', '5', '5', '4', '4', '5', '', '2024-06-11 19:19:46');
INSERT INTO ratings VALUES ('96', '5', '5', '4', '5', '5', 'Good food and service. Til next time. :)', '2024-06-11 19:20:09');
INSERT INTO ratings VALUES ('97', '4', '4', '4', '4', '3', '', '2024-06-11 20:51:07');
INSERT INTO ratings VALUES ('98', '5', '5', '5', '5', '5', '', '2024-06-11 20:53:39');
INSERT INTO ratings VALUES ('99', '4', '5', '5', '4', '4', '', '2024-06-11 21:06:56');
INSERT INTO ratings VALUES ('100', '5', '5', '5', '4', '5', 'Galbi-jimm - meat is overcooked/hard', '2024-06-12 19:03:25');
INSERT INTO ratings VALUES ('101', '5', '5', '5', '5', '5', 'Nice\r\nThank you Gio', '2024-06-12 20:48:39');
INSERT INTO ratings VALUES ('102', '5', '5', '5', '5', '5', '', '2024-06-12 20:49:13');
INSERT INTO ratings VALUES ('103', '5', '5', '5', '4', '5', 'Thank you. We\'re so happy Po.', '2024-06-12 20:56:33');
INSERT INTO ratings VALUES ('104', '5', '5', '5', '5', '5', '', '2024-06-12 21:00:09');
INSERT INTO ratings VALUES ('105', '5', '5', '5', '5', '5', '', '2024-06-12 21:01:13');
INSERT INTO ratings VALUES ('106', '5', '5', '5', '5', '5', 'Good food and good ambiance.', '2024-06-13 13:27:12');
INSERT INTO ratings VALUES ('107', '5', '5', '2', '3', '5', '', '2024-06-13 13:28:22');
INSERT INTO ratings VALUES ('108', '5', '4', '4', '5', '4', '', '2024-06-13 17:41:11');
INSERT INTO ratings VALUES ('109', '5', '5', '4', '4', '5', 'Good services and Quality food', '2024-06-13 17:51:00');
INSERT INTO ratings VALUES ('110', '4', '5', '4', '4', '4', '', '2024-06-13 17:51:36');
INSERT INTO ratings VALUES ('111', '5', '5', '4', '5', '5', '', '2024-06-13 19:15:27');
INSERT INTO ratings VALUES ('112', '5', '5', '5', '5', '5', 'Very nice plating and presentation', '2024-06-13 19:16:13');
INSERT INTO ratings VALUES ('113', '5', '5', '5', '5', '5', 'Kodus!Keep it up, Avodah!', '2024-06-13 19:17:49');
INSERT INTO ratings VALUES ('114', '5', '5', '4', '4', '5', '', '2024-06-13 19:18:58');
INSERT INTO ratings VALUES ('115', '5', '5', '5', '5', '5', 'Thank you for your great service and sumptous foods.', '2024-06-13 19:49:43');
INSERT INTO ratings VALUES ('116', '4', '3', '4', '5', '4', 'Berry cool', '2024-06-13 19:50:54');
INSERT INTO ratings VALUES ('117', '5', '5', '5', '5', '5', 'You have a really nice place with very accommodating staff. Your staff are all well trained in customer service. This is a 5/5 restaurant experience in Iligan.', '2024-06-14 19:40:30');
INSERT INTO ratings VALUES ('118', '4', '4', '4', '4', '4', '', '2024-06-14 19:44:47');
INSERT INTO ratings VALUES ('119', '4', '4', '5', '5', '5', '', '2024-06-15 15:07:55');
INSERT INTO ratings VALUES ('120', '5', '5', '5', '5', '5', 'Great customer service and food is tasty. Good service by GIO.😊😊😊', '2024-06-15 18:20:22');
INSERT INTO ratings VALUES ('121', '5', '5', '5', '5', '5', 'Good service. Good food!', '2024-06-15 19:51:36');
INSERT INTO ratings VALUES ('122', '5', '5', '5', '5', '5', '', '2024-06-16 14:38:06');
INSERT INTO ratings VALUES ('123', '5', '5', '5', '5', '5', 'Good food', '2024-06-16 14:41:20');
INSERT INTO ratings VALUES ('124', '5', '4', '5', '4', '5', '', '2024-06-16 14:42:11');
INSERT INTO ratings VALUES ('125', '5', '5', '5', '5', '5', '', '2024-06-16 16:32:39');
INSERT INTO ratings VALUES ('126', '4', '3', '5', '5', '5', '', '2024-06-16 17:08:22');
INSERT INTO ratings VALUES ('127', '5', '5', '5', '4', '5', '', '2024-06-16 17:48:30');
INSERT INTO ratings VALUES ('128', '5', '5', '5', '5', '5', '', '2024-06-16 18:39:36');
INSERT INTO ratings VALUES ('129', '5', '4', '4', '4', '5', 'None so far', '2024-06-16 21:03:54');
INSERT INTO ratings VALUES ('130', '5', '5', '5', '5', '5', 'We\'ll probably come back next time.🙂', '2024-06-17 13:19:50');
INSERT INTO ratings VALUES ('131', '5', '4', '5', '5', '5', '', '2024-06-17 13:43:54');
INSERT INTO ratings VALUES ('132', '5', '5', '5', '5', '5', 'The service was immaculate! The restaurant was very clean and the servers and hosts we\'re very nice. I would love to go back to this as it has been one of the most pleasant experiences I\'ve come to have in Iligan City. Thanks!', '2024-06-17 13:48:38');
INSERT INTO ratings VALUES ('133', '5', '5', '5', '5', '5', '', '2024-06-17 20:33:09');
INSERT INTO ratings VALUES ('134', '5', '5', '5', '5', '5', '', '2024-06-17 20:49:32');
INSERT INTO ratings VALUES ('135', '5', '5', '5', '5', '5', '', '2024-06-18 11:40:14');
INSERT INTO ratings VALUES ('136', '4', '5', '4', '4', '5', '', '2024-06-18 11:44:44');
INSERT INTO ratings VALUES ('137', '5', '5', '5', '5', '5', '', '2024-06-18 13:58:32');
INSERT INTO ratings VALUES ('138', '5', '4', '5', '5', '5', '', '2024-06-18 14:15:27');
INSERT INTO ratings VALUES ('139', '5', '5', '5', '5', '5', '', '2024-06-18 14:24:51');
INSERT INTO ratings VALUES ('140', '4', '4', '4', '4', '4', 'Food is good\r\n ', '2024-06-18 14:41:27');
INSERT INTO ratings VALUES ('141', '5', '5', '5', '5', '5', '', '2024-06-18 15:22:12');
INSERT INTO ratings VALUES ('142', '4', '4', '4', '4', '4', '', '2024-06-19 12:30:23');
INSERT INTO ratings VALUES ('143', '5', '5', '5', '5', '5', '', '2024-06-19 13:22:52');
INSERT INTO ratings VALUES ('144', '5', '5', '5', '5', '5', 'Very tasty food', '2024-06-19 18:49:59');
INSERT INTO ratings VALUES ('145', '4', '4', '5', '4', '5', '', '2024-06-19 18:51:44');
INSERT INTO ratings VALUES ('146', '5', '5', '5', '5', '5', 'Very accommodating. Yummy foods🥰🥰Will come back again.\r\n', '2024-06-19 18:52:00');
INSERT INTO ratings VALUES ('147', '5', '5', '5', '5', '5', '', '2024-06-19 20:08:48');
INSERT INTO ratings VALUES ('148', '5', '4', '5', '5', '5', 'We love your food. It\'s our 2nd time here. Your service staff are friendly and attentive. We highly recommend ur restaurant to our friends . Big appreciation to the chef ', '2024-06-19 20:54:28');
INSERT INTO ratings VALUES ('149', '5', '5', '5', '5', '5', '', '2024-06-20 19:32:34');
INSERT INTO ratings VALUES ('150', '4', '3', '4', '4', '5', 'Good attentiveness by staff, wonderful', '2024-06-20 19:34:29');
INSERT INTO ratings VALUES ('151', '4', '5', '3', '3', '3', 'The food service was kinda slow. If there are additional requests, it is not easily entertained.', '2024-06-20 19:39:58');
INSERT INTO ratings VALUES ('152', '5', '5', '4', '5', '5', '', '2024-06-20 19:47:54');
INSERT INTO ratings VALUES ('153', '5', '5', '5', '5', '5', '', '2024-06-20 20:21:21');
INSERT INTO ratings VALUES ('154', '5', '5', '5', '5', '5', 'Overall, our experience is great. It would be nice if the restaurant offers a valet service. since parking space is steep. ', '2024-06-20 21:24:25');
INSERT INTO ratings VALUES ('155', '5', '5', '5', '5', '5', 'Thank you for your good service', '2024-06-21 13:39:13');
INSERT INTO ratings VALUES ('156', '5', '5', '5', '5', '5', 'Good service and yummy foods 🥰', '2024-06-21 13:45:43');
INSERT INTO ratings VALUES ('157', '4', '5', '5', '4', '4', '', '2024-06-21 13:58:17');
INSERT INTO ratings VALUES ('158', '5', '5', '5', '5', '5', 'Good food that we can\'t resist!', '2024-06-21 16:46:59');
INSERT INTO ratings VALUES ('159', '3', '5', '4', '4', '5', '', '2024-06-21 17:19:50');
INSERT INTO ratings VALUES ('160', '5', '5', '5', '5', '4', '', '2024-06-21 17:35:17');
INSERT INTO ratings VALUES ('161', '5', '5', '4', '5', '5', '', '2024-06-21 17:35:18');
INSERT INTO ratings VALUES ('162', '5', '5', '5', '5', '5', 'Food is great', '2024-06-21 17:36:22');
INSERT INTO ratings VALUES ('163', '5', '5', '5', '5', '5', 'Had a wonderful time with friends, awesome service! ', '2024-06-21 18:53:29');
INSERT INTO ratings VALUES ('164', '5', '5', '5', '5', '4', '', '2024-06-21 19:00:48');
INSERT INTO ratings VALUES ('165', '4', '5', '4', '4', '5', '', '2024-06-21 19:20:09');
INSERT INTO ratings VALUES ('166', '5', '5', '5', '5', '5', 'Highly recommendable resto in Iligan', '2024-06-21 19:20:20');
INSERT INTO ratings VALUES ('167', '5', '5', '5', '5', '5', 'Good food, quality service! <3', '2024-06-21 19:22:11');
INSERT INTO ratings VALUES ('168', '5', '5', '5', '5', '5', 'The food is good.', '2024-06-21 19:43:14');
INSERT INTO ratings VALUES ('169', '5', '5', '5', '5', '5', 'Excellent', '2024-06-21 19:54:46');
INSERT INTO ratings VALUES ('170', '4', '4', '4', '4', '4', 'Alhamdulillah.. steak is halal', '2024-06-21 20:05:21');
INSERT INTO ratings VALUES ('171', '4', '4', '5', '4', '5', 'More menu esp. seafoods I guess. ', '2024-06-21 20:11:55');
INSERT INTO ratings VALUES ('172', '5', '5', '5', '4', '5', '', '2024-06-21 20:19:28');
INSERT INTO ratings VALUES ('173', '5', '5', '5', '4', '5', '', '2024-06-21 20:57:03');
INSERT INTO ratings VALUES ('174', '5', '5', '4', '5', '5', 'God bless you more', '2024-06-21 21:13:38');
INSERT INTO ratings VALUES ('175', '5', '5', '5', '5', '5', '', '2024-06-22 14:53:02');
INSERT INTO ratings VALUES ('176', '4', '5', '5', '3', '3', 'So satisfying ', '2024-06-22 18:35:54');
INSERT INTO ratings VALUES ('177', '4', '5', '4', '3', '5', '', '2024-06-22 18:41:16');
INSERT INTO ratings VALUES ('178', '5', '5', '5', '5', '5', '', '2024-06-22 18:52:50');
INSERT INTO ratings VALUES ('179', '4', '5', '4', '5', '5', '', '2024-06-22 18:53:39');
INSERT INTO ratings VALUES ('180', '5', '5', '5', '5', '5', '', '2024-06-22 18:58:16');
INSERT INTO ratings VALUES ('181', '5', '5', '5', '5', '5', 'Delicious foods and excellent customer service.', '2024-06-22 19:11:12');
INSERT INTO ratings VALUES ('182', '5', '5', '5', '4', '5', 'Overall excellence', '2024-06-22 19:17:57');
INSERT INTO ratings VALUES ('183', '5', '4', '5', '5', '5', 'We always keep coming back to Avodah. Keep up the good work. Hopefully the restaurant will consider putting paper place mats which will also add in the aesthetics of the table. ', '2024-06-22 19:22:18');
INSERT INTO ratings VALUES ('184', '5', '5', '4', '4', '5', '', '2024-06-22 19:26:41');
INSERT INTO ratings VALUES ('185', '5', '5', '5', '5', '5', '', '2024-06-22 19:29:58');
INSERT INTO ratings VALUES ('186', '5', '5', '5', '5', '5', 'More pastry choices\r\n', '2024-06-22 19:57:56');
INSERT INTO ratings VALUES ('187', '5', '5', '5', '5', '5', 'Masarap ang mga foods, mabilis dumating ang inorder at maganda ang place.😍😍', '2024-06-22 20:01:22');
INSERT INTO ratings VALUES ('188', '4', '5', '4', '5', '4', '', '2024-06-22 20:10:47');
INSERT INTO ratings VALUES ('189', '5', '5', '5', '5', '5', '', '2024-06-23 12:49:53');
INSERT INTO ratings VALUES ('190', '5', '5', '5', '5', '5', '', '2024-06-23 12:51:46');
INSERT INTO ratings VALUES ('191', '4', '4', '4', '4', '5', '', '2024-06-23 12:56:12');
INSERT INTO ratings VALUES ('192', '5', '5', '5', '5', '5', '', '2024-06-23 13:26:51');
INSERT INTO ratings VALUES ('193', '5', '5', '5', '5', '5', '', '2024-06-23 13:27:28');
INSERT INTO ratings VALUES ('194', '4', '5', '4', '4', '5', 'Plz next time dapat sabay sabay lang food ug served plz so far keep up the Good work team', '2024-06-23 13:43:05');
INSERT INTO ratings VALUES ('195', '4', '5', '4', '5', '3', '', '2024-06-23 13:43:40');
INSERT INTO ratings VALUES ('196', '5', '5', '5', '5', '5', '', '2024-06-23 13:52:45');
INSERT INTO ratings VALUES ('197', '4', '5', '4', '5', '5', '\r\n', '2024-06-23 13:53:00');
INSERT INTO ratings VALUES ('198', '4', '4', '5', '5', '5', 'Good\r\n', '2024-06-23 14:02:02');
INSERT INTO ratings VALUES ('199', '5', '5', '4', '5', '5', '', '2024-06-23 14:02:08');
INSERT INTO ratings VALUES ('200', '4', '4', '4', '3', '4', '', '2024-06-23 14:12:55');
INSERT INTO ratings VALUES ('201', '5', '5', '5', '5', '5', 'I enjoy here in AVODA, Celebrating for the 20th Year Anniversary of my husband. 🙂🥰 #ILoveAVODA', '2024-06-23 16:51:50');
INSERT INTO ratings VALUES ('202', '5', '5', '5', '5', '5', '', '2024-06-23 18:23:55');
INSERT INTO ratings VALUES ('203', '5', '4', '5', '4', '5', '', '2024-06-23 18:27:17');
INSERT INTO ratings VALUES ('204', '5', '5', '5', '5', '5', 'Servers are very kind', '2024-06-23 18:29:22');
INSERT INTO ratings VALUES ('205', '4', '5', '3', '4', '4', '', '2024-06-23 18:48:28');
INSERT INTO ratings VALUES ('206', '5', '5', '3', '5', '5', '', '2024-06-23 18:57:02');
INSERT INTO ratings VALUES ('207', '4', '5', '4', '5', '5', 'Ever Yummy', '2024-06-23 19:18:14');
INSERT INTO ratings VALUES ('208', '5', '5', '5', '5', '5', 'The food and people are great. Highly recommend the place, very accommodating.', '2024-06-23 19:33:44');
INSERT INTO ratings VALUES ('209', '5', '2', '5', '3', '5', 'Aan okok huhu', '2024-06-23 19:40:13');
INSERT INTO ratings VALUES ('210', '5', '5', '5', '5', '5', '', '2024-06-23 19:45:22');
INSERT INTO ratings VALUES ('211', '5', '5', '5', '3', '5', 'The ambiance is superb. Food\'s taste could still be improved. Overall, the dining experience is grate. God Bless!', '2024-06-23 19:52:04');
INSERT INTO ratings VALUES ('212', '5', '5', '5', '5', '5', '', '2024-06-23 20:57:16');
INSERT INTO ratings VALUES ('213', '5', '5', '5', '5', '5', 'Happy to dine here. Very delicious food. Thank you!', '2024-06-24 11:53:38');
INSERT INTO ratings VALUES ('214', '5', '5', '5', '5', '5', 'Improve billing time. It seems taking too long to bill out.', '2024-06-24 12:28:49');
INSERT INTO ratings VALUES ('215', '5', '5', '5', '5', '5', '', '2024-06-24 12:29:55');
INSERT INTO ratings VALUES ('216', '4', '4', '4', '4', '4', 'Ung straw ng  kiwi mashadong mahaba hahaha ✌️ ', '2024-06-24 13:58:30');
INSERT INTO ratings VALUES ('217', '5', '5', '5', '5', '5', '', '2024-06-24 19:01:56');
INSERT INTO ratings VALUES ('218', '5', '5', '5', '5', '5', 'The food and your service absolutely awesome! Where from Cagayan de Oro and didn\'t expect that your service absolutely awesome and the food was the BEST and the place 🥰🥰🥰🥰', '2024-06-25 13:18:01');
INSERT INTO ratings VALUES ('219', '4', '5', '4', '4', '4', '', '2024-06-25 15:32:22');
INSERT INTO ratings VALUES ('220', '5', '5', '4', '4', '5', '', '2024-06-25 16:00:31');
INSERT INTO ratings VALUES ('221', '5', '5', '5', '5', '5', '', '2024-06-25 16:06:32');
INSERT INTO ratings VALUES ('222', '5', '5', '4', '5', '5', '', '2024-06-25 16:54:40');
INSERT INTO ratings VALUES ('223', '5', '5', '5', '5', '5', 'Very good food.\r\n', '2024-06-25 19:08:09');
INSERT INTO ratings VALUES ('224', '5', '5', '5', '4', '5', '', '2024-06-25 19:16:22');
INSERT INTO ratings VALUES ('225', '4', '5', '4', '5', '5', 'None', '2024-06-25 19:30:32');
INSERT INTO ratings VALUES ('226', '5', '5', '5', '5', '5', '', '2024-06-25 19:54:58');
INSERT INTO ratings VALUES ('227', '4', '4', '5', '5', '3', 'Mas ok if naay anti insects sa gawas daghan lamok or mamaak then naay ok ok nilupad ganina', '2024-06-25 20:11:10');
INSERT INTO ratings VALUES ('228', '4', '4', '4', '4', '4', '', '2024-06-25 20:17:42');
INSERT INTO ratings VALUES ('229', '4', '4', '4', '5', '4', '', '2024-06-25 20:36:54');
INSERT INTO ratings VALUES ('230', '5', '5', '5', '5', '5', 'Best food in town', '2024-06-25 20:40:30');
INSERT INTO ratings VALUES ('231', '3', '4', '3', '3', '4', 'Veggie salad not fresh LATA and Laya ang Lettuce', '2024-06-25 20:48:27');
INSERT INTO ratings VALUES ('232', '4', '5', '5', '4', '5', 'The food is good.', '2024-06-26 13:24:55');
INSERT INTO ratings VALUES ('233', '5', '5', '5', '5', '5', 'Thank you!', '2024-06-26 13:37:49');
INSERT INTO ratings VALUES ('234', '5', '5', '5', '5', '5', 'Cravings satisfied ', '2024-06-26 18:51:47');
INSERT INTO ratings VALUES ('235', '5', '5', '4', '4', '3', '', '2024-06-26 18:56:20');
INSERT INTO ratings VALUES ('236', '5', '5', '5', '5', '5', 'I love it😍😍😍', '2024-06-26 18:56:38');
INSERT INTO ratings VALUES ('237', '5', '5', '5', '5', '5', 'Excellent food.. great customer service 👍', '2024-06-26 19:14:10');
INSERT INTO ratings VALUES ('238', '5', '5', '5', '5', '5', '', '2024-06-26 19:14:34');
INSERT INTO ratings VALUES ('239', '4', '4', '4', '4', '4', '', '2024-06-26 19:48:03');
INSERT INTO ratings VALUES ('240', '5', '5', '4', '4', '4', '', '2024-06-26 19:48:47');
INSERT INTO ratings VALUES ('241', '4', '5', '4', '4', '5', 'You might want to upgrade your table napkins bc 1 tissue is really not enough 😅', '2024-06-26 19:54:59');
INSERT INTO ratings VALUES ('242', '5', '5', '5', '5', '5', '', '2024-06-26 20:32:48');
INSERT INTO ratings VALUES ('243', '5', '5', '5', '5', '5', 'Excellent\r\n', '2024-06-26 20:34:17');
INSERT INTO ratings VALUES ('244', '5', '5', '5', '5', '5', '', '2024-06-27 13:21:58');
INSERT INTO ratings VALUES ('245', '5', '4', '4', '4', '4', 'The food is delicious', '2024-06-27 13:33:35');
INSERT INTO ratings VALUES ('246', '5', '5', '5', '5', '5', '', '2024-06-27 13:34:03');
INSERT INTO ratings VALUES ('247', '5', '5', '5', '5', '5', '', '2024-06-27 13:45:37');
INSERT INTO ratings VALUES ('248', '5', '5', '4', '5', '5', '', '2024-06-27 13:49:05');
INSERT INTO ratings VALUES ('249', '5', '5', '5', '5', '5', '', '2024-06-27 13:58:41');
INSERT INTO ratings VALUES ('250', '4', '4', '3', '4', '5', '', '2024-06-27 14:10:15');
INSERT INTO ratings VALUES ('251', '3', '4', '4', '4', '4', '', '2024-06-27 15:34:42');
INSERT INTO ratings VALUES ('252', '5', '4', '5', '5', '5', '', '2024-06-27 18:18:18');
INSERT INTO ratings VALUES ('253', '5', '5', '5', '5', '5', 'Excellent kaya bumalik kami 4th time around\r\n\r\nThank you Avodah!', '2024-06-27 19:01:17');
INSERT INTO ratings VALUES ('254', '5', '5', '5', '5', '5', '', '2024-06-27 20:02:20');
INSERT INTO ratings VALUES ('255', '5', '5', '4', '5', '5', 'Love the place for sure we will visit again', '2024-06-27 20:29:06');
INSERT INTO ratings VALUES ('256', '5', '5', '3', '5', '5', '', '2024-06-27 20:31:48');
INSERT INTO ratings VALUES ('257', '5', '5', '5', '5', '5', 'The staffs customer service is really great especially Gio! Thank you. Will come back!', '2024-06-27 20:48:28');
INSERT INTO ratings VALUES ('258', '5', '5', '5', '5', '5', 'Ms. Gio and other crews were very accommodating and approachable\r\n', '2024-06-27 20:49:16');
INSERT INTO ratings VALUES ('259', '4', '5', '4', '4', '5', '', '2024-06-27 20:57:08');
INSERT INTO ratings VALUES ('260', '5', '4', '4', '4', '5', '', '2024-06-27 21:01:11');
INSERT INTO ratings VALUES ('261', '5', '5', '5', '5', '5', '', '2024-06-28 13:48:04');
INSERT INTO ratings VALUES ('262', '4', '4', '4', '4', '4', '', '2024-06-28 14:26:16');
INSERT INTO ratings VALUES ('263', '5', '5', '5', '5', '5', 'Thank you for good service 😊', '2024-06-28 14:36:31');
INSERT INTO ratings VALUES ('264', '5', '5', '5', '5', '5', '', '2024-06-28 16:20:11');
INSERT INTO ratings VALUES ('265', '5', '5', '5', '5', '5', 'Great food!', '2024-06-28 19:00:46');
INSERT INTO ratings VALUES ('266', '4', '4', '4', '5', '3', '', '2024-06-28 19:01:02');
INSERT INTO ratings VALUES ('267', '5', '5', '5', '5', '5', '', '2024-06-28 19:19:23');
INSERT INTO ratings VALUES ('268', '4', '4', '4', '4', '5', '', '2024-06-28 19:25:18');
INSERT INTO ratings VALUES ('269', '5', '5', '5', '5', '5', 'Thank you', '2024-06-28 19:26:17');
INSERT INTO ratings VALUES ('270', '5', '5', '4', '5', '5', 'The ambience of the place is nice and chill.', '2024-06-28 19:40:01');
INSERT INTO ratings VALUES ('271', '5', '5', '5', '5', '5', '', '2024-06-28 20:03:22');
INSERT INTO ratings VALUES ('272', '4', '4', '5', '5', '5', '', '2024-06-28 20:03:26');
INSERT INTO ratings VALUES ('273', '5', '5', '5', '5', '5', 'Very good and well accommodating ', '2024-06-28 20:16:14');
INSERT INTO ratings VALUES ('274', '4', '4', '4', '4', '4', '', '2024-06-28 20:38:04');
INSERT INTO ratings VALUES ('275', '5', '5', '5', '5', '5', 'Compliments to the chef', '2024-06-28 20:45:03');
INSERT INTO ratings VALUES ('276', '5', '5', '5', '5', '5', 'Thank you Avodah', '2024-06-28 20:51:10');
INSERT INTO ratings VALUES ('277', '5', '5', '5', '5', '5', 'Superb. Worth it.', '2024-06-28 20:59:19');
INSERT INTO ratings VALUES ('278', '5', '4', '4', '5', '5', '', '2024-06-28 21:19:17');
INSERT INTO ratings VALUES ('279', '4', '4', '4', '4', '5', 'No Comments,, tnx for nice service...', '2024-06-28 21:19:56');
INSERT INTO ratings VALUES ('280', '4', '4', '3', '4', '4', '', '2024-06-29 13:28:48');
INSERT INTO ratings VALUES ('281', '5', '5', '4', '5', '5', '', '2024-06-29 13:29:20');
INSERT INTO ratings VALUES ('282', '4', '4', '4', '4', '4', 'Nice ambiance, friendly workers', '2024-06-29 13:32:47');
INSERT INTO ratings VALUES ('283', '5', '5', '5', '5', '5', 'Very satisfied!', '2024-06-29 13:34:31');
INSERT INTO ratings VALUES ('284', '2', '5', '1', '5', '2', '', '2024-06-29 13:40:36');
INSERT INTO ratings VALUES ('285', '5', '5', '5', '5', '5', 'I like everything, but the menu looks boring on how it presents the food. Maybe it would be great to add visuals of the food.', '2024-06-29 14:37:23');
INSERT INTO ratings VALUES ('286', '5', '5', '5', '5', '5', 'Food was great and the service was excellent! Will come back again.', '2024-06-29 14:38:58');
INSERT INTO ratings VALUES ('287', '4', '4', '4', '4', '4', '', '2024-06-29 18:22:41');
INSERT INTO ratings VALUES ('288', '5', '5', '5', '5', '5', '', '2024-06-29 18:53:54');
INSERT INTO ratings VALUES ('289', '4', '4', '5', '4', '4', 'Friendly and accommodating staff', '2024-06-29 18:59:23');
INSERT INTO ratings VALUES ('290', '3', '4', '3', '3', '4', 'Wrong number of plates and utensils', '2024-06-29 18:59:40');
INSERT INTO ratings VALUES ('291', '5', '5', '5', '5', '5', '', '2024-06-29 19:24:56');
INSERT INTO ratings VALUES ('292', '5', '5', '5', '5', '5', 'Keep it up!\r\n\r\n', '2024-06-29 19:26:51');
INSERT INTO ratings VALUES ('293', '4', '4', '4', '5', '5', 'We enjoyed our meal :)', '2024-06-29 19:44:27');
INSERT INTO ratings VALUES ('294', '3', '4', '5', '5', '5', 'Daghan siyag lamok; you should plant some citronella.', '2024-06-29 19:46:11');
INSERT INTO ratings VALUES ('295', '5', '5', '5', '5', '5', '', '2024-06-29 20:06:50');
INSERT INTO ratings VALUES ('296', '5', '5', '4', '5', '5', 'The services are commendable', '2024-06-29 20:11:08');
INSERT INTO ratings VALUES ('297', '4', '3', '5', '4', '5', '', '2024-06-29 20:16:54');
INSERT INTO ratings VALUES ('298', '5', '4', '5', '5', '5', '', '2024-06-29 20:36:41');
INSERT INTO ratings VALUES ('299', '5', '5', '5', '5', '5', '', '2024-06-29 20:45:24');
INSERT INTO ratings VALUES ('300', '5', '5', '5', '5', '5', 'Don\'t change a thing you guys are amazing🌟', '2024-06-29 20:54:05');
INSERT INTO ratings VALUES ('301', '5', '5', '4', '5', '5', '', '2024-06-29 21:00:06');
INSERT INTO ratings VALUES ('302', '3', '3', '2', '3', '4', '', '2024-06-29 21:09:59');
INSERT INTO ratings VALUES ('303', '5', '5', '5', '5', '5', '', '2024-06-29 21:12:56');
INSERT INTO ratings VALUES ('304', '4', '5', '3', '5', '5', 'Definitely, we will be back.. 🥰', '2024-06-30 11:56:01');
INSERT INTO ratings VALUES ('305', '5', '5', '5', '5', '5', '', '2024-06-30 12:01:45');
INSERT INTO ratings VALUES ('306', '5', '5', '5', '5', '5', 'Lami kaayo ang food', '2024-06-30 12:30:50');
INSERT INTO ratings VALUES ('307', '5', '5', '5', '5', '5', 'Food was beyond our expectations, service was fast and cozy ambience..11/10', '2024-06-30 13:42:34');
INSERT INTO ratings VALUES ('308', '5', '5', '5', '5', '5', '', '2024-06-30 16:02:51');
INSERT INTO ratings VALUES ('309', '5', '5', '5', '5', '5', '', '2024-06-30 18:49:48');
INSERT INTO ratings VALUES ('310', '3', '3', '4', '3', '4', 'Baby back ribs needs more improvement 😘', '2024-06-30 18:53:18');
INSERT INTO ratings VALUES ('311', '5', '5', '5', '5', '5', '', '2024-06-30 19:30:34');
INSERT INTO ratings VALUES ('312', '5', '5', '5', '5', '5', '', '2024-06-30 19:31:07');
INSERT INTO ratings VALUES ('313', '5', '5', '5', '5', '5', 'Food are delicious, service is superb', '2024-06-30 20:16:53');
INSERT INTO ratings VALUES ('314', '5', '5', '5', '5', '5', 'Delish! Always a comfort coming here 😄', '2024-06-30 20:24:28');
INSERT INTO ratings VALUES ('315', '4', '4', '2', '4', '3', '', '2024-06-30 20:29:28');
-- Table structure for table `reservations` 
CREATE TABLE `reservations` (
  `reservation_id` int(11) NOT NULL AUTO_INCREMENT,
  `reserved_date` datetime NOT NULL,
  `reserved_name` varchar(255) NOT NULL,
  `reserved_pax` int(11) NOT NULL,
  `reserved_contact_number` varchar(20) NOT NULL,
  `reserved_table_number` int(11) NOT NULL,
  `adv_order` tinyint(1) NOT NULL DEFAULT 0,
  `down_payment` varchar(10) NOT NULL DEFAULT 'No',
  `amount` float NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`reservation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `stock_outflows` 
CREATE TABLE `stock_outflows` (
  `outflow_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `quantity` double(11,2) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `note` text DEFAULT NULL,
  PRIMARY KEY (`outflow_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `stock_outflows_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `pantry_products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=760 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `stocks` 
CREATE TABLE `stocks` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `quantity` double(11,2) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`stock_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `pantry_products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1080 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Table structure for table `temporary_biometric_data` 
CREATE TABLE `temporary_biometric_data` (
  `unique_id` int(225) NOT NULL AUTO_INCREMENT,
  `biometric_id` int(11) NOT NULL,
  `bio_date` date NOT NULL,
  `bio_time` time NOT NULL,
  PRIMARY KEY (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12943 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `transaction_logs` 
CREATE TABLE `transaction_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `waiter_name` varchar(225) NOT NULL,
  `table_number` int(11) DEFAULT NULL,
  `pax` int(11) DEFAULT NULL,
  `order_time` datetime DEFAULT NULL,
  `product_name` text DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `log_time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `users` 
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL DEFAULT 'Service Crew',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO users VALUES ('1', 'louie.avodah@gmail.com', 'admin', '5f4dcc3b5aa765d61d8327deb882cf99', 'System Administrator');
INSERT INTO users VALUES ('2', 'avodah', 'Avodah Admin', '5f4dcc3b5aa765d61d8327deb882cf99', 'System Administrator');
INSERT INTO users VALUES ('3', 'PauAvodah', 'Pau', '83739936c25879f45ec6d8b5cb81d4bc', 'Accounting Assistant, COO');
INSERT INTO users VALUES ('4', 'jay', 'Louie Jay Jayme', '5f4dcc3b5aa765d61d8327deb882cf99', 'Service Crew');
INSERT INTO users VALUES ('5', 'gio', 'Gio', 'cd0d8db25ba937e86ad03f4b5f26c731', 'Service Crew');
INSERT INTO users VALUES ('6', 'louie', 'Louie', '5f4dcc3b5aa765d61d8327deb882cf99', 'I.T. Specialist');
INSERT INTO users VALUES ('7', 'vince', 'Vince', '84ad4d85f2cf9373a0ca59926f4c6c1d', 'Service Crew');
INSERT INTO users VALUES ('8', 'zaj', 'Zaj', 'be2ee8b7806a96c77ef202bbd1475788', 'Service Crew');
INSERT INTO users VALUES ('9', 'rio', 'Rio', '39b98cb26b0589794ead9af125ef8f8f', 'Service Crew');
INSERT INTO users VALUES ('10', 'Em', 'Em', 'f4413b2a94d155ce4222f963f885b8af', 'Service Crew');
INSERT INTO users VALUES ('11', 'lzl', 'Liezl', '3a325c4259c1ece91da462086a25d511', 'Service Crew');
INSERT INTO users VALUES ('12', 'Lyns', 'Lynie', 'd8578edf8458ce06fbc5bb76a58c5ca4', 'Service Crew');
INSERT INTO users VALUES ('13', 'Gina', 'Gina', '28a4565a4953cb4e7e23317ba0504f4c', 'Service Crew');
INSERT INTO users VALUES ('14', 'aenr', 'Maan', '4a3e00961a08879c34f91ca0070ea2f5', 'Service Crew');
INSERT INTO users VALUES ('15', 'chris', 'Christopher', '827ccb0eea8a706c4c34a16891f84e7b', 'System Administrator');
INSERT INTO users VALUES ('16', 'Customer', 'Customer', '5f4dcc3b5aa765d61d8327deb882cf99', 'Service Crew');
