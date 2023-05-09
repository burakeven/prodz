*&---------------------------------------------------------------------*
*& Report ZBN_PRODUCT3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZBN_PRODUCT3.

CONTROLS tb_id TYPE TABSTRIP.

INCLUDE zbn_product3_frm. "Formlarin olacagi bolum
INCLUDE zbn_product3_top. "Degisken atama alani

INCLUDE zbn_product3_001. "PBO
INCLUDE zbn_product3_101. "PAI


START-OF-SELECTION.
CALL SCREEN 0100.
