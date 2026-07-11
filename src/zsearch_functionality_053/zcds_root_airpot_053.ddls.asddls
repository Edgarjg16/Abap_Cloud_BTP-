@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Implementar CDS Ayuda de búsqueda.'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zcds_root_airpot_053
  as select from /dmo/airport as Airport

  association [1..1] to ZCDS_CITY_ASSOC_053 as _City on _City.City = $projection.City

{
  key airport_id as AirportId,
      name       as Name,
      city       as City,
      country    as Country,
      
      _City
}
