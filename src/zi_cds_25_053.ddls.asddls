@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Association to Parent'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CDS_25_053 
    as select from /dmo/booking
    association to parent ZI_CDS_24_053 as _Travel on _Travel.TravelId = $projection.TravelId 
    association [1..1] to /DMO/I_Customer as _Customer on _Customer.CustomerID = $projection.CustomerId
{
    key travel_id as TravelId,
    key booking_id as BookingId,
    booking_date as BookingDate,
    customer_id as CustomerId,
    carrier_id as CarrierId,
    connection_id as ConnectionId,
    flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    flight_price as FlightPrice,
    currency_code as CurrencyCode,
    _Travel
}
