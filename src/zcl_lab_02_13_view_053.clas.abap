CLASS zcl_lab_02_13_view_053 DEFINITION
PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS:
      constructor
        IMPORTING
          iv_view_type TYPE string,
      GET_view_type EXPORTING ev_view_type TYPE string.
  PROTECTED SECTION.
    DATA:
      view_type TYPE string,
      box       TYPE string.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_02_13_view_053 IMPLEMENTATION.
  METHOD constructor.
    me->view_type = iv_view_type.
  ENDMETHOD.

  METHOD get_view_type.
    ev_view_type = me->view_type.
  ENDMETHOD.
ENDCLASS.
