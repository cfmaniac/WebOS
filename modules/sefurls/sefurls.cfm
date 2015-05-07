<cfset urlstring = cgi.path_info>
<cfloop from="1" to=#ListLen(urlstring,"/")# index="i">
<cfif i mod 2>
<cfset paramName = "URL." & ListGetAt(urlstring,i,"/")>
<cfelse>
<cfparam name="#paramName#" default="#ListGetAt(urlstring,i,"/")#">
</cfif>
</cfloop>

<cfif cgi.QUERY_STRING contains "=">
<cfset moveUrl = #rereplace (cgi.QUERY_STRING,"[=?&]","/","ALL")#>
<cfset newUrl = #cgi.path_info# & "/" & #moveUrl#>
<cfheader statuscode="301" statustext="Moved permanently">
<cfheader name="Location" value="#newUrl#">
</cfif>
