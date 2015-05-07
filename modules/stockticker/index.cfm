<!---\\ Module Configuration //--->
<cfset module ="stockticker">
<!---\\ End of Module Configuration //---->
<style type="text/css">
#AutoScrollContentMain {position:absolute; width:160px; visibility:visible;} <!-- Do NOT rename this class --> 
</style>
<script type="text/javascript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function flvS3(v1){//v1.0
var v2=MM_findObj(v1),v3=0,v4=0,v5=0,v6=0;if (!v2){this.x=this.y=this.h=this.w=0;return;}var v7=(document.layers)?v2:v2.style;v3=v7.left;v4=v7.top;if ((v3==""||v4=="")&&document.all&&!window.opera){if (v3==""){v3=v2.offsetLeft;}if (v4==""){v4=v2.offsetTop;}}if (v2.offsetHeight){v5=v2.offsetHeight;v6=v2.offsetWidth;}else if (document.layers){v5=v7.clip.height;v6=v7.clip.width;}this.x=parseInt(v3);this.y=parseInt(v4);this.h=parseInt(v5);this.w=parseInt(v6);}

function flvS8(v1,v2,v3){//v1.0
var v4=(document.layers)?v1:v1.style;var v5=flvS5();eval("v4.left='"+v2+v5+"'");eval("v4.top='"+v3+v5+"'");}

function flvS5(){//v1.0
var v1=((parseInt(navigator.appVersion)>4||navigator.userAgent.indexOf("MSIE")>-1)&&(!window.opera))?"px":"";return v1;}

function flvXAS1(){
var v1=arguments,v2=v1.length,v3='AutoScrollContainer',v4='AutoScrollContentMain';var v5=MM_findObj(v3),v6=MM_findObj(v4);if (!v5){return;}if (v5.XAS1!=null){clearTimeout(v5.XAS1);}var v7=(v2>0)?parseInt(v1[0]):1;if (v7){var v8=(v2>1)?parseInt(v1[1]):1,v9=(v2>2)?parseInt(v1[2]):50,v10=(v2>3)?parseInt(v1[3]):1;var v11=new flvS3(v3),v12=new flvS3(v4);var v13=v12.x,v14=v12.y,v15=0,v16=0;if (v10==1){var v17=-1*v12.h;v15=v12.x;if (v14>=v17){v16=v12.y-v8;}else {v16=v11.h;}}else {var v18=-1*v12.w;v16=v12.y;if (v13>=v18){v15=v12.x-v8;}else {v15=v11.w;}}flvS8(v6,v15,v16);v5.XAS1=setTimeout("flvXAS1("+v7+","+v8+","+v9+","+v10+")",v9);}}
//-->
</script>
<body onLoad="flvXAS1(1,1,50,1)">
<cfif #db_type# EQ "mssql">
<cfquery name="getstock" datasource="#datasrc#">
<!---select * from stock_tickers where ticker_domain='dev.swidigital.com'--->
SELECT TOP 3 ticker_id, ticker_company, ticker_symbol
FROM #table_stocks# 
ORDER BY ticker_company ASC
</cfquery>
<cfelseif #db_type# EQ "mysql">
<cfquery name="getstock" datasource="#datasrc#">
<!---select * from stock_tickers where ticker_domain='dev.swidigital.com'--->
SELECT ticker_id, ticker_company, ticker_symbol
FROM #table_stocks# 
ORDER BY ticker_company ASC Limit 3
</cfquery>
</cfif>

<cfif css_template EQ "1">
<div id="menu_box_title">
Stock Quotes
</div>
<div id="menu_box">
 <!-- Start absolute positioned Cross-browser AutoScroller -->
<!-- Do NOT change these layer ID's -->
<div id="AutoScrollContainer" style="position:relative; width:160px; height:160px; clip:rect(0,160,160,0); overflow:hidden; visibility:visible;">
  <!-- Do NOT define (additional) styles for the following nested layer here. 
       If required, modify the inline styles in the head section -->
  <div id="AutoScrollContentMain">
    <table width='160' cellpadding='2' border='0' cellspacing='0'>
      <tr>
        <td>
        <cfoutput>
        <CFLOOP startRow = "1" query="getstock">

