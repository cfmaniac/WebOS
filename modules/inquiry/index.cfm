<!---\\ Module Configuration //--->
<cfset module="inquiry">
<cfset thanks_location ="?module=inquiry&section=thanks">
<!---SEE functions/webos_mailer.cfm about this--->
<!---\\ End of Module Configuration //--->

<cfif isDefined('url.section') and #url.section# EQ "send">
<cftransaction>
<cfquery name="submit_inquiry" datasource="#datasrc#">
insert into #table_inquiry_submit# (subject, field_001, field_002, field_003, field_004, field_005, field_006, field_007, field_008, field_009, field_010, field_011, field_012, field_013, field_014, field_015, replied_to, date_submitted) VALUES ('#form.subject#','#form.field_1#', '#form.field_2#', '#form.field_3#','#form.field_4#',<cfif isDefined('form.field_5')>'#form.field_5#',<cfelseif NOT isDefined('form.field_5')>'',</cfif><cfif isDefined('form.field_6')>'#form.field_6#',<cfelseif NOT isDefined('form.field_6')>'',</cfif> <cfif isDefined('form.field_7')>'#form.field_7#',<cfelseif NOT isDefined('form.field_7')>'',</cfif><cfif isDefined('form.field_8')>'#form.field_8#',<cfelseif NOT isDefined('form.field_8') >'',</cfif><cfif isDefined('form.field_9')>'#form.field_9#',<cfelseif NOT isDefined('form.field_9')>'',</cfif><cfif isDefined('form.field_10')>'#form.field_10#',<cfelseif NOT isDefined('form.field_10')>'',</cfif><cfif isDefined('form.field_11')>'#form.field_11#',<cfelseif NOT isDefined('form.field_11')>'',</cfif><cfif isDefined('form.field_12')>'#form.field_12#',<cfelseif NOT isDefined('form.field_12')>'',</cfif><cfif isDefined('form.field_13')>'#form.field_13#',<cfelseif NOT isDefined('form.field_13')>'',</cfif><cfif isDefined('form.field_14')>'#form.field_14#',<cfelseif NOT isDefined('form.field_14')>'',</cfif><cfif isDefined('form.field_15')>'#form.field_15#',<cfelseif NOT isDefined('form.field_15')>'',</cfif>'0', <cfif #db_type# EQ "mssql">'#dateformat(now(), "MM/DD/YYYY")#'<cfelseif #db_type# EQ "mysql">'#dateformat(now(), "YYYY-MM-DD")#' </cfif>)
</cfquery>
</cftransaction>
<cfinclude template="../../functions/webos_mailer.cfm">
<cfelseif isDefined('url.section') and #url.section# EQ "thanks">
<script type="text/javascript">
<!--
function delayer(){
	document.location = "http://<cfoutput>#site_domain##site_folder#/</cfoutput>index.cfm"
}
//-->
</script>
<!---\\ Insert Thanks Text Here //--->
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">Thank you For Contacting Us!</td>
  </tr>
  <tr>
  <td>Thank you for taking the time to contact <cfoutput>#site_name#</cfoutput>.<br><BR>
  We've received your email and will reply to you shortly. 
  
  Again, thank you for Contacting <cfoutput>#site_name#</cfoutput>.
  </td>
  </tr>
  </table>
