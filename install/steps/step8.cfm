<cfoutput>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
     <tr>
       <td height="24" colspan="3" background="assets/install_wiz_r2_c8.jpg" class="style1"><b>Step 00#url.step#: #step_description# </b></td>
       </tr>
     <tr>
       <td width="2%">&nbsp;</td>
       <td width="96%"><form name="step8" action="?step=8_5" method="post">
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
       <table width="95%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="3">Now that we've set up your datasource, created your database and populated it with some information, we're going to create your Adminisitrator Profile to login to the WebOS Admin Panel.<br />
      <br />
      Fill out the information below to create and insert your Administrator Profile:</td>
    </tr>
  <tr>
    <td width="48%">Username:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%"><input type="text" name="username" id="username" /></td>
  </tr>
  <tr>
    <td width="48%">Password:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%"><input type="text" name="password" id="password" /></td>
  </tr>
  <tr>
    <td>Your Name:</td>
    <td>&nbsp;</td>
    <td><input type="text" name="name" id="name" /></td>
  </tr>
</table>

       <br />

         <table border="0" align="right" cellpadding="0" cellspacing="0" class="ButtonTable">
           <tr>
             <td width="7" height="20"><img src="assets/button/button_left.gif" width="7" height="20" /></td>
             <td height="20" class="Button"><a href="javascript: document.step8.submit();" class="Button">Step 9 &gt;&gt;</a></td>
             <td width="7" height="20"><img src="assets/button/button_right.gif" width="7" height="20" /></td>
           </tr>
         </table>
       </form>
       <!---\\ From Step 7 //---></td>
       <td width="2%">&nbsp;</td>
     </tr>
   </table>
	   </cfoutput>