<cf_headfoot>
<cfparam name="attributes.script" default="Login FrameWork">
<cfparam name="attributes.page" default="Links Directory Administration">
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
<cfif isdefined("form.link_img") and #form.link_img# NEQ ""> 
  <cfset upload_dir ="#site_location#templates\#site_template#\modules\links\link_img\">
  <cffile action="upload" filefield="link_img" destination="#upload_dir#" nameconflict="overwrite" accept="image/*" > 
  <cfset uploadedfile = "#upload_dir##file.serverfile#"> 
  <!---<cfoutput>#file.ServerFile#</cfoutput>--->
    </cfif>
<CFTRANSACTION>
 <CFQUERY DataSource="#datasrc#" Name="add_link">
  INSERT INTO #table_links# (link_cat, link, link_title, link_desc, link_img)
  VALUES ('#form.link_cat#', '#form.link#', '#form.link_title#', '#form.link_desc#', '#file.serverfile#')
 </CFQUERY>
 <cfquery datasource="#datasrc#" name="update_cat_links">
 select link_cat_links as link_count from #table_links_cat# where link_cat_id ='#form.link_cat#'
 </cfquery>
 <cfset links = #update_cat_links.link_count# +1>
 <cfquery datasource="#datasrc#" name="link_count">
 update #table_links_cat# set link_cat_links ='#links#' where link_cat_id ='#form.link_cat#'
 </cfquery>
</CFTRANSACTION>
  <cflocation url="module_links.cfm" addToken="No">
</CFIF>
<!---\\ url.Delete Function //--->
<cfif isDefined('url.Delete') and #url.Delete# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="delete_link">
	DELETE FROM #table_links#	WHERE link_id = '#url.id#'
  </CFQUERY>
  </CFTRANSACTION>
    <cflocation url="module_links.cfm" addToken="No">
</cfif>
<!---\\url.Update Functions//--->
<cfif isDefined('url.Update') and #url.Update# is "yes">
<cfif isdefined("form.link_img") and #form.link_img# NEQ ""> 
<cfset upload_dir ="#site_location#templates\#site_template#\modules\links\link_img\">
  <cffile action="upload" filefield="link_img" destination="#upload_dir#" nameconflict="overwrite" accept="image/*" > 
  <cfset uploadedfile = "#upload_dir##file.serverfile#"> 
  <!---<cfoutput>#file.ServerFile#</cfoutput>--->
    </cfif>
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="update_links">
  UPDATE #table_links# SET link_title='#form.link_title#', link_desc='#form.link_desc#', <cfif isdefined("form.link_img") and #form.link_img# NEQ "">link_img='#file.serverfile#',</cfif> link_cat='#form.link_cat#' WHERE link_id='#form.link_id#'
			</CFQUERY>
  </CFTRANSACTION>
    <cflocation url="module_links.cfm" addToken="No">
</cfif>  
<!---\\Update Functions//--->
<cfif isDefined('url.Update_cat') and #url.Update_cat# is "yes">
<!---\\ uploads the Specified Image and sets the name for the databae insert //--->
<cfif isdefined("form.link_cat_img") and #form.link_caT_img# NEQ ""> 
  <cfset upload_dir ="#site_location#templates\#site_template#\modules\links\cat_img\">
  <cffile action="upload" filefield="link_cat_img" destination="#upload_Dir#" nameconflict="overwrite" accept="image/*" > 
  <cfset uploadedfile = "#upload_dir##file.serverfile#"> 
  <!---<cfoutput>#file.ServerFile#</cfoutput>--->
    </cfif>
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="update_cat">
  UPDATE #table_links_cat# SET link_cat_title='#form.link_cat_title#', link_cat_description='#form.link_cat_desc#', <cfif isdefined("form.link_cat_img") and #form.link_caT_img# NEQ ""> link_cat_img='#file.ServerFile#',</cfif> link_cat_parent='#form.link_cat_parent#' WHERE link_cat_id='#form.link_cat_id#'
			</CFQUERY>
  </CFTRANSACTION>
    <cflocation url="module_links.cfm" addToken="No">
