-- create table [bank-task].dbo.Social_Statuses(
--     StatusID int primary key identity,
--     Status_name nvarchar(30) default('Unemployed')
--                           
-- );

insert into [bank-task].dbo.Social_Statuses(Status_name)
values 
    ('Student'),
    ('Retire'),
    ('Disabled'),
    ('Employed')
;