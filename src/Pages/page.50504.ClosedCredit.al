page 50504 "Closed Letter of Credit"
{
    //CardPageID = "Letter of Credit Request Card";
    ModifyAllowed = false;
    PageType = List;
    SourceTable = 50500;
    UsageCategory = Lists;
    ApplicationArea = all;
    SourceTableView = WHERE(Status = FILTER(Closed));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field("PO No."; Rec."PO No.")
                {
                    ApplicationArea = all;
                }
                field("PO Date"; Rec."PO Date")
                {
                    ApplicationArea = all;
                }
                field("Type of Request"; Rec."Type of Request")
                {
                    ApplicationArea = all;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }

                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = all;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = all;
                }
                field("PO Currency Code"; Rec."PO Currency Code")
                {
                    ApplicationArea = all;
                }
                field("PO Value"; Rec."PO Value")
                {
                    ApplicationArea = all;
                }
                field("PO Currency Rate"; Rec."PO Currency Rate")
                {
                    ApplicationArea = all;
                }
                field("PO Value (LCY)"; Rec."PO Value (LCY)")
                {
                    ApplicationArea = all;
                }
                field("Payment Terms"; Rec."Payment Terms")
                {
                    ApplicationArea = all;
                }
                field("SCM Approver"; Rec."SCM Approver")
                {
                    ApplicationArea = all;
                }
                field("Approved By"; Rec."Approved By")
                {
                    ApplicationArea = all;
                }
                field("Approved On/LC Request"; Rec."Approved On/LC Request")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
        }
    }
}

