CLASS zcl_scalar_function DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES : if_amdp_marker_hdb,
                 if_oo_adt_classrun.

    CLASS-METHODS : vat_by_airline FOR SCALAR FUNCTION zsf_vat_by_airline_01_053,
                    booking_price_by_country FOR SCALAR FUNCTION zsf_book_price_c_02_053,
                    amount_qty_determination FOR SCALAR FUNCTION ZSF_03_AMOUNT_QTY_DET,
                    get_real_price FOR SCALAR FUNCTION ZSF_DIN_CALC_DISCOUNT_053.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_scalar_function IMPLEMENTATION.
    METHOD get_real_price BY DATABASE FUNCTION
                          FOR HDB LANGUAGE SQLSCRIPT
                          OPTIONS READ-ONLY.
         result = :p1 - :p2;

    ENDMETHOD.

    METHOD vat_by_airline BY DATABASE FUNCTION
                          FOR HDB LANGUAGE SQLSCRIPT
                          OPTIONS READ-ONLY.
       if pAirline = 'AA' THEN
         result = 21.00;
       else
         result = 24.00;
       END IF;

    ENDMETHOD.

    METHOD booking_price_by_country BY DATABASE FUNCTION
                                    FOR HDB LANGUAGE SQLSCRIPT
                                    OPTIONS READ-ONLY.
       if pCountryCode = 'US' THEN
         result = pBookingPrice * 0.9;
       else
         result = pBookingPrice;
       end if;
    ENDMETHOD.

    METHOD amount_qty_determination BY DATABASE FUNCTION
                                    FOR HDB LANGUAGE SQLSCRIPT
                                    OPTIONS READ-ONLY.
         result = p1 + p2;
    ENDMETHOD.

    METHOD if_oo_adt_classrun~main.
        DELETE FROM ztypes.
        MODIFY ztypes FROM TABLE @( value #( ( id = '1'
                                               price_1 = '10'
                                               price_2 = '10'
                                               cuky   = 'USD'
                                               quan_1 = '20'
                                               quan_2 = '20'
                                               unit   = 'KG'
                                             ) ) ).

        out->write( | { sy-dbcnt } Rows Inserted| ).

    ENDMETHOD.


ENDCLASS.
