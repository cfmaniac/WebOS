<cfif NOT isDefined('url.archive_id')>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">WebOS Articles Archive :</td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="news"> 
  <tr> 
    <td width="100%" height="100" valign="top" class="news"> 
    <cfoutput query="GetArticles_Archived" maxrows="100"> 
        <cfset newtitle = article_title> 
        <cfset fin1 = find(#CHR(32)#, newtitle,50)> 
		<cfset newtitle2 = "">
        <cfif Fin1 NEQ 0> 
          <cfset newtitle2 = #left(newtitle,fin1)# > 
          <cfset newtitle3  = ReplaceNoCase(newtitle2," ", "-", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"'", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,".", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"&", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,":", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,",", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"and", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"--", "-", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"/", "-", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"?", "-", "all")> 
          <cfelse> 
          <cfset newtitle3  = ReplaceNoCase(newtitle2," ", "-", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"'", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,".", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"&", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,":", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,",", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"and", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"--", "-", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"/", "-", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"?", "-", "all")>
        </cfif> 
        <cfif right(newtitle3,1) EQ "-"> 
          <cfset newlength = len(newtitle3) - 1> 
          <cfset newtitle4 = left(newtitle3, newlength)> 
          <cfelse> 
          <cfset newtitle4 = #newtitle3#> 
        </cfif> 
		       <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><A href="http://#site_domain##site_folder#index.cfm?module=#module#&section=archives&archive_id=#article_id#" class="news"><strong>#left(article_title,100)#...</strong></A></td>
  </tr>
  <tr>
    <td><em>#article_source#</em><br> 
    #left(article_description,80)#...<br> 
       <br></td>
  </tr>
  <tr>
    <td> <A href="http://#site_domain##site_folder#index.cfm?module=#module#&section=archives&archive_id=#article_id#" class="news">Read more >></A></td>
  </tr>
  <tr>
    <td><hr>
</td>
  </tr>
  <tr>
    <td><a href="http://#site_domain##site_folder#index.cfm?module=#module#">Back to our Articles</a></td>
  </tr>
</table>

      </cfoutput>
</td> 
  </tr> 
</table>
</td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle"></td>
  </tr>
</table>

<cfelseif isDefined('url.archive_id')>
 <cfoutput query="Archived_Article">
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">WebOS Archived Articles :: #article_Title#</td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="news"> 
  <tr> 
    <td width="100%" height="100" valign="top" class="news"> 
     
        <cfset newtitle = left(article_title, 40)> 
        <cfset fin1 = find(#CHR(32)#, newtitle,35)> 
        <cfif Fin1 NEQ 0> 
          <cfset newtitle2 = #left(newtitle,fin1)# > 
          <cfset newtitle3  = ReplaceNoCase(newtitle2," ", "-", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"'", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,".", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"&", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,":", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,",", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"and", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"--", "-", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"/", "-", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"?", "-", "all")> 
          <cfelse> 
          <cfset newtitle3  = ReplaceNoCase(newtitle," ", "-", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"'", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,".", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"&", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,",", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,":", "", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"--", "-", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"/", "-", "all")> 
          <cfset newtitle3  = ReplaceNoCase(newtitle3,"?", "-", "all")> 
        </cfif> 
        <cfif right(newtitle3,1) EQ "-"> 
          <cfset newlength = len(newtitle3) - 1> 
          <cfset newtitle4 = left(newtitle3, newlength)> 
          <cfelse> 
          <cfset newtitle4 = #newtitle3#> 
        </cfif> 
	<br>
        <strong>#article_Title#...</strong><br> 
          <em>#article_source#</em><br> 
          #article_description#...<br> 
             
</td> 
  </tr> 
</table></td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle"><a href="http://#site_domain##site_folder#index.cfm?module=#module#&section=archives"><< Back to Articles Archives</a><br /><a href="http://#site_domain##site_folder#index.cfm?module=#module#"><< Back to Main Articles </a></td>
  </tr>
</table>
 </cfoutput>
</cfif>