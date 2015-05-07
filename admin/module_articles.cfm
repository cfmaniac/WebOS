<cf_headfoot>
<cfparam name="attributes.script" default="Login FrameWork">
<cfparam name="attributes.page" default="Articles & Article Archive Administration">
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
<!---\\ Add Function //--->
<cfif isDefined('url.Add') and #url.Add# is "yes">
<CFTRANSACTION>
 <CFQUERY DataSource="#datasrc#" Name="add_article">
  INSERT INTO #table_articles# (article_title, article_description, article_source, article_create_date, article_active, article_archived, article_premium)
  VALUES ('#form.article_title#', <cfif isDefined('form.#editor_name#')>'#form.articlescontent#',<cfelseif NOT isDefined('form.#editor_name#')>'#form.articlescontentAdv#',</cfif> '#form.article_source#', '#form.article_create_date#', '#form.article_active#', '#form.article_archived#', '#form.article_premium#')
  </CFQUERY>
</CFTRANSACTION>
  <cflocation url="module_articles.cfm?do=m" addToken="No">
</CFIF>
<!---\\ url.Delete Function //--->
<cfif isDefined('url.Delete') and #url.Delete# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="delete_articles">
	DELETE FROM #table_articles#	WHERE article_id = #url.id#
  </CFQUERY>
  </CFTRANSACTION>
  <cflocation url="module_articles.cfm?do=m" addToken="No">
</cfif>
<!---\\url.Update Functions//--->
<cfif isDefined('url.Update') and #url.Update# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="update_articles">
  UPDATE #table_articles# SET article_title='#form.article_title#', article_description=<cfif isDefined('form.#editor_name#')>'#form.articlescontent#',<cfelseif NOT isDefined('form.#editor_name#')>'#form.articlescontentAdv#',</cfif> article_source='#form.article_source#', article_create_date='#form.article_create_date#', article_active='#form.article_active#', article_archived='#form.article_archived#', article_premium='#form.article_premium#'  WHERE article_id = '#form.article_id#'  
			</CFQUERY>
  </CFTRANSACTION>
  <cflocation url="module_articles.cfm?do=m" addToken="No">
</cfif>  

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
    <td width="100" valign="top"><img src="assets/modules/modules_articles.jpg" alt="WebOS Site Configuration" width="100" height="100" /><br />
      <br />
      <cfif do EQ "a">
      <b><a href="?do=a">Add An Article</a><br /></b>
      <cfelse>
      <a href="?do=a">Add a Article</a><br />
      </cfif>
      <br />

      <cfif do NEQ "m">
      <a href="?do=m">Back to Main</a>
      </cfif>
      </td>
      
    <td valign="top"><cfif do EQ "m">
    <!---\\ Intro Text //--->
    Welcome <b><cfoutput>#session.user#</cfoutput></b>, to the WebOS <b><cfoutput>#attributes.page#</cfoutput></b> Page. Here you can  add, edit and delete Form fields on your WebOS Articles.
      <hr width="95%" align="center"/>
<CFQUERY DataSource="#datasrc#" Name="display_articles">
			SELECT *
			FROM #table_articles# </CFQUERY>
    
   <table width="100%"  border="0" cellspacing="1" cellpadding="5">
  <tr align="center" bgcolor="#9CB6DE">
    <td width="25" align="left" bgcolor="#E2E6E7"><span class="style1"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Article ID</font></span></td>
    <td bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Article Title</strong></font></span></td>
    <td width="9%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Article Active</strong></font></span></td>
    <td width="18%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Article Premium</strong></font></span></td>
    <td width="18%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Article Archived</strong></font></span></td>
    <td width="6%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Edit</strong></font></span></td>
    <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Delete</strong></font></span></td>
  </tr>
  <CFLOOP QUERY="display_articles" StartRow="1" EndRow="#display_articles.RecordCount#">
    <CFOUTPUT>
      <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
        <td width="25">#display_articles.article_id#</td>
        <td align="center">#display_articles.article_title#</td>
        <td align="center"><cfif #display_articles.article_active# EQ "1">
        Active
        <cfelseif #display_articles.article_active# EQ "0">
        In-Active
        </cfif>        </td>
          <td align="center"><cfif #display_articles.article_premium# EQ "1">
          Yes
          <cfelseif #display_articles.article_premium# EQ "0">
          No
          </cfif></td>
          <td align="center">
		  <cfif #display_articles.article_archived# EQ "1">
          Archived
          <cfelseif #display_articles.article_archived# EQ "0">
          Not Archived
          </cfif>          </td>
        <td align="center"><A HREF="?do=e&id=#display_articles.article_id#"><IMG SRC="assets/icons/icon_edit_topic.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="e"></A></td>
        <td align="center"><A HREF="?do=d&id=#display_articles.article_id#"><IMG SRC="assets/icons/icon_delete_reply.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="d"></A></td>
      </tr>
      <CFIF row_color EQ 1>
        <CFSET row_color = 0>
        <CFELSE>
        <CFSET row_color = 1>
      </CFIF>
    </CFOUTPUT>
  </CFLOOP>
