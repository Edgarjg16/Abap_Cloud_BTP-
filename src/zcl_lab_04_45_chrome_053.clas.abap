CLASS zcl_lab_04_45_chrome_053 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS : ON_CLOSE_WINDOW FOR EVENT close_window OF zif_lab_04_05_browser_53
                              importing sender,

              set_log IMPORTING iv_log TYPE string,
              get_log EXPORTING Value(rv_log) TYPE string.



  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA : log TYPE string.
ENDCLASS.



CLASS zcl_lab_04_45_chrome_053 IMPLEMENTATION.
  METHOD on_close_window.
    set_log( iv_log = 'Se recibe el evento.' ).
  ENDMETHOD.

  METHOD set_log.
    log = iv_log.
  ENDMETHOD.

  METHOD get_log.
    rv_log = log.
  ENDMETHOD.

ENDCLASS.
