SELECT [bank-task].dbo.Accounts.AccountID, ([bank-task].dbo.Accounts.Balance - SUM([bank-task].dbo.Cards.Card_balance)) AS Free_Resources
FROM [bank-task].dbo.Accounts
         LEFT JOIN [bank-task].dbo.Cards ON Cards.Account_id = Accounts.AccountID
GROUP BY AccountID, Accounts.Balance