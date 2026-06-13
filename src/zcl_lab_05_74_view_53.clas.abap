CLASS zcl_lab_05_74_view_53 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS : display_flight
                IMPORTING it_flight TYPE /DMO/T_FLIGHT
                          io_out TYPE ref to if_oo_adt_classrun_out.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_05_74_view_53 IMPLEMENTATION.
  METHOD display_flight.
    if it_flight IS INITIAL.
        io_out->write( 'No hay vuenos' ).
        return.
    ENDIF.

    io_out->write( 'Listado de vuelos' ).

    LOOP AT it_flight ASSIGNING FIELD-SYMBOL(<it_flight>).
        io_out->write( |Carrier : { <it_flight>-carrier_id } |
                    && |Flight : { <it_flight>-connection_id } |
                    && |Fecha : { <it_flight>-flight_date } | ).
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
