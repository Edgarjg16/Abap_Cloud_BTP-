@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Joins'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_JOIN_053 as select from /DMO/R_Booking_D as Booking
inner join /DMO/I_Flight as Flight
        on Booking.AirlineID = Flight.AirlineID
       and Booking.ConnectionID = Flight.ConnectionID
       and Booking.FlightDate = Flight.FlightDate
{
    key Booking.AirlineID as AirlineID,
    key Booking.ConnectionID as ConnectionID,
    key Booking.FlightDate as FlightDate,
        Booking.CurrencyCode as CurrencyCode
}
