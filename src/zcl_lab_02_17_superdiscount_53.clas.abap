CLASS zcl_lab_02_17_superdiscount_53 DEFINITION INHERITING FROM zcl_lab_02_16_pricediscount_53
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS : add_price REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_02_17_superdiscount_53 IMPLEMENTATION.
  METHOD add_price.
*    DATA(ls_flight) = is_flight.
*    ls_flight-price = is_flight-price - ( is_flight-price * discount_20  ).
*    APPEND ls_flight TO me->mt_flights.
*    es_flight = ls_flight.

    es_flight = is_flight.
    es_flight-price = is_flight-price - ( is_flight-price * discount_20  ).
    APPEND es_flight TO me->mt_flights.
  ENDMETHOD.
ENDCLASS.
