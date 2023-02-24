page 50502 "Letter of Credit Drafts"
{
    CardPageID = "Letter of Credit Draft Card";
    ModifyAllowed = false;
    PageType = List;
    SourceTable = 50500;
    UsageCategory = Lists;
    ApplicationArea = all;
    SourceTableView = WHERE(Status = FILTER(Released));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("PO No."; Rec."PO No.")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("PO Date"; Rec."PO Date")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Type of Request"; Rec."Type of Request")
                {
                    Editable = false;
                    ApplicationArea = all;
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
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
                field("Draft LC Send to Vendor"; Rec."Draft LC Send to Vendor")
                {
                    ApplicationArea = all;

                }
                field("Draft Confirmed By Vendor"; Rec."Draft Confirmed By Vendor")
                {
                    ApplicationArea = all;
                }
                field("Draft Sent to Bank"; Rec."Draft Sent to Bank")
                {
                    ApplicationArea = all;
                }
                field("LC No."; Rec."LC No.")
                {
                    ApplicationArea = all;
                }
                field("LC Generated On"; Rec."LC Generated On")
                {
                    ApplicationArea = all;
                }
                field("SWIFT Copy"; Rec."SWIFT Copy")
                {
                    ApplicationArea = all;
                }
                field("P Memo Copy"; Rec."P Memo Copy")
                {
                    ApplicationArea = all;
                }
                field("LC Expiry Date"; Rec."LC Expiry Date")
                {
                    ApplicationArea = all;

                }
                field("Payment Advice"; Rec."Payment Advice")
                {
                    ApplicationArea = all;
                }
                field("Payment Date"; Rec."Payment Date")
                {
                    ApplicationArea = all;

                }
                field("Paid Currency Rate"; Rec."Paid Currency Rate")
                {
                    ApplicationArea = all;

                }
                field("Expected Departure Date"; Rec."Expected Departure Date")
                {
                    ApplicationArea = all;
                }
                field("Expected Arrival Date"; Rec."Expected Arrival Date")
                {
                    ApplicationArea = all;
                }
                field("Custom Duty Payment 1"; Rec."Custom Duty Payment 1")
                {
                    ApplicationArea = all;
                }
                field("Custom Duty Payment Date 1"; Rec."Custom Duty Payment Date 1")
                {
                    ApplicationArea = all;
                }
                field("Custom Duty Challan 1"; Rec."Custom Duty Challan 1")
                {
                    ApplicationArea = all;
                }
                field("Custom Duty Payment 2"; Rec."Custom Duty Payment 2")
                {
                    ApplicationArea = all;
                }
                field("Custom Duty Payment Date 2"; Rec."Custom Duty Payment Date 2")
                {
                    ApplicationArea = all;

                }
                field("Custom Duty Challan 2"; Rec."Custom Duty Challan 2")
                {
                    ApplicationArea = all;
                }
                field("Custom Duty Payment 3"; Rec."Custom Duty Payment 3")
                {
                    ApplicationArea = all;
                }
                field("Custom Duty Payment Date 3"; Rec."Custom Duty Payment Date 3")
                {
                    ApplicationArea = all;
                }
                field("Custom Duty Challan 3"; Rec."Custom Duty Challan 3")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
    }
}

