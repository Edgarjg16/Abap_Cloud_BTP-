@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumo ZC_INCT_053'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_INCT_053 as select from ZI_INCT_053
//composition of target_data_source_name as _association_name
{
    key IncUuid,
    IncidentId,
    Title,
    Description,
    Status,
    Priority,
    CreationDate,
    ChangedDate,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _History
//    _association_name // Make association public
}
