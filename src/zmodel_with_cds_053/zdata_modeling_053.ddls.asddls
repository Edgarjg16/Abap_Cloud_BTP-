@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Definición de Vistas CDS Básicas'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZDATA_MODELING_053 as select from /dmo/customer
{
    key customer_id      as CustomerId,
    cast( customer_id as abap.int8 ) as CustomerIdUser,
    first_name           as FirstName,
    last_name            as LastName,
    $session.client      as Cliente,
    $session.system_date as SistemDate,
    
    case 
     when country_code = 'US' then 'United States'
     when country_code ='DE' then 'Germany'
     else
        'Other Country'
    end as country
}
