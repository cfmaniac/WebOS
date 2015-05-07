<cf_headfoot>
<cfparam name="attributes.script" default="Login FrameWork">
<cfparam name="attributes.page" default="Inquiry Form Administration Page">
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
 <CFQUERY DataSource="#datasrc#" Name="add_field">
  <cfif #db_type# EQ "mssql">SET NOCOUNT ON</cfif>
  INSERT INTO #table_inquiry# (display_name, field_name, field_type, display_field)
  VALUES ('#form.display_name#', '#form.field_name#', '#form.field_type#', '#form.display_field#')
  <cfif #db_type# EQ "mssql">
  SELECT @@Identity AS newId      
  SET NOCOUNT OFF 
  </cfif>
  </CFQUERY>
</CFTRANSACTION>
  <cfif #form.field_type# EQ "text">
  <cflocation url="module_inquiry.cfm?do=m" addToken="No">
   <cfelseif #form.field_type# EQ "password">
  <cflocation url="module_inquiry.cfm?do=m" addToken="No">
   <cfelseif #form.field_type# EQ "textarea">
  <cflocation url="module_inquiry.cfm?do=m" addToken="No">
  <cfelseif #form.field_type# EQ "checkbox">
  <cflocation url="module_inquiry.cfm?do=e_field&id=#add_field.newId#" addToken="No">
  <cfelseif #form.field_type# EQ "radio">
  <cflocation url="module_inquiry.cfm?do=e_field&id=#add_field.newId#" addToken="No">
  <cfelseif #form.field_type# EQ "select">
  <cflocation url="module_inquiry.cfm?do=e_field&id=#add_field.newId#" addToken="No">
  </cfif>
</CFIF>
<!---\\ Toogle/Adjust Function //--->
<cfif isDefined('url.Delete_message') and #url.delete_message# EQ "yes">
<cftransaction>
<cfquery name="remove_mail" datasource="#datasrc#">
Delete from #table_inquiry_submit# where inquiry_id='#url.id#'
</cfquery>
</cftransaction>
<cflocation url="module_inquiry.cfm?do=view_submitted" addtoken="no">
</cfif>
<cfif isDefined('url.Adjust') and #url.Adjust# is "yes">
<CFTRANSACTION>
 <CFQUERY DataSource="#datasrc#" Name="adjust_page">
  UPDATE #table_inquiry# SET display_field = '#form.display_field#' WHERE field_id = '#form.field_id#' 
 </CFQUERY>
</CFTRANSACTION>
  <cflocation url="module_inquiry.cfm?do=m" addToken="No">
</CFIF>
<!---\\ url.Delete Function //--->
<cfif isDefined('url.Delete') and #url.Delete# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="delete_fields">
	DELETE FROM #table_inquiry# WHERE field_id = #url.id#
  </CFQUERY>
  </CFTRANSACTION>
  <!---\\ Deletes the Values if Radio, Checkbox or Select Field //--->
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="delete_fields">
	DELETE FROM #table_inquiry_sel# WHERE field_id = #url.id#
  </CFQUERY>
  </CFTRANSACTION>
  
  <cflocation url="module_inquiry.cfm?do=m" addToken="No">
</cfif>
<!---\\url.Update Functions//--->
<cfif isDefined('url.Update') and #url.Update# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="update_fields">
  UPDATE #table_inquiry# SET display_name='#form.display_name#', field_name='#form.field_name#', field_type='#form.field_type#', display_field='#form.display_field#' WHERE field_id = '#form.field_id#'  
			</CFQUERY>
  </CFTRANSACTION>
  <cfif #form.field_type# EQ "text">
  <cflocation url="module_inquiry.cfm?do=m" addToken="No">
   <cfelseif #form.field_type# EQ "password">
  <cflocation url="module_inquiry.cfm?do=m" addToken="No">
   <cfelseif #form.field_type# EQ "textarea">
  <cflocation url="module_inquiry.cfm?do=m" addToken="No">
  <cfelseif #form.field_type# EQ "checkbox">
  <cflocation url="module_inquiry.cfm?do=e_field&id=#form.field_id#" addToken="No">
  <cfelseif #form.field_type# EQ "radio">
  <cflocation url="module_inquiry.cfm?do=e_field&id=#form.field_id#" addToken="No">
  <cfelseif #form.field_type# EQ "select">
  <cflocation url="module_inquiry.cfm?do=e_field&id=#form.field_id#" addToken="No">
  </cfif>
</cfif>  
<!---\\ Update Hours //--->
<cfif isDefined('url.Update_hrs') and #url.Update_hrs# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="update_fields">
  UPDATE #table_company_hrs# SET hours_monday='#form.hours_monday#', hours_tuesday='#form.hours_tuesday#', hours_wednesday='#form.hours_wednesday#', hours_thursday='#form.hours_thursday#', hours_friday='#form.hours_friday#', hours_saturday='#form.hours_saturday#', hours_sunday='#form.hours_sunday#'
			</CFQUERY>
  </CFTRANSACTION>
   <cflocation url="module_inquiry.cfm?do=m" addToken="No">
  </cfif>
