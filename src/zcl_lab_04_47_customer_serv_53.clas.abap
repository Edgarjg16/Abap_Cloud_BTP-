CLASS zcl_lab_04_47_customer_serv_53 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-DATA : gv_log TYPE string.

    CLASS-METHODS : ON_NEW_CALL FOR EVENT new_call OF zcl_lab_04_46_mobile_oper_53
            IMPORTING
                    ev_phone_number.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_04_47_customer_serv_53 IMPLEMENTATION.
  METHOD on_new_call.
    gv_log = |Nueva llamada entrante : { ev_phone_number }|.
  ENDMETHOD.

ENDCLASS.
