*&---------------------------------------------------------------------*
*& Include          ZBM_PRODUCT2_TOP
*&---------------------------------------------------------------------*

TABLES: zbn_urunbilgi,
        zbn_supplier,
        zbn_depolama,
        zbn_depo,
        zbn_prod_supp,
        zbn_prod_storage.

DATA: wa_prod_supp_tab    TYPE zbn_prod_supp,
      wa_prod_storage_tab TYPE zbn_prod_storage,
      wa_urunbilgi        TYPE zbn_urunbilgi,
      wa_depolama         TYPE zbn_depolama,
      wa_supplier         TYPE zbn_supplier.

DATA: gv_urunid type int4,
      gv_supid type int4,
      gv_depoid type int4,
      gv_urunid2      TYPE int4,
      gv_urunisim2(30)    TYPE c,
      gv_suplokasyon2(30) TYPE c,
      gv_strid2       TYPE int4,
      gv_depoadi2(30)     TYPE c,
      gv_urunupd2(30)     TYPE c,
      gv_suppupd2(30)     TYPE c,
      gv_strupd2      TYPE int4,
      gv_depoupd2(30)     TYPE c.
