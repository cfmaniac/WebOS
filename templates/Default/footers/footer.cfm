<br />
<cfif module_banners EQ "1">
    <cfinclude template="../../../#site_modules_dir#banners/index.cfm">
</cfif>
<br />
&copy; Copyright <cfoutput>#DatePart('yyyy', Now())#</cfoutput> WebOS - All Rights Reserved <img src="<cfoutput>#site_template_dir#/#site_template#/#site_assets_dir#</cfoutput>poweredby.gif" align="absmiddle" />