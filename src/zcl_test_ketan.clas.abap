CLASS zcl_test_ketan DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_ketan IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.

    out->write( 'Hello Ketan 🚀 Welcome to ABAP Cloud + AI journey' ).

  ENDMETHOD.

ENDCLASS.
