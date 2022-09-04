Select distinct Bank_name from [bank-task].dbo.Banks
    join [bank-task].dbo.Branches Br on Banks.BankID = Br.Bank_ID
    join [bank-task].dbo.Cities C on C.CityID = Br.City_Id
where c.City_name = 'Minsk'