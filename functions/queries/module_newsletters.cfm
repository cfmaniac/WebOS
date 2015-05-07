<!---\\Reading Archived Newsletter//--->
<cfif isDefined('url.newsletter_id') and #url.newsletter_id# NEQ "">
<Cfquery name="Archived_Newsletter" datasource="#datasrc#">
Select newsletter_id, newsletter_title, newsletter_content, date_sent from #table_newsletters_arch# where newsletter_id ='#url.newsletter_id#'
 </CFQUERY>
 </cfif>