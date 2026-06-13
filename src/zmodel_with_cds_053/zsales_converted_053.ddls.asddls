@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Conversión de Moneda'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZSALES_CONVERTED_053 as select from /dmo/booking
{
    key travel_id as TravelId,
    key booking_id as BookingId,
    
    @Semantics.amount.currencyCode: 'currencycode'
    flight_price as FlightPrice,
    currency_code as CurrencyCode,

    @Semantics.amount.currencyCode: 'ConvertedCurrency'
    currency_conversion( amount => flight_price, 
                         source_currency => currency_code, 
                         target_currency => abap.cuky'USD', 
                         exchange_rate_date => $session.system_date,
                         error_handling     => 'SET_TO_NULL' ) as Flight_Price_USD,
    cast( 'USD' as abap.cuky ) as ConvertedCurrency  
}
