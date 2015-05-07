<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title> <cfif #show_page_titles# EQ "1">
<!---\\Website Page Title Queries //--->
<cfif #show_page_titles# EQ "1">
<!---\\The following queries are for displaying the 'page' title within the <title> tag of the website //--->

<!---Let's Start with pages--->
<cfif isDefined('url.module') and #url.module# EQ "pages"> 
<CFQUERY NAME="pages_title" datasource="#datasrc#">
SELECT * FROM  #table_pages# where page_status ='1' and page_id='#url.pageid#'
</CFQUERY>
<cfset page_title = "#pages_title.page_title#">

<cfelseif isDefined('url.module') and #url.module# EQ "forum">
<cfset page_title = "Forum">

<cfelseif isDefined('url.module') and #url.module# EQ "banners">
<cfset page_title = "Banners">

<cfelseif isDefined('url.module') and #url.module# EQ "blog">
<cfset page_title = "Blog">

<cfelseif isDefined('url.module') and #url.module# EQ "bmi_profile">
<cfset page_title = "Your Weight Loss Profile">

<cfelseif isDefined('url.module') and #url.module# EQ "users">
<cfset page_title = "Your Profile">

<cfelseif isDefined('url.module') and #url.module# EQ "sitemap">
<cfset page_title = "Site Map">

<cfelseif isDefined('url.module') and #url.module# EQ "articles">
<cfset page_title = "Articles">

<cfelseif isDefined('url.module') and #url.module# EQ "chat">
<cfset page_title = "Chat">

<cfelseif isDefined('url.module') and #url.module# EQ "inquiry">
<cfset page_title = "Contact Us">

<cfelseif isDefined('url.module') and #url.module# EQ "newsletter">
<cfset page_title = "Newsletters">

<cfelseif isDefined('url.module') and #url.module# EQ "podcasts">
<cfset page_title = "Media Library :: PodCasts">

<cfelseif isDefined('url.module') and #url.module# EQ "polls">
<cfset page_title = "Your Opinion :: Polls">

<cfelseif isDefined('url.module') and #url.module# EQ "tellafriend">
<cfset page_title = "Tell your Friends">

<cfelseif isDefined('url.module') and #url.module# EQ "links">
<cfset page_title = "Links Directory">

<cfelseif isDefined('url.module') and #url.module# EQ "sitesearch">
<cfset page_title = "Search">
</cfif>
</cfif>


<!---\\ End of Website Page Title Queries //--->
<cfif isDefined('url.module')>
<cfoutput>#site_name#</cfoutput> :: <cfoutput>#page_title#</cfoutput>
<cfelseif NOT isDefined('url.module')>

<cfoutput>#site_name#</cfoutput>
</cfif>
<cfelseif #show_page_titles# EQ "0">
<cfoutput>#site_name#</cfoutput>
</cfif>
</title>

<cfif module_metatags EQ "1">
<cfinclude template="#site_modules_dir#metatags/index.cfm">
<cfelse>
<!--\\The Meta Tags Were Not Loaded, or Installed//-->
<cfheader name="expires" value="#now()#"> 
<cfheader name="pragma" value="no-cache"> 
<cfheader name="cache-control" value="no-cache, no-store, must-revalidate">
</cfif>
<cfif module_analytics EQ "1">
<cfinclude template="#site_modules_dir#analytics/index.cfm">
<cfelse>
<!--\\The Analytics Module Was Not Loaded, or Installed//-->
</cfif>
<!---\\ Initializes Search Engine Friendly URLS//--->  
<cfif module_sefurls EQ "1">
<cfinclude template="#site_modules_dir#sefurls/sefurls.cfm">
</cfif>
<!-- ap debug -->
<!---
 @import url("http://<cfoutput>#site_domain#/#site_template_dir##site_template#/#site_assets_dir##site_styles_dir##site_style_sheet#</cfoutput>");
 --->
<style type="text/css">
<!--
@import url("http://<cfoutput>#site_domain#/#site_template_dir##site_template#/#site_assets_dir##site_styles_dir##site_style_sheet#</cfoutput>");

