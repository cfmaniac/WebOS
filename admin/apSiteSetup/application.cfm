<!---\\ This is the Application File for the WebOS Installation Wizard //--->
<cfif isdefined('url.step')>
<cfif #url.step# EQ "2">
<cfset thisPath = ExpandPath("../")>
<cfset step_description = 'Initital Setup'>
<cfset completed ='10%'>
<cfset site_domain = #cgi.http_host#>
<cfset site_folder = #cgi.PATH_INFO#>
<cfset site_name ="WebOS Version 1.25 RC 1.5D">
<cfset site_mail_server ="mail.#site_domain#">
<cfset site_email ="you@#site_domain#">
<cfset site_license ="WEBOS_001_RC15_D">
<cfset site_location = GetDirectoryFromPath(thisPath)>
<cfset client_name ="Your Name">
<cfset client_email ="you@#site_domain#">
<cfelseif #url.step# EQ "3">
<cfset step_description = 'Template Configuration'>
<cfset completed ='20%'>
<cfset site_template_dir = "templates/">
<cfset site_admin_dir ="admin/">
<cfset site_modules_dir ="modules/">
<cfset site_assets_dir ="assets/">
<cfset site_header ="header.cfm">
<cfset site_footer ="footer.cfm">
<cfset site_width ="780">
<cfset left_col_width ="180">
<cfset left_col_active ="1">
<cfset site_side_box ="side_boxes/">
<cfset right_col_width="180">
<cfset right_col_active="0">
<cfset site_header_dir ="headers/">
<cfset site_footer_dir ="footers/">
<cfset site_scripts_dir="scripts/">
<cfset site_styles_dir="styles/">
<cfset template_file="index.cfm">
<cfset site_style_sheet="default.css">
<cfelseif #url.step# EQ "4">
<cfset step_description ="Module Configuration">
<cfset completed ='30%'>
<cfelseif #url.step# EQ "5">
<cfset step_description ="Database & DSN">
<cfset completed ='40%'>
<cfelseif #url.step# EQ "6">
<cfset step_description ="DSN Verification">
<cfset completed ='50%'>
<cfelseif #url.step# EQ "7">
<cfset step_description ="Database Creation & Population">
<cfset completed ='60%'>
<cfelseif #url.step# EQ "8">
<cfset step_description ="Create your Administrator Account">
<cfset completed ='70%'>
<cfelseif #url.step# EQ "8_5">
<cfset step_description ="Successfully Created your Administrator Account">
<cfset completed ='80%'>
<cfelseif #url.step# EQ "9">
<cfset step_description ="Review System Installation Configurables">
<cfset completed ='90%'>
<cfelseif #url.step# EQ "10">
<cfset step_description ="Writing System Configuration">
<cfset completed ='95%'>
<cfelseif #url.step# EQ "11">
<cfset step_description ="Installation Complete">
<cfset completed ='100%'>
</cfif>
<cfelseif NOT isDefined('url.step')>
<cfset step_description = 'Welcome to the WebOS Install Wizard'>
</cfif>