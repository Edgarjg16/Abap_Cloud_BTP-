CLASS zcl_lab_05_71_administrator_53 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zcl_lab_05_70_observer_53.

    DATA : gv_notificacion TYPE string.

    METHODS : on_new_article FOR EVENT new_article OF zcl_lab_05_69_blog_53
                        IMPORTING ev_titulo.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_05_71_administrator_53 IMPLEMENTATION.
  METHOD on_new_article.
    gv_notificacion = |Administrador notificado : { ev_titulo } | .
  ENDMETHOD.

  METHOD zcl_lab_05_70_observer_53~notifica.
    gv_notificacion = |Administrador notificado : { iv_titulo } | .
  ENDMETHOD.

ENDCLASS.
