CLASS zcl_lab_05_62_context_53 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS : get_instance RETURNING VALUE(ro_instance) TYPE REF TO zcl_lab_05_62_context_53.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA : mo_instance TYPE REF TO zcl_lab_05_62_context_53.
ENDCLASS.



CLASS zcl_lab_05_62_context_53 IMPLEMENTATION.
  METHOD get_instance.
    IF mo_instance IS NOT BOUND.
        mo_instance = NEW #( ).
    ENDIF.

    ro_instance = mo_instance.
  ENDMETHOD.

ENDCLASS.
