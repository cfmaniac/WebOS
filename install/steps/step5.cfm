<cfoutput>
<!---\\ Step 5: Database and DSN //--->
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
     <tr>
       <td height="24" colspan="3" background="assets/install_wiz_r2_c8.jpg" class="style1"><b>Step 00#url.step#: #step_description# </b></td>
       </tr>
     <tr>
       <td width="2%">&nbsp;</td>
       <td width="96%">This Section of the installer will now Configure your Database/DSN Settings.<br />
         <br />
         <u><strong>Please Note:</strong></u> When Specifying your DSN here, it Has to exist in the CF Admin Datasources Section. this Script Does Not Create Datasources.
         <hr />
       <form name="step5" action="?step=6" method="post">
       <!---\\ Configurables from Steps 2 & 3 //--->
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
       <!---\\ From Step 4: Modules //--->
       <input type="hidden" name="analytics" <cfif isDefined('form.analytics')>value="#form.analytics#" /><cfelseif NOT isdefined('form.analytics')> value="0"/></cfif>
       <input type="hidden" name="articles" <cfif isDefined('form.articles')>value="#form.articles#" /><cfelseif NOT isdefined('form.articles')> value="0"/></cfif>
       <input type="hidden" name="banners" <cfif isDefined('form.banners')>value="#form.banners#" /><cfelseif NOT isdefined('form.banners')> value="0"/></cfif>
       <input type="hidden" name="blog" <cfif isDefined('form.blog')>value="#form.blog#" /><cfelseif NOT isdefined('form.blog')> value="0"/></cfif>
       <input type="hidden" name="breadcrumbs" <cfif isDefined('form.breadcrumbs')>value="#form.breadcrumbs#" /><cfelseif NOT isdefined('form.breadcrumbs')> value="0"/></cfif>
       <input type="hidden" name="chat" <cfif isDefined('form.chat')>value="#form.chat#" /><cfelseif NOT isdefined('form.chat')> value="0"/></cfif>
       <input type="hidden" name="didyouknow" <cfif isDefined('form.didyouknow')>value="#form.didyouknow#" /><cfelseif NOT isdefined('form.didyouknow')> value="0"/></cfif>
       <input type="hidden" name="forum" <cfif isDefined('form.forum')>value="#form.forum#" /><cfelseif NOT isdefined('form.forum')> value="0"/></cfif>
       <input type="hidden" name="inquiry" <cfif isDefined('form.inquiry')>value="#form.inquiry#" /><cfelseif NOT isdefined('form.inquiry')> value="0"/></cfif>
       <input type="hidden" name="links" <cfif isDefined('form.links')>value="#form.links#" /><cfelseif NOT isdefined('form.analytics')> value="0"/></cfif>
       <input type="hidden" name="mainpage" <cfif isDefined('form.mainpage')>value="#form.mainpage#" /><cfelseif NOT isdefined('form.mainpage')> value="0"/></cfif>
       <input type="hidden" name="metatags" <cfif isDefined('form.metatags')>value="#form.metatags#" /><cfelseif NOT isdefined('form.metatags')> value="0"/></cfif>
       <input type="hidden" name="newsletter" <cfif isDefined('form.newsletter')>value="#form.newsletter#"/> <cfelseif NOT isdefined('form.newsletter')> value="0"/></cfif>
       <input type="hidden" name="pages" <cfif isDefined('form.pages')>value="#form.pages#" /><cfelseif NOT isdefined('form.pages')> value="0"/></cfif>
       <input type="hidden" name="podcasts" <cfif isDefined('form.podcasts')>value="#form.podcasts#" /><cfelseif NOT isdefined('form.podcasts')> value="0"/></cfif>
       <input type="hidden" name="polls" <cfif isDefined('form.polls')>value="#form.polls#" /><cfelseif NOT isdefined('form.polls')> value="0"/></cfif>
       <input type="hidden" name="ratesticker" <cfif isDefined('form.ratesticker')>value="#form.ratesticker#" /><cfelseif NOT isdefined('form.ratesticker')> value="0"/></cfif>
       <input type="hidden" name="rss" <cfif isDefined('form.rss')>value="#form.rss#" /><cfelseif NOT isdefined('form.rss')> value="0"/></cfif>
       <input type="hidden" name="sefurls" <cfif isDefined('form.sefurls')>value="#form.sefurls#" /><cfelseif NOT isdefined('form.sefurls')> value="0"/></cfif>
       <input type="hidden" name="sitemap" <cfif isDefined('form.sitemap')>value="#form.sitemap#" /><cfelseif NOT isdefined('form.sitemap')> value="0"/></cfif>
       <input type="hidden" name="sitesearch" <cfif isDefined('form.sitesearch')>value="#form.sitesearch#" /><cfelseif NOT isdefined('form.sitesearch')> value="0"/></cfif>
       <input type="hidden" name="spotlights" <cfif isDefined('form.spotlights')>value="#form.spotlights#" /><cfelseif NOT isdefined('form.spotlights')> value="0"/></cfif>
       <!---\\ End of Configurables //--->
       <input type="hidden" name="stockticker" <cfif isDefined('form.stockticker')>value="#form.stockticker#" /><cfelseif NOT isdefined('form.stockticker')> value="0"/></cfif>
       <!---\\ End of Configurables //--->
       <!---\\ End of Configurables //--->
       <!---\\ End of Configurables //--->
       <input type="hidden" name="tellafriend" <cfif isDefined('form.tellafriend')>value="#form.tellafriend#" /><cfelseif NOT isdefined('form.tellafriend')> value="0"/></cfif>
       <!---\\ End of Configurables //--->
       <!---\\ End of Configurables //--->
       <!---\\ End of Configurables //--->
       <input type="hidden" name="users" <cfif isDefined('form.users')>value="#form.users#" /><cfelseif NOT isdefined('form.users')> value="0"/></cfif>
       <!---\\ End of Configurables //--->
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td width="48%" align="left">Your DataSource:</td>
           <td width="2%">&nbsp;</td>
           <td width="48%"><input type="text" name="datasrc" id="datasrc" /></td>
         </tr>
         <tr>
           <td align="left">Your Database Type:</td>
           <td>&nbsp;</td>
           <td><select name="db_type" id="db_type">
             <option value="mssql">Microsoft SQL Server</option>
             <option value="mysql">MySQL</option>
           </select>
           </td>
         </tr>
       </table>
       <table border="0" align="right" cellpadding="0" cellspacing="0" class="ButtonTable">
  <tr>
    <td width="7" height="20"><img src="assets/button/button_left.gif" width="7" height="20" /></td>
    <td height="20" class="Button"><a href="javascript: document.step5.submit();" class="Button">Step 6 >></a></td>
    <td width="7" height="20"><img src="assets/button/button_right.gif" width="7" height="20" /></td>
  </tr>
</table>
</form>
</td></tr></table>
</cfoutput>