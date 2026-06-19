@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Entidad raíz – Define Root Entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZCDS_CUSTOMER_ROOT_053
  as select from /dmo/customer
      composition[1..1] of ZCDS_CUST_BOOK_053 as _CustBook
{
  key customer_id           as CustomerId,
      first_name            as FirstName,
      last_name             as LastName,
      city                  as City,
      
      _CustBook
}
