@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumo CDS'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_tf_airport_053
  with parameters pCity : /dmo/city

  as select from ztf_airports_053  (
                 pCity : $parameters.pCity ) as airport 
    inner join /dmo/customer as customer
            on customer.city = airport.city
{
  key airport.airport_id,
      airport.name,
      airport.city,
      airport.country,
      customer.customer_id,
      customer.first_name as FirstName,
      customer.last_name  as LastName
}