</cfif>
<!---\\ Add Category //--->  
<cfif isDefined('url.Add_cat') and #url.Add_cat# is "yes">
<cfif isdefined("form.link_cat_img") and #form.link_caT_img# NEQ ""> 
  <cfset upload_dir ="#site_location#templates\#site_template#\modules\links\cat_img\">
  <cffile action="upload" filefield="link_cat_img" destination="#upload_dir#" nameconflict="overwrite" accept="image/*" > 
  <cfset uploadedfile = "#upload_dir##file.serverfile#"> 
  <!---<cfoutput>#file.ServerFile#</cfoutput>--->
    </cfif>
<CFTRANSACTION>
 <CFQUERY DataSource="#datasrc#" Name="add_cat">
  INSERT INTO #table_links_cat# (link_cat_parent, link_cat_title, link_cat_description, link_cat_img)
  VALUES ('#form.link_cat_parent#', '#form.link_cat_title#', '#form.link_cat_desc#', '#file.serverfile#')
 </CFQUERY>
</CFTRANSACTION>
  <cflocation url="module_links.cfm" addToken="No">
</CFIF>
<!---\\ url.Delete Function //--->
<cfif isDefined('url.Delete_cat') and #url.Delete_cat# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="delete_cat">
	DELETE FROM #table_links_cat#	WHERE link_cat_id = '#url.id#'
  </CFQUERY>
  </CFTRANSACTION>
  <cflocation url="module_links.cfm" addToken="No">
