<!---\\ Module Configuration //--->
<cfset module ="sitesearch">
<cfinclude template="../../functions/queries/module_sitesearch.cfm">
<!---\\End Module Configuration //--->
<cfif Not isDefined('form.keywords') or isDefined('form.keywords') and #form.keywords# EQ "">
<!---\\Load the Default Form//--->
<!---<cfif #form.keywords# EQ "">
Please Enter a Valid Search Term!<br>
</cfif>--->
<form name="site_search" method="post" action="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=sitesearch">
<table width="277" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
  <td><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/search_left.jpg" />
  </td>
   <td><img name="indexcfm_r1_c1" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/index_r1_c1.jpg" width="117" height="35" border="0" id="indexcfm_r1_c1" alt="" /></td>
   <td><img name="indexcfm_r1_c2" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/index_r1_c2.jpg" width="27" height="35" border="0" id="indexcfm_r1_c2" alt="" /></td>
   <td><table align="left" border="0" cellpadding="0" cellspacing="0" width="91">
	  <tr>
	   <td><img name="indexcfm_r1_c3" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/index_r1_c3.jpg" width="91" height="7" border="0" id="indexcfm_r1_c3" alt="" /></td>
	  </tr>
	  <tr>
	   <td><table align="left" border="0" cellpadding="0" cellspacing="0" width="91">
		  <tr>
		   <td><input type="text" name="keywords" id="keywords" style="width:82px;height:18px; border-top:1px solid #000; border-left: 0px solid #000; border-right: 0px solid #000; border-bottom: 1px solid #000; font-size:9px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#033260;font-weight:bold;" value="Search Us" onfocus="document.site_search.keywords.value=
'';"/></td>
		   <td><img name="indexcfm_r2_c4" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/index_r2_c4.jpg" width="9" height="20" border="0" id="indexcfm_r2_c4" alt="" /></td>
		  </tr>
		</table></td>
	  </tr>
	  <tr>
	   <td><img name="indexcfm_r3_c3" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/index_r3_c3.jpg" width="91" height="8" border="0" id="indexcfm_r3_c3" alt="" /></td>
       
	  </tr>
	</table></td>
   <td><a href="#" onclick="document.site_search.submit();" onmouseout="MM_swapImgRestore();" onmouseover="MM_swapImage('indexcfm_r1_c5','','<cfoutput>#site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/index_r1_c5_f2.jpg',1);"><img name="indexcfm_r1_c5" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/index_r1_c5.jpg" width="42" height="35" border="0" id="indexcfm_r1_c5" alt="" /></a></td>
   <td><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/search_right.jpg" />
  </td>
  </tr>
</table>
</form>
<cfelseif isDefined('form.keywords') and #form.keywords# NEQ "">
<!---\\ Load the Results Page //--->
<cfif isDefined('form.keywords') and #form.keywords# NEQ "">

    <!---\\ Loaded from the sitesearch config query //--->
    <cfoutput>
    <cfloop query="search_config">
    <cfparam name="search_#search_config.search_in#" default="#search_config.search_in_value#">
    <!---name: search_#search_config.search_in# default: #search_config.search_in_value#<br />--->
    </cfloop>
	</cfoutput>
    
<cfif #search_articles# EQ "1">
<!---\\ Results From Articles //--->
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">Search Results in Articles for: <i><cfoutput>#form.keywords#</cfoutput></i></td>
  </tr>
  <tr>
    <td>
    <cfquery name="search_articles" datasource="#datasrc#">
    select * from #table_articles# where article_title LIKE '%#form.keywords#%' or article_description Like '%#form.keywords#%' 
    </cfquery>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
    <cfif #search_articles.RecordCount# EQ "0">
    <tr>
    <td>No Results found for the Search Term: "<b><cfoutput>#form.keywords#</cfoutput></b>" in our Articles.<br />Please Try Again.</td>
    </tr>
    <cfelse>
	<cfoutput query="search_articles">
    <tr>
    <td><a href="http://#site_domain##site_folder#index.cfm?module=articles&article_id=#article_id#"><b>#Article_Title#</b></a><cfif #article_archived# EQ "1"> <font color="##990000"><i>[ARCHIVED]</i>
    </font></cfif></td>
    </tr>
    </cfoutput>
    </cfif>
    </table>
    </td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle">&nbsp;</td>
  </tr>
