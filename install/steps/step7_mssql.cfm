<!--Sucessfully Loaded the MSSQL Creation Script -->
<cftransaction>
<!---\\ We had originally had all of these in one file, however the single query was too large to run, so we broke the create tables .sql file into separate files //--->

<cffile action="read" file="#form.site_location#\db\#form.db_type#\admin_news.sql" variable="adminnews_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#adminnews_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\#form.db_type#\admins.sql" variable="admins_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#admins_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\#form.db_type#\analytics.sql" variable="analytics_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#analytics_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\#form.db_type#\articles.sql" variable="articles_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#articles_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\#form.db_type#\banners.sql" variable="banners_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#banners_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\#form.db_type#\blog.sql" variable="blog_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#blog_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\#form.db_type#\chat.sql" variable="chat_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#chat_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\#form.db_type#\config.sql" variable="config_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#config_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\#form.db_type#\dyk.sql" variable="dyk_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#dyk_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\#form.db_type#\forum.sql" variable="forum_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#forum_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\#form.db_type#\inquiry.sql" variable="inquiry_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#inquiry_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\#form.db_type#\links.sql" variable="links_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#links_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\#form.db_type#\mainpage.sql" variable="mainpage_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#mainpage_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\#form.db_type#\metatags.sql" variable="metatags_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#metatags_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\#form.db_type#\modules.sql" variable="modules_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#modules_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\#form.db_type#\newsletters.sql" variable="newsletters_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#newsletters_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\#form.db_type#\pages.sql" variable="pages_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#pages_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\#form.db_type#\podcasts.sql" variable="podcasts_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#podcasts_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\#form.db_type#\polls.sql" variable="polls_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#polls_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\#form.db_type#\rss.sql" variable="rss_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#rss_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\#form.db_type#\stocks.sql" variable="stock_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#stock_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\#form.db_type#\taxes.sql" variable="tax_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#tax_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\#form.db_type#\sitesearch.sql" variable="sitesearch_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#sitesearch_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\#form.db_type#\spotlights.sql" variable="spotlights_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#spotlights_sql#
</cfquery>
<cffile action="read" file="#form.site_location#\db\#form.db_type#\users.sql" variable="users_sql" >
<cfquery name="create_tables" datasource="#form.datasrc#">
#users_sql#
</cfquery>
</cftransaction>