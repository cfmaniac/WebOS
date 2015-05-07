<!---\\ Module Configuration //--->
<cfset module ="podcasts">
<cfset pdcast_colors="red">
<cfset pdcast_width="350">

<!---Beginning of the PodCast Loading--->
    <cfparam name="url.cat" default="Home">    
<!---\\ End of Module Configuration //---->
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title"><cfoutput>#site_name#</cfoutput> :: PodCasts</td>
  </tr>
  <tr>
    <td>
<cfif isDefined('url.action') and #url.action# EQ "stream">
<b>Currently Streaming File: <cfoutput>#url.file#</cfoutput></b><br />
<embed src="http://<cfoutput>#site_domain##site_folder##site_modules_dir#podcasts/files/#url.file#</cfoutput>" width="100%" height="32"></embed>
<cfelseif NOT isDefined('url.action') or isDefined('url.action') and #url.action# EQ "">   
<script type="text/javascript" src="modules/podcasts/_assets/_scripts/animatedcollapse.js">
</script>
<script type="text/javascript">
<!--
function MM_goToURL() { //v3.0
  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
}
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
<table width="<cfoutput>#pdcast_width#</cfoutput>" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
   <td><img src="images/<cfoutput>page</cfoutput>/<cfoutput>#pdcast_colors#</cfoutput>/spacer.gif" width="29" height="1" border="0" alt="" /></td>
   <td width="9"><img src="images/<cfoutput>page</cfoutput>/<cfoutput>#pdcast_colors#</cfoutput>/spacer.gif" width="9" height="1" border="0" alt="" /></td>
   <td width="13"><img src="images/<cfoutput>page</cfoutput>/<cfoutput>#pdcast_colors#</cfoutput>/spacer.gif" width="13" height="1" border="0" alt="" /></td>
   <td width="495"><img src="images/<cfoutput>page</cfoutput>/<cfoutput>#pdcast_colors#</cfoutput>/spacer.gif" width="273" height="1" border="0" alt="" /></td>
   <td width="15"><img src="images/<cfoutput>page</cfoutput>/<cfoutput>#pdcast_colors#</cfoutput>/spacer.gif" width="15" height="1" border="0" alt="" /></td>
   <td width="13"><img src="images/<cfoutput>page</cfoutput>/<cfoutput>#pdcast_colors#</cfoutput>/spacer.gif" width="7" height="1" border="0" alt="" /></td>
   <td width="29"><img src="images/<cfoutput>page</cfoutput>/<cfoutput>#pdcast_colors#</cfoutput>/spacer.gif" width="29" height="1" border="0" alt="" /></td>
   <td width="1"><img src="images/<cfoutput>page</cfoutput>/<cfoutput>#pdcast_colors#</cfoutput>/spacer.gif" width="1" height="1" border="0" alt="" /></td>
  </tr>

  <tr>
   <td colspan="2"><img name="pod_cast_<cfoutput>#pdcast_colors#</cfoutput>_r1_c1" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#podcasts/#site_assets_dir#page/#pdcast_colors#/pod_cast_#pdcast_colors#</cfoutput>_r1_c1.jpg" width="38" height="28" border="0" id="pod_cast_<cfoutput>#pdcast_colors#</cfoutput>_r1_c1" alt="" /></td>
   <td><img name="pod_cast_<cfoutput>#pdcast_colors#</cfoutput>_r1_c3" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#podcasts/#site_assets_dir#page/#pdcast_colors#/pod_cast_#pdcast_colors#</cfoutput>_r1_c3.jpg" width="13" height="28" border="0" id="pod_cast_<cfoutput>#pdcast_colors#</cfoutput>_r1_c3" alt="" /></td>
   <td align="center" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#podcasts/#site_assets_dir#page/#pdcast_colors#/pod_cast_#pdcast_colors#</cfoutput>_r1_c4.jpg" class="welcome_head">PodCast Selection Menu for:<cfoutput>#site_name#</cfoutput></td>
   <td><img name="pod_cast_<cfoutput>#pdcast_colors#</cfoutput>_r1_c5" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#podcasts/#site_assets_dir#page/#pdcast_colors#/pod_cast_#pdcast_colors#</cfoutput>_r1_c5.jpg" width="15" height="28" border="0" id="pod_cast_<cfoutput>#pdcast_colors#</cfoutput>_r1_c5" alt="" /></td>
   <td colspan="2"><img name="pod_cast_<cfoutput>#pdcast_colors#</cfoutput>_r1_c6" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#podcasts/#site_assets_dir#page/#pdcast_colors#/pod_cast_#pdcast_colors#</cfoutput>_r1_c6.jpg" width="36" height="28" border="0" id="pod_cast_<cfoutput>#pdcast_colors#</cfoutput>_r1_c6" alt="" /></td>
  </tr>
  <tr>
   <td height="40" colspan="7" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#podcasts/#site_assets_dir#page/#pdcast_colors#/pod_cast_#pdcast_colors#</cfoutput>_r2_c1.jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
     <tr>
       <td width="10%">&nbsp;</td>
       <td width="49%">Please Select a Topic:</td>
       <td width="41%"><select name="cat" onchange="MM_jumpMenu('parent',this,0)">
         <option value="http://#site_domain##site_folder#index.cfm?module=podcasts&cat=Home">Please Select a Topic</option>
         <cfoutput query="pod_cast_cats" group="pod_cast_category_name">
           <option value="http://#site_domain##site_folder#index.cfm?module=podcasts&cat=#pod_cast_catid#" <cfif #url.cat# EQ #pod_cast_catid#>selected="selected"</cfif>>#pod_cast_category_name#</option>
         </cfoutput>
       </select></td>
     </tr>


   </table></td>
  </tr>
  <tr>
   <td><img name="pod_cast_<cfoutput>#pdcast_colors#</cfoutput>_r3_c1" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#podcasts/#site_assets_dir#page/#pdcast_colors#/pod_cast_#pdcast_colors#</cfoutput>_r3_c1.jpg" width="29" height="43" border="0" id="pod_cast_<cfoutput>#pdcast_colors#</cfoutput>_r3_c1" alt="" /></td>
   <td colspan="5" align="center" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#podcasts/#site_assets_dir#page/#pdcast_colors#/pod_cast_#pdcast_colors#</cfoutput>_r3_c2.jpg" class="play_list_info">To View/Hide a Description and Estimated Download times Click on the Title of the track.</td>
   <td><img name="pod_cast_<cfoutput>#pdcast_colors#</cfoutput>_r3_c7" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#podcasts/#site_assets_dir#page/#pdcast_colors#/pod_cast_#pdcast_colors#</cfoutput>_r3_c7.jpg" width="29" height="43" border="0" id="pod_cast_<cfoutput>#pdcast_colors#</cfoutput>_r3_c7" alt="" /></td>
  </tr>
  <tr>
   <td width="29" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#podcasts/#site_assets_dir#page/#pdcast_colors#/pod_cast_#pdcast_colors#</cfoutput>_r4_c1.jpg">&nbsp;</td>
   <td colspan="5" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="border-right: 1px solid #8791A4;border-left: 1px solid #8791A4;border-bottom: 1px solid #8791A4;">
  <tr>
    <td height="23" align="center" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#podcasts/#site_assets_dir#page/#pdcast_colors#</cfoutput>/sort_head.jpg" class="play_list_head"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="play_list_head">
      <tr>
        <td width="68%" class="play_list_head">Title</td>
        <td width="32%" class="play_list_head">Play Time</td>
      </tr>
    </table></td>
    <td height="25" align="center" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#podcasts/#site_assets_dir#page/#pdcast_colors#</cfoutput>/sort_head.jpg" class="play_list_head">Action</td>
  </tr>
  <cfoutput query="pod_cast_list">
  <cfset PreviousRow = pod_cast_list.CurrentRow - 1>
  <cfset NextRow = pod_cast_list.CurrentRow + 1>
  <CFSET class="row#Int(pod_cast_list.CurrentRow MOD 2)#">
  <tr class = #class#>
    <td height="25" >
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="67%"><a href="javascript:collapse#Int(pod_cast_list.CurrentRow)#.slidedown();" onclick="collapse#Int(pod_cast_list.CurrentRow)#.slideup();collapse#Int(PreviousRow)#.slideup();collapse#Int(NextRow)#.slideup();" class="play_list_title">#pod_cast_title#:</a></td>
            <td width="33%" class="play_list_title">#pod_cast_playtime#</td>
          </tr>
          <tr>
            <td colspan="2"><div id="track_info_#Int(pod_cast_list.CurrentRow)#" style="width: auto; height: auto; background-color:##ffffff;" class="play_list_info">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td class="play_list_info #class#">#pod_cast_description#
                      <hr /> 
                      File Size: #pod_cast_filesize# (bytes)                    