</table>
 <cfelseif #search_articles# EQ "0">
 Not Searching Articles<br />
 </cfif>
 <cfif #search_blog# EQ "1">
<!---\\ Results From Blog //--->
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">Search Results in Blog for: <i><cfoutput>#form.keywords#</cfoutput></i></td>
  </tr>
  <tr>
    <td>
     <cfquery name="search_blog" datasource="#datasrc#">
    select * from #table_blog# where bltitle LIKE '%#form.keywords#%' or bltext Like '%#form.keywords#%' or bltext2 Like '%#form.keywords#%'
    </cfquery>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
    <cfif #search_blog.RecordCount# EQ "0">
    <tr>
    <td>No Results found for the Search Term: "<b><cfoutput>#form.keywords#</cfoutput></b>" in our Blog.<br />Please Try Again.</td>
    </tr>
    <cfelse>
	<cfoutput query="search_blog">
    <tr>
    <td><a href="http://#site_domain##site_folder#index.cfm?module=blog&dopost=yes&id=#blid#&#bltitle#"><b>#bltitle#</b></a></td>
    </tr>
    </cfoutput>
    </cfif>
    </table>
    </td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle">&nbsp;</td>
  </tr>
</table>
<cfelseif #search_blog# EQ "0">
 Not Searching Blog Posts<br />
 </cfif>
 <cfif #search_links# EQ "1">
<!---\\ Results From Links //--->
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">Search Results in Links for: <i><cfoutput>#form.keywords#</cfoutput></i></td>
  </tr>
  <tr>
    <td>
         <cfquery name="search_configs" datasource="#datasrc#">
    select * from #table_links# where link_title LIKE '%#form.keywords#%' or link_desc Like '%#form.keywords#%'
    </cfquery>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
    <cfif #search_configs.RecordCount# EQ "0">
    <tr>
    <td>No Results found for the Search Term: "<b><cfoutput>#form.keywords#</cfoutput></b>"our Website Links.<br />Please Try Again.</td>
    </tr>
    <cfelse>
	<cfoutput query="search_configs">
    <tr>
    <td><a href="http://#site_domain##site_folder#index.cfm?module=links&id=#link_id#"><b>#link_title#</b></a></td>
    </tr>
    </cfoutput>
    </cfif>
    </table>
    </td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle">&nbsp;</td>
  </tr>
</table>
<cfelseif #search_links# EQ "0">
 Not Searching Links Directory<br />
 </cfif>
 <cfif #search_pages# EQ "1">
<!---\\ Results From Pages //--->
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">Search Results in Site Pages for: <i><cfoutput>#form.keywords#</cfoutput></i></td>
  </tr>
  <tr>
    <td>
         <cfquery name="search_pages" datasource="#datasrc#">
    select * from #table_pages# where page_title LIKE '%#form.keywords#%' or page_content Like '%#form.keywords#%'
    </cfquery>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
    <cfif #search_pages.RecordCount# EQ "0">
    <tr>
    <td>No Results found for the Search Term: "<b><cfoutput>#form.keywords#</cfoutput></b>" in our Website Pages.<br />Please Try Again.<br />
   
    </td>
    </tr>
    <cfelse>
	<cfoutput query="search_pages">
    <tr>
    <td><a href="http://#site_domain##site_folder#index.cfm?module=pages&pageid=#page_id#"><b>#page_title#</b></a></td>
    </tr>
    </cfoutput>
    </cfif>
    </table>
   
    </td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle">&nbsp;</td>
  </tr>
</table>
 <cfelseif #search_pages# EQ "0">
 Not Searching Site Pages<br />
    </cfif>
