CLASS zcl_custom_detail_053 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES : if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_custom_detail_053 IMPLEMENTATION.
  METHOD if_rap_query_provider~select.
    DATA : lt_result     TYPE STANDARD TABLE OF zcds_custom_detail_053,
           lv_get_offset TYPE i,
           lv_page_size  TYPE i,
           lv_total      TYPE i.

    IF io_request->is_data_requested( ).
      lv_get_offset = io_request->get_paging( )->get_offset( ).
      lv_page_size = io_request->get_paging( )->get_page_size(  ).

      SELECT
        FROM /dmo/customer
        FIELDS customer_id, phone_number, email_address
        ORDER BY customer_id ASCENDING
        INTO TABLE @lt_result
        UP TO @lv_page_size ROWS
        OFFSET @lv_get_offset.
      IF sy-subrc = 0.
        io_response->set_total_number_of_records( LINES( lt_result ) ).
        io_response->set_data( lt_result ).
      ENDIF.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
