pageextension 50116 SalesLinesExt extends "Sales Order Subform"
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