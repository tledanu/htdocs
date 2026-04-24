DROP DATABASE IF EXISTS `internships`;

CREATE DATABASE `internships` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

use internships;

CREATE TABLE `status_list` (
  `status_code` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL,
  PRIMARY KEY (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `students` (
  `student_id` varchar(11) NOT NULL COMMENT 'รหัสนิสิต',
  `firstName` varchar(100) NOT NULL COMMENT 'ชื่อนิสิต',
  `lastName` varchar(100) NOT NULL COMMENT 'นามสกุลนิสิต',
  `email` varchar(100) DEFAULT NULL COMMENT 'อีเมลนิสิต',
  `phone` varchar(100) DEFAULT NULL COMMENT 'เบอร์โทรนิสิต',
  `password` varchar(100) DEFAULT '1234' COMMENT 'รหัสผ่าน',
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสลำดับ',
  `username` varchar(100) NOT NULL COMMENT 'ชื่อ username ในการ login',
  `password` varchar(100) DEFAULT '1234' COMMENT 'รหัสผ่าน',
  `name` varchar(100) NOT NULL COMMENT 'เจ้าหน้าที่ หรือ อาจารย์',
  `role` varchar(100) DEFAULT NULL COMMENT 'admin หรือ teacher',
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `staff_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `internship_request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'เลขที่คำขอ',
  `student_id` varchar(11) NOT NULL COMMENT 'รหัสนิสิต',
  `company_name` varchar(100) NOT NULL,
  `company_address` text DEFAULT NULL COMMENT 'ทีอยู่สถานประกอบการ',
  `contact_person` varchar(100) DEFAULT NULL COMMENT 'ผู้ติดต่อ/พี่เลี้ยง',
  `start_date` date DEFAULT NULL COMMENT 'วันที่เริ่มฝึกงาน',
  `end_date` date DEFAULT NULL COMMENT 'วันที่สิ้นสุดการฝึกงาน',
  `status_code` int(11) DEFAULT 1 COMMENT 'สถานะการดำเนินงาน',
  `advisor_note` text DEFAULT NULL COMMENT 'บันทึกการนิเทศของอาจารย์',
  `request_date` timestamp NULL DEFAULT current_timestamp() COMMENT 'วันที่ยื่นคำขอ',
  PRIMARY KEY (`request_id`),
  KEY `internship_request_students_FK` (`student_id`),
  KEY `internship_request_status_list_FK` (`status_code`),
  CONSTRAINT `internship_request_status_list_FK` FOREIGN KEY (`status_code`) REFERENCES `status_list` (`status_code`) ON UPDATE CASCADE,
  CONSTRAINT `internship_request_students_FK` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `status_list` (`status_code`, `status_name`) VALUES
(1, 'รับเรื่องเข้าระบบ'),
(2, 'อาจารย์ที่ปรึกษาอนุมัติ'),
(3, 'ออกใบส่งตัวแล้ว'),
(4, 'ฝึกงานเสร็จสิ้น'),
(9, 'ยกเลิก');

INSERT INTO `staff` (`username`, `password`, `name`, `role`) VALUES
('admin', '1234', 'เจ้าหน้าที่ดูแลระบบ', 'admin'),
('teacher', '1234', 'อาจารย์ที่ปรึกษา', 'teacher');

INSERT INTO `students` (`student_id`, `firstName`, `lastName`, `email`, `phone`, `password`) VALUES
('66101010101', 'กมล', 'ใจดี', 'kamol@swu.ac.th', '0812345001', '1234'),
('66101010102', 'ขวัญชัย', 'มานะ', 'kwanchai@swu.ac.th', '0812345002', '1234'),
('66101010103', 'จิราพร', 'รักษ์เรียน', 'jiraporn@swu.ac.th', '0812345003', '1234'),
('66101010104', 'ชัชวาล', 'เก่งกาจ', 'chatchawan@swu.ac.th', '0812345004', '1234'),
('66101010105', 'ณัฐพล', 'เรียนดี', 'nattapol@swu.ac.th', '0812345005', '1234'),
('66101010106', 'รถถัง', 'ประจัญบาน', 'rodthang@swu.ac.th', '0812345006', '1234'),
('66101010107', 'ธนพล', 'พากเพียร', 'thanapol@swu.ac.th', '0812345007', '1234'),
('66101010108', 'บุญส่ง', 'จริงใจ', 'boonsong@swu.ac.th', '0812345008', '1234'),
('66101010109', 'ปิยะมาศ', 'งามเลิศ', 'piyamas@swu.ac.th', '0812345009', '1234'),
('66101010110', 'พรเทพ', 'ใจงาม', 'pornthep@swu.ac.th', '0812345010', '1234');

INSERT INTO `internship_request` 
(`student_id`, `company_name`, `company_address`, `contact_person`, `start_date`, `end_date`, `status_code`, `advisor_note`) 
VALUES
('66101010101', 'บริษัท กสิกรไทย จำกัด (มหาชน)', 'ธนาคารกสิกรไทย สำนักงานใหญ่ ราษฎร์บูรณะ กทม.', 'คุณสมชาย สายเปย์', '2026-06-01', '2026-08-31', 1, NULL),
('66101010102', 'บริษัท ปูนซิเมนต์ไทย จำกัด (มหาชน) - SCG', '1 ถนนปูนซิเมนต์ไทย บางซื่อ กทม.', 'คุณสมหญิง จริงใจ', '2026-06-01', '2026-08-31', 2, 'เอกสารครบถ้วน อนุมัติได้'),
('66101010103', 'Google Thailand', 'อาคารพาร์คเวนเชอร์ อีโคเพล็กซ์ ถนนวิทยุ กทม.', 'Mr. John Doe', '2026-06-15', '2026-09-15', 3, 'ออกใบส่งตัวเรียบร้อย'),
('66101010104', 'บริษัท ปตท. จำกัด (มหาชน)', '555 ถนนวิภาวดีรังสิต จตุจักร กทม.', 'คุณวิชัย รักชาติ', '2026-06-01', '2026-08-31', 4, 'ฝึกงานเสร็จสิ้น ประเมินผ่าน'),
('66101010105', 'บริษัท ไลน์ แมน วงใน จำกัด', 'อาคารที-วัน ถนนสุขุมวิท กทม.', 'คุณเก่ง การค้า', '2026-06-01', '2026-08-31', 1, NULL),
('66101010106', 'Agoda Services Co., Ltd.', 'อาคารดิออฟฟิศเศส แอท เซ็นทรัลเวิลด์ กทม.', 'Ms. Sarah Connor', '2026-06-01', '2026-08-31', 9, 'นิสิตขอยกเลิกเนื่องจากเปลี่ยนที่ฝึกงาน'),
('66101010107', 'Shopee (Thailand)', 'อาคารสิงห์ คอมเพล็กซ์ ถนนเพชรบุรีตัดใหม่ กทม.', 'คุณพงษ์ศักดิ์ ขยันงาน', '2026-06-01', '2026-08-31', 2, 'รอตรวจเอกสารเพิ่มเติม'),
('66101010108', 'True Corporation', '18 ถนนรัชดาภิเษก ห้วยขวาง กทม.', 'คุณมานะ มานี', '2026-06-01', '2026-08-31', 3, 'จัดส่งใบส่งตัวทางไปรษณีย์แล้ว'),
('66101010109', 'TikTok Thailand', 'อาคารปาร์ค สีลม ถนนคอนแวนต์ กทม.', 'คุณจอย ลดา', '2026-07-01', '2026-10-31', 1, NULL),
('66101010110', 'มิตซูบิชิ มอเตอร์ส (ประเทศไทย)', 'นิคมอุตสาหกรรมแหลมฉบัง จ.ชลบุรี', 'คุณสมยศ รถแรง', '2026-06-01', '2026-08-31', 2, 'อาจารย์ที่ปรึกษาพิจารณาแล้ว');