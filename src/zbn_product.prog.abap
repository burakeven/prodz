*&---------------------------------------------------------------------*
*& Report ZBN_PRODUCT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbn_product.
INCLUDE zbn_product_frm.
INCLUDE zbn_product_top.

INCLUDE ZBN_PRODUCT_001. "PBO-MODULES
INCLUDE ZBN_PRODUCT_101. "PAI MODULES

CONTROLS tb_id TYPE TABSTRIP.

*TABLES: zbn_urunbilgi,
*        zbn_supplier,
*        zbn_depolama,
*        zbn_depo,
*        zbn_prod_storage,
*        zbn_prod_supp.
DATA: gs_product  TYPE zbn_urunbilgi,
      gs_supp     TYPE zbn_supplier,
      gs_depo     TYPE zbn_depo,
      gs_depolama TYPE zbn_depolama.

*DATA: gs_prod_supp    TYPE zbn_prod_supp,
*      gs_prod_storage TYPE zbn_prod_storage.

*TYPES: BEGIN OF gty_prodsup,
*         urunid TYPE z_urunid_de,
*         suppid TYPE z_depoid_de,
*       END OF gty_prodsup.
*
*TYPES: BEGIN OF gty_prodsto,
*         urunid TYPE z_urunid_de,
*         strid  TYPE z_depoid_de,
*       END OF gty_prodsto.

*DATA: gt_psup  TYPE TABLE OF gty_prodsup,
*      gt_pstor TYPE TABLE OF gty_prodsto.

DATA: gt_prodsup  TYPE TABLE OF zbn_prod_supp,
      gs_prodsup  TYPE zbn_prod_supp,
      gt_prodstor TYPE TABLE OF zbn_prod_storage,
      gs_prodstor TYPE zbn_prod_storage.

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
  gs_supp-urunid = gv_urunid3.

  gs_depo-depoid = gv_depoid2.
  gs_depo-deponame = gv_deponame.
  gs_depo-kapasite = gv_kapasite.

  gs_depolama-storeid = gv_strid.
  gs_depolama-depoid = gv_depoid.
  gs_depolama-urunid = gv_urunid2.
  gs_depolama-miktar = gv_miktar.
  gs_depolama-tarih = gv_tarih.

*  gs_prod_supp-urunid = gs_product-urunid.  "!!!SILME!!!BIR SEYLER DENIYORUM!!!
*  gs_prod_supp-tedarikci_id = gs_supp-suppid.
*
*  gs_prod_storage-urunid = gs_product-urunid.
*  gs_prod_storage-depoid = gs_depolama-storeid.


*  SELECT s.supplier_name, p.product_name, st.storage_location
*  from zbn_prod_supp as ps
*  join zbn_supplier as s on ps.supplier_id = s.supplier_id
*  join zbn_urunbilgi as p on ps.product_id = p.product_id
*  join zbn_prod_storage as ps2 on p.product_id = ps2.product_id
*  join zbn_depo as d on ps2.storage_id = d.storage_id
*  join zbn_storage as st on d.storage_id = st.storage_id.

  INSERT zbn_urunbilgi FROM gs_product.
  INSERT zbn_supplier FROM gs_supp.
  INSERT zbn_depo FROM gs_depo.
  INSERT zbn_depolama FROM gs_depolama.
*  INSERT zbn_prod_storage FROM gs_prod_storage.
*  INSERT zbn_prod_supp FROM gs_prod_supp.

*  SELECT * "ARA TABLO BAGLANTISI, PROD-SUP
*  FROM zbn_prod_supp
*  INNER JOIN zbn_supplier
*  ON zbn_prod_supp~tedarikci_id = zbn_supplier~suppid
*  INNER JOIN zbn_urunbilgi
*  ON zbn_prod_supp~urunid = zbn_urunbilgi~urunid INTO CORRESPONDING FIELDS OF TABLE gt_psup.
*
*  SELECT * "ARA TABLO BAGLANTISI, PROD-STORAGE
*  FROM zbn_prod_storage
*  INNER JOIN zbn_depolama
*  ON zbn_prod_storage~depoid = zbn_depolama~storeid
*  INNER JOIN zbn_urunbilgi
*  ON zbn_prod_storage~urunid = zbn_urunbilgi~urunid INTO CORRESPONDING FIELDS OF TABLE gt_pstor.
  SELECT * FROM zbn_urunbilgi AS z1
   INNER JOIN zbn_depolama AS z2 ON z2~urunid EQ z1~urunid INTO CORRESPONDING FIELDS OF TABLE gt_prodstor.

  LOOP AT gt_prodstor INTO DATA(ls_prodstor).
    CLEAR gs_prodstor.
    gs_prodstor-urunid = ls_prodstor-urunid.
    gs_prodstor-depoid = ls_prodstor-depoid.
    MODIFY zbn_prod_storage FROM gs_prodstor.
  ENDLOOP.

*  MODIFY zbn_prod_storage FROM gs_prodstor.
  MODIFY zbn_prod_storage FROM gs_prodstor.

  COMMIT WORK AND WAIT.

  MESSAGE 'Veriler tabloya kayıt edilmiştir.' TYPE 'I' DISPLAY LIKE 'S'.
ENDFORM.
