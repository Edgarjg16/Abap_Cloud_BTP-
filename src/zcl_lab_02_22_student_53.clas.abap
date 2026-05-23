CLASS zcl_lab_02_22_student_53 DEFINITION INHERITING FROM zcl_lab_02_21_classroom_53
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS : assign_student.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_02_22_student_53 IMPLEMENTATION.

  METHOD assign_student.
    DATA(lo_class) = NEW zcl_lab_02_21_classroom_53( ).
  ENDMETHOD.

ENDCLASS.
