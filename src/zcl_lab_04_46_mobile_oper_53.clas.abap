CLASS zcl_lab_04_46_mobile_oper_53 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-EVENTS : new_call EXPORTING VALUE(ev_phone_number) TYPE string.

    CLASS-METHODS : assign_call IMPORTING iv_phone_number TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_04_46_mobile_oper_53 IMPLEMENTATION.
  METHOD assign_call.
    RAISE EVENT new_call EXPORTING ev_phone_number = iv_phone_number.
  ENDMETHOD.

ENDCLASS.
