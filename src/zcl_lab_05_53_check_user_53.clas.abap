CLASS zcl_lab_05_53_check_user_53 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
     METHODS : CHECK_USER IMPORTING usuario TYPE syuname
                          RAISING zcx_lab_05_52_operations_53.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_05_53_check_user_53 IMPLEMENTATION.
  METHOD check_user.
    if usuario EQ 'CB9980000157'.
    ELSE.
      RAISE EXCEPTION TYPE zcx_lab_05_52_operations_53
        EXPORTING
          textid   = zcx_lab_05_52_operations_53=>no_access
*          previous =
          mess1    = |{ sy-uname }|
          mess2    = 'No access'
*          mess3    =
*          mess4    =
      .
    ENDIF.
  ENDMETHOD.

ENDCLASS.
