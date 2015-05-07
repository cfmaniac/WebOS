<cf_headfoot>
<cfparam name="attributes.script" default="Login FrameWork">
<cfparam name="attributes.page" default="Meta Tags Administration">
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

<cfif isDefined('url.Update') and #url.Update# is "yes">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="update_analytics">
  UPDATE #table_meta# SET meta_subject = '#form.meta_subject#', meta_description = '#form.meta_description#', meta_keywords = '#form.meta_keywords#', meta_language = '#form.meta_language#', meta_abstract = '#form.meta_abstract#', meta_revisit = '#form.meta_revisit#', meta_distribution = '#form.meta_distribution#', meta_bots = '#form.meta_bots#', meta_googlebot = '#form.meta_googlebot#', meta_msnbot = '#form.meta_msnbot#' WHERE meta_id ='#form.meta_id#' 
			</CFQUERY>
  </CFTRANSACTION>
  <cflocation url="module_metatags.cfm" addToken="No">
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
    <td width="100" valign="top"><img src="assets/modules/modules_metatags.jpg" alt="WebOS Site Configuration" width="100" height="100" /></td>
    <td valign="top"><cfif do EQ "m">
    <!---\\ Intro Text //--->
    Welcome <b><cfoutput>#session.user#</cfoutput></b>, to the WebOS <b><cfoutput>#attributes.page#</cfoutput></b> Page. This module allows you to Edit/Update your Website's Meta Tags.
    <!---\\ Default Display //--->

    <hr width="95%" align="center"/>
<CFQUERY DataSource="#datasrc#" Name="display_metatags">
			SELECT * FROM #table_meta#
