@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection - Child Query'
@Metadata.ignorePropagatedAnnotations: false
define view entity ZI_CDS_29_053 as projection on ZI_CDS_25_053
{
    key TravelId,
    key BookingId,
    BookingDate,
    CustomerId,
    CarrierId,
    ConnectionId,
    FlightDate,
    FlightPrice,
    CurrencyCode,
    /* Associations */
    _Travel : redirected to parent ZI_CDS_28_053
}
