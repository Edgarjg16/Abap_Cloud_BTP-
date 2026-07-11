@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Scalar Function - Use of Reference Type'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_cds_54_053
  as select from /dmo/booking as Booking
     inner join /dmo/customer as Customer on Customer.customer_id = Booking.customer_id
{
  key Booking.travel_id     as TravelId,
  key Booking.booking_id    as BookingId,
      Booking.booking_date  as BookingDate,
      Booking.customer_id   as CustomerId,
      Customer.country_code as countryCode,
      Booking.carrier_id    as CarrierId,
      Booking.connection_id as ConnectionId,
      Booking.flight_date   as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      zsf_book_price_c_02_053( pCountryCode => Customer.country_code,
                               pBookingPrice => Booking.flight_price ) as FlightPrice,
      //    flight_price as FlightPrice,
      Booking.currency_code as CurrencyCode
}