<!---\\ Update Hours //--->
<cfif isDefined('url.Update_nos') and #url.Update_nos# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="update_fields">
  UPDATE #table_company_nfo# SET company_name='#form.company_name#', company_address='#form.company_address#', company_address_2='#form.company_address2#', company_phone='#form.company_phone#', company_tollfree='#form.company_tollfree#', company_city='#form.company_city#', company_state='#form.company_state#', company_zip='#form.company_zip#'
			</CFQUERY>
  </CFTRANSACTION>
   <cflocation url="module_inquiry.cfm?do=m" addToken="No">
<cfelseif isDefined('url.do') and #url.do# EQ "add_subject">
<cftransaction>
<cfquery name="add_sub" datasource="#datasrc#">
INSERT INTO #table_inquiry_subject# (subject)
  VALUES ('#form.subject#')
</cfquery>
</cftransaction>  
<cflocation url="module_inquiry.cfm?do=subjects" addtoken="no">
<cfelseif isDefined('url.do') and #url.do# EQ "edit_subject"> 
<cftransaction>
<cfquery name="add_sub" datasource="#datasrc#">
UPDATE #table_inquiry_subject# set subject='#form.subject#' where subject_id='#form.subject_id#'
</cfquery>
</cftransaction>
<cflocation url="module_inquiry.cfm?do=subjects" addtoken="no">
<cfelseif isDefined('url.send_reply') and #url.send_reply# is "yes">
<cftransaction>
<cfquery name="replied" datasource="#datasrc#">
UPDATE #table_inquiry_submit# set replied_to='1' where inquiry_id='#form.inquiry_id#'
</cfquery>
</cftransaction> 
<cfinclude template="functions/webos_mailer.cfm">
</cfif>  

<!---\\ End of Module Functions //--->
<!--- See if user has access level rights to this page --->
<style type="text/css">
<!--
.style1 {font-weight: bold}
.style2 {font-weight: bold}
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
    <td width="100" valign="top"><img src="assets/modules/modules_inquiry.jpg" alt="WebOS Site Configuration" width="100" height="100" /><br />
      <br />
      <cfif do EQ "a">
      <b><a href="?do=a">Add A Field</a><br /></b>
      <cfelse>
      <a href="?do=a">Add a Field</a><br />
      </cfif>
      <br />
      <cfif do EQ "e_cohrs">
      <b><a href="?do=e_cohrs">Edit Company Hours</a></b><br />
      <cfelse>
      <a href="?do=e_cohrs">Edit Company Hours</a><br />
      </cfif>
      <br />
      <cfif do EQ "e_conos">
      <b><a href="?do=e_conos">Edit Company Information</a></b><Br />
      <cfelse>
      <a href="?do=e_conos">Edit Company Information</a><br />
      </cfif>
      <br />
      <cfif do EQ "view_submitted">
      <b><a href="?do=view_submitted">View Submitted Inquiries</a></b><Br />
      <cfelse>
      <a href="?do=view_submitted">View Submitted Inquiries</a><br />
      </cfif>
      <br />
      <cfif do EQ "add_sub">
      <b><a href="?do=add_sub">Add Inquiry Subjects</a></b><Br />
      <cfelse>
      <a href="?do=add_sub">Add Inquiry Subjects</a><br />
      </cfif>
      <br />
      <cfif do EQ "subjects">
      <b><a href="?do=subjects">View/Edit Inquiry Subjects</a></b><Br />
      <cfelse>
      <a href="?do=subjects">View/Edit Inquiry Subjects</a><br />
      </cfif>
      <br />
      <cfif do NEQ "m">
      <a href="?do=m">Back to Main</a>
      </cfif>
      </td>
      
    <td valign="top"><cfif do EQ "m">
    <!---\\ Intro Text //--->
    Welcome <b><cfoutput>#session.user#</cfoutput></b>, to the WebOS <b><cfoutput>#attributes.page#</cfoutput></b> Page. Here you can dynamically enable/disable (or install/un-install) add, edit and delete Form fields on your WebOS Contact Page.
    <br />
    <br />
    <u><strong>Pleased Note:</strong></u> A minimum of <strong>4</strong> fields and a maximum of <strong>15</strong> fields is permitted with current settings.
    <hr width="95%" align="center"/>
    <CFQUERY DataSource="#datasrc#" Name="display_inquiry">
			SELECT *
			FROM #table_inquiry#
