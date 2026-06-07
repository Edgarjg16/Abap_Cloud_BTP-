CLASS zcl_ai_api_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ai_api_test IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA:
      lo_dest     TYPE REF TO if_http_destination,
      lo_client   TYPE REF TO if_web_http_client,
      lo_request  TYPE REF TO if_web_http_request,
      lo_response TYPE REF TO if_web_http_response,
      lv_response TYPE string.

    TRY.

        "Create destination using direct URL
        lo_dest = cl_http_destination_provider=>create_by_url(
          i_url = 'https://api.exchangerate-api.com'
        ).

        "Create HTTP client
        lo_client = cl_web_http_client_manager=>create_by_http_destination( lo_dest ).

        lo_request = lo_client->get_http_request( ).
        lo_request->set_uri_path( '/v4/latest/USD' ).

        "Execute GET
        lo_response = lo_client->execute( if_web_http_client=>get ).

        lv_response = lo_response->get_text( ).

        out->write( 'API Response:' ).
        out->write( lv_response ).



DATA: lv_base TYPE string,
      lv_inr  TYPE string.

"Extract BASE
FIND REGEX '"base":"([^"]*)"' IN lv_response
  SUBMATCHES lv_base.

"Extract INR
FIND REGEX '"INR":([0-9.]*)' IN lv_response
  SUBMATCHES lv_inr.

out->write( 'Base Currency:' ).
out->write( lv_base ).

out->write( 'INR Rate:' ).
out->write( lv_inr ).


      CATCH cx_root INTO DATA(lx_error).
        out->write( lx_error->get_text( ) ).
    ENDTRY.
  ENDMETHOD.


ENDCLASS.
