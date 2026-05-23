INTERFACE zif_lab_03_02_customer_53
  PUBLIC .
  TYPES : BEGIN OF ty_cust_address,
            customer_id  TYPE string,
            first_name TYPE string,
            last_name  TYPE string,
          END OF ty_cust_address.

  DATA : "it_cust_address TYPE ty_cust_address,
         rs_customer     TYPE string.

  METHODS : get_customer IMPORTING iv_customer        TYPE string
                         RETURNING VALUE(rs_customer) TYPE ty_cust_address.

ENDINTERFACE.
