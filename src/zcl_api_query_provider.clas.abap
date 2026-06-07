CLASS zcl_api_query_provider DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_rap_query_provider .
ENDCLASS.

CLASS zcl_api_query_provider IMPLEMENTATION.

 METHOD if_rap_query_provider~select.
    DATA lt_results TYPE STANDARD TABLE OF zce_jsontestketan.

    TRY.
" 1. Set the Base URL at the destination level (No /posts path here)
        DATA lv_url TYPE string.
        lv_url = 'https://jsonplaceholder.typicode.com/posts'.
        DATA(lo_destination) = cl_http_destination_provider=>create_by_url( lv_url ).
        DATA(lo_http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        DATA(lo_request) = lo_http_client->get_http_request( ).
" 2. Default API path
        DATA(lv_api_path) = |/posts|.
        " ====================================================================
        " NEW: Check if Fiori passed any filters (e.g., User ID)
        " ====================================================================
        DATA(lt_filter_ranges) = io_request->get_filter( )->get_as_ranges( ).

        " Check if the user is filtering by the USER_ID column
        READ TABLE lt_filter_ranges INTO DATA(ls_filter) WITH KEY name = 'USER_ID'.
        IF sy-subrc = 0 AND ls_filter-range IS NOT INITIAL.
          " Extract the value they typed (assuming a single '=' filter for this example)
" Use CONDENSE to strip all leading/trailing empty spaces from the ABAP integer!
          DATA(lv_clean_user_id) = condense( val = CONV string( ls_filter-range[ 1 ]-low ) ).

          " Manually append the query parameter to the path
          lv_api_path = |/posts?userId={ lv_clean_user_id }|.

          " Pass this filter directly to the external API!
          " This translates to: https://.../posts?userId=<value>
*          lo_request->set_form_field( i_name = 'userId' i_value = CONV string( lv_filtered_user ) ).
        ENDIF.
" Set the specific path on the request object
        lo_request->set_uri_path( i_uri_path = lv_api_path ).
        " Execute API Call
        DATA(lo_response) = lo_http_client->execute( i_method = if_web_http_client=>get ).
        DATA(lv_json_payload) = lo_response->get_text( ).

        xco_cp_json=>data->from_string( lv_json_payload )->apply(
          VALUE #( ( xco_cp_json=>transformation->camel_case_to_underscore ) )
        )->write_to( REF #( lt_results ) ).

        " Handle Fiori Paging (Same as before)
        IF io_request->is_data_requested( ).
          DATA(lv_offset)    = io_request->get_paging( )->get_offset( ).
          DATA(lv_page_size) = io_request->get_paging( )->get_page_size( ).
          DATA(lv_max_index) = lv_offset + lv_page_size.

          IF lv_page_size = if_rap_query_paging=>page_size_unlimited.
            lv_max_index = lines( lt_results ).
          ENDIF.

          DATA lt_paged_results TYPE STANDARD TABLE OF zce_jsontestketan.
          LOOP AT lt_results INTO DATA(ls_result) FROM lv_offset + 1 TO lv_max_index.
            APPEND ls_result TO lt_paged_results.
          ENDLOOP.

          io_response->set_data( lt_paged_results ).
        ENDIF.

        IF io_request->is_total_numb_of_rec_requested( ).
          io_response->set_total_number_of_records( lines( lt_results ) ).
        ENDIF.

      CATCH cx_root INTO DATA(lx_root).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
