*"* use this source file for any type of declarations (class
*"* definitions, interfaces or type declarations) you need for
*"* components in the private section

*"! @testing zcl_lab_05_59_calculator_53
CLASS zcl_lab_05_60_test_calc_53 DEFINITION
  FINAL
  FOR TESTING
  DURATION short
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA : mo_calcular TYPE REF TO zcl_lab_05_59_calculator_53.

    METHODS : SETUP,
              TEST_SUM_UP FOR TESTING.

ENDCLASS.
