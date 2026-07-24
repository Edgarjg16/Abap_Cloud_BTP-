@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZCUSTOMERS2_053'
}
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZC_CUSTOMERS2_053
  provider contract transactional_query
  as projection on ZR_CUSTOMERS2_053
  association [1..1] to ZR_CUSTOMERS2_053 as _BaseEntity on  $projection.CustomerUUID = _BaseEntity.CustomerUUID
                                                         and $projection.CustomerID   = _BaseEntity.CustomerID
{
  key CustomerUUID,
  key CustomerID,
      Descripcion,
      FlightDate,
      @Semantics: {
        amount.currencyCode: 'CurrencyCode'
      }
      Price,
      @Consumption: {
        valueHelpDefinition: [ {
          entity.element: 'Currency',
          entity.name: 'I_CurrencyStdVH',
          useForValidation: true
        } ]
      }
      CurrencyCode,
      OverallStatus,
      @Semantics: {
        user.createdBy: true
      }
//      LocalCreatedBy,
//      @Semantics: {
//        systemDateTime.createdAt: true
//      }
//      LocalCreatedAt,
//      @Semantics: {
//        user.localInstanceLastChangedBy: true
//      }
//      LocalLastChangeBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangetAt,

      @Semantics.systemDateTime.lastChangedAt: true
      _BaseEntity
}
