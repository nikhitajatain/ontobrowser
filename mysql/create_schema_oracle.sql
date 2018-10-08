CREATE TABLE `CURATOR` (
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
  UNIQUE KEY `NewTable_UN` (`USERNAME`),
  KEY `CURATOR_CREATED_BY_FK_idx` (`CREATED_BY`),
  KEY `CURATOR_MODIFIED_BY_FK_idx` (`MODIFIED_BY`),
  CONSTRAINT `CURATOR_CREATED_BY_FK` FOREIGN KEY (`CREATED_BY`) REFERENCES `CURATOR` (`curator-id`),
  CONSTRAINT `CURATOR_MODIFIED_BY_FK` FOREIGN KEY (`MODIFIED_BY`) REFERENCES `CURATOR` (`curator-id`)
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
  PRIMARY KEY (`CURATOR_APPROVAL_ID`),
  KEY `APPROVAL_WEIGHT_CREATED_BY_FK_idx` (`CREATED_BY`),
  KEY `APPROVAL_WEIGHT_MODIFIED_BY_FK_idx` (`MODIFIED_BY`),
  CONSTRAINT `APPROVAL_WEIGHT_CREATED_BY_FK` FOREIGN KEY (`CREATED_BY`) REFERENCES `CURATOR` (`curator-id`),
  CONSTRAINT `APPROVAL_WEIGHT_MODIFIED_BY_FK` FOREIGN KEY (`MODIFIED_BY`) REFERENCES `CURATOR` (`curator-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





CREATE TABLE `VERSION` (
  `VERSION_ID` double(12,0) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `CREATED_BY` double(12,0) NOT NULL,
  `PUBLISHED_DATE` datetime DEFAULT NULL,
  `PUBLISHED_BY` double(12,0) DEFAULT NULL,
  PRIMARY KEY (`VERSION_ID`),
  KEY `VERSION_CREATED_BY_FK_idx` (`CREATED_BY`),
  KEY `VERSION_PUBLISHED_BY_FK_idx` (`PUBLISHED_BY`),
  CONSTRAINT `VERSION_CREATED_BY_FK` FOREIGN KEY (`CREATED_BY`) REFERENCES `CURATOR` (`curator-id`),
  CONSTRAINT `VERSION_PUBLISHED_BY_FK` FOREIGN KEY (`PUBLISHED_BY`) REFERENCES `CURATOR` (`curator-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `DATASOURCE` (
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
  UNIQUE KEY `DATASOURCE_ACRONYM_UNIQUE` (`DATASOURCE_ACRONYM`),
  KEY `DATASOURCE_CREATED_BY_FK_idx` (`CREATED_BY`),
  KEY `DATASOURCE_MODIFIED_BY_FK_idx` (`MODIFIED_BY`),
  CONSTRAINT `DATASOURCE_CREATED_BY_FK` FOREIGN KEY (`CREATED_BY`) REFERENCES `CURATOR` (`curator-id`),
  CONSTRAINT `DATASOURCE_MODIFIED_BY_FK` FOREIGN KEY (`MODIFIED_BY`) REFERENCES `CURATOR` (`curator-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





CREATE TABLE `CTRLD_VOCAB_DOMAIN` (
  `CTRLD_VOCAB_DOMAIN_ID` double(12,0) NOT NULL,
  `CTRLD_VOCAB_DOMAIN` varchar(64) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `CREATED_BY` double(12,0) NOT NULL,
  `MODIFIED_DATE` datetime DEFAULT NULL,
  `MODIFIED_BY` double(12,0) DEFAULT NULL,
  PRIMARY KEY (`CTRLD_VOCAB_DOMAIN_ID`),
  UNIQUE KEY `CTRLD_VOCAB_DOMAIN_UNIQUE` (`CTRLD_VOCAB_DOMAIN`),
  KEY `VOCAB_DOMAIN_CREATED_BY_FK_idx` (`CREATED_BY`),
  KEY `VOCAB_DOMAIN_MODIFIED_BY_FK_idx` (`MODIFIED_BY`),
  CONSTRAINT `VOCAB_DOMAIN_CREATED_BY_FK` FOREIGN KEY (`CREATED_BY`) REFERENCES `CURATOR` (`curator-id`),
  CONSTRAINT `VOCAB_DOMAIN_MODIFIED_BY_FK` FOREIGN KEY (`MODIFIED_BY`) REFERENCES `CURATOR` (`curator-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `CTRLD_VOCAB_CONTEXT` (
  `CTRLD_VOCAB_CONTEXT_ID` double(12,0) NOT NULL,
  `CTRLD_VOCAB_CONTEXT` varchar(64) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `CREATED_BY` double(12,0) NOT NULL,
  `MODIFIED_DATE` datetime DEFAULT NULL,
  `MODIFIED_BY` double(12,0) DEFAULT NULL,
  PRIMARY KEY (`CTRLD_VOCAB_CONTEXT_ID`),
  UNIQUE KEY `CTRLD_VOCAB_CONTEXT_UNIQUE` (`CTRLD_VOCAB_CONTEXT`),
  KEY `VOCAB_CONTEXT_CREATED_BY_FK_idx` (`CREATED_BY`),
  KEY `VOCAB_CONTEXT_MODIFIED_BY_FK_idx` (`MODIFIED_BY`),
  CONSTRAINT `VOCAB_CONTEXT_CREATED_BY_FK` FOREIGN KEY (`CREATED_BY`) REFERENCES `CURATOR` (`curator-id`),
  CONSTRAINT `VOCAB_CONTEXT_MODIFIED_BY_FK` FOREIGN KEY (`MODIFIED_BY`) REFERENCES `CURATOR` (`curator-id`)
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
  PRIMARY KEY (`CTRLD_VOCAB_TERM_ID`),
  KEY `VOCAB_TERM_VOCAB_FK_idx` (`CTRLD_VOCAB_ID`),
  KEY `VOCAB_TERM_CREATED_BY_FK_idx` (`CREATED_BY`),
  KEY `VOCAB_TERM_MODIFIED_BY_FK_idx` (` MODIFIED_BY`),
  CONSTRAINT `VOCAB_TERM_CREATED_BY_FK` FOREIGN KEY (`CREATED_BY`) REFERENCES `CURATOR` (`curator-id`),
  CONSTRAINT `VOCAB_TERM_MODIFIED_BY_FK` FOREIGN KEY (` MODIFIED_BY`) REFERENCES `CURATOR` (`curator-id`),
  CONSTRAINT `VOCAB_TERM_VOCAB_FK` FOREIGN KEY (`CTRLD_VOCAB_ID`) REFERENCES `CTRLD_VOCAB` (`ctrld_vocab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `CTRLD_VOCAB_TERM_LINK` (
  `CTRLD_VOCAB_TERM_LINK_ID` double(12,0) NOT NULL,
  `CTRLD_VOCAB_TERM_ID` double(12,0) NOT NULL,
  `LINKED_CTRLD_VOCAB_TERM_ID` double(12,0) NOT NULL,
  `USAGE_COUNT` double(12,0) NOT NULL DEFAULT '1',
  `CREATED_DATE` datetime NOT NULL,
  `CREATED_BY` double(12,0) NOT NULL,
  `CREATED_LOAD_NUMBER` double(12,0) NOT NULL,
  `MODIFIED_DATE` datetime DEFAULT NULL,
  `MODIFIED_BY` double(12,0) DEFAULT NULL,
  `MODIFIED_LOAD_NUMBER` double(12,0) DEFAULT NULL,
  PRIMARY KEY (`CTRLD_VOCAB_TERM_LINK_ID`),
  KEY `CTRLD_VOCAB_TERM_LINK_FK1_idx` (`CTRLD_VOCAB_TERM_ID`),
  KEY `CTRLD_VOCAB_TERM_LINK_FK2_idx` (`LINKED_CTRLD_VOCAB_TERM_ID`),
  KEY `VOCAB_TERM_LINK_CREATED_BY_FK_idx` (`CREATED_BY`),
  KEY `VOCAB_TERM_LINK_MODIFIED_BY_FK_idx` (`MODIFIED_BY`),
  CONSTRAINT `CTRLD_VOCAB_TERM_LINK_FK1` FOREIGN KEY (`CTRLD_VOCAB_TERM_ID`) REFERENCES `CTRLD_VOCAB_TERM` (`ctrld_vocab_term_id`),
  CONSTRAINT `CTRLD_VOCAB_TERM_LINK_FK2` FOREIGN KEY (`LINKED_CTRLD_VOCAB_TERM_ID`) REFERENCES `CTRLD_VOCAB_TERM` (`ctrld_vocab_term_id`),
  CONSTRAINT `VOCAB_TERM_LINK_CREATED_BY_FK` FOREIGN KEY (`CREATED_BY`) REFERENCES `CURATOR` (`curator-id`),
  CONSTRAINT `VOCAB_TERM_LINK_MODIFIED_BY_FK` FOREIGN KEY (`MODIFIED_BY`) REFERENCES `CURATOR` (`curator-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `RELATIONSHIP_TYPE` (
  `RELATIONSHIP_TYPE_ID` double(12,0) NOT NULL,
  `RELATIONSHIP_TYPE` varchar(32) NOT NULL,
  `DEFINTION` varchar(256) NOT NULL,
  `IS_CYCLIC` bit(1) NOT NULL,
  `IS_SYMMETRIC` bit(1) NOT NULL,
  `IS_TRANSITIVE` bit(1) NOT NULL,
  `INVERSE_OF` double(12,0) DEFAULT NULL,
  `TRANSITIVE_OVER` double(12,0) DEFAULT NULL,
  `EDGE_COLOUR` char(7) DEFAULT NULL,
  `STATUS` varchar(8) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `CREATED_BY` varchar(45) NOT NULL,
  `CREATED_VERSION_ID` double(12,0) NOT NULL,
  `APPROVED_VERSION_ID` double(12,0) DEFAULT NULL,
  `OBSOLETE_VERSION_ID` double(12,0) DEFAULT NULL,
  `REPLACED_BY` double(12,0) DEFAULT NULL,
  PRIMARY KEY (`RELATIONSHIP_TYPE_ID`),
  UNIQUE KEY `RELATIONSHIP_TYPE_UNIQUE` (`RELATIONSHIP_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `ONTOLOGY` (
  `ONTOLOGY_ID` double(12,0) NOT NULL,
  `ONTOLOGY_NAME` varchar(64) NOT NULL,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  `IS_INTERNAL` bit(1) NOT NULL,
  `SOURCE_NAMESPACE` varchar(256) DEFAULT NULL,
  `SOURCE_URI` varchar(1024) DEFAULT NULL,
  `SOURCE_RELEASE` varchar(32) DEFAULT NULL,
  `SOURCE_DATE` datetime DEFAULT NULL,
  `SOURCE_FORMAT` varchar(32) DEFAULT NULL,
  `REFERENCE_ID_PREFIX` varchar(16) NOT NULL,
  `REFERENCE_ID_VALUE` double(7,0) NOT NULL DEFAULT '0',
  `IS_CODELIST` bit(1) NOT NULL,
  `REFERENCE_ID` varchar(32) DEFAULT NULL,
  `STATUS` varchar(8) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `CREATED_BY` double(12,0) NOT NULL,
  `CREATED_VERSION_ID` double(12,0) NOT NULL,
  `APPROVED_VERSION_ID` double(12,0) DEFAULT NULL,
  `OBSOLETE_VERSION_ID` double(12,0) DEFAULT NULL,
  `REPLACED_BY` double(12,0) DEFAULT NULL,
  PRIMARY KEY (`ONTOLOGY_ID`),
  UNIQUE KEY `ONTOLOGY_NAME_UNIQUE` (`ONTOLOGY_NAME`),
  UNIQUE KEY `REFERENCE_ID_PREFIX_UNIQUE` (`REFERENCE_ID_PREFIX`),
  KEY `ONTOLOGY_CREATED_BY_FK_idx` (`CREATED_BY`),
  KEY `ONTOLOGY_CREATED_VERSION_FK_idx` (`CREATED_VERSION_ID`),
  KEY `ONTOLOGY_APPROVED_VERSION_FK_idx` (`APPROVED_VERSION_ID`),
  KEY `ONTOLOGY_OBSOLETE_VERSION_FK_idx` (`OBSOLETE_VERSION_ID`),
  KEY `ONTOLOGY_REPLACED_BY_FK_idx` (`REPLACED_BY`),
  CONSTRAINT `ONTOLOGY_APPROVED_VERSION_FK` FOREIGN KEY (`APPROVED_VERSION_ID`) REFERENCES `VERSION` (`version_id`),
  CONSTRAINT `ONTOLOGY_CREATED_BY_FK` FOREIGN KEY (`CREATED_BY`) REFERENCES `CURATOR` (`curator-id`),
  CONSTRAINT `ONTOLOGY_CREATED_VERSION_FK` FOREIGN KEY (`CREATED_VERSION_ID`) REFERENCES `VERSION` (`version_id`),
  CONSTRAINT `ONTOLOGY_OBSOLETE_VERSION_FK` FOREIGN KEY (`OBSOLETE_VERSION_ID`) REFERENCES `VERSION` (`version_id`),
  CONSTRAINT `ONTOLOGY_REPLACED_BY_FK` FOREIGN KEY (`REPLACED_BY`) REFERENCES `ONTOLOGY` (`ontology_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `CTRLD_VOCAB_DOMAIN_ONTOLOGY` (
  `CTRLD_VOCAB_DOMAIN_ONTOLOGY_ID` double(12,0) NOT NULL,
  `CTRLD_VOCAB_DOMAIN_ID` double(12,0) NOT NULL,
  `ONTOLOGY_ID` double(12,0) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `CREATED_BY` double(12,0) NOT NULL,
  `MODIFIED_DATE` datetime DEFAULT NULL,
  `MODIFIED_BY` double(12,0) DEFAULT NULL,
  PRIMARY KEY (`CTRLD_VOCAB_DOMAIN_ONTOLOGY_ID`),
  KEY `VOCAB_DOMAIN_ONTO_DOMAIN_FK_idx` (`CTRLD_VOCAB_DOMAIN_ID`),
  KEY `VOCAB_DOMAIN_ONTO_ONTO_FK_idx` (`ONTOLOGY_ID`),
  KEY `VOCAB_DOMAIN_ONTO_CREATED_FK_idx` (`CREATED_BY`),
  KEY `VOCAB_DOMAIN_ONTO_MODIFIED_FK_idx` (`MODIFIED_BY`),
  CONSTRAINT `VOCAB_DOMAIN_ONTO_CREATED_FK` FOREIGN KEY (`CREATED_BY`) REFERENCES `CURATOR` (`curator-id`),
  CONSTRAINT `VOCAB_DOMAIN_ONTO_DOMAIN_FK` FOREIGN KEY (`CTRLD_VOCAB_DOMAIN_ID`) REFERENCES `CTRLD_VOCAB_DOMAIN` (`ctrld_vocab_domain_id`),
  CONSTRAINT `VOCAB_DOMAIN_ONTO_MODIFIED_FK` FOREIGN KEY (`MODIFIED_BY`) REFERENCES `CURATOR` (`curator-id`),
  CONSTRAINT `VOCAB_DOMAIN_ONTO_ONTO_FK` FOREIGN KEY (`ONTOLOGY_ID`) REFERENCES `ONTOLOGY` (`ontology_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `TERM` (
  `TERM_ID` double(12,0) NOT NULL,
  `ONTOLOGY_ID` double(12,0) NOT NULL,
  `TERM_NAME` varchar(256) NOT NULL,
  `REFERENCE_ID` varchar(32) NOT NULL,
  `DEFINITION` varchar(1024) DEFAULT NULL,
  `DEFINITION_URL` varchar(1024) DEFAULT NULL,
  `COMMENTS` varchar(1024) DEFAULT NULL,
  `IS_ROOT` bit(1) NOT NULL,
  `STATUS` varchar(8) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `CREATED_BY` double(12,0) NOT NULL,
  `CREATED_VERSION_ID` double(12,0) NOT NULL,
  `APPROVED_VERSION_ID` double(12,0) DEFAULT NULL,
  `OBSOLETE_VERSION_ID` double(12,0) DEFAULT NULL,
  `REPLACED_BY` double(12,0) DEFAULT NULL,
  PRIMARY KEY (`TERM_ID`),
  KEY `TERM_ONTOLOGY_FK_idx` (`ONTOLOGY_ID`),
  KEY `TERM_CREATED_BY_FK_idx` (`CREATED_BY`),
  KEY `TERM_CREATED_VERSION_FK_idx` (`CREATED_VERSION_ID`),
  KEY `TERM_APPROVED_VERSION_FK_idx` (`APPROVED_VERSION_ID`),
  KEY `TERM_OBSOLETE_VERSION_FK_idx` (`OBSOLETE_VERSION_ID`),
  KEY `TERM_REPLACED_BY_FK_idx` (`REPLACED_BY`),
  CONSTRAINT `TERM_APPROVED_VERSION_FK` FOREIGN KEY (`APPROVED_VERSION_ID`) REFERENCES `VERSION` (`version_id`),
  CONSTRAINT `TERM_CREATED_BY_FK` FOREIGN KEY (`CREATED_BY`) REFERENCES `CURATOR` (`curator-id`),
  CONSTRAINT `TERM_CREATED_VERSION_FK` FOREIGN KEY (`CREATED_VERSION_ID`) REFERENCES `VERSION` (`version_id`),
  CONSTRAINT `TERM_OBSOLETE_VERSION_FK` FOREIGN KEY (`OBSOLETE_VERSION_ID`) REFERENCES `VERSION` (`version_id`),
  CONSTRAINT `TERM_ONTOLOGY_FK` FOREIGN KEY (`ONTOLOGY_ID`) REFERENCES `ONTOLOGY` (`ontology_id`),
  CONSTRAINT `TERM_REPLACED_BY_FK` FOREIGN KEY (`REPLACED_BY`) REFERENCES `TERM` (`term_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;






CREATE TABLE `TERM_XREF` (
  `TERM_XREF_ID` double(12,0) NOT NULL,
  `TERM_ID` double(12,0) NOT NULL,
  `DATASOURCE_ID` double(12,0) DEFAULT NULL,
  `REFERENCE_ID` varchar(256) DEFAULT NULL,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  `XREF_URL` varchar(1024) DEFAULT NULL,
  `IS_DEFINITION_XREF` bit(1) NOT NULL DEFAULT b'0',
  `STATUS` double(8,0) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `CREATED_BY` double(12,0) NOT NULL,
  `MODIFIED_DATE` datetime DEFAULT NULL,
  `MODIFIED_BY` double(12,0) DEFAULT NULL,
  PRIMARY KEY (`TERM_XREF_ID`),
  KEY `TERM_XREF_TERM_FK_idx` (`TERM_ID`),
  KEY `TERM_XREF_DATASOURCE_FK_idx` (`DATASOURCE_ID`),
  KEY `TERM_XREF_CREATED_BY_FK_idx` (`CREATED_BY`),
  KEY `TERM_XREF_MODIFIED_BY_FK_idx` (`MODIFIED_BY`),
  CONSTRAINT `TERM_XREF_CREATED_BY_FK` FOREIGN KEY (`CREATED_BY`) REFERENCES `CURATOR` (`curator-id`),
  CONSTRAINT `TERM_XREF_DATASOURCE_FK` FOREIGN KEY (`DATASOURCE_ID`) REFERENCES `DATASOURCE` (`datasource_id`),
  CONSTRAINT `TERM_XREF_MODIFIED_BY_FK` FOREIGN KEY (`MODIFIED_BY`) REFERENCES `CURATOR` (`curator-id`),
  CONSTRAINT `TERM_XREF_TERM_FK` FOREIGN KEY (`TERM_ID`) REFERENCES `TERM` (`term_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





CREATE TABLE `TERM_RELATIONSHIP` (
  `TERM_RELATIONSHIP_ID` double(12,0) NOT NULL,
  `TERM_ID` double(12,0) NOT NULL,
  `RELATED_TERM_ID` double(12,0) NOT NULL,
  `RELATIONSHIP_TYPE_ID` double(12,0) NOT NULL,
  `IS_INTERSECTION` bit(1) DEFAULT b'0',
  `STATUS` varchar(8) NOT NULL DEFAULT 'PENDING',
  `CREATED_DATE` datetime NOT NULL,
  `CREATED_BY` double(12,0) NOT NULL,
  `CREATED_VERSION_ID` double(12,0) NOT NULL,
  `APPROVED_VERSION_ID` double(12,0) DEFAULT NULL,
  `OBSOLETE_VERSION_ID` double(12,0) DEFAULT NULL,
  `REPLACED_BY` double(12,0) DEFAULT NULL,
  PRIMARY KEY (`TERM_RELATIONSHIP_ID`),
  KEY `TERM_RELSHIP_TERM_FK_idx` (`TERM_ID`),
  KEY `TERM_RELSHIP_RELATED_TERM_FK_idx` (`RELATED_TERM_ID`),
  KEY `TERM_RELSHIP_TYPE_FK_idx` (`RELATIONSHIP_TYPE_ID`),
  KEY `TERM_RSHIP_CREATED_BY_FK_idx` (`CREATED_BY`),
  KEY `TERM_RSHIP_CREATED_VERSION_FK_idx` (`CREATED_VERSION_ID`),
  KEY `TERM_RSHIP_APRROVED_VERSION_FK_idx` (`APPROVED_VERSION_ID`),
  KEY `TERM_RSHIP_OBSOLETE_VERSION_FK_idx` (`OBSOLETE_VERSION_ID`),
  KEY `TERM_RSHIP_REPLACED_BY_FK_idx` (`REPLACED_BY`),
  CONSTRAINT `TERM_RELSHIP_RELATED_TERM_FK` FOREIGN KEY (`RELATED_TERM_ID`) REFERENCES `TERM` (`term_id`),
  CONSTRAINT `TERM_RELSHIP_TERM_FK` FOREIGN KEY (`TERM_ID`) REFERENCES `TERM` (`term_id`),
  CONSTRAINT `TERM_RELSHIP_TYPE_FK` FOREIGN KEY (`RELATIONSHIP_TYPE_ID`) REFERENCES `RELATIONSHIP_TYPE` (`relationship_type_id`),
  CONSTRAINT `TERM_RSHIP_APRROVED_VERSION_FK` FOREIGN KEY (`APPROVED_VERSION_ID`) REFERENCES `VERSION` (`version_id`),
  CONSTRAINT `TERM_RSHIP_CREATED_BY_FK` FOREIGN KEY (`CREATED_BY`) REFERENCES `CURATOR` (`curator-id`),
  CONSTRAINT `TERM_RSHIP_CREATED_VERSION_FK` FOREIGN KEY (`CREATED_VERSION_ID`) REFERENCES `VERSION` (`version_id`),
  CONSTRAINT `TERM_RSHIP_OBSOLETE_VERSION_FK` FOREIGN KEY (`OBSOLETE_VERSION_ID`) REFERENCES `VERSION` (`version_id`),
  CONSTRAINT `TERM_RSHIP_REPLACED_BY_FK` FOREIGN KEY (`REPLACED_BY`) REFERENCES `TERM_RELATIONSHIP` (`term_relationship_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





CREATE TABLE `TERM_SYNONYM` (
  `TERM_SYNONYM_ID` double(12,0) NOT NULL,
  `TERM_ID` double(12,0) NOT NULL,
  `TERM_SYNONYM` varchar(256) NOT NULL,
  `SYNONYM_TYPE` varchar(8) NOT NULL,
  `CTRLD_VOCAB_TERM_ID` double(12,0) DEFAULT NULL,
  `DATASOURCE_ID` double(12,0) DEFAULT NULL,
  `REFERENCE_ID` varchar(256) DEFAULT NULL,
  `XREF_URL` varchar(1024) DEFAULT NULL,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  `STATUS` varchar(8) NOT NULL DEFAULT 'PENDING',
  `CREATED_DATE` datetime NOT NULL,
  `CREATED_BY` double(12,0) NOT NULL,
  `CREATED_VERSION_ID` double(12,0) NOT NULL,
  `APPROVED_VERSION_ID` double(12,0) DEFAULT NULL,
  `OBSOLETE_VERSION_ID` double(12,0) DEFAULT NULL,
  `REPLACED_BY` double(12,0) DEFAULT NULL,
  PRIMARY KEY (`TERM_SYNONYM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `CURATOR_ACTION` (
  `CURATOR_ACTION_ID` double(12,0) NOT NULL,
  `CURATOR_ID` double(12,0) NOT NULL,
  `ACTION` varchar(8) NOT NULL,
  `COMMENTS` varchar(1024) DEFAULT NULL,
  `ACTION_DATE` datetime NOT NULL,
  `RELATIONSHIP_TYPE_ID` double(12,0) DEFAULT NULL,
  `ONTOLOGY_ID` double(12,0) DEFAULT NULL,
  `TERM_ID` double(12,0) DEFAULT NULL,
  `TERM_XREF_ID` double(12,0) DEFAULT NULL,
  `TERM_RELATIONSHIP_ID` double(12,0) DEFAULT NULL,
  `TERM_SYNONYM_ID` double(12,0) DEFAULT NULL,
  PRIMARY KEY (`CURATOR_ACTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


