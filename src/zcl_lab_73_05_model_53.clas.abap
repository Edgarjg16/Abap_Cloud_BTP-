CLASS zcl_lab_73_05_model_53 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS : get_flight
        IMPORTING iv_carrier_id TYPE /DMO/carrier_id
        RETURNING VALUE(rt_flight) TYPE /DMO/T_FLIGHT.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_73_05_model_53 IMPLEMENTATION.
  METHOD get_flight.
    SELECT * FROM /DMO/FLIGHT
    WHERE carrier_id = @iv_carrier_id
    into TABLE @rt_flight.
  ENDMETHOD.

ENDCLASS.
