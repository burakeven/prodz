*&---------------------------------------------------------------------*
*& Include          ZBM_PRODUCT2_101
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
CASE sy-ucomm.
    WHEN '&BACK'.
      SET SCREEN 0.
    WHEN '&TAB1'.
      tb_id-activetab = '&TAB1'.
    WHEN '&TAB2'.
      tb_id-activetab = '&TAB2'.
    WHEN '&TAB3'.
      tb_id-activetab = '&TAB3'.
    WHEN '&TAB4'.
      tb_id-activetab = '&TAB4'.
    WHEN '&EDIT'.
      PERFORM edit_data.
    WHEN '&DELETE'.
      PERFORM delete_data.
  ENDCASE.
ENDMODULE.
