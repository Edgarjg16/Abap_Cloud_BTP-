CLASS zcl_lab_05_65_factory_53 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS : create_file_type IMPORTING iv_file_type TYPE string
                                     RETURNING VALUE(ro_file_type) TYPE REF TO zif_lab_05_06_file_53.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_05_65_factory_53 IMPLEMENTATION.
  METHOD create_file_type.
    case iv_file_type.
      when 'WORK FILE'.
        ro_file_type = NEW zcl_lab_05_63_work_file_53( ).
      WHEN 'SUPPLY FILE'.
        ro_file_type = NEW zcl_lab_05_64_supply_file_53( ).
    endcase.
  ENDMETHOD.

ENDCLASS.
