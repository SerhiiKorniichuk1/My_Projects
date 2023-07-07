codeunit 50108 SubIncLedger
{
    EventSubscriberInstance = StaticAutomatic;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnPostSalesLineOnAfterRoundAmount, '', true, true)]
    local procedure OnPostSalesLineOnAfterRoundAmount(SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header")
    var
        IncentiveLedgerEntry: Record IncentiveLedgerEntry;
    begin
        if SalesLine.Type <> SalesLine.Type::Item then
            exit;
        IncentiveLedgerEntry.Init();

        IncentiveLedgerEntry.Validate("Document Type", SalesLine."Document Type");
        IncentiveLedgerEntry.Validate("Posting Date", SalesHeader."Posting Date");
        IncentiveLedgerEntry.Validate("Sales Person Code", SalesHeader."Salesperson Code");
        IncentiveLedgerEntry.Validate("Document No.", SalesLine."Document No.");
        IncentiveLedgerEntry.Validate(Amount, SalesLine."Amount Including VAT" * FindPercent(SalesLine."Item Category Code", SalesHeader."Salesperson Code") * 0.01);

        IncentiveLedgerEntry.Insert();
    end;


    local procedure FindPercent(ItemCategoryCode2: Code[20]; SalespersonCode2: Code[20]): Decimal
    var
        IncentiveSetup: Record IncentiveSetup;
        SalespersonPurchaser: Record "Salesperson/Purchaser";
    begin
        if IncentiveSetup.Get(SalespersonCode2, ItemCategoryCode2) then
            exit(IncentiveSetup.IncentivePercent);
        if IncentiveSetup.Get('', ItemCategoryCode2) then
            exit(IncentiveSetup.IncentivePercent);
        if SalespersonPurchaser.Get(SalespersonCode2) then
            exit(SalespersonPurchaser."Commission %");
    end;

}

