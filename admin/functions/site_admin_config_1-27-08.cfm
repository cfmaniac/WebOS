<!---\\ This Variable is set from the Installer //--->
<cfinclude template="../../functions/webos_dsn.cfm">
<cfinclude template="../../functions/webos_tables.cfm">
<!---\\Tells the System that if DATASRC above isn't assigned, run the installer. If it is, Initialize the Site //--->
<cfif NOT isdefined('datasrc') or #datasrc# EQ "">
<cflocation url="../../install/install.cfm">
<cfelseif isdefined('datasrc') and #datasrc# NEQ "">
<!---\\ Runs an Database Query to find, retrieve and set Site Configurables //--->
<cfquery name="site_config" datasource="#datasrc#">
select * from #table_config# 
</cfquery>

<cfquery name="system_config" datasource="#datasrc#">
select * from #table_config# where configuration_group ='SYSTEM'
</cfquery>

<cfquery name="template_config" datasource="#datasrc#">
select * from #table_config# where configuration_group ='TEMPLATES'
</cfquery>

<cfquery name="module_config" datasource="#datasrc#">
select * from #table_mods#
</cfquery>

<!---\\ This Tells the system whether or not the Site has Been Configured //--->
<cfoutput>
<cfset site_configured = "site_config.configuration_value">
</cfoutput>

<!---\\ This Tells the system the site configurables //--->
<cfoutput>
<cfloop query="system_config">
<cfset '#configuration_key#' = '#configuration_value#'>
</cfloop>
</cfoutput>

<!---\\ This Tells the System the Template Configurables //--->
<cfoutput>
<cfloop query="template_config">
<cfset '#configuration_key#' = '#configuration_value#'>
</cfloop>
</cfoutput>

<!---\\ This Tell the system which modules are installed and Active //--->
<cfoutput>
<cfloop query="module_config">
<cfset 'module_#module_directory#' = '#module_installed#'>
</cfloop>
</cfoutput>
</cfif>