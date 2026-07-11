@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'vista de proyección'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true

define view entity zcds_proj_airpot_053 as select from zcds_root_airpot_053
{
    key AirportId,
    Name,
    City,
    Country,
    /* Associations */
    @Search.defaultSearchElement: true
    _City
}
