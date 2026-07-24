@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZTRAVEL_053A'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_TRAVEL_053A
  provider contract transactional_query
  as projection on ZR_TRAVEL_053A
  association [1..1] to ZR_TRAVEL_053A as _BaseEntity on $projection.TravelUUID = _BaseEntity.TravelUUID
{
  key TravelUUID,
      TravelID,
      AgencyID,
      CustomerID,
      BeginDate,
      EndDate,
      @Semantics: {
        amount.currencyCode: 'CurrencyCode'
      }
      BookingFee,
      @Semantics: {
        amount.currencyCode: 'CurrencyCode'
      }
      TotalPrice,
      @Consumption: {
        valueHelpDefinition: [ {
          entity.element: 'Currency',
          entity.name: 'I_CurrencyStdVH',
          useForValidation: true
        } ]
      }
      CurrencyCode,
      Description,
      OverallStatus,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangetAt,

      @Semantics.systemDateTime.lastChangedAt: true
      _BaseEntity
}
