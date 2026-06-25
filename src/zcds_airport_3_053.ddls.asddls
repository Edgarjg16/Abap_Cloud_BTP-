@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'ZCDS_AIRPORT_3_053'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_AIRPORT_3_053 as select from /dmo/airport
{
    key airport_id as AirportId,
    name as Name,
    city as City,
    country as Country
}
