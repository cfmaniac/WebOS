<cf_headfoot>
<cfparam name="attributes.script" default="Login FrameWork">
<cfparam name="attributes.page" default="BMI Profile Administration Page">
<!---\\ Module Functions (add, edit, update, delete) Go here //--->
<CFPARAM name="row_color" default="1">
<cfif NOT isDefined('url.do')>
<CFPARAM name="do" default="m">
<cfelseif isDefined('url.do')>
<CFPARAM name="do" default="#url.do#">
</cfif>
<CFPARAM name="Delete" default="no">
<CFPARAM name="Update" default="none">
<CFPARAM name="Add" default="none">
<CFPARAM name="message" default="none">
<CFPARAM name="inPage" default="0">
<!---\\ End of Module Functions //--->
<!--- See if user has access level rights to this page --->
<style type="text/css">
<!--
.style1 {font-weight: bold}
.style2 {font-weight: bold}
-->
</style><cfif ListFindNoCase("#allusers#", session.permissions, ",")>
<style type="text/css">
<!--
.style1 {
	font-size: 11px;
	font-weight: bold;
}
-->
</style>
<!--- BEGINNING OF YOUR CONTENT --->
<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1"><cfoutput>#attributes.page#</cfoutput></span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr><td><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100" valign="top"><img src="assets/modules/modules_bmi.jpg" alt="WebOS Site Configuration" width="100" height="100" /></td>
    <td valign="top"><cfif do EQ "m">
    <!---\\ Intro Text //--->
    Welcome <b><cfoutput>#session.user#</cfoutput></b>, to the WebOS <b><cfoutput>#attributes.page#</cfoutput></b> Page. Here you can view your member's progress logs, personal goals and quiz answers.
   
    <hr width="95%" align="center"/>
    <cfquery name="get_users" datasource="#datasrc#">
    select * from #table_usrs#
    </cfquery>
    
    <table width="100%"  border="0" cellspacing="1" cellpadding="5">
  <tr align="center" bgcolor="#9CB6DE">
    <td width="78" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>UserName</strong></font></span></td>
    <td width="507" bgcolor="#E2E6E7"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Results of User's Profile</strong></font></strong></td>
    </tr>
    <CFLOOP QUERY="get_users" StartRow="1" EndRow="#get_users.recordcount#">
    <CFOUTPUT>
      <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
        <td width="78" align="center" valign="top"><b>#username#</b><br><i>(#firstname# #lastname#)</i><br /> Age: #age#<br />          </td>
        <td align="center" valign="top">
        <div name="user_results" style="height:75px; width:auto; overflow:auto;">
          <cfquery name="quizz_results" datasource="#datasrc#">
              select * from webos_bmi_quiz where user_name = '#get_users.username#' order by timestamp ASC
              </cfquery>
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td bgcolor="##E2E6E7"><strong>User's Quiz Results</strong> (#quizz_results.recordcount# Records)</td>
            </tr>
            <tr>
              <td>
              <div name="quiz_results" style="width:auto; height:50px; overflow:auto;">
              
              <cfoutput>
              <cfloop query="quizz_results">
              (Record #quizz_results.currentRow# of #quizz_results.recordcount#) Results of Quiz Submitted on: <i>#dateformat(timeStamp,"MM/DD/YYYY")#</i>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="48%">Q1:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q1#</td>
  </tr>
   <tr>
    <td width="48%">Q2:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q2#</td>
  </tr>
    <tr>
    <td width="48%">Q3:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q3#</td>
  </tr>
    <tr>
    <td width="48%">Q4:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q4#</td>
  </tr>
    <tr>
    <td width="48%">Q5:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q5#</td>
  </tr>
    <tr>
    <td width="48%">Q6:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q6#</td>
  </tr>
    <tr>
    <td width="48%">Q7:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q7#</td>
  </tr>
    <tr>
    <td width="48%">Q8:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q8#</td>
  </tr>
    <tr>
    <td width="48%">Q9:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q9#</td>
  </tr>
    <tr>
    <td width="48%">Q10:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q10#</td>
  </tr>
   <tr>
    <td width="48%">Q11:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q11#</td>
  </tr>
   <tr>
    <td width="48%">Q12:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q12#</td>
  </tr>
    <tr>
    <td width="48%">Q13:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q13#</td>
  </tr>
    <tr>
    <td width="48%">Q14:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q14#</td>
  </tr>
    <tr>
    <td width="48%">Q15:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q15#</td>
  </tr>
    <tr>
    <td width="48%">Q16:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q16#</td>
  </tr>
    <tr>
    <td width="48%">Q17:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q17#</td>
  </tr>
    <tr>
    <td width="48%">Q18:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q18#</td>
  </tr>
    <tr>
    <td width="48%">Q19:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q19#</td>
  </tr>
    <tr>
    <td width="48%">Q20:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q20#</td>
  </tr>
  <tr>
    <td width="48%">Q21:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q21#</td>
  </tr>
   <tr>
    <td width="48%">Q22:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q22#</td>
  </tr>
    <tr>
    <td width="48%">Q23:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q23#</td>
  </tr>
    <tr>
    <td width="48%">Q24:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q24#</td>
  </tr>
    <tr>
    <td width="48%">Q25:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q25#</td>
  </tr>
    <tr>
    <td width="48%">Q26:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q26#</td>
  </tr>
    <tr>
    <td width="48%">Q27:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q27#</td>
  </tr>
    <tr>
    <td width="48%">Q28:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q28#</td>
  </tr>
    <tr>
    <td width="48%">Q29:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q29#</td>
  </tr>
    <tr>
    <td width="48%">Q30:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q30#</td>
  </tr>
  <tr>
    <td width="48%">Q31:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q31#</td>
  </tr>
   <tr>
    <td width="48%">Q32:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q32#</td>
  </tr>
    <tr>
    <td width="48%">Q33:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q33#</td>
  </tr>
    <tr>
    <td width="48%">Q34:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q34#</td>
  </tr>
    <tr>
    <td width="48%">Q35:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q35#</td>
  </tr>
    <tr>
    <td width="48%">Q36:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q36#</td>
  </tr>
    <tr>
    <td width="48%">Q37:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q37#</td>
  </tr>
    <tr>
    <td width="48%">Q38:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q38#</td>
  </tr>
    <tr>
    <td width="48%">Q39:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q39#</td>
  </tr>
    <tr>
    <td width="48%">Q40:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q40#</td>
  </tr>
  <tr>
    <td width="48%">Q41:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q41#</td>
  </tr>
   <tr>
    <td width="48%">Q42:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q42#</td>
  </tr>
    <tr>
    <td width="48%">Q43:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q43#</td>
  </tr>
    <tr>
    <td width="48%">Q44:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q44#</td>
  </tr>
    <tr>
    <td width="48%">Q45:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#q45#</td>
  </tr>
  <tr>
    <td colspan="3">End of Record #quizz_results.currentRow# of #quizz_results.recordcount#</td>
      </tr>
</table>
<hr />
              </cfloop>
              </cfoutput>              </div>              </td>
            </tr>
          </table>
          <br />
           <cfquery name="goalss_results" datasource="#datasrc#">
              select * from webos_bmi_log_book where username = '#get_users.username#' order by timestamp ASC
              </cfquery>
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td bgcolor="##E2E6E7"><strong>Personal Goals Results</strong> (#goalss_results.recordcount# Records)</td>
            </tr>
            <tr>
              <td><div name="goals_results" style="width:auto; height:50px; overflow:auto;">
             
              <cfoutput>
              <cfloop query="goalss_results">
                (Record #goalss_results.currentRow# of #goalss_results.recordcount#) Results of Personal Goals submitted on <i>#dateformat(timestamp, "MM/DD/YYYY")#</i>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="48%">Arule:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#arule#</td>
  </tr>
   <tr>
    <td width="48%">Brule:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#brule#</td>
  </tr>
   <tr>
    <td width="48%">Crule:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#crule#</td>
  </tr>
     <tr>
    <td width="48%">Drule:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#drule#</td>
  </tr>
     <tr>
    <td width="48%">Erule:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#erule#</td>
  </tr>
     <tr>
    <td width="48%">Frule:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#frule#</td>
  </tr>
     <tr>
    <td width="48%">Grule:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#grule#</td>
  </tr>
     <tr>
    <td width="48%">Hrule:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#hrule#</td>
  </tr>
     <tr>
    <td width="48%">Irule:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#irule#</td>
  </tr>
     <tr>
    <td width="48%">Jrule:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#jrule#</td>
  </tr>
     <tr>
    <td width="48%">Krule:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#Krule#</td>
  </tr>
     <tr>
    <td width="48%">Lrule:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#lrule#</td>
  </tr>
     <tr>
    <td width="48%">Mrule:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#Mrule#</td>
  </tr>
     <tr>
    <td width="48%">Nrule:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#Nrule#</td>
  </tr>
     <tr>
    <td width="48%">Orule:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#Orule#</td>
  </tr>
     <tr>
    <td width="48%">Qrule:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#qrule#</td>
  </tr>
     <tr>
    <td width="48%">Rrule:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#rrule#</td>
  </tr>
     <tr>
    <td width="48%">Srule:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#Srule#</td>
  </tr>
     <tr>
    <td width="48%">Trule:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#trule#</td>
  </tr>
     <tr>
    <td width="48%">Urule:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#Urule#</td>
  </tr>
     <tr>
    <td width="48%">Vrule:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#Vrule#</td>
  </tr>
     <tr>
    <td width="48%">Wrule:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#Wrule#</td>
  </tr>
     <tr>
    <td width="48%">Xrule:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#Xrule#</td>
  </tr>
     <tr>
    <td width="48%">Yrule:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#Yrule#</td>
  </tr>
     <tr>
    <td width="48%">Y1rule:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#y1rule#</td>
  </tr>
     <tr>
    <td width="48%">Zrule:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#zrule#</td>
  </tr>
  <tr>
    <td colspan="3">End of Record #goalss_results.currentRow# of #goalss_results.recordcount#</td>
      </tr>
</table>

              <hr />
              </cfloop>
              </cfoutput>
              </div></td>
            </tr>
          </table>
          <br />
          <cfquery name="plog_results" datasource="#datasrc#">
              select * from webos_bmi_progress_log where username = '#get_users.username#' order by last_updated ASC
              </cfquery>
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td bgcolor="##E2E6E7"><strong>Progress Log Results</strong> (#plog_results.recordcount# Records)</td>
            </tr>
            <tr>
              <td><div name="log_results" style="width:auto; height:50px; overflow:auto;">
              
              <cfoutput>
              <cfloop query="plog_results">
               (Record #plog_results.currentRow# of #plog_results.recordcount#) Results of Progress Log submitted on <i>#dateformat(last_updated, "MM/DD/YYYY")#</i>
               <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="48%">AACriterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#AAcriterion#</td>
  </tr>
    <tr>
    <td width="48%">BBCriterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#BBcriterion#</td>
  </tr>
    <tr>
    <td width="48%">CCCriterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#CCcriterion#</td>
  </tr>
    <tr>
    <td width="48%">CC2Criterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#CC2criterion#</td>
  </tr>
    <tr>
    <td width="48%">CC3Criterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#CC3criterion#</td>
  </tr>
    <tr>
    <td width="48%">CC4Criterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#CC4criterion#</td>
  </tr>
      <tr>
    <td width="48%">DDCriterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#DDcriterion#</td>
  </tr>
      <tr>
    <td width="48%">EECriterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#EEcriterion#</td>
  </tr>
      <tr>
    <td width="48%">EE2Criterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#EE2criterion#</td>
  </tr>
      <tr>
    <td width="48%">FFCriterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#FFcriterion#</td>
  </tr>
      <tr>
    <td width="48%">FF2Criterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#FF2criterion#</td>
  </tr>
      <tr>
    <td width="48%">FF3Criterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#FF3criterion#</td>
  </tr>
      <tr>
    <td width="48%">GGCriterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#GGcriterion#</td>
  </tr>
      <tr>
    <td width="48%">GG2Criterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#GG2criterion#</td>
  </tr>
      <tr>
    <td width="48%">GG3Criterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#GG3criterion#</td>
  </tr>
      <tr>
    <td width="48%">GG4Criterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#GG4criterion#</td>
  </tr>
      <tr>
    <td width="48%">HHCriterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#HHcriterion#</td>
  </tr>
      <tr>
    <td width="48%">HH2Criterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#HH2criterion#</td>
  </tr>
      <tr>
    <td width="48%">IICriterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#IIcriterion#</td>
  </tr>
      <tr>
    <td width="48%">II2Criterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#II2criterion#</td>
  </tr>
      <tr>
    <td width="48%">JJCriterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#JJcriterion#</td>
  </tr>
      <tr>
    <td width="48%">JJ2Criterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#JJ2criterion#</td>
  </tr>
      <tr>
    <td width="48%">KKCriterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#KKcriterion#</td>
  </tr>
      <tr>
    <td width="48%">LLCriterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#LLcriterion#</td>
  </tr>
      <tr>
    <td width="48%">LL2Criterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#LL2criterion#</td>
  </tr>
      <tr>
    <td width="48%">MMCriterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#MMcriterion#</td>
  </tr>
      <tr>
    <td width="48%">MM2Criterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#MM2criterion#</td>
  </tr>
      <tr>
    <td width="48%">NNCriterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#NNcriterion#</td>
  </tr>
      <tr>
    <td width="48%">NN2Criterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#NN2criterion#</td>
  </tr>
      <tr>
    <td width="48%">OOCriterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#OOcriterion#</td>
  </tr>
      <tr>
    <td width="48%">QQCriterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#QQcriterion#</td>
  </tr>
      <tr>
    <td width="48%">RRCriterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#RRcriterion#</td>
  </tr>
      <tr>
    <td width="48%">RR2Criterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#RR2criterion#</td>
  </tr>
      <tr>
    <td width="48%">SSCriterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#SScriterion#</td>
  </tr>
      <tr>
    <td width="48%">SS2Criterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#SS2criterion#</td>
  </tr>
        <tr>
    <td width="48%">TTCriterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#TTcriterion#</td>
  </tr>
        <tr>
    <td width="48%">UUCriterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#UUcriterion#</td>
  </tr>
        <tr>
    <td width="48%">VVCriterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#VVcriterion#</td>
  </tr>
        <tr>
    <td width="48%">VV2Criterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#VV2criterion#</td>
  </tr>
        <tr>
    <td width="48%">VV3Criterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#VV3criterion#</td>
  </tr>
        <tr>
    <td width="48%">WWCriterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#WWcriterion#</td>
  </tr>
        <tr>
    <td width="48%">YYCriterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#YYcriterion#</td>
  </tr>
        <tr>
    <td width="48%">YY2Criterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#YY2criterion#</td>
  </tr>
        <tr>
    <td width="48%">YY3Criterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#YY3criterion#</td>
  </tr>
        <tr>
    <td width="48%">ZZCriterion:</td>
    <td width="2%">&nbsp;</td>
    <td width="48%">#ZZcriterion#</td>
  </tr>
        <tr>
    <td colspan="3">End of Record #plog_results.currentRow# of #plog_results.recordcount#</td>
      </tr>
</table>
              <hr />
              </cfloop>
              </cfoutput>
              </div></td>
            </tr>
          </table>
          </div>
          </td>
        </tr>
      <CFIF row_color EQ 1>
        <CFSET row_color = 0>
        <CFELSE>
        <CFSET row_color = 1>
      </CFIF>
    </CFOUTPUT>
  </CFLOOP>
</table>

    <cfelseif do EQ "a">
    
    <cfelseif do EQ "e">
    
    <cfelseif do EQ "d">
    
    <cfelseif do EQ "view_quiz">
    
    <cfelseif do EQ "view_goals">
    
    <cfelseif do EQ "view_progress">
    
    </cfif>    </td>
    </tr>
</table></td>
</tr>
</table></td>
   <td width="11" background="assets/main_box/admin_r2_c3.jpg">&nbsp;</td>
   
  </tr>
  <tr>
   <td width="11"><img name="menu_r3_c1" src="assets/main_box/admin_r3_c1.jpg" width="11" height="20" border="0" id="menu_r3_c1" alt="" /></td>
   <td background="assets/main_box/admin_r3_c2.jpg">&nbsp;</td>
   <td width="11"><img name="menu_r3_c3" src="assets/main_box/admin_r3_c3.jpg" width="11" height="20" border="0" id="menu_r3_c3" alt="" /></td>
   
  </tr>
</table>
<!--- END OF YOUR CONTENT --->
<cfelse>
You are not authorized to view this page.
</cfif>
</cf_headfoot>