</CFQUERY>
    
   <table width="100%"  border="0" cellspacing="1" cellpadding="5">
  <tr align="center" bgcolor="#9CB6DE">
    <td width="10" align="left" bgcolor="#E2E6E7"><span class="style1"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">ID</font></span></td>
    <td  bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Field Name/Display Name</strong></font></span></td>
    <td  bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Field Type</strong></font></span></td>
    <td  bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Field Active</strong></font></span></td>
    <td  bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Edit</strong></font></span></td>
    <td  bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Delete</strong></font></span></td>
  </tr>
  <CFLOOP QUERY="display_inquiry" StartRow="1" EndRow="#display_inquiry.RecordCount#">
    <CFOUTPUT>
      <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
        <td width="10">#display_inquiry.field_id#</td>
        <td align="center">#display_inquiry.field_name# / #display_inquiry.display_name#</td>
        <td align="center">#display_inquiry.field_type#</td>
          <td align="center"><cfif #display_inquiry.display_field# EQ "1">
          <form name="adjust_display<cfoutput>#display_inquiry.field_id#</cfoutput>" method="post" action="?Adjust=yes">
        <input type="hidden" name="field_id" value="#display_inquiry.field_id#" />
         <input type="hidden" name="display_field" value="0" />
        <a href="##" onclick="document.adjust_display<cfoutput>#display_inquiry.field_id#</cfoutput>.submit()"/>Active</a>
        </form>
          <cfelseif #display_inquiry.display_field# EQ "0">
           <form name="adjust_display<cfoutput>#display_inquiry.field_id#</cfoutput>" method="post" action="?Adjust=yes">
        <input type="hidden" name="field_id" value="#display_inquiry.field_id#" />
         <input type="hidden" name="display_field" value="1" />
        <a href="##" onclick="document.adjust_display<cfoutput>#display_inquiry.field_id#</cfoutput>.submit()"/>In-Active</a>
        </form>
          </cfif></td>
        <td align="center"><A HREF="?do=e&id=#display_inquiry.field_id#"><IMG SRC="assets/icons/icon_edit_topic.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="e"></A></td>
        <td align="center"><A HREF="?do=d&id=#display_inquiry.field_id#"><IMG SRC="assets/icons/icon_delete_reply.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="d"></A></td>
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
     <form name="add_field" action="?Add=yes" method="post">
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Add Inquiry Form Field</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr>
          <td align="left" valign="top">Display Name:</td>
          <td>&nbsp;</td>
          <td align="left" valign="top"><input name="display_name" type="text" id="display_name" size="25" value=""/></td>
        </tr>
  <tr>
    <td width="48%" align="left" valign="top">Field Name:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="field_name" type="text" id="field_name" size="25" value=""/></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Field Type:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><script language="javascript1.2">
  generate_wysiwyg('field_content');
</script>    <select name="field_type" id="field_type">
  <option value="text" >Text Field</option>
  <option value="password" >Password Field</option>
  <option value="select" >Select</option>
  <option value="textarea" >Text Area</option>
  <option value="checkbox" >Checkbox</option>
  <option value="radio" >Radio Button</option>
</select>
</td>
  </tr>
  
  <tr>
    <td width="48%" align="left" valign="top"></td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Activate this Field?</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="display_field" type="radio" value="1" />Active &nbsp;<input name="display_field" type="radio" value="0" />In-Active</td>
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
    <cfelseif do EQ "e">
    <CFQUERY DataSource="#datasrc#" Name="edit_field">
			SELECT *
			FROM #table_inquiry# where field_id ='#url.id#'
</CFQUERY>
<form name="edit_field" action="?Update=yes" method="post">
<input type="hidden" name="field_id" value="<cfoutput>#url.id#</cfoutput>">
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Edit Inquiry Form Field</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr>
          <td align="left" valign="top">Display Name:</td>
          <td>&nbsp;</td>
          <td align="left" valign="top"><input name="display_name" type="text" id="display_name" size="25" value="<cfoutput>#edit_field.display_name#</cfoutput>"/></td>
        </tr>
  <tr>
    <td width="48%" align="left" valign="top">Field Name:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="field_name" type="text" id="field_name" size="25" value="<cfoutput>#edit_field.field_name#</cfoutput>"/></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Field Type:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><script language="javascript1.2">
  generate_wysiwyg('field_content');
</script>    <select name="field_type" id="field_type">
  <option value="text" <cfif #edit_field.field_type# EQ "text">selected</cfif>>Text Field</option>
  <option value="password" <cfif #edit_field.field_type# EQ "password">selected</cfif>>Password Field</option>
  <option value="select" <cfif #edit_field.field_type# EQ "select">selected</cfif>>Select</option>
  <option value="textarea" <cfif #edit_field.field_type# EQ "textarea">selected</cfif>>Text Area</option>
  <option value="checkbox" <cfif #edit_field.field_type# EQ "checkbox">selected</cfif>>Checkbox</option>
  <option value="radio" <cfif #edit_field.field_type# EQ "radio">selected</cfif>>Radio Button</option>
</select>
</td>
  </tr>
  
  <tr>
    <td width="48%" align="left" valign="top"></td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Activate this Field?</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="display_field" type="radio" value="1" <cfif #edit_field.display_field# EQ "1">checked </cfif>/>Active &nbsp;<input name="display_field" type="radio" value="0" <cfif #edit_field.display_field# EQ "0">checked </cfif>/>In-Active</td>
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
<CFELSEIF do IS "e_field">
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Edit Field Values</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><form name="edit_field" action="?Update=yes" method="post">
<input type="hidden" name="field_id" value="<cfoutput>#url.id#</cfoutput>">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  
  <tr>
    <td width="48%" align="left" valign="top">Field Name:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="field_title" type="text" id="field_title" size="25" value="<cfoutput>#edit_field.field_name#</cfoutput>"/></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Field Type:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><script language="javascript1.2">
  generate_wysiwyg('field_content');
