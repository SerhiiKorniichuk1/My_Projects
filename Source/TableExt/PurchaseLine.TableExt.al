tableextension 50116 PurchaseLineExt extends "Purchase Line"
{
    fields
    {
        field(50110; Quality; Enum "Used Or New")
        {
            Caption = 'Quality';
            DataClassification = ToBeClassified;
        }
    }
}