INTERFACE zif_lab_04_32_employee_53
  PUBLIC .
    data l_cantidad type i.

    METHODS GET_EMPLOYEES_COUNT RETURNING VALUE(rv_detalle) type string.
ENDINTERFACE.
