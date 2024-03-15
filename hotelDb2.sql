select * from codeGroup;

insert into codeGroup(
	name, 
    cgRegDate, 
    cgUpdate, 
    cgDelny
)values(
	'객실 유형',
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

update codeGroup set cgUpDate=now() where cgSeq=1; 