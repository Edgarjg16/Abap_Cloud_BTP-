@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cube'
@Metadata.ignorePropagatedAnnotations: true
@Analytics.dataCategory: #CUBE
define view entity ZI_CDS_31_053
  as select from zso_log_053 as SalesOrder

  association [0..1] to ZI_CDS_30_053 as _Currency on _Currency.Currency = $projection.CurrencySum
{
  key SalesOrder.so_key           as SoKey,
      SalesOrder.lifecycle_status as LifecycleStatus,
      company_code                as CompanyCode,

      @DefaultAggregation: #SUM
      @Semantics.amount.currencyCode: 'CurrencySum'
      SalesOrder.amount_sum       as AmountSum,

      @ObjectModel.foreignKey.association: '_Currency'
      currency_sum                as CurrencySum,

      create_at                   as CreateAt,
      buyer_id                    as BuyerId,
      ship_to_id                  as ShipToId,

      @Semantics.quantity.unitOfMeasure : 'UomSum'
      quantity_sum                as QuantitySum,
      uom_sum                     as UomSum,

      @DefaultAggregation: #NONE
      create_by                   as CreateBy,

      @DefaultAggregation: #NONE
      create_on                   as CreateOn,

      _Currency
}
