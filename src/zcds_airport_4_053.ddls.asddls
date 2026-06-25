@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Vista zcds_airport_4_053'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_airport_4_053
  as select from /dmo/airport
{
  key airport_id as AirportId,
      name       as Name,
      city       as City,
      country    as Country,
      cast( '01' as zde_flight_type_053 ) as FlightType
}
