create database hotel;

use hotel;

CREATE TABLE IF NOT EXISTS `hotel`.`codeGroup` (
  `cgSeq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `cgRegDate` DATETIME NULL COMMENT '등록일',
  `cgUpdate` DATETIME NULL COMMENT '수정일',
  `cgDelny` TINYINT NULL COMMENT '삭제여부',
  PRIMARY KEY (`cgSeq`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `hotel`.`code` (
  `cdSeq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `cdRegDate` DATETIME NULL COMMENT '등록일',
  `cdUpdate` DATETIME NULL COMMENT '수정일',
  `cdDelny` TINYINT NULL COMMENT '삭제여부',
  `codeGroup_seq` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`cdSeq`),
  INDEX `fk_code_codeGroup_idx` (`codeGroup_seq` ASC) VISIBLE,
  CONSTRAINT `fk_code_codeGroup`
    FOREIGN KEY (`codeGroup_seq`)
    REFERENCES `hotel`.`codeGroup` (`cgSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `hotel`.`member` (
  `memberSeq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fristName` VARCHAR(45) NULL COMMENT '성',
  `lastName` VARCHAR(45) NULL COMMENT '이름',
  `genderCD` TINYINT NULL COMMENT '성별(공통코드)',
  `birthday` VARCHAR(45) NULL COMMENT '생일',
  `memberID` VARCHAR(45) NULL COMMENT '아이디',
  `memberPassword` VARCHAR(45) NULL COMMENT '비밀번호',
  `memberPhone` VARCHAR(45) NULL COMMENT '전화번호',
  `codeNumber` VARCHAR(45) NULL COMMENT '우편번호',
  `roadName` VARCHAR(45) NULL COMMENT '도로명',
  `addrDetail` VARCHAR(45) NULL COMMENT '상세정보',
  `mbRegDate` DATETIME NULL,
  `mbUpdate` DATETIME NULL,
  `mbDelny` TINYINT NULL,
  PRIMARY KEY (`memberSeq`))
ENGINE = InnoDB
COMMENT = '회원테이블';

CREATE TABLE IF NOT EXISTS `hotel`.`wishlist` (
  `wishSeq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `wishRegDate` DATETIME NULL,
  `wishlUpdate` DATETIME NULL,
  `wishDelny` TINYINT NULL,
  `member_seq` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`wishSeq`),
  INDEX `fk_wishlist_member1_idx` (`member_seq` ASC) VISIBLE,
  CONSTRAINT `fk_wishlist_member1`
    FOREIGN KEY (`member_seq`)
    REFERENCES `hotel`.`member` (`memberSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '찜 목록';


CREATE TABLE IF NOT EXISTS `hotel`.`hotelBooking` (
  `bookingSeq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `bkCheckin` DATE NULL COMMENT '체크인',
  `bkCheckout` DATE NULL COMMENT '체크아웃',
  `bkRoomtypeCD` VARCHAR(45) NULL COMMENT '객실유형',
  `bkAdult` VARCHAR(45) NULL COMMENT '어른',
  `bkChild` VARCHAR(45) NULL COMMENT '아이',
  `bkTotalPrice` DOUBLE NULL COMMENT '총 가격',
  `payType` VARCHAR(45) NULL COMMENT '결제수단',
  `cardNumber` VARCHAR(45) NULL COMMENT '카드번호',
  `cardDate` VARCHAR(45) NULL COMMENT '월/일',
  `cardYear` VARCHAR(45) NULL COMMENT '년',
  `cardCcv` VARCHAR(45) NULL COMMENT 'ccv번호',
  `bkRegDate` DATETIME NULL,
  `bkUpdate` DATETIME NULL,
  `bkDelny` TINYINT NULL,
  `member_seq` INT UNSIGNED NOT NULL,
  `roomDetail_seq` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`bookingSeq`),
  INDEX `fk_booking_member1_idx` (`member_seq` ASC) VISIBLE,
  INDEX `fk_hotelBooking_roomDetail1_idx` (`roomDetail_seq` ASC) VISIBLE,
  CONSTRAINT `fk_booking_member1`
    FOREIGN KEY (`member_seq`)
    REFERENCES `hotel`.`member` (`memberSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hotelBooking_roomDetail1`
    FOREIGN KEY (`roomDetail_seq`)
    REFERENCES `hotel`.`roomDetail` (`roomSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '예약';


CREATE TABLE IF NOT EXISTS `hotel`.`hotelList` (
  `hotelSeq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `hotelName` VARCHAR(45) NULL COMMENT '숙소이름',
  `hotelContent` VARCHAR(45) NULL COMMENT '숙소소개',
  `hotelPrice` DOUBLE NULL COMMENT '숙소가격',
  `htRegDate` DATETIME NULL COMMENT '등록일',
  `htUpdate` DATETIME NULL COMMENT '수정일',
  `htDelny` TINYINT NULL,
  `htTotalRating` INT NULL COMMENT '총 평점',
  `hotelRating` INT NULL COMMENT '별점',
  `hotelTypeCD` VARCHAR(45) NULL COMMENT '숙소유형',
  `areaCD` VARCHAR(45) NULL COMMENT '지역(공통코드)',
  `wishlist_seq` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`hotelSeq`),
  INDEX `fk_hotelList_wishlist1_idx` (`wishlist_seq` ASC) VISIBLE,
  CONSTRAINT `fk_hotelList_wishlist1`
    FOREIGN KEY (`wishlist_seq`)
    REFERENCES `hotel`.`wishlist` (`wishSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '숙소리스트';

CREATE TABLE IF NOT EXISTS `hotel`.`roomDetail` (
  `roomSeq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `roomName` VARCHAR(45) NULL COMMENT '객실 이름',
  `roomPrice` DOUBLE NULL COMMENT '객실 가격',
  `roomContent` VARCHAR(45) NULL COMMENT '객실 소개',
  `roominfo` VARCHAR(45) NULL COMMENT '객실 이용 정보',
  `roomTypeCD` VARCHAR(45) NULL COMMENT '객실 유형',
  `tvNy` TINYINT NULL COMMENT 'tv(ny로 있냐 없냐)',
  `wifiNy` TINYINT NULL COMMENT '와이파이',
  `poolNy` TINYINT NULL COMMENT '수영장',
  `airNy` TINYINT NULL COMMENT '에어컨',
  `bathNy` TINYINT NULL COMMENT '욕조',
  `bathSuppliesNy` TINYINT NULL COMMENT '욕실용품',
  `roomRegDate` DATETIME NULL COMMENT '등록일',
  `roomUpdate` DATETIME NULL COMMENT '수정일',
  `roomDelny` TINYINT NULL,
  `hotelList_seq` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`roomSeq`),
  INDEX `fk_hotelDetail_hotelList1_idx` (`hotelList_seq` ASC) VISIBLE,
  CONSTRAINT `fk_hotelDetail_hotelList1`
    FOREIGN KEY (`hotelList_seq`)
    REFERENCES `hotel`.`hotelList` (`hotelSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '숙소 상세정보';


CREATE TABLE IF NOT EXISTS `hotel`.`review` (
  `reviewSeq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `totalRating` INT NULL COMMENT '총 평점',
  `cleanRating` VARCHAR(45) NULL COMMENT '청결평점',
  `comfortRating` VARCHAR(45) NULL COMMENT '편안함 평점',
  `priceRating` VARCHAR(45) NULL COMMENT '가격 평점',
  `qualityRating` VARCHAR(45) NULL COMMENT '퀄리티 평점',
  `reviewContent` TEXT NULL COMMENT '리뷰 내용 작성',
  `reRegDate` DATETIME NULL,
  `reUpdate` DATETIME NULL,
  `reDelny` TINYINT NULL,
  `hotelDetail_seq` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`reviewSeq`),
  INDEX `fk_review_hotelDetail1_idx` (`hotelDetail_seq` ASC) VISIBLE,
  CONSTRAINT `fk_review_hotelDetail1`
    FOREIGN KEY (`hotelDetail_seq`)
    REFERENCES `hotel`.`roomDetail` (`roomSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '리뷰 작성';