</cfif>  
<!---\\ End of Module Functions //--->
<!--- See if user has access level rights to this page --->
<style type="text/css">
<!--
.style2 {color: #6C7A83}
-->
</style>
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
    <td width="100" valign="top"><img src="assets/modules/modules_links.jpg" alt="WebOS Site Configuration" width="100" height="100" />
    <br />
    <cfif do EQ "a">
    <a href="?do=a"><b>Add a Link</b></a><br /><br />
    <cfelse>
    <a href="?do=a">Add a Link</a><br /><br />
    </cfif>
    <cfif do EQ "a_cat">
    <a href="?do=a_cat"><b>Add a Link Category</b></a><br /><br />
    <cfelse>
    <a href="?do=a_cat">Add a Link Category</a><br /><Br />
    </cfif>
    <cfif do EQ "e_cat">
    <a href="?do=edit_cat"><b>Edit a Link Category</b></a><br /><br />
    <cfelse>
    <a href="?do=edit_cat">Edit a Link Category</a><br /><br />
    </cfif>
    <cfif do NEQ "m">
    <a href="?do=m">Back to Main</a>
    </cfif>
    </td>
    <td valign="top"><cfif do EQ "m">
    <!---\\ Intro Text //--->
    Welcome <b><cfoutput>#session.user#</cfoutput></b>, to the WebOS <b><cfoutput>#attributes.page#</cfoutput></b> Page. You can add/edit/delete both Links and Link Categories.
    <!---\\ Default Display //--->

    <hr width="95%" align="center"/>
    <CFQUERY DataSource="#datasrc#" Name="display_links">
			SELECT * FROM #table_links#
</CFQUERY>
    <table width="100%"  border="0" cellspacing="1" cellpadding="5">
  <tr align="center" bgcolor="#9CB6DE">
    <td width="51%" align="left" bgcolor="#E2E6E7"><span class="style1"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Title</font></span></td>
    <td width="18%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Category</strong></font></span></td>
    <td width="9%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Description</strong></font></span></td>
    <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Image</strong></font></span></td>
    <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Visits</strong></font></span></td>
    <td width="6%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Edit</strong></font></span></td>
    <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Delete</strong></font></span></td>
  </tr>
  <CFLOOP QUERY="display_links" StartRow="1" EndRow="#display_links.RecordCount#">
    <CFOUTPUT>
      <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
        <td>#display_links.link_title#</td>
        <td align="center">#display_links.link_cat#</td>
        <td align="center"><!---#display_links.link_desc#--->
        <cfset short_desc = Left(display_links.link_desc, 30)>
        #short_desc#        </td>
          <td align="center"><CFIF display_links.link_img IS "">
            None
            <CFELSE>
            <img Src="../#site_template_dir##site_template#/#site_modules_dir#/links/link_img/#link_img#" width="100" height="100"/>
          </CFIF></td>
        <td align="center">#display_links.visits#</td>
        <td align="center"><A HREF="?do=e&id=#display_links.link_ID#"><IMG SRC="assets/icons/icon_edit_topic.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="e"></A></td>
        <td align="center"><A HREF="?do=d&id=#display_links.link_ID#"><IMG SRC="assets/icons/icon_delete_reply.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="d"></A></td>
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
    <cfquery name="link_add_cats" datasource="#datasrc#">
Select * from #table_links_cat# 
</cfquery>
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Add a Link</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><form name="add_link" action="?Add=yes" method="post" enctype="multipart/form-data">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="48%" align="left" valign="top">Link Title:</td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top"><input type="text" name="link_title" id="link_title" value=""/></td>
      </tr>
      <!---<cfinclude template="functions/wysiwyg.cfm">--->
      <tr>
       <td width="48%" align="left" valign="top">Link Description:</td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top"><textarea name="link_desc" id="link_desc" cols="45" rows="5"></textarea></td>
      </tr>
      <tr>
        <td width="48%" align="left" valign="top">Link Category:</td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top"><select name="link_cat">
        <cfoutput>
        <cfloop query="link_add_cats">
        <option value="#link_add_cats.link_cat_id#" >#link_add_cats.link_cat_title#</option>
        </cfloop>
        </cfoutput>
        </select></td>
      </tr>
      <tr>
        <td width="48%" align="left" valign="top">URL for Link:</td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top"><input type="text" name="link" id="link" /></td>
      </tr>
      <tr>
        <td width="48%" align="left" valign="top">Link Image:</td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top"><input name="link_img" id="link_img" type="file" /><br /> 
        </td>
      </tr>
      <tr>
        <td width="48%" align="left" valign="top">&nbsp;</td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td width="48%" align="left" valign="top">&nbsp;</td>
        <td width="2%">&nbsp;</td>
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
<CFELSEIF do IS "a_cat">
<cfquery name="link_add_cats" datasource="#datasrc#">
Select * from #table_links_cat# 
</cfquery>
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Add a Link Category</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><form name="add_link_cat" action="?Add_cat=yes" method="post" enctype="multipart/form-data">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="48%" align="left" valign="top">Category Title:</td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top"><input type="text" name="link_cat_title" id="link_cat_title" value=""/></td>
      </tr>
      <tr>
        <td width="48%" align="left" valign="top">Category Description:</td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top"><textarea name="link_cat_desc" id="link_cat_desc" cols="45" rows="5"></textarea></td>
      </tr>
      <tr>
        <td width="48%" align="left" valign="top">Category Parent:</td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top"><select name="link_cat_parent">
        <option value="0">Root Category</option>
        <cfoutput>
        <cfloop query="link_add_cats">
        <option value="#link_add_cats.link_cat_id#" >#link_add_cats.link_cat_title#</option>
        </cfloop>
        </cfoutput>
        </select></td>
      </tr>
      <tr>
        <td width="48%" align="left" valign="top">Category Image:</td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top"><!---<input type="text" name="link_cat_img" id="link_cat_img" />---><input name="link_cat_img" id="link_cat_img" type="file" /><!---<br /> Current Category Image:<br />
        <img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#links/images/#link_cat_edit.link_cat_img#</cfoutput>" />---></td>
      </tr>
      <tr>
        <td width="48%" align="left" valign="top">&nbsp;</td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td width="48%" align="left" valign="top">&nbsp;</td>
        <td width="2%">&nbsp;</td>
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
<cfquery name="link_edit" datasource="#datasrc#">
Select * from #table_links# where link_id='#url.id#'
</cfquery>
<cfquery name="link_edit_cats" datasource="#datasrc#">
Select * from #table_links_cat# 
</cfquery>
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Edit Link</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><form name="edit_link" action="?Update=yes" method="post" enctype="multipart/form-data">
<input type="hidden" name="link_id" value="<cfoutput>#url.id#</cfoutput>">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="48%" align="left" valign="top">Link Title:</td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top"><input type="text" name="link_title" id="link_title" value="<cfoutput>#link_edit.link_title#</cfoutput>"/></td>
      </tr>
      <tr>
        <td width="48%" align="left" valign="top">Link Description:</td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top"><textarea name="link_desc" id="link_desc" cols="45" rows="5"><cfoutput>#link_edit.link_desc#</cfoutput></textarea></td>
      </tr>
      <tr>
        <td width="48%" align="left" valign="top">Link Category:</td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top"><select name="link_cat">
        <cfoutput>
        <cfloop query="link_edit_cats">
        <option value="#link_edit_cats.link_cat_id#" <cfif #link_edit.link_cat# EQ #link_edit_cats.link_cat_id#>selected</cfif>>#link_edit_cats.link_cat_title#</option>
        </cfloop>
        </cfoutput>
        </select></td>
      </tr>
      <tr>
        <td width="48%" align="left" valign="top">URL for Link:</td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top"><input type="text" name="link" id="link" value="<cfoutput>#link_edit.link#</cfoutput>"/></td>
      </tr>
      <tr>
        <td width="48%" align="left" valign="top">Link Image:</td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top"><input name="link_img" id="link_img" type="file" /><br /> 
        Current Link Image:<br />
        <img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#links/link_img/#link_edit.link_img#</cfoutput>" /></td>
      </tr>
      <tr>
        <td width="48%" align="left" valign="top">&nbsp;</td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td width="48%" align="left" valign="top">&nbsp;</td>
        <td width="2%">&nbsp;</td>
        <td align="right" valign="top"><input type="image" name="Submit" id="Submit" src="assets/buttons/submit.jpg" /></td>
      </tr>
    </table>
</form>
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
<CFELSEIF do IS "edit_cat">
<!---\\ Edit/url.Update Display //--->
    <CFQUERY DataSource="#datasrc#" Name="display_links_cat">
			SELECT * FROM #table_links_cat#
</CFQUERY>  
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Link Directory Categories</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><table width="100%"  border="0" cellspacing="1" cellpadding="5">
  <tr align="center" bgcolor="#9CB6DE">
    <td width="27%" align="left" bgcolor="#E2E6E7"><span class="style1"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Title</font></span></td>
    <td width="31%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Description</strong></font></span></td>
    <td width="14%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Image</strong></font></span></td>
    <td width="17%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Links in Category</strong></font></span></td>
    <td width="4%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Edit</strong></font></span></td>
    <td width="7%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Delete</strong></font></span></td>
  </tr>
  <CFLOOP QUERY="display_links_cat" StartRow="1" EndRow="#display_links_cat.RecordCount#">
  <cfquery name="display_links_cat_links" datasource="#datasrc#">
        select Count(*) as count from #table_links# where link_cat='#display_links_cat.link_cat_ID#'
        </cfquery>
    <CFOUTPUT>
      <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
        <td>#display_links_cat.link_cat_title#</td>
        <td align="center"><!---#display_links.link_desc#--->
        <cfset short_desc = Left(display_links_cat.link_cat_description, 15)>
        #short_desc#...</td>
          <td align="center"><CFIF display_links_cat.link_cat_img IS "">
            None
            <CFELSE>
            <img Src="../templates/#site_template#/modules/links/cat_img/#display_links_cat.link_cat_img#" width="100" height="100"/>
          </CFIF></td>
        <td align="center">#display_links_cat_links.count#
        </td>
        <td align="center"><A HREF="?do=e_cat&id=#display_links_cat.link_cat_ID#"><IMG SRC="assets/icons/icon_edit_topic.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="e"></A></td>
        <td align="center"><A HREF="?do=d_cat&id=#display_links_cat.link_cat_ID#"><IMG SRC="assets/icons/icon_delete_reply.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="d"></A></td>
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
<CFELSEIF do IS "e_cat">
<cfquery name="link_cat_edit" datasource="#datasrc#">
select * from #table_links_cat# where link_cat_id ='#url.id#'
</cfquery>
<cfquery name="link_edit_cats" datasource="#datasrc#">
Select * from #table_links_cat# 
</cfquery>
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Edit Link Category</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><form name="edit_link_cat" action="?Update_cat=yes" method="post" enctype="multipart/form-data">
<input type="hidden" name="link_cat_id" value="<cfoutput>#url.id#</cfoutput>">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="48%" align="left" valign="top">Category Title:</td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top"><input type="text" name="link_cat_title" id="link_cat_title" value="<cfoutput>#link_cat_edit.link_cat_title#</cfoutput>"/></td>
      </tr>
      <tr>
        <td width="48%" align="left" valign="top">Category Description:</td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top"><textarea name="link_cat_desc" id="link_cat_desc" cols="45" rows="5"><cfoutput>#link_cat_edit.link_cat_description#</cfoutput></textarea></td>
      </tr>
      <tr>
        <td width="48%" align="left" valign="top">Category Parent:</td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top"><select name="link_cat_parent">
        <option value="0">Root Category</option>
		<cfoutput>
        <cfloop query="link_edit_cats">
        <option value="#link_edit_cats.link_cat_id#" <cfif #link_cat_edit.link_cat_title# EQ #link_edit_cats.link_cat_id#>selected</cfif>>#link_edit_cats.link_cat_title#</option>
        </cfloop>
        </cfoutput>
        </select></td>
      </tr>
      <tr>
        <td width="48%" align="left" valign="top">Category Image:</td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top"><!---<input type="text" name="link_cat_img" id="link_cat_img" value="<cfoutput>#link_cat_edit.link_cat_img#</cfoutput>"/>---><input name="link_cat_img" id="link_cat_img" type="file" value="<cfoutput>#link_cat_edit.link_cat_img#</cfoutput>"/><br /> Current Category Image:<br />
        <img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#links/images/#link_cat_edit.link_cat_img#</cfoutput>" /></td>
      </tr>
      <tr>
        <td width="48%" align="left" valign="top">&nbsp;</td>
        <td width="2%">&nbsp;</td>
        <td align="left" valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td width="48%" align="left" valign="top">&nbsp;</td>
        <td width="2%">&nbsp;</td>
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
    <cfelseif do EQ "d">
    <cfquery name="delete_link" datasource="#datasrc#">
    select * from #table_links# where link_id ='#url.id#'
    </cfquery>
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Delete Link</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>Are you sure you want to delete the link: <B><cfoutput>#delete_link.link_title#</cfoutput></B>? <br>
    <br>
    <a href="?Delete=yes&id=<cfoutput>#id#</cfoutput>">Yes</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="module_links.cfm">No</a></td>
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
    <CFELSEIF do IS "d_cat">
        <cfquery name="delete_link_cat" datasource="#datasrc#">
    select * from #table_links_cat# where link_cat_id ='#url.id#'
    </cfquery>
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Delete Link Category</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>Are you sure you want to delete this link Category: <b><cfoutput>#delete_link_cat.link_cat_title#</cfoutput></b> <br>
    <br>
    <a href="?Delete_cat=yes&id=<cfoutput>#id#</cfoutput>">Yes</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="module_links.cfm">No</a></td>
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