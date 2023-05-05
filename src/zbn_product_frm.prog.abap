*&---------------------------------------------------------------------*
*& Include          ZBN_PRODUCT_FRM
*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*& Form DATAS
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
   "URUN BILGILERI INPUT
  DATA: gv_urunid    TYPE int4,
        gv_uruncode  TYPE int4,
        gv_urunad    TYPE char30,
        gv_urunsekil TYPE char30,
        gv_urunkilo  TYPE int4.
  "TEDARIKCI BILGILERI INPUT
  DATA: gv_suppid      TYPE int4,
        gv_suppname    TYPE char20,
        gv_supploc     TYPE char20,
        gv_suppcontact(11) TYPE n,
        gv_urunid3 type int4.

  "DEPOLAMA BILGILERI INPUT
  DATA: gv_strid   TYPE int4,
        gv_depoid  TYPE int4,
        gv_urunid2 TYPE int4,
        gv_miktar  TYPE int4,
        gv_tarih   TYPE DATS.
  "DEPO BILGILERI INPUT
  DATA: gv_depoid2  TYPE int4,
        gv_deponame TYPE char30,
        gv_kapasite TYPE int4.
