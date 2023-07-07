pageextension 50111 PostedPurchaseReceiptsExt extends "Posted Purchase Receipts"
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