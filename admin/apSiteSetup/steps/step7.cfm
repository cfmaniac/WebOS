<!---
 Mod By : AP
 Mod : SiteID to Query's Where Clause
CFDirectory on #form.site_folder# Done
Will also have to copy the entire "modules" folder into this new directory, as well as "templates," and, I'm pretty sure, Application.cfm to winxp.gif.
--->

<cfdirectory action="create" directory="c:\inetpub\wwwroot\#form.site_folder#">


<cfinclude template="directoryCopy.cfm">
<cfset directoryCopy("c:\inetpub\wwwroot\modules", "c:\inetpub\wwwroot\#form.siteFolder#\modules") />
<cfset directoryCopy("c:\inetpub\wwwroot\templates", "c:\inetpub\wwwroot\#form.siteFolder#\templates") />
<cfset directoryCopy("c:\inetpub\wwwroot\functions", "c:\inetpub\wwwroot\#form.siteFolder#\functions") />


<cffile action="copy" source="c:\inetpub\wwwroot\application.cfm" destination="c:\inetpub\wwwroot\#form.siteFolder#\application.cfm">
<cffile action="copy" source="c:\inetpub\wwwroot\diagnostics.cfm" destination="c:\inetpub\wwwroot\#form.siteFolder#\diagnostics.cfm">
<cffile action="copy" source="c:\inetpub\wwwroot\find_templates.cfm" destination="c:\inetpub\wwwroot\#form.siteFolder#\find_templates.cfm">
<cffile action="copy" source="c:\inetpub\wwwroot\index.cfm" destination="c:\inetpub\wwwroot\#form.siteFolder#\index.cfm">


<cfoutput>
<!---\\ Step 7: Database Creation //--->
<cfset form.siteID=CreateUUID()>
<cfset session.newSiteID=form.siteID>


  <form name="step7" action="?step=7&sql=insert" method="post">
   <input type="hidden" name="site_domain" value="#form.site_domain#"/>
       <input type="hidden" name="siteID" value="#form.siteID#" />  
       <input type="hidden" name="site_folder" value="#form.site_folder#" />
       <input type="hidden" name="site_name" value="#form.site_name#" />
       <input type="hidden" name="site_mail_server" value="#form.site_mail_server#" />
       <input type="hidden" name="site_email" value="#form.site_email#" />
       <input type="hidden" name="site_license" value="#form.site_license#" />
       <input type="hidden" name="site_type" value="#form.site_type#" />
       <input type="hidden" name="site_location" value="#form.site_location#" />
       <input type="hidden" name="client_name" value="#form.client_name#" />
       <input type="hidden" name="client_email" value="#form.client_email#" />
       <!---\\ From Step 3 //--->
       <input type="hidden" name="site_template" value="#form.site_template#" />
       <input type="hidden" name="site_template_dir" value="#form.site_template_dir#" />
       <input type="hidden" name="site_admin_dir" value="#form.sitE_admin_dir#" />
       <input type="hidden" name="site_modules_dir" value="#form.site_modules_dir#" />
       <input type="hidden" name="site_assets_dir" value="#form.site_assets_dir#" />
       <input type="hidden" name="site_header" value="#form.site_header#" />
       <input type="hidden" name="site_footer" value="#form.site_footer#" />
       <input type="hidden" name="site_width" value="#form.sitE_width#" />
       <input type="hidden" name="left_col_active" value="#form.left_col_active#" />
       <input type="hidden" name="left_col_width" value="#form.left_col_width#" />
       <input type="hidden" name="site_side_boxes" value="#form.site_side_boxes#" />
       <input type="hidden" name="right_col_active" value="#form.right_col_active#" />
       <input type="hidden" name="right_col_width" value="#form.right_col_width#" />

       <input type="hidden" name="site_header_dir" value="#form.site_header_dir#" />
       <input type="hidden" name="site_footer_dir" value="#form.site_footer_dir#" />
       <input type="hidden" name="site_scripts_dir" value="#form.site_scripts_dir#" />
       <input type="hidden" name="site_style_sheet" value="#form.site_style_sheet#" />
       <input type="hidden" name="site_styles_dir" value="#form.site_styles_dir#" />
       <input type="hidden" name="template_file" value="#form.template_file#" />
       <!---\\ From Step 4 //--->
       <input type="hidden" name="analytics" value="#form.analytics#" />
       <input type="hidden" name="articles" value="#form.articles#" />
       <input type="hidden" name="banners"  value="#form.banners#"/>
       <input type="hidden" name="blog" value="#form.blog#" />
       <input type="hidden" name="breadcrumbs" value="#form.breadcrumbs#" />
       <input type="hidden" name="chat" value="#form.chat#" />
       <input type="hidden" name="didyouknow"  value="#form.didyouknow#"/>
       <input type="hidden" name="forum" value="#form.forum#" />
       <input type="hidden" name="inquiry" value="#form.inquiry#" />
       <input type="hidden" name="links" value="#form.links#" />
       <input type="hidden" name="mainpage" value="#form.mainpage#" />
       <input type="hidden" name="metatags" value="#form.metatags#" />
       <input type="hidden" name="newsletter" value="#form.newsletter#"/>
       <input type="hidden" name="pages" value="#form.pages#" />
       <input type="hidden" name="podcasts"  value="#form.podcasts#"/>
       <input type="hidden" name="polls"  value="#form.polls#"/>
       <input type="hidden" name="ratesticker"  value="#form.ratesticker#"/>
       <input type="hidden" name="rss" value="#form.rss#" />
       <input type="hidden" name="sefurls"  value="#form.sefurls#"/>
       <input type="hidden" name="sitemap"  value="#form.sitemap#"/>
       <input type="hidden" name="sitesearch"  value="#form.sitesearch#"/>
       <input type="hidden" name="spotlights"  value="#form.spotlights#"/>
       <input type="hidden" name="stockticker"  value="#form.stockticker#"/>
       <input type="hidden" name="tellafriend"  value="#form.tellafriend#"/>
       <input type="hidden" name="users" value="#form.users#" />
	   <!---\\ From Step 5 //--->
       <input type="hidden" name="datasrc" value="#form.datasrc#" />
       <input type="hidden" name="db_type" value="#form.db_type#" />
  </form>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" colspan="3" background="assets/install_wiz_r2_c8.jpg" class="style1"><b>Step 00#url.step#: #step_description# </b></td>
    </tr>
    <tr>
      <td width="2%">&nbsp;</td>
      <td width="96%" valign="top">


