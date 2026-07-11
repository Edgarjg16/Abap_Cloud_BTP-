@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aspecto Auditoría Usuario'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZAS_AUDITING_ASPECT_USER as select from zcds_auditing_aspect_053
{
 CreatedBy,
 CustomerName,
 @Semantics.amount.currencyCode: 'Currency'
 InvAmount,
 Currency
 }
