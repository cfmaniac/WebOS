<cf_headfoot>
<cfparam name="attributes.script" default="WebOS Admin Panel">
<cfparam name="attributes.page" default="WebOS News Administration">
<!---The Actual Functions and Database Queries //--->
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

<!---\\ Add Function //--->
<cfif isDefined('url.Add') and #url.Add# is "yes">
<CFTRANSACTION>
 <CFQUERY DataSource="#datasrc#" Name="add_article">
  INSERT INTO #table_a_news# (news_title, news_content, news_date)
  VALUES ('#form.news_title#', '#form.news_content#', '#form.news_date#')
  </CFQUERY>
</CFTRANSACTION>
  <cflocation url="admin_news.cfm?do=m" addToken="No">
</CFIF>
<!---\\ url.Delete Function //--->
<cfif isDefined('url.Delete') and #url.Delete# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="delete_admin_news">
	DELETE FROM #table_a_news# WHERE news_id = #url.id#
  </CFQUERY>
  </CFTRANSACTION>
  <cflocation url="admin_news.cfm?do=m" addToken="No">
</cfif>
<!---\\url.Update Functions//--->
<cfif isDefined('url.Update') and #url.Update# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="update_admin_news">
  UPDATE #table_a_news# SET news_title='#form.news_title#', news_content='#form.news_content#' WHERE news_id = '#form.news_id#'
			</CFQUERY>
  </CFTRANSACTION>
  <cflocation url="admin_news.cfm?do=m" addToken="No">
</cfif>
<!---\\Default //--->
<CFQUERY DataSource="#datasrc#" Name="display_admin_news">
			SELECT *
			FROM #table_a_news# </CFQUERY>
<!---\\ End //--->
<!--- See if user has access level rights to this page --->
<script language="javascript" type="text/javascript" src="assets/scripts/common.js">
</script>
<script type="text/javascript">
<!--
var txt_advanced_editor_warning = "Advanced editor mode cannot be enabled, as this mode is available only in the following web browsers:\nIE5.5+ (Windows)\nLatest version of Netscape, Mozilla & Firefox (Windows)";
var isHTML_Editor = (
		(localBFamily == 'MSIE' && parseInt(localVersion) >= 5) || 
		(localBrowser == 'Netscape' && parseInt(localVersion) >= 8) || 
		((localBrowser == 'Firefox' || localBrowser == 'Mozilla') && parseInt(localVersion) >= 1) || 
		(localBrowser == 'Opera' && parseInt(localVersion) >= 9)
	);
var isHTML_EditorFF = (localBrowser == 'Firefox');
-->
</script>
<script src="assets/scripts/wysiwyg/innovaeditor.js" language="JavaScript" type="text/javascript"></script>

