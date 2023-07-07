page 50100 IncentiveSetup
{
    Caption = 'Incentive Setup';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = IncentiveSetup;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field(SalesPersonCode; Rec.SalesPersonCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a manager code';

                }
                field(ProductGroupCode; Rec.ProductGroupCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a product group code(item category code)';

                }
                field(IncentivePercent; Rec.IncentivePercent)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies an incentive percent';

                }
            }
        }
    }
}