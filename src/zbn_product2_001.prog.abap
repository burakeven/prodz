*&---------------------------------------------------------------------*
*& Include          ZBN_PRODUCT2_001
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Module SELECT_DATA OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE select_data OUTPUT.
  SELECT
      z1~urunid z1~urunisim z1~urunsekil z1~urunkilo z1~uruncode2
      z2~suppid z2~suppname z2~supploc z2~suppcont
      z3~storeid z3~depoid z3~miktar z3~tarih
      FROM zbn_urunbilgi AS z1
      INNER JOIN zbn_supplier AS z2 ON z2~urunid EQ z1~urunid
      INNER JOIN zbn_depolama AS z3 ON z3~urunid EQ z1~urunid
      INTO CORRESPONDING FIELDS OF TABLE gt_prodz.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module CREATE_GRID OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE create_grid OUTPUT.
  IF go_container IS NOT BOUND.
    CREATE OBJECT go_container
      EXPORTING
*        parent                      =                  " Parent container
        container_name              = 'CC_ALV2'                 " Name of the Screen CustCtrl Name to Link Container To
*        style                       =                  " Windows Style Attributes Applied to this Container
*        lifetime                    = lifetime_default " Lifetime
*        repid                       =                  " Screen to Which this Container is Linked
*        dynnr                       =                  " Report To Which this Container is Linked
*        no_autodef_progid_dynnr     =                  " Don't Autodefined Progid and Dynnr?
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
*      i_shellstyle      = 0                " Control Style
*      i_lifetime        =                  " Lifetime
      i_parent          = go_container                 " Parent Container
*      i_appl_events     = space            " Register Events as Application Events
*      i_parentdbg       =                  " Internal, Do not Use
*      i_applogparent    =                  " Container for Application Log
*      i_graphicsparent  =                  " Container for Graphics
*      i_name            =                  " Name
*      i_fcat_complete   = space            " Boolean Variable (X=True, Space=False)
    EXCEPTIONS
      error_cntl_create = 1                " Error when creating the control
      error_cntl_init   = 2                " Error While Initializing Control
      error_cntl_link   = 3                " Error While Linking Control
      error_dp_create   = 4                " Error While Creating DataProvider Control
      others            = 5
    .
  CHECK go_grid IS BOUND.
  Call METHOD go_grid->set_table_for_first_display
    EXPORTING
      i_structure_name              = 'zbn_prodz'                 " Internal Output Table Structure Name
    CHANGING
      it_outtab                     = gt_prodz                 " Output Table
    EXCEPTIONS
      invalid_parameter_combination = 1                " Wrong Parameter
      program_error                 = 2                " Program Errors
      too_many_lines                = 3                " Too many Rows in Ready for Input Grid
      others                        = 4.
ENDMODULE.
