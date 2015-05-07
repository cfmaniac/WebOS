<cfset current_box ="articles.cfm">
<cfquery datasource="#datasrc#" name="detect_column">
select * from #table_sideboxes# where side_box_filename ='#current_box#'
</cfquery>

<div id="login" class="boxed">
<!---\\Box Title//--->
<div class="title"><h2><cfoutput query="detect_column">#side_box_name#</cfoutput></h2>
   
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
