page 50151 "Customer Rating List"
{
    PageType = List;
    SourceTable = "Customer Rating History";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
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
        area(navigation)
        {
            group("Rating Actions")
            {
                action("View Rating")
                {
                    ApplicationArea = All;
                    Image = View;
                    ToolTip = 'View the detailed rating.';

                    trigger OnAction()
                    begin
                        Page.Run(Page::"Customer Rating Card", Rec);
                    end;
                }

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
    }
}