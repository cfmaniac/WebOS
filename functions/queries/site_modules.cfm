<!---\\Find sout Which Modules are Loaded//--->
<cfquery name="main_modules" datasource="#datasrc#">
select * from #table_mods# where module_installed ='1' Order BY module_id ASC      
</cfquery>

<!--- ap --->
<!--- <cfdump var="#main_modules#"><cfabort> --->

<!---\\Query for Analytics Module//--->
<cfif module_analytics EQ "1">
<cfinclude template="module_analytics.cfm">
</cfif>

<!---\\Query for Our Articles Module//--->
<cfif module_articles EQ "1">
<cfinclude template="module_articles.cfm">
</cfif>

<!---\\Query for Banners Module//--->
<cfif module_banners EQ "1">
<cfinclude template="module_banners.cfm">
</cfif>

<!---\\Query for the Blog Module//--->
<cfif module_blog EQ "1">
<cfinclude template="module_blog.cfm">
</cfif>

<!---\\Query for Did You Know Module//--->
<cfif module_didyouknow EQ "1">
<cfinclude template="module_dyk.cfm">
</cfif>

<!---\\Query for Forum Module//--->

<!---\\Query for Inquiry Form Module//--->
<cfif module_inquiry EQ "1">
<cfinclude template="module_inquiry.cfm">
</cfif>


<!---\\Query for Links Module//--->
<cfif module_links EQ "1">
<cfinclude template="module_linksdirectory.cfm">
</cfif>

<!---\\Query for Main Page Module//--->
<cfif module_mainpage EQ "1">
<cfinclude template="module_mainpage.cfm">
</cfif>

<!---\\Query for Newsletter Module//--->
<cfif module_newsletter EQ "1">
<cfinclude template="module_newsletters.cfm">
</cfif>

<!---\\Query for Pages Module//--->
<cfif module_pages EQ "1">
<cfinclude template="module_pages.cfm">    
</cfif>

<!---\\Query for PodCast Module//--->
<cfif module_podcasts EQ "1">
<cfinclude template="module_podcasts.cfm">
</cfif>

<!---\\Query for RSS Feeds Module//--->
<cfif module_rss EQ "1">
<cfinclude template="module_rss.cfm">
</cfif>

<!---\\Query for Site Search Module//--->
<cfif module_sitesearch EQ "1">
<cfinclude template="module_sitesearch.cfm">
</cfif>

<!---\\Query Spotlights Module//--->
<cfif module_spotlights EQ "1">
<cfinclude template="module_spotlights.cfm"> 
</cfif>

