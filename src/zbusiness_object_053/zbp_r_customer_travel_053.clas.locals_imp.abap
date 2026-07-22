CLASS lhc_Z_R_CUSTOMER_TRAVEL_053 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    CONSTANTS :
        BEGIN OF overall_status,
            open TYPE c LENGTH 1 VALUE 'O', " Open
            accepted TYPE c LENGTH 1 VALUE 'A', " accepted
            rejected TYPE c LENGTH 1 VALUE 'X', " rejected
        END OF overall_status.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR z_r_customer_travel_053 RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR z_r_customer_travel_053 RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR z_r_customer_travel_053 RESULT result.

    METHODS acceptCustomer FOR MODIFY
      IMPORTING keys FOR ACTION z_r_customer_travel_053~acceptCustomer RESULT result.

    METHODS rejectCustomer FOR MODIFY
      IMPORTING keys FOR ACTION z_r_customer_travel_053~rejectCustomer RESULT result.

    METHODS setDescription FOR DETERMINE ON MODIFY
      IMPORTING keys FOR z_r_customer_travel_053~setDescription.

    METHODS validateCustomer FOR VALIDATE ON SAVE
      IMPORTING keys FOR z_r_customer_travel_053~validateCustomer.

    METHODS validateCustomerFormat FOR VALIDATE ON SAVE
      IMPORTING keys FOR z_r_customer_travel_053~validateCustomerFormat.

ENDCLASS.

CLASS lhc_Z_R_CUSTOMER_TRAVEL_053 IMPLEMENTATION.

  METHOD get_instance_features.
    READ ENTITIES OF Z_R_CUSTOMER_TRAVEL_053 IN LOCAL MODE
         ENTITY CustomerTravel
         ALL FIELDS WITH CORRESPONDING #( keys )
         result DATA(lt_root_entity)
         FAILED failed.

    result = VALUE #( FOR ls_root_emtity IN lt_root_entity
                        ( %tky = ls_root_emtity-%tky
                          %action-acceptCustomer = COND #(
                                                            WHEN ls_root_emtity-OverallStatus = overall_status-open
                                                                THEN if_abap_behv=>fc-o-enabled
                                                                ELSE if_abap_behv=>fc-o-disabled )

                          %action-rejectCustomer = COND #(
                                                            WHEN ls_root_emtity-OverallStatus = overall_status-open
                                                                THEN if_abap_behv=>fc-o-enabled
                                                                ELSE if_abap_behv=>fc-o-disabled )

                         ) ).
  ENDMETHOD.

  METHOD get_instance_authorizations.
    DATA : update_request TYPE abap_bool,
           update_granted TYPE abap_bool.

    DATA(lv_technical_name) = cl_abap_context_info=>get_user_technical_name(  ).

    READ ENTITIES OF Z_R_CUSTOMER_TRAVEL_053 IN LOCAL MODE
         ENTITY CustomerTravel
         FIELDS ( CustomerId )
         WITH CORRESPONDING #(  keys )
         RESULT DATA(Customers)
         FAILED failed.

    update_request = COND #( WHEN requested_authorizations-%update = if_abap_behv=>mk-on
                               OR requested_authorizations-%action-Edit = if_abap_behv=>mk-on
                                 THEN abap_true
                                 ELSE abap_false ).
    CHECK update_request EQ abap_true.

        LOOP AT Customers INTO DATA(Customer).
            update_granted = abap_true.

            IF lv_technical_name = 'CB998EEE141' AND Customer-CurrencyCode = 'USD'.
               update_granted = abap_false.

                APPEND VALUE #(
                                %tky = Customer-%tky
                                %state_area = 'VALIDATE_COMPONENT'
                                %msg = new_message(
                                                     id       = 'NOT_AUTHORIZED'
                                                     number   = '002'
                                                     severity = if_abap_behv_message=>severity-error
                                                   )
                                %element-CustomerId = if_abap_behv=>mk-on
                               ) TO reported-customertravel.

            ENDIF.

            APPEND VALUE #( let apd_auth = COND #( WHEN update_granted EQ abap_true
                                                        THEN if_abap_behv=>auth-allowed
                                                        ELSE if_abap_behv=>auth-unauthorized
                                                        ) IN
                            %tky = Customer-%tky