<style type="text/css">
<!--
.style1 {
	color: #6C7A83;
	font-weight: bold;
}
.style2 {color: #6C7A83}
-->
</style>

<cfif ListFindNoCase("#adminsonly#", session.permissions, ",")>
<!--- BEGINNING OF YOUR CONTENT --->
<table border="0" cellpadding="5" cellspacing="0" width="100%" style="border:1px solid #e2e6e7;">
<tbody><tr>
	<td class="cellBlueTopAndBottom" bgcolor="#e2e6e7">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="80%"><b><cfoutput>#attributes.page#</cfoutput></b></td>
    <td width="20%" align="right" valign="top"><a href="?do=a"><img src="assets/icons/list_unordered_on.gif" alt="Add" width="20" height="20" border="0" align="absmiddle" />Add News</a></td>
  </tr>
</table>

	</td>
</tr>
<tr>
	<td valign="top"><span class="style2">Welcome, from here you Add, Edit, Delete Administrator News of your Website Back-end.</span><br />	  <hr width="95%" />
<!---\\ This is Where all the Functions will be Applied //--->
<CFIF do IS "m">
<!---\\ Default Display //--->
<table width="100%"  border="0" cellspacing="1" cellpadding="5">
  <tr align="center" bgcolor="#9CB6DE">
    <td width="25" align="left" bgcolor="#E2E6E7"><span class="style1"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">News ID</font></span></td>
    <td bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>News Content</strong></font></span></td>
    <td width="9%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>&nbsp;</strong></font></span></td>
    <td width="18%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>News Date</strong></font></span></td>
    <td width="6%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Edit</strong></font></span></td>
    <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Delete</strong></font></span></td>
  </tr>
  <CFLOOP QUERY="display_admin_news" StartRow="1" EndRow="#display_admin_news.RecordCount#">
    <CFOUTPUT>
      <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
        <td width="25">#display_admin_news.news_id#</td>
        <td align="center">#display_admin_news.news_content#</td>
        <td align="center">&nbsp;</td>
          <td align="center">
		  #display_admin_news.news_date#
          </td>
        <td align="center"><A HREF="?do=e&id=#display_admin_news.news_id#"><IMG SRC="assets/icons/icon_edit_topic.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="e"></A></td>
        <td align="center"><A HREF="?do=d&id=#display_admin_news.news_id#"><IMG SRC="assets/icons/icon_delete_reply.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="d"></A></td>
      </tr>
      <CFIF row_color EQ 1>
        <CFSET row_color = 0>
        <CFELSE>
        <CFSET row_color = 1>
      </CFIF>
    </CFOUTPUT>
  </CFLOOP>
</table>
<CFELSEIF do IS "a">
<!---\\ Add Display //--->
<table border="0" cellpadding="5" cellspacing="0" width="100%" style="border:1px solid #e2e6e7;">
<tbody><tr>
	<td class="cellBlueTopAndBottom" bgcolor="#e2e6e7">
		<img src="assets/icons/list_unordered_on.gif" width="20" height="20" border="0" align="absmiddle" />Adding WebOS News: </td>
</tr>
<tr>
	<td valign="top">
    <form name="add_article" action="?Add=yes" method="post">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #e2e6e7;">
    <tr>
    <td align="left" valign="top"></td>
    <td>&nbsp;</td>
    <td align="left" valign="top"><input type="hidden" name="news_date" value="<cfoutput>#DateFormat(now(), 'MM/DD/YYYY')#</cfoutput>"/>
    </td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">News Title:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="news_title" type="text" id="news_title" size="25" /></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">News Content:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><textarea name="news_content" id="news_content" cols="100" rows="70" style="width:100%; height:250px;"></textarea>
    <script language="javascript1.2">
  generate_wysiwyg('news_content');
</script>    </td>
  </tr>

  <tr>
    <td width="48%" align="left" valign="top">Author of this Article:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">    <cfquery name="who_online" datasource="#datasrc#">
SELECT	*
FROM 	#table_admins#
where userid = '#Session.adminid#'
</cfquery>


    <input name="news_source" type="text" id="news_source" size="20" value="<cfoutput query="who_online">#who_online.username#</cfoutput>"/></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="right" valign="top"><input type="image" name="Submit" id="Submit" src="assets/main/_buttons/submit.jpg" /></td>
  </tr>
</table>
</form>
</td>
</tr>


</tbody></table>
<CFELSEIF do IS "e">
<!---\\ Edit/Update Display //--->
<CFQUERY DataSource="#datasrc#" Name="edit_article">
			SELECT *
			FROM #table_a_news# where news_id ='#url.id#'
</CFQUERY>
<form name="edit_article" action="?Update=yes" method="post">
<input type="hidden" name="news_id" value="<cfoutput>#url.id#</cfoutput>">
<table border="0" cellpadding="5" cellspacing="0" width="100%" style="border:1px solid #e2e6e7;">
<tbody><tr>
	<td class="cellBlueTopAndBottom" bgcolor="#e2e6e7">
		<img src="assets/icons/icon_edit_topic.gif" width="15" height="15" border="0" align="absmiddle" />Editting WebOS News: <b><cfoutput>#edit_article.news_title#</cfoutput></b></td>
</tr>
<tr>
	<td valign="top">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left" valign="top">News Item Created on:</td>
    <td>&nbsp;</td>
    <td align="left" valign="top">
    <input type="hidden" name="news_date" value="<cfoutput>#edit_article.news_date#</cfoutput>"/>

    </td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">News Title:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="news_title" type="text" id="news_title" size="25" value="<cfoutput>#edit_article.news_title#</cfoutput>"/></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">News Content:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><textarea name="news_content" id="news_content" cols="100" rows="70" style="width:100%; height:250px;"><cfoutput>#edit_article.news_content#</cfoutput></textarea>
    <script language="javascript1.2">
  generate_wysiwyg('news_content');
</script>    </td>
  </tr>
<tr>
    <td width="48%" align="left" valign="top">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="right" valign="top"><input type="image" name="Submit" id="Submit" src="assets/main/_buttons/submit.jpg" /></td>
  </tr>
</table>
</form>
</td>
</tr>


</tbody></table>
<CFELSEIF do IS "d">
<CFQUERY DataSource="#datasrc#" Name="delete_article">
			SELECT *
			FROM #table_a_news# where news_id ='#url.id#'
</CFQUERY>
<!---\\ url.Delete Display //--->
<table border="0" cellpadding="5" cellspacing="0" width="100%" style="border:1px solid #e2e6e7;">
<tbody><tr>
	<td class="cellBlueTopAndBottom" bgcolor="#e2e6e7">
		<img src="assets/icons/warning.jpg" width="29" height="25" align="absmiddle" /><b>Delete Article: <cfoutput>#delete_article.news_title#</cfoutput>?</b></td>
</tr>
<tr>
	<td valign="top">
    Are you sure you want to delete? <br>
    <br>
    <a href="?Delete=yes&id=<cfoutput>#id#</cfoutput>">Yes</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="module_.cfm">No</a>
  </center>
</td>
</tr>


</tbody></table>

</CFIF>
<!---\\ End of where all the functions //--->
</td>
</tr>


</tbody></table>

<!--- END OF YOUR CONTENT --->
<cfelse>
You are not authorized to view this page.
</cfif>


</cf_headfoot>
