page 50103 SalaryManagers
{
    Caption = 'Salary Managers';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Salesperson/Purchaser";
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a person code';
                }
                field(IncentiveAmount; Rec."Incentive Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies an incentive percent';

                }
                field(SalaryAmount; Rec."Salary Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a salary amount';

                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Export To Excel")
            {
                Caption = 'Export to Excel';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Export;

                trigger OnAction()
                var
                    ExportSalaryManages: Codeunit ExportSalaryManages;
                begin
                    ExportSalaryManages.AddToExcel(Rec);
                end;
            }
        }
    }





}
/*  
Виконував цю частину завдання не через постінг, 
бо інакше зрозумів завдання, пізно перепитав і не було часу перероблювати
*/