<cfif not isDefined('url.sql') or isDefined('url.sql') and #url.sql# EQ "">
 Please Wait as We Begin Creating your Database Tables...<br />
      <center>
<script type="text/javascript">
var bar1= createBar(300,10,'white',1,'black','##033364',85,7,10,"");
</script>
</center>
<!--- <cfif #form.db_type# EQ "mssql">
<cfinclude template="step7_mssql.cfm">
<cfelseif #form.db_type# EQ "mysql">
<cfinclude template="step7_mysql.cfm">
</cfif> --->

 <table border="0" align="right" cellpadding="0" cellspacing="0" class="ButtonTable">
  <tr>
    <td width="7" height="20"><img src="assets/button/button_left.gif" width="7" height="20" /></td>
    <td height="20" class="Button"><a href="javascript: document.step7.submit();" class="Button">Populate the Database</a></td>
    <td width="7" height="20"><img src="assets/button/button_right.gif" width="7" height="20" /></td>
  </tr>
</table>

<cfelseif isDefined('url.sql') and #url.sql# EQ "insert">
<form name="step7_5" action="?step=8" method="post">
   <input type="hidden" name="site_domain" value="#form.site_domain#"/>
       <input type="hidden" name="site_folder" value="#form.site_folder#" />
       <input type="hidden" name="site_name" value="#form.site_name#" />
       <input type="hidden" name="site_mail_server" value="#form.site_mail_server#" />
       <input type="hidden" name="site_email" value="#form.site_email#" />
       <input type="hidden" name="site_license" value="#form.site_license#" />
       <input type="hidden" name="site_type" value="#form.site_type#" />
       <input type="hidden" name="site_location" value="#form.site_location#" />
       <input type="hidden" name="client_name" value="#form.client_name#" />
       <input type="hidden" name="client_email" value="#form.client_email#" />
       <!---\\ From Step 3 //--->
       <input type="hidden" name="site_template" value="#form.site_template#" />
       <input type="hidden" name="site_template_dir" value="#form.site_template_dir#" />
       <input type="hidden" name="site_admin_dir" value="#form.sitE_admin_dir#" />
       <input type="hidden" name="site_modules_dir" value="#form.site_modules_dir#" />
       <input type="hidden" name="site_assets_dir" value="#form.site_assets_dir#" />
       <input type="hidden" name="site_header" value="#form.site_header#" />
       <input type="hidden" name="site_footer" value="#form.site_footer#" />
       <input type="hidden" name="site_width" value="#form.sitE_width#" />
       <input type="hidden" name="left_col_active" value="#form.left_col_active#" />
       <input type="hidden" name="left_col_width" value="#form.left_col_width#" />
       <input type="hidden" name="site_side_boxes" value="#form.site_side_boxes#" />
       <input type="hidden" name="right_col_active" value="#form.right_col_active#" />
       <input type="hidden" name="right_col_width" value="#form.right_col_width#" />

       <input type="hidden" name="site_header_dir" value="#form.site_header_dir#" />
       <input type="hidden" name="site_footer_dir" value="#form.site_footer_dir#" />
       <input type="hidden" name="site_scripts_dir" value="#form.site_scripts_dir#" />
       <input type="hidden" name="site_style_sheet" value="#form.site_style_sheet#" />
       <input type="hidden" name="site_styles_dir" value="#form.site_styles_dir#" />
       <input type="hidden" name="template_file" value="#form.template_file#" />
       <!---\\ From Step 4 //--->
       <input type="hidden" name="analytics" value="#form.analytics#" />
       <input type="hidden" name="articles" value="#form.articles#" />
       <input type="hidden" name="banners"  value="#form.banners#"/>
       <input type="hidden" name="blog" value="#form.blog#" />
       <input type="hidden" name="breadcrumbs" value="#form.breadcrumbs#" />
       <input type="hidden" name="chat" value="#form.chat#" />
       <input type="hidden" name="didyouknow"  value="#form.didyouknow#"/>
       <input type="hidden" name="forum" value="#form.forum#" />
       <input type="hidden" name="inquiry" value="#form.inquiry#" />
       <input type="hidden" name="links" value="#form.links#" />
       <input type="hidden" name="mainpage" value="#form.mainpage#" />
       <input type="hidden" name="metatags" value="#form.metatags#" />
       <input type="hidden" name="newsletter" value="#form.newsletter#"/>
       <input type="hidden" name="pages" value="#form.pages#" />
       <input type="hidden" name="podcasts"  value="#form.podcasts#"/>
       <input type="hidden" name="polls"  value="#form.polls#"/>
       <input type="hidden" name="ratesticker"  value="#form.ratesticker#"/>
       <input type="hidden" name="rss" value="#form.rss#" />
       <input type="hidden" name="sefurls"  value="#form.sefurls#"/>
       <input type="hidden" name="sitemap"  value="#form.sitemap#"/>
       <input type="hidden" name="sitesearch"  value="#form.sitesearch#"/>
       <input type="hidden" name="spotlights"  value="#form.spotlights#"/>
       <input type="hidden" name="stockticker"  value="#form.stockticker#"/>
       <input type="hidden" name="tellafriend"  value="#form.tellafriend#"/>
       <input type="hidden" name="users" value="#form.users#" />
	   <!---\\ From Step 5 //--->
       <input type="hidden" name="datasrc" value="#form.datasrc#" />
       <input type="hidden" name="db_type" value="#form.db_type#" />
  </form>
Please Wait as we populate the database tables...<br />
      <center>
<script type="text/javascript">
var bar1= createBar(300,10,'white',1,'black','##033364',85,7,10,"");
</script>
</center>
<cfif form.db_type EQ "mssql">
<cfinclude template="step7_insert_mssql.cfm">
<cfelseif form.db_type EQ "mysql">
<cfinclude template="step7_insert_mysql.cfm">
</cfif>
<table border="0" align="right" cellpadding="0" cellspacing="0" class="ButtonTable">
  <tr>
    <td width="7" height="20"><img src="assets/button/button_left.gif" width="7" height="20" /></td>
    <td height="20" class="Button"><a href="javascript: document.step7_5.submit();" class="Button">Step 8 >></a></td>
    <td width="7" height="20"><img src="assets/button/button_right.gif" width="7" height="20" /></td>
  </tr>
</table>
</cfif>
</td>
</tr>
</table>
</cfoutput>