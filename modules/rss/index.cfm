<!---\\ Module Configuration //--->
<cfset module ="rss">
<!---\\ End of Module Configuration //---->
<cfif isDefined('url.read') and #url.read# EQ "our_feeds">
<!---\\Read our internally generated feeds//--->
    <cfif isdefined('url.id') and #url.id# NEQ "">
    <CFQUERY NAME="read_our_rss" datasource="#datasrc#">
    SELECT * FROM    #table_our_feeds#
    WHERE  rss_id ='#url.id#'
    ORDER   BY rss_weight ASC
    </CFQUERY>
    <cfoutput query="read_our_rss">
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#menu_bg.gif" class="main_page_title">RSS Feeds :: #rss_title#</td>
  </tr>
  <tr>
    <td height="10" align="center" valign="middle"><a href="http://<cfoutput>#site_domain##site_folder#index.cfm?module=#module#</cfoutput>"> Return to the RSS Feeds Directory</a> | <a href="http://<cfoutput>#site_domain##site_folder#index.cfm?module=#module#</cfoutput>&read=ext_feeds">View External Feeds</a></td>
  </tr>
  <tr>
  <td>
  <!---\\ The Feed list will go Here //--->
  Author: #rss_author#<br />
  Date Created: #rss_created#<hr />
  #rss_content#
  <!---\\ End of the Feed List //--->
  </td>
  </tr>
  <tr>
  <td align="right"><br />Subscribe to our feeds by <a href="<cfoutput>http://#site_domain##Site_folder#</cfoutput>our_feed.xml">Clicking Here</a></td>
  </tr>
  </table>
  </cfoutput>
    <cfelseif NOT isdefined('url.id') or isdefined('url.id') and #url.id# EQ "">
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">RSS Feeds Error :: 10004</td>
  </tr>
  <tr>
    <td>The Feed ID was not passed properly, or was not correctly assigned.<br>Please Check your links, or the link you followed to the feed.<br>
    </td>
    </tr>
    </table>
    </cfif>
<cfelseif isdefined('url.read') and #url.read# EQ "ext_feeds">
<!---\\Read our externally generated feeds//--->
    <cfif isdefined('url.id') and #url.id# NEQ "">
    <CFQUERY NAME="get_ext_rss" datasource="#datasrc#">
   SELECT * FROM    #table_rss#
   WHERE  rss_id ='#url.id#'
   ORDER   BY rss_weight ASC
</CFQUERY>
    
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <cfoutput query="get_ext_rss">
  <tr>
    <td height="25" align="left" valign="middle" background="http://#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#menu_bg.gif" class="main_page_title">RSS Feeds :: #rss_title#</td>
  </tr>  </cfoutput>
  <tr>
    <td height="10" align="center" valign="middle"><a href="http://<cfoutput>#site_domain##site_folder#index.cfm?module=#module#</cfoutput>"> Return to the RSS Feeds Directory</a> | <a href="http://<cfoutput>#site_domain##site_folder#index.cfm?module=#module#</cfoutput>&read=our_feeds">View Our Feeds</a></td>
  </tr>
  <tr>
  <td>
      <cfoutput query="get_ext_rss">
	<cfscript>
  URLToPull  = "#rss_content#";
</cfscript> 
 
<!---\\The next step is to actually do a CFHTTP to the location you specified, this is how you get the values of the XML/RSS from the site you want (in this case, the 5 most viewed EasyCFM.Com Tutorials)://--->
 
<cfhttp url="#URLToPull#" method="GET" timeout="15">
</cfhttp> 
 </cfoutput>
<!---\\ Here, first let's define a variable called XMLContent and assign the returned value of CFHTTP to it, next let's trim() it to ensure that the XML is correctly parsed by the line below that.//--->
 
<cfscript>
  XMLContent = trim(cfhttp.filecontent);
  XMLContent = XMLParse(XMLContent);
</cfscript> 
 
<!---\\Now, let's actually output the information about the feed, in this case the site logo, title and description://--->
 
<cfoutput>
    Feed provided by:<BR>
    <a href="#XMLContent.rss.channel.image.link.xmlText#">
       <img src="#XMLContent.rss.channel.image.url.xmlText#" alt="#XMLContent.rss.channel.image.title.xmlText#" border="0">
    </a><br>
    #XMLContent.rss.channel.title.xmlText#<BR>
    #XMLContent.rss.channel.description.xmlText#<BR><BR>
