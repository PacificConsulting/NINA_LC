pageextension 50500 "Purchase Payable_LC" extends "Purchases & Payables Setup" //OriginalId
{
    layout
    {
        addafter("Posted Return Shpt. Nos.")
        {
            field("LC No. Series"; Rec."LC No. Series")
            {
                ApplicationArea = All;
            }
        }

    }

    actions
    {
    }
}