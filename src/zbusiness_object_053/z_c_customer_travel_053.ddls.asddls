@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption Z_C_CUSTOMER_TRAVEL_053'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@Metadata.allowExtensions: true

define root view entity Z_C_CUSTOMER_TRAVEL_053 
    provider contract transactional_query
    as projection on Z_R_CUSTOMER_TRAVEL_053
    
{
    key CustomerUuid,

    @ObjectModel.text.association: '_Customer'
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    @Search.ranking: #HIGH
    key CustomerId,

    @Search.defaultSearchElement: true
    Descripcion,

    @Search.defaultSearchElement: true
    _Customer.LastName,

    @Semantics.systemDateTime.lastChangedAt: true
    LastChangetAt,

    /* Associations */
    
    _Customer
}
