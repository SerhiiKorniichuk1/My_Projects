pageextension 50120 SalespersonPurchaserCardExt extends "Salesperson/Purchaser Card"
{
    layout
    {
        addlast(Invoicing)
        {
            field(IncentiveAmount; Rec."Incentive Amount")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies an incentive amount';

            }
            field(SalaryAmount; Rec."Salary Amount")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies a salary amount';
            }
        }
    }
}