CLASS zcl_lab_05_51_ejec_53 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_05_51_ejec_53 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
**********************************************************************
* Laboratorio Excepciones Ejercicio 7 Estructura de control CLEANUP
**********************************************************************
*    DATA(lo_check) = NEW zcl_lab_05_53_CHECK_USER_53( ).
*
*    DATA : lv_num1 TYPE i VALUE 100,
*           lv_num2 TYPE i VALUE 0,
*           lv_div  TYPE f.
*    TRY.
*        TRY.
*            lo_check->check_user( usuario = sy-uname ).
*
*            lv_div = lv_num1 + lv_num2.
*            lv_div = lv_num1 / lv_num2.
*            lv_div = lv_num1 - lv_num2.
*
*            CATCH zcx_lab_05_52_operations_53 INTO DATA(lx_access).
**                out->write( 'Usuario no autorizado' ).
*                out->write( lx_access->get_text( ) ).
*
*            CLEANUP.
*                out->write( 'Proceso de limpieza 1' ).
*        ENDTRY.
*
*        CATCH cx_sy_zerodivide INTO DATA(lx_zero).
*            out->write( lx_zero->get_text( ) ).
*                lv_num2 = 5.
*            RETRY.
*
*        CLEANUP.
*            out->write( 'Proceso de limpieza 2' ).
*    ENDTRY.
*    out->write( |Proceso finalizado { lv_div }| ).

**********************************************************************
* Laboratorio Excepciones Ejercicio 8 excepciones reanudables
**********************************************************************
*    DATA(lo_bank) = NEW zcl_lab_05_54_bank_53( ).
*    TRY.
*        lo_bank->transfer(
*                            iv_iban = 'ES95 4329 8765 4322'
*                            out = out
*                            ).
*            CATCH zcx_lab_05_55_auth_iban_53 INTO DATA(lx_access).
*                out->write( lx_access->get_text( ) ).
*    ENDTRY.

**********************************************************************
* Lab Excepciones Ejercicio 9 Asignaciones de excepciones unas a otras
**********************************************************************
    DATA(lo_analyze) = NEW zcl_lab_05_58_date_analyzer_53( ).


    TRY.
        TRY.
             lo_analyze->analyze_date( iv_date = '2024-02-30' ).
                CATCH zcx_lab_05_56_no_date_53 INTO DATA(lx_invalid).
                    out->write( lx_invalid->get_text( ) ).
        ENDTRY.

        CATCH zcx_lab_05_56_no_date_53 INTO DATA(lx_invalid_2).
            out->write( lx_invalid_2->get_text( ) ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
