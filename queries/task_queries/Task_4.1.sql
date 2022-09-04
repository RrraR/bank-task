select [bank-task].dbo.Social_Status.Status_name, COUNT([bank-task].dbo.Cards.CardID) as CardCount 
from [bank-task].dbo.Cards
         LEFT JOIN [bank-task].dbo.Accounts ON Accounts.AccountID = Cards.Account_id
         LEFT JOIN [bank-task].dbo.Clients ON Clients.ClientID = Accounts.Client_id
         RIGHT JOIN [bank-task].dbo.Social_Status ON Social_status.StatusID = Clients.Status_id
GROUP BY [bank-task].dbo.Social_Status.StatusID, [bank-task].dbo.Social_Status.Status_name