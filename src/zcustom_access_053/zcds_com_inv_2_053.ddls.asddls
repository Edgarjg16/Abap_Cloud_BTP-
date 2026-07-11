@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Invoice User'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_com_inv_2_053
  as select from zdt_com_inv_053
{
  key invoice_id    as InvoiceId,
      customer_name as CustomerName,
      @Semantics.amount.currencyCode : 'currency'
      inv_amount    as InvAmount,
      currency      as Currency,
      department    as Department,
      @Semantics.user.createdBy: true
      created_by    as CreatedBy,
      @Semantics.user.createdBy: true
      create_date   as CreateDate
}
