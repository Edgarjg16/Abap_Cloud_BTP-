CLASS zcl_query_prov_053 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES: if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: lt_results TYPE STANDARD TABLE OF zi_cds_20_053.
ENDCLASS.



CLASS zcl_query_prov_053 IMPLEMENTATION.
  METHOD if_rap_query_provider~select.


    TRY.
        if io_request->is_data_requested(  ).
           data(lv_top) = io_request->get_paging( )->get_page_size( ).
           DATA(lv_skip) = io_request->get_paging(  )->get_offset(  ).

            SELECT FROM /dmo/travel
                FIELDS travel_id, agency_id, customer_id
                orDER BY travel_id ascending
                into table @lt_results
                offset @lv_skip
                UP TO @lv_top ROWS.
                if sy-subrc = 0.
                    io_response->set_total_number_of_records(  lines( lt_results ) ).
                    io_response->set_data( lt_results ).
                Endif.

        endif.

        CATCH cx_rap_query_response_set_twic INTO DATA(lx_exec).
    ENDTRY.
  ENDMETHOD.

ENDCLASS.
