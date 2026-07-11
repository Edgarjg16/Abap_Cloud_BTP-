CLASS zcl_fill_invoice_053 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES : if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fill_invoice_053 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    out->write( cl_abap_context_info=>get_user_technical_name( ) ).
    MODIFY zdt_com_inv_053 FROM TABLE @( VALUE #( (
                                    invoice_id = '11'
                                    customer_name = 'Customer 1'
                                    inv_amount = '1000.00'
                                    currency = 'USD'
                                    department = '01'
                                    created_by = 'CB9980001920'
                                    create_date = sy-datum
                                    ) ) ).

    MODIFY zdt_com_inv_053 FROM TABLE @( VALUE #( (
                                    invoice_id = '2'
                                    customer_name = 'Customer 1'
                                    inv_amount = '2000.00'
                                    currency = 'USD'
                                    department = '01'
                                    created_by = 'CB9980001920'
                                    create_date = sy-datum
                                    ) ) ).

    MODIFY zdt_com_inv_053 FROM TABLE @( VALUE #( (
                                    invoice_id = '3'
                                    customer_name = 'Customer 1'
                                    inv_amount = '3000.00'
                                    currency = 'EUR'
                                    department = '01'
                                    created_by = 'CB9980001920'
                                    create_date = sy-datum
                                    ) ) ).

    MODIFY zdt_com_inv_053 FROM TABLE @( VALUE #( (
                                    invoice_id = '4'
                                    customer_name = 'Customer 1'
                                    inv_amount = '4000.00'
                                    currency = 'USD'
                                    department = '01'
                                    created_by = 'CB9980001920'
                                    create_date = sy-datum
                                    ) ) ).

    MODIFY zdt_com_inv_053 FROM TABLE @( VALUE #( (
                                    invoice_id = '5'
                                    customer_name = 'Customer 1'
                                    inv_amount = '5000.00'
                                    currency = 'EUR'
                                    department = '01'
                                    created_by = 'CB9980001920'
                                    create_date = sy-datum
                                    ) ) ).

    MODIFY zdt_com_inv_053 FROM TABLE @( VALUE #( (
                                    invoice_id = '6'
                                    customer_name = 'Customer 99'
                                    inv_amount = '1000.00'
                                    currency = 'EUR'
                                    department = '01'
                                    created_by = 'CB9980001999'
                                    create_date = sy-datum
                                    ) ) ).

    MODIFY zdt_com_inv_053 FROM TABLE @( VALUE #( (
                                    invoice_id = '7'
                                    customer_name = 'Customer 99'
                                    inv_amount = '2000.00'
                                    currency = 'EUR'
                                    department = '02'
                                    created_by = 'CB9980001999'
                                    create_date = sy-datum
                                    ) ) ).

    MODIFY zdt_com_inv_053 FROM TABLE @( VALUE #( (
                                    invoice_id = '8'
                                    customer_name = 'Customer 99'
                                    inv_amount = '3000.00'
                                    currency = 'EUR'
                                    department = '02'
                                    created_by = 'CB9980001999'
                                    create_date = sy-datum
                                    ) ) ).

    MODIFY zdt_com_inv_053 FROM TABLE @( VALUE #( (
                                    invoice_id = '9'
                                    customer_name = 'Customer 99'
                                    inv_amount = '4000.00'
                                    currency = 'USD'
                                    department = '02'
                                    created_by = 'CB9980001999'
                                    create_date = sy-datum
                                    ) ) ).

    MODIFY zdt_com_inv_053 FROM TABLE @( VALUE #( (
                                    invoice_id = '10'
                                    customer_name = 'Customer 99'
                                    inv_amount = '5000.00'
                                    currency = 'USD'
                                    department = '02'
                                    created_by = 'CB9980001999'
                                    create_date = sy-datum
                                    ) ) ).

  ENDMETHOD.



ENDCLASS.










