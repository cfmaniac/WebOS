<CFQUERY NAME="get_analytics" datasource="#datasrc#">
   SELECT analytics_key
   FROM    #table_analytics#
</CFQUERY>