CLASS zcl_test_ketan2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACEs if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_ketan2 IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.
TRY.
        " We set the base URL at the destination level
        DATA(lo_destination) = cl_http_destination_provider=>create_by_url( 'https://jsonplaceholder.typicode.com' ).

        out->write( |=========================================| ).
        out->write( | SCENARIO 1: GET WITH QUERY PARAMETERS   | ).
        out->write( |=========================================| ).

        DATA(lo_client_get) = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        DATA(lo_request_get) = lo_client_get->get_http_request( ).

        " Set the specific path and append our filter (?userId=5)
        lo_request_get->set_uri_path( i_uri_path = '/posts' ).
        lo_request_get->set_form_field( i_name = 'userId' i_value = '5' ).

        DATA(lo_response_get) = lo_client_get->execute( i_method = if_web_http_client=>get ).

        out->write( |GET Status: { lo_response_get->get_status( )-code }| ).

        " We'll just grab a substring of the payload so we don't flood your console
        DATA(lv_get_payload) = lo_response_get->get_text( ).
        out->write( |Filtered Data (First 100 chars):| ).
        out->write( |{ substring( val = lv_get_payload len = 100 ) }...| ).
        out->write( cl_abap_char_utilities=>newline ).


        out->write( |=========================================| ).
        out->write( | SCENARIO 2: POST REQUEST (SEND DATA)    | ).
        out->write( |=========================================| ).

        " 1. Define and populate our internal ABAP structure
        TYPES: BEGIN OF ty_new_post,
                 title   TYPE string,
                 body    TYPE string,
                 user_id TYPE i,
               END OF ty_new_post.

        DATA(ls_new_post) = VALUE ty_new_post(
          title   = 'ABAP Cloud Rocks'
          body    = 'Testing POST from my BTP Trial Account'
          user_id = 99
        ).

        " 2. Serialize ABAP structure to JSON (Notice the underscore_to_camel_case)
        DATA(lv_post_json) = xco_cp_json=>data->from_abap( ls_new_post )->apply(
          VALUE #( ( xco_cp_json=>transformation->underscore_to_camel_case ) )
        )->to_string( ).

        " We create a fresh client/request for the POST call
        DATA(lo_client_post) = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        DATA(lo_request_post) = lo_client_post->get_http_request( ).

        lo_request_post->set_uri_path( i_uri_path = '/posts' ).

        " 3. Crucial step: Set the Content-Type header
        lo_request_post->set_header_field( i_name = 'Content-Type' i_value = 'application/json; charset=UTF-8' ).

        " 4. Attach the JSON payload
        lo_request_post->set_text( lv_post_json ).

        " 5. Execute as POST
        DATA(lo_response_post) = lo_client_post->execute( i_method = if_web_http_client=>post ).

        " An HTTP 201 status code universally means "Created Successfully"
        out->write( |POST Status: { lo_response_post->get_status( )-code }| ).
        out->write( |API Response (Echoing our created record with a new ID):| ).
        out->write( lo_response_post->get_text( ) ).

      CATCH cx_root INTO DATA(lx_root).
        out->write( |Execution Error: { lx_root->get_text( ) }| ).
    ENDTRY.
ENDMETHOD.
ENDCLASS.
