@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Help'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
define view entity zcds_city_vh_053 
    as select from ZCDS_CITY_ASSOC_053
{
    @Search.defaultSearchElement: true
    @Search.ranking: #HIGH
    @Search.fuzzinessThreshold: 0.8

    @ObjectModel.text.element: [ 'CityText' ]
    key City,

    /* Associations */
    @Search.defaultSearchElement: true
    @Search.ranking: #LOW
    @Search.fuzzinessThreshold: 0.8
    _text.City as CityText
}