</CFQUERY>
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Your Site's MetaTags:</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><form method="post" action="?Update=yes" name="module_metatags">
<input type="hidden" name="meta_id" value="<cfoutput>#display_metatags.meta_id#</cfoutput>" />
<cfoutput query="display_metatags">
<table width="100%"  border="0" align="center" cellpadding="2" class="normal">
                        <!-- The author META tag defines the name of the author of the document being read. -->
                        <tr>
                          <td width="48%" class="style2">Subject:</td>
                          <td width="52%" class="style2"><input type="text" name="meta_subject" size="40" value="#meta_subject#"/>                          </td>
                        </tr>
                        <tr>
                          <td class="style2">Description:</td>
                          <td class="style2"><input type="text" name="meta_description" size="40" value="#meta_description#"/>                          </td>
                        </tr>
                        <tr>
                          <td class="style2">Keywords:</td>
                          <td class="style2"><input type="text" name="meta_keywords" size="40" value="#meta_keywords#"/>                          </td>
                        </tr>
                        <tr>
                          <td class="style2">Language:</td>
                          <td class="style2"><input type="text" name="meta_language" size="40" value="#meta_language#"/>                          </td>
                        </tr>
                       <!-- The abstract META tag is a one line sentence which gives an overview of the entire webpage -->
                        <tr>
                          <td class="style2">Abstract:<br />
                            <span class="style1">The abstract META tag is a one line sentence which gives an overview of the entire webpage</span></td>
                          <td class="style2"><input type="text" name="meta_abstract" size="40" value="#meta_abstract#"/>                          </td>
                        </tr>
                          
        <!-- The Revisit META tag defines how often a search engine or spider should
        come to your website for re-indexing. For example: 2 Days, 3 Days, 4 Days, etc.
        Note: Just ad number(s), word Days will be added automatically -->
                        <tr>
                          <td class="style2">Revisit-After:<br />
                            <span class="style1">The Revisit META tag defines how often a search engine or spider should
        come to your website for re-indexing. For example: 2 Days, 3 Days, 4 Days, etc.
        Note: Just ad number(s), word Days will be added automatically</span></td>
                          <td class="style2"><input type="text" name="meta_revisit" size="40" value="#meta_revisit#"/>                          </td>
                        </tr>
                        <!-- Distribution: Global (indicates that your webpage is intended for
        mass distribution to everyone), Local (intended for local distribution
        of your document), and IU - Internal Use (not intended for public distribution). -->
                        <tr>
                          <td class="style2">Distribution:<br />
                            <span class="style1">Global (indicates that your webpage is intended for<br />
mass distribution to everyone), Local (intended for local distribution<br />
of your document), and IU - Internal Use (not intended for public distribution)</span></td>
                          <td class="style2"><select name="meta_distribution" size="1">
                              <option value="" selected="selected">Select One</option>
                              <option value="Global" <cfif #meta_distribution# EQ "Global">SELECTED</cfif>> 1. Global</option>
                              <option value="Local" <cfif #meta_distribution# EQ "Local">SELECTED</cfif>>2. Local</option>
                              <option value="IU" <cfif #meta_distribution# EQ "IU">SELECTED</cfif>>3. Intern Use</option>
                            </select>                          </td>
                        </tr>
                        <tr>
                          <td class="style2">Robots:</td>
                          <td class="style2"><select name="meta_bots" size="1">
                              <option value="">Select One</option>
                              <option value="All" <cfif #meta_bots# EQ "All">SELECTED</cfif>>1. All</option>
                              <option value="None" <cfif #meta_bots# EQ "None">SELECTED</cfif>>2. None</option>
                              <option value="Index" <cfif #meta_bots# EQ "Index">SELECTED</cfif>>3. Index</option>
                              <option value="No Index" <cfif #meta_bots# EQ "No Index">SELECTED</cfif>>4. No Index</option>
                              <option value="Follow" <cfif #meta_bots# EQ "Follow">SELECTED</cfif>>5. Follow</option>
                              <option value="No Follow" <cfif #meta_bots# EQ "No Follow">SELECTED</cfif>>6. No Follow</option>
                              <option value="Index, No Follow" <cfif #meta_bots# EQ "Index, No Follow">SELECTED</cfif>>7. Index, No Follow</option>
                              <option value="Index, Follow" <cfif #meta_bots# EQ "Index, Follow">SELECTED</cfif>>8. Index, Follow</option>
                              <option value="No Index, No Follow" <cfif #meta_bots# EQ "No Index, No Follow">SELECTED</cfif>>9. No Index, No Follow</option>
                            </select>                          </td>
                        </tr>
                        <tr>
                          <td class="style2">GoogleBOT:</td>
                          <td class="style2"><select name="meta_googlebot" size="1">
                               <option value="">Select One</option>
                              <option value="All" <cfif #meta_googlebot# EQ "All">SELECTED</cfif>>1. All</option>
                              <option value="None" <cfif #meta_googlebot# EQ "None">SELECTED</cfif>>2. None</option>
                              <option value="Index" <cfif #meta_googlebot# EQ "Index">SELECTED</cfif>>3. Index</option>
                              <option value="No Index" <cfif #meta_googlebot# EQ "No Index">SELECTED</cfif>>4. No Index</option>
                              <option value="Follow" <cfif #meta_googlebot# EQ "Follow">SELECTED</cfif>>5. Follow</option>
                              <option value="No Follow" <cfif #meta_googlebot# EQ "No Follow">SELECTED</cfif>>6. No Follow</option>
                              <option value="Index, No Follow" <cfif #meta_googlebot# EQ "Index, No Follow">SELECTED</cfif>>7. Index, No Follow</option>
                              <option value="Index, Follow" <cfif #meta_googlebot# EQ "Index, Follow">SELECTED</cfif>>8. Index, Follow</option>
                              <option value="No Index, No Follow" <cfif #meta_googlebot# EQ "No Index, No Follow">SELECTED</cfif>>9. No Index, No Follow</option>
                            </select>                          </td>
                        </tr>
                        <tr>
                          <td class="style2">MSNBOT:</td>
                          <td class="style2"><select name="meta_msnbot" size="1">
                             <option value="">Select One</option>
                              <option value="All" <cfif #meta_msnbot# EQ "All">SELECTED</cfif>>1. All</option>
                              <option value="None" <cfif #meta_msnbot# EQ "None">SELECTED</cfif>>2. None</option>
                              <option value="Index" <cfif #meta_msnbot# EQ "Index">SELECTED</cfif>>3. Index</option>
                              <option value="No Index" <cfif #meta_msnbot# EQ "No Index">SELECTED</cfif>>4. No Index</option>
                              <option value="Follow" <cfif #meta_msnbot# EQ "Follow">SELECTED</cfif>>5. Follow</option>
                              <option value="No Follow" <cfif #meta_msnbot# EQ "No Follow">SELECTED</cfif>>6. No Follow</option>
                              <option value="Index, No Follow" <cfif #meta_msnbot# EQ "Index, No Follow">SELECTED</cfif>>7. Index, No Follow</option>
                              <option value="Index, Follow" <cfif #meta_msnbot# EQ "Index, Follow">SELECTED</cfif>>8. Index, Follow</option>
                              <option value="No Index, No Follow" <cfif #meta_msnbot# EQ "No Index, No Follow">SELECTED</cfif>>9. No Index, No Follow</option>
                            </select>                          </td>
                        </tr>
                        <tr>
                          <td class="style2">&nbsp;</td>
                          <td class="style2"><input type="submit" name="Edit Tags" id="Edit Tags" value="Edit/update Meta Tags" /></td>
                        </tr>
      </table>
      </cfoutput>
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
    <cfelseif do EQ "a">
    
    <cfelseif do EQ "e">
    
    <cfelseif do EQ "d">
    
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