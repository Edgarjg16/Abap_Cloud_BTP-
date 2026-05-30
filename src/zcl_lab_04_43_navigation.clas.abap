CLASS zcl_lab_04_43_navigation DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS : on_touch_screen FOR EVENT touch_screen OF zcl_lab_04_42_screen
                               IMPORTING ev_horizontal
                                         ev_vertical
                                         sender,

              register importing io_screen type ref TO zcl_lab_04_42_screen.

    DATA : log TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_04_43_navigation IMPLEMENTATION.
  METHOD on_touch_screen.
    log = |Screen { sender->screen_type }, Horizontal: { ev_horizontal }, Vertical: { ev_vertical }|.
  ENDMETHOD.

  METHOD register.
    SET HANDLER me->on_touch_screen FOR io_screen.
  ENDMETHOD.

ENDCLASS.
