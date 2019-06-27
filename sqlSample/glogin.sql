--
-- Copyright (c) 1988, 2004, Oracle Corporation.  All Rights Reserved.
--
-- NAME
--   glogin.sql
--
-- DESCRIPTION
--   SQL*Plus global login "site profile" file
--
--   Add any SQL*Plus commands here that are to be executed when a
--   user starts SQL*Plus, or uses the SQL*Plus CONNECT command
--
-- USAGE
--   This script is automatically run
--

-- Used by Trusted Oracle
COLUMN ROWLABEL FORMAT A15

-- Used for the SHOW ERRORS command
COLUMN LINE/COL FORMAT A8
COLUMN ERROR    FORMAT A65  WORD_WRAPPED

-- Used for the SHOW SGA command
COLUMN name_col_plus_show_sga FORMAT a24
COLUMN units_col_plus_show_sga FORMAT a15
-- Defaults for SHOW PARAMETERS
COLUMN name_col_plus_show_param FORMAT a36 HEADING NAME
COLUMN value_col_plus_show_param FORMAT a30 HEADING VALUE

-- Defaults for SHOW RECYCLEBIN
COLUMN origname_plus_show_recyc   FORMAT a16 HEADING 'ORIGINAL NAME'
COLUMN objectname_plus_show_recyc FORMAT a30 HEADING 'RECYCLEBIN NAME'
COLUMN objtype_plus_show_recyc    FORMAT a12 HEADING 'OBJECT TYPE'
COLUMN droptime_plus_show_recyc   FORMAT a19 HEADING 'DROP TIME'

-- Defaults for SET AUTOTRACE EXPLAIN report
-- These column definitions are only used when SQL*Plus
-- is connected to Oracle 9.2 or earlier.
COLUMN id_plus_exp FORMAT 990 HEADING i
COLUMN parent_id_plus_exp FORMAT 990 HEADING p
COLUMN plan_plus_exp FORMAT a60
COLUMN object_node_plus_exp FORMAT a8
COLUMN other_tag_plus_exp FORMAT a29
COLUMN other_plus_exp FORMAT a44

-- Default for XQUERY
COLUMN result_plus_xquery HEADING 'Result Sequence'

-- USER DEFINE 2018-07-26
SET    LINESIZE    150
SET    PAGESIZE     25
SET    AUTOCOMMIT  OFF

COLUMN TNAME             FORMAT A30
COLUMN TABLE_NAME        FORMAT A30
COLUMN COLUMN_NAME       FORMAT A20

COLUMN DEPT_ID           FORMAT A8
COLUMN DEPT_NAME         FORMAT A16
COLUMN DEPT_TEL          FORMAT A12
COLUMN TITLE             FORMAT A16
COLUMN �����            FORMAT A16
COLUMN NAME              FORMAT A8
COLUMN POSITION          FORMAT A10
COLUMN TELEPHONE         FORMAT A13
COLUMN EMAIL             FORMAT A20
COLUMN DUTY              FORMAT A10
COLUMN ID_NUMBER         FORMAT A14
COLUMN Student_ID        FORMAT A10
COLUMN CONSTRAINT_NAME   FORMAT A20
COLUMN SEARCH_CONDITION  FORMAT A57
COLUMN USER_NAME         FORMAT A20
COLUMN SESSIONTIMEZONE   FORMAT A16
COLUMN CURRENT_TIMESTAMP FORMAT A40
COLUMN ������            FORMAT A20
COLUMN I_Date            FORMAT A10
COLUMN ������ȭ��        FORMAT A20

COLUMN PRODUCT_NAME      FORMAT A14
COLUMN PRODUCT_CODE      FORMAT A12
COLUMN STANDARD          FORMAT A12
COLUMN UNIT              FORMAT A6
COLUMN COMPANY           FORMAT A10
COLUMN IMAGENAME         FORMAT A12
COLUMN INFO              FORMAT A25
COLUMN DETAIL_INFO       FORMAT A20
COLUMN USERID            FORMAT A10
COLUMN REGIST_NO         FORMAT A14
COLUMN ����              FORMAT A6
COLUMN ���ԱⰣ          FORMAT A15
COLUMN ORDER_NO          FORMAT A12
COLUMN ORDER_ID          FORMAT A10
COLUMN CSEL              FORMAT A10
COLUMN ETC               FORMAT A10
COLUMN ADDRESS           FORMAT A20
COLUMN �ܰ�              FORMAT A20
COLUMN 10%���εȱݾ�     FORMAT A20
COLUMN ����ó            FORMAT A20
COLUMN CURRENT_TIMESTAMP FORMAT A35
COLUMN ������          FORMAT A10
COLUMN �ֹ���ǰ          FORMAT A20
COLUMN �ܰ�              FORMAT L99,999,999
COLUMN �ֹ��ݾ�          FORMAT L99,999,999
COLUMN �����հ�          FORMAT L999,999,999
COLUMN �����ݾ�          FORMAT L999,999,999
COLUMN �����ִ�ݾ�      FORMAT L999,999,999
COLUMN �Ǹűݾװ�        FORMAT L999,999,999
COLUMN ����              FORMAT A15
COLUMN �Ҽ�              FORMAT A20
COLUMN B_NAME            FORMAT A10
COLUMN B_TITLE           FORMAT A10
COLUMN B_CONTENT         FORMAT A30
COLUMN INDEX_NAME        FORMAT A30
COLUMN COLUMN_NAME       FORMAT A15
COLUMN Info              FORMAT A40

COLUMN PLAN              FORMAT A50
COLUMN OBJECT_NAME       FORMAT A30
COLUMN OBJECT_TYPE       FORMAT A15
COLUMN BYTES             FORMAT 9999999999
COLUMN COST              FORMAT 9999999
COLUMN PARTITION_START   FORMAT A20
COLUMN PARTITION_STOP    FORMAT A20
COLUMN PARAMETER         FORMAT A40
COLUMN VALUE             FORMAT A10
COLUMN ���              FORMAT A40
COLUMN ������            FORMAT A14
COLUMN ���              FORMAT 9999
COLUMN ����              FORMAT 9999
COLUMN Trigger_Name      FORMAT A21
COLUMN Table_Owner       FORMAT A8
COLUMN Triggering_Event  FORMAT A9
COLUMN Trigger_type      FORMAT A15
COLUMN LINE              FORMAT 9999
COLUMN TEXT              FORMAT A60

