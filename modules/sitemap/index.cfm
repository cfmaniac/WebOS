<!---\\ Module Configuration //--->
<cfset module ="sitemap">
<!---\\ End of Module Configuration //---->
<!---\\ The Content For your Site's SiteMap Page //--->
<cfif isDefined('url.view') and #url.view# EQ "map">
<!---\\ Displays a Graphical SiteMap //--->

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title"><cfoutput>#site_name#</cfoutput> :: Sitemap</td>
  </tr>
  <tr>
    <td>
    <b><a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm" class="menu_items">Home</a></b>
<cfif module_pages EQ "1">    
	<!---Site Pages Menu--->
<cfoutput>
<ul><B>Site Pages</B>:
<cfif #module_inquiry# EQ "1">
<li> <a href="?module=inquiry" class="menu_items">&nbsp;Contact Us</a></li>
</cfif>
<cfloop query="pages_menu">
<li><a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=pages&pageid=#page_id#" class="menu_items">&nbsp;#page_title#</a></li>
</cfloop>
</ul>
</cfoutput>
    <!---End of Site's Pages--->
</cfif>    
<br />
<cfif module_articles EQ "1">
<!---Site Articles--->
<cfoutput>
<ul><B>Site Articles</B>
<cfloop query="GetArticles">
<li><a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=articles&article_id=#article_id#" class="menu_items">&nbsp;#article_title#</a></li>
</cfloop>
</ul>
</cfoutput>
<!---End of Site Articles--->    
<br />
<!---Site Articles Archive --->
<cfoutput>
<ul><B>Site Articles Archive</B>
<cfloop query="GetArticles_Archived">
<li><a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=articles&section=archives&archive_id=#article_id#" class="menu_items">&nbsp;#article_title#</a></li>
</cfloop>
</ul>
</cfoutput>
<!---End of Site Articles Archive--->
</cfif>        

<br />
<!---<!---Site Modules Available --->
<cfoutput>
<ul><B>Available Sections of Our Site</B>
<cfloop query="main_modules">
<li><a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=#module_directory#" class="menu_items">&nbsp;#module_name#</a></li>
</cfloop>
</ul>
</cfoutput>
<!---End of Available Modules--->--->
       
    </td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle">&nbsp;</td>
  </tr>
</table>
<cfelseif NOT isdefined('url.view')>

</cfif>