CLASS zcl_lab_04_35_college_53 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA : student TYPE REF TO zcl_lab_04_34_student_53.

    METHODS : enroll_student IMPORTING io_student TYPE REF TO zcl_lab_04_34_student_53.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_04_35_college_53 IMPLEMENTATION.
  METHOD enroll_student.
    student = io_student.
  ENDMETHOD.

ENDCLASS.
