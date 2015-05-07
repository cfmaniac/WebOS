<Cfquery name="GetArticles" datasource="#datasrc#">
Select article_id, article_title, article_description, article_source, article_create_date, article_content_state, article_active, article_premium 
from #table_articles# where article_active ='1' order by article_create_date desc
</CFQUERY>
<cfif isDefined('url.module') and #url.module# EQ "articles">
<cfif isDefined('url.article_id') and #url.article_id# NEQ "">
<Cfquery name="Selected_Article" datasource="#datasrc#">
Select article_id, article_title, article_description, article_source, article_create_date, article_content_state, article_premium from #table_articles# where article_id ='#url.article_id#'
 </CFQUERY>
  </cfif>

<!---\\ Viewing Archived Articles List //---> 
<Cfquery name="GetArticles_Archived" datasource="#datasrc#">
Select article_id, article_title, article_description, article_source, article_create_date, article_content_state, article_active 
from #table_articles# where article_archived ='1' order by article_create_date desc
</CFQUERY>
<!---\\ Reading Archived Article //--->
<cfif isDefined('url.archive_id') and #url.archive_id# NEQ "">
<Cfquery name="Archived_Article" datasource="#datasrc#">
Select article_id, article_title, article_description, article_source, article_create_date, article_content_state from #table_articles# where article_id ='#url.archive_id#' and article_archived ='1'
 </CFQUERY>
 </cfif>
</cfif>
<!---\\ For the Archives Column Box //--->
<Cfquery name="GetArticles_Archived" datasource="#datasrc#">
Select article_id, article_title, article_description, article_source, article_create_date, article_content_state, article_active 
from #table_articles# where article_archived ='1' order by article_create_date desc
</CFQUERY>