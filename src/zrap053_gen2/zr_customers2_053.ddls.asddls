@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZCUSTOMERS2_053'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_CUSTOMERS2_053
  as select from zcustomers2_053
{
  key customer_uuid         as CustomerUUID,
  key customer_id           as CustomerID,
      descripcion           as Descripcion,
      flight_date           as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      @Consumption.valueHelpDefinition: [ {
        entity.name: 'I_CurrencyStdVH',
        entity.element: 'Currency',
        useForValidation: true
      } ]
      currency_code         as CurrencyCode,
      overall_status        as OverallStatus,
      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_change_by  as LocalLastChangeBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changet_at as LocalLastChangetAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changet_at       as LastChangetAt
}
