page 50501 "Letter of Credit Request Card"
{
    PageType = Card;
    SourceTable = 50500;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.UPDATE;
                    end;
                }
                field("PO No."; Rec."PO No.")
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                        LetterofCredit: Record 50500;
                    begin
                        IF Rec."PO No." <> '' THEN begin
                            LetterofCredit.Reset();
                            LetterofCredit.SetRange("PO No.", Rec."PO No.");
                            if LetterofCredit.FindFirst() then begin
                                Error('PO NO ' + Rec."PO No." + ' already exist on No ' + Rec."No.");
                            end;
                        end;
                    end;
                }
                field("PO Date"; Rec."PO Date")
                {
                    ApplicationArea = all;
                }
                field("Type of Request"; Rec."Type of Request")
                {
                    ApplicationArea = all;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
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
            }
            group(Approvals)
            {
                //Visible = false;
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
            action(Release)
            {
                ApplicationArea = all;
                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Open);
                    Rec.TestField("PO No.");
                    Rec.TestField("PO Value");
                    Rec.TestField("PO Value (LCY)");
                    Rec.TestField("Payment Terms");
                    rec.TestField("Type of Request");
                    Rec.Status := Rec.Status::Released;
                    Rec.Modify();
                    Message('This document has been release , show on Letter of Credit Drafts page');
                end;
            }
            //}
        }
    }

    trigger OnModifyRecord(): Boolean
    begin
        rec.TestField(Status, rec.Status::Open);
    end;
    // trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    // begin
    //     te
    // end;

    var
        PurchasesPayablesSetup: Record 312;
        NoSeriesManagement: Codeunit 396;

    // local procedure AssistEdit(): Boolean
    // var
    //     OldLetterofCredit: Record 50056;
    // begin
    //     PurchasesPayablesSetup.GET;
    //     TestNoSeries;
    //     IF NoSeriesManagement.SelectSeries(GetNoSeriesCode, OldLetterofCredit."No. Series", Rec."No. Series") THEN BEGIN
    //         PurchasesPayablesSetup.GET;
    //         TestNoSeries;
    //         NoSeriesManagement.SetSeries(Rec."No.");
    //         EXIT(TRUE);
    //     END;
    // end;

    // local procedure TestNoSeries(): Boolean
    // begin
    //     PurchasesPayablesSetup.TESTFIELD(PurchasesPayablesSetup."LC No. Series");
    // end;

    // local procedure GetNoSeriesCode(): Code[10]
    // begin
    //     EXIT(PurchasesPayablesSetup."LC No. Series");
    // end;
}

