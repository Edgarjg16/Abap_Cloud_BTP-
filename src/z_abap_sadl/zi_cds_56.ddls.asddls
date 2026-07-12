@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Virtual Element - definition on Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CDS_56
  as select from /dmo/booking
{
  key travel_id     as TravelId,
  key booking_id    as BookingId,
      booking_date  as BookingDate,
      customer_id   as CustomerId,
      carrier_id    as CarrierId,
      connection_id as ConnectionId,
      flight_date   as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price  as FlightPrice,
      @EndUserText.label: 'Price with Discount'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VIRTUAL_ELEM_053'
      cast( 0 as abap.curr( 16,2 ) ) as DiscountedPrice,
      currency_code as CurrencyCode
}
