pageextension 50118 PostedPurchRecLinesExt extends "Posted Purchase Receipt Lines"
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