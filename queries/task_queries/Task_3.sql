select [bank-task].dbo.Accounts.AccountID, [bank-task].dbo.Accounts.Balance, Card.TotalBalance, ([bank-task].dbo.Accounts.Balance - Card.TotalBalance) as Balance_difference
from [bank-task].dbo.Accounts
         LEFT JOIN	(SELECT [bank-task].dbo.Cards.Account_id, SUM([bank-task].dbo.Cards.Card_balance) AS TotalBalance
                       FROM [bank-task].dbo.Cards
                       GROUP BY Cards.Account_id) AS Card ON [bank-task].dbo.Accounts.AccountID = Card.Account_id