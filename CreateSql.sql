-- MySQL Script generated by MySQL Workbench
-- Thu Apr 27 20:46:55 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hotel_schema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hotel_schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hotel_schema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `hotel_schema` ;

-- -----------------------------------------------------
-- Table `hotel_schema`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_schema`.`address` (
  `id` INT NOT NULL,
  `streetName` VARCHAR(255) NOT NULL,
  `houseNumber` VARCHAR(255) NOT NULL,
  `zipCode` VARCHAR(255) NOT NULL,
  `city` VARCHAR(255) NOT NULL,
  `country` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel_schema`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_schema`.`department` (
  `departmentId` INT NOT NULL,
  `departmentName` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`departmentId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel_schema`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_schema`.`user` (
  `userId` INT NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `employeeId` INT NULL DEFAULT NULL,
  PRIMARY KEY (`userId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel_schema`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_schema`.`person` (
  `id` INT NOT NULL,
  `firstName` VARCHAR(255) NOT NULL,
  `middelName` VARCHAR(255) NULL DEFAULT NULL,
  `lastName` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(255) NOT NULL,
  `addressId` INT NULL DEFAULT NULL,
  `birthDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE,
  INDEX `addressId` (`addressId` ASC) VISIBLE,
  CONSTRAINT `person_ibfk_1`
    FOREIGN KEY (`addressId`)
    REFERENCES `hotel_schema`.`address` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel_schema`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_schema`.`employee` (
  `employeeId` INT NOT NULL,
  `position` VARCHAR(255) NOT NULL,
  `salary` DOUBLE NOT NULL,
  `hireDate` DATE NOT NULL,
  `departmentId` INT NULL DEFAULT NULL,
  `loginDetailsId` INT NULL DEFAULT NULL,
  `personId` INT NOT NULL,
  PRIMARY KEY (`employeeId`, `personId`),
  INDEX `departmentId` (`departmentId` ASC) VISIBLE,
  INDEX `loginDetailsId` (`loginDetailsId` ASC) VISIBLE,
  INDEX `personId_idx` (`personId` ASC) VISIBLE,
  CONSTRAINT `employee_ibfk_1`
    FOREIGN KEY (`departmentId`)
    REFERENCES `hotel_schema`.`department` (`departmentId`),
  CONSTRAINT `employee_ibfk_2`
    FOREIGN KEY (`loginDetailsId`)
    REFERENCES `hotel_schema`.`user` (`userId`),
  CONSTRAINT `personId`
    FOREIGN KEY (`personId`)
    REFERENCES `hotel_schema`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel_schema`.`guest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_schema`.`guest` (
  `guestId` INT NOT NULL,
  `notes` VARCHAR(255) NULL DEFAULT NULL,
  `personId` INT NOT NULL,
  PRIMARY KEY (`guestId`),
  UNIQUE INDEX `personId_UNIQUE` (`personId` ASC) VISIBLE,
  CONSTRAINT `personId`
    FOREIGN KEY (`guestId`)
    REFERENCES `hotel_schema`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel_schema`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_schema`.`payment` (
  `paymentId` INT NOT NULL,
  `paymentMethod` VARCHAR(255) NOT NULL,
  `amountPaid` DOUBLE NOT NULL,
  `deposit` DOUBLE NOT NULL,
  `paymentStatus` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`paymentId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel_schema`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_schema`.`room` (
  `roomNumber` INT NOT NULL,
  `roomType` VARCHAR(255) NOT NULL,
  `capacity` INT NOT NULL,
  `pricePerNight` DOUBLE NOT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `bedType` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`roomNumber`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel_schema`.`reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_schema`.`reservation` (
  `reservationId` INT NOT NULL,
  `guestId` INT NOT NULL,
  `roomId` INT NOT NULL,
  `paymentId` INT NOT NULL,
  `checkInDate` DATE NOT NULL,
  `checkOutDate` DATE NOT NULL,
  `reservationStatus` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`reservationId`),
  INDEX `guestId` (`guestId` ASC) VISIBLE,
  INDEX `roomId` (`roomId` ASC) VISIBLE,
  INDEX `paymentId` (`paymentId` ASC) VISIBLE,
  CONSTRAINT `reservation_ibfk_1`
    FOREIGN KEY (`guestId`)
    REFERENCES `hotel_schema`.`guest` (`guestId`),
  CONSTRAINT `reservation_ibfk_2`
    FOREIGN KEY (`roomId`)
    REFERENCES `hotel_schema`.`room` (`roomNumber`),
  CONSTRAINT `reservation_ibfk_3`
    FOREIGN KEY (`paymentId`)
    REFERENCES `hotel_schema`.`payment` (`paymentId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;