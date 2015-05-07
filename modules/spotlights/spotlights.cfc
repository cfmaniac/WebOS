<cfcomponent>

<CFAPPLICATION NAME="Cookies" SessionManagement="No" setDomainCookies="Yes">
<cffunction name="getspots" access="public" hint="This Function Retrieves information to Load and display the spotlights" output="yes" returntype="any">
  <cfargument name="spots_width" type="string" required="yes">
  <cfargument name="spots_height" type="string" required="yes">
  <cfargument name="spots_view" type="string" required="yes">
  <!--Spots View (above) Variable tells our Query how Many Spotlights To Retrive--->
  <cfargument name="showplay" type="string" required="yes">
  <!--Showplay tell the script to either show or not to show the play/pause tab--->
  <cfargument name="slide_width" type="string" required="yes">
  <cfargument name="datasrc" type="string" required="yes">
  <cfargument name="modules_dir" type="string" required="yes">
  <cfargument name="site_template_dir" type="string" required="yes">
  <cfargument name="site_template" type="string" required="yes">
  <cfargument name="site_domain" type="string" required="yes">
  <cfargument name="site_folder" type="string" required="yes">
  
               
<cfquery name="getspots" datasource="#datasrc#">
SELECT TOP #arguments.spots_view# spotlight_id, spotlight_title, spotlight_description 
FROM #table_spots# 

<!--- When running this live change: spotlights.spotlight_domain = '#arguments.spots_domain#'--->
ORDER BY NEWID()    
</cfquery>
<style>
##slideshow {
	position: relative;
	float: left;
	width: 390px;
	height:208px;
	overflow:hidden;
	background: url(http://#arguments.site_domain##arguments.site_folder##arguments.site_template_dir##arguments.site_template#/#arguments.site_modules_dir#spotlights/images/spot_light_lg.jpg) no-repeat 0px 0px;
	padding: 0px 0px 0px 0px;
}
##slideshow .slide {
	position:absolute; 
	width: 390px;
	height:208px; 
	opacity:0.99; /* Fix Firefox opacity flicker problem */
}
/*##slideshow ##slide1 {
	z-index: 1;
}*/
##slideshow .slidelinks_container {
	position:absolute;
	width:390px;
	height:291px;
	opacity:0.99; /* Fix Firefox opacity flicker problem */
	z-index: 2;
}
##slideshow .slideshowcontrols { 
	/*position: absolute;*/
	/*top:234px;*/
    float: center;
	/*padding:0px 0px 0px 0px;*/
	width:auto; 
	height: 35px;
}
/* 4 Slides with text */
ul.slideshowcontrolsmiddle{
	height: 35px !important;
	float: left;
	/*z-index: 10;*/
	position: static;
	text-align:center;
	width: auto !important;
	margin: 0px;
	padding:0px;
	list-style: none;
	line-height: normal;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 80%;
	/*text-transform: uppercase;*/
}
ul.slideshowcontrolsmiddle li{
	height: 35px;
	width: 75px !important;
	float: left;
	margin: 0px 2px 0px 0px;
}
/* The a elements inside those 4 tabs */
ul.slideshowcontrolsmiddle a:link, ul.slideshowcontrolsmiddle a:visited {
	color: ##000000; 
	height: 35px;
	text-align: center; 
	float: center;
	display: block;
	width: 75px !important;
	font-weight: bold !important;
	text-decoration: none;
	line-height:12px;
	font-size: 10px; 
	background: url(http://#arguments.site_domain##arguments.site_folder##arguments.site_template_dir##arguments.site_template#/#arguments.site_modules_dir#spotlights/images/tabs.jpg) no-repeat 0px 0px;
	padding: 0px 0px 0px 3px !important;
	border-top: 1px solid ##708892;
}
/* The next 5 styles fix Netscape issues with padding it any other way */
ul.slideshowcontrolsmiddle .single-line a {
	line-height: 35px!important;
}
*html ul.slideshowcontrolsmiddle .single-line a {
	line-height: 35px!important;
}
ul.slideshowcontrolsmiddle .padded_fmt {
         display:block;
         padding:0px 0px 0px 0px;
}
ul.slideshowcontrolsmiddle .single-line .padded_fmt {
         display:block;
         padding:0px 0px 0px 0px;
}
ul.slideshowcontrolsmiddle a.activeslide, ul.slideshowcontrolsmiddle a:hover {
	/*background-position: 0px -33px !important;*/
	background: url(http://#arguments.site_domain##arguments.site_folder##arguments.site_template_dir##arguments.site_template#/#arguments.site_modules_dir#spotlights/images/tabs_over.jpg) no-repeat 0px 0px;
	color: ##ffffff;
	text-decoration: none;
	border-top: 1px solid ##ffffff;
}
/* Used to make everything fade */
##slideshow .opacity10 { opacity:0.99; filter:alpha(opacity=100); visibility:visible !important;}
##slideshow .opacity9 { opacity:.9; filter:alpha(opacity=90); visibility:visible !important;}
##slideshow .opacity8 { opacity:.8; filter:alpha(opacity=80); visibility:visible !important;}
##slideshow .opacity7 { opacity:.7; filter:alpha(opacity=70); visibility:visible !important;}
##slideshow .opacity6 { opacity:.6; filter:alpha(opacity=60); visibility:visible !important;}
##slideshow .opacity5 { opacity:.5; filter:alpha(opacity=50); visibility:visible !important;}
##slideshow .opacity4 { opacity:.4; filter:alpha(opacity=40); visibility:visible !important;}
##slideshow .opacity3 { opacity:.3; filter:alpha(opacity=30); visibility:visible !important;}
##slideshow .opacity2 { opacity:.2; filter:alpha(opacity=20); visibility:visible !important;}
##slideshow .opacity1 { opacity:.1; filter:alpha(opacity=10); visibility:visible !important;}

##slideshow .hide { 
	visibility:hidden; 
}
##slideshow .hideArchive {
	visibility:hidden; 
	display:none;
}
##slideshow .show { 
	visibility:visible !important;
	display:block !important; 
}
</style>
<table style="width: #arguments.slide_width#;" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top">
    <!---The Spotlights--->
