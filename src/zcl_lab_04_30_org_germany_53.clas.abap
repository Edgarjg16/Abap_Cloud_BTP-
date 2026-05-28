CLASS zcl_lab_04_30_org_germany_53 DEFINITION INHERITING FROM zcl_lab_04_29_organization_53
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS : get_location REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_04_30_org_germany_53 IMPLEMENTATION.

  METHOD get_location.
    rv_location = 'Germany'.
  ENDMETHOD.

ENDCLASS.
