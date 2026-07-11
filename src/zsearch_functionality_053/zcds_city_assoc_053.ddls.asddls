@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Valores de la tabla /dmo/customer'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true

define view entity ZCDS_CITY_ASSOC_053
  as select from /dmo/customer as Customer

  association [1..1] to ZCDS_CITY_TEXT_053 as _text on _text.City = $projection.City

{
  key Customer.customer_id   as CustomerId,
      
      @Search.defaultSearchElement: true
      @Search.ranking: #HIGH
      @Search.fuzzinessThreshold: 0.8
      @ObjectModel.text.association: '_text'
      Customer.city as City,
      
      Customer.first_name as FirstName,
      Customer.last_name as LastName,

      _text
}
