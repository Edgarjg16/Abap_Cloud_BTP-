@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection Root'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZCDS_CUST_PROJ_053 
    provider contract transactional_query
    as projection on ZCDS_CUSTOMER_ROOT_053
{
    key CustomerId,
    FirstName,
    LastName,
    City,
    /* Associations */
    _CustBook : redirected to composition child ZCDS_CHILD_PROJ_053
}
