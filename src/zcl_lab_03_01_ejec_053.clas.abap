CLASS zcl_lab_03_01_ejec_053 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_03_01_ejec_053 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
**********************************************************************
*     Laboratorio 3 - 02 Definir Interfaz
**********************************************************************
*    DATA(lo_connid) = NEW zcl_lab_03_26_flights_53( ).
*    lo_connid->zif_lab_03_01_flight_53~set_conn_id(  '01' ).
**    data(lv_connid) = lo_connid->zif_lab_03_01_flight_53~get_conn_id( ).
**    out->write( lv_connid ).
*
*    out->write( lo_connid->zif_lab_03_01_flight_53~get_conn_id( ) ).

**********************************************************************
*     Laboratorio 3 - 3 implementación de múltiples interfaces
**********************************************************************

*    DATA(lo_multi_interfaz) = NEW zcl_lab_03_26_flights_53(  ).
*    DATA(ls_customer) = lo_multi_interfaz->zif_lab_03_02_customer_53~get_customer( '000001' ).
*    out->write( ls_customer ).

***********************************************************************
*     Laboratorio 3 - 4 interfaces anidadas
***********************************************************************
*    DATA(lo_anidadas) = NEW zcl_lab_03_26_flights_53( ).
*
*    DATA(ls_airport) = lo_anidadas->zif_lab_03_03_airports_53~get_airport( iv_airport_id = 'FRA' ).
*
*    out->write( ls_airport ).

***********************************************************************
*     Laboratorio 3 - 5 interfaces Alias
***********************************************************************
*    DATA(lo_anidadas) = NEW zcl_lab_03_26_flights_53( ).
*
*    DATA(ls_airport) = lo_anidadas->get_airport( iv_airport_id = 'FRA' ).
*
*    out->write( ls_airport ).

***********************************************************************
*     Laboratorio 3 - 6 Clase abstracta
***********************************************************************
    DATA(lo_cls_abstracta) = NEW zcl_lab_03_28_logistics( ).

    data(ls_merchendise) = lo_cls_abstracta->merchandise_output( ).

    DATA(ls_input) = lo_cls_abstracta->input_products( ).

    data(ls_produc) = lo_cls_abstracta->production_line( ).

    out->write( ls_merchendise ).
    out->write( ls_input ).
    out->write( ls_produc ).



  ENDMETHOD.


ENDCLASS.
