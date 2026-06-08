CLASS zcl_lab_05_69_blog_53 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    EVENTS new_article EXPORTING VALUE(ev_titulo) type string.

    METHODS : publica IMPORTING iv_titulo TYPE string,
              get_titulo RETURNING VALUE(rv_titulo) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA : gv_titulo TYPE string.
ENDCLASS.



CLASS zcl_lab_05_69_blog_53 IMPLEMENTATION.
  METHOD get_titulo.
    rv_titulo = gv_titulo.
  ENDMETHOD.

  METHOD publica.
    gv_titulo = iv_titulo.

    RAISE EVENT new_article
      EXPORTING
        ev_titulo = gv_titulo.
  ENDMETHOD.

ENDCLASS.
