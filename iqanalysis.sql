--checking the count of records
select count(*) from iqtable;
-- 125

--checking for NULL values in the table
select * from iqtable where Ranking is NULL or Country is NULL or Average_IQ is NULL or Participants is NULL;
-- 53||97.37|3816
-- In this record,the value of Country is NULL, hence we will drop this record 

--dropping record where Country is NULL
delete from iqtable where Country is NULL;

--checking if changes have been made to the database or not
select count(*) from iqtable;
-- 124
--change has successfully been made and one record is deleted

-- checking the top 5 countries with highest IQ
select Country from iqtable order by Average_IQ desc limit 5;
-- Japan
-- South Korea
-- China
-- Iran (Islamic Republic of)
-- Singapore

--average IQ of the world
select avg(Average_IQ) from iqtable;
-- 95.8275806451613

--checking the count of countries having IQ greater than or equal to the average IQ 
select count(*) from iqtable where Average_IQ>=(select avg(Average_IQ) from iqtable);
-- 69

--checking the count of countries having IQ less than the average IQ
select count(*) from iqtable where Average_IQ<(select avg(Average_IQ) from iqtable);
--55

--checking the average number of participants in the IQ test
select avg(Participants) from iqtable;
-- 12598.1209677419

--checking the number of countries whose count of participants is greater than or equal to the average participants in the IQ test
select count(*) from iqtable where Participants>=(select avg(Participants) from iqtable);
-- 29

--checking the number of countries whose count of participants is less than the average participants in the IQ test
select count(*) from iqtable where Participants<(select avg(Participants) from iqtable);
-- 95

--checking the top 5 countries with the most participants 
select Country from iqtable order by Participants desc limit 5;
-- China
-- Indonesia
-- Japan
-- South Korea
-- Ukraine