*                            %update = if_abap_behv=>auth-allowed ) TO result.
                            %update = apd_auth
                            %delete = apd_auth
                            %action-edit = apd_auth ) TO result.
        ENDLOOP.

  ENDMETHOD.

  METHOD get_global_authorizations.
    DATA(lv_technical_name) = cl_abap_context_info=>get_user_technical_name(  ).

    IF lv_technical_name EQ 'CB9980001920'.
        result-%create = if_abap_behv=>auth-allowed.
        result-%update = if_abap_behv=>auth-allowed.
        result-%delete = if_abap_behv=>auth-allowed.
        result-%action-Edit = if_abap_behv=>auth-allowed.
    ELSE.
        result-%create = if_abap_behv=>auth-unauthorized.
        result-%update = if_abap_behv=>auth-unauthorized.
        result-%action-Edit = if_abap_behv=>auth-unauthorized.
        result-%delete = if_abap_behv=>auth-unauthorized.
    ENDIF.

    IF requested_authorizations-%create EQ if_abap_behv=>mk-on.
        APPEND VALUE #(
                        %state_area = 'VALIDATE_COMPONENT'
                        %msg = new_message(
                                             id       = 'NOT_AUTHORIZED'
                                             number   = '001'
                                             severity = if_abap_behv_message=>severity-error
                                           )
                        %element-CustomerId = if_abap_behv=>mk-on
                       ) TO reported-customertravel.
    ENDIF.

    IF requested_authorizations-%update EQ if_abap_behv=>mk-on
       OR requested_authorizations-%action-Edit EQ if_abap_behv=>mk-on.
        APPEND VALUE #(
                        %state_area = 'VALIDATE_COMPONENT'
                        %msg = new_message(
                                             id       = 'NOT_AUTHORIZED'
                                             number   = '002'
                                             severity = if_abap_behv_message=>severity-error
                                           )
                        %element-CustomerId = if_abap_behv=>mk-on
                       ) TO reported-customertravel.
    ENDIF.

    IF requested_authorizations-%delete EQ if_abap_behv=>mk-on.
        APPEND VALUE #(
                        %state_area = 'VALIDATE_COMPONENT'
                        %msg = new_message(
                                             id       = 'NOT_AUTHORIZED'
                                             number   = '003'
                                             severity = if_abap_behv_message=>severity-error
                                           )
                        %element-CustomerId = if_abap_behv=>mk-on
                       ) TO reported-customertravel.
    ENDIF.

  ENDMETHOD.

  METHOD acceptCustomer.
    DATA : lt_update_root_entity TYPE TABLE FOR UPDATE Z_R_CUSTOMER_TRAVEL_053,
           lv_discount TYPE /DMO/BT_DiscountPercentage,
           lv_disc_percent TYPE f.

    READ ENTITIES OF Z_R_CUSTOMER_TRAVEL_053 IN LOCAL MODE
         ENTITY CustomerTravel
         ALL FIELDS WITH CORRESPONDING #( keys )
         RESULT DATA(lt_root_entity)
         FAILED failed.

    LOOP AT lt_root_entity ASSIGNING FIELD-SYMBOL(<ls_root_entity>).
        lv_discount = keys[ key id %tky = <ls_root_entity>-%tky ]-%param-Discount_percent.

