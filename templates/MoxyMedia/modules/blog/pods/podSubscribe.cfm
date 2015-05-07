<!---
	Name         : podSubscription.cfm
	Author       : James Harvey
	Created      : August 08, 2007
	Last Updated : August 08, 2007
	History      : Version 1.0
--->
<table width="180" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="templates/<cfoutput>#site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">Subscribe</td>
  </tr>
  <tr>
    <td><form name="newsletter" method="post" action="<cfoutput>#application.siteAddress#</cfoutput>subscribe.cfm/addEmail/yes" >
            <input type="hidden" value="<cfoutput>#application.siteDomain#</cfoutput>" name="domain" size="23">
	        <input type="text" value="" name="nemail" size="23">
            <!---<input type="submit" value="Go!" id="subscribebutton" name="subscribebutton" />--->
               <table border="0" cellspacing="0" cellpadding="0" class="ButtonTable">
  <tr>
    <td width="7" height="20"><img src="<cfoutput>#site_template_dir##site_template#/#site_modules_dir#</cfoutput>/blog/images/buttons/button_left.gif" width="7" height="20" /></td>
    <td height="20" class="Button"><a href="javascript: document.newsletter.submit();" class="Button">Subscribe</a></td>
    <td width="7" height="20"><img src="<cfoutput>#site_template_dir##site_template#/#site_modules_dir#</cfoutput>/blog/images/buttons/button_right.gif" width="7" height="20" /></td>
  </tr>
</table>
	        </form>
	        Enter your email address to subscribe to this blog. </td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle"></td>
  </tr>
</table>	        