</table>
    <cfelseif do EQ "a">
     <form name="add_article" action="?Add=yes" method="post">
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Add New Article</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #e2e6e7;">
    <tr>
    <td align="left" valign="top"></td>
    <td>&nbsp;</td>
    <td align="left" valign="top"><input type="hidden" name="article_create_date" value="<cfoutput>#DateFormat(now(), 'MM/DD/YYYY')#</cfoutput>"/>
    </td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Article Title:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="article_title" type="text" id="article_title" size="25" /></td>
  </tr>
  <cfinclude template="functions/wysiwyg.cfm">
  <tr>
    <td width="48%" align="left" valign="top">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Archive this Article?</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="article_archived" type="radio" value="1" />Yes &nbsp;<input name="article_archived" type="radio" value="0"/>No</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Article is Premium?</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="article_premium" type="radio" value="1" />No &nbsp;<input name="article_premium" type="radio" value="0" />No</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Activate this Article?</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="article_active" type="radio" value="1" />Active &nbsp;<input name="article_active" type="radio" value="0" />In-Active</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Author of this Article:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">    <cfquery name="who_online" datasource="#datasrc#">
SELECT	*
FROM 	#table_admins#
where userid = '#Session.adminid#'
</cfquery>


    <input name="article_source" type="text" id="article_source" size="20" value="<cfoutput query="who_online">#who_online.username#</cfoutput>"/></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="right" valign="top"><input type="image" name="Submit" id="Submit" src="assets/buttons/submit.jpg" /></td>
  </tr>
</table>
</td>
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
</form>
    <cfelseif do EQ "e">
    <CFQUERY DataSource="#datasrc#" Name="edit_article">
			SELECT *
			FROM #table_articles# where article_id ='#url.id#'
</CFQUERY>
<form name="edit_article" action="?Update=yes" method="post">
<input type="hidden" name="article_id" value="<cfoutput>#url.id#</cfoutput>">
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Edit Article</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left" valign="top">Article Created on:</td>
    <td>&nbsp;</td>
    <td align="left" valign="top"><cfif #edit_article.article_create_date# EQ ""><input type="hidden" name="article_create_date" value="<cfoutput>#DateFormat(now(), 'MM/DD/YYYY')#</cfoutput>"/>
    <cfelse>
    <cfoutput>#DateFormat(edit_article.article_create_date, 'MM/DD/YYYY')#</cfoutput>
    <input type="hidden" name="article_create_date" value="<cfoutput>#edit_article.article_create_date#</cfoutput>"/>
    </cfif>
    </td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Article Title:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="article_title" type="text" id="article_title" size="25" value="<cfoutput>#edit_article.article_title#</cfoutput>"/></td>
  </tr>
  <cfinclude template="functions/wysiwyg.cfm">
  <tr>
    <td width="48%" align="left" valign="top">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Archive this Article?</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="article_archived" type="radio" value="1" <cfif #edit_article.article_archived# EQ "1">checked </cfif>/>Yes &nbsp;<input name="article_archived" type="radio" value="0" <cfif #edit_article.article_archived# EQ "0">checked </cfif>/>No</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top"> Article is premium?</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="article_premium" type="radio" value="1" <cfif #edit_article.article_premium# EQ "1">checked </cfif>/>Yes &nbsp;<input name="article_premium" type="radio" value="0" <cfif #edit_article.article_premium# EQ "0">checked </cfif>/>No</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Activate this Article?</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="article_active" type="radio" value="1" <cfif #edit_article.article_active# EQ "1">checked </cfif>/>Active &nbsp;<input name="article_active" type="radio" value="0" <cfif #edit_article.article_active# EQ "0">checked </cfif>/>In-Active</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Author of this Article:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="article_source" type="text" id="article_source" size="20" value="<cfoutput>#edit_article.article_source#</cfoutput>"/></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="right" valign="top"><input type="image" name="Submit" id="Submit" src="assets/buttons/submit.jpg" /></td>
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
</form>

<cfelseif do EQ "d">
<CFQUERY DataSource="#datasrc#" Name="delete_article">
			SELECT *
			FROM #table_articles# where article_id ='#url.id#'
</CFQUERY>
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Delete Article</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
  Are you Certain you want to delete the form field: <b><cfoutput>#delete_article.article_title#</cfoutput></b><br />
  <br />
   <a href="?Delete=yes&id=<cfoutput>#url.id#</cfoutput>">Yes</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="module_articles.cfm">No</a></td>
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
    </cfif>    </td>
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