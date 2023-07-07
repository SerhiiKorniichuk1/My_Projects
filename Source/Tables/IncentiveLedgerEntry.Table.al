table 50101 IncentiveLedgerEntry
{
    Caption = 'Incentive Ledger Entry';
    DrillDownPageId = IncentiveLedgerEntries;
    LookupPageId = IncentiveLedgerEntries;


    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;

        }
        field(2; "Document Type"; Enum "Sales Document Type")
        {
            Caption = 'Document Type';
        }
        field(3; "Posting Date"; Date)
        {
            Caption = 'Posting Date';

        }
        field(4; "Sales Person Code"; Code[20])
        {
            Caption = 'Sales Person Code';

        }
        field(5; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(6; Amount; Decimal)
        {
            Caption = 'Amount';
        }

    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

}