-->
</style>
<script language="JavaScript1.2" type="text/javascript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}
function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

//-->
</script>
</head>

<body>
<cfif css_template EQ "1">
<!--\\ CSS Header //-->
<cfinclude template="#site_template_dir##site_template#/#site_header_dir##site_header#">
<!---\\ CSS Body //--->
<cfinclude template="#site_template_dir##site_template#/index.cfm">
<cfinclude template="#site_template_dir##site_template#/#site_footer_dir##site_footer#">
<!---\\ CSS FOOTER //--->
<cfelse>
<!---\\For Debugging the Breadcrumbs //--->
<!---<cfoutput>#cgi.SCRIPT_NAME#</cfoutput>--->
<table width="<cfoutput>#site_width#</cfoutput>" border="0" align="center" cellpadding="0" cellspacing="0" class="main_table">
  <tr>
    <td colspan="3" <cfif #site_template# NEQ "Default">valign="bottom"</cfif>><!---\\Header//--->
    <cfif isDefined('site_header') and site_header NEQ "">
        <!---<cfinclude template="#site_template_dir##site_template#/#site_header_dir#header.cfm">--->        <cfinclude template="#site_template_dir##site_template#/#site_header_dir##site_header#">
    <cfelseif NOT isDefined('site_header') or site_header EQ "">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="300" height="100"><img src="http://<cfoutput>#site_domain#/#site_template_dir##site_template#/#site_assets_dir#</cfoutput>web_os.jpg" width="300" height="100" /></td>
    <td>Welcome to <cfoutput>#site_name#</cfoutput><br />
    <cfif module_sitesearch EQ "1">
    <cfinclude template="#site_modules_dir#sitesearch/index.cfm">
    </cfif><br />
    <cfif module_banners EQ "1">
    <cfinclude template="#site_modules_dir#banners/index.cfm">
    </cfif>
    </td>
  </tr>
  <tr>
    <td height="2" colspan="2" >&nbsp;</td>
  </tr>
  <tr>
    <td height="25" colspan="2" background="http://<cfoutput>#site_domain#/#site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="breadcrumb_nav">
	<cfif module_breadcrumbs EQ "1">
    <cfinclude template="#site_modules_dir#/breadcrumbs/index.cfm">
    <cfelse>
    <!-- BreadCrumbs Module Not Loaded -->
    </cfif>
	
    </td>
    </tr>
  <tr>
    <td height="2" colspan="2" >&nbsp;</td>
  </tr>
</table>
   </cfif>
    </td>
  </tr>
<tr>
<td>
<!---\\ This Will load the templates index file if it is defined and exisits //--->
<cfif isDefined('template_file') and template_file NEQ "">
<!---\\We Know it's defined, but will we find it?//--->
<cfset load_template = #template_file#>
<cfif FileExists(ExpandPath("#site_template_dir##site_template#/#load_template#"))>
<!---\\ We found the template, so We're going to load it! //--->
<cfinclude template="#site_template_dir##site_template#/#load_template#">
<cfelse>
<!---\\ We didn't Find the Template so We're going to load the Default Layout //--->
<!---\\This is The Main Content//--->
<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">
<tr>
  <!---\\Left Column//--->
  <cfif left_col_active EQ "1">
      <td width="<cfoutput>#left_col_width#</cfoutput>" align="left" valign="top" class="left_col">
