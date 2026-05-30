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
*   DATA : lo_screen TYPE REF TO zcl_lab_04_42_screen,
*          lo_navigation type ref to zcl_lab_04_43_navigation.
*
*          lo_screen = NEW zcl_lab_04_42_screen( ).
*          lo_navigation = NEW zcl_lab_04_43_navigation( ).

    DATA(lo_screen) = NEW zcl_lab_04_42_screen( iv_screen_type = 'Prueba SENDER' ).

    DATA(lo_navigation) = NEW zcl_lab_04_43_navigation( ).

*    SET HANDLER lo_navigation->on_touch_screen FOR lo_screen.

    lo_navigation->register( io_screen = lo_screen ).

    lo_screen->element_selected(
      iv_horizontal = 100
      iv_vertical   = 150
    ).

    out->write( lo_navigation->log ).

  ENDMETHOD.

ENDCLASS.
