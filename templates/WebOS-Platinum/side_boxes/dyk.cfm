<cfset current_box ="dyk.cfm">
<cfquery datasource="#datasrc#" name="detect_column">
select * from #table_sideboxes# where side_box_filename ='#current_box#'
</cfquery>

<div id="login" class="boxed">
<!---\\Box Title//--->
<div class="title"><h2><cfoutput query="detect_column">#side_box_name#</cfoutput></h2>
   
</div> 
<!---\\End box Title//--->
<!---\\Box Content//--->
<div class="content">           
<cfif #con_dyks.dyk_available# EQ "1">
<cfoutput query="get_dyks">
    #dyk_content#<br>
     <cfset views = NumberFormat(#con_dyks.dyk_views#) + 1>
    <cfquery name="views" datasource="#datasrc#">
    update #table_dyk_content# SET dyk_views = <cfqueryPARAM value = "#views#"
   CFSQLType = "CF_SQL_VARCHAR"> where dyk_id = <cfqueryPARAM value = "#con_dyks.dyk_id#"
   CFSQLType = "CF_SQL_INTEGER">
    </cfquery>
    </cfoutput>
</cfif>
</div>
<!---\\end Box Content//--->
</div>