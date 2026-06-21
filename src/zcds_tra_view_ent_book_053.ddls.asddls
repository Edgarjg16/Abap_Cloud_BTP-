@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Transient View Entity'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [#ANALYTICAL_QUERY]
define transient view entity ZCDS_TRA_VIEW_ENT_BOOK_053
  provider contract analytical_query
  as projection on ZCDS_AN_DATA_FLIGHT_053 as _flight
{
  @AnalyticsDetails.query.axis: #FREE
  CarrierId,
  @AnalyticsDetails.query.axis: #ROWS
  ConnectionId,
  @AnalyticsDetails.query.axis: #COLUMNS
  FlightDate,
  BookingId,
  BookingDate,
  CustomerId,

@ObjectModel.text.element: [ 'CurrencyCode' ]
  FlightPrice,
  CurrencyCode,
  /* Associations */
  _flight
}
