CREATE TABLE `curator table` (
  `USERNAME` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CURATOR-ID` double(12,0) NOT NULL,
  `PASSWORD` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PASSWORD_EXPIRED` bit(1) NOT NULL,
  `EMAIL_ADDRESS` varchar(256) DEFAULT NULL,
  `IS_ACTIVE` bit(1) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `CREATED_BY` double(12,0) NOT NULL,
  `MODIFIED_DATE` datetime NOT NULL,
  `MODIFIED_BY` double(12,0) DEFAULT NULL,
  PRIMARY KEY (`CURATOR-ID`),
  UNIQUE KEY `NewTable_UN` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `CURATOR_APPROVAL_WEIGHT` (
  `CURATOR_APPROVAL_ID` double(12,0) NOT NULL,
  `CURATOR_ID` double(12,0) NOT NULL,
  `TABLE_NAME` varchar(32) NOT NULL,
  `APPROVAL_WEIGHT` bit(1) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `CREATED_BY` double(12,0) NOT NULL,
  `MODIFIED_DATE` datetime DEFAULT NULL,
  `MODIFIED_BY` double(12,0) DEFAULT NULL,
  PRIMARY KEY (`CURATOR_APPROVAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `lessons`.`version` (
  `VERSION_ID` REAL(12,0) NOT NULL,
  `CREATED_DATE` DATETIME NOT NULL,
  `CREATED_BY` REAL(12,0) NOT NULL,
  `PUBLISHED_DATE` DATETIME NULL,
  `PUBLISHED_BY` REAL(12,0) NULL,
  PRIMARY KEY (`VERSION_ID`));




CREATE TABLE `DATASOURCEe` (
  `DATASOURCE_ID` double(12,0) NOT NULL,
  `DATASOURCE_NAME` varchar(64) NOT NULL,
  `DATASOURCE_ACRONYM` varchar(8) NOT NULL,
  `DATASOURCE_URI` varchar(1024) DEFAULT NULL,
  `IS_INTERNAL` bit(1) NOT NULL,
  `IS_PUBLIC` bit(1) NOT NULL DEFAULT b'0',
  `RELEASE_DATE` datetime NOT NULL,
  `VERSION_NUMBER` varchar(32) DEFAULT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `CREATED_BY` double(12,0) NOT NULL,
  `MODIFIED_DATE` datetime DEFAULT NULL,
  `MODIFIED_BY` double(12,0) DEFAULT NULL,
  PRIMARY KEY (`DATASOURCE_ID`),
  UNIQUE KEY `DATASOURCE_NAME_UNIQUE` (`DATASOURCE_NAME`),
  UNIQUE KEY `DATASOURCE_ACRONYM_UNIQUE` (`DATASOURCE_ACRONYM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `CTRLD_VOCAB_DOMAIN` (
  `CTRLD_VOCAB_DOMAIN_ID` double(12,0) NOT NULL,
  `CTRLD_VOCAB_DOMAIN` varchar(64) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `CREATED_BY` double(12,0) NOT NULL,
  `MODIFIED_DATE` datetime DEFAULT NULL,
  `MODIFIED_BY` double(12,0) DEFAULT NULL,
  PRIMARY KEY (`CTRLD_VOCAB_DOMAIN_ID`),
  UNIQUE KEY `CTRLD_VOCAB_DOMAIN_UNIQUE` (`CTRLD_VOCAB_DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `CTRLD_VOCAB_CONTEXT` (
  `CTRLD_VOCAB_CONTEXT_ID` double(12,0) NOT NULL,
  `CTRLD_VOCAB_CONTEXT` varchar(64) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `CREATED_BY` double(12,0) NOT NULL,
  `MODIFIED_DATE` datetime DEFAULT NULL,
  `MODIFIED_BY` double(12,0) DEFAULT NULL,
  PRIMARY KEY (`CTRLD_VOCAB_CONTEXT_ID`),
  UNIQUE KEY `CTRLD_VOCAB_CONTEXT_UNIQUE` (`CTRLD_VOCAB_CONTEXT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `CTRLD_VOCAB` (
  `CTRLD_VOCAB_ID` double(12,0) NOT NULL,
  `DATASOURCE_ID` double(12,0) NOT NULL,
  `CTRLD_VOCAB_NAME` varchar(64) NOT NULL,
  `CTRLD_VOCAB_DOMAIN_ID` double(12,0) NOT NULL,
  `CTRLD_VOCAB_CONTEXT_ID` double(12,0) NOT NULL,
  `REFERENCE_ID` varchar(32) DEFAULT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `CREATED_BY` varchar(45) NOT NULL,
  `MODIFIED_DATE` datetime DEFAULT NULL,
  `MODIFIED_BY` double(12,0) DEFAULT NULL,
  PRIMARY KEY (`CTRLD_VOCAB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `CTRLD_VOCAB_TERM` (
  `CTRLD_VOCAB_TERM_ID` double(12,0) NOT NULL,
  `CTRLD_VOCAB_ID` double(12,0) NOT NULL,
  `CTRLD_VOCAB_TERM` varchar(256) NOT NULL,
  `REFERENCE_ID` varchar(32) DEFAULT NULL,
  `USAGE_COUNT` double(12,0) NOT NULL DEFAULT '1',
  `IS_EXCLUDED` bit(1) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `CREATED_BY` double(12,0) NOT NULL,
  `MODIFIED_DATE` datetime DEFAULT NULL,
  ` MODIFIED_BY` double(12,0) DEFAULT NULL,
  PRIMARY KEY (`CTRLD_VOCAB_TERM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

