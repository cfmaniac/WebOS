<!---
	Name         : incCalendar.cfm
	Author       : James Harvey
	Created      : August 03, 2007
	Last Updated : August 03, 2007
	History      : Version 1.0
--->
<cfparam name="CurntDate" default="#now()#">
<CFPARAM name="id" default="0">
<cfif isdefined("MonthChange")>
  <cfif monthchange is 'forward'>
    <cfset curntdate = createodbcdate(dateadd("m", 1, lastdate))>
    <cfelse>
    <cfset curntdate = createodbcdate(dateadd("m", -1, lastdate))>
  </cfif>
</cfif>
<cfparam name="YearSet" default="#year(CurntDate)#">
<cfparam name="MonthSet" default="#month(CurntDate)#">
<cfset monthstart = createdatetime(#yearset#, #monthset#, 1, 0, 0, 0)>
<cfset monthend = createdatetime(#yearset#, #monthset#, #daysinmonth(monthstart)#, 23, 59, 59)>

<CFINVOKE COMPONENT="blog" METHOD="Get_Cal" RETURNVARIABLE="get_cals" monthstart="#monthstart#" monthend="#monthend#">
<cfset x = ValueList(get_cals.dd)>
<cfset offset = #dayofweek(monthstart)#>
<cfset lastslot = #offset# + #daysinmonth(monthstart)#-1>
<cfset caldays = (#ceiling(lastslot/7)#)*7>
<cfset day = 1>
 <table width="180" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">WebOS Blog Calendar</td>
  </tr>
  <tr>
    <td><table class="calendar" align="center" cellpadding="5" cellspaccing="2">
  <tr align="center"> <cfoutput>
      <td><a href="<cfoutput>#application.siteAddress#</cfoutput>index.cfm?<cfif calMonth NEQ 0>calMonth=#calMonth#&calDay=#calDay#&calYear=#calYear#&</cfif>MonthChange=Backward&LastDate=#DateFormat(CurntDate, 'mm/01/yyyy')#&Action=ShowCalendar">&lt;</a> </td>
      <td colspan="5" class="blue"><CENTER>
          <b>#DateFormat(CurntDate,'mmm yyyy')#</b>
        </CENTER></td>
      <td><a href="<cfoutput>#application.siteAddress#</cfoutput>index.cfm?<cfif calMonth NEQ 0>calMonth=#calMonth#&calDay=#calDay#&calYear=#calYear#&</cfif>MonthChange=Forward&LastDate=#DateFormat(CurntDate, 'mm/dd/yyyy')#&Action=ShowCalendar">&gt;</a> </td>
    </cfoutput> </tr>
  <tr>
    <td>S</td>
    <td>M</td>
    <td>T</td>
    <td>W</td>
    <td>T</td>
    <td>F</td>
    <td>S</td>
  </tr>
  <tr>
  <cfloop index="ii" from ="1" to="#CalDays#">
    <cfif #ii# gte #offset# and #ii# lte #lastslot# >
      <td <cfif listFind(x,Day)> class="highlight"</cfif>><CFOUTPUT>
          <cfif day is #datepart("d", now())# and #month(curntdate)# is #month(now())#>
            <b><span id="blue">#Day#</span></b>
            <cfelse>
            <cfif listFind(x,Day)>
              <a href="<cfoutput>#application.siteAddress#</cfoutput>index.cfm/calMonth/#MonthSet#/calDay/#Day#/calYear/#YearSet#">#Day#</a>
              <cfelse>
              #Day#
            </cfif>
          </cfif>
        </cfoutput></td>
      <cfset day = #day# + 1>
      <cfelse>
      <td>&nbsp;</td>
    </cfif>
    <cfif (#ii# mod 7 is 0)>
      </tr>
      
    </cfif>
  </cfloop>
</table>
 </td>
  </tr>
  <tr>
    <td height="10" align="right" valign="middle"></td>
  </tr>
</table>     