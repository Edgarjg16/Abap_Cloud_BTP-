@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumo ZC_DT_INCT_H_053'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_DT_INCT_H_053 as select from zi_dt_inct_h_053
//composition of target_data_source_name as _association_name
{
    key HisUuid,
    key IncUuid,
    HisId,
    PreviousStatus,
    NewStatus,
    Text,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _Incident
//    _association_name // Make association public
}