<cfoutput>
<cfloop query="left_boxes">
<cfinclude template="../../#site_template_dir##site_template#/#site_sidebox_dir##side_box_filename#">
</cfloop>
</cfoutput>
</td>
  </cfif>    
  <!---\\Main Column//--->  
    <td align="center" valign="top">
	<cfif NOT isdefined('url.module')>
     <cfif module_spotlights EQ "1">
     <cfinclude template="#site_modules_dir#spotlights/index.cfm">
     <br />
     <cfinclude template="#site_modules_dir#mainpage/index.cfm">
     <cfelse>
     <cfif module_mainpage EQ "1">
      <cfinclude template="#site_modules_dir#mainpage/index.cfm">
      <cfelse>
      <!--\\The Main Page Module was not loaded//-->
      </cfif>
     </cfif>
      <br />
     <cfelseif isDefined('url.module')>
      <cfif #url.module# EQ "articles">
       <!---\\ Articles Module //--->
       <cfif isDefined('url.section') and #url.section# EQ "archives">
       <cfinclude template="#site_modules_dir#articles/archives.cfm">
       <cfelse>
       <cfinclude template="#site_modules_dir#articles/index.cfm">
       </cfif>
	  <cfelseif #url.module# EQ "blog">
       <!---\\ Blog Module //--->
       <cfinclude template="#site_modules_dir#blog/index.cfm">
      <cfelseif #url.module# EQ "chat">
       <!---\\ Chat Module //--->
       <!---ForDebugging--->
       <cfif isDefined('session.goodUser') and session.goodUser eq "Yes"> 
         <cfinclude template="#site_modules_dir#chat/enter_chat.cfm">
        <cfelse>
         <cfinclude template="#site_modules_dir#chat/index.cfm">
      </cfif>
      <cfelseif #url.module# EQ "dyk">
       <!---\\ Did You Know Module //--->
       <cfelseif #url.module# EQ "forum">
       <!---\\ Forum Module //--->
       <cfinclude template="#site_modules_dir#forum/index.cfm">
      <cfelseif #url.module# EQ "gallery">
       <!---\\ Image Gallery Module //--->
       <cfinclude template="#site_modules_dir#gallery/index.cfm">
       <cfelseif #url.module# EQ "inquiry">
       <!---\\ Contact Us Module //--->
       <cfif isDefined('url.action') and #url.action# EQ "send">
        <cfif send_html_email EQ "1">
           <cfmail to="#site_email#" from="webos_online_inquiry@webos.com" server="#site_mail_server#" username="#site_mail_user#" password="#site_mail_server#" type="html" subject="Online Inquiry">
           <cfinclude template="#site_template_dir##site_template#/#site_modules_dir#/inquiry/email.cfm">
           </cfmail>
        <cfelse>
         <cfmail to="#site_email#" from="webos_online_inquiry@webos.com" server="#site_mail_server#" username="#site_mail_user#" password="#site_mail_server#" subject="Online Inquiry">
         </cfmail>
        </cfif>   
    
       <cfelse>
        <cfinclude template="#site_modules_dir#inquiry/index.cfm">
       </cfif>
      <cfelseif #url.module# EQ "links">
       <!---\\ Links Directory Module //--->
       <cfinclude template="#site_modules_dir#links/index.cfm">
      <cfelseif #url.module# EQ "news">
       <!---\\ News Module //--->
       <cfinclude template="#site_modules_dir#news/index.cfm">
      <cfelseif #url.module# EQ "pages">
       <!---\\ Pages Module //--->
        <cfif isDefined('url.pageid')>
         <cfset page_id ="#url.pageid#">
		 <cfinclude template="#site_modules_dir#pages/index.cfm">
        <cfelseif NOT isDefined('url.pageid')>
         <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="<cfoutput>#site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">Error 404: Page Not Found!</td>
  </tr>
  <tr>
    <td>Either the page you are looking for no longer exists, or it has moved.<br /><br />
    Another cause for this type of Error is that the link link you clicked to get to this page didnot contain a PageID, or contained an invlaid PageID.<br /><Br />
    Please check your links, and try again.</td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle">&nbsp;</td>
  </tr>