<!---\\ End of Thanks Text //--->
<script>
setTimeout('delayer()', 3500);
</script>
<cfelseif NOT isDefined('url.section') or isDefined('url.section') and #url.section# EQ "">
<cfif css_template EQ "1">
<div id="welcome" class="post">
			<h2 class="title"><span>Contact <cfif NOT isDefined('company_info.company_name') and #company_info.company_name# EQ "">
		<cfoutput><strong>#site_name#</strong></cfoutput>
        <cfelseif isDefined('company_info.company_name')>
        <cfoutput><strong>#company_info.company_name#</strong></cfoutput>
        </cfif></span></h2>
			
			</div>
			<div class="meta">
				<form id="contact" name="contact" method="post" action="http://<cfoutput>#site_domain##site_folder#index.cfm?module=#module#</cfoutput>&section=send">
    <input type="hidden" name="thanks_location" value="<cfoutput>#thanks_location#</cfoutput>">
    <input type="hidden" name="referrer" value="inquiry">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    
  <tr>
    <td colspan="3" align="left" valign="top">
     <cfif inquiry_show_info EQ "1">
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
     
      <tr>
        <td width="48%" align="left" valign="top">
		<cfif NOT isDefined('company_info.company_name') and #company_info.company_name# EQ "">
		<cfoutput><strong>#site_name#</strong></cfoutput>
        <cfelseif isDefined('company_info.company_name')>
        <cfoutput><strong>#company_info.company_name#</strong></cfoutput>
        </cfif>
         Contact Information:<br />
          <br />
            <b>Company Hours:</b>
            <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
            <cfoutput query="company_hours">
            <cfset monday="#hours_monday#">
            <cfset sunday="#hours_sunday#">
            <cfif #hours_tuesday# EQ #monday# and #hours_wednesday# eq #monday# and #hours_thursday# EQ #monday# and #hours_friday# EQ #monday#>
            <tr>
            <td width="48%" align="left" valign="top">Monday-Friday:</td>
            <td width="2%">&nbsp;</td>
            <td width="48%" align="left" valign="top">#monday#</td>
            </tr>
            <cfelse>
            <tr>
    <td width="48%" align="left" valign="top">Monday:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">#hours_monday#</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Tuesday:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">#hours_tuesday#</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Wednesday:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">#hours_wednesday#</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Thursday:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">#hours_thursday#</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Friday:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">#hours_friday#</td>
  </tr>
            </cfif>
	<cfif #hours_saturday# eq #sunday#>
            <tr>
            <td width="48%" align="left" valign="top">Saturday & Sunday:</td>
            <td width="2%">&nbsp;</td>
            <td width="48%" align="left" valign="top">#sunday#</td>
            </tr>
            <cfelseif #hours_saturday# NEQ #sunday#>
            <tr>
    <td width="48%" align="left" valign="top">Saturday:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">#hours_saturday#</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Sunday:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">#hours_sunday#</td>
  </tr>
  </cfif>
  </cfoutput>
</table>

            </td>
        <td width="2%">&nbsp;</td>
        <td width="48%" align="left" valign="top">
        <cfoutput query="company_info">
        <strong>Address:</strong><br />
          <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td>#company_address#<br />
              <cfif isDefined('company_address_2') and #company_address_2# NEQ "">
              #company_address_2#<br />
              </cfif>
              #company_city#, #company_state# #company_zip#
              </td>
            </tr>
          </table>
          <cfif isDefined('company_tollfree') and #company_tollfree# NEQ "">
          <br /><strong>Toll Free:</strong> #company_tollfree#
          </cfif>
          <cfif isDefined('company_phone') and #company_phone# NEQ "">
          <br /><strong>Phone:</strong> #company_phone#
          </cfif>
          <cfif isDefined('company_fax') and #company_fax# NEQ "">
          <br /><strong>Fax:</strong> #company_fax#
          </cfif>
          </cfoutput>
          </td>
      </tr>
    </table>
    </cfif>
    </td>
    </tr>
  <tr>
    <td colspan="3" align="left" valign="top">&nbsp;</td>
    </tr>
   <tr>
    <td width="48%" align="left" valign="top">Subject of this Email:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">
    <select name="subject" size="1">
    <cfquery name="contact_subjects" datasource="#datasrc#">
    select * from #table_inquiry_subject# Order By subject_id ASC
    </cfquery>
    <cfoutput>
    <cfloop query="contact_subjects">
    <option value="#subject#"> #subject#</option>
    </cfloop>
    </cfoutput>
    </select>
    </td>
    </tr>
    <cfoutput>
    <cfloop query="inquiry_fields">
  <tr>
    <td width="48%" align="left" valign="top">#display_name#</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><cfif #field_type# EQ "text">
    <input name="field_#inquiry_fields.currentRow#" type="text" size="size" />
    <cfelseif #field_type# EQ "textarea">
    <textarea name="field_#inquiry_fields.currentRow#" cols="10" rows="10"></textarea>
    <cfelseif #field_type# EQ "radio">
    <input name="field_#inquiry_fields.currentRow#" type="radio" <cfif #field_selected# EQ "1">checked="checked"</cfif> />
    <cfelseif #field_type# EQ "checkbox">
    <input name="field_#inquiry_fields.currentRow#" type="checkbox" <cfif #field_selected# EQ "1">checked</cfif> />
    <cfelseif #field_type# EQ "select">
    <select name="field_#inquiry_fields.currentRow#" size="1">
    <cfquery name="get_selects" datasource="#datasrc#">
    select * from #table_inquiry_sel# where field_id='#inquiry_fields.field_id#' order by field_selected DESC
    </cfquery>
    <cfloop query="get_selects">
    <option value="#get_selects.field_option_value#">#get_selects.field_option#</option>
    </cfloop>
    </select>
    </cfif>    </td>
  </tr>
 </cfloop>
 </cfoutput>
  <tr>
    <td align="left" valign="top">&nbsp;</td>
    <td>&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td align="left" valign="top">&nbsp;</td>
    <td>&nbsp;</td>
    <td align="left" valign="top"><table border="0" align="center" cellpadding="0" cellspacing="0" class="ButtonTable">
      <tr>
        <td width="7" height="20"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>/blog/images/buttons/button_left.gif" width="7" height="20" /></td>
        <td height="20" class="Button"><a href="javascript: document.contact.submit();" class="Button">Send Email</a></td>
        <td width="7" height="20"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>/blog/images/buttons/button_right.gif" width="7" height="20" /></td>
      </tr>
    </table></td>
  </tr>