</script>    <select name="field_type" id="field_type">
  <option value="text" <cfif #edit_field.field_type# EQ "text">selected</cfif>>Text Field</option>
  <option value="password" <cfif #edit_field.field_type# EQ "password">selected</cfif>>Password Field</option>
  <option value="select" <cfif #edit_field.field_type# EQ "select">selected</cfif>>Select</option>
  <option value="textarea" <cfif #edit_field.field_type# EQ "textarea">selected</cfif>>Text Area</option>
  <option value="checkbox" <cfif #edit_field.field_type# EQ "checkbox">selected</cfif>>Checkbox</option>
  <option value="radio" <cfif #edit_field.field_type# EQ "radio">selected</cfif>>Radio Button</option>
</select>
</td>
  </tr>
  
  <tr>
    <td width="48%" align="left" valign="top"></td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Activate this Field?</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="field_active" type="radio" value="1" <cfif #edit_field.display_field# EQ "1">checked </cfif>/>Active &nbsp;<input name="field_active" type="radio" value="0" <cfif #edit_field.display_field# EQ "0">checked </cfif>/>In-Active</td>
  </tr>

  <tr>
    <td width="48%" align="left" valign="top">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="right" valign="top"><input type="image" name="Submit" id="Submit" src="assets/buttons/submit.jpg" /></td>
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
<cfelseif do EQ "e_cohrs">
<form name="edit_cohrs" action="?Update_hrs=yes" method="post">
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Edit Company Hours</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><cfquery name="company_hours" datasource="#datasrc#">
    select * from #table_company_hrs#
    </cfquery>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  
  <tr>
    <td width="48%" align="left" valign="top">Monday Hours:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="hours_monday" type="text" id="hours_monday" size="25" value="<cfoutput>#company_hours.hours_monday#</cfoutput>"/></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Tuesday Hours:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="hours_tuesday" type="text" id="hours_tuesday" size="25" value="<cfoutput>#company_hours.hours_tuesday#</cfoutput>"/></td>
  </tr>
  
  <tr>
    <td width="48%" align="left" valign="top">Wednesday Hours:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="hours_wednesday" type="text" id="hours_wednesday" size="25" value="<cfoutput>#company_hours.hours_wednesday#</cfoutput>"/></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Thursday Hours:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="hours_thursday" type="text" id="hours_thursday" size="25" value="<cfoutput>#company_hours.hours_thursday#</cfoutput>"/></td>
  </tr>

  <tr>
    <td width="48%" align="left" valign="top">Friday Hours:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="hours_friday" type="text" id="hours_friday" size="25" value="<cfoutput>#company_hours.hours_friday#</cfoutput>"/></td>
  </tr>
  <tr>
    <td align="left" valign="top">Saturday Hours:</td>
    <td>&nbsp;</td>
    <td align="left" valign="top"><input name="hours_saturday" type="text" id="hours_saturday" size="25" value="<cfoutput>#company_hours.hours_saturday#</cfoutput>"/></td>
  </tr>
  <tr>
    <td align="left" valign="top">Sunday Hours:</td>
    <td>&nbsp;</td>
    <td align="left" valign="top"><input name="hours_sunday" type="text" id="hours_sunday" size="25" value="<cfoutput>#company_hours.hours_sunday#</cfoutput>"/></td>
  </tr>
  <tr>
    <td align="left" valign="top">&nbsp;</td>
    <td>&nbsp;</td>
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
<cfelseif do EQ "e_conos">
<form name="edit_conos" action="?Update_nos=yes" method="post">
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Edit Company Information</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td> <cfquery name="company_info" datasource="#datasrc#">
    select * from #table_company_nfo#
    </cfquery>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  
  <tr>
    <td width="48%" align="left" valign="top">Company Name:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="company_name" type="text" id="company_name" size="25" value="<cfoutput>#company_info.company_name#</cfoutput>"/></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Company Address:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="company_address" type="text" id="company_address" size="25" value="<cfoutput>#company_info.company_address#</cfoutput>"/></td>
  </tr>
  
  <tr>
    <td width="48%" align="left" valign="top">Company Address 2:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="company_address2" type="text" id="company_address2" size="25" value="<cfoutput>#company_info.company_address_2#</cfoutput>"/></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Company Phone:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="company_phone" type="text" id="company_phone" size="25" value="<cfoutput>#company_info.company_phone#</cfoutput>"/></td>
  </tr>
  <tr>
    <td align="left" valign="top">Company Toll-Free:</td>
    <td>&nbsp;</td>
    <td align="left" valign="top"><input name="company_tollfree" type="text" id="company_tollfree" size="25" value="<cfoutput>#company_info.company_tollfree#</cfoutput>"/></td>
  </tr>

  <tr>
    <td width="48%" align="left" valign="top">Company Fax:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input name="company_fax" type="text" id="company_fax" size="25" value="<cfoutput>#company_info.company_fax#</cfoutput>"/></td>
  </tr>
  <tr>
    <td align="left" valign="top">Company City:</td>
    <td>&nbsp;</td>
    <td align="left" valign="top"><input name="company_city" type="text" id="company_city" size="25" value="<cfoutput>#company_info.company_city#</cfoutput>"/></td>
  </tr>
  <tr>
    <td align="left" valign="top">Company State:</td>
    <td>&nbsp;</td>
    <td align="left" valign="top">        <select id="company_state" name="company_state" style="width:60px">
          <option value="0" selected="selected">State</option>
          <option value="AL" <cfif #company_info.company_state# EQ "AL">selected</cfif>>AL</option>
          <option value="AK" <cfif #company_info.company_state# EQ "AK">selected</cfif>>AK</option>
          <option value="AZ" <cfif #company_info.company_state# EQ "AZ">selected</cfif>>AZ</option>
          <option value="AR" <cfif #company_info.company_state# EQ "AR">selected</cfif>>AR</option>

          <option value="CA" <cfif #company_info.company_state# EQ "CA">selected</cfif>>CA</option>
          <option value="CO" <cfif #company_info.company_state# EQ "CO">selected</cfif>>CO</option>
          <option value="CT" <cfif #company_info.company_state# EQ "CT">selected</cfif>>CT</option>
          <option value="DE" <cfif #company_info.company_state# EQ "DE">selected</cfif>>DE</option>
          <option value="DC" <cfif #company_info.company_state# EQ "DC">selected</cfif>>DC</option>
          <option value="FL" <cfif #company_info.company_state# EQ "FL">selected</cfif>>FL</option>

          <option value="GA" <cfif #company_info.company_state# EQ "GA">selected</cfif>>GA</option>
          <option value="HI" <cfif #company_info.company_state# EQ "HI">selected</cfif>>HI</option>
          <option value="ID" <cfif #company_info.company_state# EQ "ID">selected</cfif>>ID</option>
          <option value="IL" <cfif #company_info.company_state# EQ "IL">selected</cfif>>IL</option>
          <option value="IN" <cfif #company_info.company_state# EQ "IN">selected</cfif>>IN</option>
          <option value="IA" <cfif #company_info.company_state# EQ "IA">selected</cfif>>IA</option>


          <option value="KS" <cfif #company_info.company_state# EQ "KS">selected</cfif>>KS</option>
          <option value="KY" <cfif #company_info.company_state# EQ "KY">selected</cfif>>KY</option>
          <option value="LA" <cfif #company_info.company_state# EQ "LA">selected</cfif>>LA</option>
          <option value="ME" <cfif #company_info.company_state# EQ "ME">selected</cfif>>ME</option>
          <option value="MD" <cfif #company_info.company_state# EQ "MD">selected</cfif>>MD</option>
          <option value="MA" <cfif #company_info.company_state# EQ "MA">selected</cfif>>MA</option>

          <option value="MI" <cfif #company_info.company_state# EQ "MI">selected</cfif>>MI</option>
          <option value="MN" <cfif #company_info.company_state# EQ "MN">selected</cfif>>MN</option>
          <option value="MS" <cfif #company_info.company_state# EQ "MS">selected</cfif>>MS</option>
          <option value="MO" <cfif #company_info.company_state# EQ "MO">selected</cfif>>MO</option>
          <option value="MT" <cfif #company_info.company_state# EQ "MY">selected</cfif>>MT</option>
          <option value="NE" <cfif #company_info.company_state# EQ "NE">selected</cfif>>NE</option>

          <option value="NV" <cfif #company_info.company_state# EQ "NV">selected</cfif>>NV</option>
          <option value="NH" <cfif #company_info.company_state# EQ "NH">selected</cfif>>NH</option>
          <option value="NJ" <cfif #company_info.company_state# EQ "NJ">selected</cfif>>NJ</option>
          <option value="NM" <cfif #company_info.company_state# EQ "NM">selected</cfif>>NM</option>
          <option value="NY" <cfif #company_info.company_state# EQ "NY">selected</cfif>>NY</option>
          <option value="NC" <cfif #company_info.company_state# EQ "NC">selected</cfif>>NC</option>

          <option value="ND" <cfif #company_info.company_state# EQ "ND">selected</cfif>>ND</option>
          <option value="OH" <cfif #company_info.company_state# EQ "OH">selected</cfif>>OH</option>
          <option value="OK" <cfif #company_info.company_state# EQ "OK">selected</cfif>>OK</option>
          <option value="OR" <cfif #company_info.company_state# EQ "OR">selected</cfif>>OR</option>
          <option value="PA" <cfif #company_info.company_state# EQ "PA">selected</cfif>>PA</option>
          <option value="RI" <cfif #company_info.company_state# EQ "RI">selected</cfif>>RI</option>

          <option value="SC" <cfif #company_info.company_state# EQ "SC">selected</cfif>>SC</option>
          <option value="SD" <cfif #company_info.company_state# EQ "SD">selected</cfif>>SD</option>
          <option value="TN" <cfif #company_info.company_state# EQ "TN">selected</cfif>>TN</option>
          <option value="TX" <cfif #company_info.company_state# EQ "TX">selected</cfif>>TX</option>
          <option value="UT" <cfif #company_info.company_state# EQ "UT">selected</cfif>>UT</option>
          <option value="VT" <cfif #company_info.company_state# EQ "VT">selected</cfif>>VT</option>

          <option value="VA" <cfif #company_info.company_state# EQ "VA">selected</cfif>>VA</option>
          <option value="WA" <cfif #company_info.company_state# EQ "WA">selected</cfif>>WA</option>
          <option value="WV"<cfif #company_info.company_state# EQ "WV">selected</cfif>>WV</option>
          <option value="WI" <cfif #company_info.company_state# EQ "WI">selected</cfif>>WI</option>
          <option value="WY" <cfif #company_info.company_state# EQ "WY">selected</cfif>>WY</option>
        </select>
