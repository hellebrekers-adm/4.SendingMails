codeunit 50150 "Customer Rating Management"
{
    procedure AddRatingForCustomer(CustomerNo: Code[20]; RatingValue: Integer; RatingComment: Text[100])
    var
        CustRating: Record "Customer Rating History";
    begin
        CustRating."Customer No." := CustomerNo;
        CustRating.Date := Today;
        CustRating.Rating := RatingValue;
        CustRating.Comment := RatingComment;
        CustRating.Insert();

        OnAfterRatingAdded(CustomerNo, RatingValue, RatingComment);
    end;

    procedure GetAverageRating(CustomerNo: Code[20]): Decimal
    var
        CustRating: Record "Customer Rating History";
        TotalRating: Decimal;
        TotalRecords: Integer;
    begin
        TotalRating := 0;
        TotalRecords := 0;

        if CustRating.FindSet then begin
            repeat
                TotalRating += CustRating.Rating;
                TotalRecords += 1;
            until CustRating.Next() = 0;
        end;

        if TotalRecords = 0 then
            exit(0);

        exit(TotalRating / TotalRecords);
    end;

    [IntegrationEvent(false, false)]
    procedure OnAfterRatingAdded(CustomerNo: Code[20]; RatingValue: Integer; RatingComment: Text[100])
    begin
    end;
}