</span></td>
                  </tr>
                </table>
            </div>
                <script type="text/javascript">
//Syntax: var uniquevar=new animatedcollapse("DIV_id", animatetime_milisec, enablepersist(true/fase))
var collapse#Int(pod_cast_list.CurrentRow)#=new animatedcollapse("track_info_#Int(pod_cast_list.CurrentRow)#", 1000, false)
          </script></td>
          </tr>
        </table>

    
   </a></strong></td>
    <td height="25" valign="middle" class="play_list_title">
    <cfif #pod_cast_filename# eq "">

    <cfelse>
    
    <table width="50" border="0" align="right" cellpadding="0" cellspacing="0">
        <tr>
          <td width="58%" align="right" valign="middle"><a href="http://#site_domain##sitE_folder##site_modules_dir#podcasts/files/#pod_cast_filename#"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#podcasts/#site_assets_dir#</cfoutput>page/default/download_me.jpg" width="25" height="25" border="0"/></a></td>
          <td width="42%" align="right" valign="middle"><a href="http://#site_domain##site_folder#index.cfm?module=podcasts&action=stream&file=#pod_cast_filename#"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#podcasts/#site_assets_dir#</cfoutput>page/default/stream_me.jpg" width="25" height="25" border="0"/></a></td>
        </tr>
      </table>
      </cfif>      </td>
  </tr>
  </cfoutput>
  
