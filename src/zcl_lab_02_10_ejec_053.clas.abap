CLASS zcl_lab_02_10_ejec_053 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_02_10_ejec_053 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
**********************************************************************
*     Laboratorio 2 - 01 Intstancia
**********************************************************************
*    out->write( zcl_lab_02_10_constructor=>log ).
*
*    DATA(lo_codigo1) = NEW zcl_lab_02_10_constructor( '0101' ).
*    out->write( zcl_lab_02_10_constructor=>log ).
*
*    DATA(lo_codigo2) = NEW zcl_lab_02_10_constructor( '2222' ).
*    out->write( zcl_lab_02_10_constructor=>log ).

**********************************************************************
*     Laboratorio 2 - 01 Herencia
**********************************************************************
*        data(lo_lab_12_hija) = NEW zcl_lab_02_12_linux_053( ).
*
*
*
*        lo_lab_12_hija->get_architecture(
*          IMPORTING
*            ev_architecture = data(lv_architecture)
*        ).
*
*
*        out->write( lv_architecture ).

**********************************************************************
*     Laboratorio 2 - 2. Constructores con herencia
**********************************************************************

*    DATA(lo_herencia) = NEW zcl_lab_02_14_grid_53( iv_view_type = 'Report'
*                                                   iv_box = 'emal'
*                                                   ).
*
*    lo_herencia->get_view_type(
*      IMPORTING
*        ev_view_type = data(lv_view_type)
*    ).
*
*    out->write( lv_view_type ).
*
*    out->write( 'ejecutado correctamente' ).

**********************************************************************
*     Laboratorio 2 - 3. Redefinición de métodos
**********************************************************************
*    DATA(lo_flight) = NEW zcl_lab_02_15_flight_price_53( ).
*
*    lo_flight->get_flight( EXPORTING carrier_id = 'AA'
*                                     conn_id = '0017'
*                           IMPORTING es_flight = data(ls_flight)
*                         ).
*
**    lo_flight->add_price( is_flight = ls_flight ).
*
*    lo_flight->add_price(
*          EXPORTING
*            is_flight = ls_flight
*          IMPORTING
*            es_flight = ls_flight
*        ).
*
*
*    OUT->write( | Datos { ls_flight-carrier_id }-{ ls_flight-connection_id }-{ ls_flight-price } | ).
*
*    DATA(lo_flight10) = NEW zcl_lab_02_16_pricediscount_53( ).
*
*    lo_flight10->add_price(
*          EXPORTING
*            is_flight = ls_flight
*          IMPORTING
*            es_flight = ls_flight
*        ).
*
*    OUT->write( | Datos 10% { ls_flight-carrier_id }-{ ls_flight-connection_id }-{ ls_flight-price } | ).
*
*    DATA(lo_flight20) = NEW zcl_lab_02_17_superdiscount_53( ).
*
*    lo_flight20->add_price(
*          EXPORTING
*            is_flight = ls_flight
*          IMPORTING
*            es_flight = ls_flight
*        ).
*
*    OUT->write( | Datos 20% { ls_flight-carrier_id }-{ ls_flight-connection_id }-{ ls_flight-price } | ).

**********************************************************************
*     Laboratorio 2 - 4. Narrowing Cast
**********************************************************************
*    DATA(lo_animal) = NEW zcl_lab_02_18_animal_53( ).
*    DATA(lo_lion) = NEW zcl_lab_02_18_lion_53( ).
*
*    out->write( lo_animal->walk( ) ).
*    out->write(  lo_lion->walk( ) ).
*
*    out->write(  'Narrowinf Cast (Up Cast)' ).
*    lo_animal = lo_lion.
*    out->write( lo_animal->walk( ) ).
*    out->write(  lo_lion->walk( ) ).
*
*
*    out->write(  'Widening Cast (Down Cast)' ).
*    TRY.
*        lo_lion ?= lo_animal.
*        out->write(  'Código correcto' ).
*      CATCH cx_sy_move_cast_error INTO DATA(lv_error).
*        out->write(  'Error' ).
*    ENDTRY..
*
*    out->write( lo_animal->walk( ) ).
*    out->write(  lo_lion->walk( ) ).

**********************************************************************
*     Laboratorio 2 - 9. Concepto Friends – Clase amiga
**********************************************************************
*  DATA(lo_partner) = NEW zcl_lab_02_24_partner_53( ).
*  lo_partner->get_company_capital(
*    RECEIVING
*      rv_capital = data(lv_capital)
*  ).
*
*  out->write( lv_capital ).

**********************************************************************
*     Laboratorio 2 - 10. Herencia con clase amiga
**********************************************************************

   data(lo_colla) = NEW zcl_lab_02_25_collaborator_53( ).
   lo_colla->get_capital(
     RECEIVING
       rv_capital = data(lv_capital)
   ).

   out->write(  'Capital' ).
   out->write(  lv_capital ).

  ENDMETHOD.

ENDCLASS.
