CLASS zcl_lab_04_33_expatria_empl_53 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_lab_04_32_employee_53 .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_04_33_expatria_empl_53 IMPLEMENTATION.


  METHOD zif_lab_04_32_employee_53~get_employees_count.
    zif_lab_04_32_employee_53~l_cantidad = 200.
    rv_detalle = |Empleados repatriados : { zif_lab_04_32_employee_53~l_cantidad }|.
  ENDMETHOD.
ENDCLASS.
