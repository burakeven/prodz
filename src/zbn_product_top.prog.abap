*&---------------------------------------------------------------------*
*& Include          ZBN_PRODUCT_TOP
*&---------------------------------------------------------------------*

*---------------------------------------------------------------------*
*Global Object*
*---------------------------------------------------------------------*
DATA: go_container TYPE REF TO cl_gui_custom_container,
      go_grid TYPE REF TO cl_gui_alv_grid.


"********************
* GLOBAL TABLE
data: it_urunbilgi TYPE TABLE OF zbn_urunbilgi.
