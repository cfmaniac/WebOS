<cf_headfoot>
<cfparam name="attributes.script" default="Login FrameWork">
<cfparam name="attributes.page" default="Blog Administration">
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
<!---\\ url.Add Function //--->
<cfif isDefined('url.Add') and #url.Add# is "yes">
<CFTRANSACTION>
 <CFQUERY DataSource="#datasrc#" Name="add_blog">
  INSERT INTO #table_blog# (blTitle, blText, blText2, blCategory, blLink, blUser, blDomain)
  VALUES ('#form.bltitle#', '#form.bltext#', '#form.bltext2#', '#form.blcategory#', '#form.bllink#', '#form.bluser#', '#form.bldomain#')
 </CFQUERY>
</CFTRANSACTION>
 <cflocation url="module_blog.cfm?do=m" addtoken="no">
</CFIF>
<!---\\ Add Category Function //--->
<cfif isDefined('url.Add_Cat') and #url.Add_Cat# is "yes">
<CFTRANSACTION>
 <CFQUERY DataSource="#datasrc#" Name="add_blog_cat">
  INSERT INTO #table_blog_cats# (ctCat, ctDomain)
  VALUES ('#form.cat_name#', '#form.cat_domain#')
 </CFQUERY>
</CFTRANSACTION>
 <cflocation url="module_blog.cfm?do=m" addtoken="no">
</CFIF>
<!---\\ url.Delete Function //--->
<cfif isDefined('url.Delete') and #url.Delete# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="delete_post">
	DELETE FROM #table_blog# WHERE blId = #id#
  </CFQUERY>
  </CFTRANSACTION>
   <cflocation url="module_blog.cfm?do=m" addtoken="no">
</cfif>
<!---\\url.Update Functions//--->
<cfif isDefined('url.Update') and #url.Update# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="update_blog">
  UPDATE #table_blog# SET blTitle='#form.bltitle#', blText='#form.bltext#', blText2='#form.bltext2#', blCategory='#form.blcategory#', blUser='#form.bluser#', blDomain='#form.bldomain#' WHERE blID ='#form.id#' 
			</CFQUERY>
  </CFTRANSACTION>
   <cflocation url="module_blog.cfm?do=m" addtoken="no">
</cfif>  
<cfif isDefined('url.Delete_cat') and #url.Delete_cat# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="delete_post">
	DELETE FROM #table_blog_cats# WHERE ctId = #id#
  </CFQUERY>
  </CFTRANSACTION>
   <cflocation url="module_blog.cfm?do=m" addtoken="no">
</cfif>
<!---\\url.Update Functions//--->
<cfif isDefined('url.Ed_Cat') and #url.Ed_Cat# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="update_blog_cat">
  UPDATE #table_blog_cats# SET ctCat='#form.cat_name#', ctDomain='#form.cat_domain#' WHERE ctID ='#form.id#' 
			</CFQUERY>
  </CFTRANSACTION>
   <cflocation url="module_blog.cfm?do=m" addtoken="no">
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
    <td width="100" valign="top"><img src="assets/modules/modules_blog.jpg" alt="WebOS Site Configuration" width="100" height="100" /><br />
      <br />
      <cfif do EQ "a">
      <b><a href="?do=a">Add a Post</a><br /></b>
      <cfelse>
      <a href="?do=a">Add a Post</a><br />
      </cfif>
      <br />
      <cfif do EQ "a_cat">
	  <b><a href="?do=a_cat">Add  Category</a></b>
      <cfelse>
      <a href="?do=a_cat">Add Category</a>
      </cfif>
      <br /><br />
      <cfif do EQ "e_cat" or do EQ "ed_cat">
      <b><a href="?do=e_cat">Edit Category</a></b>
      <cfelse>
      <a href="?do=e_cat">Edit Category</a>
	  </cfif>
      <br /><br />
      <a href="?do=e_cat">
      <cfif do NEQ "m">
      <a href="?do=m">Back to Main</a>
      </cfif>      </td>
      
    <td valign="top"><cfif do EQ "m">
    <!---\\ Intro Text //--->
    Welcome <b><cfoutput>#session.user#</cfoutput></b>, to the WebOS
     
    <b><cfoutput>#attributes.page#</cfoutput></b> Page. Here you can  add, edit and delete Entries in your WebOS Blog.
      <hr width="95%" align="center"/><br />
      <CFQUERY DataSource="#datasrc#" Name="display_blog">
