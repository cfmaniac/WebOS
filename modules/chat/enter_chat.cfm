<cfoutput>
<cfif session.goodUser eq "Yes">
<!---<cfinclude template="chat.cfm">--->
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">WebOS Chat</td>
  </tr>
  <tr>
    <td><iframe width="100%" height="475px" frameborder="0" scrolling="auto" src="http://<cfoutput>#site_domain##site_folder##site_modules_dir#</cfoutput>chat/chat.cfm"></iframe></td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle"></td>
  </tr>
</table>
<cfelse>
 
</cfif>
</cfoutput>