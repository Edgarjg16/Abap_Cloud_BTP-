CLASS zcl_lab_04_02_ejec_053 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
        INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_04_02_ejec_053 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
**********************************************************************
*    Laboratorio de Eventos - 3 EVENT HANDLER
**********************************************************************
**   DATA : lo_screen TYPE REF TO zcl_lab_04_42_screen,
**          lo_navigation type ref to zcl_lab_04_43_navigation_53.
**
**          lo_screen = NEW zcl_lab_04_42_screen( ).
**          lo_navigation = NEW zcl_lab_04_43_navigation_53( ).
*
*    DATA(lo_screen) = NEW zcl_lab_04_42_screen( iv_screen_type = 'Prueba SENDER' ).
*
*    DATA(lo_navigation) = NEW zcl_lab_04_43_navigation_53( ).
*
**    SET HANDLER lo_navigation->on_touch_screen FOR lo_screen.
*
*    lo_navigation->register( io_screen = lo_screen ).
*
*    lo_screen->element_selected(
*      iv_horizontal = 100
*      iv_vertical   = 150
*    ).
*
*    out->write( lo_navigation->log ).

***********************************************************************
**    Laboratorio de Eventos - 5 Definir eventos en las interfaces
***********************************************************************
*
*    DATA(lo_operation) = NEW zcl_lab_04_44_operating_sys_53( ).
*    DATA(lo_chrome) = NEW zcl_lab_04_45_chrome_053( ).
*
*    SET HANDLER lo_chrome->on_close_window FOR lo_operation.
*
*    lo_operation->zif_lab_04_05_browser_53~mouse_movement( ).
*
*    out->write( lo_operation->log ).
*    out->write( lo_chrome->log ).

***********************************************************************
**    Laboratorio de Eventos - 6 Desactivar objeto manejador
***********************************************************************
*
*    DATA(lo_operation) = NEW zcl_lab_04_44_operating_sys_53( ).
*    DATA(lo_chrome) = NEW zcl_lab_04_45_chrome_053( ).
*
*    DATA : lv_operation_log TYPE string,
*           lv_chrome_log TYPE string.
*
*
*    lo_chrome->set_log( iv_log = '' ).
*    lo_operation->zif_lab_04_05_browser_53~set_log( iv_log = '' ).
*
*    SET HANDLER lo_chrome->on_close_window FOR lo_operation.
*
*    lo_operation->zif_lab_04_05_browser_53~mouse_movement( ).
*
*    lo_operation->zif_lab_04_05_browser_53~get_log(
*                                          IMPORTING
*                                            rv_log = lv_operation_log
*                                        ).
*
*    lo_chrome->get_log(
*                      IMPORTING
*                        rv_log = lv_chrome_log
*                    ).
*
*
*    out->write( lv_operation_log ).
*    out->write( lv_chrome_log ).

**********************************************************************
*    Laboratorio de Eventos - 6 Desactivar objeto manejador
**********************************************************************
*
*    DATA(lo_operation) = NEW zcl_lab_04_44_operating_sys_53( ).
*    DATA(lo_chrome) = NEW zcl_lab_04_45_chrome_053( ).
*
*    DATA : lv_operation_log TYPE string,
*           lv_chrome_log TYPE string.
*
*
*    lo_chrome->set_log( iv_log = '' ).
*    lo_operation->zif_lab_04_05_browser_53~set_log( iv_log = '' ).
*
*    SET HANDLER lo_chrome->on_close_window FOR lo_operation ACTIVATION abap_false.
*
*    lo_operation->zif_lab_04_05_browser_53~mouse_movement( ).
*
*    lo_operation->zif_lab_04_05_browser_53~get_log(
*                                          IMPORTING
*                                            rv_log = lv_operation_log
*                                        ).
*
*    lo_chrome->get_log(
*                      IMPORTING
*                        rv_log = lv_chrome_log
*                    ).
*
*
*    out->write( lv_operation_log ).
*    out->write( lv_chrome_log ).

**********************************************************************
*    Laboratorio de Eventos - 7 Eventos estáticos
**********************************************************************
*    SET HANDLER zcl_lab_04_47_customer_serv_53=>on_new_call.
*
*    zcl_lab_04_46_mobile_oper_53=>assign_call( iv_phone_number = '6389252229' ).
*
*    out->write( zcl_lab_04_47_customer_serv_53=>gv_log ).

**********************************************************************
*    Laboratorio de Eventos - 8 ALL INSTANCE
**********************************************************************

    DATA(lo_admin1) = NEW zcl_lab_04_48_adminis_dep_53( iv_employee_id = '0001' ).
    DATA(lo_admin2) = NEW zcl_lab_04_48_adminis_dep_53( iv_employee_id = '0002' ).
    DATA(lo_admin3) = NEW zcl_lab_04_48_adminis_dep_53( iv_employee_id = '0003' ).
    DATA(lo_employee) = NEW zcl_lab_04_49_employee_53( ).

    SET HANDLER lo_employee->on_payroll_paid FOR ALL INSTANCES.

    lo_admin1->notify_employee( ).
    lo_admin2->notify_employee( ).
    lo_admin3->notify_employee( ).


    LOOP AT lo_admin1->gt_log INTO DATA(ls_log1).
      out->write( ls_log1 ).
    ENDLOOP..

    LOOP AT lo_admin2->gt_log INTO DATA(ls_log2).
      out->write( ls_log2 ).
    ENDLOOP..

    LOOP AT lo_admin3->gt_log INTO DATA(ls_log3).
      out->write( ls_log3 ).
    ENDLOOP..

  ENDMETHOD.

ENDCLASS.
