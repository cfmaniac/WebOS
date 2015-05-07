<!---\\ This Will load the templates index file if it is defined and exisits //--->
<cfif isDefined('template_file') and template_file NEQ "">
<!---\\We Know it's defined, but will we find it?//--->
<cfset load_template = #template_file#>
<cfif FileExists(ExpandPath("#site_template_dir##site_template#/#load_template#"))>
<!---\\ We found the template, so We're going to load it! //--->
<cfinclude template="#site_template_dir##site_template#/#load_template#">
<cfelse>
<!---\\ We didn't Find the Template so We're going to load the Default Layout //--->
We're loading the Default.
</cfif>
<cfelseif template_file EQ "">
We're loading the Default.
</cfif>
<!---\\ End of the templates index loader code //--->