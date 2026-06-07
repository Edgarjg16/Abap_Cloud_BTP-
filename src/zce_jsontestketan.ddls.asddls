@EndUserText.label: 'Custom Entity for External API Data'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_API_QUERY_PROVIDER' 
define root custom entity ZCE_JSONTESTKETAN
{
      @UI.facet      : [ { id: 'Post', purpose: #STANDARD, type: #IDENTIFICATION_REFERENCE, label: 'Post Details', position: 10 } ]
      
//      @UI.lineItem   : [{ position: 10, label: 'Post ID' }]
//      @UI.identification: [{ position: 10 }]
      @UI.lineItem   : [
        { position: 10, label: 'Post ID' },
        { type: #FOR_ACTION, dataAction: 'SimulatePost', label: 'Send POST to API' }
      ]
  key id             : abap.int4;

      @UI.lineItem   : [{ position: 20, label: 'Author ID' }]
      @UI.identification: [{ position: 20 }]
      @UI.selectionField: [{ position: 10 }]
      @EndUserText.label: 'Author ID'
      user_id        : abap.int4;

      @UI.lineItem   : [{ position: 30, label: 'Post Title' }]
      @UI.identification: [{ position: 30 }]
      title          : abap.char(255);

      @UI.lineItem   : [{ position: 40, label: 'Content Body' }]
      @UI.identification: [{ position: 40 }]
      body           : abap.char(1000);
}
