CLASS zcl_data_cust_053 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES : if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_data_cust_053 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DELETE FROM zcustomers_053.
    DELETE FROM zcustomers_053d.

        INSERT zcustomers_053 FROM (
                                SELECT FROM /dmo/travel
                                    FIELDS uuid(  ) AS customer_uuid,
                                    customer_id,
                                    description,
                                    createdby     AS local_created_by,
                                    createdat     AS local_created_at,
                                    lastchangedby AS local_last_change_by,
                                    lastchangedat AS local_last_changet_at

                                 ).
  ENDMETHOD.

ENDCLASS.
