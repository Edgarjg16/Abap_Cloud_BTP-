CLASS zcl_lab_02_25_collaborator_53 DEFINITION INHERITING FROM zcl_lab_02_24_partner_53
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS : get_capital RETURNING VALUE(rv_capital) TYPE ty_capital.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_02_25_collaborator_53 IMPLEMENTATION.
    METHOD get_capital.
       DATA(lo_company) = NEW zcl_lab_02_23_company_53( ).
       rv_capital = get_company_capital( ).
*       rv_capital = lo_company->capital.
    ENDMETHOD.
ENDCLASS.
