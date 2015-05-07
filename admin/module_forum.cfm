<cf_headfoot>
<cfparam name="attributes.script" default="Login FrameWork">
<cfparam name="attributes.page" default="Forum Administration Page">
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
<cfif isDefined('url.do') and #url.do# EQ "add_forum">
<cftransaction>
<cfquery datasource="#datasrc#">
INSERT INTO #table_forum_rooms# (Title, Description, Active, Threads) VALUES ('#form.Title#','#form.description#', '#form.forum_active#', 0)
</cfquery>
</cftransaction>
<cflocation url="?do=m" addtoken="yes">
</cfif>
<cfif isDefined('url.delete') and #url.delete# EQ "yes">
<cftransaction>
<cfquery datasource="#datasrc#">
DELETE FROM #table_forum_entries# WHERE RoomID  = #form.RoomID#
</cfquery>
<cfquery datasource="#datasrc#">
DELETE FROM #table_forum_rooms# WHERE RoomID  = #form.RoomID#
</cfquery>
</cftransaction>
</cfif>
<cfif isDefined('url.do') and #url.do# EQ "edit">
<cftransaction>
<cfquery datasource="#datasrc#">
UPDATE #table_forum_rooms# SET Title='#form.Title#', Description='#form.description#', Active='#form.forum_active#' where RoomID ='#form.roomid#'
</cfquery>
</cftransaction>
<cflocation url="?do=m" addtoken="yes">
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
    <td width="100" valign="top"><img src="assets/modules/modules_forum.jpg" alt="WebOS Site Configuration" width="100" height="100" /><bR /><Br />
    <cfif do EQ "e">
    <b><a href="?do=e">Edit Forum</a></b><br /><br />
    <cfelse>
    <a href="?do=e">Edit Forum</a><bR /><br />
    </cfif>
    <cfif do EQ "a">
    <b><a href="?do=a">Add A Forum</a></b><br /><br />
    <cfelse>
    <a href="?do=a">Add A Forum</a><br /><br />
    </cfif>
    <cfif do NEQ "m">
    <a href="?do=m">Forums Main</a>
    </cfif>
    </td>
    <td valign="top"><cfif do EQ "m">
    <!---\\ Intro Text //--->

    Welcome <b><cfoutput>#session.user#</cfoutput></b>, to the WebOS <b><cfoutput>#attributes.page#</cfoutput></b> Page. Here you can  add, edit and delete Forum Posts, and Topics on your WebOS Site.
      <hr width="95%" align="center"/>
      <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Forum Statistics</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><table width="75%" border="0" align="center" cellpadding="0" cellspacing="0">
      <!---<tr>
        <td width="48%" class="style1"><strong>Total Number of Topics:</strong></td>
        <td width="2%">&nbsp;</td>
        <td width="48%"><cfquery name="total_topics" datasource="#datasrc#">
        select COUNT(*) as total from #table_forum_conf#
        </cfquery>
        <cfoutput><b>#total_topics.total#</b></cfoutput>        </td>
      </tr>--->
      <tr>
        <td width="48%" class="style1"><strong>Total Number of Forums:</strong></td>
        <td width="2%">&nbsp;</td>
        <td width="48%"><cfquery name="total_forums" datasource="#datasrc#">
        select COUNT(*) as total from #table_forum_rooms#
        </cfquery>
        <cfoutput><b>#total_forums.total#</b></cfoutput></td>
      </tr>
      <!---<tr>
        <td width="48%" class="style1"><strong>Total Number of Threads:</strong></td>
        <td width="2%">&nbsp;</td>
        <td width="48%"><cfquery name="total_threads" datasource="#datasrc#">
        select COUNT(*) as total from #table_forum_thread#
        </cfquery>
        <cfoutput><b>#total_threads.total#</b></cfoutput></td>
      </tr>--->
      <tr>
        <td width="48%" class="style1"><strong>Total Number of Messages:</strong></td>
        <td width="2%">&nbsp;</td>
        <td width="48%"><cfquery name="total_messages" datasource="#datasrc#">
        select COUNT(*) as total from #table_forum_entries#
        </cfquery>
        <cfoutput><b>#total_messages.total#</b></cfoutput></td>
      </tr>
      <tr>
        <td class="style1">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <!---<tr>
        <td class="style1">Total Number of Moderators:</td>
        <td>&nbsp;</td>
        <td><cfquery name="total_moderators" datasource="#datasrc#">
        select COUNT(*) as total from #table_forum_mod#
        </cfquery>
        <cfoutput><b>#total_moderators.total#</b></cfoutput></td>
      </tr>
      <tr>
        <td class="style1">Total Number of Ranks:</td>
        <td>&nbsp;</td>
        <td><cfquery name="total_ranks" datasource="#datasrc#">
        select COUNT(*) as total from #table_forum_ranks#
        </cfquery>
        <cfoutput><b>#total_ranks.total#</b></cfoutput></td>
      </tr>--->
      <tr>
        <td class="style1">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="style1">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
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
    <cfelseif do EQ "a">
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Add a Forum</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td align="center"><form name="add_forum" method="post" action="?do=add_forum">
  
  
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="48%">Forum Name:</td>
        <td width="2%">&nbsp;</td>
        <td width="48%"><input type="Text" name="Title" value="(Room Title)"  size="10"></td>
      </tr>
      <tr>
        <td width="48%">Forum Description:</td>
        <td width="2%">&nbsp;</td>
        <td width="48%"><textarea name="description" cols="10" rows="5">&nbsp;</textarea></td>
      </tr>
 
      <tr>
        <td width="48%">Forum Active:</td>
        <td width="2%">&nbsp;</td>
        <td width="48%"><input type="radio" name="forum_active" id="forum_active" value="1" /> Yes<input type="radio" name="forum_active" id="forum_active" value="0" /> No</td>
      </tr>
           <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td align="right"><input type="image" name="imageField" id="imageField" src="assets/buttons/submit.jpg" /></td>
      </tr>
    </table></form></td>
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
    <CFQUERY name="getRooms" datasource="#datasrc#">
			SELECT * FROM #table_forum_rooms# ORDER BY Title
    </CFQUERY>
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Forums List</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td align="center">Select A Forum To Edit:<br />
  <form name="edit" method="post" action="?do=e">
      <select name="RoomID" size="12">
			<cfoutput query="getRooms">
				<option value="#RoomID#">#Title# (#Threads#)
			</cfoutput>
			<option value=""><cfoutput>#RepeatString('&nbsp;',75)#</cfoutput>
			</select>
            <Br />
            With Selected Forum do:
            <input type="submit" value="Edit" name="choose">
            <input type="submit" value="Delete" name="choose">
            </form>
            <cfif isDefined('form.choose') and #form.choose# EQ "Edit">
            <cflocation addtoken="no" url="?do=edit_forum&room=#form.roomID#">
            <cfelseif isdefined('form.choose') and #form.choose# EQ "Delete">
            <form name="delete" action="?delete=Yes" method="post">
            <input type="hidden" name="roomID" value="<cfoutput>#form.roomID#</cfoutput>">
                <CFQUERY name="getRooms" datasource="#datasrc#">
			SELECT * FROM #table_forum_rooms# where RoomID='#form.roomID#'
    </CFQUERY>
            Are you Certain you want to Delete the Forum <i><cfoutput query="getRooms">#Title#</cfoutput></i>?<br />
            Doing so also removes all posts and messages as well.<br />
           <a href="javascript:document.delete.submit();">Yes</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="module_forum.cfm">No</a>       
            </cfif>
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
 <cfelseif do EQ "edit_forum">
  <CFQUERY name="getRooms" datasource="#datasrc#">
	SELECT * FROM #table_forum_rooms# where RoomID='#url.room#'
  </CFQUERY><cfoutput query="getRooms">
  <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Edit Forum:: <i>#title#</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="##ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td align="center"><form name="edit_forum" method="post" action="?do=edit">
  <input type="hidden" name="roomID" value="#url.room#" />
  
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="48%">Forum Name:</td>
        <td width="2%">&nbsp;</td>
        <td width="48%"><input type="Text" name="Title" value="#title#"  size="10"></td>
      </tr>
      <tr>
        <td width="48%">Forum Description:</td>
        <td width="2%">&nbsp;</td>
        <td width="48%"><textarea name="description" cols="10" rows="5">#description#</textarea></td>
      </tr>
 
      <tr>
        <td width="48%">Forum Active:</td>
        <td width="2%">&nbsp;</td>
        <td width="48%"><input type="radio" name="forum_active" id="forum_active" value="1" <cfif #active# EQ "1">selected</cfif>/> Yes<input type="radio" name="forum_active" id="forum_active" value="0" <cfif #active# EQ "0">selected</cfif>/> No</td>
      </tr>
           <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td align="right"><input type="image" name="imageField" id="imageField" src="assets/buttons/submit.jpg" /></td>
      </tr>
    </table></form>
    </cfoutput></td>
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
    
    <cfelseif do EQ "a_message">
    
    <cfelseif do EQ "e_message">
    
    <cfelseif do EQ "d_message">
    
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