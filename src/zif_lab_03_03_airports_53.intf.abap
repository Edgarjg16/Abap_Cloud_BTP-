INTERFACE zif_lab_03_03_airports_53
  PUBLIC .
    TYPES : BEGIN OF ty_airport,
              airport_id TYPE /dmo/airport_id,
              name       TYPE /dmo/airport_name,
              city       TYPE /dmo/city,
              country    TYPE land1,
            END OF ty_airport.

    METHODS : get_airport IMPORTING iv_airport_id TYPE string
                          RETURNING VALUE(rs_airport) TYPE ty_airport.

ENDINTERFACE.
