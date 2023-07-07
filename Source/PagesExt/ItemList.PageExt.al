pageextension 50113 ItemListExt extends "Item List"
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