</table>
        </cfif> 
      <cfelseif #url.module# EQ "podcasts">
       <!---\\ PodCasts Module //--->
       <cfinclude template="#site_modules_dir#podcasts/index.cfm">
      <cfelseif #url.module# EQ "polls">
      <cfinclude template="#site_modules_dir#polls/index.cfm">
       <!---\\ Polls Module //--->
      <cfelseif #url.module# EQ "ratesticker">
       <!---\\ Rates Ticker Module //--->
       <cfinclude template="#site_modules_dir#ratesticker/index.cfm">
      <cfelseif #url.module# EQ "rss">
       <!---\\ RSS Feeds Module //--->
       <cfinclude template="#site_modules_dir#rss/index.cfm">
      <cfelseif #url.module# EQ "sitemap">
       <!---\\ SiteMap Module //--->
       <cfinclude template="#site_modules_dir#sitemap/index.cfm">
      <cfelseif #url.module# EQ "sitesearch">
      <cfinclude template="#site_modules_dir#sitesearch/search_results.cfm">
       <!---\\ Site Search Module //--->
      <cfelseif #url.module# EQ "stockticker">
      <cfinclude template="#site_modules_dir#stockticker/index.cfm">
       <!---\\ Stock ticker Module //--->
      <cfelseif #url.module# EQ "taxforms">
      <cfinclude template="#site_modules_dir#taxforms/index.cfm">
       <!---\\ Tax Forms Module //--->
      <cfelseif #url.module# EQ "tellafriend">
       <!---\\ Tell a Friend Module //--->
       <cfif isDefined('url.action') and #url.action# EQ "tellem">
        <cfif send_html_email EQ "1">
           <cfmail to="#site_email#" from="webos_online_inquiry@webos.com" server="#site_mail_server#" username="#site_mail_user#" password="#site_mail_server#" type="html" subject="#Form.Friend_Name#, #Form.Your_Name# has Recommended You checkout #site_name#!">
           </cfmail>
        <cfelse>
         <cfmail to="#site_email#" from="webos_online_inquiry@webos.com" server="#site_mail_server#" username="#site_mail_user#" password="#site_mail_server#" subject="#Form.Friend_Name#, #Form.Your_Name# has Recommended You checkout #site_name#!">
         </cfmail>
        </cfif>   
    
       <cfelse>
        <cfinclude template="#site_modules_dir#tellafriend/index.cfm">
       </cfif>
       <cfelseif #url.module# EQ "zipsearch">
       <!---\\ Zip Code Search Module //--->
      <cfinclude template="#site_modules_dir#zipsearch/index.cfm">
       
      </cfif>
	</cfif>
	</td>
  <!---\\Right Column//--->  
    <cfif right_col_active EQ "1">
      <td width="<cfoutput>#right_col_width#</cfoutput>" align="right" valign="top" class="right_col">
	  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  
  <tr>
    <td><cfoutput>
<cfloop query="right_boxes">
<cfinclude template="../../#site_template_dir##site_template#/#site_sidebox_dir##side_box_filename#">
</cfloop>
</cfoutput></td>
  </tr>
  </cfif>
</table>
<!---\\End of the Main Content //--->
</cfif>
<cfelseif template_file EQ "">
<!---\\This is The Main Content//--->
<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">
<tr>
  <!---\\Left Column//--->
  <cfif left_col_active EQ "1">
      <td width="<cfoutput>#left_col_width#</cfoutput>" align="left" valign="top" class="left_col">
