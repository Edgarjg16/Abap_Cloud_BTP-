@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel - Toot Entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_R_TRAVEL_053
  as select from ztravel_053
  
  association [0..1] to /DMO/I_Agency as _Agency on _Agency.AgencyID =  $projection.AgencyId
  association [0..1] to /DMO/I_Customer as _Customer on _Customer.CustomerID = $projection.CustomerId
  association [1..1] to /DMO/I_Overall_Status_VH as _OverallStatus on _OverallStatus.OverallStatus = $projection.OverallStatus
  association [0..1] to I_Currency as _Currency on _Currency.Currency = $projection.CurrencyCode
  
{
  key travel_uuid           as TravelUuid,
      travel_id             as TravelId,
      agency_id             as AgencyId,
      customer_id           as CustomerId,
      begin_date            as BeginDate,
      end_date              as EndDate,
      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee           as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price           as TotalPrice,
      currency_code         as CurrencyCode,
      
      description           as Description,
      overall_status        as OverallStatus,

      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreateAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_change_by  as LocalLastChangeBy,
      
      //Local ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true   
      local_last_changet_at as LocalLastChangetAt,
      
      // total ETag
      @Semantics.systemDateTime.lastChangedAt: true
      last_changet_at       as LastChangetAt,

      // Make association public
      _Agency,
      _Customer,
      _OverallStatus,
      _Currency
}
