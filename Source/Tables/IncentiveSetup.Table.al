table 50100 IncentiveSetup
{
    Caption = 'Incentive Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; SalesPersonCode; Code[20])
        {
            Caption = 'Sales Person Code';
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser" where(Blocked = const(false));

        }
        field(2; ProductGroupCode; Code[20])     // Product Group Code was removed in version 15.0. We will use Item Category Code
        {
            Caption = 'Product Group Code';
            DataClassification = ToBeClassified;
            TableRelation = "Item Category";
            NotBlank = true;
        }
        field(3; IncentivePercent; Decimal)
        {
            Caption = 'Incentive Percent';
            DataClassification = ToBeClassified;
            MinValue = 0;
        }
    }

    keys
    {

        key(Key1; SalesPersonCode, ProductGroupCode)
        {
            Clustered = true;
        }
        key(Key2; ProductGroupCode, SalesPersonCode)
        {

        }


    }

}