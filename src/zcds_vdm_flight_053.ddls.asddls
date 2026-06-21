@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VDM – Virtual Data Model'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@VDM.viewType: #BASIC
@Analytics.dataCategory: #DIMENSION

define view entity ZCDS_VDM_FLIGHT_053
  as select from /dmo/flight as _Flight

  association [0..*] to /dmo/carrier as _Carrier on _Carrier.carrier_id = $projection.CarrierId
{
  key carrier_id     as CarrierId,
  key connection_id  as ConnectionId,
  key flight_date    as FlightDate,

      @Search.defaultSearchElement: true
      @Search.ranking: #MEDIUM
      @Search.fuzzinessThreshold: 0.9
      carrier_id     as CarrierSearch,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      price          as Price,
      currency_code  as CurrencyCode,
      plane_type_id  as PlaneTypeId,
      seats_max      as SeatsMax,
      seats_occupied as SeatsOccupied,

      _Carrier
}
