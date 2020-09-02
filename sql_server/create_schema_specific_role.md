# Create a role that gives a user permissions on a specific schema.

Creates a role named 'SpecificSchemaSuperPowers'

That gives specific permissions (ALTER, DELETE, EXECUTE, INSERT, REFERENCES, SELECT, UPDATE, VIEW DEFINITION) on a specific schema 'SpecificSchema' 

(And adds a particular user (AD\BambrickL) to that role)

as follows:

    CREATE ROLE SpecificSchemaSuperPowers AUTHORIZATION dbo;

    GRANT ALTER, DELETE, EXECUTE, INSERT, REFERENCES, SELECT,
              UPDATE, VIEW DEFINITION ON SCHEMA::SpecificSchema TO SpecificSchemaSuperPowers;

    EXEC sp_addrolemember 'SpecificSchemaSuperPowers', 'AD\BambrickL';


For a "reporting-only" role, on a single schema called MyReportingSchema...


    CREATE ROLE ReportingRole AUTHORIZATION dbo;

    GRANT EXECUTE, REFERENCES, SELECT,
              VIEW DEFINITION ON SCHEMA::MyReportingSchema TO ReportingRole;


Then add the relevant group or user to that role:


    EXEC sp_addrolemember 'ReportingRole', 'AD\ReportingUser';



## See also

- [Create Schema with Authorization](Create_Schema_Authorization.md)