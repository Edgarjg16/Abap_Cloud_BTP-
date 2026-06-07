CLASS zcl_test_ketan1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_ketan1 IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.
" 1. Define the ABAP structure matching the JSONPlaceholder API.
    TYPES: BEGIN OF ty_post_data,
             user_id TYPE i,
             id      TYPE i,
             title   TYPE string,
             body    TYPE string,
           END OF ty_post_data.

    DATA ls_post TYPE ty_post_data.

    TRY.
        " 2. A universally unblocked, free API endpoint
        DATA lv_url TYPE string.
        lv_url = 'https://jsonplaceholder.typicode.com/posts/1'.

        " 3. Instantiate HTTP Client via URL
        DATA(lo_destination) = cl_http_destination_provider=>create_by_url( lv_url ).
        DATA(lo_http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

        DATA(lo_request) = lo_http_client->get_http_request( ).

        " 4. Execute GET Request
        DATA(lo_response) = lo_http_client->execute( i_method = if_web_http_client=>get ).
        DATA(lv_json_payload) = lo_response->get_text( ).
        DATA(lv_status_code)  = lo_response->get_status( )-code.

        " 5. Parse the live JSON into our internal structure
        xco_cp_json=>data->from_string( lv_json_payload )->apply(
          VALUE #( ( xco_cp_json=>transformation->camel_case_to_underscore ) )
        )->write_to( REF #( ls_post ) ).

        " 6. Output results to the ADT Console
        out->write( |--- Live API Call Successful ---| ).
        out->write( |HTTP Status Code: { lv_status_code }| ).
        out->write( |Post ID: { ls_post-id } (Authored by User { ls_post-user_id })| ).
        out->write( |Title: { ls_post-title }| ).
        out->write( |Body: { ls_post-body }| ).
        out->write( |--------------------------------| ).
        out->write( |Raw JSON Payload:| ).
        out->write( lv_json_payload ).

      CATCH cx_root INTO DATA(lx_root).
        out->write( |Execution Error: { lx_root->get_text( ) }| ).
    ENDTRY.
ENDMETHOD.
ENDCLASS.
