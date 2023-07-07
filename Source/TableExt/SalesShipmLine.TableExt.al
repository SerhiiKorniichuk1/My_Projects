tableextension 50118 SalesShipmLineExt extends "Sales Shipment Line"
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