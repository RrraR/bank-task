SELECT AccountID, 
       Balance - (SELECT SUM(Card_balance) FROM Cards WHERE AccountID = Cards.Account_id) AS Free_resources
FROM [bank-task].dbo.Accounts
