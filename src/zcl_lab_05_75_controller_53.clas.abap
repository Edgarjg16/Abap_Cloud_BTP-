CLASS zcl_lab_05_75_controller_53 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS : set_model IMPORTING io_model TYPE REF TO zcl_lab_73_05_model_53,
              get_model RETURNING VALUE(ro_model) TYPE REF TO zcl_lab_73_05_model_53,
              set_view IMPORTING io_view TYPE REF TO zcl_lab_05_74_view_53,
              get_view RETURNING VALUE(ro_view) TYPE REF TO zcl_lab_05_74_view_53,

              execute IMPORTING lv_carrier_id TYPE /dmo/carrier_id
                                io_out type REF TO if_oo_adt_classrun_out.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA : model TYPE REF TO zcl_lab_73_05_model_53,
           view TYPE REF TO zcl_lab_05_74_view_53.
ENDCLASS.

CLASS zcl_lab_05_75_controller_53 IMPLEMENTATION.
  METHOD set_model.
    me->model = io_model.
  ENDMETHOD.

  METHOD set_view.
    me->view = io_view.
  ENDMETHOD.

  METHOD get_model.
    ro_model = me->model.
  ENDMETHOD.

  METHOD get_view.
    ro_view = me->view.
  ENDMETHOD.

  METHOD execute.
    DATA : it_fligth TYPE /DMO/T_FLIGHT.

    model->get_flight(
      EXPORTING
        iv_carrier_id = lv_carrier_id
      RECEIVING
        rt_flight     = it_fligth
    ).

    view->display_flight(
      it_flight = it_fligth
      io_out    = io_out
    ).
  ENDMETHOD.
ENDCLASS.
