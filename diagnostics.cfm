<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><cfoutput>#site_name#</cfoutput></title>
<!--ap debug-->
<!--- @import url("http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir##site_styles_dir##site_style_sheet#</cfoutput>");
 --->
<style type="text/css">
<!--
@import url("http://<cfoutput>#site_domain#/#site_template_dir##site_template#/#site_assets_dir##site_styles_dir##site_style_sheet#</cfoutput>");

-->
</style>
</head>

<body>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="48%" align="left" valign="top">WebOS Diagnostics:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">&nbsp;</td>
  </tr>
  <cfoutput>
  <cfloop query="system_config">
  <tr>
    <td width="48%" align="left" valign="top">#configuration_key#</td>
    <td width="2%">&nbsp;</td>
    <td width="48%" align="left" valign="top">#configuration_value#</td>
  </tr>
  </cfloop>
  </cfoutput>
</table>
<hr />
<!---
Change following parameters value to "No" to show the serial number or supply the argument as part of URL.

Example: cfserverinfo.cfm?hideserialnumber=no
--->
<cfparam name="hideserialnumber" default="Yes">
<cfoutput>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border:1px solid ##47B1DB;">
      <tr>
        <td width="48%"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td colspan="2"><H4><B>ColdFusion Server Information</B></H4></td>
            </tr>
          <tr>
            <td width="50%" align="left" valign="top"><B>Product Name</B>:</td>
            <td width="50%" align="left" valign="top">#server.coldfusion.ProductName#</td>
          </tr>
          <tr>
            <td width="50%" align="left" valign="top"><B>Product Version</B>:</td>
            <td width="50%" align="left" valign="top">#server.coldfusion.productversion#</td>
          </tr>
          <tr>
            <td width="50%" align="left" valign="top"><B>Application Server:</B>:</td>
            <td width="50%" align="left" valign="top">#server.coldfusion.appserver#</td>
          </tr>
          <tr>
            <td width="50%" align="left" valign="top"><B>Product Level</B>:</td>
            <td width="50%" align="left" valign="top">#server.coldfusion.productlevel#</td>
          </tr>
          <tr>
            <td width="50%" align="left" valign="top"><B>Serial Number</B>:</td>
            <td width="50%" align="left" valign="top">
			
			<cfif hideserialnumber EQ "NO">
		#server.coldfusion.serialNumber#
		  <cfelse>
		<font color="red">The serial number is hidden by default, please check code to display serial number.</font>
	</cfif></td>
          </tr>
          <tr>
            <td width="50%" align="left" valign="top"><B>Supported Locales</B>:</td>
            <td width="50%" align="left" valign="top"><!---#server.coldfusion.SupportedLocales#---></td>
          </tr>
          <tr>
            <td width="50%" align="left" valign="top"><strong>ColdFusion Root Dir:</strong></td>
            <td width="50%" align="left" valign="top">#Server.ColdFusion.Rootdir#</td>
          </tr>
        </table></td>
        <td width="2%">&nbsp;</td>
        <td width="48%" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td colspan="2"><B>OS Variables</B></td>
            </tr>
          <tr>
            <td width="50%" align="left" valign="top"><B>Name</B>:</td>
            <td width="50%" align="left" valign="top">#server.OS.Name#<br />            </td>
          </tr>
          <tr>
            <td width="50%" align="left" valign="top"><B>AdditionalInformation</B>:</td>
            <td width="50%" align="left" valign="top">#server.OS.AdditionalInformation#</td>
          </tr>
          <tr>
            <td width="50%" align="left" valign="top"><B>Version</B>:</td>
            <td width="50%" align="left" valign="top">#server.OS.Version#</td>
          </tr>
          <tr>
            <td width="50%" align="left" valign="top"><B>BuildNumber</B>:</td>
            <td width="50%" align="left" valign="top">#server.OS.BuildNumber#</td>
          </tr>
          <tr>
            <td width="50%" align="left" valign="top"><strong>Architecture:</strong></td>
            <td width="50%" align="left" valign="top">#Server.OS.arch#</td>
          </tr>
          <tr>
            <td width="50%" align="left" valign="top">&nbsp;</td>
            <td width="50%" align="left" valign="top">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table>
    </cfoutput><br /><br /></td>
    <td width="1%">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3" align="center" valign="top"><strong>Path:<cfoutput></cfoutput></strong><cfoutput>
#GetDirectoryFromPath(GetTemplatePath())#

</cfoutput>
</body>
</html>