*---------------------------------------------------------
*       Validar porcentaje de descuento
*---------------------------------------------------------
        IF lv_discount < 0 OR lv_discount > 100.
            APPEND VALUE #( %tky = <ls_root_entity>-%tky ) TO FAILED-customertravel.

            APPEND VALUE #(
                            %tky = <ls_root_entity>-%tky
                            %state_area = 'VALIDATE_COMPONENT'
                            %msg = new_message(
                                                 id       = 'DISCOUNT_INVALID'
                                                 number   = '001'
                                                 severity = if_abap_behv_message=>severity-error
                                                 v1       = lv_discount
                                               )
                            %element-CustomerId = if_abap_behv=>mk-on
                           ) TO reported-customertravel.

            CONTINUE.

        ENDIF.

        lv_disc_percent = lv_discount / 100.
        <ls_root_entity>-Price = <ls_root_entity>-Price * (  1 - lv_disc_percent ).
        <ls_root_entity>-OverallStatus = overall_status-accepted.

        APPEND VALUE #( %tky = <ls_root_entity>-%tky
                        Price = <ls_root_entity>-Price
                        OverallStatus = <ls_root_entity>-overallstatus ) TO lt_update_root_entity.
    ENDLOOP.
    UNASSIGN <ls_root_entity>.

    MODIFY ENTITIES OF Z_R_CUSTOMER_TRAVEL_053 IN LOCAL MODE
           ENTITY CustomerTravel
           UPDATE
           FIELDS ( Price OverallStatus )
           WITH lt_update_root_entity.
           FREE lt_root_entity.

*           VALUE #( for key in keys ( %tky = key-%tky
*                                           OverallStatus = overall_status-accepted ) ).

    READ ENTITIES OF Z_R_CUSTOMER_TRAVEL_053 IN LOCAL MODE
         ENTITY CustomerTravel
         ALL FIELDS
         WITH CORRESPONDING #( keys )
         RESULT lt_root_entity
         FAILED failed.

    result = VALUE #( FOR Customer IN lt_root_entity ( %tky = Customer-%tky
                                                       %param = Customer
                                                     ) ).

  ENDMETHOD.

  METHOD rejectCustomer.
    MODIFY ENTITIES OF Z_R_CUSTOMER_TRAVEL_053 IN LOCAL MODE
           ENTITY CustomerTravel
           UPDATE
           FIELDS ( OverallStatus )
           WITH VALUE #( for key in keys ( %tky = key-%tky
                                           OverallStatus = overall_status-rejected ) ).

    READ ENTITIES OF Z_R_CUSTOMER_TRAVEL_053 IN LOCAL MODE
         ENTITY CustomerTravel
         ALL FIELDS
         WITH CORRESPONDING #( keys )
         RESULT DATA(customers).

    result = VALUE #(  for customer in customers ( %tky = customer-%tky
                                                   %param = customer ) ).

  ENDMETHOD.

  METHOD setDescription.
  ENDMETHOD.

  METHOD validateCustomer.
    READ ENTITIES OF Z_R_CUSTOMER_TRAVEL_053 IN LOCAL MODE
    ENTITY CustomerTravel
    FIELDS ( CustomerUuid CustomerId )
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_customer).

*   Si no hay datos, salir
    IF lt_customer IS INITIAL.
      RETURN.
    ENDIF.

*   Obtener todos los CustomerId existentes de una sola vez
    SELECT customer_id
      FROM zcustomers_053
      FOR ALL ENTRIES IN @lt_customer
      WHERE customer_id = @lt_customer-CustomerId
      INTO TABLE @DATA(lt_customer_db).

    SORT lt_customer_db BY customer_id.
"   Validar cada registro
    LOOP AT lt_customer INTO DATA(ls_customer).
        READ TABLE lt_customer_db
             WITH KEY customer_id = ls_customer-CustomerId
                  TRANSPORTING NO FIELDS
                  BINARY SEARCH.
          IF sy-subrc EQ 0.
            APPEND VALUE #(
                            %tky = ls_customer-%tky
                            %state_area = 'VALIDATE_COMPONENT'
                            %msg = new_message(
                                                 id       = 'ZMC_CUSTOMER'
                                                 number   = '001'
                                                 severity = if_abap_behv_message=>severity-error
                                                 v1       = ls_customer-CustomerId
                                               )
                            %element-CustomerId = if_abap_behv=>mk-on
                           ) TO reported-customertravel.
          ENDIF.
    ENDLOOP.


  ENDMETHOD.

  METHOD validateCustomerFormat.
  ENDMETHOD.

ENDCLASS.
