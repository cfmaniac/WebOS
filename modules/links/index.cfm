<!---\\ Module Configuration //--->
<cfset module ="links">
<!---\\ End of Module Configuration //---->

<cfif NOT isDefined('url.cat')>
<!---\\ Default Page //--->
<cfset cat = "">
<cfquery name="get_cats" datasource="#datasrc#">
Select * from #table_links_cat#
</cfquery>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">WebOS WebLinks Directory</td>
  </tr>
  <tr>
    <td>
    Welcome to the WebOS Links Directory. Here you will find a Categorized List of Links. Please Feel free to browse our link categories and find a link to a site you're looking for.<hr>
    <table width="95%" border="0" cellspacing="0" cellpadding="0">
    <CFSET x=0>
    <cfoutput query="get_cats">
    <cfset x = x+1>
    <cfif x mod 2 is 1>
<tr>
<td width="50%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100" rowspan="2" valign="top"><a href="http://#site_domain##site_folder#index.cfm?module=#module#&cat=#link_cat_id#"><img src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/cat_img/#link_cat_img#" width="100" height="100" alt="#link_cat_title#" border="0"></a></td>
    <td valign="top"><b><a href="http://#site_domain##site_folder#index.cfm?module=#module#&cat=#link_cat_id#">#link_cat_title#<br>
    </a></b>(Total Links: #link_cat_links#)</td>
  </tr>
  <tr>
    <td valign="top">#link_cat_description#</td>
  </tr>
  
</table></td>

<cfelse>
<td width="50%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100" rowspan="2" valign="top"><a href="http://#site_domain##site_folder#index.cfm?module=#module#&cat=#link_cat_id#"><img src="http://#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#/cat_img/#link_cat_img#" width="100" height="100" alt="#link_cat_title#" border="0"></a></td>
    <td valign="top"><b><a href="http://#site_domain##site_folder#index.cfm?module=#module#&cat=#link_cat_id#">#link_cat_title#</a></b><br>
      (Total Links: #link_cat_links#)</td>
  </tr>
  <tr>
    <td valign="top">#link_cat_description#</td>
  </tr>
  
</table></td>
</tr>
<tr><td colspan="2"><hr></td></tr>
</cfif>
</cfoutput>

</table>

    </td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle"></td>
  </tr>
</table>
<!---\\Browsing a Category//--->
<cfelseif IsDefined('url.cat')>
<cfset cat = "#url.cat#">
<cfquery name="get_cats" datasource="#datasrc#">
Select link_cat_title from #table_links_cat# where link_cat_id='#url.cat#'
</cfquery>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">WebOS WebLinks Directory :: <cfoutput>#get_cats.link_cat_title#</cfoutput></td>
  </tr>
  <tr>
    <td>
        <cfquery name="GetLink2" datasource="#datasrc#">
SELECT visits, link_desc, link_img, link, link_id, link_title
FROM #table_links# where link_cat='#cat#'
</cfquery>
    Below you will find the list of links currently found in the <b><cfoutput>#get_cats.link_cat_title#</cfoutput></b> Category.<br><br> Currently there are <b><cfoutput>#GetLink2.RecordCount#</cfoutput></b> Links in this Category.<hr>

    <table width="95%" border="0" cellspacing="0" cellpadding="0">
   <CFSET x=0>
    <cfoutput query="GetLink2">
    <cfset x = x+1>
    <cfif x mod 2 is 1>
<tr>
<td width="50%" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100" rowspan="2" valign="top"><a href="http://#site_domain##site_folder#index.cfm?module=#module#&id=#link_id#" target="_blank"><img src="http://#site_domain##site_folder##site_template_dir#/#site_template#/#site_modules_dir##module#/link_img/#link_img#" width="100" height="100" alt="#link_title#" border="0"></a></td>
    <td valign="top"><b><a href="http://#site_domain##site_folder#index.cfm?module=#module#&id=#link_id#" target="_blank">#link_title#</a></b><br>
      (Total Visits: #visits#)</td>
  </tr>
  <tr>
    <td valign="top">#link_desc#</td>
  </tr>
  
</table>

 <br></td>
<cfelse>
<td width="50%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100" rowspan="2" valign="top"><a href="http://#site_domain##site_folder#index.cfm?module=#module#&id=#link_id#" target="_blank"><img src="http://#site_domain##site_folder##site_template_dir#/#site_template#/#site_modules_dir#links/link_img/#link_img#" width="100" height="100" alt="#link_title#" border="0"></a></td>
    <td valign="top"><b><a href="http://#site_domain##site_folder#index.cfm?module=#module#&id=#link_id#" target="_blank">#link_title#</a></b><br>
    (Total Visits: #visits#)</td>
  </tr>
  <tr>
    <td valign="top">#link_desc#</td>
  </tr>
  
</table>
</td>
</tr>
<tr><td colspan="2"><hr></td></tr>
</cfif>
</cfoutput>
</table>

    </td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle"></td>
  </tr>
</table>
</cfif>
<cfif isDefined('url.id')>
<!---\\ Goes to url and adds a visit //--->
<cfset link_id = "#url.id#">
<cfquery name="getvisits" datasource="#datasrc#">
select visits, link from #table_links# where link_id ='#link_id#'
</cfquery>
<cfset new_visits = #getvisits.visits# + 1>
<cfquery name="add_click" datasource="#datasrc#">
update #table_links# set visits ='#new_visits#' where link_id ='#link_id#'
</cfquery>
<cflocation addtoken="no" url="#getvisits.link#">
</cfif>