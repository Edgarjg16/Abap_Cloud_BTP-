*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations


CLASS zcl_lab_05_60_test_calc_53 IMPLEMENTATION.
  METHOD setup.
    mo_calcular = NEW zcl_lab_05_59_calculator_53(  ).
  ENDMETHOD.

  METHOD test_sum_up.
*   Test al metodo zcl_lab_05_59_calculator_53->sum_up
    DATA(lv_result) = mo_calcular->sum_up(
                        iv_ent1 = 1
                        iv_ent2 = 2
                      ).

    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lv_result
        exp                  = 3
*        ignore_hash_sequence = abap_false
*        tol                  =
*        msg                  =
*        level                = if_abap_unit_constant=>severity-medium
*        quit                 = if_abap_unit_constant=>quit-test
*      RECEIVING
*        assertion_failed     =
    ).

  ENDMETHOD.

ENDCLASS.