</table></td>
   <td background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#podcasts/#site_assets_dir#page/#pdcast_colors#/pod_cast_#pdcast_colors#</cfoutput>_r4_c7.jpg">&nbsp;</td>
  </tr>
  <tr>
   <td><img name="pod_cast_<cfoutput>#pdcast_colors#</cfoutput>_r5_c1" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#podcasts/#site_assets_dir#page/#pdcast_colors#/pod_cast_#pdcast_colors#</cfoutput>_r5_c1.jpg" width="29" height="31" border="0" id="pod_cast_<cfoutput>#pdcast_colors#</cfoutput>_r5_c1" alt="" /></td>
   <td height="31" colspan="5" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#podcasts/#site_assets_dir#page/#pdcast_colors#/pod_cast_#pdcast_colors#</cfoutput>_r5_c2.jpg">&nbsp;</td>
   <td><img name="pod_cast_<cfoutput>#pdcast_colors#</cfoutput>_r5_c7" src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#podcasts/#site_assets_dir#page/#pdcast_colors#/pod_cast_#pdcast_colors#</cfoutput>_r5_c7.jpg" width="29" height="31" border="0" id="pod_cast_<cfoutput>#pdcast_colors#</cfoutput>_r5_c7" alt="" /></td>
  </tr>
  <tr>
   <td height="24" colspan="7" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#podcasts/#site_assets_dir#page/#pdcast_colors#/pod_cast_#pdcast_colors#</cfoutput>_r6_c1.jpg">&nbsp;</td>
  </tr>
  <tr>
   <td colspan="7" align="center" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir#podcasts/#site_assets_dir#page/#pdcast_colors#/pod_cast_#pdcast_colors#</cfoutput>_r7_c1.jpg" class="footer">&copy; <cfoutput>#dateformat(now(), "YYYY")# #site_name#</cfoutput></td>
  </tr>
</table></cfif>
</td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle">
    </td>
  </tr>
</table>