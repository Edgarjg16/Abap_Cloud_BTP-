@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Consuming TF'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CDS_046_053
  with parameters
    pCountryCode : abap.char(3)
  as select from /dmo/travel as Travel
  association [0..*] to ZI_TF_01_053 as _BookingsByCustomer on _BookingsByCustomer.travelId = $projection.TravelId
{
  key Travel.travel_id     as TravelId,
      Travel.agency_id     as AgencyId,
      Travel.customer_id   as CustomerId,
      Travel.begin_date    as BeginDate,
      Travel.end_date      as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Travel.booking_fee   as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Travel.total_price   as TotalPrice,
      Travel.currency_code as CurrencyCode,
      Travel.description   as Description,
      Travel.status        as Status,
      Travel.createdby     as Createdby,
      Travel.createdat     as Createdat,
      Travel.lastchangedby as Lastchangedby,
      Travel.lastchangedat as Lastchangedat,
      _BookingsByCustomer(pCountryCode: $parameters.pCountryCode).last_name as LastName
}