<!---\\ Pages box: pages_menu.cfm //--->
<cfif module_pages EQ "1">
<cfinclude template="#site_template_dir##site_template#/#site_left_col#pages_menu.cfm">
</cfif>
<br />
<!---\\ Blog box: blog_posts.cfm //--->
<cfif module_blog EQ "1">
<cfinclude template="#site_template_dir##site_template#/#site_left_col#blog_posts.cfm">
</cfif>
<br />
<!---\\ Sections box: site_modules.cfm //--->
<br />
<cfinclude template="#site_template_dir##site_template#/#site_left_col#site_modules.cfm">
<br />
<!---\\ Articles boxes: articles.cfm & articles_archives //--->
<cfif module_articles EQ "1">
<cfinclude template="#site_template_dir##site_template#/#site_left_col#articles.cfm">
<br />
<cfinclude template="#site_template_dir##site_template#/#site_left_col#articles_archives.cfm">
</cfif>
<br />
<cfif module_sitesearch EQ "1">
<cfinclude template="#site_template_dir##site_template#/#site_left_col#site_search.cfm">
</cfif>
<br />
</td>
  </cfif>    
  <!---\\Main Column//--->  
    <td align="center" valign="top">
	<cfif NOT isdefined('url.module')>
     <cfif module_spotlights EQ "1">
     <cfinclude template="#site_modules_dir#spotlights/index.cfm">
     <br />
     <cfinclude template="#site_modules_dir#mainpage/index.cfm">
     <cfelse>
     <cfif module_mainpage EQ "1">
      <cfinclude template="#site_modules_dir#mainpage/index.cfm">
      <cfelse>
      <!--\\The Main Page Module was not loaded//-->
      </cfif>
     </cfif>
      <br />
     <cfelseif isDefined('url.module')>
      <cfif #url.module# EQ "articles">
       <!---\\ Articles Module //--->
       <cfif isDefined('url.section') and #url.section# EQ "archives">
       <cfinclude template="#site_modules_dir#articles/archives.cfm">
       <cfelse>
       <cfinclude template="#site_modules_dir#articles/index.cfm">
       </cfif>
	  <cfelseif #url.module# EQ "blog">
       <!---\\ Blog Module //--->
       <cfinclude template="#site_modules_dir#blog/index.cfm">
      <cfelseif #url.module# EQ "chat">
       <!---\\ Chat Module //--->
       <!---ForDebugging--->
       <cfif isDefined('session.goodUser') and session.goodUser eq "Yes"> 
         <cfinclude template="#site_modules_dir#chat/enter_chat.cfm">
        <cfelse>
         <cfinclude template="#site_modules_dir#chat/index.cfm">
      </cfif>
      <cfelseif #url.module# EQ "dyk">
       <!---\\ Did You Know Module //--->
       <cfelseif #url.module# EQ "forum">
       <!---\\ Forum Module //--->
       <cfinclude template="#site_modules_dir#forum/index.cfm">
      <cfelseif #url.module# EQ "gallery">
       <!---\\ Image Gallery Module //--->
       <cfinclude template="#site_modules_dir#gallery/index.cfm">
       <cfelseif #url.module# EQ "inquiry">
       <!---\\ Contact Us Module //--->
       <cfif isDefined('url.action') and #url.action# EQ "send">
        <cfif send_html_email EQ "1">
           <cfmail to="#site_email#" from="webos_online_inquiry@webos.com" server="#site_mail_server#" username="#site_mail_user#" password="#site_mail_server#" type="html" subject="Online Inquiry">
           <cfinclude template="#site_template_dir##site_template#/#site_modules_dir#/inquiry/email.cfm">
           </cfmail>
        <cfelse>
         <cfmail to="#site_email#" from="webos_online_inquiry@webos.com" server="#site_mail_server#" username="#site_mail_user#" password="#site_mail_server#" subject="Online Inquiry">
         </cfmail>
        </cfif>   
    
       <cfelse>
        <cfinclude template="#site_modules_dir#inquiry/index.cfm">
       </cfif>
      <cfelseif #url.module# EQ "links">
       <!---\\ Links Directory Module //--->
       <cfinclude template="#site_modules_dir#links/index.cfm">
      <cfelseif #url.module# EQ "news">
       <!---\\ News Module //--->
       <cfinclude template="#site_modules_dir#news/index.cfm">
      <cfelseif #url.module# EQ "pages">
       <!---\\ Pages Module //--->
        <cfif isDefined('url.pageid')>
         <cfset page_id ="#url.pageid#">
		 <cfinclude template="#site_modules_dir#pages/index.cfm">
        <cfelseif NOT isDefined('url.pageid')>
         <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="<cfoutput>#site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">Error 404: Page Not Found!</td>
  </tr>
  <tr>
    <td>Either the page you are looking for no longer exists, or it has moved.<br /><br />
    Another cause for this type of Error is that the link link you clicked to get to this page didnot contain a PageID, or contained an invlaid PageID.<br /><Br />
    Please check your links, and try again.</td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle">&nbsp;</td>
  </tr>
