@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Scalar Function - Use'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CDS_053_053
  as select from /dmo/carrier
{
  key carrier_id            as CarrierId,
      name                  as Name,
      currency_code         as CurrencyCode,
      zsf_vat_by_airline_01_053( pAirline => carrier_id ) as VAT
}
