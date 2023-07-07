tableextension 50115 SalesLineExt extends "Sales Line"
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