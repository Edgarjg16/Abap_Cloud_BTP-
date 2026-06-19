@EndUserText.label: 'Entidad personalizada - Custom Entity'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_CUSTOM_DETAIL_053'
define custom entity ZCDS_CUSTOM_DETAIL_053
{
  key customer_id   : /dmo/customer_id;
      phone_number : /dmo/phone_number;
      email_address : /dmo/email_address;   
}
