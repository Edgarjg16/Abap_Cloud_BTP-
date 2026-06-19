@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection Child'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_CHILD_PROJ_053 
    as projection on ZCDS_CUST_BOOK_053
{
    key customer_id,
    key travel_id,
    key booking_id,
    /* Associations */
    _Customer : redirected to parent ZCDS_CUST_PROJ_053
}
