*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZBN_URUNBILGI...................................*
DATA:  BEGIN OF STATUS_ZBN_URUNBILGI                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZBN_URUNBILGI                 .
CONTROLS: TCTRL_ZBN_URUNBILGI
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZBN_URUNBILGI                 .
TABLES: ZBN_URUNBILGI                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
