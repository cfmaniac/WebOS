<cfoutput>
<!---\\ Step 9 : Review //--->
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
     <tr>
       <td height="24" colspan="3" background="assets/install_wiz_r2_c8.jpg" class="style1"><b>Step 00#url.step#: #step_description# </b></td>
       </tr>
     <tr>
       <td width="2%">&nbsp;</td>
       <td width="96%">We're Getting close to finishing up. Please Take a brief moment to review the following information before we set up your site Configuration.<br />
       <form name="step9" action="?step=10" method="post">
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
       <hr />
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3" align="center"><strong>Site Configuration Settings:</strong></td>
    </tr>
  <tr>
    <td width="48%">Site Domain:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.site_domain#</td>
  </tr>
  <tr>
    <td width="48%">Site Folder:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.site_folder#</td>
  </tr>
  <tr>
    <td width="48%">Site Name:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.site_name#</td>
  </tr>
  <tr>
    <td>Site Mail Server:</td>
    <td>&nbsp;</td>
    <td>#form.site_mail_server#</td>
  </tr>
  <tr>
    <td width="48%">Site Email:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.site_email#</td>
  </tr>
  <tr>
    <td width="48%">Site License:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.site_license#</td>
  </tr>
  <tr>
    <td width="48%">Site Type:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.site_type#</td>
  </tr>
  <tr>
    <td width="48%">Site Location:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.site_location#</td>
  </tr>
  <tr>
    <td width="48%">Client Name:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.client_name#</td>
  </tr>
  <tr>
    <td width="48%">Client Email:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.client_email#</td>
  </tr>
  <tr>
    <td width="48%">Site Template:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.site_template#</td>
  </tr>
  <tr>
    <td width="48%">Site Template Directory:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.site_template_dir#</td>
  </tr>
  <tr>
    <td width="48%">Site Admin Dir:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.sitE_admin_dir#</td>
  </tr>
  <tr>
    <td width="48%">Site Modules Dir:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.site_modules_dir#</td>
  </tr>
  <tr>
    <td width="48%">Site Assets Dir:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.site_assets_dir#</td>
  </tr>
  <tr>
    <td width="48%">Site Header:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.site_header#</td>
  </tr>
  <tr>
    <td width="48%">Site Footer:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.site_footer#</td>
  </tr>
  <tr>
    <td width="48%">Site width:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.site_width#</td>
  </tr>
  <tr>
    <td width="48%">Left Column active:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.left_col_active#</td>
  </tr>
  <tr>
    <td width="48%">Left Column Width:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.left_col_width#</td>
  </tr>
  <tr>
    <td width="48%">Site Left Column Dir:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.site_side_boxes#</td>
  </tr>
  <tr>
    <td width="48%">Right Column active:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.right_col_active#</td>
  </tr>
  <tr>
    <td width="48%">Left Column Width:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.right_col_width#</td>
  </tr>
  <tr>
    <td width="48%">Site Header Dir:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.site_header_dir#</td>
  </tr>
  <tr>
    <td width="48%">Site Footer Dir:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.site_footer_dir#</td>
  </tr>
  <tr>
    <td width="48%">Site Scripts Dir:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.site_scripts_dir#</td>
  </tr>
  <tr>
    <td width="48%">Site Style sheet:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.site_style_sheet#</td>
  </tr>
  <tr>
    <td width="48%">Site Styles Dir:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.site_styles_dir#</td>
  </tr>
  <tr>
    <td width="48%">Template Index File:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.template_file#</td>
  </tr>
  <tr>
    <td width="48%">Data Source:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.datasrc#</td>
  </tr>
    <tr>
    <td width="48%">Database Type:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%"><b><i>#form.db_type#</i></b></td>
  </tr>
  <tr>
    <td width="48%">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3" align="center"><strong>Installed Modules After Installation:</strong></td>
    </tr>
    <cfif #form.analytics# EQ "1">
  <tr>
    <td>Google Analytics</td>
    <td>&nbsp;</td>
    <td><img src="assets/installed.jpg" /></td>
  </tr>
  </cfif>
     <cfif #form.articles# EQ "1">
  <tr>
    <td>Articles Manager</td>
    <td>&nbsp;</td>
    <td><img src="assets/installed.jpg" /></td>
  </tr>
  </cfif>
     <cfif #form.banners# EQ "1">
  <tr>
    <td>Banner Manager</td>
    <td>&nbsp;</td>
    <td><img src="assets/installed.jpg" /></td>
  </tr>
  </cfif>
      <cfif #form.blog# EQ "1">
  <tr>
    <td>Blog</td>
    <td>&nbsp;</td>
    <td><img src="assets/installed.jpg" /></td>
  </tr>
  </cfif>
      <cfif #form.breadcrumbs# EQ "1">
  <tr>
    <td>Breadcrumb Navigation</td>
    <td>&nbsp;</td>
    <td><img src="assets/installed.jpg" /></td>
  </tr>
  </cfif>
      <cfif #form.chat# EQ "1">
  <tr>
    <td>Chat</td>
    <td>&nbsp;</td>
    <td><img src="assets/installed.jpg" /></td>
  </tr>
  </cfif>
      <cfif #form.didyouknow# EQ "1">
  <tr>
    <td>Did You Knows</td>
    <td>&nbsp;</td>
    <td><img src="assets/installed.jpg" /></td>
  </tr>
  </cfif>
      <cfif #form.forum# EQ "1">
  <tr>
    <td>Forum</td>
    <td>&nbsp;</td>
    <td><img src="assets/installed.jpg" /></td>
  </tr>
  </cfif>
      <cfif #form.inquiry# EQ "1">
  <tr>
    <td>Customizable Contact Form</td>
    <td>&nbsp;</td>
    <td><img src="assets/installed.jpg" /></td>
  </tr>
  </cfif>
      <cfif #form.links# EQ "1">
  <tr>
    <td>Links Directory</td>
    <td>&nbsp;</td>
    <td><img src="assets/installed.jpg" /></td>
  </tr>
  </cfif>
      <cfif #form.mainpage# EQ "1">
  <tr>
    <td>Main Page Module</td>
    <td>&nbsp;</td>
    <td><img src="assets/installed.jpg" /></td>
  </tr>
  </cfif>
      <cfif #form.metatags# EQ "1">
  <tr>
    <td>Meta Tags</td>
    <td>&nbsp;</td>
    <td><img src="assets/installed.jpg" /></td>
  </tr>
  </cfif>
      <cfif #form.newsletter# EQ "1">
  <tr>
    <td>Newsletter Manager</td>
    <td>&nbsp;</td>
    <td><img src="assets/installed.jpg" /></td>
  </tr>
  </cfif>
      <cfif #form.pages# EQ "1">
  <tr>
    <td>Site Pages</td>
    <td>&nbsp;</td>
    <td><img src="assets/installed.jpg" /></td>
  </tr>
  </cfif>
      <cfif #form.podcasts# EQ "1">
  <tr>
    <td>PodCast Manager</td>
    <td>&nbsp;</td>
    <td><img src="assets/installed.jpg" /></td>
  </tr>
  </cfif>
      <cfif #form.polls# EQ "1">
  <tr>
    <td>Polls</td>
    <td>&nbsp;</td>
    <td><img src="assets/installed.jpg" /></td>
  </tr>
  </cfif>
      <cfif #form.ratesticker# EQ "1">
  <tr>
    <td>Rates Ticker</td>
    <td>&nbsp;</td>
    <td><img src="assets/installed.jpg" /></td>
  </tr>
  </cfif>
      <cfif #form.rss# EQ "1">
  <tr>
    <td>RSS Feeds</td>
    <td>&nbsp;</td>
    <td><img src="assets/installed.jpg" /></td>
  </tr>
  </cfif>
      <cfif #form.sefurls# EQ "1">
  <tr>
    <td>Search Engine Friendly URLs</td>
    <td>&nbsp;</td>
    <td><img src="assets/installed.jpg" /></td>
  </tr>
  </cfif>
      <cfif #form.sitemap# EQ "1">
  <tr>
    <td>SiteMap</td>
    <td>&nbsp;</td>
    <td><img src="assets/installed.jpg" /></td>
  </tr>
  </cfif>
      <cfif #form.sitesearch# EQ "1">
  <tr>
    <td>Site Search</td>
    <td>&nbsp;</td>
    <td><img src="assets/installed.jpg" /></td>
  </tr>
  </cfif>
      <cfif #form.spotlights# EQ "1">
  <tr>
    <td>Spotlights</td>
    <td>&nbsp;</td>
    <td><img src="assets/installed.jpg" /></td>
  </tr>
  </cfif>
      <cfif #form.stockticker# EQ "1">
  <tr>
    <td>Stock Ticker</td>
    <td>&nbsp;</td>
    <td><img src="assets/installed.jpg" /></td>
  </tr>
  </cfif>
      <cfif #form.tellafriend# EQ "1">
  <tr>
    <td>Tell a Friend</td>
    <td>&nbsp;</td>
    <td><img src="assets/installed.jpg" /></td>
  </tr>
  </cfif>
      <cfif #form.users# EQ "1">
  <tr>
    <td>Users Module</td>
    <td>&nbsp;</td>
    <td><img src="assets/installed.jpg" /></td>
  </tr>
  </cfif>
  <tr>
    <td colspan="3" align="center">
      <strong><em>You can enable/install additonal modules from the WebOS Administration Panel.    </em></strong></td>
  </tr>
   <cfif isDefined('form.username')> <tr>
    <td colspan="3" align="center"><strong>Administrative User Information:</strong></td>
    </tr>

  <tr>
    <td width="48%">Admin Username:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.username#</td>
  </tr>
  <tr>
    <td width="48%">Admin Password:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.password#</td>
  </tr>
  <tr>
    <td width="48%">Admin Name:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#form.name#</td>
  </tr>
  </cfif>
</table>

     <table border="0" align="right" cellpadding="0" cellspacing="0" class="ButtonTable">
           <tr>
             <td width="7" height="20"><img src="assets/button/button_left.gif" width="7" height="20" /></td>
             <td height="20" class="Button"><a href="javascript: document.step9.submit();" class="Button">Complete Installation &gt;&gt;</a></td>
             <td width="7" height="20"><img src="assets/button/button_right.gif" width="7" height="20" /></td>
           </tr>
         </table>
</td>
</tr>
</table>
</cfoutput>