</cfoutput> 
 
<!---\\Now we will use the array value "XMLContent.rss.channel.item" which will let us know how many records we want to process and display://--->
 
<cfloop from="1" to="#ArrayLen(XMLContent.rss.channel.item)#" index="idx">
 <hr>
 <cfoutput>
 <b><a href="#XMLContent.rss.channel.item[idx].link.xmlText#" target="_blank">#XMLContent.rss.channel.item[idx].title.xmlText#</a></b><BR>
 #ParagraphFormat(ReplaceNoCase(XMLContent.rss.channel.item[idx].description.xmlText, "&lt;", "<", "ALL"))#
 Author: #XMLContent.rss.channel.item[idx].author.xmlText#<BR>
 Date: #XMLContent.rss.channel.item[idx].pubDate.xmlText#
 </cfoutput>
</cfloop> 
 
<!---\\Last, let's display the actual copyright notice that the feed itself returns://--->
 
<HR>
<cfoutput><div align="center">Feeds: #XMLContent.rss.channel.copyright.xmlText#</div></cfoutput> 
<cfif isDefined('url.debug')> 
<!---\\ And that's pretty much it... 
Remember that you can also do this if you are stuck along the way://--->
 
<cfdump var="#XMLContent#">
 
<!---\\ That will dump out the XML file and that will allow you to see what you're doing. You can go entering data in the CFDUMP tag as follows://--->
 
<!---\\ This till show you the main XML document. //--->
<cfdump var="#XMLContent#"> 
 
<!---\\  This will take you into the RSS branch //--->
<cfdump var="#XMLContent.rss#">
 
<!---\\ this will take you into the first child branch of the rss section. //--->
<cfdump var="#XMLContent.rss.XMLChildren[1]#">
</cfif>
  <!---\\ End of the Feed List //--->
  </td>
  </tr>
  </table>

    <cfelseif not isdefined('url.id') or isdefined('url.id') and #url.id# EQ "">
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">RSS Feeds Error :: 10004</td>
  </tr>
  <tr>
    <td>The Feed ID was not passed properly, or was not correctly assigned.<br>Please Check your links, or the link you followed to the feed.<br>
    </td>
    </tr>
    </table>
    </cfif>
<cfelseif NOT isdefined('url.read') or #url.read# EQ "">
<!---\\View the Default list of available RSS Feeds//--->
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">Available RSS Feeds ::</td>
  </tr>
  <tr>
    <td>
    Please Select from the Availabe Feeds Below:
    <hr>
    <cfif #get_rss.recordcount# EQ "1">
    <!---\\ Load Just the one External Feed //--->
    <ul>
    <cfoutput query="get_rss">
    <li><b><a href="http://#site_domain##site_folder#index.cfm?module=#module#&read=ext_feeds&id=#rss_id#">#rss_title#</a></b></li>
    </cfoutput>
    </ul>
    <cfelseif #get_rss.recordcount# GT "1">
    <!---\\Loads an unordered list of Available External feeds//--->
    <b>Available External Feeds:</b><br>
	<cfoutput>
    <ul>
    <cfloop query="get_rss">
    <li><b><a href="http://#site_domain##site_folder#index.cfm?module=#module#&read=ext_feeds&id=#rss_id#">#rss_title#</a></b></li>
    </cfloop>
    </ul>
    </cfoutput>
    </cfif>
    <hr> 
    <b>Available Feeds from <cfoutput>#site_name#</cfoutput>:</b><br>
    <cfif #get_our_rss.recordcount# EQ "1">
    <!---\\ Load just the one internalized feed //--->
    <ul>
    <cfoutput query="get_our_rss">
    <li><b><a href="http://#site_domain##site_folder#index.cfm?module=#module#&read=our_feeds&id=#rss_id#">#rss_title#</a></b></li>
    </cfoutput>
    </ul>
    <cfelseif #get_our_rss.recordcount# GT "1">
    <cfoutput>
    <ul>
    <cfloop query="get_our_rss">
    <li><b><a href="http://#site_domain##site_folder#index.cfm?module=#module#&read=our_feeds&id=#rss_id#">#rss_title#</a></b></li>
    </cfloop>
    </ul>
    </cfoutput>
    </cfif>
    </td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle">&nbsp;</td>
  </tr>
</table>
</cfif>