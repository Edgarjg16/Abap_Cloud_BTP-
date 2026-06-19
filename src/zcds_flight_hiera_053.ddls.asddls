@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Jerarquia Base'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZCDS_FLIGHT_HIERA_053
  as select from /dmo/travel as travel

  association [1..1] to ZCDS_FLIGHT_HIERA_053 as _Agency
    on _Agency.AgencyId = travel.customer_id   // Relación padre-hijo

{
  key agency_id   as AgencyId,
      customer_id as CustomerId,

      _Agency
}
