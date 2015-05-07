<!---
	Name         : podStats.cfm
	Author       : James Harvey
	Created      : August 08, 2007
	Last Updated : August 08, 2007
	History      : Version 1.0
--->
		<cfquery DataSource="#datasrc#" Name="get_posts">
					SELECT COUNT(bl.blID) as bcount
					FROM #table_blog# bl
					WHERE blPage <> 1 and bl.blDomain ='#application.siteDomain#'
				</cfquery>
		<cfquery DataSource="#datasrc#" Name="com">
					SELECT COUNT(ct.cID) as ccount
					FROM #table_blog_comments# ct where ct.cDomain ='#application.siteDomain#'
                    </cfquery>
		<cfquery DataSource="#datasrc#" Name="oldestDate">
					SELECT blDate
					FROM #table_blog# bl where bl.blDomain ='#application.siteDomain#'
					ORDER BY blDate ASC 
				</cfquery>
				
		<cfset bcount = get_posts.bcount>
		<cfset ccount = com.ccount>
		<cfoutput maxrows="1" startrow="1" query="oldestDate">
		  <cfset ndate = oldestDate.blDate>
		</cfoutput>
        <table width="180" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="templates/<cfoutput>#site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">WebOS Blog Stats</td>
  </tr>
  <tr>
    <td> <div id="categories"> <cfoutput> Posts: <cfif isDefined("bcount")>#bcount#</cfif><br>
            Comments: <cfif isDefined("ccount")>#ccount#</cfif><br>
            Since: <cfif isDefined("ndate")>#DateFormat(ndate, "mmmm yyyy")# </cfif></cfoutput> </div> </td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle"></td>
  </tr>
</table>