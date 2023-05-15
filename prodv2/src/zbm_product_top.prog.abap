*&---------------------------------------------------------------------*
*& Include          ZBM_PRODUCT_TOP
*&---------------------------------------------------------------------*

"---------------*
"GLOBAL VARIABLES
"---------------*

"---------URUN----------*
data: gv_urunid type int4,
      gv_urunisim type char20,
      gv_uruncode type int4,
      gv_urunsekil type char20,
      gv_urunkilo type int4.

"--------SUPPLIER-------*
data: gv_suppid type int4,
      gv_suppname type char30,
      gv_supploc type char30,
      gv_suppcont type int4.

"--------DEPOLAMA-------*
data: gv_strid type int4,
      gv_depoid type int4,
      gv_miktar type int4,
      gv_tarih type d.

"--------DEPO-----------*
data: gv_deponame type char30,
      gv_kapasite type int4.

DATA: gt_prodsup  TYPE TABLE OF zbn_prod_supp,
      gs_prodsup  TYPE zbn_prod_supp,
      gt_prodstor TYPE TABLE OF zbn_prod_storage,
      gs_prodstor TYPE zbn_prod_storage.

DATA: gs_product  TYPE zbn_urunbilgi,
      gs_supp     TYPE zbn_supplier,
      gs_depo     TYPE zbn_depo,
      gs_depolama TYPE zbn_depolama.

DATA: it_urunbilgi TYPE TABLE OF zbn_urunbilgi.
DATA: gt_prodz TYPE TABLE OF zbn_prodz.
