<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        
      <tr>
        <td><img name="local_content_r1_c1" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_content_r1_c1.jpg" width="12" height="10" border="0" id="local_content_r1_c1" alt="" /></td>
        <td><img name="local_content_r1_c2" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_content_r1_c2.jpg" width="10" height="10" border="0" id="local_content_r1_c2" alt="" /></td>
        <td colspan="2"><img name="local_content_r1_c3" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_content_r1_c3.jpg" width="737" height="10" border="0" id="local_content_r1_c3" alt="" /></td>
        <td><img name="local_content_r1_c5" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_content_r1_c5.jpg" width="10" height="10" border="0" id="local_content_r1_c5" alt="" /></td>
        <td><img name="local_content_r1_c6" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_content_r1_c6.jpg" width="11" height="10" border="0" id="local_content_r1_c6" alt="" /></td>
        <td><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>spacer.gif" width="1" height="10" border="0" alt="" /></td>
      </tr>
      <tr>
        <td width="12" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_content_r2_c1.jpg">&nbsp;</td>
        <td width="10" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_content_r2_c2.jpg">&nbsp;</td>
        <td colspan="2" valign="top"><!---\\This is The Main Content//--->
<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">
<tr>
  <!---\\Left Column//--->
  <cfif left_col_active EQ "1">
      <td width="<cfoutput>#left_col_width#</cfoutput>" align="left" valign="top" class="left_col"><cfoutput>
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
     <cfinclude template="../../#site_modules_dir#spotlights/index.cfm">
     <br />
     <cfinclude template="../../#site_modules_dir#mainpage/index.cfm">
     <cfelse>
     <cfif module_mainpage EQ "1">
      <cfinclude template="../../#site_modules_dir#mainpage/index.cfm">
      <cfelse>
      <!--\\The Main Page Module was not loaded//-->
      </cfif>
     </cfif>
      <br />
     <cfelseif isDefined('url.module')>
      <cfif #url.module# EQ "articles">
       <!---\\ Articles Module //--->
       <cfif isDefined('url.section') and #url.section# EQ "archives">
       <cfinclude template="../../#site_modules_dir#articles/archives.cfm">
       <cfelse>
       <cfinclude template="../../#site_modules_dir#articles/index.cfm">
       </cfif>
	  <cfelseif #url.module# EQ "blog">
       <!---\\ Blog Module //--->
       <cfinclude template="../../#site_modules_dir#blog/index.cfm">
      <cfelseif #url.module# EQ "chat">
       <!---\\ Chat Module //--->
       <!---ForDebugging--->
       <cfif isDefined('session.goodUser') and session.goodUser eq "Yes"> 
         <cfinclude template="../../#site_modules_dir#chat/enter_chat.cfm">
        <cfelse>
         <cfinclude template="../../#site_modules_dir#chat/index.cfm">
      </cfif>
      <cfelseif #url.module# EQ "dyk">
       <!---\\ Did You Know Module //--->
       <cfelseif #url.module# EQ "forum">
       <!---\\ Forum Module //--->
       <cfinclude template="../../#site_modules_dir#forum/index.cfm">
      <cfelseif #url.module# EQ "gallery">
       <!---\\ Image Gallery Module //--->
       <cfinclude template="../../#site_modules_dir#gallery/index.cfm">
       <cfelseif #url.module# EQ "inquiry">
       <!---\\ Contact Us Module //--->
       <cfif isDefined('url.action') and #url.action# EQ "send">
        <cfif send_html_email EQ "1">
           <cfmail to="#site_email#" from="webos_online_inquiry@webos.com" server="#site_mail_server#" username="#site_mail_user#" password="#site_mail_server#" type="html" subject="Online Inquiry">
           <cfinclude template="#site_template_dir##site_template#/../../#site_modules_dir#/inquiry/email.cfm">
           </cfmail>
        <cfelse>
         <cfmail to="#site_email#" from="webos_online_inquiry@webos.com" server="#site_mail_server#" username="#site_mail_user#" password="#site_mail_server#" subject="Online Inquiry">
         </cfmail>
        </cfif>   
    
       <cfelse>
        <cfinclude template="../../#site_modules_dir#inquiry/index.cfm">
       </cfif>
      <cfelseif #url.module# EQ "links">
       <!---\\ Links Directory Module //--->
       <cfinclude template="../../#site_modules_dir#links/index.cfm">
      <cfelseif #url.module# EQ "news">
       <!---\\ News Module //--->
       <cfinclude template="../../#site_modules_dir#news/index.cfm">
       <cfelseif #url.module# EQ "newsletter">
       <!---\\ News Module //--->
       <cfinclude template="../../#site_modules_dir#newsletter/index.cfm">
      <cfelseif #url.module# EQ "pages">
       <!---\\ Pages Module //--->
        <cfif isDefined('url.pageid')>
         <cfset page_id ="#url.pageid#">
		 <cfinclude template="../../#site_modules_dir#pages/index.cfm">
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
       <cfinclude template="../../#site_modules_dir#podcasts/index.cfm">
      <cfelseif #url.module# EQ "polls">
      <cfinclude template="../../#site_modules_dir#polls/index.cfm">
       <!---\\ Polls Module //--->
      <cfelseif #url.module# EQ "ratesticker">
       <!---\\ Rates Ticker Module //--->
       <cfinclude template="../../#site_modules_dir#ratesticker/index.cfm">
      <cfelseif #url.module# EQ "rss">
       <!---\\ RSS Feeds Module //--->
       <cfinclude template="../../#site_modules_dir#rss/index.cfm">
      <cfelseif #url.module# EQ "sitemap">
       <!---\\ SiteMap Module //--->
       <cfinclude template="../../#site_modules_dir#sitemap/index.cfm">
      <cfelseif #url.module# EQ "sitesearch">
      <cfinclude template="../../#site_modules_dir#sitesearch/index.cfm">
       <!---\\ Site Search Module //--->
      <cfelseif #url.module# EQ "stockticker">
      <cfinclude template="../../#site_modules_dir#stockticker/index.cfm">
       <!---\\ Stock ticker Module //--->
      <cfelseif #url.module# EQ "taxforms">
      <cfinclude template="../../#site_modules_dir#taxforms/index.cfm">
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
        <cfinclude template="../../#site_modules_dir#tellafriend/index.cfm">
       </cfif>
       <cfelseif #url.module# EQ "users">
       <!---\\ PodCasts Module //--->
       <cfinclude template="../../#site_modules_dir#users/index.cfm">
        <cfelseif #url.module# EQ "zipsearch">
       <!---\\ Zip Code Search Module //--->
      <cfinclude template="../../#site_modules_dir#zipsearch/index.cfm">
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
</td>
        <td width="10" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_content_r2_c5.jpg">&nbsp;</td>
        <td width="11" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_content_r2_c6.jpg">&nbsp;</td>
      </tr>
      <tr>
        <td><img name="local_content_r3_c1" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_content_r3_c1.jpg" width="12" height="10" border="0" id="local_content_r3_c1" alt="" /></td>
        <td><img name="local_content_r3_c2" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_content_r3_c2.jpg" width="10" height="10" border="0" id="local_content_r3_c2" alt="" /></td>
        <td colspan="2"><img name="local_content_r3_c3" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_content_r3_c3.jpg" width="737" height="10" border="0" id="local_content_r3_c3" alt="" /></td>
        <td><img name="local_content_r3_c5" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_content_r3_c5.jpg" width="10" height="10" border="0" id="local_content_r3_c5" alt="" /></td>
        <td><img name="local_content_r3_c6" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_content_r3_c6.jpg" width="11" height="10" border="0" id="local_content_r3_c6" alt="" /></td>
        <td><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>spacer.gif" width="1" height="10" border="0" alt="" /></td>
      </tr>
      <tr>
        <td><img name="local_content_r4_c1" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_content_r4_c1.jpg" width="12" height="20" border="0" id="local_content_r4_c1" alt="" /></td>
        <td><img name="local_content_r4_c2" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_content_r4_c2.jpg" width="10" height="20" border="0" id="local_content_r4_c2" alt="" /></td>
        <td colspan="2"><img name="local_content_r4_c3" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_content_r4_c3.jpg" width="737" height="20" border="0" id="local_content_r4_c3" alt="" /></td>
        <td><img name="local_content_r4_c5" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_content_r4_c5.jpg" width="10" height="20" border="0" id="local_content_r4_c5" alt="" /></td>
        <td><img name="local_content_r4_c6" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>local_content_r4_c6.jpg" width="11" height="20" border="0" id="local_content_r4_c6" alt="" /></td>
        <td><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>spacer.gif" width="1" height="20" border="0" alt="" /></td>
      </tr>
    </table>
