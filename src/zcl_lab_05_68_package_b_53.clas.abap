CLASS zcl_lab_05_68_package_b_53 DEFINITION INHERITING FROM zcl_lab_05_66_travel_53
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION.
    METHODS: transport_oneway REDEFINITION,
             day_one REDEFINITION,
             day_two REDEFINITION,
             day_three REDEFINITION,
             transport_return REDEFINITION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_05_68_package_b_53 IMPLEMENTATION.
  METHOD transport_oneway.
    io_out->write( 'Package B - Transport oneway' ).
  ENDMETHOD.

  METHOD day_one.
    io_out->write( 'Package B - One day' ).
  ENDMETHOD.

  METHOD day_two.
    io_out->write( 'Package B - Two day' ).
  ENDMETHOD.

  METHOD day_three.
    io_out->write( 'Package B - three day' ).
  ENDMETHOD.

  METHOD transport_return.
    io_out->write( 'Package B - Transport return' ).
  ENDMETHOD.
ENDCLASS.
