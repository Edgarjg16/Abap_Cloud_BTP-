@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection - Child Interface'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CDS_27_053
  as projection on ZI_CDS_25_053
{
  key TravelId,
  key BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      /* Associations */
      _Travel: redirected to parent zi_cds_26_053
}
