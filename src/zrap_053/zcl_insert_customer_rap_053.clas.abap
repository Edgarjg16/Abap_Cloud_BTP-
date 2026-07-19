CLASS zcl_insert_customer_rap_053 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES : if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_customer_rap_053 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    UPDATE zcustomers_053
          SET flight_date    = @sy-datum,
              price          = '200',
              currency_code  = 'USD',
              overall_status = 'O'.

    UPDATE zcustomers_053d
          SET flight_date    = @sy-datum,
              price          = '200',
              currency_code  = 'USD',
              overall_status = 'O'.

    COMMIT WORK.

  ENDMETHOD.

ENDCLASS.
