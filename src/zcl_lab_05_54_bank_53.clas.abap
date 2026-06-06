CLASS zcl_lab_05_54_bank_53 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS : transfer importing iv_iban type string
                       out type ref to if_oo_adt_classrun_out
                       RAISING RESUMABLE(zcx_lab_05_55_auth_iban_53).
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_05_54_bank_53 IMPLEMENTATION.
  METHOD transfer.
    IF iv_iban EQ 'ES95 4329 8765 4321'.
      RAISE EXCEPTION TYPE zcx_lab_05_55_auth_iban_53.
    ENDIF.

    out->write( |Movimiento realizado. { iv_iban }| ).

  ENDMETHOD.

ENDCLASS.
