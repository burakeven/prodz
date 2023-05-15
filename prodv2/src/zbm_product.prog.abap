*&---------------------------------------------------------------------*
*& Report ZBM_PRODUCT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbm_product.

INCLUDE zbm_product_top.

INCLUDE zbm_product_frm.

CONTROLS tb_id TYPE TABSTRIP.

INCLUDE zbm_product_001. "PBO

INCLUDE zbm_product_101. "PAI

PARAMETERS: p_id TYPE int4.

START-OF-SELECTION.
  gv_urunid = p_id.
*  IF screen-group1 EQ 'GR1'.
*    screen-display_3d = 1. "Input'a derinlik eklemiş oluruz.
*    screen-input = 0.
*    MODIFY SCREEN.
*  ENDIF.

END-OF-SELECTION.
  CALL SCREEN 0100.
