CLASS zcl_amdp_airport_053 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      types : begin of ty_airport,
                airport_id type /dmo/airport_id,
                name       type /dmo/airport_name,
                city       type /dmo/city,
                country    type land1,
              end of ty_airport,
              ty_airport_t type table of ty_airport.

    INTERFACES : if_amdp_marker_hdb,
                 if_oo_adt_classrun.

    CLASS-METHODS : get_airports FOR TABLE FUNCTION ztf_airports_053.
    CLASS-METHODS : get_airports_top10 FOR TABLE FUNCTION ZCDS_AIRPORT_AMDP_053.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_amdp_airport_053 IMPLEMENTATION.
  METHOD get_airports BY DATABASE FUNCTION FOR HDB
                                  LANGUAGE SQLSCRIPT
                                  OPTIONS READ-ONLY
                                  USING /dmo/airport.
    RETURN
         select
             airport.client,
             airport.airport_id,
             airport.name,
             airport.city,
             airport.country
             from "/DMO/AIRPORT" AS airport
*                    INNER JOIN ztf_airports_053 as cds
*                            ON cds.airport_id = airport.airport_id
             where airport.city = :pCity
             ORDER BY airport.city desc, airport.airport_id desc;
  endmethod.
  METHOD get_airports_top10 BY DATABASE FUNCTION FOR HDB
                                  LANGUAGE SQLSCRIPT
                                  OPTIONS READ-ONLY
                                  USING /dmo/airport.
   RETURN Select
             client,
             airport_id,
             name,
             city,
             country
            FROM "/DMO/AIRPORT"
            limit 10;
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
