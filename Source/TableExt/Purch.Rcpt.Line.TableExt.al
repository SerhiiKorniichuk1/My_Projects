tableextension 50117 PurchRcptLineExt extends "Purch. Rcpt. Line"
{
    fields
    {
        field(50110; Quality; Enum "Used Or New")
        {
            Caption = 'Quality';
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}