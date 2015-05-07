<CFQUERY NAME="search_config" datasource="#datasrc#" maxrows="100">
   SELECT * FROM  #table_site_search# 
</CFQUERY>