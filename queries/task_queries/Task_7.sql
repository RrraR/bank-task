CREATE PROCEDURE AddMoneyToCard @cardNumber nvarchar(16),
                                @sum money
AS

BEGIN
    BEGIN TRANSACTION
        UPDATE [bank-task].dbo.Cards
        SET Cards.Card_balance = Cards.Card_balance + @sum
        WHERE 0 <= ALL (SELECT [bank-task].dbo.Accounts.Balance - CardsTotalBalance.total_balance - @sum
                        FROM [bank-task].dbo.Accounts
                                 LEFT JOIN (SELECT Cards.Account_id, sum(Cards.Card_balance) AS total_balance
                                            FROM [bank-task].dbo.Cards
                                            GROUP BY Cards.Account_id) AS CardsTotalBalance
                                           ON AccountID = CardsTotalBalance.Account_id
                                 LEFT JOIN (SELECT Card_number, Account_id FROM Cards) AS CardsNumber
                                           ON CardsNumber.Account_id = Accounts.AccountID
                        WHERE CardsNumber.Card_number = @cardNumber)
          AND Cards.CardID = ALL (SELECT CardID
                                  FROM [bank-task].dbo.Cards
                                  WHERE Cards.Card_number = @cardNumber)

        if (@@ERROR <> 0)
            ROLLBACK
    COMMIT
END

    exec AddMoneyToCard @cardNumber = '0832091096406677', @sum = 5