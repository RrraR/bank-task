create trigger cards_update
    on [bank-task].dbo.Cards
    instead of update
    as
begin
    declare @accountBalance money,
        @currentTotalCardsBalance money,
        @resultTotalCardsBalance money,
        @cardBalanceBeforeUpdate money,
        @cardBalanceAfterUpdate money

    select @accountBalance = (select Balance
                              from [bank-task].dbo.Accounts
                              where AccountID = (select inserted.Account_id
                                                 from inserted))

    select @currentTotalCardsBalance = (select sum([bank-task].dbo.Cards.Card_balance)
                                        from [bank-task].dbo.Cards
                                        where Cards.Account_id = (select inserted.Account_id
                                                                  from inserted)
                                        group by Cards.Account_id)

    select @cardBalanceBeforeUpdate = (select Card_balance
                                       from [bank-task].dbo.Cards
                                       where Cards.CardID = (select inserted.CardID
                                                             FROM inserted))

    select @cardBalanceAfterUpdate = (select Card_balance
                                      from inserted)

    select @resultTotalCardsBalance = @currentTotalCardsBalance - @cardBalanceBeforeUpdate + @cardBalanceAfterUpdate

    update [bank-task].dbo.Cards
    set Card_balance = @cardBalanceAfterUpdate
    where Cards.CardID = (select inserted.CardID
                          from inserted)
      and @accountBalance >= @resultTotalCardsBalance

    if @@ROWCOUNT = 0
        print 'Warning: No rows were updated';
    else
        print 'Balance was updated successfully';
end