SELECT blID, blTitle, blDate, blCategory, blLink, blView, blPage,
(SELECT COUNT(ct.cbid) FROM #table_blog_comments# ct WHERE ct.cbid = blID) AS pnum, blDomain
			FROM #table_blog# where blDomain='#cgi.HTTP_HOST#'
</CFQUERY>
<table width="100%"  border="0" cellspacing="1" cellpadding="5">
  <tr align="center" bgcolor="#9CB6DE">
    <td width="51%" align="left" bgcolor="#E2E6E7"><span class="style1"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Title</font></span></td>
    <td width="18%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Category</strong></font></span></td>
    <td width="9%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Domain</strong></font></span></td>
    <td width="18%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Comments</strong></font></span></td>
    <td width="9%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Date</strong></font></span></td>
    <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Link</strong></font></span></td>
    <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Views</strong></font></span></td>
    <td width="6%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Edit</strong></font></span></td>
    <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Delete</strong></font></span></td>
  </tr>
  <CFLOOP QUERY="display_blog" StartRow="1" EndRow="#display_blog.RecordCount#">
    <CFOUTPUT>
      <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
        <td>#display_blog.blTitle#</td>
        <td align="center">#display_blog.blCategory#</td>
        <td align="center">#display_blog.blDomain#</td>
          <td align="center">(
          <cfif display_blog.pnum NEQ 0>
            <A HREF="edit_comment.cfm?id=#get_posts.blID#" class="style7">#get_posts.pnum#</A>
            <cfelse>
            #display_blog.pnum#
          </cfif>
          
          )</td>
        <td align="left" nowrap>#dateformat(display_blog.blDate,"mm/dd/yyyy")# #TimeFormat(display_blog.blDate, "h:mm:tt")#</td>
        <td align="center"><CFIF display_blog.blLink IS "">
            None
            <CFELSE>
            Yes
          </CFIF></td>
        <td align="center">#display_blog.blView#</td>
        <td align="center"><A HREF="?do=e&id=#display_blog.blID#"><IMG SRC="assets/icons/icon_edit_topic.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="e"></A></td>
        <td align="center"><A HREF="?do=d&id=#display_blog.blID#"><IMG SRC="assets/icons/icon_delete_reply.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="d"></A></td>
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
    <CFQUERY DataSource="#datasrc#" Name="get_cat">
			SELECT ctID, ctCat
			FROM #table_blog_cats# 
		</CFQUERY>
     <form name="add_post" action="?Add=yes" method="post">
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Add New Blog Entry</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="18%" align="right" valign="top">Title</td>
      <td width="82%"><input name="bltitle" type="text" size="50" ></td>
    </tr>
    <tr>
      <td align="right" valign="top">Category</td>
      <td><select name="blcategory">
          <CFLOOP QUERY="get_cat" StartRow="1" EndRow="#get_cat.RecordCount#">
            <CFOUTPUT>
              <option value="#get_cat.ctCat#">#get_cat.ctCat#</option>
            </CFOUTPUT>
          </CFLOOP>
        </select></td>
    </tr>
    <tr>
      <td align="right" valign="top">Intro (summary) Text</td>
      <td valign="top">
        <textarea name="bltext" id="bltext" cols="130" rows="70" style="width:100%; height:250px;"></textarea>
        <script language="javascript1.2">
  generate_wysiwyg('bltext');
</script>      </td>
    </tr>
    
    <tr>
      <td align="right" valign="top" height="400"><cfoutput>Article (fullStory) Text</CFOUTPUT></td>
      <td valign="top"><textarea name="bltext2" id="bltext2" cols="130" rows="70" style="width:100%; height:250px;"></textarea>
        <script language="javascript1.2">
  generate_wysiwyg('bltext2');
</script>      </td>
    </tr>
    <tr>
      <td align="right" valign="top">Assigned to Domain</td>
      <td>
      <input name="bldomain" type="text" size="50" >
      </td>
    </tr>
    <tr>
      <td align="right" valign="top">Link</td>
      <td><input name="bllink" type="text" size="50" ></td>
    </tr>
    <tr>
      <td align="right" valign="top">External Page</td>
      <td><input name="blPage" type="checkbox" Value="1" ></td>
    </tr>
    <tr>
      <td align="right"><cfquery name="who_online" datasource="#datasrc#">
SELECT	*
FROM 	#table_admins#
where userid = '#Session.adminid#'
</cfquery>
<input type="hidden" name="bluser" value="<cfoutput>#who_online.username#</cfoutput>">
</td>
      <td align="right" valign="top"><input type="image" name="Submit" id="Submit" src="assets/buttons/submit.jpg" /></td>
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
<cfelseif do EQ "a_cat">
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Add Blog Category</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><form name="new_post" method="post" action="?Add_Cat=yes">
    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="18%" align="right" valign="top">Category Name</td>
        <td width="82%"><input name="cat_name" type="text" size="50" value=""></td>
      </tr>
      <tr>
        <td width="18%" align="right" valign="top">Available on Domain:</td>
        <td width="82%">
      <input name="cat_domain" type="text" size="50" Value="">
    </td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td align="right" valign="top"><input type="image" name="Submit" id="Submit" src="assets/buttons/submit.jpg" /></td>
      </tr>
    </table>
    </form></td>
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

<cfelseif do EQ "e">
<cfquery name="edit_post" datasource="#datasrc#">
Select * from #table_blog# where blid='#url.id#'
</cfquery>
<CFQUERY DataSource="#datasrc#" Name="get_cat">
			SELECT ctID, ctCat
			FROM #table_blog_cats# 
		</CFQUERY>
<form action="?Update=yes" name="edit_post" method="post">
    <input type="hidden" name="id" value="<cfoutput>#url.id#</cfoutput>">
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Edit Blog Entry</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="18%" align="right" valign="top">Title</td>
      <td width="82%"><input name="bltitle" type="text" size="50" value="<cfoutput>#edit_post.blTitle#</CFOUTPUT>"></td>
    </tr>
    <tr>
      <td align="right" valign="top">Category</td>
      <td><select name="blcategory">
          <option value="<cfoutput>#edit_post.blCategory#</CFOUTPUT>"><cfoutput>#edit_post.blCategory#</CFOUTPUT></option>
          <CFLOOP QUERY="get_cat" StartRow="1" EndRow="#get_cat.RecordCount#">
            <CFOUTPUT>
              <option value="#get_cat.ctCat#">#get_cat.ctCat#</option>
            </CFOUTPUT>
          </CFLOOP>
        </select></td>
    </tr>
    <tr>
      <td align="right" valign="top">Intro (summary) Text</td>
      <td valign="top"><cfset blText = Replace(HTMLEditFormat(edit_post.blText), "<", "&","ALL")>
        <textarea name="bltext" id="bltext" cols="130" rows="70" style="width:100%; height:250px;"><cfoutput>#blText#</CFOUTPUT></textarea>
        <script language="javascript1.2">
  generate_wysiwyg('bltext');
</script>      </td>
    </tr>
    <cfset blText2 = Replace(HTMLEditFormat(edit_post.blText2), "<", "&","ALL")>
    <tr>
      <td align="right" valign="top" height="400"><cfoutput>Article (fullStory) Text</CFOUTPUT></td>
      <td valign="top"><textarea name="bltext2" id="bltext2" cols="130" rows="70" style="width:100%; height:250px;"><cfoutput>#blText2#</CFOUTPUT></textarea>
        <script language="javascript1.2">
  generate_wysiwyg('bltext2');
</script>      </td>
    </tr>
    <tr>
      <td align="right" valign="top">Assigned to Domain</td>
      <td>
      <input name="bldomain" type="text" size="50" Value="<cfoutput>#edit_post.blDomain#</cfoutput>">
      </td>
    </tr>
    <tr>
      <td align="right" valign="top">Link</td>
      <td><input name="bllink" type="text" size="50" Value="<cfoutput>#edit_post.blLink#</CFOUTPUT>"></td>
    </tr>
    <tr>
      <td align="right" valign="top">External Page</td>
      <td><input name="blPage" type="checkbox" Value="1" <cfif edit_post.blPage EQ 1>checked</cfif>></td>
    </tr>
    <tr>
      <td align="right"><cfquery name="who_online" datasource="#datasrc#">
SELECT	*
FROM 	#table_admins#
where userid = '#Session.adminid#'
</cfquery>
<input type="hidden" name="bluser" value="<cfoutput>#who_online.username#</cfoutput>"></td>
      <td align="right" valign="top"><input type="image" name="Submit" id="Submit" src="assets/buttons/submit.jpg" /></td>
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
<cfelseif do EQ "e_cat">
<cfquery name="edit_cat" datasource="#datasrc#">
Select * from #table_blog_cats#
</cfquery>
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Edit Blog Category</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><table width="100%"  border="0" cellspacing="1" cellpadding="5">
  <tr align="center" bgcolor="#9CB6DE">
    <td width="51%" align="left" bgcolor="#E2E6E7"><span class="style1"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Title</font></span></td>
    <td width="9%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Domain</strong></font></span></td>
    <td width="6%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Edit</strong></font></span></td>
    <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Delete</strong></font></span></td>
  </tr>
  <CFLOOP QUERY="edit_cat" StartRow="1" EndRow="#edit_cat.RecordCount#">
    <CFOUTPUT>
      <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
        <td>#edit_cat.ctCat#</td>
        <td align="center">#edit_cat.ctDomain#</td>
          <td align="center"><A HREF="?do=ed_cat&id=#edit_cat.ctID#"><IMG SRC="assets/icons/icon_edit_topic.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="e"></A></td>
        <td align="center"><A HREF="?do=d_cat&id=#edit_cat.ctID#"><IMG SRC="assets/icons/icon_delete_reply.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="d"></A></td>
      </tr>
      <CFIF row_color EQ 1>
        <CFSET row_color = 0>
        <CFELSE>
        <CFSET row_color = 1>
      </CFIF>
    </CFOUTPUT>
  </CFLOOP>
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
<CFELSEIF do IS "ed_cat">
<cfquery name="edit_cat" datasource="#datasrc#">
Select * from #table_blog_cats# where ctId='#url.id#'
</cfquery>
<form name="new_post" method="post" action="?Ed_Cat=yes">
    <input type="hidden" name="id" value="<cfoutput>#edit_cat.ctID#</cfoutput>">
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Edit Blog Category</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="18%" align="right" valign="top">Category Name</td>
        <td width="82%"><input name="cat_name" type="text" size="50" value="<cfoutput>#edit_cat.ctCat#</cfoutput>" /></td>
      </tr>
      <tr>
        <td width="18%" align="right" valign="top">Available on Domain:</td>
        <td width="82%">
      <input name="cat_domain" type="text" size="50" Value="<cfoutput>#edit_cat.ctDomain#</cfoutput>">    </td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td align="right" valign="top"><input type="image" name="Submit2" id="Submit2" src="assets/buttons/submit.jpg" /></td>
      </tr>
    </table> </td>
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
<cfelseif do EQ "d_cat">
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Delete Blog Category</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
  Are you Certain you want to delete the category?<br />
  <br />
   <a href="?Delete_cat=yes&id=<cfoutput>#url.id#</cfoutput>">Yes</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="module_blog.cfm">No</a></td>
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
<cfelseif do EQ "d">
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Delete Blog Entry</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
  Are you Certain you want to delete the post?<b></b><br />
  <br />
   <a href="?Delete=yes&id=<cfoutput>#url.id#</cfoutput>">Yes</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="module_blog.cfm">No</a></td>
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