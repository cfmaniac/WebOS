<!-- ap change typo -->
<cfif #db_type# EQ "mssql">
<cfquery name="spotlight_setup" datasource="#datasrc#">
SELECT TOP 4 spotlight_time_sensitive, spotlight_start, spotlight_expire from #table_spots# WHERE spotlight_expire >='#dateformat(now(), "MM/DD/YYYY")#'
</cfquery>   
<cfelseif #db_type# EQ "mysql">
<cfquery name="spotlight_setup" datasource="#datasrc#">
SELECT spotlight_time_sensitive, spotlight_start, spotlight_expire from #table_spots# WHERE spotlight_expire >='#dateformat(now(), "MM/DD/YYYY")#' Limit 4
</cfquery> 
</cfif>
<!-- ap debug -->
<!--- <cfdump var="#spotlight_setup#"><cfabort> --->
<cfif spotlight_setup.spotlight_time_sensitive eq "1">
<cfif #db_type# EQ "mssql">
<!-- ap spotlight expire typo-->
<cfquery name="getspots" datasource="#datasrc#">
SELECT TOP 4 spotlight_id, spotlight_title, spotlight_description,  spotlight_time_sensitive, spotlight_start, spotlight_expire
FROM #table_spots# WHERE spotlight_expire between '#dateformat(now(), "MM/DD/YYYY")#' and '#spotlight_setup.spotlight_expire#'
ORDER BY NEWID()    
</cfquery>
<cfelseif #db_type# EQ "mysql">
<cfquery name="getspots" datasource="#datasrc#">
SELECT * spotlight_id, spotlight_title, spotlight_description,  spotlight_time_sensitive, spotlight_starts, spotlight_expires
FROM #table_spots# WHERE spotlight_expires between '#dateformat(now(), "MM/DD/YYYY")#' and '#spotlight_setup.spotlight_expires#'
ORDER BY dyk_id Limit 4    
</cfquery>
</cfif>
<cfelse>      
<cfif #db_type# EQ "mssql">   
<cfquery name="getspots" datasource="#datasrc#">
SELECT TOP 4 spotlight_id, spotlight_title, spotlight_description, spotlight_time_sensitive FROM #table_spots#
ORDER BY NEWID()    
</cfquery>
<cfelseif #db_type# EQ "mysql">
 <cfquery name="getspots" datasource="#datasrc#">
SELECT spotlight_id, spotlight_title, spotlight_description, spotlight_time_sensitive FROM #table_spots#
ORDER BY spotlight_id Limit 4    
</cfquery>
</cfif>
</cfif>           