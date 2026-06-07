CLASS lhc_ExternalPost DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ExternalPost RESULT result.

    METHODS read FOR READ
      IMPORTING keys FOR READ ExternalPost RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK ExternalPost.

    METHODS SimulatePost FOR MODIFY
      IMPORTING keys FOR ACTION ExternalPost~SimulatePost RESULT result.

ENDCLASS.

CLASS lhc_ExternalPost IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD SimulatePost.
  " This method fires when you select a row in Fiori and click the Action button

    " 1. Loop through the selected rows
    LOOP AT keys INTO DATA(ls_key).

      TRY.
          " 2. Setup POST Request to the API
          DATA(lo_dest) = cl_http_destination_provider=>create_by_url( 'https://jsonplaceholder.typicode.com' ).
          DATA(lo_client) = cl_web_http_client_manager=>create_by_http_destination( lo_dest ).
          DATA(lo_request) = lo_client->get_http_request( ).
          lo_request->set_uri_path( '/posts' ).
          lo_request->set_header_field( i_name = 'Content-Type' i_value = 'application/json' ).

          " 3. Build the Payload (For fun, we'll append 'Tested via RAP' to whatever ID you selected)
          TYPES: BEGIN OF ty_post,
                   title TYPE string,
                 END OF ty_post.
          DATA(ls_post_data) = VALUE ty_post( title = |Triggered from Fiori! Selected ID: { ls_key-id }| ).

          DATA(lv_json) = xco_cp_json=>data->from_abap( ls_post_data )->apply( VALUE #( ( xco_cp_json=>transformation->underscore_to_camel_case ) ) )->to_string( ).
          lo_request->set_text( lv_json ).

          " 4. Execute POST
          DATA(lo_response) = lo_client->execute( i_method = if_web_http_client=>post ).

          " 5. Check if successful (HTTP 201)
          IF lo_response->get_status( )-code = 201.
   " A. Populate the screen Fiori just navigated to
            APPEND VALUE #(
              %tky    = ls_key-%tky    " The key stays at the root level
              %param  = VALUE #(       " All entity data goes inside %param!
                id      = ls_key-id
                title   = 'Success! API Accepted Payload.'
                body    = 'The HTTP 201 Created status was received.'
                user_id = 999 )
            ) TO result.

            " B. Trigger a green Fiori "Toast" message at the bottom of the screen
            APPEND VALUE #(
              %tky = ls_key-%tky
              %msg = new_message_with_text(
                       severity = if_abap_behv_message=>severity-success
                       text     = 'API POST call executed successfully!' )
            ) TO reported-externalpost.
          ENDIF.

        CATCH cx_root.
          " Handle errors
      ENDTRY.

    ENDLOOP.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZCE_JSONTESTKETAN DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZCE_JSONTESTKETAN IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
