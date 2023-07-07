pageextension 50112 PostedPurchaseInvoicesExt extends "Posted Purchase Invoices"
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