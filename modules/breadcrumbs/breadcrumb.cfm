<cfinclude template="../../functions/site_config.cfm">
<cfparam name="attributes.trail_length" default="1">
<cfif NOT structKeyExists(attributes, 'pageTitle')>
<cfexit>
</cfif>

<cflock name="addNewPage" type="exclusive" timeout="1">
<cfscript>
if ((arrayIsEmpty(session.clickstream)) OR (compare(attributes.pageTitle, session.clickstream[arrayLen(session.clickstream)].title))) {
if (arrayLen(session.clickstream) EQ attributes.trail_length) {
temp = arrayDeleteAt(session.clickstream, 1);
}
temp = arrayAppend(session.clickstream, structNew());

session.clickstream[arrayLen(session.clickstream)].title = attributes.pageTitle;
session.clickstream[arrayLen(session.clickstream)].path = listLast(cgi.script_name, '/');
}
</cfscript>
</cflock>

<cfoutput>
<cfloop from="#arrayLen(session.clickstream)#" to="1" index="i" step="-1">

<!---&nbsp;<a href="#session.clickstream[i].path#" class="breadcrumb_nav">#session.clickstream[i].title#</a> <font color="##ffffff"><b>::</b></font>--->
&nbsp;<a href="http://#site_domain##site_folder##session.clickstream[i].path#" class="breadcrumb_nav">#session.clickstream[i].title#</a><font color="##ffffff"><b> ::</b></font>


</cfloop>
</cfoutput>