</table>

    
    </form>
    </td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle">&nbsp;</td>
  </tr>
</table>
			</div>
		</div>

</div>

<cfelse>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">Contact <cfif NOT isDefined('company_info.company_name') and #company_info.company_name# EQ "">
		<cfoutput><strong>#site_name#</strong></cfoutput>
        <cfelseif isDefined('company_info.company_name')>
        <cfoutput><strong>#company_info.company_name#</strong></cfoutput>
        </cfif></td>
  </tr>
  <tr>
    <td><form id="contact" name="contact" method="post" action="http://<cfoutput>#site_domain##site_folder#index.cfm?module=#module#</cfoutput>&section=send">
    <input type="hidden" name="thanks_location" value="<cfoutput>#thanks_location#</cfoutput>">
    <input type="hidden" name="referrer" value="inquiry">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    
  <tr>
    <td colspan="3" align="left" valign="top">
     <cfif inquiry_show_info EQ "1">
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
     
      <tr>
        <td width="48%" align="left" valign="top">
		<cfif NOT isDefined('company_info.company_name') and #company_info.company_name# EQ "">
		<cfoutput><strong>#site_name#</strong></cfoutput>
        <cfelseif isDefined('company_info.company_name')>
        <cfoutput><strong>#company_info.company_name#</strong></cfoutput>
        </cfif>
         Contact Information:<br />
          <br />
            <b>Company Hours:</b>
            <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
            <cfoutput query="company_hours">
            <cfset monday="#hours_monday#">
            <cfset sunday="#hours_sunday#">
            <cfif #hours_tuesday# EQ #monday# and #hours_wednesday# eq #monday# and #hours_thursday# EQ #monday# and #hours_friday# EQ #monday#>
            <tr>
            <td width="48%" align="left" valign="top">Monday-Friday:</td>
            <td width="2%">&nbsp;</td>
            <td width="48%" align="left" valign="top">#monday#</td>
            </tr>
            <cfelse>
            <tr>
    <td width="48%" align="left" valign="top">Monday:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">#hours_monday#</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Tuesday:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">#hours_tuesday#</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Wednesday:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">#hours_wednesday#</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Thursday:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">#hours_thursday#</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Friday:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">#hours_friday#</td>
  </tr>
            </cfif>
	<cfif #hours_saturday# eq #sunday#>
            <tr>
            <td width="48%" align="left" valign="top">Saturday & Sunday:</td>
            <td width="2%">&nbsp;</td>
            <td width="48%" align="left" valign="top">#sunday#</td>
            </tr>
            <cfelseif #hours_saturday# NEQ #sunday#>
            <tr>
    <td width="48%" align="left" valign="top">Saturday:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">#hours_saturday#</td>
  </tr>
  <tr>
    <td width="48%" align="left" valign="top">Sunday:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">#hours_sunday#</td>
  </tr>
  </cfif>
  </cfoutput>
