@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consulta'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_flight_discount_053
  as select from /dmo/flight as Flight
{
  key carrier_id     as CarrierId,
  key connection_id  as ConnectionId,
  key flight_date    as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price          as Price,
      currency_code  as CurrencyCode
//      ZSF_CALC_DISCOUNT_053( 
//                            pClienteCucky : CurrencyCode,
//                            pDiscount : Flight.price ) as FlightDiscount
}
