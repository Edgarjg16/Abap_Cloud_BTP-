CLASS zcl_lab_04_32_internal_empl_53 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_lab_04_32_employee_53.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_04_32_internal_empl_53 IMPLEMENTATION.


  METHOD zif_lab_04_32_employee_53~get_employees_count.
    zif_lab_04_32_employee_53~l_cantidad = 100.
    rv_detalle = |Empleados internos : { zif_lab_04_32_employee_53~l_cantidad }|.
  ENDMETHOD.
ENDCLASS.
