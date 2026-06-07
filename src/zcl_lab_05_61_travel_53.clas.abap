CLASS zcl_lab_05_61_travel_53 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS : get_travel IMPORTING iv_carrier_id TYPE /dmo/carrier_id
                         RETURNING VALUE(rs_flight) TYPE /DMO/FLIGHT.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_05_61_travel_53 IMPLEMENTATION.
  METHOD get_travel.
    TEST-SEAM modificar_flight.

        SELECT SINGLE *
          FROM /DMO/FLIGHT
          WHERE carrier_id = @iv_carrier_id
           INTO @rs_flight.

    END-TEST-SEAM.

  ENDMETHOD.

ENDCLASS.
