page 50150 "Customer Rating Card"
{
    PageType = Card;
    SourceTable = "Customer Rating History";
    ApplicationArea = All;
    UsageCategory = Administration;


    layout
    {
        area(content)
        {
            group(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }

                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }

                field(Rating; Rec.Rating)
                {
                    ApplicationArea = All;
                }

                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Notify Manager")
            {
                ApplicationArea = All;
                Image = Send;
                ToolTip = 'Notify the manager of this rating.';

                trigger OnAction()
                var
                    NotificationCU: Codeunit "Customer Rating Notification";
                begin
                    NotificationCU.NotifyManagerOfLowRating(Rec."Customer No.", Rec.Rating);
                end;
            }
        }
    }

    var
        Text001: Label 'Notify Manager?';
}
