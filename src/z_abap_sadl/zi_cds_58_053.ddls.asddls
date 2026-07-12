@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Virtual Element - Projection Roo Entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_CDS_58_053
  provider contract transactional_query
  as projection on ZI_CDS_57_053
{
  key     TravelId,
  key     BookingId,
          BookingDate,
          CustomerId,
          CarrierId,
          ConnectionId,
          FlightDate,
          @Semantics.amount.currencyCode: 'CurrencyCode'
          FlightPrice,
          @EndUserText.label: 'Price with Discount'
          @Semantics.amount.currencyCode: 'CurrencyCode'
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VIRTUAL_ELEM_053'
  virtual DiscountedPrice : abap.curr( 16, 2 ),
          CurrencyCode
} 
