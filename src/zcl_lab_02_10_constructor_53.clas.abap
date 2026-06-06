CLASS zcl_lab_02_10_constructor_53 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS :
      constructor IMPORTING iv_codigo TYPE string,
      get_codigo  EXPORTING ev_codigo TYPE string.

    CLASS-METHODS : class_constructor.

    CLASS-DATA : log TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA : codigo_id TYPE string.
ENDCLASS.



CLASS zcl_lab_02_10_constructor_53 IMPLEMENTATION.
  METHOD constructor.
    me->codigo_id = iv_codigo.
    log = |{ log }-Method Constructor Instancia { codigo_id }-->|.
  ENDMETHOD.

  METHOD get_codigo.
    ev_codigo = me->codigo_id.
  ENDMETHOD.

  METHOD class_constructor.
    log = |{ log }-Class Method Constructor Static -->|.
  ENDMETHOD.

ENDCLASS.
