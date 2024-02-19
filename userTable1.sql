CREATE TABLE IF NOT EXISTS `kakao`.`userAddress` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `addressCD` VARCHAR(45) NULL,
  `addressType` VARCHAR(45) NULL,
  `postcode` VARCHAR(45) NULL COMMENT '우편번호',
  `roadName` VARCHAR(45) NULL,
  `detailAddress` VARCHAR(45) NULL COMMENT '상세주소',
  `referen` VARCHAR(45) NULL COMMENT '참고항목',
  `Latitude` DOUBLE NULL COMMENT '경도',
  `Hardness` DOUBLE NULL COMMENT '위도',
  `local1` INT NULL,
  `local2` INT NULL,
  `addrCreate` DATETIME NULL,
  `addrUpdate` DATETIME NULL,
  `addrDelete` DATETIME NULL,
  `defaultny` TINYINT NULL,
  `user_seq` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_userAddress_user1_idx` (`user_seq` ASC) VISIBLE,
  CONSTRAINT `fk_userAddress_user1`
    FOREIGN KEY (`user_seq`)
    REFERENCES `kakao`.`user` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;





insert into userAddress(
	addressCD, 
    addressType, 
    postcode, 
    roadName, 
    detailAddress, 
    referen, 
    Latitude, 
    Hardness, 
    local1, 
    local2, 
    addrCreate, 
    addrUpdate, 
    addrDelete, 
    defaultny, 
    user_seq
)values(
	"15",
    "대학교",
    "28503",
    "충북 청주시 청원구 내덕동",
    "내덕동",
    null,
    36.6522355   , 
   127.4946216,
    36,
    null,
    null,
    null,
    null,
    null,
    10
);

select * from userAddress;

update userAddress set Hardness=127.1121146 where seq=8;

select * from user a 
join userAddress b
on a.seq=b.user_seq;

commit;

CREATE TABLE IF NOT EXISTS `kakao`.`groupTable` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `groupName` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL COMMENT '그룹이름',
  `groupCreate` DATETIME NULL,
  `groupUpdate` DATETIME NULL,
  `groupDelete` TINYINT NULL,
  `defaultny` TINYINT NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

insert into groupTable(
	groupName, 
    groupCreate, 
    groupUpdate, 
    groupDelete, 
    defaultny
)values(
	"거래처",
    null,
    null,
    null,
    null
);

select * from groupTable;

CREATE TABLE IF NOT EXISTS `kakao`.`userGroup` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ugCreate` DATETIME NULL,
  `ugUpdate` DATETIME NULL,
  `ugDelete` TINYINT NULL,
  `user_seq` INT UNSIGNED NOT NULL,
  `groupTable_seq` INT UNSIGNED NOT NULL,
  INDEX `fk_table1_user1_idx` (`user_seq` ASC) VISIBLE,
  PRIMARY KEY (`seq`),
  INDEX `fk_userGroup_groupTable1_idx` (`groupTable_seq` ASC) VISIBLE,
  CONSTRAINT `fk_table1_user1`
    FOREIGN KEY (`user_seq`)
    REFERENCES `kakao`.`user` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_userGroup_groupTable1`
    FOREIGN KEY (`groupTable_seq`)
    REFERENCES `kakao`.`groupTable` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

insert into userGroup(
	ugCreate, 
    ugUpdate, 
    ugDelete, 
    user_seq, 
    groupTable_seq
)values(
	null,
    null,
    null,
    10,
    10
);

select * from userGroup;

select * from  groupTable a 
join userGroup b
on a.seq=b.groupTable_seq;


CREATE TABLE IF NOT EXISTS `kakao`.`image` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `imagedata` VARCHAR(45) NULL COMMENT '이미지',
  `imagCreate` DATETIME NULL,
  `imageUpdate` DATETIME NULL,
  `imageDelete` TINYINT NULL,
  `defaultny` TINYINT NULL,
  `user_seq` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_image_user1_idx` (`user_seq` ASC) VISIBLE,
  CONSTRAINT `fk_image_user1`
    FOREIGN KEY (`user_seq`)
    REFERENCES `kakao`.`user` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

insert into image(
	imagedata, 
    imagCreate, 
    imageUpdate, 
    imageDelete, 
    defaultny, 
    user_seq
)values(
	"사람",
    null,
    null,
    null,
    null,
    10
);

select * from image;

select * from user a
join image b
on a.seq=b.user_seq;

commit;