<cfset company = "#ticker_company#" />
<cfset symbol = "#ticker_symbol#" />
<cfset quoteWsUrl = "http://finance.yahoo.com/d/quotes.csv?s=#trim( symbol )#&f=l1c1v" />
<cfhttp url="#quoteWsUrl#" method="GET" resolveUrl="false" ></cfhttp>
<cfset stockInfo = #cfhttp.FileContent# />
<cfset stockprice = ListGetAt(stockInfo, 1)>
<cfset change = ListGetAt(stockInfo, 2)>
<cfset volume = #trim(ListGetAt(stockInfo, 3))#>

Company: <b>#company#</b><br>
Symbol: <b>#symbol#</b><br>
Price: <b>#stockprice#</b><br> 
Change: <b>#change#</b><cfif #left(change,1)# EQ "-"><img src='#site_template_dir##site_template#/#site_modules_dir#/stockticker/#site_assets_dir#redarrowsmall.gif' alt='Market Closed Down' width='11' height='11' border='0'/><cfelseif #left(change,1)# EQ "+"><img src='#site_template_dir##site_template#/#site_modules_dir#/stockticker/#site_assets_dir#greenarrowsmall.gif' alt='Market Closed Up' width='11' height='11' border='0'/></cfif><br>Volume: <b>#volume#</b><br><center><img src='http://www.marketwatch.com/charts/gifquotes/story-sm-ss.img?symb=#UCASE(trim(Symbol))#' alt='Stock Information' border='0'></center>
<hr />
</CFLOOP>
</cfoutput>         </td>
      </tr>
    </table>
  </div>
</div>
<!-- End absolute positioned Cross-browser AutoScroller -->
</div>
<br><br>
<br><br>
<br><br>
<br><br>
<br><br>
<br><br>
<cfelse>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" align="center" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="col_title" colspan="2">Stock Quotes:</td>
</tr>
  <tr>
    <td colspan="2" align="center"  valign="top">
    <!-- Start absolute positioned Cross-browser AutoScroller -->
<!-- Do NOT change these layer ID's -->
<div id="AutoScrollContainer" style="position:relative; width:160px; height:160px; clip:rect(0,160,160,0); overflow:hidden; visibility:visible;">
  <!-- Do NOT define (additional) styles for the following nested layer here. 
       If required, modify the inline styles in the head section -->
  <div id="AutoScrollContentMain">
    <table width='160' cellpadding='2' border='0' cellspacing='0'>
      <tr>
        <td>
        <cfoutput>
        <CFLOOP startRow = "1" query="getstock">

<cfset company = "#ticker_company#" />
<cfset symbol = "#ticker_symbol#" />
<cfset quoteWsUrl = "http://finance.yahoo.com/d/quotes.csv?s=#trim( symbol )#&f=l1c1v" />
<cfhttp url="#quoteWsUrl#" method="GET" resolveUrl="false" ></cfhttp>
<cfset stockInfo = #cfhttp.FileContent# />
<cfset stockprice = ListGetAt(stockInfo, 1)>
<cfset change = ListGetAt(stockInfo, 2)>
<cfset volume = #trim(ListGetAt(stockInfo, 3))#>

Company: <b>#company#</b><br>
Symbol: <b>#symbol#</b><br>
Price: <b>#stockprice#</b><br> 
Change: <b>#change#</b><cfif #left(change,1)# EQ "-"><img src='#site_template_dir##site_template#/#site_modules_dir#/stockticker/#site_assets_dir#redarrowsmall.gif' alt='Market Closed Down' width='11' height='11' border='0'/><cfelseif #left(change,1)# EQ "+"><img src='#site_template_dir##site_template#/#site_modules_dir#/stockticker/#site_assets_dir#greenarrowsmall.gif' alt='Market Closed Up' width='11' height='11' border='0'/></cfif><br>Volume: <b>#volume#</b><br><center><img src='http://www.marketwatch.com/charts/gifquotes/story-sm-ss.img?symb=#UCASE(trim(Symbol))#' alt='Stock Information' border='0'></center>
<hr />
</CFLOOP>
</cfoutput>         </td>
      </tr>
    </table>
  </div>
</div>
<!-- End absolute positioned Cross-browser AutoScroller -->    </td>
  </tr>

</table>
</cfif>
