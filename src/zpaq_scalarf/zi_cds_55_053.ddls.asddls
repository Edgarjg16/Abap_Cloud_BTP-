@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SF - Use of Conditional Reference Type'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_cds_55_053
  as select from ztypes
{
  key id                                     as Id,
      ZSF_03_AMOUNT_QTY_DET( p1 => price_1,
                             p2 => price_2 ) as TotalPrice,
      cuky                                   as Cuky
}
