pageextension 50501 "Purchase Order_LC" extends "Purchase Order"
{
    layout
    {
        // Add changes to page layout here

    }

    actions
    {
        // Add changes to page actions here
        modify(Release)
        {
            trigger OnBeforeAction()
            begin
                GetGSTAmountTotal(Rec, TotalGSTAmount1);
                GetTDSAmountTotal(Rec, TDSAmount);
                GetPostedSalesInvStatisticsAmount(Rec, TotalAmt);
                Rec."Amount to Vendor" := TotalAmt + TotalGSTAmount1 - TDSAmount;
                rec.Modify();
            end;
        }
    }

    //PCPL-25/150223
    procedure GetGSTAmountTotal(PurchaseHeader: Record 38; var GSTAmount: Decimal)
    var
        PurchLine: Record 39;
    begin
        Clear(GSTAmount);
        PurchLine.SetRange("Document no.", PurchaseHeader."No.");
        if PurchLine.FindSet() then
            repeat
                GSTAmount += GetGSTAmount11(PurchLine.RecordId());
            until PurchLine.Next() = 0;
    end;

    procedure GetTDSAmountTotal(PurchaseHeader: Record 38; var TDSAmount: Decimal)
    var
        PurchLine: Record 39;
        //TCSManagement: Codeunit "TCS Management";
        i: Integer;
        RecordIDList: List of [RecordID];
    begin
        Clear(TDSAmount);
        PurchLine.SetRange("Document Type", PurchaseHeader."Document Type");
        PurchLine.SetRange("Document no.", PurchaseHeader."No.");
        if PurchLine.FindSet() then
            repeat
                RecordIDList.Add(PurchLine.RecordId());
            until PurchLine.Next() = 0;

        for i := 1 to RecordIDList.Count() do begin
            TDSAmount += GetTDSAmount(RecordIDList.Get(i));
        end;
        //TDSAmount := TCSManagement.RoundTCSAmount(TDSAmount);
    end;

    procedure GetPostedSalesInvStatisticsAmount(PurchaseHeader: Record 38; var TotalInclTaxAmount: Decimal)
    var
        PurchLine: Record 39;
        RecordIDList: List of [RecordID];
        GSTAmount: Decimal;
        TDSAmount: Decimal;
    begin
        Clear(TotalInclTaxAmount);
        PurchLine.SetRange("Document No.", PurchaseHeader."No.");
        if PurchLine.FindSet() then
            repeat
                RecordIDList.Add(PurchLine.RecordId());
                TotalInclTaxAmount += PurchLine.Amount;
            until PurchLine.Next() = 0;
        TotalInclTaxAmount := TotalInclTaxAmount + GSTAmount + TDSAmount;
    end;

    local procedure GetGSTAmount11(RecID: RecordID): Decimal
    var
        TaxTransactionValue: Record "Tax Transaction Value";
        GSTSetup: Record "GST Setup";
    begin
        if not GSTSetup.Get() then exit;
        TaxTransactionValue.SetRange("Tax Record ID", RecID);
        TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
        if GSTSetup."Cess Tax Type" <> '' then TaxTransactionValue.SetRange("Tax Type", GSTSetup."GST Tax Type", GSTSetup."Cess Tax Type") else TaxTransactionValue.SetRange("Tax Type", GSTSetup."GST Tax Type");
        TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
        if not TaxTransactionValue.IsEmpty() then begin
            TaxTransactionValue.CalcSums(Amount);
            TaxTransactionValue.CalcSums(Percent);
        end;
        exit(TaxTransactionValue.Amount);
    end;

    local procedure GetTDSAmount(RecID: RecordID): Decimal
    var
        TaxTransactionValue: Record "Tax Transaction Value";
        TDSSetup: Record "TDS Setup";
    begin
        if not TDSSetup.Get() then exit;
        TaxTransactionValue.SetRange("Tax Record ID", RecID);
        TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
        TaxTransactionValue.SetRange("Tax Type", TDSSetup."Tax Type");
        TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
        if not TaxTransactionValue.IsEmpty() then TaxTransactionValue.CalcSums(Amount);
        exit(TaxTransactionValue.Amount);
    end;

    var
        myInt: Integer;
        TotalGSTAmount1: Decimal;
        TDSAmount: Decimal;
        TotalAmt: Decimal;
}