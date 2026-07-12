CLASS zcl_virtual_discount_053 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES : if_sadl_exit_calc_element_read.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_virtual_discount_053 IMPLEMENTATION.
  METHOD if_sadl_exit_calc_element_read~get_calculation_info.

  ENDMETHOD.

  METHOD if_sadl_exit_calc_element_read~calculate.
    FIELD-SYMBOLS : <lt_data>  TYPE STANDARD TABLE,
                    <ls_data>  TYPE any,
                    <lv_price> TYPE any,
                    <lv_curr>  TYPE any,
                    <lv_real>  TYPE any.

    ASSIGN ct_calculated_data TO <lt_data>.

    LOOP AT <lt_data> ASSIGNING <ls_data>.
        ASSIGN COMPONENT 'PRICE' OF STRUCTURE <ls_data> TO <lv_price>.
        ASSIGN COMPONENT 'CURRENCY_CODE' OF STRUCTURE <ls_data> TO <lv_curr>.
        ASSIGN COMPONENT 'REALPRICE' OF STRUCTURE <ls_data> TO <lv_real>.

        if <lv_curr> = 'EUR'.
            <lv_real> = <lv_price> * '0,1'.
        ELSE.
            <lv_real> = <lv_price> * '0,05'.
        ENDIF.

    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
