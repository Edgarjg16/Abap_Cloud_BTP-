CLASS zcl_fill_city_053 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES : if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fill_city_053 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DELETE FROM zcity_texts_053.

    MODIFY zcity_texts_053 FROM ( select airport_id,
                                         city FROM /dmo/airport ).

    out->write( |Airport {  sy-dbcnt }  rows insert.| ).

  ENDMETHOD.

ENDCLASS.
