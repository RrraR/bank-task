create table [bank-task].dbo.Social_Status(
    StatusID int primary key identity,
    Status_name nvarchar(30) default('Unemployed')
                          
);

insert into [bank-task].dbo.Social_Status(Status_name)
values 
    ('Student'),
    ('Retire'),
    ('Disabled'),
    ('Employed')
;