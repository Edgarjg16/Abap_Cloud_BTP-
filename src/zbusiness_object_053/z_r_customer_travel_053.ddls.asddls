@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root Z_R_CUSTOMER_TRAVEL_05'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_R_CUSTOMER_TRAVEL_053
  as select from zcustomers_053

  association [0..1] to /DMO/I_Customer as _Customer on _Customer.CustomerID = $projection.CustomerId
{
  key customer_uuid         as CustomerUuid,
  key customer_id           as CustomerId,
      descripcion           as Descripcion,

      flight_date           as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      overall_status        as OverallStatus,

      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_change_by  as LocalLastChangeBy,

      //Local ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changet_at as LocalLastChangetAt,

      // total ETag
      @Semantics.systemDateTime.lastChangedAt: true
      last_changet_at       as LastChangetAt,

      // Make association public
      _Customer
}
