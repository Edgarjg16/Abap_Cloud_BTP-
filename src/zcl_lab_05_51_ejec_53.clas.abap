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
*    DATA(lo_analyze) = NEW zcl_lab_05_58_date_analyzer_53( ).
*
*
*    TRY.
*        TRY.
*             lo_analyze->analyze_date( iv_date = '2024-02-30' ).
*                CATCH zcx_lab_05_56_no_date_53 INTO DATA(lx_invalid).
*                    out->write( lx_invalid->get_text( ) ).
*        ENDTRY.
*
*        CATCH zcx_lab_05_56_no_date_53 INTO DATA(lx_invalid_2).
*            out->write( lx_invalid_2->get_text( ) ).
*    ENDTRY.
**********************************************************************
* Lab Patrón de diseño Ejercicio 1 SINGLETON
**********************************************************************
*    DATA : lo_singleton1 TYPE REF TO zcl_lab_05_62_context_53,
*           lo_singleton2 TYPE REF TO zcl_lab_05_62_context_53.
*
*           lo_singleton1 = zcl_lab_05_62_context_53=>get_instance( ).
*           lo_singleton2 = zcl_lab_05_62_context_53=>get_instance( ).
*
*           IF lo_singleton1 = lo_singleton2.
*                out->write( 'Mantienen la misma Instancia' ).
*           ELSE.
*                out->write( 'Diferentes Instancias' ).
*           ENDIF..

**********************************************************************
* Lab Patrón de diseño Ejercicio 2 FACTORY METHOD
**********************************************************************
*   DATA lo_file TYPE REF TO zif_lab_05_06_file_53.
*
*    lo_file = zcl_lab_05_65_factory_53=>create_file_type( iv_file_type = 'WORK' ).
*    out->write( lo_file->get_file_type( ) ).
*
*    lo_file = zcl_lab_05_65_factory_53=>create_file_type( iv_file_type = 'SUPPLY' ).
*    out->write( lo_file->get_file_type( ) ).

**********************************************************************
* Lab Patrón de diseño Ejercicio 3 TEMPLATE METHOD
**********************************************************************
*    DATA : lo_travel TYPE REF TO zcl_lab_05_66_travel_53.
*
*    out->write( 'Inicio' ).
*
*    CREATE OBJECT lo_travel TYPE zcl_lab_05_67_package_a_53.
*    out->write( 'Package A...' ).
*    lo_travel->travel( io_out =  out ).
*
*    CREATE OBJECT lo_travel TYPE zcl_lab_05_68_package_b_53.
*    out->write( 'Package B...' ).
*    lo_travel->travel( io_out =  out ).
*
*    out->write( 'Fin' ).
**********************************************************************
* Lab Patrón de diseño Ejercicio 4 Observers
**********************************************************************
    DATA(lo_blog) = NEW zcl_lab_05_69_blog_53(  ).
    DATA(lo_admin) = NEW zcl_lab_05_71_administrator_53(  ).
    DATA(lo_user) = NEW zcl_lab_05_72_users_53(  ).

    SET HANDLER lo_admin->on_new_article FOR lo_blog.
    SET HANDLER lo_user->on_new_article FOR lo_blog.

    lo_blog->publica( iv_titulo = 'Nuevo articulo Fiori...' ).

    out->write( lo_admin->gv_notificacion ).
    out->write( lo_user->gv_notificacion ).

   ENDMETHOD.
ENDCLASS.

