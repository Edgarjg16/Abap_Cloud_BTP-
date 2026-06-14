@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Asociaciones con Parámetros'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_PARAM_ASSOC_053 
    with parameters p_carrier_id : /dmo/carrier_id
    as select from /dmo/flight as flight
    association[0..1] to /dmo/carrier as _Carrier
                on _Carrier.carrier_id = $projection.CarrierId
{
    key flight.carrier_id as CarrierId,
    key flight.connection_id as ConnectionId,
    key flight.flight_date as FlightDate,
        _Carrier.name as name,
    
    _Carrier
} where flight.carrier_id = $parameters.p_carrier_id
