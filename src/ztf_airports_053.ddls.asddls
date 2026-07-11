@EndUserText.label: 'ztf_airports_053'
@ClientHandling.type: #CLIENT_DEPENDENT
@ClientHandling.algorithm: #SESSION_VARIABLE
define table function ztf_airports_053
  with parameters
//    @Environment.systemField: #CLIENT
//    pclient : abap.clnt,
    pCity : /dmo/city
    
returns
{
  key client     : abap.clnt;
  key airport_id : /dmo/airport_id;
      name       : /dmo/airport_name;
      city       : /dmo/city;
      country    : land1;

}
implemented by method
  zcl_amdp_airport_053=>get_airports;