</td>
  </tr>
  <tr>
    <td align="left" valign="top">Company Zip Code:</td>
    <td>&nbsp;</td>
    <td align="left" valign="top"><input name="company_zip" type="text" id="company_zip" size="25" value="<cfoutput>#company_info.company_zip#</cfoutput>"/></td>
  </tr>
  <tr>
    <td align="left" valign="top">&nbsp;</td>
    <td>&nbsp;</td>
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
<cfelseif do EQ "view_submitted">
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">View & Manage Submitted Inquiries</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>You've Recieved Inquiries from your Site!<Br />All of your inquiries are listed below. <cfquery name="submitted" datasource="#datasrc#">
    select * from #table_inquiry_submit# ORDER BY date_submitted, replied_to ASC
    </cfquery>
    <table width="100%"  border="0" cellspacing="1" cellpadding="5">
  <tr align="center" bgcolor="#9CB6DE">
    <td width="10" align="left" bgcolor="#E2E6E7"><span class="style1"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">ID</font></span></td>
    <td  bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Subject</strong></font></span></td>
    <td  bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Replied to Inquiry</strong></font></span></td>
    <td  bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Date Recieved</strong></font></span></td>
    <td  bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>View/Reply</strong></font></span></td>
    <td  bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Delete</strong></font></span></td>
  </tr>
  <CFLOOP QUERY="submitted" StartRow="1" EndRow="#submitted.RecordCount#">
    <CFOUTPUT>
      <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
        <td width="10">#submitted.inquiry_id#</td>
        <td align="center"><b>#submitted.subject#</b></td>
        <td align="center"><cfif #submitted.replied_to# EQ "1">
        <font color="##006600"><i>Replied</i></font>
        <cfelseif #submitted.replied_to# EQ "0">
        <font color="##990000"><b>Not Yet Replied</b></font>
        </cfif>
        </td>
          <td align="center">#dateformat(submitted.date_submitted, "MM/DD/YYYY")#</td>
        <td align="center"><A HREF="?do=reply&id=#submitted.inquiry_id#"><IMG SRC="assets/icons/icon_edit_topic.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="e"></A></td>
        <td align="center"><A HREF="?do=del_msg&id=#submitted.inquiry_id#"><IMG SRC="assets/icons/icon_delete_reply.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="d"></A></td>
      </tr>
      <CFIF row_color EQ 1>
        <CFSET row_color = 0>
        <CFELSE>
        <CFSET row_color = 1>
      </CFIF>
    </CFOUTPUT>
  </CFLOOP>
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
<cfelseif do EQ "reply">
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">View and Reply to This Inquiry</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td> <cfquery name="company_info" datasource="#datasrc#">
    select * from #table_company_nfo#
    </cfquery>
      <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
        <!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
        <tr>
          <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c2" alt="" /></td>
          <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style2">Inquiry Contents:</span></td>
          <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c4" alt="" /></td>
        </tr>
        <tr>
          <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
          <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
            <tr>
              <td><table cellpadding="5" cellspacing="0" width="100%">
              <tr>
                <td><cfquery name="view_submitted" datasource="#datasrc#">
    select * from #table_inquiry_submit# where inquiry_id ='#url.id#'
      </cfquery>
   
 