</table>
        </cfif> 
      <cfelseif #url.module# EQ "podcasts">
       <!---\\ PodCasts Module //--->
       <cfinclude template="#site_modules_dir#podcasts/index.cfm">
      <cfelseif #url.module# EQ "polls">
      <cfinclude template="#site_modules_dir#polls/index.cfm">
       <!---\\ Polls Module //--->
      <cfelseif #url.module# EQ "ratesticker">
       <!---\\ Rates Ticker Module //--->
       <cfinclude template="#site_modules_dir#ratesticker/index.cfm">
      <cfelseif #url.module# EQ "rss">
       <!---\\ RSS Feeds Module //--->
       <cfinclude template="#site_modules_dir#rss/index.cfm">
      <cfelseif #url.module# EQ "sitemap">
       <!---\\ SiteMap Module //--->
       <cfinclude template="#site_modules_dir#sitemap/index.cfm">
      <cfelseif #url.module# EQ "sitesearch">
      <cfinclude template="#site_modules_dir#sitesearch/search_results.cfm">
       <!---\\ Site Search Module //--->
      <cfelseif #url.module# EQ "stockticker">
      <cfinclude template="#site_modules_dir#stockticker/index.cfm">
       <!---\\ Stock ticker Module //--->
      <cfelseif #url.module# EQ "taxforms">
      <cfinclude template="#site_modules_dir#taxforms/index.cfm">
       <!---\\ Tax Forms Module //--->
      <cfelseif #url.module# EQ "tellafriend">
       <!---\\ Tell a Friend Module //--->
       <cfif isDefined('url.action') and #url.action# EQ "tellem">
        <cfif send_html_email EQ "1">
           <cfmail to="#site_email#" from="webos_online_inquiry@webos.com" server="#site_mail_server#" username="#site_mail_user#" password="#site_mail_server#" type="html" subject="#Form.Friend_Name#, #Form.Your_Name# has Recommended You checkout #site_name#!">
           </cfmail>
        <cfelse>
         <cfmail to="#site_email#" from="webos_online_inquiry@webos.com" server="#site_mail_server#" username="#site_mail_user#" password="#site_mail_server#" subject="#Form.Friend_Name#, #Form.Your_Name# has Recommended You checkout #site_name#!">
         </cfmail>
        </cfif>   
    
       <cfelse>
        <cfinclude template="#site_modules_dir#tellafriend/index.cfm">
       </cfif>
       
      </cfif>
	</cfif>
	</td>
  <!---\\Right Column//--->  
    <cfif right_col_active EQ "1">
      <td width="<cfoutput>#right_col_width#</cfoutput>" align="right" valign="top" class="right_col">
	  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" align="center" valign="middle" background="<cfoutput>#site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="col_title">Right Column Modules</td>
  </tr>
  <tr>
    <td><cfoutput query="right_modules">
      #module_name# <br />
      </cfoutput></td>
  </tr>
  </cfif>
</table>
<!---\\End of the Main Content //--->
</cfif>
<!---\\ End of the templates index loader code //--->
</td>  
</tr>
<cfif #site_template# NEQ "Default">
<cfelseif #site_template# EQ "Default">
  <tr>
    <td height="25" colspan="3" background="<cfoutput>#site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif">&nbsp;</td>
  </tr>
</cfif>  
  <tr>
  <td colspan="3" align="center" valign="middle" class="footer"><!---\\Footer//--->
       
	  <cfif isDefined('site_footer') and site_footer NEQ "">
        <cfinclude template="#site_template_dir##site_template#/#site_footer_dir##site_footer#">
    <cfelseif NOT isDefined('site_footer') or site_footer EQ "">
    <br />
<cfif module_banners EQ "1">
    <cfinclude template="#site_modules_dir#banners/index.cfm">
</cfif>
<br />
    &copy; Copyright <cfoutput>#DatePart('yyyy', Now())#</cfoutput> WebOS - All Rights Reserved <img src="<cfoutput>#site_template_dir#/#site_template#/#site_assets_dir#</cfoutput>poweredby.gif" align="absmiddle" />
      </cfif>
    </td>
  </tr>
</table>
</cfif>
</body>
</html>