</table>

            </td>
        <td width="2%">&nbsp;</td>
        <td width="48%" align="left" valign="top">
        <cfoutput query="company_info">
        <strong>Address:</strong><br />
          <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td>#company_address#<br />
              <cfif isDefined('company_address_2') and #company_address_2# NEQ "">
              #company_address_2#<br />
              </cfif>
              #company_city#, #company_state# #company_zip#
              </td>
            </tr>
          </table>
          <cfif isDefined('company_tollfree') and #company_tollfree# NEQ "">
          <br /><strong>Toll Free:</strong> #company_tollfree#
          </cfif>
          <cfif isDefined('company_phone') and #company_phone# NEQ "">
          <br /><strong>Phone:</strong> #company_phone#
          </cfif>
          <cfif isDefined('company_fax') and #company_fax# NEQ "">
          <br /><strong>Fax:</strong> #company_fax#
          </cfif>
          </cfoutput>
          </td>
      </tr>
    </table>
    </cfif>
    </td>
    </tr>
  <tr>
    <td colspan="3" align="left" valign="top">&nbsp;</td>
    </tr>
   <tr>
    <td width="48%" align="left" valign="top">Subject of this Email:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">
    <select name="subject" size="1">
    <cfquery name="contact_subjects" datasource="#datasrc#">
    select * from #table_inquiry_subject# Order By subject_id ASC
    </cfquery>
    <cfoutput>
    <cfloop query="contact_subjects">
    <option value="#subject#"> #subject#</option>
    </cfloop>
    </cfoutput>
    </select>
    </td>
    </tr>
    <cfoutput>
    <cfloop query="inquiry_fields">
  <tr>
    <td width="48%" align="left" valign="top">#display_name#</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top"><cfif #field_type# EQ "text">
    <input name="field_#inquiry_fields.currentRow#" type="text" size="size" />
    <cfelseif #field_type# EQ "textarea">
    <textarea name="field_#inquiry_fields.currentRow#" cols="10" rows="10"></textarea>
    <cfelseif #field_type# EQ "radio">
    <input name="field_#inquiry_fields.currentRow#" type="radio" <cfif #field_selected# EQ "1">checked="checked"</cfif> />
    <cfelseif #field_type# EQ "checkbox">
    <input name="field_#inquiry_fields.currentRow#" type="checkbox" <cfif #field_selected# EQ "1">checked</cfif> />
    <cfelseif #field_type# EQ "select">
    <select name="field_#inquiry_fields.currentRow#" size="1">
    <cfquery name="get_selects" datasource="#datasrc#">
    select * from #table_inquiry_sel# where field_id='#inquiry_fields.field_id#' order by field_selected DESC
    </cfquery>
    <cfloop query="get_selects">
    <option value="#get_selects.field_option_value#">#get_selects.field_option#</option>
    </cfloop>
    </select>
    </cfif>    </td>
  </tr>
 </cfloop>
 </cfoutput>
  <tr>
    <td align="left" valign="top">&nbsp;</td>
    <td>&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td align="left" valign="top">&nbsp;</td>
    <td>&nbsp;</td>
    <td align="left" valign="top"><table border="0" align="center" cellpadding="0" cellspacing="0" class="ButtonTable">
      <tr>
        <td width="7" height="20"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>/blog/images/buttons/button_left.gif" width="7" height="20" /></td>
        <td height="20" class="Button"><a href="javascript: document.contact.submit();" class="Button">Send Email</a></td>
        <td width="7" height="20"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#</cfoutput>/blog/images/buttons/button_right.gif" width="7" height="20" /></td>
      </tr>
    </table></td>
  </tr>
</table>

    
    </form>
    </td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle">&nbsp;</td>
  </tr>
</table>
</cfif>
</cfif>