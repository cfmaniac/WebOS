<cfset current_box ="pages_menu.cfm">
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
<cfif NOT isDefined('url.module')>
  &nbsp;&nbsp;<img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet_active.jpg" alt="Home" width="7" height="12">
  <b>&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm" class="menu_items">Home</a></b><br />
  <cfelse>
  &nbsp;<img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet.jpg" alt="Home" width="7" height="12">&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm" class="menu_items">Home</a><br />
  </cfif>
<cfif module_inquiry EQ "1">
  <cfif isDefined('url.module') and #url.module# EQ "inquiry">
  &nbsp;&nbsp;<img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet_active.jpg" alt="Home" width="7" height="12">
  <b>&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=inquiry" class="menu_items">Contact Us</a></b><br />
  <cfelse>
  &nbsp;<img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet.jpg" alt="Home" width="7" height="12">&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=inquiry" class="menu_items">Contact Us</a><br />
  </cfif>
  </cfif>
<cfoutput>
    <cfloop query="pages_menu">
     <cfif NOT isDefined('url.pageid') or #url.pageid# NEQ #page_id#>
&nbsp;<img src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#page_menu_bullet.jpg" alt="#page_title#" width="7" height="12">
<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=pages&pageid=#page_id#" class="menu_items">#page_title#</a><br />
 <cfelseif #url.pageid# EQ #page_id#>
&nbsp;&nbsp;<img src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#page_menu_bullet_active.jpg" alt="#page_title#" width="7" height="12">
&nbsp;<b><a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=pages&pageid=#page_id#" class="menu_items">#page_title#</a></b><br />
  </cfif>
  </cfloop>
  </cfoutput>
<cfif module_sitemap EQ "1">
     <cfif isDefined('url.module') and #url.module# EQ "sitemap"> 
&nbsp;&nbsp;<img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet_active.jpg" alt="SiteMap" width="7" height="12">
<b>&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=sitemap&view=map" class="menu_items">Sitemap</a></b><br />
  <cfelse>
  &nbsp;<img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet.jpg" alt="Sitemap" width="7" height="12">&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=sitemap&view=map" class="menu_items">SiteMap</a><br />     
     </cfif>
     <cfif module_blog EQ "1">
     <cfif isDefined('url.module') and #url.module# EQ "blog"> 
&nbsp;&nbsp;<img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet_active.jpg" alt="blog" width="7" height="12">
<b><a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=blog" class="menu_items">Blog</a></b><br />
  <cfelse>
  &nbsp;<img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet.jpg" alt="Sitemap" width="7" height="12">
 <a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=blog" class="menu_items">Blog</a>    <br /> 
     </cfif>
     </cfif>
     <cfif module_forum EQ "1">
     <cfif isDefined('url.module') and #url.module# EQ "forum"> 
&nbsp;&nbsp;<img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet_active.jpg" alt="blog" width="7" height="12">
<b>&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=forum" class="menu_items">Our Forum</a></b><br />
  <cfelse>
  &nbsp;<img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet.jpg" alt="Sitemap" width="7" height="12">
 <a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=forum" class="menu_items">Our Forum</a> <br />    
     </cfif>
     </cfif>
          <cfif module_links EQ "1">
     <cfif isDefined('url.module') and #url.module# EQ "links"> 
&nbsp;&nbsp;<img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet_active.jpg" alt="blog" width="7" height="12">
<b>&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=links" class="menu_items">Links Directory</a></b><br />
  <cfelse>
  &nbsp;<img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet.jpg" alt="Sitemap" width="7" height="12">
<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=links" class="menu_items">Links Directory</a>  <br />   
     </cfif>
     </cfif>
          <cfif module_podcasts EQ "1">
     <cfif isDefined('url.module') and #url.module# EQ "podcasts"> 
&nbsp;&nbsp;<img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet_active.jpg" alt="blog" width="7" height="12">
<b>&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=podcasts" class="menu_items">PodCasts</a></b><br />
  <cfelse>
  &nbsp;<img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet.jpg" alt="Sitemap" width="7" height="12">&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=podcasts" class="menu_items">PodCasts</a><br />     
     </cfif>
     </cfif>     
     <cfif module_polls EQ "1">
     <cfif isDefined('url.module') and #url.module# EQ "polls"> 
&nbsp;&nbsp;<img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet_active.jpg" alt="blog" width="7" height="12">
<b>&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=polls" class="menu_items">Polls</a></b><br />
  <cfelse>
  &nbsp;<img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet.jpg" alt="Sitemap" width="7" height="12">&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=polls" class="menu_items">Polls</a><br />     
     </cfif>
     </cfif>     
     <cfif module_tellafriend EQ "1">
     <cfif isDefined('url.module') and #url.module# EQ "tellafriend"> 
&nbsp;&nbsp;<img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet_active.jpg" alt="blog" width="7" height="12">
<b>&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=tellafriend" class="menu_items">Tell-A-Friend</a></b><br />
  <cfelse>
  &nbsp;<img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet.jpg" alt="Sitemap" width="7" height="12">&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=tellafriend" class="menu_items">Tell-a-Friend</a>     <br />
     </cfif>
     </cfif>    
          <cfif module_chat EQ "1">
     <cfif isDefined('url.module') and #url.module# EQ "chat"> 
&nbsp;&nbsp;<img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet_active.jpg" alt="blog" width="7" height="12">
<b>&nbsp;<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=chat" class="menu_items">Chat</a></b><br />
  <cfelse>
  &nbsp;<img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>page_menu_bullet.jpg" alt="Sitemap" width="7" height="12">
<a href="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=chat" class="menu_items">Chat</a>     <br />
     </cfif>
     </cfif>     
     </cfif>
</div>
<!---\\end Box Content//--->
</div>
