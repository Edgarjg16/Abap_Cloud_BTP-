@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_I_CUSTOMER_TRAVEL_053
    provider contract transactional_interface
    as projection on Z_R_CUSTOMER_TRAVEL_053
{
    key CustomerUuid,
    key CustomerId,
    Descripcion,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangeBy,
    LocalLastChangetAt,
    @Semantics.systemDateTime.lastChangedAt: true
    LastChangetAt,
    /* Associations */
    _Customer
}
