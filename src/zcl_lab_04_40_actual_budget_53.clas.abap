CLASS zcl_lab_04_40_actual_budget_53 DEFINITION INHERITING FROM zcl_lab_04_39_budget_53
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS : get_budget REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_04_40_actual_budget_53 IMPLEMENTATION.
  METHOD get_budget.
    rv_budget = '... tipos instancias..'.
  ENDMETHOD.

ENDCLASS.