<!--- Populate the query. --->
<cfset QueryAddColumn(
	view_submitted,
	"number",
	"CF_SQL_VARCHAR",
	ListToArray( "#view_submitted.field_001#, #view_submitted.field_002#, #view_submitted.field_003#,#view_submitted.field_004#, #view_submitted.field_005#, #view_submitted.field_006#, #view_submitted.field_007#, #view_submitted.field_008#, #view_submitted.field_009#, #view_submitted.field_010#, #view_submitted.field_011#, #view_submitted.field_012#, #view_submitted.field_013#, #view_submitted.field_014#, #view_submitted.field_015#" )
	) />
 
 
<!---
	In order for this to work, you have to explicitly
	define how many columns you want to output.
--->
<cfset intColCount = 1 />
 
<!---
	Based on the columns and the record count of the query,
	we can determine how many rows we are going to output.
	In this case, we are using the ceiling function as we
	will need to round up.
--->
<cfset intRowCount = Ceiling(
	view_submitted.RecordCount / intColCount
	) />
 
 
<!---
	Output the query. Unlike a traditional horizontally
	outputted query, we cannot loop over the query itself
	as it does not have "proper" ordering. Instead, we
	have to loop over the rows and the columns and then
	grab the appropriate value out of the query.
--->
<table width="100%">
<tr>
<td width="48%" valign="top"><b>Subject:</b></td>
<td width="2%">&nbsp;</td>
<td width="48%" valign="top">
<cfoutput>#view_submitted.subject#</cfoutput>
</td>
</tr>
	<!--- Loop over the rows, which we calculated above. --->
	<cfloop
		index="intRow"
		from="1"
		to="#intRowCount#">
       
		<!--- Loop over the columns (set above). --->
		<cfloop
			index="intColumn"
			from="1"
			to="#intColCount#">
 
			<!---
				Here's where the magic happens. We need to
				figure out which query cell value we are
				getting based on the current row and column
				indexes. If you think about it, the beginning
				of each column begins with all the values
				from the previous columns. That means that
				each column begins with (COLUMN - 1) * the
				number of rows in a column.
			--->
			<cfset intCellIndex = ((intRowCount * (intColumn - 1)) + intRow) />
 
			<!---
				Now, because we are outputting over a RxC
				output, its possible that we will have a cell
				that is outside of the record set. Check to
				see if the cell index is beyond the record
				count.
			--->
     
	<cfif (intCellIndex LTE view_submitted.RecordCount)>
	<tr>  
           <td width="48%" valign="top">
           <!---\\Displays the Column (form field) Name //--->
			<cfquery name="field_name" datasource="#datasrc#">
    select display_name from #table_inquiry# where field_id = '#intCellIndex#'
    </cfquery>
	
	<b><cfoutput>#field_name.display_name#</cfoutput></b>&nbsp;
    </td>
    <td width="2%">&nbsp;</td>
    <td width="48%" valign="top">
	<!---\\Displays the Column Data//--->				
					<cfoutput>#view_submitted[ "number" ][ intCellIndex ]#</cfoutput>			</td>
