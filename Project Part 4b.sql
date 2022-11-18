-- solution 1
DROP TABLE IF EXISTS `dept_supervisor`;
CREATE TABLE IF NOT EXISTS `dept_supervisor` (
  `emp_id` varchar(12) NOT NULL,
  `dept_id` varchar(10) NOT NULL,
  `m_status` ENUM('Y','N') NOT NULL,
  `datefrom` date NOT NULL,
  `dateto` date NOT NULL,
  PRIMARY KEY (`emp_id`,`dept_id`),
  KEY `dept_id` (`dept_id`)
) 

-- solution 2
-- a
INSERT INTO `dept_supervisor` (`emp_id`, `dept_id`,`m_status`, `datefrom`, `dateto`) VALUES
('SA106', 'HR40','' ,'2020-11-11', '0000-00-00');
-- b 
INSERT INTO `dept_supervisor` (`emp_id`, `dept_id`,`m_status`, `datefrom`, `dateto`) VALUES
('SA106', 'HR40','' ,'2020-11-11', '0000-00-00');

-- solution 3

DROP TABLE IF EXISTS `dept_supervisor`;
CREATE TABLE IF NOT EXISTS `dept_supervisor` (
  `emp_id` varchar(12) NOT NULL,
  `dept_id` varchar(10) NOT NULL,
  `married` ENUM('Y','N') NOT NULL,
  `hiring_date` date NOT NULL,
  `termination_date` date NOT NULL,
  PRIMARY KEY (`emp_id`,`dept_id`),
  KEY `dept_id` (`dept_id`)
)


INSERT INTO `dept_supervisor` (`emp_id`, `dept_id`,`married`, `hiring_date`, `termination_date`) VALUES
('SA106', 'HR40','Y' ,'2020-11-11', '0000-00-00');


-- solution 4 
DELETE FROM `employees` WHERE `emp_id`=SC108
-- solution 5

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `dept_id` varchar(10) NOT NULL AUTO_INCREMENT ,
  `dept_name` varchar(40) NOT NULL,
  PRIMARY KEY (`dept_id`),
  UNIQUE KEY `dept_name` (`dept_name`)
) 

-- solution 6
DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `dept_id` DEFAULT 77 ,
  `dept_name` varchar(40) NOT NULL,
  PRIMARY KEY (`dept_id`),
  UNIQUE KEY `dept_name` (`dept_name`)
)
INSERT INTO `departments` (`dept_id`,`dept_name`) VALUES(" ", 'Executive')
-- 