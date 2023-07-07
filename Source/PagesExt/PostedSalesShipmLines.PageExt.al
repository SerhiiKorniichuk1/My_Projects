pageextension 50119 PostedSalesShipmLinesExt extends "Posted Sales Shipment Lines"
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