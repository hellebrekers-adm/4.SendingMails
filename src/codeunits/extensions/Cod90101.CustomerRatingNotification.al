codeunit 50151 "Customer Rating Notification"
{
    procedure NotifyManagerOfLowRating(CustomerNo: Code[20]; RatingValue: Integer)
    var
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        Recipient: Text;
        Subject: Text;
        Body: Text;
    begin
        if RatingValue < 3 then  // assuming a scale of 1-5 for this example
        begin
            Recipient := 'kaspertest2000@outlook.com';  // replace with the actual email
            Subject := 'Low Customer Rating Alert!';
            Body := StrSubstNo('Customer %1 received a rating of %2.', CustomerNo, RatingValue);

            EmailMessage.Create(Recipient, Subject, Body);
            Email.Send(EmailMessage);
        end;
    end;
}
