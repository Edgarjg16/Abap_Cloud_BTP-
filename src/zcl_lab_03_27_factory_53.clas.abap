CLASS zcl_lab_03_27_factory_53 DEFINITION
  PUBLIC
*  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS : merchandise_output RETURNING VALUE(rv_merchendise) TYPE string.
    CLASS-METHODS : production_line RETURNING VALUE(rv_production) TYPE string,
                    input_products RETURNING VALUE(rv_input) TYPE string..
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_03_27_factory_53 IMPLEMENTATION.
  METHOD merchandise_output.
    clear : rv_merchendise.
    rv_merchendise = 'merchandise_output'.
  ENDMETHOD.

  METHOD input_products.
    rv_input = 'nput_products'.
  ENDMETHOD.

  METHOD production_line.
    rv_production = 'production_line'.
  ENDMETHOD.

ENDCLASS.
