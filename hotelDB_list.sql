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
	'마리아 호텔'
    
);

select 
a.hotelSeq
,a.hotelName
,a.hotelRating
,a.htTotalRating
,a.areaCD
,b.roomSeq
,b.roomName
,b.roomPrice
,b.roomContent
,b.roominfo
,b.roomTypeCD
,b.tvNy
,b.wifiNy
,b.poolNy
,b.airNy
,b.bathNy
,b.bathSuppliesNy
,b.roomRegDate
,b.roomUpdate
,b.roomDelny
,b.hotelList_Seq
from hotellist a
left join roomDetail b
on a.hotelSeq = b.roomSeq
ORDER BY a.hotelSeq DESC;

select * from hotellist a
left join roomDetail b
on a.hotelSeq = b.roomSeq;
