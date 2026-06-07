CLASS zcl_lab_05_59_calculator_53 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS : SUM_UP IMPORTING iv_ent1 TYPE I
                               iv_ent2 TYPE I
                               RETURNING VALUE(rv_sum_ent) TYPE I.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_05_59_calculator_53 IMPLEMENTATION.
  METHOD sum_up.
    rv_sum_ent = iv_ent1 + iv_ent2.
  ENDMETHOD.

ENDCLASS.
