*&---------------------------------------------------------------------*
*& Report ZBM_PRODUCT3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZBM_PRODUCT3.

INCLUDE zbm_product3_top. "Degisken atama alani

INCLUDE zbm_product3_frm. "Formlarin olacagi bolum

CONTROLS tb_id TYPE TABSTRIP.

INCLUDE zbm_product3_001. "PBO

INCLUDE zbm_product3_101. "PAI

PARAMETERS: p_nid type int4.

START-OF-SELECTION.
gv_urunid = p_nid.

END-OF-SELECTION.
  CALL SCREEN 0100.
