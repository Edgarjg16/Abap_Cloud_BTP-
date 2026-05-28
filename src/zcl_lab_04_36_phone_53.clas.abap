CLASS zcl_lab_04_36_phone_53 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  METHODS : constructor IMPORTING io_screen TYPE ref to zcl_lab_04_37_screen_53,
            get_screen RETURNING VALUE(rv_screen) TYPE REF TO zcl_lab_04_37_screen_53.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA : screen TYPE REF TO zcl_lab_04_37_screen_53.
ENDCLASS.



CLASS zcl_lab_04_36_phone_53 IMPLEMENTATION.
  METHOD constructor.
      me->screen  = io_screen.
  ENDMETHOD.

  METHOD get_screen.
    rv_screen = me->screen.
  ENDMETHOD.

ENDCLASS.
