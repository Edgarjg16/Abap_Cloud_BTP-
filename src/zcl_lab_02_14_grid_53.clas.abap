CLASS zcl_lab_02_14_grid_53 DEFINITION INHERITING FROM zcl_lab_02_13_view_053
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS:
      constructor
        IMPORTING
          iv_view_type TYPE string
          iv_box       TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_02_14_grid_53 IMPLEMENTATION.
  METHOD constructor.
*   Constructor clase padre
    super->constructor(
      iv_view_type = iv_view_type ).

*   Atributo heredado
    me->box = iv_box.
  ENDMETHOD.
ENDCLASS.
