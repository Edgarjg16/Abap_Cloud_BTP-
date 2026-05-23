CLASS zcl_lab_03_26_flights_53 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES : zif_lab_03_01_flight_53,
                 zif_lab_03_02_customer_53.

    ALIASES : get_airport FOR zif_lab_03_03_airports_53~get_airport.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_03_26_flights_53 IMPLEMENTATION.

  METHOD zif_lab_03_01_flight_53~set_conn_id.
    me->zif_lab_03_01_flight_53~connid = iv_connid.
  ENDMETHOD.

  METHOD zif_lab_03_01_flight_53~get_conn_id.
    rv_connid = me->zif_lab_03_01_flight_53~connid.
  ENDMETHOD.

  METHOD zif_lab_03_02_customer_53~get_customer.
    CLEAR : rs_customer.

    SELECT single customer_id,
           first_name,
           last_name
      FROM /dmo/customer
      WHERE customer_id = @iv_customer
      INTO @rs_customer.

  ENDMETHOD.

  METHOD zif_lab_03_03_airports_53~get_airport.
    clear : rs_airport.

    SELECT single airport_id, name, city, country

      FROM /dmo/airport
      WHERE airport_id = @iv_airport_id
      INTO @rs_airport.

  ENDMETHOD.

ENDCLASS.
