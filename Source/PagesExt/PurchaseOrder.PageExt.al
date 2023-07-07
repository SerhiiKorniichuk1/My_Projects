pageextension 50115 PurchaseOrderExt extends "Purchase Order"
{
    layout
    {
        addlast(General)
        {
            field("CRM No."; Rec."CRM No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Customer Relationship Management';
            }
        }
    }

}