<cfquery name="site_meta_tags" datasource="#datasrc#">
select * from #table_meta#
</cfquery> 
<cfoutput query="site_meta_tags">
<META NAME="Subject" CONTENT="#meta_subject#">
<META NAME="Description" CONTENT="#meta_description#">
<META NAME="Keywords" CONTENT="#meta_keywords#">
<META NAME="Generator" CONTENT="WebOS: Website Operating System in Coldfusion">
<META NAME="Language" CONTENT="#meta_language#">
<META NAME="Expires" CONTENT="#meta_expires#">
<META NAME="Abstract" CONTENT="#meta_abstract#">
<META NAME="Copyright" CONTENT="© Copyright #DatePart('yyyy', Now())# #meta_site_name#">
<META NAME="Revisit-After" CONTENT="#meta_revisit#">
<META NAME="Distribution" CONTENT="#meta_distribution#">
<META NAME="Robots" CONTENT="#meta_bots#">
<META NAME="Googlebot" CONTENT="#meta_googlebot#">
<META NAME="msnbot" CONTENT="#meta_msnbot#">
</cfoutput>
