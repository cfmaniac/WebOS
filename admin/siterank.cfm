<cf_headfoot>
<cfparam name="attributes.script" default="Login FrameWork">
<cfparam name="attributes.page" default="Website Page Rank Utility">
<!---\\ Module Functions (add, edit, update, delete) Go here //--->
<CFPARAM name="row_color" default="1">
<cfif NOT isDefined('url.do')>
<CFPARAM name="do" default="m">
<cfelseif isDefined('url.do')>
<CFPARAM name="do" default="#url.do#">
</cfif>
<CFPARAM name="Delete" default="no">
<CFPARAM name="Update" default="none">
<CFPARAM name="Add" default="none">
<CFPARAM name="message" default="none">
<CFPARAM name="inPage" default="0">

<!---\\ End of Module Functions //--->
<!--- See if user has access level rights to this page --->
<cfif ListFindNoCase("#allusers#", session.permissions, ",")>
<style type="text/css">
<!--
.style1 {
	font-size: 11px;
	font-weight: bold;
}
-->
</style>
<!--- BEGINNING OF YOUR CONTENT --->
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1"><cfoutput>#attributes.page#</cfoutput></span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr><td><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100" valign="top"><img src="assets/modules/modules_config.jpg" alt="WebOS Site Configuration" width="100" height="100" /></td>
    <td valign="top"><cfif #view_page_rank# EQ "1">
            <!---\\ Page Rank Section //--->
            <cfset getRank = createObject("component","getRank").init() />
             <!---\\The Tag below is for a Single Website//--->
<cfset aCheck = ListToArray("www.#site_domain#") />
    <!---\\the Tag Below is for multiple Sites //--->
    <!---\\Each Site Listed will be returned//--->
    <!---<cfset aCheck = ListToArray("www.yahoo.com,www.msn.com,www.aol.com,www.adobe.com,www.google.com,www.yakhnov.info,www.travellerspoint.com") />--->
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="3"><div align="center"><strong>Your Website's Page Rank:</strong></div></td>
  </tr>
  <cfloop index="i" from="1" to="#ArrayLen(aCheck)#">
  <tr>
    <td width="48%" align="left" valign="top"><cfoutput>#aCheck[i]#</cfoutput> on Alexa:</td>
    <td width="2%" align="left" valign="top">&nbsp;</td>
    <td width="48%" align="left" valign="top"><cfoutput><b>#getRank.getAlexaRank(aCheck[i])#</b></cfoutput></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top"><cfoutput>#aCheck[i]#</cfoutput> on Google:</td>
    <td width="2%" align="left" valign="top">&nbsp;</td>
    <td width="48%" align="left" valign="top"><cfoutput><b>#getRank.getGoogleRank(aCheck[i])#</b></cfoutput></td>
  </tr>
  </cfloop>
</table>
    <!---\\End of Page Rank//--->
	 </cfif></td>
    </tr>
</table></td>
</tr>
</table></td>
   <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
   
  </tr>
  <tr>
   <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c1" alt="" /></td>
   <td background="assets/main_box/admin_r3_c2.jpg">&nbsp;</td>
   <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c3" alt="" /></td>
   
  </tr>
</table>
<!--- END OF YOUR CONTENT --->
<cfelse>
You are not authorized to view this page.
</cfif>
</cf_headfoot>