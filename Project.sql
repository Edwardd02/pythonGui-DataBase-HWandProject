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
  `instructor_id` INT NOT NULL,
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
  `attendance_id` int AUTO_INCREMENT NOT NULL,
  `registration_id` INT NOT NULL,
  `attendance_date` DATE NOT NULL,
  `status` TINYINT NOT NULL,
  PRIMARY KEY (`attendance_id`),
  CONSTRAINT `fk_table1_registration1`
    FOREIGN KEY (`registration_id`)
    REFERENCES `mydb`.`registration` (`registration_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
-- Populate the 'course' table
INSERT IGNORE INTO `mydb`.`course` (`course_id`, `course_title`)
VALUES
('CS101', 'Introduction to Computer Science'),
('CS102', 'Programming Fundamentals'),
('CS103', 'Data Structures'),
('CS104', 'Algorithms'),
('CS105', 'Computer Networks'),
('CS106', 'Operating Systems'),
('CS107', 'Database Systems'),
('CS108', 'Software Engineering'),
('CS109', 'Web Development'),
('CS110', 'Artificial Intelligence'),
('CS111', 'Machine Learning'),
('CS112', 'Cloud Computing'),
('CS113', 'Cyber Security'),
('CS114', 'Computer Graphics'),
('CS115', 'Parallel Computing'),
('CS116', 'Distributed Systems'),
('CS117', 'Human-Computer Interaction'),
('CS118', 'Computational Theory'),
('CS119', 'Compiler Construction'),
('CS120', 'Quantum Computing');

-- Populate the 'instructor' table
INSERT IGNORE INTO `mydb`.`instructor` (`instructor_id`, `instructor_name`)
VALUES
(1, 'John Doe'),
(2, 'Jane Smith'),
(3, 'Alice Johnson'),
(4, 'Bob Williams'),
(5, 'Charlie Brown'),
(6, 'Daniel Davis'),
(7, 'Emily Miller'),
(8, 'Frank Wilson'),
(9, 'Grace Moore'),
(10, 'Harry Taylor'),
(11, 'Ivy Anderson'),
(12, 'Jack Thomas'),
(13, 'Kate Jackson'),
(14, 'Luke White'),
(15, 'Mary Harris'),
(16, 'Nathan Martin'),
(17, 'Olivia Thompson'),
(18, 'Peter Garcia'),
(19, 'Queen Martinez'),
(20, 'Robert Robinson');

-- Populate the 'schedule' table
-- Each instructor teaches one course in this case
INSERT IGNORE INTO `mydb`.`schedule` (`schedule_id`, `instructor_id`, `course_id`, `section`, `semester`)
VALUES
(1, 1, 'CS101', 'Sec01', '23SU'),
(2, 2, 'CS102', 'Sec02', '23SU'),
(3, 3, 'CS103', 'Sec01', '23FA'),
(4, 4, 'CS104', 'Sec02', '23FA'),
(5, 5, 'CS105', 'Sec01', '24SP'),
(6, 6, 'CS106', 'Sec02', '24SP'),
(7, 7, 'CS107', 'Sec01', '24SU'),
(8, 8, 'CS108', 'Sec02', '24SU'),
(9, 9, 'CS109', 'Sec01', '24FA'),
(10, 10, 'CS110', 'Sec02', '24FA'),
(11, 11, 'CS111', 'Sec01', '25SP'),
(12, 12, 'CS112', 'Sec02', '25SP'),
(13, 13, 'CS113', 'Sec01', '25SU'),
(14, 14, 'CS114', 'Sec02', '25SU'),
(15, 15, 'CS115', 'Sec01', '25FA'),
(16, 16, 'CS116', 'Sec02', '25FA'),
(17, 17, 'CS117', 'Sec01', '23SU'),
(18, 18, 'CS118', 'Sec02', '23SU'),
(19, 19, 'CS119', 'Sec01', '23FA'),
(20, 20, 'CS120', 'Sec02', '23FA');


-- Populate the 'student' table
INSERT IGNORE INTO `mydb`.`student` (`student_id`, `student_first_name`, `student_last_name`, `student_email`)
VALUES
(1, 'Adam', 'Smith', 'adam.smith@example.com'),
(2, 'Betty', 'Johnson', 'betty.johnson@example.com'),
(3, 'Charles', 'Williams', 'charles.williams@example.com'),
(4, 'Diana', 'Jones', 'diana.jones@example.com'),
(5, 'Edward', 'Brown', 'edward.brown@example.com'),
(6, 'Fiona', 'Davis', 'fiona.davis@example.com'),
(7, 'George', 'Miller', 'george.miller@example.com'),
(8, 'Helen', 'Wilson', 'helen.wilson@example.com'),
(9, 'Ian', 'Moore', 'ian.moore@example.com'),
(10, 'Jennifer', 'Taylor', 'jennifer.taylor@example.com'),
(11, 'Kevin', 'Anderson', 'kevin.anderson@example.com'),
(12, 'Linda', 'Thomas', 'linda.thomas@example.com'),
(13, 'Michael', 'Jackson', 'michael.jackson@example.com'),
(14, 'Nancy', 'White', 'nancy.white@example.com'),
(15, 'Oliver', 'Harris', 'oliver.harris@example.com'),
(16, 'Patricia', 'Martin', 'patricia.martin@example.com'),
(17, 'Quentin', 'Thompson', 'quentin.thompson@example.com'),
(18, 'Rita', 'Garcia', 'rita.garcia@example.com'),
(19, 'Steven', 'Martinez', 'steven.martinez@example.com'),
(20, 'Tina', 'Robinson', 'tina.robinson@example.com');

-- Populate the 'registration' table
-- Each student registers for multiple courses
INSERT IGNORE INTO `mydb`.`registration` (`registration_id`, `student_id`, `schedule_id`)
VALUES
(1, 1, 1), (2, 1, 2), (3, 1, 3),
(4, 2, 2), (5, 2, 3), (6, 2, 4),
(7, 3, 3), (8, 3, 4), (9, 3, 5),
(10, 4, 4), (11, 4, 5), (12, 4, 6),
(13, 5, 5), (14, 5, 6), (15, 5, 7),
(16, 6, 6), (17, 6, 7), (18, 6, 8),
(19, 7, 7), (20, 7, 8), (21, 7, 9),
(22, 8, 8), (23, 8, 9), (24, 8, 10),
(25, 9, 9), (26, 9, 10), (27, 9, 11),
(28, 10, 10), (29, 10, 11), (30, 10, 12),
(31, 11, 11), (32, 11, 12), (33, 11, 13),
(34, 12, 12), (35, 12, 13), (36, 12, 14),
(37, 13, 13), (38, 13, 14), (39, 13, 15),
(40, 14, 14), (41, 14, 15), (42, 14, 16),
(43, 15, 15), (44, 15, 16), (45, 15, 17),
(46, 16, 16), (47, 16, 17), (48, 16, 18),
(49, 17, 17), (50, 17, 18), (51, 17, 19),
(52, 18, 18), (53, 18, 19), (54, 18, 20),
(55, 19, 19), (56, 19, 20), (57, 19, 1),
(58, 20, 20), (59, 20, 1), (60, 20, 2);


INSERT IGNORE INTO `attendance` (`registration_id`, `attendance_date`, `status`)
VALUES
(1, '2023-07-01', 1), (2, '2023-07-02', 0), (3, '2023-07-03', 1), (4, '2023-07-04', 1), (5, '2023-07-05', 0), (6, '2023-07-06', 1), (7, '2023-07-07', 0), (8, '2023-07-08', 1), (9, '2023-07-09', 0), (10, '2023-07-10', 1), (11, '2023-07-11', 0), (12, '2023-07-12', 1), (13, '2023-07-13', 0), (14, '2023-07-14', 1), (15, '2023-07-15', 0), (16, '2023-07-16', 1), (17, '2023-07-17', 0), (18, '2023-07-18', 1), (19, '2023-07-19', 0), (20, '2023-07-20', 1), (21, '2023-07-21', 0), (22, '2023-07-22', 1), (23, '2023-07-23', 0), (24, '2023-07-24', 1), (25, '2023-07-25', 0), (26, '2023-07-26', 1), (27, '2023-07-27', 0), (28, '2023-07-28', 1), (29, '2023-07-29', 0), (30, '2023-07-30', 1), (31, '2023-07-31', 0), (32, '2023-08-01', 1), (33, '2023-08-02', 0), (34, '2023-08-03', 1), (35, '2023-08-04', 0), (36, '2023-08-05', 1), (37, '2023-08-06', 0), (38, '2023-08-07', 1), (39, '2023-08-08', 0), (40, '2023-08-09', 1), (41, '2023-08-10', 0), (42, '2023-08-11', 1), (43, '2023-08-12', 0), (44, '2023-08-13', 1), (45, '2023-08-14', 0), (46, '2023-08-15', 1), (47, '2023-08-16', 0), (48, '2023-08-17', 1), (49, '2023-08-18', 0), (50, '2023-08-19', 1);

