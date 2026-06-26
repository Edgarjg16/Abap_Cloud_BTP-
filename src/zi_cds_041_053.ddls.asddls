@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl:
    {
        authorizationCheck: #NOT_ALLOWED,
        auditing.type: #CUSTOM,
        auditing.specification: '053'
    }
@EndUserText.label: 'Access Control - Auditing'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_cds_041_053
  as select from zusers_053
{
  key user_id    as UserId,
  key invoice_id as InvoiceId,
      first_name as FirstName,
      last_name  as LastName
}
