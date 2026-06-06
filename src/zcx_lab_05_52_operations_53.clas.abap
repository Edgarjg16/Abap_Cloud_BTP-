CLASS zcx_lab_05_52_operations_53 DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  constants:
    begin of NO_EXECUTE,
      msgid type symsgid value 'ZMC_MENSAJES',
      msgno type symsgno value '001',
      attr1 type scx_attrname value 'AT_MESS1',
      attr2 type scx_attrname value 'AT_MESS2',
      attr3 type scx_attrname value 'AT_MESS3',
      attr4 type scx_attrname value 'AT_MESS4',
    end of NO_EXECUTE,

    begin of NO_ACCESS,
      msgid type symsgid value 'ZMC_MENSAJES',
      msgno type symsgno value '002',
      attr1 type scx_attrname value 'AT_MESS1',
      attr2 type scx_attrname value 'AT_MESS2',
      attr3 type scx_attrname value 'AT_MESS3',
      attr4 type scx_attrname value 'AT_MESS4',
    end of NO_ACCESS.

    DATA : AT_MESS1 TYPE STRING,
           AT_MESS2 TYPE STRING,
           AT_MESS3 TYPE STRING,
           AT_MESS4 TYPE STRING.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    METHODS constructor
      IMPORTING
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        !previous LIKE previous OPTIONAL
        MESS1 TYPE STRING OPTIONAL
        MESS2 TYPE STRING OPTIONAL
        MESS3 TYPE STRING OPTIONAL
        MESS4 TYPE STRING OPTIONAL.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcx_lab_05_52_operations_53 IMPLEMENTATION.

  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor(
    previous = previous
    ).
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
    ME->AT_MESS1 = MESS1.
    ME->AT_MESS2 = MESS2.
    ME->AT_MESS3 = MESS3.
    ME->AT_MESS4 = MESS4.
  ENDMETHOD.
ENDCLASS.
