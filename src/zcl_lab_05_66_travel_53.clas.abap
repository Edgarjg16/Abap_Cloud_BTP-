CLASS zcl_lab_05_66_travel_53 DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS : travel
                FINAL
                    IMPORTING io_out TYPE REF TO if_oo_adt_classrun_out.
  PROTECTED SECTION.
    METHODS TRANSPORT_ONEWAY ABSTRACT IMPORTING io_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS DAY_ONE ABSTRACT IMPORTING io_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS DAY_TWO ABSTRACT IMPORTING io_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS DAY_THREE ABSTRACT IMPORTING io_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS TRANSPORT_RETURN ABSTRACT IMPORTING io_out TYPE REF TO if_oo_adt_classrun_out.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_05_66_travel_53 IMPLEMENTATION.
  METHOD travel.
    TRANSPORT_ONEWAY( io_out ).
    DAY_ONE( io_out ).
    DAY_TWO( io_out ).
    DAY_THREE( io_out ).
    TRANSPORT_RETURN( io_out ).
  ENDMETHOD.

ENDCLASS.
