@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Agregación de Datos'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZDATA_AGGREGATION_053 as select from /dmo/booking
{
    key travel_id as TravelId,
    key booking_id as BookingId,
    @Semantics.amount.currencyCode: 'currencycode'
    sum( flight_price ) as FlightPrice,
    currency_code as CurrencyCode
} group by travel_id, booking_id, currency_code
