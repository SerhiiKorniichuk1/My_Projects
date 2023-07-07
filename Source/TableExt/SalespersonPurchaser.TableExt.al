tableextension 50119 SalespersonPurchaserExt extends "Salesperson/Purchaser"
{
    fields
    {
        field(50110; "Incentive Amount"; Decimal)
        {
            Caption = 'Incentive Amount';
            FieldClass = FlowField;
            CalcFormula = sum(IncentiveLedgerEntry.Amount where("Sales Person Code" = field(Code)));

        }
        field(50111; "Salary Amount"; Decimal)
        {
            Caption = 'Salary Amount';
            DataClassification = ToBeClassified;
        }
        field(50112; MyField; Date)
        {

            Caption = 'Data Filter';
            DataClassification = ToBeClassified;
            //FieldClass = FlowFilter;

        }
    }

}