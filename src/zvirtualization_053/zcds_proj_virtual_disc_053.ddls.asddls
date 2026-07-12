@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Proyección'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zcds_proj_virtual_disc_053
  provider contract transactional_query
  as projection on zcds_virtual_discount_053
{
  key     CarrierId,
  key     ConnectionId,
  key     FlightDate,
          @Semantics.amount.currencyCode: 'CurrencyCode'
          Price,
          CurrencyCode,
          PlaneTypeId,
          SeatsMax,
          SeatsOccupied,
          @EndUserText.label: 'Price with Discount'
          @Semantics.amount.currencyCode: 'CurrencyCode'
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VIRTUAL_DISCOUNT_053'
  virtual RealPrice : abap.dec(16,2)

}
