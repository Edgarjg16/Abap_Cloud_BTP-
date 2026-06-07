*"* use this source file for your ABAP unit test classes
CLASS ltc_travel DEFINITION
  FINAL
  FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PUBLIC SECTION.
    INTERFACES : if_abap_db_writer.

  PRIVATE SECTION.

    DATA mo_travel TYPE REF TO zcl_lab_05_61_travel_53.

    METHODS:
      setup,
      test_get_travel FOR TESTING.

ENDCLASS.

CLASS ltc_travel IMPLEMENTATION.

  METHOD setup.
    mo_travel = NEW zcl_lab_05_61_travel_53(  ).
*    CREATE OBJECT mo_travel.
  ENDMETHOD.

  METHOD test_get_travel.
    TEST-INJECTION modificar_flight.
        clear : rs_flight.
        rs_flight-carrier_id = iv_carrier_id.
        rs_flight-price = '500'.
        rs_flight-currency_code = 'EUR'.

    END-TEST-INJECTION.

*   Ejecutar metodo
    DATA(ls_result) = mo_travel->get_travel( iv_carrier_id = 'LH' ).

*   validar
    cl_abap_unit_assert=>assert_not_initial(  ls_result ).

  ENDMETHOD.

ENDCLASS.
