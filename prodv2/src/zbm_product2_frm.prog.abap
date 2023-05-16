*&---------------------------------------------------------------------*
*& Include          ZBM_PRODUCT2_FRM
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form EDIT_DATA
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM edit_data.
  "GUNCELLEME ALANI

  "ILK GUNCELLEME KODLARI
  UPDATE zbn_urunbilgi SET urunisim = gv_urunupd2 WHERE urunisim EQ gv_urunisim2.
  UPDATE zbn_supplier SET supploc = gv_suppupd2 WHERE supploc EQ gv_suplokasyon2.

*  UPDATE zbn_prod_supp SET urunid = gv_urunupd WHERE urunid EQ gv_urunid.
*  UPDATE zbn_prod_supp SET tedarikci_id = gv_suppupd WHERE tedarikci_id EQ gv_supid.

  UPDATE zbn_depolama SET storeid = gv_strupd2 WHERE storeid EQ gv_strid2.

*  UPDATE zbn_prod_storage SET urunid = gv_urunupd WHERE urunid EQ gv_urunid.
*  UPDATE zbn_prod_storage SET depoid = gv_strupd WHERE depoid EQ gv_depolamaid.

  UPDATE zbn_depo SET deponame = gv_depoupd2 WHERE deponame EQ gv_depoadi2.


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
FORM delete_data.
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
ENDFORM.
