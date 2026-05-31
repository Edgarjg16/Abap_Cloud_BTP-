CLASS zcl_lab_04_49_employee_53 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA log_employee TYPE string.
    METHODS : ON_payroll_paid FOR EVENT payroll_paid OF zcl_lab_04_48_adminis_dep_53
                              importing ev_employee_id,

              constructor.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_04_49_employee_53 IMPLEMENTATION.
  METHOD on_payroll_paid.
     log_employee = |'Evento empleado recibido.'|.
  ENDMETHOD.

  METHOD constructor.
*    me->id = iv_id.
    SET HANDLER me->on_payroll_paid FOR ALL INSTANCES.
  ENDMETHOD.

ENDCLASS.
