pageextension 50114 ItemCardExt extends "Item Card"
{
    layout
    {
        addlast("Costs & Posting")
        {
            field(Quality; Rec.Quality)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies new or used equipment';

            }
        }
    }
}