</tr>
				</cfif>
		</cfloop>
	</cfloop>
</table>     </td>
              </tr>
          </table></td>
            </tr>
          </table></td>
          <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
        </tr>
        <tr>
          <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c2" alt="" /></td>
          <td background="assets/main_box/admin_r3_c2.jpg"></td>
          <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c4" alt="" /></td>
        </tr>
      </table>
      <hr />
      <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
        <!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
        <tr>
          <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c5" alt="" /></td>
          <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style2">Reply to this Inquiry:</span></td>
          <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c6" alt="" /></td>
        </tr>
        <tr>
          <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
          <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
              <tr>
                <td>
                <form name="reply" action="?send_reply=yes" method="post">
                <input type="hidden" name="inquiry_id" value="<cfoutput>#url.id#</cfoutput>">
                <input type="hidden" name="thanks_location" value="module_inquiry.cfm?do=view_submitted" />
                <input type="hidden" name="referrer" value="admin_reply" />
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="right" valign="top">To:</td>
    <td width="2%">&nbsp;</td>
    <td width="375" align="left" valign="top"><input type="text" name="to" id="to" /></td>
  </tr>
  <tr>
    <td align="right" valign="top">From:</td>
    <td width="2%">&nbsp;</td>
    <td width="375" align="left" valign="top"><input type="text" name="from" id="from" /></td>
  </tr>
  <tr>
    <td align="right" valign="top">Subject:</td>
    <td width="2%">&nbsp;</td>
    <td width="375" align="left" valign="top"><input type="text" name="subject" id="subject" value="RE: <cfoutput>#view_submitted.subject#</cfoutput>"/></td>
  </tr>
  <tr>
    <td align="right" valign="top">Reply Message:</td>
    <td width="2%">&nbsp;</td>
    <td width="375" align="left" valign="top"><textarea name="reply" id="reply" style="width: 375px; height:375px;"></textarea></td>
  </tr>
  <tr>
    <td valign="top">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="375" align="center" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" valign="top">[ <a href="?do=view_submitted">Do Not Reply</a>]</td>
    <td width="2%">&nbsp;</td>
    <td width="375" align="center" valign="top"><input type="image" name="submit" id="submit" src="assets/buttons/submit.jpg" /></td>
  </tr>
