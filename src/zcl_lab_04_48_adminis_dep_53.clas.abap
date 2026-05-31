CLASS zcl_lab_04_48_adminis_dep_53 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    data : gt_log TYPE STANDARD TABLE OF string.

    EVENTS : PAYROLL_PAID EXPORTING VALUE(ev_employee_id) TYPE string.

    METHODS : constructor
      IMPORTING
        iv_employee_id TYPE string.

    METHODS : notify_employee.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA : gv_employee_id TYPE string.
ENDCLASS.



CLASS zcl_lab_04_48_adminis_dep_53 IMPLEMENTATION.
  METHOD constructor.
    gv_employee_id = iv_employee_id.

  ENDMETHOD.

  METHOD notify_employee.
    APPEND |Empleado { gv_employee_id } tiene una notificación.| TO gt_log.
    RAISE EVENT payroll_paid
      EXPORTING
        ev_employee_id = gv_employee_id.
  ENDMETHOD.


ENDCLASS.
