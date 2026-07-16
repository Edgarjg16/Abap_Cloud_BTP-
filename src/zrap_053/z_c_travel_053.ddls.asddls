@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel - Comsuption'
@Metadata.ignorePropagatedAnnotations: true

@Search.searchable: true
@Metadata.allowExtensions: true

define root view entity Z_C_TRAVEL_053
  provider contract transactional_query
  as projection on Z_R_TRAVEL_053
{
  key TravelUuid,
      TravelId,
      
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @ObjectModel.text.element: [ 'AgencyName' ]
      AgencyId,
      _Agency.Name as AgencyName,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @ObjectModel.text.element: [ 'CustomerName' ]      
      CustomerId,
      _Customer.LastName as CustomerName,
      
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      
      @ObjectModel.text.element: [ 'OverallStatusText' ]
      OverallStatus,
      _OverallStatus._Text.Text as OverallStatusText : localized,
//      _OverallStatus._Text[1: Language = $session.system_language].Text as OverallStatusText,

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
