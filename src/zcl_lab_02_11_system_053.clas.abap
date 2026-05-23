CLASS zcl_lab_02_11_system_053 DEFINITION
  PUBLIC
*  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: architecture TYPE string VALUE '64BITS'.
    METHODS : get_architecture EXPORTING ev_architecture TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_02_11_system_053 IMPLEMENTATION.
  METHOD get_architecture.
    ev_architecture = architecture.
  ENDMETHOD.

ENDCLASS.
