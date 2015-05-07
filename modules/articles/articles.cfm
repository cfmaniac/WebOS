<cfquery name="Selected_Article" datasource="#datasrc#">
select * from #table_articles# where article_id='#url.article_id#'
</cfquery>
<cfoutput query="Selected_Article">
<!---\\Begin the Premium Content //--->
<cfif #Selected_Article.article_premium# eq "1" or isDefined("url.premium") and url.premium eq "1">
 <!---\\Check to see if the user is logged in//--->
 <!---\\ Load Premium Article Warning//--->
 <cfif #session.allowin# EQ "No">
 <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">WebOS Articles :: #article_Title#</td>
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
          This article is <b>Premium Content</b> and only available to our Members.<br /><br />
         If you're a Member, go ahead and <a href="http://#site_domain##site_folder#index.cfm?module=users"> Login</a>. Not a Member? <a href="http://#site_domain##site_folder#index.cfm?module=users&action=register">Register</a> and read this article uninterrupted. 
             
</td> 
  </tr> 
</table></td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle"><a href="http://#site_domain##site_folder#index.cfm?module=#module#"><< Back to Articles Main</a></td>
  </tr>
</table>
 <cfelseif #session.allowin# EQ "Yes">
 <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">WebOS Articles :: #article_Title#</td>
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
          #article_description#...<br></td> 
  </tr> 
</table></td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle"> <cfif module_didyouknow EQ "1">
     <br />
     <cfinclude template="../didyouknow/index.cfm">
    </cfif></td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle"><a href="http://#site_domain##site_folder#index.cfm?module=#module#"><< Back to Articles Main</a></td>
  </tr>
</table>
 </cfif>
<cfelse>
<!---\\ Load Non-Premium Article //--->
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">WebOS Articles :: #article_Title#</td>
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
    <td height="10" align="right" valign="middle"> <cfif module_didyouknow EQ "1">
     <cfinclude template="../didyouknow/index.cfm">
    </cfif></td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle"><a href="http://#site_domain##site_folder#index.cfm?module=#module#"><< Back to Articles Main</a></td>
  </tr>
</table>
</cfif>
</cfoutput>