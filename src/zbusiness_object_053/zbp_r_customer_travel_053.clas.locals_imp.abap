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
                    IF lv_technical_name = 'CB998EEE141' AND Customer-CurrencyCode = 'USD'.
                        update_granted = abap_false.
                    ELSE.
                        update_granted = abap_true.
                    ENDIF.

                    APPEND VALUE #( let apd_auth = COND #( WHEN update_granted EQ abap_true
                                                                THEN if_abap_behv=>auth-allowed
                                                                ELSE if_abap_behv=>auth-unauthorized
                                                                ) IN
                                    %tky = Customer-%tky
                                    %update = if_abap_behv=>auth-allowed ) TO result.

                ENDLOOP.

  ENDMETHOD.

  METHOD get_global_authorizations.
    DATA(lv_technical_name) = cl_abap_context_info=>get_user_technical_name(  ).

    if lv_technical_name EQ 'CB9980001920'.
        IF requested_authorizations-%create EQ if_abap_behv=>mk-on
            OR requested_authorizations-%update EQ if_abap_behv=>mk-on
            OR requested_authorizations-%action-Edit EQ if_abap_behv=>mk-on
            OR requested_authorizations-%delete EQ if_abap_behv=>mk-on.
                result-%create = if_abap_behv=>auth-allowed.
                result-%action-Edit = if_abap_behv=>auth-allowed.
        ELSE.
                result-%create = if_abap_behv=>auth-unauthorized.
                result-%update = if_abap_behv=>auth-unauthorized.
                result-%action-Edit = if_abap_behv=>auth-unauthorized.
                result-%delete = if_abap_behv=>auth-unauthorized.
        ENDIF.
    endif.


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
  ENDMETHOD.

  METHOD validateCustomerFormat.
  ENDMETHOD.

ENDCLASS.
