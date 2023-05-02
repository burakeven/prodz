*&---------------------------------------------------------------------*
*& Report ZBN_PRODUCT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbn_product.
INCLUDE zbn_product_frm.
INCLUDE zbn_product_top.

CONTROLS tb_id TYPE TABSTRIP.

DATA: gs_product TYPE zbn_urunbilgi,
      gs_supp type zbn_supplier,
      gs_depo type zbn_depo,
      gs_depolama type zbn_depolama.

START-OF-SELECTION.
  CALL SCREEN 0100.
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS '0100'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
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
    WHEN '&EKLE'.
      PERFORM save_data.
  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0101 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0101 OUTPUT.
* SET PF-STATUS 'xxxxxxxx'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0101  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0101 INPUT.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0102 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0102 OUTPUT.
* SET PF-STATUS 'xxxxxxxx'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0102  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0102 INPUT.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0103 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0103 OUTPUT.
* SET PF-STATUS 'xxxxxxxx'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0103  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0103 INPUT.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0104 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0104 OUTPUT.
* SET PF-STATUS 'xxxxxxxx'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0104  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0104 INPUT.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Form SAVE_DATA
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
  FORM save_data.

  gs_product-uruncode2 = gv_uruncode.
  gs_product-urunid = gv_urunid.
  gs_product-urunisim = gv_urunad.
  gs_product-urunkilo = gv_urunkilo.
  gs_product-urunsekil = gv_urunsekil.

  gs_supp-suppid = gv_suppid.
  gs_supp-suppname = gv_suppname.
  gs_supp-supploc = gv_supploc.
  gs_supp-suppcont = gv_suppcontact.

  gs_depo-depoid = gv_depoid2.
  gs_depo-deponame = gv_deponame.
  gs_depo-kapasite = gv_kapasite.

  gs_depolama-storeid = gv_strid.
  gs_depolama-depoid = gv_depoid.
  gs_depolama-urunid = gv_urunid2.
  gs_depolama-miktar = gv_miktar.
  gs_depolama-tarih = gv_tarih.

  INSERT zbn_urunbilgi FROM gs_product.
  INSERT zbn_supplier FROM gs_supp.
  INSERT zbn_depo FROM gs_depo.
  INSERT zbn_depolama FROM gs_depolama.

  COMMIT WORK AND WAIT.
  MESSAGE 'Veriler tabloya kayıt edilmiştir.' TYPE 'I' DISPLAY LIKE 'S'.
ENDFORM.
