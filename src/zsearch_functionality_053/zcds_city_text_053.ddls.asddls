@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZCDS_CITY_TEXT_053'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
                    serviceQuality: #A,
                    sizeCategory: #S,
                    dataClass: #MASTER
}
@ObjectModel.dataCategory: #TEXT
@Search.searchable: true

define view entity ZCDS_CITY_TEXT_053
  as select from zcity_texts_053
  
  association [1..1] to ZCDS_CITY_ASSOC_053 as _Customer on _Customer.City = $projection.City
  
{
  key airport_id as AirportId,
      @Search.defaultSearchElement: true
      city       as City,
      
      _Customer
}
