pageextension 50117 PurchaseLinesExt extends "Purchase Order Subform"
{
    layout
    {
        addlast(Control1)
        {
            field(Quality; Rec.Quality)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies new or used equipment';
            }
        }
    }
}