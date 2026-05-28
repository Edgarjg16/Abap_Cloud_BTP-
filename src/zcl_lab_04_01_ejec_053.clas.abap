CLASS zcl_lab_04_01_ejec_053 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
        INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_04_01_ejec_053 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

**********************************************************************
*     Laboratorio 4 - 01 Polimorfismo con clases
**********************************************************************
*    DATA : gt_location TYPE STANDARD TABLE OF REF TO zcl_lab_04_29_organization_53,
*           go_location TYPE ref to  zcl_lab_04_29_organization_53.
**           go_org_germany TYPE REF TO zcl_lab_04_30_org_germany_53,
**           go_org_france TYPE REF TO zcl_lab_04_31_org_france_53.
*
**           go_org_germany = NEW #(  ).
**           APPEND go_org_germany TO gt_location.
*
**           go_org_france  = NEW #(  ).
**           APPEND go_org_france TO gt_location.
*
**           LOOP AT gt_location into go_location.
**            out->write( go_location->get_location( ) ).
**           endloop.

*            APPEND NEW zcl_lab_04_30_org_germany_53(  ) TO gt_location.
*            APPEND NEW zcl_lab_04_31_org_france_53( ) TO gt_location.
*
*           LOOP AT gt_location into go_location.
*             out->write( go_location->get_location( ) ).
*           endloop.

**********************************************************************
*     Laboratorio 4 - 02 Polimorfismo con interfaces
**********************************************************************
*    DATA : gt_employs TYPE STANDARD TABLE OF REF TO zif_lab_04_32_employee_53,
*           go_employs TYPE REF TO zif_lab_04_32_employee_53.
*
*           APPEND NEW zcl_lab_04_32_internal_empl_53(  ) TO gt_employs.
*           APPEND NEW zcl_lab_33_expatriate_empl_53(  ) TO gt_employs.
*
*           LOOP AT gt_employs INTO go_employs.
*                out->write( go_employs->get_employees_count( ) ).
*           ENDLOOP..
*
**********************************************************************
*     Laboratorio 4 - 03 Asociaciones
**********************************************************************
*    data : lo_student type REF TO zcl_lab_04_34_student_53,
*           lo_college TYPE REF TO zcl_lab_04_35_college_53,
*           lv_name TYPE string.
*
*           CREATE OBJECT lo_student.
*           lo_student->set_name(  'Edgar....' ).
*
*           CREATE OBJECT lo_college.
*           lo_college->enroll_student(  lo_student ).
*
*           lv_name = lo_college->student->get_name( ).
*
*           out->write( lv_name ).
**********************************************************************
*     Laboratorio 4 - 04 composición
**********************************************************************
    DATA : lo_screen TYPE REF TO zcl_lab_04_37_screen_53,
           lo_phone TYPE REF TO zcl_lab_04_36_phone_53.

           CREATE OBJECT lo_screen.
           lo_screen->set_screen_type( '3D' ).

           CREATE OBJECT lo_phone
             EXPORTING
               io_screen = lo_screen.

           out->write( lo_screen->get_screen_type( ) ).


  ENDMETHOD.

ENDCLASS.
