CLASS zcl_virtual_elem_053 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES : if_sadl_exit_calc_element_read.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_virtual_elem_053 IMPLEMENTATION.
  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
        CASE iv_entity.
            WHEN 'zi_cds_56' OR 'zi_cds_58_053'.
                LOOP AT it_requested_calc_elements INTO DATA(ls_req_cal_elem).
                    if ls_req_cal_elem = 'DISCOUNTEDPRICE'.
                        APPEND 'FLIGHTPRICE' to et_requested_orig_elements.
                    endif.
                ENDLOOP.
        ENDCASE.
  ENDMETHOD.

  METHOD if_sadl_exit_calc_element_read~calculate.
    DATA lt_original_data TYPE STANDARD TABLE OF zi_cds_56 WITH DEFAULT KEY.

    LOOP AT lt_original_data ASSIGNING FIELD-SYMBOL(<fs_original_data>).
        <fs_original_data>-DiscountedPrice = <fs_original_data>-FlightPrice - ( <fs_original_data>-FlightPrice * (  1 / 10 ) ).
    ENDLOOP.

    ct_calculated_data = CORRESPONDING #( lt_original_data ).
  ENDMETHOD.

ENDCLASS.
