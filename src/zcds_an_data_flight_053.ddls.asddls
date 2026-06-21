@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CUBE - Categorías de datos analíticos'
@Metadata.ignorePropagatedAnnotations: true
@Analytics.dataCategory: #CUBE
define view entity ZCDS_AN_DATA_FLIGHT_053
  as select from /dmo/booking as _Booking

  association [0..*] to ZCDS_VDM_FLIGHT_053 as _flight on  _flight.CarrierId    = $projection.CarrierId
                                                       and _flight.ConnectionId = $projection.ConnectionId
                                                       and _flight.FlightDate   = $projection.FlightDate
{
  key _Booking.carrier_id    as CarrierId,
  key _Booking.connection_id as ConnectionId,
  key _Booking.flight_date   as FlightDate,
  key _Booking.booking_id    as BookingId,

      _Booking.booking_date  as BookingDate,
      _Booking.customer_id   as CustomerId,

      @DefaultAggregation: #SUM
      @Semantics.amount.currencyCode: 'CurrencyCode'
      _Booking.flight_price  as FlightPrice,

      _Booking.currency_code as CurrencyCode,

    _flight
}
