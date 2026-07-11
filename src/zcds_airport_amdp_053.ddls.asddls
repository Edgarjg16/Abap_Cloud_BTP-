@EndUserText.label: 'Ampliar consumo'
@ClientHandling.type: #CLIENT_DEPENDENT
@ClientHandling.algorithm: #SESSION_VARIABLE

define table function ZCDS_AIRPORT_AMDP_053
returns
{
  key client     : abap.clnt;
  key airport_id : /dmo/airport_id;
      name       : /dmo/airport_name;
      city       : /dmo/city;
      country    : land1;
}
implemented by method
  zcl_amdp_airport_053=>get_airports_top10;