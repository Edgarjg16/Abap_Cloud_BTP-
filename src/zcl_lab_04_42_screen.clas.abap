CLASS zcl_lab_04_42_screen DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA : screen_type TYPE string.

    EVENTS : touch_screen EXPORTING value(ev_horizontal) type i
                                    value(ev_vertical) type i.

    METHODS : element_selected
                  IMPORTING
                    iv_horizontal TYPE i
                    iv_vertical   TYPE i,

             CONSTRUCTOR
                  IMPORTING
                    iv_screen_type TYPE string.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_04_42_screen IMPLEMENTATION.
  METHOD constructor.
    me->screen_type = iv_screen_type.

  ENDMETHOD.

  METHOD element_selected.
    RAISE EVENT touch_screen
      EXPORTING
        ev_horizontal = iv_horizontal
        ev_vertical   = iv_vertical.
  ENDMETHOD.

ENDCLASS.
