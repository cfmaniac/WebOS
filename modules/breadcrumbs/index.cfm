<!---\\Debugging: <cfoutput>#cgi.Script_Name#</cfoutput>--->

<cfif #right(cgi.SCRIPT_NAME, 9)# EQ "index.cfm" or "">
<cf_breadcrumb pageTitle="Home" trail_length="1">
<cfif isDefined('url.module') and #url.module# NEQ "">
   <!---\\ Definitions for Each Module //--->
   <cfif #url.module# EQ "articles">
   <cfif isDefined('url.section') and #url.section# EQ "archives">
   <cf_breadcrumb pageTitle="Articles Archive" trail_length="1">
   <cfelseif NOT isDefined('url.section')>
   <cf_breadcrumb pageTitle="Articles" trail_length="1">
   </cfif>
   <cfelseif #url.module# EQ "blog">
   <cf_breadcrumb pageTitle="Blog" trail_length="1">
   <cfelseif #url.module# EQ "chat">
   <cf_breadcrumb pageTitle="Chat" trail_length="1">
   <cfelseif #url.module# EQ "forum">
   <cf_breadcrumb pageTitle="Forum" trail_length="1">
   <cfelseif #url.module# EQ "gallery">
   <cf_breadcrumb pageTitle="Image Gallery" trail_length="1">
   <cfelseif #url.module# EQ "inquiry">
   <cf_breadcrumb pageTitle="Contact Us" trail_length="1">
   <cfelseif #url.module# EQ "links">
   <cf_breadcrumb pageTitle="Link Directory" trail_length="1">
   <cfelseif #url.module# EQ "news">
   <cf_breadcrumb pageTitle="News" trail_length="1">
   <cfelseif #url.module# EQ "newsletter">
   <cfif isDefined('url.section') and #url.section# EQ "newsletter_archives">
   <cf_breadcrumb pageTitle="Newsletters Archive" trail_length="1">
   <cfelseif NOT isDefined('url.section')>
   <cf_breadcrumb pageTitle="Newsletters" trail_length="1">
   </cfif>
   <cfelseif #url.module# EQ "pages">
   <CFQUERY NAME="pages_content" datasource="#datasrc#">
   SELECT page_title FROM  #table_pages# where page_id='#url.pageid#'
   </CFQUERY>
   <cf_breadcrumb pageTitle="#pages_content.page_title#" trail_length="1">
    <cfelseif #url.module# EQ "podcasts">
   <cf_breadcrumb pageTitle="Media :: Podcasts" trail_length="1">
    <cfelseif #url.module# EQ "polls">
   <cf_breadcrumb pageTitle="Polls" trail_length="1">
    <cfelseif #url.module# EQ "ratesticker">
   <cf_breadcrumb pageTitle="Rates Information" trail_length="1">
    <cfelseif #url.module# EQ "rss">
   <cf_breadcrumb pageTitle="RSS Feeds" trail_length="1">
    <cfelseif #url.module# EQ "sitemap">
   <cf_breadcrumb pageTitle="Site Map" trail_length="1">
   <cfelseif #url.module# EQ "sitesearch">
   <!---<cf_breadcrumb pageTitle="Site Search Results for Term: <cfif isDefined('form.keywords')>#form.keywords#" trail_length="1">--->
   <cfif NOT isDefined('form.keywords')> 
   <cf_breadcrumb pageTitle="Start your Search Here" trail_length="1">
   <cfelseif isDefined('form.keywords')>
   <cf_breadcrumb pageTitle="Site Search Results for Term: #form.keywords#" trail_length="1">
   </cfif>
    <cfelseif #url.module# EQ "stockticker">
   <cf_breadcrumb pageTitle="Streaming Stock Quotes" trail_length="1">
    <cfelseif #url.module# EQ "taxforms">
   <cf_breadcrumb pageTitle="TaxForms Library" trail_length="1">
    <cfelseif #url.module# EQ "tellafriend">
   <cf_breadcrumb pageTitle="Tell-A-Friend about <cfoutput>#site_name#</cfoutput>" trail_length="1">
   <cfelseif #url.module# EQ "users">
   <cfif isDefined('url.action') and #url.action# EQ "update">
      <cf_breadcrumb pageTitle="Update your Profile" trail_length="1">
   <cfelseif isDefined('url.action') and #url.action# EQ "register">
     <cf_breadcrumb pageTitle="Create a Profile" trail_length="1">
   <cfelseif isDefined('url.action') and #url.action# EQ "subscriptions">
   <cf_breadcrumb pageTitle="Managing your Subscriptions" trail_length="1">
   <cfelseif NOT isDefined('url.section')>
   <cf_breadcrumb pageTitle="Login" trail_length="1">
   </cfif>
    <cfelseif #url.module# EQ "zipsearch">
   <cf_breadcrumb pageTitle="ZipCode Search Results for Zip Code:: <cfoutput>#form.zip#</cfoutput>" trail_length="1">
   </cfif>
  </cfif> 
</cfif>