CREATE PROCEDURE AddTenDollars @status int
AS
begin
    begin try
        IF @status NOT IN (SELECT StatusID FROM Social_Statuses) OR 
        @status NOT IN (SELECT Status_id FROM Clients)
            throw 51000, 'Error, social status code is invalid', 1;

        UPDATE [bank-task].dbo.Accounts
        SET Balance = Balance + 10
        FROM [bank-task].dbo.Accounts
                 INNER JOIN Clients C on C.ClientID = Accounts.Client_id
        WHERE C.Status_id = @status

    end try
    begin catch
        throw
    end catch
end


    exec AddTenDollars @status = 5.2