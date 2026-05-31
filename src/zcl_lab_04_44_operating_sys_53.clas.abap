CLASS zcl_lab_04_44_operating_sys_53 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_lab_04_05_browser_53.

  PROTECTED SECTION.
    DATA log TYPE string.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_04_44_operating_sys_53 IMPLEMENTATION.
  METHOD zif_lab_04_05_browser_53~mouse_movement.

*   zif_lab_04_05_browser_53~set_log( '' ).

     zif_lab_04_05_browser_53~set_log( 'Se define y levanta el evento : ' ).

   RAISE EVENT zif_lab_04_05_browser_53~close_window.

  ENDMETHOD.

  METHOD zif_lab_04_05_browser_53~set_log.
    log = iv_log.
  ENDMETHOD.

  METHOD zif_lab_04_05_browser_53~get_log.
    rv_log = log.
  ENDMETHOD.

ENDCLASS.
