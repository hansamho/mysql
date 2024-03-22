select * from codeGroup;

delete from codeGroup where cgSeq=12;

insert into codeGroup(
	name, 
    cgRegDate, 
    cgUpdate, 
    cgDelny
)values(
	'객실 유형12',
    now(),
    now(),
    0
);

select * from code;

insert into code(
	name, 
    cdRegDate, 
    cdUpdate, 
    cdDelny, 
    codeGroup_seq
)values(
	'트윈룸',
    now(),
    now(),
    0,
    6
);

update code set cdRegDate='2024-03-14 17:58:43' where cdSeq=1; 



 SELECT
            a.cdSeq
            ,a.name
            ,a.codeGroup_seq
            ,a.cdRegDate
            ,a.cdUpdate
            ,a.cdDelny
            ,(select aa.name from codegroup aa where 1=1 and aa.cgSeq = a.codeGroup_seq) as codegroup_name
         FROM code a
        WHERE 1=1
         ORDER BY a.cdSeq DESC;
         
         select * from member;
         
         
          SELECT
            a.cdSeq
            ,a.name
            ,a.codeGroup_seq
            ,a.cdRegDate
            ,a.cdUpdate
            ,a.cdDelny
            ,(select aa.name from codegroup aa where 1=1 and aa.cgSeq = a.codeGroup_seq) as codegroup_name
         FROM code a
        WHERE 1=1
        ORDER BY a.cdSeq DESC;
        
        
         SELECT
            a.memberSeq
            ,a.fristName
            ,a.lastName
            ,a.genderCD
            ,a.memberID
            ,a.memberPassword
            ,a.memberPhone
            ,a.codeNumber
            ,a.roadName
            ,a.addrDetail
            ,(select aa.name from code aa where 1=1 and aa.cdSeq = a.memberSeq) as code_name
         FROM member a
        WHERE 1=1
        ORDER BY a.memberSeq DESC;
        
select * from member;

insert into member(
	fristName, 
    lastName, 
    genderCD, 
    birthday, 
    memberID, 
    memberPassword, 
    memberPhone, 
    codeNumber, 
    roadName, 
    addrDetail
)values(
	'한',
    '삼호',
    14,
    '1997-09-23',
    'tkagh258',
    '258741as@',
    '010-2090-2245',
    '02175',
    '서울시 중랑구 겸재로 61길 28',
    '401호'
);

insert into member(
	fristName, 
    lastName, 
    genderCD, 
    birthday,
    memberID, 
    memberPassword, 
    memberPhone, 
    codeNumber, 
    roadName, 
    addrDetail,
    mbRegDate, 
    mbUpdate, 
    mbDelny
)values(
	'한',
    '삼호',
    14,
    '1997-09-23',
    'tkagh258',
    'samho456@',
    '010-2090-2245',
    '02175',
    '서울시 중랑구 겸재로61길 28',
    '401호',
    now(),
    now(),
    0
);

update member set birthday= '1997-09-23' where memberSeq='2';

select * from code;

  SELECT
            a.memberSeq
            ,a.fristName
            ,a.lastName
            ,a.genderCD
            ,a.memberID
            ,a.memberPassword
            ,a.memberPhone
            ,a.codeNumber
            ,a.roadName
            ,a.addrDetail
         FROM member a
        WHERE 1=1
        ORDER BY a.memberSeq DESC;
        
update member set memberPassword='samho123' where memberSeq=1;

select * from hotellist;

insert into hotellist(
	hotelName, 
    hotelContent, 
    hotelPrice, 
    htRegDate, 
    htUpdate, 
    htDelny,
    htTotalRating, 
    hotelRating, 
    hotelTypeCD, 
    areaCD,
    wishlist_seq
)values(
	'마리아 호텔',
    '이 호텔은....',
    ''
);


 SELECT
            a.memberSeq
            ,a.fristName
            ,a.lastName
            ,a.genderCd
            ,a.birthday
            ,a.memberID
            ,a.memberPassword
            ,a.memberPhone
            ,a.codeNumber
            ,a.roadName
            ,a.addrDetail
            ,a.mbRegDate
            ,a.mbUpdate
            ,a.mbDelny
         FROM member a
        WHERE 1=1
        ORDER BY a.memberSeq DESC;
        
        
select * from hotellist;

insert into hotellist(
	hotelName, 
    hotelContent, 
    hotelPrice, 
    htTotalRating, 
    hotelRating,
    hotelTypeCD, 
    areaCD, 
	htRegDate, 
    htUpdate, 
    htDelny,
    wishlist_seq
) 
values(
	
);

  SELECT
            a.memberSeq
            ,a.fristName
            ,a.lastName
            ,a.genderCD
            ,a.birthday
            ,a.memberID
            ,a.memberPassword
            ,a.memberPhone
            ,a.codeNumber
            ,a.roadName
            ,a.addrDetail
            ,a.mbRegDate
            ,a.mbUpdate
            ,a.mbDelny
         FROM member a
        WHERE 1=1
       
        order BY a.memberSeq DESC;
        
        
        INSERT INTO member(
            a.fristName
            ,a.lastName
            ,a.genderCd
            ,a.birthday
            ,a.memberID
            ,a.memberPassword
            ,a.memberPhone
            ,a.codeNumber
            ,a.roadName
            ,a.addrDetail
            ,a.mbRegDate
            ,a.mbUpdate
            ,a.mbDelny
    	) VALUES(		 
    		#{fristName}
    		,#{lastName}
    		,#{genderCd}
    		,#{birthday}
    		,#{memberID}
    		,#{memberPassword}
    		,#{memberPhone}
    		,#{codeNumber}
    		,#{roadName}
    		,#{addrDetail}
    		,now()
    		,now()
    		,0
    	);
        