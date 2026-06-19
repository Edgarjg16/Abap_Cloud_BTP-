@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Asociación - Parent Child'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_CUST_BOOK_053
  as select from /dmo/booking
  association to parent ZCDS_CUSTOMER_ROOT_053 as _Customer on _Customer.CustomerId = $projection.customer_id
{
  key customer_id,
  key travel_id,
  key booking_id,
  
  _Customer
}
