<cfset current_box ="articles_archives.cfm">
<cfquery datasource="#datasrc#" name="detect_column">
select * from #table_sideboxes# where side_box_filename ='#current_box#'
</cfquery>


<div id="login" class="boxed">
<!---\\Box Title//--->
<div class="title"><h2><cfoutput query="detect_column">#side_box_name#</cfoutput></h2>
   <cfoutput>
    <cfloop query="GetArticles_Archived">
    <cfif isDefined('url.archive_id') and #url.archive_id# EQ #article_id#>
    <img src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#page_menu_bullet_active.jpg" alt="article_archives" width="7" height="12"><b><a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=articles&section=archives&archive_id=#article_id#" class="menu_items">&nbsp;#article_title#</a></b><br />
      <cfelse>
      <img src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#page_menu_bullet.jpg" alt="article_archives" width="7" height="12"><a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=articles&section=archives&archive_id=#article_id#" class="menu_items">&nbsp;#article_title#</a><br />
      </cfif>  
  </cfloop>
  </cfoutput>
</div> 
<!---\\End box Title//--->
<!---\\Box Content//--->
<div class="content">           
<cfoutput>
    <cfloop query="GetArticles">
          <cfif isDefined('url.article_id') and #url.article_id# EQ #article_id#>
          <img src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#page_menu_bullet_active.jpg" alt="article_archives" width="7" height="12">   &nbsp;<b><a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=articles&article_id=#article_id#" class="menu_items">&nbsp;#article_title#</a></b><br>
          <cfelse>
       <a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=articles&article_id=#article_id#" class="menu_items">&nbsp;#article_title#</a><br />
          </cfif>
  </cfloop>
  </cfoutput>
</div>
<!---\\end Box Content//--->
</div>
