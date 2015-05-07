<!---\\ This Query is for the Pages Menu in either the Left or Right Column //--->
<CFQUERY NAME="pages_menu" datasource="#datasrc#">
   SELECT * FROM  #table_pages# where page_status ='1' and page_in_menu ='1'
</CFQUERY>