<div id="slideshow">
<CFLOOP startRow = "1" endRow = "#arguments.spots_view#" query="getspots">
<cfoutput >
  <div class="slide hide" id="slide#getspots.CurrentRow#">
  <table width="#arguments.spots_width#" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td class="spotlight_header">&nbsp;#spotlight_title#</td>
    <td class="spotlight_header" width="100">#dateformat(now(),"mmmm, yyyy")#</td>
  </tr>

  <tr>
    <td class="spotlight_info">#spotlight_description#</td>
  </tr>
  </table>
  </div>
</cfoutput> 
</CFLOOP>
</div>
<!---Yes, Despite the fact that the(se) DIV's aren't visible, they are neccessary in order to parse and load the above slides for the spotlights--->
<CFLOOP startRow = "1" endRow = "#arguments.spots_view#" query="getspots">
<cfoutput >
<div class="slidelinks_container hide" id="slidelinks_container#getspots.CurrentRow#">
    <a href="##" onclick="s_objectID='prm-hp_#getspots.CurrentRow#_img';return sl(this,'regular', 'prm-hp_#getspots.CurrentRow#_img');" title="Not Really used, But Neccessary"></a>  </div>
    </cfoutput> 
</CFLOOP>
      </td>
  </tr>
    <tr>
    <td align="center" valign="top">
    <!---The Spotlight Links Row: Now Dynamically generated for each Spotlight--->
    <ul class="slideshowcontrolsmiddle">
    <CFLOOP startRow = "1" endRow = "#arguments.spots_view#" query="getspots">
<cfoutput>
      <li id="tab-#getspots.CurrentRow#">
        <a id="slidelink#getspots.CurrentRow#" href="##" onclick="ss.gotoSlide(#getspots.CurrentRow#);this.blur();return false;">       Spotlight #getspots.CurrentRow#</a>      </li>
</cfoutput> 
</CFLOOP>          
        <cfif isDefined("arguments.showplay") and arguments.showplay eq "Yes">
        <li >
        <a id="slidepause" href="##" onclick="ss.playToggle();return false;">Play</a>
        </li>
        <cfelseif arguments.showplay eq "No">
        </cfif> 
      </ul>
    </td>
  </tr>
</table>
<script type="text/javascript">
				/* Duration to display each slide (milliseconds) 7 seconds default */
				var slideduration = [7000,7000,7000,7000,] ;
				
				var slide_images = ["","","",""];
		</script>
<script language="javascript" type="text/javascript" src="<cfoutput>#arguments.modules_dir#</cfoutput>spotlights/slideshow.js">
</script>

</cffunction>
</cfcomponent>