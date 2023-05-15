*&---------------------------------------------------------------------*
*& Include          ZBM_PRODUCT_001
*&---------------------------------------------------------------------*
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
*& Module STATUS_0110 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0110 OUTPUT.
* SET PF-STATUS 'xxxxxxxx'.
* SET TITLEBAR 'xxx'.
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
*& Module STATUS_0130 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0130 OUTPUT.
* SET PF-STATUS 'xxxxxxxx'.
* SET TITLEBAR 'xxx'.
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
*& Module SELECT_DATA OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE select_data OUTPUT.
  "VERI SECME VE KAYDETME ALANI

  SELECT
      z1~urunid z1~urunisim z1~urunsekil z1~urunkilo z1~uruncode2
      z2~suppid z2~suppname z2~supploc z2~suppcont
      z3~storeid z3~depoid z3~miktar z3~tarih
      FROM zbn_urunbilgi AS z1
      INNER JOIN zbn_supplier AS z2 ON z2~urunid EQ z1~urunid
      INNER JOIN zbn_depolama AS z3 ON z3~urunid EQ z1~urunid
      INTO CORRESPONDING FIELDS OF TABLE gt_prodz.
ENDMODULE.

FORM save_data.
  gs_product-uruncode2 = gv_uruncode.
  gs_product-urunid = gv_urunid.
  gs_product-urunisim = gv_urunisim.
  gs_product-urunkilo = gv_urunkilo.
  gs_product-urunsekil = gv_urunsekil.

  gs_supp-suppid = gv_suppid.
  gs_supp-suppname = gv_suppname.
  gs_supp-supploc = gv_supploc.
  gs_supp-suppcont = gv_suppcont.
  gs_supp-urunid = gv_urunid.

  gs_depo-depoid = gv_depoid.
  gs_depo-deponame = gv_deponame.
  gs_depo-kapasite = gv_kapasite.

  gs_depolama-storeid = gv_strid.
  gs_depolama-depoid = gv_depoid.
  gs_depolama-urunid = gv_urunid.
  gs_depolama-miktar = gv_miktar.
  gs_depolama-tarih = gv_tarih.

  INSERT zbn_urunbilgi FROM gs_product.
  INSERT zbn_supplier FROM gs_supp.
  INSERT zbn_depo FROM gs_depo.
  INSERT zbn_depolama FROM gs_depolama.

  SELECT * FROM zbn_urunbilgi AS z1
   INNER JOIN zbn_depolama AS z2 ON z2~urunid EQ z1~urunid INTO CORRESPONDING FIELDS OF TABLE gt_prodstor.

  LOOP AT gt_prodstor INTO DATA(ls_prodstor).
    CLEAR gs_prodstor.
    gs_prodstor-urunid = ls_prodstor-urunid.
    gs_prodstor-depoid = ls_prodstor-depoid.
    MODIFY zbn_prod_storage FROM gs_prodstor.
  ENDLOOP.

  MODIFY zbn_prod_storage FROM gs_prodstor.
  MODIFY zbn_prod_storage FROM gs_prodstor.

  COMMIT WORK AND WAIT.

  MESSAGE 'Veriler tabloya kayıt edilmiştir.' TYPE 'I' DISPLAY LIKE 'S'.
ENDFORM.
