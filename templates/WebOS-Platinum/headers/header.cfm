<div id="header">
	<div id="logo">
		<img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>webos_logo.gif" alt="<cfoutput>#site_name#</cfoutput>"/><br>
        <h3>Website Operating System</h3>
	
	</div>
	<div id="menu">
		<!---<ul>
			<li class="active"><a href="#" title="">Homepage</a></li>
			<li><a href="#" title="">About Us</a></li>
			<li><a href="#" title="">Products</a></li>
			<li><a href="#" title="">Clients</a></li>
			<li><a href="#" title="">Support</a></li>
		</ul>--->
         <cfif module_banners EQ "1">
    <cfinclude template="../../../#site_modules_dir#banners/index.cfm">
    </cfif><br />
    <cfif module_zipsearch EQ "1">
    <cfinclude template="../../../#site_modules_dir#zipsearch/zip_locate_form.cfm">
    </cfif>
	</div>
</div>
 <cfif module_breadcrumbs EQ "1">
<div id="breadcrumbs">
    <cfinclude template="../../../#site_modules_dir#/breadcrumbs/index.cfm">

<cfelse>
    <!-- BreadCrumbs Module Not Loaded -->

</cfif>
		</div>