*&---------------------------------------------------------------------*
*& Include          ZBN_PRODUCT_TOP
*&---------------------------------------------------------------------*

*---------------------------------------------------------------------*
*Global Object*
*---------------------------------------------------------------------*
DATA: go_container TYPE REF TO cl_gui_custom_container,
      go_grid      TYPE REF TO cl_gui_alv_grid.


"-------------------*
* GLOBAL TABLE
"-------------------*
DATA: it_urunbilgi TYPE TABLE OF zbn_urunbilgi.
DATA: gt_prodz TYPE TABLE OF zbn_prodz.

*TYPES: BEGIN OF gty_prodz,
*  urunid TYPE z_urunid_de,
*  urunisim  TYPE z_urunisim_de,
*  urunsekil TYPE z_urunsekil_de,
*  urunkilo  TYPE z_urunkilo_de,
*  uruncode2 TYPE z_uruncode2_de,
*  suppid  TYPE z_suppid_de,
*  suppname  TYPE z_suppname_de,
*  supploc   TYPE z_supploc_de,
*  suppcont  TYPE z_suppcont_de,
*  STOREID  TYPE Z_STRID_DE,
*  DEPOID  TYPE Z_DEPOID_DE,
*  MIKTAR  TYPE Z_MIKTAR_DE,
*  TARIH    TYPE Z_TARIH_DE,
*  DEPONAME  TYPE Z_DEPONAME_DE,
*  KAPASITE TYPE Z_KAPASITE_DE,
*  END OF gty_prodz.
*
*  data: gt_prodz type table of gty_prodz.
