pageextension 50110 PurchaseOrderListExt extends "Purchase Order List"
{
    layout
    {
        addlast(Control1)
        {
            field("CRM No."; Rec."CRM No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Customer Relationship Management';
            }
        }
    }
}