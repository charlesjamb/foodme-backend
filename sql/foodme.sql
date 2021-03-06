CREATE TABLE `fridges` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`clientId` VARCHAR(100) NOT NULL,
	PRIMARY KEY (`id`, `clientId`),
	UNIQUE KEY `clientId` (`clientId`)
);

CREATE TABLE `recipes` (
	`id` VARCHAR(100) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `ingredients` (
	`name` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`name`),
	UNIQUE KEY `name` (`name`)
);

CREATE TABLE `userRecipes` (
	`clientId` VARCHAR(100) NOT NULL,
	`recipeId` VARCHAR(100) NOT NULL,
	PRIMARY KEY (`clientId`, `recipeId`),
	FOREIGN KEY (`recipeId`) REFERENCES `recipes` (`id`)
);

CREATE TABLE `recipeIngredients` (
	`recipeId` VARCHAR(100) NOT NULL,
	`ingredientName` VARCHAR(100) NOT NULL,
	PRIMARY KEY (`recipeId`, `ingredientName`),
	FOREIGN KEY (`recipeId`) REFERENCES `recipes` (`id`),
	FOREIGN KEY (`ingredientName`) REFERENCES `ingredients` (`name`)
);

CREATE TABLE `fridgeIngredients` (
	`fridgeId` INT(11) NOT NULL,
	`ingredientName` VARCHAR(100) NOT NULL,
	PRIMARY KEY (`fridgeId`, `ingredientName`),
	FOREIGN KEY (`fridgeId`) REFERENCES `fridges` (`id`),
	FOREIGN KEY (`ingredientName`) REFERENCES `ingredients` (`name`)
);
