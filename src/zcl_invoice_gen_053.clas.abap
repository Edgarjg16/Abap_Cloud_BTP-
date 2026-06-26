CLASS zcl_invoice_gen_053 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES : if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_invoice_gen_053 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*    out->write( cl_abap_context_info=>get_user_technical_name(  ) ).

    MODIFY zusers_053 FROM TABLE @(  VALUE #( (  user_id = cl_abap_context_info=>get_user_technical_name(  )
                                                 invoice_id = '1'
                                                 first_name = 'first name 1'
                                                 last_name = 'last name 1') ) ).


    MODIFY zusers_053 FROM TABLE @(  VALUE #( (  user_id = cl_abap_context_info=>get_user_technical_name(  )
                                                 invoice_id = '2'
                                                 first_name = 'first name 1'
                                                 last_name = 'last name 1') ) ).

    MODIFY zusers_053 FROM TABLE @(  VALUE #( (  user_id = 'CB9999999993'
                                                 invoice_id = '3'
                                                 first_name = 'first name 3'
                                                 last_name = 'last name 3') ) ).

    MODIFY zusers_053 FROM TABLE @(  VALUE #( (  user_id = 'CB9999999994'
                                                 invoice_id = '4'
                                                 first_name = 'first name 4'
                                                 last_name = 'last name 4') ) ).

    MODIFY zusers_053 FROM TABLE @(  VALUE #( (  user_id = 'CB9999999995'
                                                 invoice_id = '5'
                                                 first_name = 'first name 5'
                                                 last_name = 'last name 5') ) ).

    MODIFY zinvoices_053 FROM TABLE @(  VALUE #( ( invoice_id = '1'
                                                   create_by = cl_abap_context_info=>get_user_technical_name(  )
                                                   customer = 'Coca-Cola'
                                                   amount = '2000.00'
                                                   currency_key = 'USD'
                                                   ) ) ).

    MODIFY zinvoices_053 FROM TABLE @(  VALUE #( ( invoice_id = '2'
                                                   create_by = cl_abap_context_info=>get_user_technical_name(  )
                                                   customer = 'Pepsia'
                                                   amount = '3000.00'
                                                   currency_key = 'USD'
                                                   ) ) ).

    MODIFY zinvoices_053 FROM TABLE @(  VALUE #( ( invoice_id = '3'
                                                   create_by = 'CB9999999993'
                                                   customer = 'Nestle'
                                                   amount = '5000.00'
                                                   currency_key = 'EUR'
                                                   ) ) ).

    MODIFY zinvoices_053 FROM TABLE @(  VALUE #( ( invoice_id = '4'
                                                   create_by = 'CB9999999994'
                                                   customer = 'Pringles'
                                                   amount = '1000.00'
                                                   currency_key = 'USD'
                                                   ) ) ).

    MODIFY zinvoices_053 FROM TABLE @(  VALUE #( ( invoice_id = '5'
                                                   create_by = 'CB9999999995'
                                                   customer = 'Milka'
                                                   amount = '4000.00'
                                                   currency_key = 'EUR'
                                                   ) ) ).



  ENDMETHOD.

ENDCLASS.
