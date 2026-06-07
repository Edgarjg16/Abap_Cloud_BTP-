CLASS zcl_lab_05_64_supply_file_53 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES : zif_lab_05_06_file_53.
    ALIASES : get_file_type FOR zif_lab_05_06_file_53~get_file_type.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_05_64_supply_file_53 IMPLEMENTATION.
    METHOD get_file_type.
        rv_file_type = 'SUPPLY FILE'.
    ENDMETHOD.
ENDCLASS.
