<cfset current_box ="blog_posts.cfm">
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
    <cfloop query="current_posts">
    <cfif isDefined('url.id') and #url.id# EQ #current_posts.blID#>
    &nbsp;<b><a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=blog&dopost=yes&id=#current_posts.blID#&#current_posts.bltitle#" class="menu_items">&nbsp;#current_posts.bltitle#</a></b><br />
     <cfelse>
     <img src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#page_menu_bullet.jpg" alt="Current Blog Posts" width="7" height="12">&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=blog&dopost=yes&id=#current_posts.blID#&#current_posts.bltitle#" class="menu_items">&nbsp;#current_posts.bltitle#</a><br />
     </cfif>     
  </cfloop>
  </cfoutput>
</div>
<!---\\end Box Content//--->
</div>
