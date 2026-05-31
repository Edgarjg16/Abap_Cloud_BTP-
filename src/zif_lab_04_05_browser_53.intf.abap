INTERFACE zif_lab_04_05_browser_53
  PUBLIC.

    EVENTS : close_window.

    METHODS : mouse_movement,
              set_log IMPORTING iv_log TYPE string,
              get_log EXPORTING Value(rv_log) TYPE string.


ENDINTERFACE.
