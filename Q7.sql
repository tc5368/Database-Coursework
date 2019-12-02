
ACCEPT Submitter_Name   CHAR PROMPT 'Enter your name for the report ';

/* Set up column headers */
COLUMN StoreCode	        FORMAT A20         	HEADING 'Store Code';
COlUMN Description        FORMAT A24          HEADING 'Item Description';
COLUMN Price              FORMAT $9999.99     HEADING 'Price';
COLUMN Quantity           FORMAT 99999        HEADING 'Quantity';
COLUMN Value FORMAT $9999.99     HEADING 'Value';

/* Format and title pages */
set Pause off;
set Feedback off;
set Space 6;
set newpage 4;
set pagesize 100;
set linesize 100;
set underline =;
alter session set nls_date_format = 'DD-MON-YYYY'

ttitle center "Current Stock Value by Store" skip 2 left -
center &_date skip 2 left- 
center "Prepared by" Submitter_Name
btitle center format 999 SQL.PNO;
break on StoreCode skip 2 on SuppCode skip 1 on Report;

compute sum of (Price*Quantity) on StoreCode;
compute sum of (Price*Quantity) on Report;
spool &Report_File;
compute sum LAB 'Store Total'of Value on Storecode;
compute sum LAB 'Grand Total' of Value on Report;

select StoreCode, Description, Price, Quantity, (Price * Quantity) Value
from Stocks
order by StoreCode, SuppCode;
spool off;
/* Clear all settings */
clear breaks;
clear columns;
clear computes;
set Pause on;
