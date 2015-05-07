<!---\\ Module Configuration //--->
<cfset module ="banners">
<!---\\ End of Module Configuration //---->

<!---<!--- Start Query Banner DB --->
<cfquery datasource="#datasrc#" name="banner">
select * from #table_banners#
order by ID desc
</cfquery>
<!--- End Query Banner DB --->--->

<cfif banner.recordcount EQ "0">
<!---No Banners to Display--->
<cfelseif banner.recordcount NEQ "0">
<!--- Start Weighting and Rand Num. --->
<!--- This starts your list for all the numbers to pick from --->
<cfset prodlist="">
<!--- <!-- ap debug -->
<cfdump var="#banner#"><cfabort> --->

<!--- Telling it to output the data your queried --->
<cfoutput query="banner">
<!--- Creating a counter --->
<cfset x=1>
<!--- Starting the loop --->
<cfloop index="x" from="1" to="#banner_weight#">

<!--- Adding one to the counter --->
<cfset x=x+1>
<!--- The end of the looping --->
</cfloop>
<!--- End of the data query --->
</cfoutput>

<cfset magicnum=banner.id>
<!--- End Weighting and Rand Num. --->

<!--- This queries the specific banner --->
<cfquery datasource="#datasrc#" name="views">
select *
from #table_banners#
where id = #magicnum#
</cfquery>
<!--- start Adds 1 to view --->
<cfoutput query="views">
<CFSET add = #banner.ban_views# + 1>
<CFQUERY datasource="#datasrc#" name="UpdateView">
UPDATE #table_banners# Set ban_views = #add# where ID = #id#
</cfquery>
</cfoutput>
<!--- End Adds 1 to view --->

<cfoutput query="views">

 <A HREF="?module=banners&ID=#magicnum#&redirect" TARGET="_blank">
    <IMG SRC="http://#site_domain##site_folder#modules/banners/banners/#banner_pic#" alt="#banner_alt#" width="468" height="60" vspace="5" border="0" align="top" ></A>

</cfoutput>
<cfif isDefined('url.redirect')>
<!--- Query Banners To Get ID to specify Redirection URL --->
<CFQUERY DATASOURCE="#datasrc#" NAME="Banners">
SELECT *
FROM #table_banners#
WHERE ID = #ID#
</CFQUERY>

<!--- Add One To Click --->
<CFSET add = #incrementvalue(val(Banners.ban_CLICKS))#>
<CFQUERY datasource="#datasrc#" name="UpdateView">
UPDATE #table_banners# Set ban_clicks = #add# where ID = #ID#
</cfquery>

<!--- Go To URL for that Banner --->
<CFOUTPUT QUERY="Banners">
<CFLOCATION URL="http://#Banners.banner_url#">
</CFOUTPUT>
</cfif>
</cfif>
