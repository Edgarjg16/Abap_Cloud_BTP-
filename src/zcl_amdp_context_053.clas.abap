CLASS zcl_amdp_context_053 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES ty_employees_t TYPE TABLE OF zempl_cli__053.

    TYPES : BEGIN OF ty_bookings,
              travelId     TYPE /dmo/travel_id,
              booking_id   TYPE /dmo/booking_id,
              customer_id  TYPE /dmo/customer_id,
              first_name   TYPE /dmo/first_name,
              last_name    TYPE /dmo/last_name,
              booking_date TYPE /dmo/booking_date,
              carrier_id   TYPE /dmo/carrier_id,
            END OF ty_bookings,
            ty_bookings_t TYPE TABLE OF ty_bookings.

    TYPES : ty_country TYPE c LENGTH 3.

    INTERFACES : if_amdp_marker_hdb,
                 if_oo_adt_classrun.

    CLASS-METHODS : get_employees_all_clients AMDP OPTIONS CLIENT INDEPENDENT
      EXPORTING VALUE(et_employees) TYPE ty_employees_t.

    CLASS-METHODS : read_cds AMDP OPTIONS CDS SESSION CLIENT DEPENDENT
      IMPORTING VALUE(iv_country) TYPE ty_country
      EXPORTING VALUE(et_return)  TYPE ty_bookings_t.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_amdp_context_053 IMPLEMENTATION.
  METHOD get_employees_all_clients BY DATABASE PROCEDURE FOR HDB
                                    LANGUAGE SQLSCRIPT
                                    OPTIONS READ-ONLY
                                    USING zempl_cli__053.

    et_employees = SELECT * FROM zempl_cli__053;

  ENDMETHOD.

  METHOD read_cds BY DATABASE PROCEDURE FOR HDB
                                    LANGUAGE SQLSCRIPT
                                    OPTIONS READ-ONLY
                                    USING /dmo/customer zi_cds_047_053.

    et_return = select top 10
            cds.TravelId,
            cds.bookingid as booking_id,
            customer.customer_id,
            customer.first_name,
            customer.last_name,
            cds.BookingDate as Booking_Date,
            cds.CarrierId as Carrier_Id
            from "/DMO/CUSTOMER" as customer
            inner join zi_cds_047_053 as cds
                    ON customer.customer_id = cds.customerid
                   where customer.country_code = :iv_country;


  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    zcl_amdp_context_053=>read_cds(
      EXPORTING
        iv_country = 'US'
      IMPORTING
        et_return  = data(lt_return) ).

    out->write( lt_return ).

  ENDMETHOD.

ENDCLASS.
