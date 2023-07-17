-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`course` (
  `course_id` VARCHAR(10) NOT NULL,
  `course_title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`course_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`instructor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`instructor` (
  `instructor_id` INT NOT NULL AUTO_INCREMENT,
  `instructor_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`instructor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`schedule` (
  `schedule_id` INT NOT NULL AUTO_INCREMENT,
  `instructor_id` INT NOT NULL,
  `course_id` VARCHAR(10) NOT NULL,
  `section` VARCHAR(45) NOT NULL,
  `semester` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`schedule_id`),
  INDEX `fk_instructor_has_course_course1_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_instructor_has_course_instructor_idx` (`instructor_id` ASC) VISIBLE,
  CONSTRAINT `fk_instructor_has_course_instructor`
    FOREIGN KEY (`instructor_id`)
    REFERENCES `mydb`.`instructor` (`instructor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_instructor_has_course_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `mydb`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`student` (
  `student_id` INT NOT NULL,
  `student_first_name` VARCHAR(45) NOT NULL,
  `student_last_name` VARCHAR(45) NULL,
  `student_email` VARCHAR(45) NULL,
  PRIMARY KEY (`student_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`registration`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`registration` (
  `registration_id` INT NOT NULL AUTO_INCREMENT,
  `student_id` INT NOT NULL,
  `schedule_id` INT NOT NULL,
  INDEX `fk_student_has_schedule_schedule1_idx` (`schedule_id` ASC) VISIBLE,
  INDEX `fk_student_has_schedule_student1_idx` (`student_id` ASC) VISIBLE,
  PRIMARY KEY (`registration_id`),
  CONSTRAINT `fk_student_has_schedule_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `mydb`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_schedule_schedule1`
    FOREIGN KEY (`schedule_id`)
    REFERENCES `mydb`.`schedule` (`schedule_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`attendance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`attendance` (
  `attendance_id` VARCHAR(45) NOT NULL,
  `registration_registration_id` INT NOT NULL,
  `attendance_date` DATE NOT NULL,
  `status` TINYINT NOT NULL,
  PRIMARY KEY (`attendance_id`),
  CONSTRAINT `fk_table1_registration1`
    FOREIGN KEY (`registration_registration_id`)
    REFERENCES `mydb`.`registration` (`registration_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
