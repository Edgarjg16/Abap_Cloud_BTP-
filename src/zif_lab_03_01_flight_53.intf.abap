INTERFACE zif_lab_03_01_flight_53
  PUBLIC .
    INTERFACES : zif_lab_03_03_airports_53.

    CLASS-DATA : comp_id TYPE string.
    DATA : connid TYPE string.

    METHODS : SET_CONN_ID IMPORTING iv_connid TYPE string,
              GET_CONN_ID RETURNING VALUE(rv_connid) TYPE string..

ENDINTERFACE.
