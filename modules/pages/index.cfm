<!---\\ Module Configuration //--->
<cfset module ="pages">
<!---\\ End of Module Configuration //---->

<!---\\ The Content For your Site's Pages //--->
<!---\\ This query is for loading the page Contents when the module is called //--->
   <CFQUERY NAME="pages_content" datasource="#datasrc#">
   SELECT * FROM  #table_pages# where page_status ='1' and page_id='#page_id#'
   </CFQUERY>
<cfif css_template EQ "1">
<cfoutput query="pages_content">
<div id="welcome" class="post">
			<h2 class="title"><span>#page_title#</span></h2>
			
			</div>
			<div class="meta">
				<p>#page_content#</p>
                <cfif module_didyouknow EQ "1">
    <br />
     <cfinclude template="../didyouknow/index.cfm">
    </cfif>
			</div>
		</div>
</cfoutput>
<cfelse>
<cfoutput query="pages_content">
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">#page_title#</td>
  </tr>
  <tr>
    <td>#page_content#</td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle">
    <cfif module_didyouknow EQ "1">
    <br />
     <cfinclude template="../didyouknow/index.cfm">
    </cfif>
    </td>
  </tr>
</table>
</cfoutput>
</cfif>
