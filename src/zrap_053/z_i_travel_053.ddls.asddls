@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Interface'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_I_TRAVEL_053
    provider contract transactional_interface
     as projection on Z_R_TRAVEL_053
{
    key TravelUuid,
    TravelId,
    AgencyId,
    CustomerId,
    BeginDate,
    EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'    
    BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'    
    TotalPrice,
    CurrencyCode,
    Description,
    OverallStatus,
    
    @Semantics.systemDateTime.localInstanceLastChangedAt: true   
    LocalLastChangetAt,
    @Semantics.systemDateTime.lastChangedAt: true
    LastChangetAt,
    /* Associations */
    _Agency,
    _Currency,
    _Customer,
    _OverallStatus
}