<cfif #search_rss# EQ "1">
<!---\\ Results From Blog //--->
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">Search Results in Our RSS Feeds for: <i><cfoutput>#form.keywords#</cfoutput></i></td>
  </tr>
  <tr>
    <td>
     <cfquery name="search_rss" datasource="#datasrc#">
    select * from #table_our_feeds# where rss_title LIKE '%#form.keywords#%' or rss_content Like '%#form.keywords#%'
    </cfquery>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
    <cfif #search_rss.RecordCount# EQ "0">
    <tr>
    <td>No Results found for the Search Term: "<b><cfoutput>#form.keywords#</cfoutput></b>" in our RSS Feeds.<br />Please Try Again.</td>
    </tr>
    <cfelse>
	<cfoutput query="search_rss">
    <tr>
    <td><a href="http://#site_domain##site_folder#index.cfm?module=rss&read=our_feeds&id=#rss_id#"><b>#rss_title#</b></a></td>
    </tr>
    </cfoutput>
    </cfif>
    </table>
    </td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle">&nbsp;</td>
  </tr>
</table>
<cfelseif #search_rss# EQ "0">
 Not Searching RSS Feeds<br />
 </cfif>    
<cfif #search_forum# EQ "1">
<!---\\ Results From Blog //--->
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">Search Results in Our Forums for: <i><cfoutput>#form.keywords#</cfoutput></i></td>
  </tr>
  <tr>
    <td>
     <cfquery name="search_forum_threads" datasource="#datasrc#">
    select * from #table_forum_entries# where title LIKE '%#form.keywords#%' or message LIKE '%#form.keywords#%'
    </cfquery>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
    <cfif #search_forum_threads.RecordCount# EQ "0">
    <tr>
    <td>No Results found for the Search Term: "<b><cfoutput>#form.keywords#</cfoutput></b>" in our Forums.<br />Please Try Again.</td>
    </tr>
    <cfelse>
	<cfoutput query="search_forum_threads">
    <tr>
    <td><a href="http://#site_domain##site_folder#index.cfm?module=forum"><b>#title#</b></a></td>
    </tr>
    </cfoutput>
    </cfif>
    </table>
    </td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle">&nbsp;</td>
  </tr>
</table>
<cfelseif #search_forum# EQ "0">
 Not Searching Forums Feeds<br />
 </cfif>  
 
 
<cfelseif NOT isDefined('form.keywords') or #form.keywords# EQ "">
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">Please Input a Search Term:</td>
  </tr>
  <tr>
    <td> <form name="site_search2" method="post" action="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=sitesearch">
<table width="277" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
  <td><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/search_left.jpg" />
  </td>
   <td><img name="indexcfm_r1_c1" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/index_r1_c1.jpg" width="117" height="35" border="0" id="indexcfm_r1_c1" alt="" /></td>
   <td><img name="indexcfm_r1_c2" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/index_r1_c2.jpg" width="27" height="35" border="0" id="indexcfm_r1_c2" alt="" /></td>
   <td><table align="left" border="0" cellpadding="0" cellspacing="0" width="91">
	  <tr>
	   <td><img name="indexcfm_r1_c3" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/index_r1_c3.jpg" width="91" height="7" border="0" id="indexcfm_r1_c3" alt="" /></td>
	  </tr>
	  <tr>
	   <td><table align="left" border="0" cellpadding="0" cellspacing="0" width="91">
		  <tr>
		   <td><input type="text" name="keywords" id="keywords" style="width:82px;height:16px; border-top:1px solid #000; border-left: 0px solid #000; border-right: 0px solid #000; border-bottom: 1px solid #000; font-size:9px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#033260;font-weight:bold;"/></td>
		   <td><img name="indexcfm_r2_c4" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/index_r2_c4.jpg" width="9" height="20" border="0" id="indexcfm_r2_c4" alt="" /></td>
		  </tr>
		</table></td>
	  </tr>
	  <tr>
	   <td><img name="indexcfm_r3_c3" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/index_r3_c3.jpg" width="91" height="8" border="0" id="indexcfm_r3_c3" alt="" /></td>
       
	  </tr>
	</table></td>
   <td><a href="#" onclick="document.site_search2.submit();" onmouseout="MM_swapImgRestore();" onmouseover="MM_swapImage('indexcfm_r1_c5','','<cfoutput>#site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/index_r1_c5_f2.jpg',1);"><img name="indexcfm_r1_c5" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/index_r1_c5.jpg" width="42" height="35" border="0" id="indexcfm_r1_c5" alt="" /></a></td>
   <td><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>sitesearch/search_right.jpg" />
  </td>
  </tr>
</table>
</form></td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle">&nbsp;</td>
  </tr>
</table>
</cfif>
</cfif> 