@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Uso de tipos'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_customer_sales_053
  as select from /dmo/customer
{
  key customer_id as CustomerId,
      first_name  as FirstName,
      last_name   as LastName,
      
      cast( '03' as abap.char(2) ) as StatusSale,
      
      cast( first_name as zty_enum_st_order_053 ) as SalesName
}