</table>
</form>
</td>
              </tr>
          </table></td>
          <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
        </tr>
        <tr>
          <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c5" alt="" /></td>
          <td background="assets/main_box/admin_r3_c2.jpg">&nbsp;</td>
          <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c6" alt="" /></td>
        </tr>
      </table>
      <p>&nbsp;</p></td>
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
<cfelseif do EQ "del_msg">
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Delete Submitted Inquiry</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
  Are you Certain you want to delete the Submitted Inquiry: <b><cfoutput>#url.id#</cfoutput></b><br />
  <br />
   <a href="?Delete_message=yes&id=<cfoutput>#url.id#</cfoutput>">Yes</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="module_inquiry.cfm?do=view_submitted">No</a></td>
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
<cfelseif do EQ "subjects">
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Inquiry Form Subject Editor</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>You can Add, Edit and Delete Subjects that will appear in your Contact Form.<hr />
  <cfquery name="subjects" datasource="#datasrc#">
  select * from #table_inquiry_subject#
  </cfquery>
  <table width="100%"  border="0" cellspacing="1" cellpadding="5">
  <tr align="center" bgcolor="#9CB6DE">
    <td width="130" align="left" bgcolor="#E2E6E7"><span class="style1"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">ID</font></span></td>
    <td width="385"  bgcolor="#E2E6E7"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Subject</strong></font></strong></td>
    <td width="25"  bgcolor="#E2E6E7"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Edit</strong></font></strong></td>
    <td width="43"  bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Delete</strong></font></span></td>
  </tr>
  <CFLOOP QUERY="subjects" StartRow="1" EndRow="#subjects.RecordCount#">
    <CFOUTPUT>
      <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
        <td width="130">#subjects.subject_id#</td>
        <td align="center">#subjects.subject#        </td>
          <td align="center"><A HREF="?do=edit_sub&id=#subjects.subject_id#"><IMG SRC="assets/icons/icon_edit_topic.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="e"></A></td>
        <td align="center"><A HREF="?do=del_sub&id=#subjects.subject_id#"><IMG SRC="assets/icons/icon_delete_reply.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="d"></A></td>
      </tr>
      <CFIF row_color EQ 1>
        <CFSET row_color = 0>
        <CFELSE>
        <CFSET row_color = 1>
      </CFIF>
    </CFOUTPUT>
  </CFLOOP>
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
<cfelseif do EQ "add_sub">
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Add Inquiry Subject</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>

  Simply enter the text you add into the Text Field and Click the Submit Changes Button.
  <form id="add_subject" name="edit_subject" method="post" action="?do=add_subject">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="48%" align="left" valign="top">Subject Text:</td>
    <td width="2%" align="left" valign="top">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input type="text" name="subject" id="subject" /></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">&nbsp;</td>
    <td width="2%" align="left" valign="top">&nbsp;</td>
    <td width="48%" align="right" valign="top"><input type="image" name="submit" id="submit" src="assets/buttons/submit.jpg" /></td>
  </tr>
</table>

  
  </form>  </td>
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
<cfelseif do EQ "edit_sub">
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Edit Inquiry Subject</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
  <cfquery name="edit_sub" datasource="#datasrc#">
  select * from #table_inquiry_subject# where subject_id='#url.id#'
  </cfquery>
  Simply enter the text you change into the Text Field and Click the Submit Changes Button.
  <form id="edit_subject" name="edit_subject" method="post" action="?do=edit_subject">
  <input type="hidden" name="subject_id" value="<cfoutput>#url.id#</cfoutput>">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="48%" align="left" valign="top">Subject Text:</td>
    <td width="2%" align="left" valign="top">&nbsp;</td>
    <td width="48%" align="left" valign="top"><input type="text" name="subject" id="subject" value="<cfoutput>#edit_sub.subject#</cfoutput>"/></td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">&nbsp;</td>
    <td width="2%" align="left" valign="top">&nbsp;</td>
    <td width="48%" align="right" valign="top"><input type="image" name="submit" id="submit" src="assets/buttons/submit.jpg" /></td>
  </tr>
</table>

  
  </form>  </td>
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
<cfelseif do EQ "del_sub">
<CFQUERY DataSource="#datasrc#" Name="delete_inquiry">
			SELECT *
			FROM #table_inquiry_subject# where subject_id ='#url.id#'
</CFQUERY>
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Delete Inquiry Subject?</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
  Are you Certain you want to delete the form subject: <b><cfoutput>#delete_inquiry.subject#</cfoutput></b><br />
  <br />
   <a href="?Delete_sub=yes&id=<cfoutput>#url.id#</cfoutput>">Yes</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="module_inquiry.cfm?do=subjects">No</a></td>
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
<CFQUERY DataSource="#datasrc#" Name="delete_inquiry">
			SELECT *
			FROM #table_inquiry# where field_id ='#url.id#'
</CFQUERY>
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Delete Form Field</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
  Are you Certain you want to delete the form field: <b><cfoutput>#delete_inquiry.display_name#</cfoutput></b><br />
  <br />
   <a href="?Delete=yes&id=<cfoutput>#url.id#</cfoutput>">Yes</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="module_inquiry.cfm">No</a></td>
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