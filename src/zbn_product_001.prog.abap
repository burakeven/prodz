*&---------------------------------------------------------------------*
*& Include          ZBN_PRODUCT_001
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Module SELECT_DATA OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE select_data OUTPUT.
    SELECT *
      FROM zbn_urunbilgi
      INTO TABLE it_urunbilgi
      UP TO 25 ROWS.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module CREATE_GRID1 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE create_grid1 OUTPUT.
  IF go_container IS NOT BOUND.
      CREATE OBJECT go_container
        EXPORTING
*          parent                      =                  " Parent container
          container_name              = 'CC_ALV'             " Name of the Screen CustCtrl Name to Link Container To

" Don't Autodefined Progid and Dynnr?

        EXCEPTIONS
          cntl_error                  = 1                " CNTL_ERROR
          cntl_system_error           = 2                " CNTL_SYSTEM_ERROR
          create_error                = 3                " CREATE_ERROR
          lifetime_error              = 4                " LIFETIME_ERROR
          lifetime_dynpro_dynpro_link = 5                " LIFETIME_DYNPRO_DYNPRO_LINK
          others                      = 6
        .
  ENDIF.
  CHECK go_container IS BOUND.
  CREATE OBJECT go_grid
    EXPORTING
      i_parent          =  go_container " Parent Container
    EXCEPTIONS
      error_cntl_create = 1                " Error when creating the control
      error_cntl_init   = 2                " Error While Initializing Control
      error_cntl_link   = 3                " Error While Linking Control
      error_dp_create   = 4                " Error While Creating DataProvider Control
      others            = 5
    .

CHECK go_grid IS BOUND.
CALL METHOD go_grid->set_table_for_first_display
  EXPORTING
    i_structure_name              = 'zbn_urunbilgi'              " Internal Output Table Structure Name
  CHANGING
    it_outtab                     = it_urunbilgi                " Output Table
  EXCEPTIONS
    invalid_parameter_combination = 1                " Wrong Parameter
    program_error                 = 2                " Program Errors
    too_many_lines                = 3                " Too many Rows in Ready for Input Grid
    others                        = 4
  .
ENDMODULE.
