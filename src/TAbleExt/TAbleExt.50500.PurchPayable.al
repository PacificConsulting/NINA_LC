tableextension 50500 "PUrchase And Payable LC" extends "Purchases & Payables Setup"
{
    fields
    {
        // Add changes to table fields here
        field(50500; "LC No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

    var
        myInt: Integer;
}