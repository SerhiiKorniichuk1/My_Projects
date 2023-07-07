codeunit 50119 ExportSalaryManages
{
    procedure AddToExcel(var SalespersonPurchaser: Record "Salesperson/Purchaser")
    var
        IncentiveLedgerEntry: Record IncentiveLedgerEntry;
        NotFirstSheet: Boolean;
        Total: Decimal;
    begin
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();

        if SalespersonPurchaser.FindSet() then begin
            repeat
                AddHeader();
                IncentiveLedgerEntry.SetRange("Sales Person Code", SalespersonPurchaser.Code);
                if IncentiveLedgerEntry.FindSet() then
                    repeat
                        AddLine(IncentiveLedgerEntry);
                        Total += IncentiveLedgerEntry.Amount;
                    until IncentiveLedgerEntry.Next() = 0;
                AddTotal(Total, SalespersonPurchaser."Salary Amount");
                Total := 0;
                WriteSheet(SalespersonPurchaser.Code, NotFirstSheet);
                NotFirstSheet := true;

            until SalespersonPurchaser.Next() = 0;
            OpenExcel();
        end;
    end;

    local procedure WriteSheet(Name: Text; First: Boolean)
    begin
        if First then
            TempExcelBuffer.SelectOrAddSheet(Name)
        else
            TempExcelBuffer.CreateNewBook(Name);

        TempExcelBuffer.WriteSheet(Name, CompanyName, UserId);
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.ClearNewRow();
    end;

    local procedure OpenExcel()
    begin
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename(StrSubstNo('SalaryManages', CurrentDateTime, UserId));
        TempExcelBuffer.OpenExcel();
    end;

    local procedure AddHeader()
    var
        IncentiveLedgerEntry: Record IncentiveLedgerEntry;
    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn(IncentiveLedgerEntry.FieldCaption("Document Type"), false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(IncentiveLedgerEntry.FieldCaption("Posting Date"), false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(IncentiveLedgerEntry.FieldCaption("Document No."), false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(IncentiveLedgerEntry.FieldCaption(Amount), false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
    end;

    local procedure AddLine(IncentiveLedgerEntry: Record IncentiveLedgerEntry)
    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn(IncentiveLedgerEntry."Document Type", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(IncentiveLedgerEntry."Posting Date", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.AddColumn(IncentiveLedgerEntry."Document No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(IncentiveLedgerEntry.Amount, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
    end;

    local procedure AddTotal(Total: Decimal; "Salary Amount": Decimal)
    var
        IncentiveLedgerEntry: Record IncentiveLedgerEntry;
    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Sub Total:', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Total, false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Number);

        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Salary Amount:', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Salary Amount", false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Number);

        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Total:', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Total + "Salary Amount", false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Number);
    end;

    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
}