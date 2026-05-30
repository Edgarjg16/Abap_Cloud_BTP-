CLASS zcl_lab_04_41_organization_53 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS : SET_HEADQUARTERS IMPORTING iv_headquarters TYPE string,
              get_headquarters RETURNING VALUE(rv_headquarters) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA : HEADQUARTERS TYPE string.
ENDCLASS.



CLASS zcl_lab_04_41_organization_53 IMPLEMENTATION.
  METHOD set_headquarters.
    me->headquarters = iv_headquarters.
  ENDMETHOD.

  METHOD get_headquarters.
    rv_headquarters = me->headquarters.
  ENDMETHOD.

ENDCLASS.
