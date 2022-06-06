-- my.cnfは以下の状況
-- [mysqld]
-- character-set-server=utf8mb4
-- collation-server=utf8mb4_bin
-- explicit-defaults-for-timestamp=1
-- general-log=1
-- general-log-file=/dev/stdout
-- slow-query-log=1
-- slow-query-log-file=/dev/stdout
-- long-query-time=0.3
-- default-time-zone='Asia/Tokyo'
-- [client]
-- default-character-set=utf8mb4

USE testdb;

-- t1テーブルはCHARSETとCOLLATE両方設定
-- カラムはCHARACTER SETとCOLLATE両方設定
CREATE TABLE `t1` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `c1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'c1',
  `c2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'c2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='t1';

-- t2テーブルはCOLLATE未設定
-- カラムはCOLLATE未設定
CREATE TABLE `t2` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `c1` varchar(255) CHARACTER SET utf8mb4 COMMENT 'c1',
  `c2` varchar(255) CHARACTER SET utf8mb4 COMMENT 'c2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t2';

-- t3テーブルはCHARSETとCOLLATE両方設定(utf8mb4_general_ci)
-- カラムはCHARACTER SETとCOLLATE両方設定(utf8mb4_general_ci)
CREATE TABLE `t3` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `c1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'c1',
  `c2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'c2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='t3';

-- t4テーブルはCHARSETとCOLLATE両方設定(utf8mb4_0900_as_ci)
-- カラムはCHARACTER SETとCOLLATE両方設定(utf8mb4_0900_as_ci)
CREATE TABLE `t4` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `c1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_ci COMMENT 'c1',
  `c2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_ci COMMENT 'c2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci COMMENT='t4';

-- レコード追加
INSERT INTO `t1`(`c1`, `c2`) VALUES ('🍣', '🍺'), ('はは', 'ぱぱ'), ('A', 'a');
INSERT INTO `t2`(`c1`, `c2`) VALUES ('🍣', '🍺'), ('はは', 'ぱぱ'), ('A', 'a');
INSERT INTO `t3`(`c1`, `c2`) VALUES ('🍣', '🍺'), ('はは', 'ぱぱ'), ('A', 'a');
INSERT INTO `t4`(`c1`, `c2`) VALUES ('🍣', '🍺'), ('はは', 'ぱぱ'), ('A', 'a');