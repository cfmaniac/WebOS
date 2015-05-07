<!---\\ Spotlights Configuration //--->
<cfset module = "spotlights">
<cfset spots_view="4">
<cfset showplay = "yes">
<cfset spots_height="208px">
<cfset spots_width="450px">
<cfset slide_height="208px">
<cfset slide_width="450px">
<!---\\ End of Module Configuration //--->
<style>
#slideshow {
	position: relative;
	float: left;
	width: <cfoutput>#slide_width#</cfoutput>;
	height:<cfoutput>#spots_height#</cfoutput>;
	overflow:hidden;
	background: url(http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#</cfoutput>/images/spot_light_lg.jpg) no-repeat 0px 0px;
	padding: 0px 0px 0px 0px;
	border-left: 1px solid #708892;
	border-right: 1px solid #708892;
	border-bottom: 1px solid #708892;
}
#slideshow .slide {
	position:absolute; 
	width: <cfoutput>#slide_width#</cfoutput>;
	height:<cfoutput>#slide_height#</cfoutput>; 
	opacity:0.99; /* Fix Firefox opacity flicker problem */
	
}
/*#slideshow #slide1 {
	z-index: 1;
}*/
#slideshow .slidelinks_container {
	position:absolute;
	width:390px;
	height:291px;
	opacity:0.99; /* Fix Firefox opacity flicker problem */
	z-index: 2;
}
#slideshow .slideshowcontrols { 
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
	color: #000000; 
	height: 35px;
	text-align: center; 
	float: center;
	display: block;
	width: 75px !important;
	font-weight: bold !important;
	text-decoration: none;
	line-height:12px;
	font-size: 10px; 
	background: url(http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#</cfoutput>/images/tabs.jpg) no-repeat 0px 0px;
	padding: 0px 0px 0px 3px !important;
	border-top: 1px solid #708892;
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
	background: url(http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_modules_dir##module#</cfoutput>/images/tabs_over.jpg) no-repeat 0px 0px;
	color: #ffffff;
	text-decoration: none;
	border-top: 1px solid #ffffff;
}
/* Used to make everything fade */
#slideshow .opacity10 { opacity:0.99; filter:alpha(opacity=100); visibility:visible !important;}
#slideshow .opacity9 { opacity:.9; filter:alpha(opacity=90); visibility:visible !important;}
#slideshow .opacity8 { opacity:.8; filter:alpha(opacity=80); visibility:visible !important;}
#slideshow .opacity7 { opacity:.7; filter:alpha(opacity=70); visibility:visible !important;}
#slideshow .opacity6 { opacity:.6; filter:alpha(opacity=60); visibility:visible !important;}
#slideshow .opacity5 { opacity:.5; filter:alpha(opacity=50); visibility:visible !important;}
#slideshow .opacity4 { opacity:.4; filter:alpha(opacity=40); visibility:visible !important;}
#slideshow .opacity3 { opacity:.3; filter:alpha(opacity=30); visibility:visible !important;}
#slideshow .opacity2 { opacity:.2; filter:alpha(opacity=20); visibility:visible !important;}
#slideshow .opacity1 { opacity:.1; filter:alpha(opacity=10); visibility:visible !important;}

#slideshow .hide { 
	visibility:hidden; 
}
#slideshow .hideArchive {
	visibility:hidden; 
	display:none;
}
#slideshow .show { 
	visibility:visible !important;
	display:block !important;
	 
}
</style>


<table width="#spots_width#" border="0" cellspacing="0" cellpadding="0" style="border:1px solid ##b0181e;" align="center">
  <tr>
    <td align="center" valign="top">
    <table style="width: #slide_width#; border: 1px solid ##b0181e;" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top">
    <!---The Spotlights--->
<div id="slideshow">
<CFLOOP startRow = "1" endRow = "#spots_view#" query="getspots">
<cfoutput >
  <div class="slide hide" id="slide#getspots.CurrentRow#">
  <table width="#spots_width#" border="0" cellspacing="0" cellpadding="0">
  <cfif css_template EQ "1">
  <div id="center_box_title" style="width:auto; text-align:left;">
#spotlight_title#&nbsp;&nbsp;&nbsp;#dateformat(now(),"mmmm, yyyy")#
</div>
  <cfelse>
  <tr>
    <td height="25" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">&nbsp;#spotlight_title#&nbsp;&nbsp;&nbsp;#dateformat(now(),"mmmm, yyyy")#</td>
   <!--- <td width="100" height="25"  valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">#dateformat(now(),"mmmm, yyyy")#</td>--->
  </tr>
</cfif>
  <tr>
    <td class="spotlight_info" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="40">&nbsp;</td>
    <td valign="top">#spotlight_description#</td>
    <td width="40">&nbsp;</td>
  </tr>
</table>
</td>
  </tr>
  </table>
  </div>
</cfoutput> 
</CFLOOP>
</div>
<!---Yes, Despite the fact that the(se) DIV's aren't visible, they are neccessary in order to parse and load the above slides for the spotlights--->
<CFLOOP startRow = "1" endRow = "#spots_view#" query="getspots">
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
    <CFLOOP startRow = "1" endRow = "#spots_view#" query="getspots">
<cfoutput>
      <li id="tab-#getspots.CurrentRow#">
        <a id="slidelink#getspots.CurrentRow#" href="##" onclick="ss.gotoSlide(#getspots.CurrentRow#);this.blur();return false;">       Spotlight #getspots.CurrentRow#</a>      </li>
</cfoutput> 
</CFLOOP>          
        <cfif isDefined("showplay") and showplay eq "Yes">
        <li >
        <a id="slidepause" href="##" onclick="ss.playToggle();return false;">Play</a>
        </li>
        <cfelseif showplay eq "No">
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
<script language="javascript" type="text/javascript" src="<cfoutput>http://#site_domain##site_folder##site_modules_dir##module#</cfoutput>/slideshow.js">
</script>
    
    </td>
  </tr>
</table>