<!---\\ Module Configuration //--->
<cfset module ="polls">

<!---\\ End of Module Configuration //--->
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title"><cfoutput>#page_title#</cfoutput></td>
  </tr>
  <tr>
    <td>
    <cfif NOT isDefined('url.action') or url.action EQ "">
    <cfinclude template="poll_booth.cfm">
    <cfelseif isDefined('url.action') and url.action EQ "results">
    <cfinclude template="results_booth.cfm">
    <cfelseif isDefined('url.action') and url.action EQ "past_results">
    <cfinclude template="past_results.cfm">
    </cfif>
    </td>
  </tr>
  
</table>