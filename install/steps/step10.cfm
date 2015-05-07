<cfoutput>
<!---\\ Step 10: Write Site Configuration // --->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
     <tr>
       <td height="24" colspan="3" background="assets/install_wiz_r2_c8.jpg" class="style1"><b>Step 00#url.step#: #step_description# </b></td>
       </tr>
     <tr>
       <td width="2%">&nbsp;</td>
       <td width="96%">
        <form name="step10" action="?step=11" method="post">
              <!---\\ Configurables from Steps 2 //--->
       <input type="hidden" name="site_domain" value="#form.site_domain#" />
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
       <!---\\ From Step 7 //--->
       <cfif isDefined('form.username')>
       <input type="hidden" name="username" value="#form.username#">
       <input type="hidden" name="password" value="#form.password#" />
       <input type="hidden" name="name" value="#form.name#" />
       </cfif>
       <!---\\ End of Configurables //--->
      </form>
       Please Wait as We write your Database Configuration...<br />
             <center>
<script type="text/javascript">
var bar1= createBar(300,10,'white',1,'black','##033364',85,7,10,"");
</script>
</center>
<cfset dest_dir ="#form.site_location#functions\">
<cfset dsn_content = "<cfset datasrc='#form.datasrc#'>">
<cffile action="write" file="#GetTempDirectory()#webos_dsn.cfm" output="#dsn_content#">
<cffile action ="move" source = "#GetTempDirectory()#webos_dsn.cfm" destination = "#dest_dir#" nameconflict="overwrite">

<hr />
Please Wait as we update and save your System Configuration...<br />
 <center>
<script type="text/javascript">
var bar2= createBar(300,10,'white',1,'black','##033364',85,7,10,"");
</script>
</center>
<!---\\ Inserts Configuration Values //--->
<cftransaction>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.site_license#' where configuration_key ='site_license'
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.site_name#' where configuration_key ='site_name'
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.site_type#' where configuration_key ='site_type'
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.site_admin_dir#' where configuration_key ='site_admin_dir'
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.site_modules_dir#' where configuration_key ='site_modules_dir'
</cfquery>
<cfif form.db_type EQ "mssql">
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.site_location#' where configuration_key ='site_location'
</cfquery>
<cfelseif form.db_type EQ "mysql">
<!---<cfset site_location = #rereplace (cgi.QUERY_STRING,"[\]","\\","ALL")#>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.site_location#' where configuration_key ='site_location'
</cfquery>--->

</cfif>

<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.client_name#' where configuration_key ='client_name'
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.site_email#' where configuration_key ='site_email'
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.datasrc#' where configuration_key ='datasrc'
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.db_type#' where configuration_key ='db_type'
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.site_template#' where configuration_key ='site_template'
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.site_header#' where configuration_key ='site_header'
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.site_footer#' where configuration_key ='site_footer'
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.site_width#' where configuration_key ='site_width'
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.left_col_active#' where configuration_key ='left_col_active'
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.left_col_width#' where configuration_key ='left_col_width'
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.right_col_active#' where configuration_key ='right_col_active'
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.right_col_width#' where configuration_key ='right_col_width'
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.site_header_dir#' where configuration_key ='site_header_dir'
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.site_footer_dir#' where configuration_key ='site_footer_dir'
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.site_template_dir#' where configuration_key ='site_template_dir'
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.site_assets_dir#' where configuration_key ='site_assets_dir'
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.site_scripts_dir#' where configuration_key ='site_scripts_dir'
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.site_styles_dir#' where configuration_key ='site_styles_dir'
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.site_side_boxes#' where configuration_key ='site_side_boxes'
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.site_domain#' where configuration_key ='site_domain'
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.site_mail_server#' where configuration_key ='site_mail_server'
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
update webos_config set configuration_value = '#form.site_folder#' where configuration_key ='site_folder'
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
insert into webos_config (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight) VALUES ('Show Company Information','inquiry_show_info','1','Enables/Disables the Company Information View on the Contact Page','SYSTEM','0')
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
insert into webos_config (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight) VALUES ('Enable Dynamic Page Titles','show_page_titles','1','Enables display of Page Titles in your Browser','SYSTEM','0')
</cfquery>
<cfquery name="insert_config" datasource="#form.datasrc#">
insert into webos_config (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight) VALUES ('View Page Rank','view_page_rank','0','Enables/Disables Page Rank Viewing on the Admin Main Page and Configuration Page','SYSTEM','0')
</cfquery>
<cfif #form.site_template# EQ "WebOS-Platinum">
<cfquery name="insert_config" datasource="#form.datasrc#">
insert into webos_config (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight) VALUES ('CSS-BASED Template','css_template','1','Configures the System to work in Pure-CSS Mode','SYSTEM','0')
</cfquery>
<cfelseif #form.site_template# NEQ "WebOS-Platinum">
<cfquery name="insert_config" datasource="#form.datasrc#">
insert into webos_config (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight) VALUES ('CSS-BASED Template','css_template','0','Configures the System to work in Pure-CSS Mode','SYSTEM','0')
</cfquery>
</cfif>
<cfquery name="insert_config" datasource="#form.datasrc#">
insert into webos_config (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight) VALUES ('Center Column Width (CSS-Templates ONLY)','center_col_width','580','The width of the Center Column<br>(CSS-Based Templates only)','TEMPLATES','0')
</cfquery>
</cftransaction>
<hr />
Please Wait as we update and save your Modules Configuration...<br />
 <center>
<script type="text/javascript">
var bar3= createBar(300,10,'white',1,'black','##033364',85,7,10,"");
</script>
</center>
<cfif form.db_type EQ "mssql">
<cfinclude template="step10_mssql.cfm">
<cfelseif form.db_type EQ "mysql">
<cfinclude template="step10_mysql.cfm">
</cfif>

       <table border="0" align="right" cellpadding="0" cellspacing="0" class="ButtonTable">
  <tr>
    <td width="7" height="20"><img src="assets/button/button_left.gif" width="7" height="20" /></td>
    <td height="20" class="Button"><a href="javascript: document.step10.submit();" class="Button">Finalize Installation >></a></td>
    <td width="7" height="20"><img src="assets/button/button_right.gif" width="7" height="20" /></td>
  </tr>
</table>
</td>
       <td width="2%">&nbsp;</td>
     </tr>
   </table>
   </cfoutput>