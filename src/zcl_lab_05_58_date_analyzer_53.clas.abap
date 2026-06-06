CLASS zcl_lab_05_58_date_analyzer_53 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
     METHODS : ANALYZE_DATE IMPORTING iv_date TYPE string
                            RAISING zcx_lab_05_56_no_date_53
                                    zcx_lab_05_57_format_un_53,

               ANALYZE_FORMAT IMPORTING iv_date TYPE string
                              RAISING zcx_lab_05_57_format_un_53.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_05_58_date_analyzer_53 IMPLEMENTATION.
  METHOD analyze_date.
    IF iv_date IS INITIAL.
      RAISE EXCEPTION TYPE zcx_lab_05_56_no_date_53.
    ENDIF.

    try.
        CALL METHOD me->analyze_format
          EXPORTING
            iv_date = iv_date.
      CATCH zcx_lab_05_57_format_un_53 INTO DATA(lx_format).
        RAISE EXCEPTION type zcx_lab_05_56_no_date_53
          EXPORTING
*            textid   =
            previous = lx_format.
    ENDTRY.
  ENDMETHOD.

  METHOD analyze_format.
      DATA: lv_date TYPE d.

        TRY.
            lv_date = iv_date.
        CATCH cx_sy_conversion_error INTO DATA(lx_conv).
            RAISE EXCEPTION TYPE zcx_lab_05_57_format_un_53
              EXPORTING
**                textid   =
                previous = lx_conv.
        ENDTRY.
  ENDMETHOD.

ENDCLASS.
