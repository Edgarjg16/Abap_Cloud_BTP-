CLASS zcl_virt_emem_sadl_price_053 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES : if_sadl_exit_calc_element_read.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_virt_emem_sadl_price_053 IMPLEMENTATION.
  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
    CASE iv_entity.
        WHEN 'Z_C_CUSTOMER_TRAVEL_053'.
             LOOP AT it_requested_calc_elements INTO DATA(ls_request_calc_elem).
                IF ls_request_calc_elem EQ 'PRICEWITHTAX'.
                  INSERT conv #( 'PRICE' ) INTO TABLE et_requested_orig_elements.
                ENDIF.
             ENDLOOP.
    ENDCASE.
  ENDMETHOD.

  METHOD if_sadl_exit_calc_element_read~calculate.

    DATA : lt_original_data TYPE STANDARD TABLE OF Z_C_CUSTOMER_TRAVEL_053 WITH DEFAULT KEY.

    lt_original_data = CORRESPONDING #( it_original_data ).

    LOOP AT lt_original_data ASSIGNING FIELD-SYMBOL(<fs_original_data>).
        <fs_original_data>-PriceWithTax = <fs_original_data>-Price * '1.15'.
    ENDLOOP.

    ct_calculated_data = CORRESPONDING #( lt_original_data ).

  ENDMETHOD.

ENDCLASS.
