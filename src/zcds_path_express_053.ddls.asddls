@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Asociaciones Filtradas - Path Expression - cardinalidad'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_PATH_EXPRESS_053 
    as select from /dmo/booking as booking
    association [0..*] to /dmo/flight as _Flight
                       on booking.carrier_id  = _Flight.carrier_id
                      and booking.booking_id  = _Flight.connection_id
                      and booking.flight_date = _Flight.flight_date
{
    key booking.booking_id as BookingId,
    key booking.travel_id  as TravelId,
    _Flight[1: connection_id = '0001'].seats_occupied as seatsoccupied
}
