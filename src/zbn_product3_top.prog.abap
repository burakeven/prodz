*&---------------------------------------------------------------------*
*& Include          ZBN_PRODUCT3_TOP
*&---------------------------------------------------------------------*

TABLES: zbn_urunbilgi,
        zbn_supplier,
        zbn_depolama,
        zbn_depo,
        zbn_prod_supp,
        zbn_prod_storage.

DATA: wa_prod_supp_tab    TYPE zbn_prod_supp,
      wa_prod_storage_tab TYPE zbn_prod_storage,
      wa_urunbilgi type zbn_urunbilgi,
      wa_depolama type zbn_depolama,
      wa_supplier type zbn_supplier.

DATA: gv_urunid     TYPE int4,
      gv_supid      TYPE int4,
      gv_depolamaid TYPE int4,
      gv_depoid     TYPE int4,
      gv_urunupd type int4,
      gv_suppupd type int4,
      gv_strupd type int4,
      gv_depoupd type int4.

DATA: go_container TYPE REF TO cl_gui_custom_container,
      go_grid      TYPE REF TO cl_gui_alv_grid.

data: gt_prodz type TABLE OF zbn_prodz.
