<!---\\ Runs an Database Query to find, retrieve and set Site Configurables //--->
<cfquery name="site_config" datasource="#datasrc#">
select * from #table_config# 
</cfquery>

<cfquery name="core_config" datasource="#datasrc#">
select * from #table_config# where configuration_group ='CORE'
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