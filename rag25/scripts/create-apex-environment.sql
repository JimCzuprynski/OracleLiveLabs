/*
|| Script:  create_apex_environment.sql
|| Purpose: Creates new APEX workspace and imports RAG application
|| Author:  Jim Czuprynski (Zero Defect Computing, Inc.)
*/

-----
-- Set session environment:
-----
ALTER SESSION SET CONTAINER = freepdb1;
ALTER SESSION SET CURRENT_SCHEMA = APEX_240100;

SET SERVEROUTPUT ON
DECLARE
    workspace_exists PLS_INTEGER := 0;
BEGIN

    -----
    -- Remove workspace, if it exists:
    -----
    BEGIN
        SELECT 1 INTO workspace_exists
          FROM apex_workspaces 
         WHERE workspace = 'RAG';
    
       IF workspace_exists > 0 THEN
            DBMS_OUTPUT.PUT_LINE('RAG workspace exists! It will be removed and replaced.');
            APEX_INSTANCE_ADMIN.REMOVE_WORKSPACE(
                p_workspace => 'RAG'
               ,p_drop_users => 'N'
               ,p_drop_tablespaces => 'N');
       END IF;
    
    
    EXCEPTION
        WHEN NO_DATA_FOUND THEN   
            NULL;
        WHEN OTHERS THEN   
            DBMS_OUTPUT.PUT_LINE('Error checking existence of workspace RAG - investigate immediately: ' || SQLCODE || ' - ' || SQLERRM);

    END;

    -----
    -- Create new RAG workspace, assigning it to HOL23 schema
    -----
    BEGIN
        APEX_INSTANCE_ADMIN.ADD_WORKSPACE (
            p_workspace => 'RAG'
           ,p_primary_schema => 'HOL23'
           ,p_additional_schemas => 'HOL23');

    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error while creating RAG workspace - investigate immediately: ' || SQLCODE || ' - ' || SQLERRM);

    END;

    -----
    -- Create user for new workspace:
    ----
    BEGIN

        APEX_UTIL.SET_WORKSPACE(p_workspace => 'RAG');
        APEX_UTIL.CREATE_USER (
            p_user_name => 'ADMIN'
           ,p_web_password => 'Welcome123#'
           ,p_change_password_on_first_use  => 'N'
           ,p_default_schema => 'HOL23'
           ,p_developer_privs => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL');

    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error while creating ADMIN user for RAG workspace - investigate immediately: ' || SQLCODE || ' - ' || SQLERRM);

    END;

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Unexpected fatal error - investigate immediately: ' || SQLCODE || ' - ' || SQLERRM);

END;
/ 
