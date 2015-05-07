<cfoutput>
<!---\\ Step 4: Module Configuration //--->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
     <tr>
       <td height="24" colspan="3" background="assets/install_wiz_r2_c8.jpg" class="style1"><b>Step 00#url.step#: #step_description# </b></td>
       </tr>
     <tr>
       <td width="2%">&nbsp;</td>
       <td width="96%">Based off of your Site Type <b><i>#form.site_type#</i></b> (That you selected in Step 2) we've populated a list of default Modules. You can ofcourse select the modules you want installed for your site.
       <hr width="95%" />
       <form name="step4" action="?step=5" method="post">
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
      <!---\\ End of Configurables //--->
     <cfdirectory directory="#ExpandPath("../modules/")#" action="list" name="mods">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr align="center" bgcolor="##9CB6DE">
     <td width="7%" height="25" align="left" bgcolor="##E2E6E7">&nbsp;</td>
<td width="14%" align="left" bgcolor="##E2E6E7"><strong><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Directory</font></span></strong></td>
<td width="26%" bgcolor="##E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Module Name</strong></font></span></td>
<td width="38%" bgcolor="##E2E6E7"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Module Description</font></strong></td>
</tr>
<cfloop query="mods">
 <tr >
   <td align="left" valign="top">
   <cfif #form.site_type# EQ "dev">
    <input name="#mods.name#" type="checkbox" checked value="1"/>
   <cfelseif #form.site_type# EQ "financial">
   <input name="#mods.name#" type="checkbox"
   <cfif #mods.name# EQ "analytics">checked
   <cfelseif #mods.name# EQ "articles"> checked
   <cfelseif #mods.name# EQ "breadcrumbs"> checked
   <cfelseif #mods.name# EQ "inquiry"> checked
   <cfelseif #mods.name# EQ "mainpage"> checked
   <cfelseif #mods.name# EQ "metatags"> checked
   <cfelseif #mods.name# EQ "pages"> checked
   <cfelseif #mods.name# EQ "ratesticker"> checked
   <cfelseif #mods.name# EQ "stockticker"> checked
   </cfif>
   value="1"/>
   <cfelseif #site_type# EQ "legal">
   <input name="#mods.name#" type="checkbox"
   <cfif #mods.name# EQ "analytics">checked
   <cfelseif #mods.name# EQ "articles"> checked
   <cfelseif #mods.name# EQ "breadcrumbs"> checked
   <cfelseif #mods.name# EQ "inquiry"> checked
   <cfelseif #mods.name# EQ "mainpage"> checked
   <cfelseif #mods.name# EQ "metatags"> checked
   <cfelseif #mods.name# EQ "pages"> checked
   <cfelseif #mods.name# EQ "polls"> checked
   <cfelseif #mods.name# EQ "spotlights"> checked
   </cfif>
   value="1"/>
    <cfelseif #site_type# EQ "portal">
   <input name="#mods.name#" type="checkbox"
   <cfif #mods.name# EQ "analytics">checked
   <cfelseif #mods.name# EQ "articles"> checked
   <cfelseif #mods.name# EQ "breadcrumbs"> checked
   <cfelseif #mods.name# EQ "blog"> checked
   <cfelseif #mods.name# EQ "bmi_profile"> checked
   <cfelseif #mods.name# EQ "chat"> checked
   <cfelseif #mods.name# EQ "forum"> checked
   <cfelseif #mods.name# EQ "inquiry"> checked
   <cfelseif #mods.name# EQ "links"> checked
   <cfelseif #mods.name# EQ "mainpage"> checked
   <cfelseif #mods.name# EQ "metatags"> checked
   <cfelseif #mods.name# EQ "pages"> checked
   <cfelseif #mods.name# EQ "newsletter"> checked
   <cfelseif #mods.name# EQ "rss"> checked
   <cfelseif #mods.name# EQ "users"> checked
   </cfif>
   value="1"/>
   <cfelseif #site_type# EQ "directory">
   <input name="#mods.name#" type="checkbox"
   <cfif #mods.name# EQ "analytics">checked
   <cfelseif #mods.name# EQ "articles"> checked
   <cfelseif #mods.name# EQ "breadcrumbs"> checked
   <cfelseif #mods.name# EQ "blog"> checked
   <cfelseif #mods.name# EQ "chat"> checked
   <cfelseif #mods.name# EQ "forum"> checked
   <cfelseif #mods.name# EQ "inquiry"> checked
   <cfelseif #mods.name# EQ "links"> checked
   <cfelseif #mods.name# EQ "mainpage"> checked
   <cfelseif #mods.name# EQ "metatags"> checked
   <cfelseif #mods.name# EQ "pages"> checked
   <cfelseif #mods.name# EQ "newsletter"> checked
   <cfelseif #mods.name# EQ "rss"> checked
   <cfelseif #mods.name# EQ "sitesearch"> checked
   <cfelseif #mods.name# EQ "sitemap"> checked
   <cfelseif #mods.name# EQ "users"> checked
   </cfif>
   value="1"/>
    </cfif>
        </td>
    <td align="left" valign="top">#mods.name#</td>
    <td align="left" valign="top"><cfif #mods.name# EQ "analytics">
    Google Analytics
    <cfelseif #mods.name# EQ "articles">
    Article Manager
    <cfelseif #mods.name# EQ "banners">
    Banner Manager
    <cfelseif #mods.name# EQ "bmi_profile">
    (BMI) Weight Loss Profile
    <cfelseif #mods.name# EQ "blog">
    Blog
    <cfelseif #mods.name# EQ "breadcrumbs">
    Breadcrumbs
    <cfelseif #mods.name# EQ "chat">
    Chat
    <cfelseif #mods.name# EQ "didyouknow">
    Did you Knows
    <cfelseif #mods.name# EQ "forum">
    Forum
    <cfelseif #mods.name# EQ "inquiry">
    Customizable Contact Form
    <cfelseif #mods.name# EQ "links">
    Links Directory
    <cfelseif #mods.name# EQ "mainpage">
    Main Page
    <cfelseif #mods.name# EQ "metatags">
    MetaTags
    <cfelseif #mods.name# EQ "newsletter">
    Newsletter Manager
    <cfelseif #mods.name# EQ "pages">
    Site Pages
    <cfelseif #mods.name# EQ "podcasts">
    PodCasts
    <cfelseif #mods.name# EQ "polls">
    Polls & Surveys
    <cfelseif #mods.name# EQ "ratesticker">
    Rates Ticker
    <cfelseif #mods.name# EQ "rss">
    Rss Feeds
    <cfelseif #mods.name# EQ "sefurls">
    SEO Friendly URLs
    <cfelseif #mods.name# EQ "sitemap">
    Site Map
    <cfelseif #mods.name# EQ "sitesearch">
    Website Search
    <cfelseif #mods.name# EQ "spotlights">
    Spotlights
    <cfelseif #mods.name# EQ "stockticker">
    Stock Ticker
    <cfelseif #mods.name# EQ "tellafriend">
    Tell-a-Friend
    <cfelseif #mods.name# EQ "users">
    Users Manager
    </cfif>
    </td>
    <td align="left" valign="top"><cfif #mods.name# EQ "analytics">
    Enables Google Analytics and Tracking for your website
    <cfelseif #mods.name# EQ "articles">
    Enables Articles for news, Content, updatres etc. for your website
    <cfelseif #mods.name# EQ "banners">
    Enables Banner Rototation on your Website for advertising
    <cfelseif #mods.name# EQ "blog">
    Enables a blog on your website
    <cfelseif #mods.name# EQ "bmi_profile">
    Enables a Weightloss Log and Profile on your website
    <cfelseif #mods.name# EQ "breadcrumbs">
    Enables Easy to follow navigation for your website
    <cfelseif #mods.name# EQ "chat">
    Enables a Chat room system on your site
    <cfelseif #mods.name# EQ "didyouknow">
    Enables quick "Did you Know" information on your site's pages and articles.
    <cfelseif #mods.name# EQ "forum">
    Enables a Forum for your website
    <cfelseif #mods.name# EQ "inquiry">
    Enables a fully customizable contact form on your website
    <cfelseif #mods.name# EQ "links">
    Enables a categorized links directory on your website
    <cfelseif #mods.name# EQ "mainpage">
    Enables main pages (homepages) for your website
    <cfelseif #mods.name# EQ "metatags">
    Enables pre-optimized meta tags for Search Engine Stickiness and Optimization
    <cfelseif #mods.name# EQ "newsletter">
    Enables newsletter manager for your website
    <cfelseif #mods.name# EQ "pages">
    Enables Site Content Pages on your Website
    <cfelseif #mods.name# EQ "podcasts">
    Enables Streaming or downloadable podcasts fro your website
    <cfelseif #mods.name# EQ "polls">
    Enables Polls or Surveys for your Website
    <cfelseif #mods.name# EQ "ratesticker">
    Enables and Displays Mortgage rates for your website
    <cfelseif #mods.name# EQ "rss">
    Enables local and external RSS Feeds for your Website
    <cfelseif #mods.name# EQ "sefurls">
    Enables Search Engine Friendly URLs for your website
    <cfelseif #mods.name# EQ "sitemap">
    Enables a Site Map (and generates Google Site Map) for your website
    <cfelseif #mods.name# EQ "sitesearch">
    Enables a localized search engine for your Website.
    <cfelseif #mods.name# EQ "spotlights">
    Enables Spotlights or Featured Content fdr your website
    <cfelseif #mods.name# EQ "stockticker">
    Enables a Stock Ticker for your website
    <cfelseif #mods.name# EQ "tellafriend">
    Enable your users to refer friends to sections of your website
    <cfelseif #mods.name# EQ "users">
    Enables your users to signup and participate in sections (Blog, Chat, Forum, Premium articles Content) of your website
    </cfif></td>
    </tr>
    <tr><td colspan="4"><hr /></td></tr>
</cfloop>
</table>

       <table border="0" align="right" cellpadding="0" cellspacing="0" class="ButtonTable">
  <tr>
    <td width="7" height="20"><img src="assets/button/button_left.gif" width="7" height="20" /></td>
    <td height="20" class="Button"><a href="javascript: document.step4.submit();" class="Button">Step 5 >></a></td>
    <td width="7" height="20"><img src="assets/button/button_right.gif" width="7" height="20" /></td>
  </tr>
</table>
       </form>
       </td>
       </tr>
       </table>
       </cfoutput>