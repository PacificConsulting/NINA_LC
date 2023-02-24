table 50500 "Letter of Credit"
{
    DrillDownPageID = 50500;
    LookupPageID = 50500;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Auto Update';
        }
        field(2; "PO No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Auto Update';
            TableRelation = "Purchase Header"."No." WHERE("Document Type" = CONST(Order),
                                                         Status = CONST(Released));

            trigger OnValidate()
            begin
                IF "PO No." <> '' THEN BEGIN
                    PurchaseHeader.GET(PurchaseHeader."Document Type"::Order, "PO No.");
                    "PO Date" := PurchaseHeader."Order Date";
                    "Vendor No." := PurchaseHeader."Buy-from Vendor No.";
                    "Vendor Name" := PurchaseHeader."Buy-from Vendor Name";
                    "Payment Terms" := PurchaseHeader."Payment Terms Code";
                    // PurchaseHeader.CALCFIELDS("Amount to Vendor");
                    "PO Value" := PurchaseHeader."Amount to Vendor";
                    "PO Currency Code" := PurchaseHeader."Currency Code";
                    IF "PO Currency Code" <> '' THEN BEGIN
                        "PO Currency Rate" := 1 / PurchaseHeader."Currency Factor";
                        "PO Value (LCY)" := "PO Value" * "PO Currency Rate";
                    END ELSE
                        IF "PO Currency Code" = '' THEN BEGIN
                            "PO Currency Rate" := 0;
                            "PO Value (LCY)" := PurchaseHeader."Amount to Vendor";
                            "PO Value" := PurchaseHeader."Amount to Vendor";
                        END;
                END;
                IF "PO No." = '' THEN BEGIN
                    "PO Date" := 0D;
                    "Vendor No." := '';
                    "Vendor Name" := '';
                    "Payment Terms" := '';
                    "PO Value" := 0;
                    "PO Currency Code" := '';
                    "PO Currency Rate" := 0;
                    "PO Value (LCY)" := 0;
                END;
            end;
        }
        field(3; "PO Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Auto Update';
            Editable = false;
        }
        field(4; "Type of Request"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,LC Terms,Open Terms,Advance Payment,Others';
            OptionMembers = " ","LC Terms","Open Terms","Advance Payment",Others;
        }
        field(5; "Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Auto Update';
            Editable = false;
            TableRelation = Vendor WHERE(Blocked = FILTER(' '));
        }
        field(6; "Vendor Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Auto Update';
            Editable = false;
        }
        field(7; "PO Currency Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Auto Update';
            Editable = false;
        }
        field(8; "PO Value"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Auto Update';
            Editable = false;
        }
        field(9; "PO Currency Rate"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Auto Update';
            Editable = false;
        }
        field(10; "PO Value (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Auto Update';
            Editable = false;
        }
        field(11; "Payment Terms"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Auto Update';
            Editable = false;
            TableRelation = "Payment Terms";
        }
        field(12; "SCM Approver"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Auto Update';
            Editable = false;
            TableRelation = Employee;
        }
        field(13; "Approved By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Auto Update';
            Editable = false;
        }
        field(14; "Approved On/LC Request"; DateTime)
        {
            DataClassification = ToBeClassified;
            Description = 'Auto Update';
            Editable = false;
        }
        field(15; "Draft LC Send to Vendor"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Manual Entry';
        }
        field(16; "Draft Confirmed By Vendor"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Manual Entry';
        }
        field(17; "Draft Sent to Bank"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Manual Entry';
        }
        field(18; "LC No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Manual Entry';
        }
        field(19; "LC Generated On"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Manual Entry';
        }
        field(20; "SWIFT Copy"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Manual Entry';
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(21; "P Memo Copy"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Manual Entry';
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(22; "LC Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Manual Entry';
        }
        field(23; "Payment Advice"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Manual Entry';
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(24; "Payment Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Manual Entry';
        }
        field(25; "Paid Currency Rate"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Manual Entry';
        }
        field(26; "Expected Departure Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Manual Entry';
        }
        field(27; "Expected Arrival Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Manual Entry';
        }
        field(28; "Custom Duty Payment 1"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Manual Entry';
        }
        field(29; "Custom Duty Payment Date 1"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Manual Entry';
        }
        field(30; "Custom Duty Challan 1"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Manual Entry';
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(31; "Custom Duty Payment 2"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Manual Entry';
        }
        field(32; "Custom Duty Payment Date 2"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Manual Entry';
        }
        field(33; "Custom Duty Challan 2"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Manual Entry';
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(34; "Custom Duty Payment 3"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Manual Entry';
        }
        field(35; "Custom Duty Payment Date 3"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Manual Entry';
        }
        field(36; "Custom Duty Challan 3"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Manual Entry';
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(37; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Auto Update';
        }
        field(38; Status; Enum "Credit Status")
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(39; "Incoming Document Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PurchaseHeader: Record 38;
        PurchasesPayablesSetup: Record 312;
        NoSeriesManagement: Codeunit 396;

    procedure AssistEdit(OldLetterofCredit: Record 50500): Boolean
    begin
        PurchasesPayablesSetup.GET;
        TestNoSeries;
        IF NoSeriesManagement.SelectSeries(GetNoSeriesCode, OldLetterofCredit."No. Series", Rec."No. Series") THEN BEGIN
            PurchasesPayablesSetup.GET;
            TestNoSeries;
            NoSeriesManagement.SetSeries(Rec."No.");
            EXIT(TRUE);
        END;
    end;

    procedure TestNoSeries(): Boolean
    begin
        PurchasesPayablesSetup.TESTFIELD(PurchasesPayablesSetup."LC No. Series");
    end;

    local procedure GetNoSeriesCode(): Code[10]
    begin
        EXIT(PurchasesPayablesSetup."LC No. Series");
    end;

    trigger OnInsert();
    begin
        PurchasesPayablesSetup.GET;
        IF "No." = '' THEN BEGIN
            TestNoSeries();
            NoSeriesManagement.InitSeries(GetNoSeriesCode, xRec."No. Series", Today, "No.", "No. Series");
        END;
    end;


}

