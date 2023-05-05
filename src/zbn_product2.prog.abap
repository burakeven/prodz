*&---------------------------------------------------------------------*
*& Report ZBN_PRODUCT2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbn_product2.
INCLUDE zbn_product2_top.
INCLUDE zbn_product2_frm.

INCLUDE zbn_product2_001. "PBO
INCLUDE zbn_prodcut2_101. "PAI

CONTROLS tb_id TYPE TABSTRIP.

*DATA: gs_product  TYPE zbn_urunbilgi,
*      gs_supp     TYPE zbn_supplier,
*      gs_depo     TYPE zbn_depo,
*      gs_depolama TYPE zbn_depolama.

START-OF-SELECTION.
  CALL SCREEN 0100.

  "ara tablo birlestirme islemleri
*TABLES: PROD_TAB, VEND_TAB.
*
*TYPES: BEGIN OF TY_PROD_VEND,
*          PROD_ID TYPE PROD_TAB-PROD_ID,
*          VEND_ID TYPE VEND_TAB-VEND_ID,
*       END OF TY_PROD_VEND.
*
*DATA: IT_PROD_VEND_TAB TYPE STANDARD TABLE OF TY_PROD_VEND.
*
*SELECT PROD_ID, VEND_ID
*FROM PROD_TAB
*INNER JOIN VEND_TAB ON PROD_TAB.PROD_ID = VEND_TAB.PROD_ID
*INTO CORRESPONDING FIELDS OF TABLE IT_PROD_VEND_TAB.


*IF sy-subrc eq 0.
*SELECT SINGLE * FROM zbn_prod_storage INTO wa_prod_storage_tab
*    WHERE depoid = wa_prod_supp_tab-depo_id.
*ENDIF.
*  IF SY-SUBRC EQ 0.
*  DELETE zbn_urunbilgi WHERE urunid = wa_prod_supp_tab-urunid.  "WA_PROD_VEND_TAB-PROD_ID.
*  DELETE zbn_supplier WHERE VEND_ID = wa_prod_supp_tab-tedarikci_id.
*  MESSAGE 'Product and vendor records deleted successfully.' TYPE 'S'.
*ELSE.
*  MESSAGE 'Product not found.' TYPE 'E'.
*ENDIF.
  "*******"

  "Excele aktarma
*lo_alv_grid->get_grid( )->set_table_for_first_display(
*  EXPORTING i_save               = 'A'
*            i_default            = 'X'
*            is_layout            = ls_layout
*  CHANGING  it_outtab            = lt_data
*            it_fieldcatalog      = lt_fieldcat
*            it_sort              = lt_sort
*            it_toolbar_excluding = lt_toolbar
*            it_hotspot            = lt_hotspot
*            it_h_variant         = lt_variant
*            i_callback_top_of_page = 'TOP_OF_PAGE'
*            i_callback_user_command = 'USER_COMMAND'
*            i_callback_pf_status_set = 'PF_STATUS_SET'
*            i_callback_program = 'CALLBACK_PROGRAM' ).

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
    WHEN '&DUZENLE'.
      PERFORM edit_data.
    WHEN '&SIL'.
      PERFORM delete_data.
  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0110 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0110 OUTPUT.
* SET PF-STATUS 'xxxxxxxx'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0110  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0110 INPUT.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0120 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0120 OUTPUT.
* SET PF-STATUS 'xxxxxxxx'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0120  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0120 INPUT.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0130 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0130 OUTPUT.
* SET PF-STATUS 'xxxxxxxx'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0130  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0130 INPUT.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0140 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0140 OUTPUT.
* SET PF-STATUS 'xxxxxxxx'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0140  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0140 INPUT.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Form EDIT_DATA
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM edit_data .
  "GUNCELLEME ALANI

  "ILK GUNCELLEME KODLARI
  UPDATE zbn_urunbilgi SET urunid = gv_urunupd WHERE urunid EQ gv_urunid.
  UPDATE zbn_supplier SET suppid = gv_suppupd WHERE suppid EQ gv_supid.


  UPDATE zbn_prod_supp SET urunid = gv_urunupd WHERE urunid EQ gv_urunid.
  UPDATE zbn_prod_supp SET tedarikci_id = gv_suppupd WHERE tedarikci_id EQ gv_supid.


  UPDATE zbn_depolama SET storeid = gv_strupd WHERE storeid EQ gv_depolamaid.

  UPDATE zbn_prod_storage SET urunid = gv_urunupd WHERE urunid EQ gv_urunid.
  UPDATE zbn_prod_storage SET depoid = gv_strupd WHERE depoid EQ gv_depolamaid.

  UPDATE zbn_depo SET depoid = gv_depoupd WHERE depoid EQ gv_depoid.


  MESSAGE 'Records updated succesfully.' TYPE 'S'.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form DELETE_DATA
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM delete_data .
*SILME

* Ürün ve tedarikçi kayit silme alani
  DELETE FROM zbn_prod_supp WHERE urunid = gv_urunid AND tedarikci_id = gv_supid.
  DELETE FROM zbn_urunbilgi WHERE urunid = gv_urunid.
  DELETE FROM zbn_supplier WHERE suppid = gv_supid.

* Depolama kaydı silme alani
  SELECT SINGLE * FROM zbn_depolama INTO wa_depolama WHERE depoid = gv_supid.

  IF sy-subrc = 0.
    DELETE FROM zbn_depolama WHERE storeid = gv_supid.
    DELETE FROM zbn_prod_storage WHERE depoid = gv_supid.
  ENDIF.

* Depo kaydı silme alani
  DELETE FROM zbn_depo WHERE depoid = gv_depoid.

* Silme işlemi tamamlandı
  MESSAGE 'Records deleted successfully.' TYPE 'S'.

*  SELECT SINGLE * FROM zbn_prod_supp INTO wa_prod_supp_tab
*    WHERE urunid = wa_prod_supp_tab-urunid. "esleme
*
*  IF sy-subrc = 0. "Bir onceki satir basarili ise devam et.
*    "Eger basarisizsa sy-subrc donusu 4 olur, 0 olursa zaten blok islemeye devam edecek demektir.
*
*    SELECT SINGLE * FROM zbn_prod_storage INTO wa_prod_storage_tab
*      WHERE depoid = wa_prod_storage_tab-depoid.
*
*    IF sy-subrc = 0.
*      DELETE FROM zbn_prod_storage WHERE depoid = wa_prod_storage_tab-depoid.
*    ENDIF.
*
*    DELETE FROM zbn_prod_supp WHERE urunid = gv_urunid.
*    DELETE FROM zbn_urunbilgi WHERE urunid = gv_urunid.
*    DELETE FROM zbn_supplier WHERE suppid = wa_prod_supp_tab-tedarikci_id.
*
*    MESSAGE 'Product and vendor records deleted successfully.' TYPE 'S'.
*  ELSE.
*    MESSAGE 'Product not found.' TYPE 'E'.
*  ENDIF.
ENDFORM.
