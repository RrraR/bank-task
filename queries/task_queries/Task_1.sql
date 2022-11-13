SELECT DISTINCT Bank_name
FROM [bank-task].dbo.Banks
         JOIN [bank-task].dbo.Branches Br on Banks.BankID = Br.Bank_ID
         JOIN [bank-task].dbo.Cities C on C.CityID = Br.City_Id
WHERE c.City_name = 'Minsk'