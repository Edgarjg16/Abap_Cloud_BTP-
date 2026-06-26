@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Invoices'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_cds_42_053
  as select from zinvoices_053
{
  key invoice_id   as InvoiceId,
      create_by    as CreateBy,
      customer     as Customer,
      @Semantics.amount.currencyCode: 'CurrencyKey'
      amount       as Amount,
      currency_key as CurrencyKey
}
