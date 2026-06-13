@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Parámetros CDS'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZPARAM_CDS_053 
with parameters pfromflight_date : abap.dats,
                ptoflight_date : abap.dats
as select from /dmo/booking
{
    key travel_id as TravelId,
    key booking_id as BookingId,
    customer_id as CustomerId,
    flight_date as FlightDate
} where flight_date between $parameters.pfromflight_date and $parameters.ptoflight_date
