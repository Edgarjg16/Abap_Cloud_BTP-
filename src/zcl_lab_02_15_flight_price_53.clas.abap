CLASS zcl_lab_02_15_flight_price_53 DEFINITION
  PUBLIC
*  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CONSTANTS : discount_10 TYPE p DECIMALS 1 VALUE '0.1',
                discount_20 TYPE p DECIMALS 1 VALUE '0.2'.
    DATA : mt_flights TYPE STANDARD TABLE OF /DMO/FLIGHT.
    METHODS : add_price IMPORTING is_flight TYPE /DMO/FLIGHT
                        EXPORTING es_flight TYPE /DMO/FLIGHT.
    METHODS : get_flight IMPORTING carrier_id TYPE /DMO/carrier_id
                                        conn_id TYPE /DMO/connection_id
                              EXPORTING es_flight TYPE /DMO/FLIGHT.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_02_15_flight_price_53 IMPLEMENTATION.
  METHOD add_price.
*    me->mt_flights-client = '100'.
*    me->mt_flights-carrier_id = 'AA'.
*    me->mt_flights-connection_id = '0322'.
*    me->mt_flights-currency_code = 'USD'.
*    me->mt_flights-flight_date = '20260517'.
*    me->mt_flights-plane_type_id = 'A320-200'.
*    me->mt_flights-price = '999.00'.
*    APPEND me->mt_flights TO me->mt_flights.
*    me->mt_flights-price = '999.00'.
    APPEND is_flight TO me->mt_flights.
  ENDMETHOD.

  METHOD get_flight.
    SELECT SINGLE FROM /DMO/FLIGHT
         FIELDS *
         WHERE carrier_id EQ @carrier_id
         AND connection_id EQ @conn_id
         INTO @DATA(ls_flight).
    es_flight = ls_flight.
  ENDMETHOD.

ENDCLASS.
