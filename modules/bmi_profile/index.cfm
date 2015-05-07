<!---\\ Module Configuration //--->
<cfset module ="bmi_profile">
<cfset table_bmi_quiz = "webos_bmi_quiz">
<cfset table_bmi_goals ="webos_bmi_log_book">
<cfset table_bmi_log ="webos_bmi_progress_log">
<!---\\ For the DB Tables, please See the DB folder //--->

<!---\\ End of Module Configuration //---->
<!---\\ BMI Actions //--->
<cfif isDefined('url.action') and #url.action# EQ "process_quiz">
<cftransaction>
<cfquery name="process_quiz" datasource="#datasrc#">
insert into #table_bmi_quiz# (user_name, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31, Q32, Q33, Q34, Q35, Q36, Q37, Q38, Q39, Q40, Q41, Q42, Q43, Q44, Q45, TimeStamp) VALUES ('#form.user_name#','#form.Q1#','#form.Q2#','#form.Q3#','#form.Q4#','#form.Q5#','#form.Q6#','#form.Q7#','#form.Q8#','#form.Q9#','#form.Q10#','#form.Q11#','#form.Q12#','#form.Q13#','#form.Q14#','#form.Q15#','#form.Q16#','#form.Q17#','#form.Q18#','#form.Q19#','#form.Q20#','#form.Q21#','#form.Q22#','#form.Q23#','#form.Q24#','#form.Q25#','#form.Q26#','#form.Q27#','#form.Q28#','#form.Q29#','#form.Q30#','#form.Q31#','#form.Q32#', '#form.Q33#','#form.Q34#','#form.Q35#','#form.Q36#','#form.Q37#','#form.Q38#','#form.Q39#','#form.Q40#','#form.Q41#','#form.Q42#','#form.Q43#','#form.Q44#','#form.Q45#', '#dateformat(now(), "MM/DD/YYYY")#')
</cfquery></cftransaction>
<cflocation url="?module=bmi_profile&section=my_report" addtoken="no">

<cfelseif isDefined('url.action') and #url.action# EQ "process_goals">
<cftransaction>
<cfquery name="process_goals" datasource="#datasrc#">
insert into #table_bmi_goals# (username, age, Arule, Brule, CRule, DRule, Erule, Frule, Grule, Hrule, Irule, Jrule, Krule, Lrule, Mrule, Nrule, Orule, Qrule, Rrule, Srule, Trule, Urule, Vrule, Wrule, Xrule, Yrule, timeStamp) VALUES ('#form.username#', '#form.age#', <cfif isDefined('form.A')>'#form.A#'<cfelseif NOT isDefined('Form.A')>'false'</cfif>, <cfif isDefined('form.B')>'#form.B#'<cfelseif NOT isDefined('Form.B')>'false'</cfif>, <cfif isDefined('form.C')>'#form.C#'<cfelseif NOT isDefined('Form.C')>'false'</cfif>, <cfif isDefined('form.D')>'#form.D#'<cfelseif NOT isDefined('Form.D')>'false'</cfif>, <cfif isDefined('form.E')>'#form.E#'<cfelseif NOT isDefined('Form.E')>'false'</cfif>, <cfif isDefined('form.F')>'#form.F#'<cfelseif NOT isDefined('Form.F')>'false'</cfif>, <cfif isDefined('form.G')>'#form.G#'<cfelseif NOT isDefined('Form.G')>'false'</cfif>, <cfif isDefined('form.H')>'#form.H#'<cfelseif NOT isDefined('Form.H')>'false'</cfif>, <cfif isDefined('form.I')>'#form.I#'<cfelseif NOT isDefined('Form.I')>'false'</cfif>, <cfif isDefined('form.J')>'#form.J#'<cfelseif NOT isDefined('Form.J')>'false'</cfif>, <cfif isDefined('form.K')>'#form.K#'<cfelseif NOT isDefined('Form.K')>'false'</cfif>, <cfif isDefined('form.L')>'#form.L#'<cfelseif NOT isDefined('Form.L')>'false'</cfif>, <cfif isDefined('form.M')>'#form.M#'<cfelseif NOT isDefined('Form.M')>'false'</cfif>, <cfif isDefined('form.N')>'#form.N#'<cfelseif NOT isDefined('Form.N')>'false'</cfif>, <cfif isDefined('form.O')>'#form.O#'<cfelseif NOT isDefined('Form.O')>'false'</cfif>, <cfif isDefined('form.Q')>'#form.Q#'<cfelseif NOT isDefined('Form.Q')>'false'</cfif>, <cfif isDefined('form.R')>'#form.R#'<cfelseif NOT isDefined('Form.R')>'false'</cfif>, <cfif isDefined('form.S')>'#form.S#'<cfelseif NOT isDefined('Form.S')>'false'</cfif>, <cfif isDefined('form.T')>'#form.T#'<cfelseif NOT isDefined('Form.T')>'false'</cfif>, <cfif isDefined('form.U')>'#form.U#'<cfelseif NOT isDefined('Form.U')>'false'</cfif>, <cfif isDefined('form.V')>'#form.V#'<cfelseif NOT isDefined('Form.V')>'false'</cfif>, <cfif isDefined('form.W')>'#form.W#'<cfelseif NOT isDefined('Form.W')>'false'</cfif>, <cfif isDefined('form.X')>'#form.X#'<cfelseif NOT isDefined('Form.X')>'false'</cfif>, <cfif isDefined('form.Y')>'#form.Y#'<cfelseif NOT isDefined('Form.Y')>'false'</cfif>, '#dateformat(now(), "MM/DD/YYYY")#')
</cfquery></cftransaction>

<cflocation url="?module=bmi_profile&section=progress_log" addtoken="no">

<cfelseif isDefined('url.action') and #url.action# EQ "process_plog">
<cftransaction>
<cfquery name="process_log" datasource="#datasrc#">
insert into #table_bmi_log# (username, AAcriterion, BBcriterion, CCcriterion, CC2criterion, CC3criterion, CC4criterion, DDcriterion, EEcriterion, EE2criterion, FFcriterion, FF2criterion, FF3criterion, GGcriterion, GG2criterion, GG3criterion, GG4criterion, HHcriterion, HH2criterion, IIcriterion, JJcriterion, JJ2criterion, KKcriterion, LLcriterion, LL2criterion, MMcriterion, MM2criterion, NNcriterion, NN2criterion, OOcriterion, QQcriterion, RRcriterion, RR2criterion, SScriterion, SS2criterion, TTcriterion, UUcriterion, VVcriterion, VV2criterion, VV3criterion, WWcriterion, XXcriterion, YYcriterion, YY2criterion, YY3criterion, last_updated) VALUES ('#form.username#', <cfif NOT isDefined('form.AAcriterion')>'false'<cfelseif isDefined('form.AAcriterion')>'#form.AAcriterion#'</cfif>, <cfif NOT isDefined('form.BBcriterion')>'false'<cfelseif isDefined('form.BBcriterion')>'#form.BBcriterion#'</cfif>, <cfif NOT isDefined('form.CCcriterion')>'false'<cfelseif isDefined('form.CCcriterion')>'#form.CCcriterion#'</cfif>, <cfif NOT isDefined('form.CC2criterion')>'false'<cfelseif isDefined('form.CC2criterion')>'#form.CC2criterion#'</cfif>, <cfif NOT isDefined('form.CC3criterion')>'false'<cfelseif isDefined('form.CC3criterion')>'#form.CC3criterion#'</cfif>, <cfif NOT isDefined('form.CC4criterion')>'false'<cfelseif isDefined('form.CC4criterion')>'#form.CC4criterion#'</cfif>, <cfif NOT isDefined('form.DDcriterion')>'false'<cfelseif isDefined('form.DDcriterion')>'#form.DDcriterion#'</cfif>, <cfif NOT isDefined('form.EEcriterion')>'false'<cfelseif isDefined('form.EEcriterion')>'#form.EEcriterion#'</cfif>, <cfif NOT isDefined('form.EE2criterion')>'false'<cfelseif isDefined('form.EE2criterion')>'#form.EE2criterion#'</cfif>, <cfif NOT isDefined('form.FFcriterion')>'false'<cfelseif isDefined('form.FFcriterion')>'#form.FFcriterion#'</cfif>, <cfif NOT isDefined('form.FF2criterion')>'false'<cfelseif isDefined('form.FF2criterion')>'#form.FF2criterion#'</cfif>, <cfif NOT isDefined('form.FF3criterion')>'false'<cfelseif isDefined('form.FF3criterion')>'#form.FF3criterion#'</cfif>, <cfif NOT isDefined('form.GGcriterion')>'false'<cfelseif isDefined('form.GGcriterion')>'#form.GGcriterion#'</cfif>, <cfif NOT isDefined('form.GG2criterion')>'false'<cfelseif isDefined('form.GG2criterion')>'#form.GG2criterion#'</cfif>, <cfif NOT isDefined('form.GG3criterion')>'false'<cfelseif isDefined('form.GG3criterion')>'#form.GG3criterion#'</cfif>, <cfif NOT isDefined('form.GG4criterion')>'false'<cfelseif isDefined('form.GG4criterion')>'#form.GG4criterion#'</cfif>, <cfif NOT isDefined('form.HHcriterion')>'false'<cfelseif isDefined('form.HHcriterion')>'#form.HHcriterion#'</cfif>, <cfif NOT isDefined('form.HH2criterion')>'false'<cfelseif isDefined('form.HH2criterion')>'#form.HH2criterion#'</cfif>, <cfif NOT isDefined('form.IIcriterion')>'false'<cfelseif isDefined('form.IIcriterion')>'#form.IIcriterion#'</cfif>, <cfif NOT isDefined('form.JJcriterion')>'false'<cfelseif isDefined('form.JJcriterion')>'#form.JJcriterion#'</cfif>, <cfif NOT isDefined('form.JJ2criterion')>'false'<cfelseif isDefined('form.JJ2criterion')>'#form.JJ2criterion#'</cfif>, <cfif NOT isDefined('form.KKcriterion')>'false'<cfelseif isDefined('form.KKcriterion')>'#form.KKcriterion#'</cfif>, <cfif NOT isDefined('form.LLcriterion')>'false'<cfelseif isDefined('form.LLcriterion')>'#form.LLcriterion#'</cfif>, <cfif NOT isDefined('form.LL2criterion')>'false'<cfelseif isDefined('form.LL2criterion')>'#form.LL2criterion#'</cfif>, <cfif NOT isDefined('form.MMcriterion')>'false'<cfelseif isDefined('form.MMcriterion')>'#form.MMcriterion#'</cfif>, <cfif NOT isDefined('form.MM2criterion')>'false'<cfelseif isDefined('form.MM2criterion')>'#form.MM2criterion#'</cfif>, <cfif NOT isDefined('form.NNcriterion')>'false'<cfelseif isDefined('form.NNcriterion')>'#form.NNcriterion#'</cfif>, <cfif NOT isDefined('form.NN2criterion')>'false'<cfelseif isDefined('form.NN2criterion')>'#form.NN2criterion#'</cfif>, <cfif NOT isDefined('form.OOcriterion')>'false'<cfelseif isDefined('form.OOcriterion')>'#form.OOcriterion#'</cfif>, <cfif NOT isDefined('form.QQcriterion')>'false'<cfelseif isDefined('form.QQcriterion')>'#form.QQcriterion#'</cfif>, <cfif NOT isDefined('form.RRcriterion')>'false'<cfelseif isDefined('form.RRcriterion')>'#form.RRcriterion#'</cfif>, <cfif NOT isDefined('form.RR2criterion')>'false'<cfelseif isDefined('form.RR2criterion')>'#form.RR2criterion#'</cfif>, <cfif NOT isDefined('form.SScriterion')>'false'<cfelseif isDefined('form.SScriterion')>'#form.SScriterion#'</cfif>, <cfif NOT isDefined('form.SS2criterion')>'false'<cfelseif isDefined('form.ss2criterion')>'#form.SS2criterion#'</cfif>, <cfif NOT isDefined('form.TTcriterion')>'false'<cfelseif isDefined('form.TTcriterion')>'#form.TTcriterion#'</cfif>, <cfif NOT isDefined('form.UUcriterion')>'false'<cfelseif isDefined('form.UUcriterion')>'#form.UUcriterion#'</cfif>, <cfif NOT isDefined('form.VVcriterion')>'false'<cfelseif isDefined('form.VVcriterion')>'#form.VVcriterion#'</cfif>, <cfif NOT isDefined('form.VV2criterion')>'false'<cfelseif isDefined('form.VV2criterion')>'#form.VV2criterion#'</cfif>, <cfif NOT isDefined('form.VV3criterion')>'false'<cfelseif isDefined('form.VV3criterion')>'#form.VV3criterion#'</cfif>, <cfif NOT isDefined('form.WWcriterion')>'false'<cfelseif isDefined('form.WWcriterion')>'#form.WWcriterion#'</cfif>, <cfif NOT isDefined('form.XXcriterion')>'false'<cfelseif isDefined('form.XXcriterion')>'#form.XXcriterion#'</cfif>, <cfif NOT isDefined('form.YYcriterion')>'false'<cfelseif isDefined('form.YYcriterion')>'#form.YYcriterion#'</cfif>, <cfif NOT isDefined('form.YY2criterion')>'false'<cfelseif isDefined('form.YY2criterion')>'#form.YY2criterion#'</cfif>, <cfif NOT isDefined('form.YY3criterion')>'false'<cfelseif isDefined('form.YY3criterion')>'#form.YY3criterion#'</cfif>, '#dateformat(now(), "MM/DD/YYYY")#')
</cfquery>
</cftransaction>
<cflocation url="?module=users&section=main&msg=Updated Your Progress Log" addtoken="no">
</cfif>
<!---\\ End BMI Actions //--->
<cfif isDefined('url.section')>
  <cfif #url.section# EQ "quiz">
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50%" height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">Take the Quiz</td>
    <td width="50%" align="right" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>step1.gif" width="87" height="27" /></td>
  </tr>
  <tr>
    <td colspan="2"><cfif session.allowin EQ "No">
    You'll need to register first, which will create your profile, and then take you to our quiz.
    
    <script type="text/javascript">
<!--
function delayer(){
	document.location = "http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=users&section=register"
}
//-->
</script>
<script>
setTimeout('delayer()', 3000);
</script>
    <cfelseif session.allowin EQ "Yes">
    <!--webbot BOT="GeneratedScript" PREVIEW=" " startspan -->
            <script language="JavaScript" type="text/javascript"><!--
function bmi_quiz_Validator(theForm)
{

  if (theForm.Q41.selectedIndex == 0)
  {
    alert("The first \"Select One\" option is not a valid selection.  Please choose one of the other options.");
    theForm.Q41.focus();
    return (false);
  }

  if (theForm.Q42.selectedIndex == 0)
  {
    alert("The first \"Select One\" option is not a valid selection.  Please choose one of the other options.");
    theForm.Q42.focus();
    return (false);
  }

  if (theForm.Q43.selectedIndex == 0)
  {
    alert("The first \"Select One\" option is not a valid selection.  Please choose one of the other options.");
    theForm.Q43.focus();
    return (false);
  }

  if (theForm.Q44.selectedIndex == 0)
  {
    alert("The first \"Select One\" option is not a valid selection.  Please choose one of the other options.");
    theForm.Q44.focus();
    return (false);
  }
  return (true);
}
//--></script>
          <!--webbot BOT="GeneratedScript" endspan -->
          <form action="?module=bmi_profile&action=process_quiz" method="post" name="bmi_quiz" id="bmi_quiz" onsubmit="return bmi_quiz_Validator(this)" language="JavaScript">
                <input type="hidden" name="user_name" value="<cfoutput>#session.username#</cfoutput>"/>
              Okay, <cfoutput>#session.username#</cfoutput> You're ready to take our quiz... <br />
              <br />
              Your answers will be used to figure out exactly what you should do to lose weight. The personal report will go over the results with you. You can print out the personal report and use it as a guide. 
              <br />
              <br />
              Take this quiz as often as you want -- you may find that your answers change over time, as you make changes in your life.
Some of the questions are a little personal. Please know that your answers are private, and no one else will ever know your specific answers. <br />
<br />
I will keep them private and only use them to help you.
When you are done, hit "<em><strong>Get my Personal Report</strong></em>" for your results.
<hr />
<table width="95%" border="1" align="center" cellpadding="3" bordercolor="#C4D5EC" id="table4" style="border-collapse: collapse">
                    <tr>
                      <td bgcolor="#A2BDE1" colspan="2"><p align="center"> <span style="letter-spacing: 10px"> <font face="Verdana" style="font-size: 9pt"> QUIZ</font></span></p></td>
                    </tr>
                    <tr>
                      <td bgcolor="#F0F4FB" width="404">&nbsp;</td>
                      <td bgcolor="#F0F4FB" width="220">&nbsp;</td>
                    </tr>
                    <tr>
                      <td bgcolor="#F0F4FB" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 1. Has 
                        anyone ever told you that you snore?<br />
                      </font></td>
                      <td bgcolor="#F0F4FB" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q1" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp;</span><font style="font-size: 9pt"> </font><font size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q1" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span></font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#EBF0FA" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 2. Are you too tired during the day?<br />
                      </font></td>
                      <td bgcolor="#EBF0FA" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q2" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q2" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#F0F4FB" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 3. If female, have you gone 3 or more 
                        months without a period (not related to 
                        Depo Provera)?<br />
                      </font></td>
                      <td bgcolor="#F0F4FB" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q3" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q3" />
                          </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO&nbsp; </font> <font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q3" checked="checked" />
                            Not 
                            Applicable</span></font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#EBF0FA" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 4. If female, do you have more hair on 
                        your body or face than others you know?<br />
                      </font></td>
                      <td bgcolor="#EBF0FA" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q4" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q4" />
                          </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO&nbsp; </font> <font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q4" checked="checked" />
                            Not 
                            Applicable</span></font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#F0F4FB" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 5. Has the 
                        skin on the 
                        back of your 
                        neck gotten 
                        dark? 
                        (Sometimes 
                        people see 
                        this sign of 
                        pre-diabetes 
                        and think 
                        it's dirt 
                        that won't 
                        wash off.)<br />
                      </font></td>
                      <td bgcolor="#F0F4FB" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q5" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q5" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#EBF0FA" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 6. Has a doctor or nurse ever told you 
                        that you have high blood pressure?<br />
                      </font></td>
                      <td bgcolor="#EBF0FA" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q6" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q6" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#F0F4FB" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 7. Have you ever had high cholesterol?<br />
                      </font></td>
                      <td bgcolor="#F0F4FB" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q7" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q7" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#EBF0FA" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 8. Do you have to wake up at night to 
                        pee?<br />
                      </font></td>
                      <td bgcolor="#EBF0FA" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q8" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q8" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#F0F4FB" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 9. Are you very thirsty, more than 
                        others?<br />
                      </font></td>
                      <td bgcolor="#F0F4FB" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q9" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q9" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#EBF0FA" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 10. Do you watch more than 2 hours of TV 
                        (4 half-hour shows or 2 hour-long shows) 
                        a day?<br />
                      </font></td>
                      <td bgcolor="#EBF0FA" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q10" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q10" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#F0F4FB" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 11. Do you play video games for more 
                        than two hours a day?<br />
                      </font></td>
                      <td bgcolor="#F0F4FB" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q11" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q11" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#EBF0FA" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 12. Do you have a TV in your room?<br />
                      </font></td>
                      <td bgcolor="#EBF0FA" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q12" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q12" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#F0F4FB" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 13. If you have a computer at home, do 
                        you use the computer more than two hours 
                        a day? </font><font face="Verdana" style="font-size: 9pt"><br />
                                                      </font> </td>
                      <td bgcolor="#F0F4FB" width="220"><font face="Verdana" style="font-size: 9pt">&nbsp; </font> <font face="Verdana" color="#001C55" style="font-size: 9pt">&nbsp; </font>
                          <table border="0" width="96%" id="table5" style="border-collapse: collapse">
                            <tr>
                              <td width="52"><font face="Verdana"> <span style="font-size: 9pt">
                                <input type="radio" value="true" name="Q13" />
                              </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana" style="font-size: 9pt"> </font> </td>
                              <td width="42"><font face="Verdana" size="1"> <span style="font-size: 9pt">
                                <input type="radio" value="false" name="Q13" checked="checked" />
                              </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">NO&nbsp;</font></td>
                              <td><font face="Verdana" size="1"> <span style="font-size: 9pt">
                                <input type="radio" value="false" name="Q13" />
                                </span></font><font face="Verdana" style="font-size: 9pt"> Not 
                                  Applicable</font></td>
                            </tr>
                          </table>
                        <p>&nbsp;</p></td>
                    </tr>
                    <tr>
                      <td bgcolor="#EBF0FA" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 14. Do you eat vegetables less than 4 
                        times a week?<br />
                      </font></td>
                      <td bgcolor="#EBF0FA" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q14" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q14" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#F0F4FB" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 15. Do you eat fruit less than 4 times a 
                        week?<br />
                      </font></td>
                      <td bgcolor="#F0F4FB" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q15" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q15" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#EBF0FA" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 16. Fresh fruit and vegetables can be 
                        expensive; does your family ever have 
                        trouble affording them?<br />
                      </font></td>
                      <td bgcolor="#EBF0FA" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q16" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q16" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#F0F4FB" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 17. Do you have milk, cheese or yogurt 
                        less than 2 times a day?<br />
                      </font></td>
                      <td bgcolor="#F0F4FB" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q17" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q17" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#EBF0FA" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 18. When you have milk, is it whole 
                        milk? (red-top)<br />
                      </font></td>
                      <td bgcolor="#EBF0FA" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q18" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q18" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#F0F4FB" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 19. Do you eat cheese more than once a 
                        day?<br />
                      </font></td>
                      <td bgcolor="#F0F4FB" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q19" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q19" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#EBF0FA" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 20. Do you drink 2 or more sodas, juices 
                        or bought iced-tea every day?<br />
                      </font></td>
                      <td bgcolor="#EBF0FA" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q20" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q20" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#F0F4FB" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 21. Do you drink less than one glass of 
                        water each day?<br />
                      </font></td>
                      <td bgcolor="#F0F4FB" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q21" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q21" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#EBF0FA" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 22. Does your family grocery shop for 
                        food once a month or less?<br />
                      </font></td>
                      <td bgcolor="#EBF0FA" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q22" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q22" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#F0F4FB" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 23. Do you often skip breakfast?<br />
                      </font></td>
                      <td bgcolor="#F0F4FB" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q23" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q23" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#EBF0FA" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 24. Do you eat dinner with your parents 
                        or guardians less than 3 times a week?<br />
                      </font></td>
                      <td bgcolor="#EBF0FA" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q24" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q24" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#F0F4FB" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 25. If your family receives food stamps, 
                        are you able to buy enough food with the 
                        food stamps to last the whole month? <br />
                      </font></td>
                      <td bgcolor="#F0F4FB" width="220"><font face="Verdana" style="font-size: 9pt">&nbsp;&nbsp; </font> <font face="Verdana" color="#001C55" style="font-size: 9pt">&nbsp; </font>
                          <table border="0" width="100%" id="table6" style="border-collapse: collapse">
                            <tr>
                              <td width="52"><font face="Verdana"> <span style="font-size: 9pt">
                                <input type="radio" value="true" name="Q25" />
                              </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font></td>
                              <td width="45"><font face="Verdana"> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                                <input type="radio" value="false" name="Q25" checked="checked" />
                              </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                              <td><font face="Verdana" size="1"> <span style="font-size: 9pt">
                                <input type="radio" value="NotApplicable" name="Q25" />
                                </span></font><font face="Verdana" style="font-size: 9pt"> Not 
                                  Applicable</font></td>
                            </tr>
                          </table>
                        <p>&nbsp;</p></td>
                    </tr>
                    <tr>
                      <td bgcolor="#EBF0FA" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 26. Do you ever go hungry so there will 
                        be enough food for someone else in your 
                        home? (Note: I'm not asking about being 
                        polite. I'm asking if sometimes there's 
                        not enough food for everyone to have as 
                        much as they want.)<br />
                      </font></td>
                      <td bgcolor="#EBF0FA" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q26" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q26" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#F0F4FB" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 27. Does anyone in your home ever go 
                        hungry so there will be enough food for 
                        you?<br />
                      </font></td>
                      <td bgcolor="#F0F4FB" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q27" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q27" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#EBF0FA" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 28. Do you eat in a fast food restaurant 
                        3 or more times a week?<br />
                      </font></td>
                      <td bgcolor="#EBF0FA" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q28" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q28" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#F0F4FB" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 29. Do you buy food from a corner store 
                        3 or more times a week?<br />
                      </font></td>
                      <td bgcolor="#F0F4FB" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q29" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q29" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#EBF0FA" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 30. Do you eat when you are upset or 
                        sad?<br />
                      </font></td>
                      <td bgcolor="#EBF0FA" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q30" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q30" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#F0F4FB" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 31. Do you ever eat in secret?<br />
                      </font></td>
                      <td bgcolor="#F0F4FB" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q31" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q31" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#EBF0FA" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 32. Do you ever binge-eat (eat very, 
                        very large amounts of food at once)?<br />
                      </font></td>
                      <td bgcolor="#EBF0FA" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q32" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q32" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#F0F4FB" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 33. Have you 
                        ever skipped 
                        meals so you 
                        would lose 
                        weight?<br />
                      </font></td>
                      <td bgcolor="#F0F4FB" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q33" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q33" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#EBF0FA" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 34. Have you 
                        ever made 
                        yourself 
                        vomit?<br />
                      </font></td>
                      <td bgcolor="#EBF0FA" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q34" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q34" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#F0F4FB" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 35. Have you ever taken medications to 
                        lose weight?<br />
                      </font></td>
                      <td bgcolor="#F0F4FB" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q35" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q35" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#EBF0FA" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 36. Have you ever exercised so you would 
                        lose weight?<br />
                      </font></td>
                      <td bgcolor="#EBF0FA" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q36" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q36" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#F0F4FB" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 37. Do you walk every day?<br />
                      </font></td>
                      <td bgcolor="#F0F4FB" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q37" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q37" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#EBF0FA" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 38. Do you walk fast enough that you get 
                        out of breath or your heart rate goes 
                        up?<br />
                      </font></td>
                      <td bgcolor="#EBF0FA" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q38" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q38" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#F0F4FB" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 39. Do you dance, play ball or do other 
                        exercises at least 2 times a week?<br />
                      </font></td>
                      <td bgcolor="#F0F4FB" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q39" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q39" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#EBF0FA" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 40. Is there a safe place near your home 
                        where you can walk or play outside?<br />
                      </font></td>
                      <td bgcolor="#EBF0FA" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q40" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q40" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#F0F4FB" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 41. How many TV shows are your &quot;regular&quot; 
                        shows that you never miss? 1-4, 5-8, 
                        over 8<br />
                      </font></td>
                      <td bgcolor="#F0F4FB" width="220"><font face="Verdana"> <span style="font-size: 9pt">&nbsp;</span>
                            <!--webbot bot="Validation" s-display-name="Select One" b-disallow-first-item="TRUE" -->
                        <select size="1" name="Q41" style="font-size: 9pt">
                              <option selected="selected">Select One </option>
                              <option value="2">No regular TV shows </option>
                              <option value="4">1-4 </option>
                              <option value="H">5 - 8 </option>
                              <option value="H">over 8 </option>
                      </select>
                      </font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#EBF0FA" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 42. How many hours a day do you watch 
                        TV? 0-2, 3-4, 5-7 over 8<br />
                      </font></td>
                      <td bgcolor="#EBF0FA" width="220"><font face="Verdana"> <span style="font-size: 9pt">&nbsp;</span>
                            <!--webbot bot="Validation" s-display-name="Select One" b-disallow-first-item="TRUE" -->
                        <select size="1" name="Q42" style="font-size: 9pt">
                              <option selected="selected"> Select One </option>
                              <option value="2"> 0 - 2 </option>
                              <option value="H"> 3 - 4 </option>
                              <option value="H"> 5 - 7 </option>
                              <option value="H"> over 8 </option>
                      </select>
                      </font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#F0F4FB" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 43. Please guess how much money you 
                        spend in a week at a corner store 
                        (including soda, gum, etc..) $0-2, $3-4, 
                        $5-8, $9-12, $13-18, $19-25, over $25<br />
                      </font></td>
                      <td bgcolor="#F0F4FB" width="220"><font face="Verdana"> <span style="font-size: 9pt">&nbsp;</span>
                            <!--webbot bot="Validation" s-display-name="Select One" b-disallow-first-item="TRUE" -->
                        <select size="1" name="Q43" style="font-size: 9pt">
                              <option selected="selected">Select One </option>
                              <option value="2">0 - 2 </option>
                              <option value="S">3 - 4 </option>
                              <option value="S">5 - 8 </option>
                              <option value="S">9 - 12 </option>
                              <option value="S">13 - 18 </option>
                              <option value="S">19 - 25 </option>
                              <option value="S">over 25 </option>
                      </select>
                      </font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#EBF0FA" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 44. Please guess how much money you 
                        spend in a week at fast food restaurants 
                        $0-2, $3-4, $5-8, $9-12, $13-18, $19-25, 
                        over $25<br />
                      </font></td>
                      <td bgcolor="#EBF0FA" width="220"><font face="Verdana"> <span style="font-size: 9pt">&nbsp;</span>
                            <!--webbot bot="Validation" s-display-name="Select One" b-disallow-first-item="TRUE" -->
                        <select size="1" name="Q44" style="font-size: 9pt">
                              <option selected="selected">Select One </option>
                              <option value="2">0 - 2 </option>
                              <option value="4">3 - 4 </option>
                              <option value="8">5 - 8 </option>
                              <option value="R">9 - 12 </option>
                              <option value="R">13 - 18 </option>
                              <option value="R">19 - 25 </option>
                              <option value="R">over 25 </option>
                      </select>
                      </font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#F0F4FB" width="404"><font face="Verdana" color="#001C55" style="font-size: 9pt"> 45. Have you ever dieted?<br />
                      </font></td>
                      <td bgcolor="#F0F4FB" width="220"><font face="Verdana"> <span style="font-size: 9pt">
                        <input type="radio" value="true" name="Q45" />
                        </span></font><font face="Verdana" color="#001C55" style="font-size: 9pt">YES</font><font face="Verdana"><span style="font-size: 9pt">&nbsp;&nbsp; </span> <font face="Verdana" size="1"> <span style="font-size: 9pt">
                        <input type="radio" value="false" name="Q45" checked="checked" />
                        </span></font><span style="font-size: 9pt"> </span> </font> <font face="Verdana" color="#001C55" style="font-size: 9pt"> NO</font></td>
                    </tr>
                    <tr>
                      <td bgcolor="#EBF0FA" colspan="2">&nbsp;</td>
                    </tr>
              </table>
                  

                <input type="submit" value="Get Your Personal Report" name="B1" style="font-size: 10px" />
              <input type="reset" value="Reset" name="B2" style="font-size: 10px" />
            </form>
    </cfif>    </td>
  </tr>
</table>
 <cfelseif #url.section# EQ "my_report">
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50%" height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">Your Personal Report</td>
    <td width="50%" align="right" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>step2.gif" width="87" height="27" /></td>
  </tr>
  <tr>
    <td colspan="2">
    <!---\\Begin Report Results //--->
        <cfset A ="One of the answers you gave on the quiz makes me worried that you may have a problem with sleep apnea. Sleep apnea means that while you sleep, you snore very hard, and then sometimes stop breathing. You said in the quiz that you sometimes snore hard and that people have told you that you stopped breathing. Please bring this to your doctor’s attention. You can have something called a “sleep study” done where you sleep overnight in a hospital and lab technicians test you to see if you stopped breathing. This is painless and easy and it may be one of the most important things you do to help you lose weight. If you’re too tired during the day to eat right or move around, you are not going to be able to control your weight. Taking care of your sleep apnea may make you less tired during the day.">
    <cfset B ="Have you heard of “polycystic ovarian syndrome”? Women with PCOS sometimes are overweight, have acne, have hair on their face or body more than most people in their family and have irregular periods. The answers you gave on your questionnaire make me think you might have PCOS. Please take this personal report to your doctor and discuss the possibility of PCOS. Your doctor can help you take medication that will control the affects of the PCOS and if you don’t already have acne and hair on your face, may prevent that from happening. Getting your PCOS under control will help your overweight. You will also have to get your overweight under control in order to help your PCOS.">
      <cfset B1 ="As an FTM, you may be surprised to learn that many FTM folks have PCOS. No one knows why there is an association, but this is something to discuss with your healthcare provider. Many FTM are nervous about going to a doctor. Please, try to find a doctor who is experienced taking care of FTM, and can help you in a sensitive manner. Try contacting a gay/ lesbian healthcare agency, even if it’s not near your home, to get contacts with local doctors.">
      <cfset B2 ="As an MTF, it may be that the hair on your face and the acne that you mention in your quiz are related to the hormones you may be taking, or the hormones that are already in your body. The best thing for you to do is discuss this with your healthcare provider. Many MTF are nervous about going to a doctor. Please, try to find a doctor who is experienced taking care of MTF, and can help you in a sensitive manner. Try contacting a gay/ lesbian healthcare agency, even if it’s not near your home, to get contacts with local doctors.">
    <cfset C ="You have probably heard of diabetes. Diabetes is a condition where your body has been so stressed by too much sugar that it stops being able to handle it very well. After awhile your body can’t handle sugar at all. Someone with diabetes will find themselves all the time and all of a sudden, needing to get up at night to pee, sometimes 2 or 3 times in a night when they never used to have to do that at all. Diabetes can be so serious that you can end up having to be in the hospital. Some of your answers make me worry that you could have diabetes. The most important thing for you to do is to take this personal assessment to your doctor and go over it with them and tell them that you are worried that you could have diabetes. The doctor can do an easy test right there in the office and give you an answer. Then, you can go on from there and do just what you’re doing – try to lose weight and have less sugar in what you eat and that will help you control diabetes if you do have it. This one is so important that I want to say it one more time… please, please discuss this with your doctor.">
      <cfset C1 ="I hope that you’re able to use some of the ideas in this personal report to help yourself to lose weight.  I know you’ve dieted before and you may feel very discouraged about the idea of losing weight.  You may even think that it’s not possible.  But I want to tell you that these are simple things that you can do and that you don’t need to do them all. Pick one or two things and make a few small changes in your life, and I promise that this experience is going to be different than the experience you’ve had before.">
      <cfset C2 ="This is the end of your personal assessment and I hope that you have found some of these suggestions useful.  I know you’ve never dieted before and so the idea of taking control of your weight and making a real difference may be a little bit scary, and certainly new.  Take heart, because it is never too late to take control of your weight and start being healthier.  The first step that you have taken, taking this quiz and reading this assessment is a wonderful first step that will put you on the right track. Stay with the program, continue to work at your goals and you absolutely meet success.">
      <cfset C3 ="At your age, an important thing to keep in mind is that you can’t do this alone.  Please try to get your parents or guardians or other people that you live with or who care about you to work on this with you.  I know that you don’t buy your own food and you’re not in charge of very much about even how you spend your day.  That’s normal at your age and it’s OK.  You can still make some positive changes.  You can drink water, you can eat more fruits and vegetables and you can spend less time sitting around.  Your body’s metabolism – how fast it uses energy – is very good at your age and you will be able to lose weight and get it under control with just a little bit of effort.">
      <cfset C4 ="Now that you’ve started high school, you can really use that to your advantage to help yourself lose weight.  You’re in a position where you’re beginning to take on more responsibility and you can use this in a way that will help you.  Try to make your own lunch if you bring lunch to school.  Offer to get yourself places more often rather than have your parents or guardians take you.  If you walk there, or if you can ride a bike there, which you can do now that you’re at this age, you’re going to use more calories, be less sedentary (not as still) and you’ll be able to get things under control much more easily.">
      <cfset C5="As a young adult, you have to look forward now to the time when you won’t be living with your parents or guardians anymore and you’ll be on your own.   Use these last years of your teenage life to really pull things together and get yourself ready to be an adult.  Make sure that in the next two years you learn how to cook some healthy foods that will be good for your body and help keep your weight under control.  Use your own power to get yourself places.  Don’t take rides too often.  As much as you can, walk or ride your bike wherever you need to go.  Make sure to start doing some of the shopping.  While your parents or guardians bring most of the food into the house, at your age you’re ready to do the shopping sometimes and make sure to read the labels and bring the lowest fat food, healthier foods and more fruits and vegetables into your home.  You’re in a situation now as a young adult where you can make a difference for yourself.">
      <cfset C6="As a young adult, you may have found that some of this report seemed as if it was geared toward people a little bit younger than you.  This website is designed for teenagers but all of the nutrition advice in it is applicable to young adults as well.  I hope that you find some of these suggestions useful.">
    <cfset D ="High blood pressure is one possible problem that you can get from being overweight. There are lots of health problems that can happen because of high blood pressure, including strokes. It is very important if you have been told that you have high blood pressure, to work closely with your doctor as a partner in order to get it under control. There are so many things you can do to get your blood pressure under control. One of the most important ones is one you are working on right now: getting your weight under control. Congratulations! This is an excellent step on the road to controlling your blood pressure and allowing yourself to be healthier.">
    <cfset E ="Before we go any further, I noticed that you said on your quiz that you have been told that you have high cholesterol. Lots of people don’t really know what cholesterol is. Cholesterol comes from animals. Anything you eat that came from an animal, whether it is meat or milk or cheese, has cholesterol in it. Something with a lot of fat that did not come from an animal, like peanut butter, does not have any cholesterol. By the way, that’s why peanut butter is a good snack if you have high cholesterol. High cholesterol is a condition that happens when your body cannot handle cholesterol very well. This happens usually because your parents’ bodies were programmed, genetically, to not handle cholesterol well. You may have inherited this! Lots of people who struggle with their weight also have high cholesterol.  <br><br>  Now why do you care at your age? Because high cholesterol starting from a young age can lead to a heart attack at a young age. You may have high cholesterol as a teen and go on and have a heart attack in your 40’s, which may sound like a long time away now, but trust me – it’s not. The best thing you can do to live a long and healthy life is get your cholesterol under control. How do you do that? By eating more fruits and vegetables. Also try to eat brown bread instead of white bread and try to eat brown rice instead of white rice and have low fat versions of your milks and cheeses and yogurts. Buy the blue top milk, not the red top milk. Buy low fat cheese and yogurt. Those choices will help your lower your cholesterol while still getting the calcium you need to build your strong bones from milk, cheese and yogurt.">
    <cfset F ="You said that you have high blood pressure and high cholesterol. Now, high cholesterol and high blood pressure are a bad combination. This can be best controlled by doing just what you are doing right now: working to lower your weight. You can do this by eating low cholesterol foods and getting some exercise. Those things together along with working very closely with your doctor as a partner to get your blood pressure and cholesterol DOWN, is going to let you have a healthy life.">
      <cfset F1 ="The most important thing is to keep motivated.  Think about what your goals are – whether it’s just to be healthier, to look better, or to feel better – and let the teen weight loss club be your friend and your partner in losing weight.  Please come back to the website often and log in, keep track of your goals and progress, and you will absolutely meet with success. Thank you again for taking this quiz and reading this personal report.  It’s a good first step toward losing weight.  Now please go to Step 2 where you can set your personal goals and then Step 3, where you can set up your weekly log so that you can keep track of your progress toward meeting your goals.  Good luck and good health! - The Teen Weight Loss Club">
    <cfset G ="You have probably heard of diabetes. Diabetes is a condition where your body has been so stressed by too much sugar that it stops being able to handle it very well. After awhile your body can’t handle sugar at all. Someone with diabetes will find themselves all the time and all of a sudden, needing to get up at night to pee, sometimes 2 or 3 times in a night when they never used to have to do that at all. Diabetes can be so serious that you can end up having to be in the hospital. <br>Some of your answers make me worry that you could have diabetes. The most important thing for you to do is to take this personal assessment to your doctor and go over it with them and tell them that you are worried that you could have diabetes. The doctor can do an easy test right there in the office and give you an answer. Then, you can go on from there and do just what you’re doing – try to lose weight and have less sugar in what you eat and that will help you control diabetes if you do have it. This one is so important that I want to say it one more time… please, please discuss this with your doctor.">
    <cfset H ="You may not be aware that watching too much television, playing too many video games or spending too much time in front of the computer can affect your weight. I call that “screen time,” whether it’s the TV screen, the video game screen or the computer screen. When you are in front of the screen you are very, very still – you are not moving much at all. In fact, you probably move more in your sleep than you do while you watch television. <br><br>Being so completely still gets in the way of using the calories, the energy you get from food. When you don’t use your calories, it turns into fat and then you will struggle with your weight. You are definitely having too much “screen time.” Even if you just sat and read a book, you would use more calories than you’re using right now. There are so many things you can do if you turn off the TV or step away from the video games. Do you like to jump rope, go for a walk, play ball? Even cleaning your place: Do you know that vacuuming is excellent exercise? So is dusting and sweeping, and so is carrying a laundry basket. It sound crazy, but little things you can do will get your body moving more – the more you move, the more weight you will lose. <br><br>Most people don’t want to make a commitment to never watch television or play a video game again, and I would never ask you to do that. But I will ask you to set as a personal goal to watch LESS TV and play fewer games. What if you decided to just watch for one hour a day, or even two hours a day? That would be a lot better than where you are now, and I promise you will see the benefit.">
    <cfset I ="Most people think that controlling their weight is just about eating less. Well guess what? – I’ve got a nice surprise for you. One thing that you’re doing is not eating enough. Well, let me be more specific. You’re not eating enough fruits and vegetables and that is one of the reasons that you are struggling with your weight. More fruits and vegetables will keep you from being hungry, while giving you the vitamins and fiber that you need and not making you gain weight. <br> Lots of people find that they do not like fruits and vegetables or that they cannot afford to have them. If you don’t like fruits and vegetables, one thing you can do is try to keep tasting them. Buy something you sort of like and taste it everyday if you can. The more you taste it, the more you’ll get used to it, and when you get used to it, you will surely start to like it. That’s the way the human brain is built, so I promise – that will happen. You might need to taste it 20 times before you’re used to it though. Try to find things that you think are delicious. Maybe you don’t like cooked string beans but maybe you do like raw string beans or green pea pods. Maybe you don’t like cooked broccoli, but maybe you would like it raw, dipped in low fat ranch dressing. Mmm…delicious! What about trying frozen peas? Buy a bag of frozen peas and eat them frozen. It tastes like candy. Most people like raw carrots and many people like celery. Try to have the vegetables around that you know you like. <br> Another thing you can do is have fruit instead of vegetables, if you really don’t like vegetables. Oranges are a great source of vitamin C. Apples are really good for you, too. Whatever fruits you like, try to eat them a few times a day. The more fruits and vegetables you eat, the better. Remember: You can’t over-eat with fresh fruits and vegetables. Of course, you can over-eat fried vegetables so I don’t recommend that you have a lot of those, but if you like them, have them sometimes because some vegetables fried are better than no vegetables at all.">
    <cfset J ="Your body needs calcium. A good way to get calcium is from dairy products. Dairy is the word that means milk, cheese and yogurt. If you don’t have enough calcium in your diet, it may be hard for your body to use the other foods that you eat, and it’s possible that it may relate to gaining weight. There are some scientific studies that show that people who get enough calcium are better able to lose weight. <br><br> My guess is that you don’t like milk, based on the answers on your questionnaire. Maybe you don’t like it because it makes you feel sick or maybe you don’t like it because you just don’t like the taste. If milk makes you get sick, if it makes you have to run to the bathroom and it upsets your stomach, one thing you can do is have milk that has had its lactose sugar removed. One brand of milk that does that is Lactaid. Lactaid milk tastes just like regular milk only a little bit sweeter and it won’t give you that upset stomach that regular milk does. That might be an answer for you. <br><br> Or maybe you really just don’t like milk. Another way that you can get calcium is from low fat yogurt. Low fat yogurt has lots of calcium in it and you can eat one or two cups a day in order to get more calcium. <br><br> As a teenager, you really need a lot of calcium. Teenage girls need 1500 mg. of calcium everyday. Teenage boys need 1000 mg of calcium everyday. That means that teenage girls would need to drink 5 glasses of milk a day and teenage boys would need to drink 3 glasses of milk each day in order to have as much calcium as they need. <br><br>You’re having less than that so either try Lactaid or low fat yogurt or buy yourself some calcium pills. Buy the 500 mg calcium pills that they sell in the drug store and make sure it has vitamin D added. The vitamin D will help you use the calcium. Take them once or twice a day and you’ll have enough calcium in your diet to have strong bones that will last your whole life and also to help you use all of the other foods that you eat so that you will not gain weight from them.">
    <cfset K ="Having enough calcium, which you get from dairy (meaning milk, cheese, yogurt and ice cream), may help you lose weight, but high fat dairy  items are not the way to go. The higher fat milk, cheese and yogurt can make you gain too much weight and can give you high cholesterol. Instead, have lower fat dairy products. The choices are the blue or green top milks, 1% or 2%, low fat or non-fat yogurt, lower fat cheeses and ice milk or frozen yogurt instead of ice cream. These foods are very good for you and will help you lose weight while getting the calcium your body needs in order to have strong bones for your whole life.">
    <cfset L ="What you drink when you try to lose weight may be even more important than what you eat. It’s so easy to drink a lot of calories if you’re drinking sweetened drinks. What are the sweetened drinks? Regular soda, Kool-Ade-type drinks, sports drinks, juice. <br> Lots of people think sports drinks are better than water if you do sports. Some people think that sports drinks are just like replacing your sweat. The truth is, sports drinks are fattening. It has lots of calories in it, lots of sugar and even though it has a little bit of salt in it, which might be what you need if you’ve been sweating a lot, that does not make up for all the calories you get from it. A person who is exercising for up to an hour needs water, not sports drinks. If you’re really sweating a lot or exercising over an hour, you could eat a pretzel or a couple of saltines and replace the salt that you’ve lost. <br><br> Lots of people think that fruit juice is especially good for them. Fruit juice promises that it’s full of vitamin C. That’s true, but it is also full of sugar and all of that sugar can stress your body’s system and make you gain weight. You’re much better off drinking a glass of water and eating an orange or an apple than drinking a glass of orange juice or apple juice. Orange juice, apple juice, 100% fruit juice drinks and all the other juices really do make you gain weight. <br><br> Soda and Kool-Ade-type drinks are just sugar. In fact, they’re not even real sugar, they’re corn syrup. Whenever you go to eat or drink anything, please look at the label and look for the words “corn syrup.” Corn syrup will make you gain weight. In fact, there are some scientific studies that suggest that having corn syrup may make it harder for you to notice when you’re full and therefore, you may overeat after you have something with corn syrup in it. Corn syrup and sugary, sweetened drinks do nothing but make you fat. <br><br>If you feel like having a sweet drink sometime, that’s OK – have half a glass. But when you’re thirsty the thing to drink is – you guessed it – water! The more water you drink, the more weight you will lose. I promise. You only need to take 100 calories a day out of what you eat in order to lose 1 pound a month! Well, each of those sweetened drinks that you drink has about 180 calories or more in it. If you drink 4 sodas a day, you’re getting nearly an extra 800 calories a day that you don’t need. If you drink 5 sodas a day, it’s 1000 calories that you don’t need. Think how much weight you would lose if you drank water instead. <br><br>I once had a patient come in to me and tell me that she had lost 19 lbs. in the last 6 months! “Wow,” I said to her, “how did you do that?” She said to me “All I did was drink half a gallon of water a day. I didn’t change a single thing besides that.” You could do that too. Drink a lot of water. <br><br>Some young people tell me they don’t like the taste of water. Why don’t you try seltzer water or club soda? It’s fizzy like soda and you may like it. Possibly, if you still don’t like it, you might want to flavor that fizzy water with just a drop of juice. Also, they sell a lot of flavored waters in the stores these days, such as Clear Choice. If you want to try that, that’s great. But look at the label before you buy it. Make sure it says it has 0 calories. Or how about a slice of fruit – orange, lemon or lime in water? The last thing that you can try if you really don’t like water is diet soda. Diet soda has no calories and can also help you cut calories out of what you drink.">
    <cfset M ="Most people who want to lose weight think that the less they eat the better. But actually, sometimes you need to eat more. You skip breakfast, and not eating breakfast has been shown in scientific studies to be bad for people who want to lose weight. You don’t get your body going, you don’t use calories like you should, you feel sluggish the whole day when you don’t eat breakfast and guess what happens later? You’re very hungry and you end up eating junk food. It would be much better if you could eat breakfast every day. You may not have time to eat breakfast and maybe that’s why you skip it. Why don’t you try buying a box of Slim-Fast bars? Slim-Fast bars are not that expensive and they’re full of good nutrients that you can have that in your pocket on your way to school in the morning instead of breakfast. This will make a difference, even though it’s eating more.">
    <cfset N ="After all the other information you’ve already gotten, this next thing may be a little bit of a surprise to you. One of your answers from the quiz says you do not eat your meals with your parents or guardians. You know, that happens in a lot of families. Many families are so busy and each person is doing their own thing and they end up eating separately. This leads to gaining weight. <br><br> That may not make sense at first but let me try to explain. When you eat by yourself, usually you do something else while you eat – watch television or read a book or a magazine. When you do those other things, you’re not concentrating on what you are eating and you will probably over-eat. When you eat with family members, you have a chance to connect with them and feel like you’re part of a family. When you eat with your parents or guardians, you tend to eat healthier foods, probably because they don’t approve of you eating less healthy foods. When you eat with other people, you have conversation and you eat slower and take time to talk between bites, all around, eating with your parents can help you lose weight. It will help them lose weight too if that’s something they need to do as well. It may be weird to start eating with your parents or guardians now if you haven’t been for a long time. But trust me, most would love to eat with their teenagers. Why not say to them that you would like to have a family dinner at least 3 or 4 times a week and then see if, as a family you can work something out. <br> Maybe you don’t live with your parents or guardians anymore. Maybe you live in a group home or away from home. Try to eat with someone who likes you and cares about you as often as you can. Invite friends for dinner, sit down with other people, have a conversation while you eat. This makes life nicer and it will help you lose weight.">
    <cfset O ="As you look over the suggestions you’ve already gotten in this report, you might be saying to yourself, “Sure those are great suggestions but they take money and I can’t afford to do them.” For lots of people, fresh fruits and vegetables are very expensive. Sometimes it’s cheaper to eat a bag of chips than to eat something healthy like a tuna fish sandwich. I understand. There are things that you can do to make your food dollars stretch further. <br><br> One thing that you can do to stretch your food dollars is to make food in advance instead of buying fast food or buying food at a corner or convenience store. Try to make a big pot of rice and beans or chili or soup. Use brown rice and there’s really nothing less expensive or better for you. Rice and beans is an excellent dish that gives you protein, fiber and vitamins. Have it with something green and you’ve really had a healthy meal at a very low cost. Try buying dark tuna instead of light tuna when you go to buy a can of tuna fish. The dark tuna is probably better for you and it costs a lot less. Try buying your fruits and vegetables at inexpensive produce markets if there are any where you live. Sometimes an extra trip to a produce market or farmer's stand can let you buy a whole bag of apples for the price of just a couple at the supermarket. Frozen fruits and vegetables cost less than fresh and they’re still very, very good for you. Canned fruits and vegetables cost even less than that and they are still good for you. <br>Trying to make your lunches and bring them with you everyday will help you save money, unless you get a free lunch at school, in which case you should eat that free lunch at school if you can. Lots of kids don’t want to eat the free food at school because they think that it doesn’t taste good, or because the school cafeteria isn’t very nice. Go there and try to find something that tastes good enough because even if it doesn’t taste good, chances are, some of it is good for you and it’s a way to help your food dollars stretch further.">
    <cfset P ="Also, your family may qualify for food stamps. Many, many families qualify but don’t ever apply. Try looking at http://www.ssa.gov/pubs/10101.html to find out if you qualify. Another great resource to cut your food bills and help you afford more and better food is an organization called Share. This is a buying club available only in some states that cuts the prices of food in half. You can find them at http://www.sharefoodprogram.org. If none of these ideas help, try doing an internet search on “hunger” and the name of your hometown. Or ask your local librarian for help with this. There don’t seem to be any national organizations that address not having enough food or, more important, enough good food, but there are many, many local organizations which can help you access other sources of food, and ideas to stretch your food dollars further.">
    <cfset Q ="Lots of families shop only once a month. If you shop for food only once a month, you’re not going to eat as well as if you were to shop every week. Try to set up a budget with your family so that your family can shop more often. That way you’ll have healthier food around your home more often during the month. I know that you’re probably not the main person who does the shopping in your home, but as a teenager, you are ready now to take on more responsibility and one thing you can do is help your family eat healthier on a budget. So work with your family, work with your parents or guardians and try to come up with a good plan.">
    <cfset R ="One of the biggest enemies you face in trying to lose weight are fast food restaurants. That’s because all of their food are very high in calories.  You can go to the diet calculator when you’re done with your personal assessment and check out the calorie counts for some of the foods at fast food restaurants.  Try to pick smaller items without sauces when you are at fast food restaurants.  Try to eat before you go – something healthy from home – and then just get a diet soda while you’re at the restaurant with your friends.  Try to save your money for something else.  The less you eat in fast food restaurants, the better off you are going to be.  You will lose weight and you will also be healthier and wealthier because you won’t be wasting your money in the fast food restaurants.">
    <cfset S ="On your way to school, or maybe on the way home, you often stop at a corner store or convenience store. The corner or convenience stores have lots of treats like sodas, chips and candies.  It sounds from your answers on your quiz like you’re spending too much money there. Those snacks may be delicious and they may fill up your stomach when you are hungry but if you could wait until you get home and eat something healthy, you will lose weight and you will save a lot of money.  If you can’t wait until you get home, plan ahead.  Buy a big box of Slim-Fast snack bars or put a bag of carrots and celery, or a bag of peanuts in your school bag. That way, you’ll have a snack to have on the way home from school.">
    <cfset T ="It sounds like one of the things that is getting in the way of your losing weight is emotional eating. What do I mean by that? When we eat when we are sad, upset or angry, that kind of eating just leads to overweight. There are so many ways to deal with your feelings and one way many of us learn when we are very little is to eat. Maybe when you were 2 or 3 years old and you were upset, somebody might have given you a cookie or a lollipop or ice cream. That might have been OK when you were little, but now that you are your age, it is not OK anymore. It worked OK when you were little because you were always running around and because that wasn’t all that you ate. But now that you are your age, when you get upset or sad, you often eat too much. <br><br> What can you do about this? The solution actually has nothing to do with eating. It has to do with helping yourself with your feelings. Many people who are sad all the time need somebody to talk to who is outside of their family. Maybe you could find a pastor at a church or another religious leader, or a school guidance counselor, maybe and aunt or an uncle, or maybe the parents of a friend of yours, or some other adult. Talk about what’s going on that is making you sad. Maybe it would be helpful to have a counselor or a therapist. You can talk to your parents about getting that arranged. Your doctor can help you find a counselor. So can your guidance counselor at school or your advisor, or the psychology teacher in your high school, or even someone in the principal’s office or the school nurse’s office if your school has one. These people are trained to help you find someone that you can talk to. <br> Feelings that we keep inside and we don’t express often come out in other ways. For some people, it’s a headache, for other people it’s a bellyache. And for other people, maybe like you, it’s feeling like you need to eat very often. If the reason you’re eating is about your feelings, you need to find other things to do with your feelings. If you don’t like to talk, there are other ways to express your feelings. Maybe you’re an artist and you can draw pictures to express your feelings. Maybe you’re a musician and you can write a song, and maybe you’re a poet and you can write poems. You don’t have to be an artist or a poet to write in a journal. Get yourself a notebook or some scraps of paper and write down what you’re feeling. The next time you want to eat, write instead, go for a run or play ball, or punch a pillow. Whatever it takes, get your feelings out because they are so, so important and they deserve to be expressed. When you eat to keep yourself from having feelings, you’re cheating yourself of being a whole human being with complicated and important feelings.">
    <cfset U ="I am worried by one of the answers you gave in your questionnaire.  You said that you sometimes eat so much in one sitting that you wouldn’t want somebody to know or that you eat in secret.  This is called “binge eating” and binge eating can be a sign of an eating disorder.  Sometimes after people eat that way, they make themselves vomit.  I wonder if you have ever done that?  Whether you have actually made yourself vomit or not, eating this way is a sign that you have some feelings that you are not dealing with. This is now at a point that it is too much to handle on your own.  You must get some help to manage this problem so that it won’t turn into a worse health problem.  You’ve taken a wonderful and important step by taking this quiz and by being truthful in the quiz.  Now that you have my answer, please take this assessment to your doctor and tell them the whole story about the binge eating or the eating in secret or vomiting, and ask them to help you.  There are so many good ways to get help, and that help really can make a difference.  Please take the next step and discuss this important problem with your doctor.  It’s going to help in many more ways than just helping you lose weight, though it will help that as well.">
    <cfset V ="Maybe it’s not just breakfast you skip.  Maybe it’s other meals as well.  The same principle applies.  Whenever you skip a meal, you end up hungry later and then you will probably eat junk.  It is much better to eat on a regular schedule, regular meals, sitting down. Eating on the run, eating junk food, going a whole day without eating – NONE of these things will help you lose weight.  They will all lead to gaining weight even though it seems like you’re eating less at the time.">
    <cfset W ="I am worried by one of the answers you gave in your questionnaire.  You said that you sometimes eat so much in one sitting that you wouldn’t want somebody to know or that you eat in secret.  This is called “binge eating” and binge eating can be a sign of an eating disorder.  Sometimes after people eat that way, they make themselves vomit.  I wonder if you have ever done that?  Whether you have actually made yourself vomit or not, eating this way is a sign that you have some feelings that you are not dealing with. This is now at a point that it is too much to handle on your own.  You must get some help to manage this problem so that it won’t turn into a worse health problem.  You’ve taken a wonderful and important step by taking this quiz and by being truthful in the quiz.  Now that you have my answer, please take this assessment to your doctor and tell them the whole story about the binge eating or the eating in secret or vomiting, and ask them to help you.  There are so many good ways to get help, and that help really can make a difference.  Please take the next step and discuss this important problem with your doctor.  It’s going to help in many more ways than just helping you lose weight, though it will help that as well.">
    <cfset X ="You mentioned in your questionnaire that you have taken some medicine to lose weight. Because I don’t know which medicine you took, it’s hard for me to really respond properly to that answer.  I will tell you that many people take something called “ephedra” to lose weight. This is not safe and it can lead to heart attacks.  Please do not take ephedra.  Whatever it is that you have taken to lose weight, there is some possibility that it was not a safe medication to take.  Please go to your doctor and discuss whatever you took with your doctor. They can help you find out if it was safe or not, and whether or not it is OK to continue to take it.  The best way to lose weight is not to take medicine, but rather eat more fruits and vegetables and drink more water, and move your body around.  Medicines are really only a last resort and they should only be taken with the help of your doctor.">
    <cfset Y ="Changing what you eat is certainly an important part of losing weight.  But another part of losing weight is changing your activity level – how much you move your body.  Now, based on your answers to the quiz questions, I know that you used to exercise, but you don’t anymore.  There are lots of reasons that you may have stopped exercising.  Maybe it has to do with changes in your schedule, changes in your lifestyle, and that is all very understandable. The good news for you is just decreasing the amount of time that you are sitting still can make nearly as much a difference as actually exercising.  You could vacuum  your place, get off the bus a stop earlier and walk the extra few blocks, or jump rope with your friends.  If you are driving places, park further away or walk to your friend’s house instead of getting a ride.  Remember, the less time you spend sitting still, the better off you are.">
      <cfset Y1 ="Now one thing that may get in the way of your being as active as you like might be that you don’t have a safe place to exercise.  This is more common than you think and it is a real problem because it’s hard to go outside and exercise if you don’t feel safe there.  But there are ways around this.  There are ways to exercise indoors.  Say you live in an apartment building. Stop taking the elevator and walk up the stairs.  Say you go to a school with a lot of stairs, well – run up those steps instead of walking them.  You’re going to get out of breath at first but then you’re going to get in shape and it’s going to get easier for you. Look for places it might be safe to walk. Maybe you can go to the mall, and instead of strolling, do a few laps around the mall really quickly.  Look for places that you can naturally build exercise into your life. Try to walk fast when you walk places instead of walking slow. Walk purposefully, looking powerful, and you’re less likely to get mugged too, and you’ll be using your body and you’ll be getting more exercise.">
    <cfset Z ="Changing what you eat is probably the most important part of losing weight.  Another part of losing weight is exercise, and you do some exercise, even if it’s just walking, pretty often. That’s terrific!  Please keep this up. In fact, if you can do a little more, that would be even better. But please don’t fall into the trap of saying, “I exercised, so I can eat a whole bag of chips or drink a liter of soda.” That’s really not true. Please keep up the activity you are doing, which is so good for you in so many ways, and also, drink lots of water and eat more fruits and vegetables. This is going to work for you!">
      <cfset Z1 ="Changing what you eat is probably the most important part of losing weight.  Another part of losing weight is exercise. I know this isn't easy for you -- maybe you don't really like to exercise. The good news for you is just decreasing the amount of time that you are sitting still can make nearly as much a difference as actually exercising.  Clean your home, go for a walk with your friends, jump rope, throw a ball around. All this counts as exercise. Just move your body -- it'll feel good!">
      <!---\\End of Report results//--->
    
    Thank you <b><cfoutput>#session.username#</cfoutput></b> for taking the time to answer 
										all those questions! I used the answers 
										to give you some concrete ideas that you 
										can use to lose weight. As you make 
										changes in your lifestyle, you can take 
										the quiz again, and get a new report!<br>
										
										Let's get started:
<cfquery datasource="#datasrc#" name="quiz_results">
select * from #table_bmi_quiz# where user_name ='#session.username#'
</cfquery>    
 <br />
 <cfquery name="get_user_details" datasource="#datasrc#">
   select age from webos_users where username='#session.username#'
   </cfquery>
   <cfset age = "#get_user_details.age#"><br />	
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="98%"><b>
	<font face="Arial" size="3" color="#717EA8">
	Here's Your Personal Report</font>
    &nbsp;&nbsp;&nbsp;<img src="<cfoutput>http://#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>print_me.jpg" /><a href="javascript:window.print()">Print This Report</a></b></td>
    </tr>
   <!---\\Begin  If Logic for Displaying Results//--->
  
   <cfif #quiz_results.Q1# EQ "true" and #quiz_results.Q2# EQ "true">
   <tr>
    <td width="98%"><cfoutput> #A# <br><br></cfoutput></td></tr>
   </cfif>
   <cfif #quiz_results.Q3# EQ "true" and #quiz_results.Q4# EQ "true">
   <tr>
    <td width="98%"><cfoutput> #B# <br><br></cfoutput></td></tr>
   </cfif>
   <cfif #quiz_results.Q5# EQ "true" and #quiz_results.Q8# EQ "true" and #quiz_results.Q9# EQ "true">
  <tr>
    <td width="98%"> <cfoutput> #G# <br><br></cfoutput></td></tr>
   </cfif>  
   <cfif #quiz_results.Q5# EQ "true">
   <tr>
    <td width="98%"><cfoutput> #C# <br><br></cfoutput></td></tr>
   </cfif>
   <cfif #quiz_results.Q6# EQ "true">
   <tr>
    <td width="98%"><cfoutput> #D# <br><br></cfoutput></td></tr>
   </cfif>
   <cfif #quiz_results.Q7# EQ "true">
   <tr>
    <td width="98%"><cfoutput> #E# <br><br></cfoutput></td></tr>
   </cfif>
   <cfif #quiz_results.Q6# EQ "true" and #quiz_results.Q7# EQ "true">
   <tr>
    <td width="98%"><cfoutput> #F# <br><br></cfoutput></td></tr>
   </cfif>
   <cfif #quiz_results.Q10# EQ "true" and #quiz_results.Q11# EQ "true" and #quiz_results.Q11# EQ "true" and #quiz_results.Q13# EQ "true">
   <tr>
    <td width="98%"><cfoutput> #H# <br><br></cfoutput></td></tr>
   </cfif>
   <cfif #quiz_results.Q14# EQ "true" and #quiz_results.Q15# EQ "true">
<tr>
    <td width="98%">   <cfoutput> #I# <br><br></cfoutput></td></tr>
   </cfif>
   <cfif #quiz_results.Q17# EQ "true">
<tr>
    <td width="98%">   <cfoutput> #J# <br><br></cfoutput></td></tr>
   </cfif>
   <cfif #quiz_results.Q18# EQ "true" and #quiz_results.Q19# EQ "true">
<tr>
    <td width="98%">   <cfoutput> #K# <br><br></cfoutput></td></tr>
   </cfif>
   <cfif #quiz_results.Q20# EQ "true" and #quiz_results.Q21# EQ "true">
<tr>
    <td width="98%">   <cfoutput> #L# <br><br></cfoutput></td></tr>
   </cfif>
   <cfif #quiz_results.Q16# EQ "true" and #quiz_results.Q25# EQ "true" and #quiz_results.Q26# EQ "true" and #quiz_results.Q27# EQ "true">
<tr>
    <td width="98%">   <cfoutput> #O# <br /><br />#P#<br><br></cfoutput></td></tr>
   </cfif>
   <cfif #quiz_results.Q22# EQ "true">
<tr>
    <td width="98%">   <cfoutput> #Q# <br><br></cfoutput></td></tr>
   </cfif>
   <cfif #quiz_results.Q23# EQ "true">
<tr>
    <td width="98%">   <cfoutput> #M# <br><br></cfoutput></td></tr>
   </cfif>
   <cfif #quiz_results.Q24# EQ "true">
<tr>
    <td width="98%">   <cfoutput> #N# <br><br></cfoutput></td></tr>
   </cfif>
   <cfif #quiz_results.Q16# EQ "true" and #quiz_results.Q25# EQ "true" and #quiz_results.Q26# EQ "true" and #quiz_results.Q27# NEQ "true">
<tr>
    <td width="98%">   <cfoutput> #O# <br><br></cfoutput></td></tr>
   </cfif>
   <cfif #quiz_results.Q28# EQ "true">
<tr>
    <td width="98%">   <cfoutput> #R# <br><br></cfoutput></td></tr>
   </cfif>
   <cfif #quiz_results.Q29# EQ "true">
<tr>
    <td width="98%">   <cfoutput> #S# <br><br></cfoutput></td></tr>
   </cfif>
   <cfif #quiz_results.Q30# EQ "true">
<tr>
    <td width="98%">   <cfoutput> #T# <br><br></cfoutput></td></tr>
   </cfif>
     <cfif #quiz_results.Q33# EQ "true">
<tr>
    <td width="98%">   <cfoutput> #M# <br /><br />#V#<br><br></cfoutput></td></tr>
   </cfif>
   <cfif #quiz_results.Q31# EQ "true" and #quiz_results.Q32# EQ "true" and #quiz_results.Q34# EQ "true">
<tr>
    <td width="98%">   <cfoutput> #W# <br><br></cfoutput></td></tr>
   <cfelseif #quiz_results.Q31# EQ "true" and #quiz_results.Q32# EQ "true" and #quiz_results.Q34# NEQ "true"> 
<tr>
    <td width="98%">   <cfoutput> #U#<br><br></cfoutput></td></tr>
   </cfif>
   <cfif #quiz_results.Q35# EQ "true">
<tr>
    <td width="98%">   <cfoutput> #X# <br><br></cfoutput></td></tr>
   </cfif>
   <cfif #quiz_results.Q36# EQ "true" and #quiz_results.Q37# NEQ "true" and #quiz_results.Q38# NEQ "true">
<tr>
    <td width="98%">   <cfoutput> #Y# <br><br></cfoutput></td></tr>
   <cfelseif #quiz_results.Q37# EQ "true" and #quiz_results.Q38# EQ "true" and #quiz_results.Q39# NEQ "true"> 
<tr>
    <td width="98%">   <cfoutput> #Z#<br><br></cfoutput></td></tr>
   </cfif>
    <cfif #quiz_results.Q36# NEQ "true" and #quiz_results.Q37# NEQ "true" and #quiz_results.Q38# NEQ "true" and #quiz_results.Q39# NEQ "true">
   
   <cfelseif #quiz_results.Q36# EQ "true" and #quiz_results.Q37# EQ "true" and #quiz_results.Q38# EQ "true" and #quiz_results.Q39# EQ "true">
<tr>
    <td width="98%">   <cfoutput> #Z1# <br><br></cfoutput></td></tr>
   </cfif>
   <cfif #quiz_results.Q40# EQ "true">
<tr>
    <td width="98%">   <cfoutput> #Y# <br /><br />#Y1#<br><br></cfoutput></td></tr>
   </cfif>
   <cfif #quiz_results.Q41# EQ "true" and #quiz_results.Q42# EQ "True">
<tr>
    <td width="98%">   <cfoutput> #H# <br><br></cfoutput></td></tr>
   </cfif>
   <cfif #quiz_results.Q43# EQ "true">
<tr>
    <td width="98%">   <cfoutput> #S# <br><br></cfoutput></td></tr>
   </cfif>
   <cfif #quiz_results.Q44# EQ "true">
<tr>
    <td width="98%">   <cfoutput> #R# <br><br></cfoutput></td></tr>
   </cfif>
   <cfif #quiz_results.Q45# EQ "true">
<tr>
    <td width="98%">   <cfoutput> #C1# <br><br></cfoutput></td></tr>
   <cfelseif #quiz_results.Q45# NEQ "true">
<tr>
    <td width="98%">   <cfoutput> #C2#<br><br></cfoutput></td></tr>
   </cfif>
  		<cfif #age# GTE 13>	
        <tr>
    <td width="98%">        <cfoutput>#C3#<br><br></cfoutput></td></tr>
    </cfif>
    <cfif #age# GTE 12 and #age# LTE 17>
    <tr>
    <td width="98%">        <cfoutput>#C4#<br><br></cfoutput></td></tr>
    </cfif>				
	<cfif #age# GTE 17 and #age# LTE 19>
    <tr>
    <td width="98%">        <cfoutput>#C5#<br><br></cfoutput></td></tr>
    </cfif>	
    <cfif #age# LTE 18>
    <tr>
    <td width="98%">        <cfoutput>#C6#<br><br></cfoutput></td></tr>
    </cfif>	
        							

<tr>
    <td width="98%">   <cfoutput>#F1#<br><br></cfoutput></td></tr>
   <!---\\ end of IF logic //--->		
			<tr>
    <td width="98%"><a href="?module=bmi_profile&section=goals">Set your Personal Goals </a>>>	</td></tr>						
</table>
                                    
    </td>
  </tr>
</table>
  <cfelseif #url.section# EQ "goals">
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50%" height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">Set Your Personal Goals</td>
    <td width="50%" align="right" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>step2.gif" width="87" height="27" /></td>
  </tr>
  <tr>
    <td colspan="2">
     <cfquery name="get_user_details" datasource="#datasrc#">
   select age from webos_users where username='#session.username#'
   </cfquery>
   <cfset age = "#get_user_details.age#">
    <form method="POST" action="?module=<cfoutput>#module#</cfoutput>&action=process_goals">
    <input type="hidden" name="username" value="<cfoutput>#session.username#</cfoutput>">
    <input type="hidden" name="age" value="<cfoutput>#age#</cfoutput>">
    <table width="95%" border="1" align="center" cellpadding="3" bordercolor="#C4D5EC" id="table1" style="border-collapse: collapse">
<tr>
																	<td bgcolor="#A2BDE1" colspan="2">
																	<p align="center">
																	<span style="letter-spacing: 10px">
																	<font face="Verdana">
																	Setting 
																	One's Goals</font></span></td>
																</tr>
																<tr>
																	<td bgcolor="#F0F4FB" width="404">&nbsp;
										</td>
																	<td bgcolor="#F0F4FB" width="212">&nbsp;
																	</td>
																</tr>
																<tr>
																	<td bgcolor="#F0F4FB" width="404">
										<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">
																	a. I will 
										make an appointment with my doctor 
										within 2-3 weeks to discuss the 
										possibility of sleep apnea.<br>
&nbsp;</font></td>
																	<td bgcolor="#F0F4FB" width="212">
																	<input type="radio" value="True" name="A"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">YES</font><font face="Verdana">&nbsp;&nbsp;</font></td>
																</tr>
																<tr>
																	<td bgcolor="#EBF0FA" width="404">
										<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">
										b. I will make an appointment with my 
										doctor to discuss polycystic ovarian 
										syndrome within the next 1-2 months.<br>
&nbsp;</font></td>
																	<td bgcolor="#EBF0FA" width="212">
																	<input type="radio" value="True" name="B"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">YES</font><font face="Verdana">&nbsp;&nbsp;</font></td>
																</tr>
																<tr>
																	<td bgcolor="#F0F4FB" width="404">
																	<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">
																	c. I will 
																	make an 
																	appointment 
																	to have 
																	myself 
																	tested for 
																	diabetes and 
																	I will try 
																	to eat 
																	sugary foods 
																	only once a 
																	day from now 
																	on.<br>
&nbsp;</font></td>
																	<td bgcolor="#F0F4FB" width="212">
																	<input type="radio" value="True" name="C"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">YES</font><font face="Verdana">&nbsp;&nbsp;</font></td>
																</tr>
																<tr>
																	<td bgcolor="#EBF0FA" width="404">
																	<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">
																	d. I will 
																	make an 
																	appointment 
																	to have my 
																	blood 
																	pressure 
																	checked by 
																	my doctor or 
																	I will go in 
																	to see my 
																	school nurse 
																	to have my 
																	blood 
																	pressure 
																	checked.<br>
										&nbsp;</font></td>
																	<td bgcolor="#EBF0FA" width="212">
																	<input type="radio" value="True" name="D"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">YES</font><font face="Verdana">&nbsp;&nbsp;</font></td>
																</tr>
																<tr>
																	<td bgcolor="#F0F4FB" width="404">
										<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">
																	e. I will 
										eat meat 3 times a week or less and will 
										eat a fruit or a vegetable every day 
										this week.<br>
										&nbsp;</font></td>
																	<td bgcolor="#F0F4FB" width="212">
																	<input type="radio" value="True" name="E"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">YES</font><font face="Verdana">&nbsp;&nbsp;</font></td>
																</tr>
																<tr>
																	<td bgcolor="#EBF0FA" width="404">
										<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">
										f. I will make an appointment to have my 
										blood pressure checked by my doctor or I 
										will go in to see my school nurse to 
										have my blood pressure checked. I will 
										eat meat 3 times a week or less and will 
										eat a fruit or a vegetable every day 
										this week.<br>
										&nbsp;</font></td>
																	<td bgcolor="#EBF0FA" width="212">
																	<input type="radio" value="True" name="F"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">YES</font><font face="Verdana">&nbsp;&nbsp;</font></td>
																</tr>
																<tr>
																	<td bgcolor="#F0F4FB" width="404">
										<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">
										g. I will make an appointment to have 
										myself tested for diabetes and I will 
										try to eat sugary foods only once a day 
										from now on.<br>
										&nbsp;</font></td>
																	<td bgcolor="#F0F4FB" width="212">
																	<input type="radio" value="True" name="G"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">YES</font><font face="Verdana">&nbsp;&nbsp;</font></td>
																</tr>
																<tr>
																	<td bgcolor="#EBF0FA" width="404">
										<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">
										h. I will watch television, play video games or use my computer 3 hours or less each day.<br>
&nbsp;</font></td>
																	<td bgcolor="#EBF0FA" width="212">
																	<input type="radio" value="True" name="H"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">YES</font><font face="Verdana">&nbsp;&nbsp;</font></td>
																</tr>
																<tr>
																	<td bgcolor="#F0F4FB" width="404">
										<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">
										i. I will eat 1 fruit or vegetable every day of the week for this week.<br>
										&nbsp;</font></td>
																	<td bgcolor="#F0F4FB" width="212">
																	<input type="radio" value="True" name="I"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">YES</font><font face="Verdana">&nbsp;&nbsp;</font></td>
																</tr>
																<tr>
																	<td bgcolor="#EBF0FA" width="404">
																	<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">
																	j. I will 
																	have 3 low 
																	fat servings 
																	of dairy 
																	each day, 
																	whether it 
																	is low fat 
																	milk, low 
																	fat or non 
																	fat yogurt 
																	or low fat 
																	cheese.<br>
&nbsp;</font></td>
																	<td bgcolor="#EBF0FA" width="212">
																	<input type="radio" value="True" name="J"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">YES</font><font face="Verdana">&nbsp;&nbsp;</font></td>
																</tr>
																<tr>
																	<td bgcolor="#F0F4FB" width="404">
																	<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">
																	k. I will 
																	buy 1% or 2% 
																	milk instead 
																	of whole 
																	milk this 
																	week.<br>
&nbsp;</font></td>
																	<td bgcolor="#F0F4FB" width="212">
																	<input type="radio" value="True" name="K"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">YES</font><font face="Verdana">&nbsp;&nbsp;</font></td>
																</tr>
																<tr>
																	<td bgcolor="#EBF0FA" width="404">
																	<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">
																	l. I will 
																	drink water 
																	and diet 
																	soda instead 
																	of sweetened 
																	drinks.<br>
&nbsp;</font></td>
																	<td bgcolor="#EBF0FA" width="212">
																	<input type="radio" value="True" name="L"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">YES</font><font face="Verdana">&nbsp;&nbsp;</font></td>
																</tr>
																<tr>
																	<td bgcolor="#F0F4FB" width="404">
																	<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">
																	m. I will 
																	eat 
																	breakfast 
																	most days of 
																	the week. </font><br>
&nbsp;</td>
																	<td bgcolor="#F0F4FB" width="212">
																	<input type="radio" value="True" name="M"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">YES</font><font face="Verdana">&nbsp;&nbsp;</font></td>
																</tr>
																<tr>
																	<td bgcolor="#EBF0FA" width="404">
																	<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">
																	n. I will 
																	eat a meal 
																	at least 2-3 
																	times this 
																	coming week 
																	with my 
																	parents or 
																	guardian.<br>
&nbsp;</font></td>
																	<td bgcolor="#EBF0FA" width="212">
																	<input type="radio" value="True" name="N"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">YES</font><font face="Verdana">&nbsp;&nbsp;</font></td>
																</tr>
																<tr>
																	<td bgcolor="#F0F4FB" width="404">
																	<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">
																	o. I will 
																	save money 
																	by packing 
																	my own 
																	school 
																	lunches and 
																	avoiding 
																	fast food 
																	restaurants 
																	and corner 
																	stores.<br>
										&nbsp;</font></td>
																	<td bgcolor="#F0F4FB" width="212">
																	<input type="radio" value="True" name="O"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">YES</font><font face="Verdana">&nbsp;&nbsp;</font></td>
																</tr>
																<tr>
																	<td bgcolor="#EBF0FA" width="404">
																	<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">
																	q. I will 
																	talk to my 
																	parents or 
																	guardians 
																	about 
																	shopping 
																	more often 
																	for food so 
																	that I can 
																	have healthy 
																	foods in the 
																	house.<br>
&nbsp;</font></td>
																	<td bgcolor="#EBF0FA" width="212">
																	<input type="radio" value="True" name="Q"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">YES</font><font face="Verdana">&nbsp;&nbsp;</font></td>
																</tr>
																<tr>
																	<td bgcolor="#F0F4FB" width="404">
																	<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">
																	r. I will 
																	eat in a 
																	fast food 
																	restaurant 
																	no more than 
																	1 time this 
																	week.<br>
										&nbsp;</font></td>
																	<td bgcolor="#F0F4FB" width="212">
																	<input type="radio" value="True" name="R"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">YES</font><font face="Verdana">&nbsp;&nbsp;</font></td>
																</tr>
																<tr>
																	<td bgcolor="#EBF0FA" width="404">
																	<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">
																	s. I will 
																	shop for 
																	snacks at a 
																	corner store 
																	or 
																	convenience 
																	mart only 1 
																	time this 
																	week.<br>
&nbsp;</font></td>
																	<td bgcolor="#EBF0FA" width="212">
																	<input type="radio" value="True" name="S"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">YES</font><font face="Verdana">&nbsp;&nbsp;</font></td>
																</tr>
																<tr>
																	<td bgcolor="#F0F4FB" width="404">
																	<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">
																	t. I will 
																	talk to 
																	either my 
																	parents, 
																	guardians, 
																	school 
																	counselor, 
																	doctor or 
																	religious 
																	leader about 
																	getting 
																	counseling 
																	to help me 
																	with my 
																	feelings.<br>
										&nbsp;</font></td>
																	<td bgcolor="#F0F4FB" width="212">
																	<input type="radio" value="True" name="T"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">YES</font><font face="Verdana">&nbsp;&nbsp;</font></td>
																</tr>
																<tr>
																	<td bgcolor="#EBF0FA" width="404">
																	<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">
																	u, I will 
																	make an 
																	appointment 
																	with my 
																	doctor find 
																	out if I may 
																	need help 
																	for a 
																	possible 
																	eating. 
																	disorder.<br>
&nbsp;</font></td>
																	<td bgcolor="#EBF0FA" width="212">
																	<input type="radio" value="True" name="U"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">YES</font><font face="Verdana">&nbsp;&nbsp;</font></td>
																</tr>
																<tr>
																	<td bgcolor="#F0F4FB" width="404">
																	<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">
																	v. I will 
																	eat 3 meals 
																	a day.<br>
										&nbsp;</font></td>
																	<td bgcolor="#F0F4FB" width="212">
																	<input type="radio" value="True" name="V"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">YES</font><font face="Verdana">&nbsp;&nbsp;</font></td>
																</tr>
																<tr>
																	<td bgcolor="#EBF0FA" width="404">
																	<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">
																	w. I will 
																	make an 
																	appointment 
																	with my 
																	doctor find 
																	out if I may 
																	need help 
																	for a 
																	possible 
																	eating. 
																	disorder.<br>
										&nbsp;</font></td>
																	<td bgcolor="#EBF0FA" width="212">
																	<input type="radio" value="True" name="W"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">YES</font><font face="Verdana">&nbsp;&nbsp;</font></td>
																</tr>
																<tr>
																	<td bgcolor="#F0F4FB" width="404">
																	<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">
																	x. I will 
																	discuss any 
																	medications 
																	that I have 
																	taken to 
																	lose weight 
																	with my 
																	doctor to 
																	find out if 
																	they are 
																	safe.<br>
										&nbsp;</font></td>
																	<td bgcolor="#F0F4FB" width="212">
																	<input type="radio" value="True" name="X"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">YES</font><font face="Verdana">&nbsp;&nbsp;</font></td>
																</tr>
																<tr>
																	<td bgcolor="#EBF0FA" width="404">
																	<font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">
																	y. I will 
																	figure out 
																	an activity 
																	that I can 
																	do that I 
																	don’t 
																	usually 
																	think of as 
																	exercise, 
																	but might 
																	get my body 
																	moving a 
																	little, like 
																	vacuuming, 
																	cleaning my 
																	home, 
																	jumping 
																	rope, 
																	walking 
																	quickly to 
																	get 
																	someplace I 
																	need to go, 
																	or something 
																	similar. I 
																	will do that 
																	at least 
																	twice this 
																	week.<br>
										&nbsp;</font></td>
																	<td bgcolor="#EBF0FA" width="212">
																	<input type="radio" value="True" name="Y"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#001C55">YES</font><font face="Verdana">&nbsp;&nbsp;</font></td>
																</tr>
																<tr>
																	<td bgcolor="#EBF0FA" colspan="2">&nbsp;</td>
																</tr>
			</table>
            	<input type="submit" value="Save My Goals" name="B1" style="font-size: 10px"><input type="reset" value="Reset" name="B2" style="font-size: 10px">
                                                            </form>
    </td>
  </tr>
</table>
 
  <cfelseif #url.section# EQ "progress_log">
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50%" height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">Your Progress Log</td>
    <td width="50%" align="right" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title"><img src="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>step3.gif" width="87" height="27" /></td>
  </tr>
  <tr>
    <td colspan="2"><cfif #session.allowin# EQ "No">
    You'll need to register first, which will create your profile, and then take you to our quiz.
    
    <script type="text/javascript">
<!--
function delayer(){
	document.location = "http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=users&section=register"
}
//-->
</script>
<script>
setTimeout('delayer()', 3000);
</script>
    <cfelseif session.allowin EQ "Yes">
   <cfquery name="retrieve_logs" datasource="#datasrc#">
   select * from #table_bmi_log# where username='#session.username#'
   </cfquery>
   <cfquery name="get_goals" datasource="#datasrc#">
select * from #table_bmi_goals# where username='#session.username#'
</cfquery>
   <cfif get_goals.recordcount NEQ "0">
These are terrific goals, and I am thrilled that you are ready to make these changes. You 
can do it! These goals will be entered into your log book, so you can keep track of how you are doing.  <br /><br />
</cfif>
<form name="progress_log" action="?module=<cfoutput>#module#</cfoutput>&action=process_plog" method="post">
<input type="hidden" name="username" value="<cfoutput>#session.username#</cfoutput>">
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#C4D5EC" id="table1" style="border-collapse: collapse">
<tr>
																	<td bgcolor="#C0C02B" colspan="2">
																	<p align="center">
																	<span style="letter-spacing: 10px">
																	<font face="Verdana" style="font-size: 9pt">
																	LOGBOOK</font></span></td>
																</tr>
																<tr>
																	<td bgcolor="#E7E7B0" width="404">&nbsp;
										</td>
																	<td bgcolor="#E7E7B0" width="212">Last Updated: <cfif #retrieve_logs.last_updated# EQ ""><i>Never</i><cfelse><i><b><cfoutput>#dateformat(retrieve_logs.last_updated, "MM/DD/YYYY")#</b></i></cfoutput></cfif>
																	</td>
																</tr>

<cfif #get_goals.recordcount# EQ "0">
<tr>
  <td colspan="2" bgcolor="#EBF0FA">
You Don't have any entries in your progress log. Go to <a href="?module=bmi_profile&amp;section=goals">Step2</a> and setup your Goals</td>
</tr>
<cfelseif #get_goals.recordcount# NEQ "0">

<cfif #get_goals.ARule# EQ "true">
<cfset a ="a. I will make an appointment with my doctor within 2-3 weeks to discuss the possibility of sleep apnea.">
<cfset aa = "aa. I have made an appointment to meet with my doctor.">
<tr><td width="60%" valign="top" bgcolor="#EBF0FA"><b>Original Goal:</b> <i><cfoutput>#a#</cfoutput></i><br /><br />
<cfoutput>#aa#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.AAcriterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.AAcriterion# NEQ "true">
<input type="radio" value="true" name="AAcriterion">Yes &nbsp; <input type="radio" value="false" name="AAcriterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
</cfif>
<cfif #get_goals.BRule# EQ "true">
<cfset b ="b. I will make an appointment with my doctor to discuss polycystic ovarian syndrome within the next 1-2 months.">
<cfset bb = "bb. I have made an appointment to meet with my doctor to discuss polycystic ovarian syndrome.">
<tr><td width="60%" valign="top" bgcolor="#EBF0FA"><b>Original Goal:</b> <i><cfoutput>#b#</cfoutput></i><br /><br />
<cfoutput>#bb#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.BBcriterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.BBcriterion# NEQ "true">
<input type="radio" value="true" name="BBcriterion">Yes &nbsp; <input type="radio" value="false" name="BBcriterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
</cfif>
<cfif #get_goals.CRule# EQ "true">
<cfset c ="c. I will make an appointment to have myself tested for diabetes and I will try to eat sugary foods only once a day from now on.">
<cfset cc = "cc. I have made an appointment to meet with my doctor to be tested for diabetes.">
<cfset cc2 = "cc2. I have eaten sugary foods 4 times a day or more this week.">
<cfset cc3 = "cc3. I have eaten sugary foods 2-3 times a day this week.">
<cfset cc4 = "cc4. I have eaten sugary foods once a day or less this week.">
<tr><td width="60%" valign="top" bgcolor="#EBF0FA"><b>Original Goal:</b> <i><cfoutput>#c#</cfoutput></i><br /><br />
<cfoutput>#cc#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.CCcriterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.CCcriterion# NEQ "true">
<input type="radio" value="true" name="CCcriterion">Yes &nbsp; <input type="radio" value="false" name="CCcriterion">No
</cfif>
</td>
</tr>
<tr><td width="60%" valign="top" bgcolor="#EBF0FA">
<br /><cfoutput>#cc2#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.CCcriterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.CC2criterion# NEQ "true">
<input type="radio" value="true" name="CC2criterion">Yes &nbsp; <input type="radio" value="false" name="CC2criterion">No
</cfif>
</td>
</tr>
<tr><td width="60%" valign="top" bgcolor="#EBF0FA">
<br /><cfoutput>#cc3#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.CC3criterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.CC3criterion# NEQ "true">
<input type="radio" value="true" name="CC3criterion">Yes &nbsp; <input type="radio" value="false" name="CC3criterion">No
</cfif>
</td>
</tr>
<tr><td width="60%" valign="top" bgcolor="#EBF0FA">
<cfoutput>#cc4#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.CC4criterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.CC4criterion# NEQ "true">
<input type="radio" value="true" name="CC4criterion">Yes &nbsp; <input type="radio" value="false" name="CC4criterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
</cfif>
<cfif #get_goals.DRule# EQ "true" and #get_goals.fRule# neq "true">
<cfset d ="d. I will make an appointment to have my blood pressure checked by my doctor or I will go in to see my school nurse to have my blood pressure checked.">
<cfset dd = "dd. I had my blood pressure checked recently.">
<tr><td width="60%" valign="top" bgcolor="#EBF0FA"><b>Original Goal:</b> <i><cfoutput>#d#</cfoutput></i><br /><br />
<cfoutput>#dd#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.DDcriterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.DDcriterion# NEQ "true">
<input type="radio" value="true" name="DDcriterion">Yes &nbsp; <input type="radio" value="false" name="DDcriterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
</cfif>
<cfif #get_goals.ERule# EQ "true">
<cfset e ="e. I will eat meat 3 times a week or less and will eat a fruit or a vegetable every day this week.">
<cfset ee = "ee. I have eaten a fruit or vegetable every day this week, or nearly every day.">
<cfset ee2 = "ee2. I have eaten a fruit or vegetable only a couple of times or less this week.">
<tr><td width="60%" valign="top" bgcolor="#EBF0FA"><b>Original Goal:</b> <i><cfoutput>#e#</cfoutput></i><br /><br />
<cfoutput>#ee#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.EEcriterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.EEcriterion# NEQ "true">
<input type="radio" value="true" name="EEcriterion">Yes &nbsp; <input type="radio" value="false" name="EEcriterion">No
</cfif>
</td>
</tr>
<tr><td width="60%" valign="top" bgcolor="#EBF0FA"><br />
<cfoutput>#ee2#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.EE2criterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.EE2criterion# NEQ "true">
<input type="radio" value="true" name="EE2criterion">Yes &nbsp; <input type="radio" value="false" name="EE2criterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
</cfif>
<cfif #get_goals.FRule# EQ "true">
<cfset f ="f. I will make an appointment to have my blood pressure checked by my doctor or I will go in to see my school nurse to have my blood pressure checked.">
<cfset ff = "ff. I had my blood pressure checked recently.">
<cfset f2 = "f2. I will eat meat 3 times a week or less and will eat a fruit or a vegetable every day this week.">
<cfset ff2 = "ff2. I have eaten a fruit or vegetable every day this week, or nearly every day.">
<cfset ff3 = "ff3. I have eaten a fruit or vegetable only a couple of times or less this week.">
<tr><td width="60%" valign="top" bgcolor="#EBF0FA"><b>Original Goal:</b> <i><cfoutput>#f#</cfoutput></i><br /><br />
<cfoutput>#f2#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.FFcriterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.FFcriterion# NEQ "true">
<input type="radio" value="true" name="FFcriterion">Yes &nbsp; <input type="radio" value="false" name="FFcriterion">No
</cfif>
</td>
</tr>
<tr><td width="60%" valign="top" bgcolor="#EBF0FA">
<br /><cfoutput>#ff2#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.FF2criterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.FF2criterion# NEQ "true">
<input type="radio" value="true" name="FF2criterion">Yes &nbsp; <input type="radio" value="false" name="FF2criterion">No
</cfif>
</td>
</tr>
<tr><td width="60%" valign="top" bgcolor="#EBF0FA">
<br /><cfoutput>#FF3#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.FF3criterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.FF3criterion# NEQ "true">
<input type="radio" value="true" name="FF3criterion">Yes &nbsp; <input type="radio" value="false" name="FF3criterion">No
</cfif>
</td>
</tr>

<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
</cfif>
<cfif #get_goals.GRule# EQ "true" and #get_goals.Crule# NEQ "true">
<cfset g ="g. I will make an appointment to have myself tested for diabetes and I will try to eat sugary foods only once a day from now on.">
<cfset gg = "gg. I have made an appointment to meet with my doctor to be tested for diabetes.">
<cfset gg2 = "gg2. I have eaten sugary foods 4 times a day or more this week.">
<cfset gg3 = "gg3. I have eaten sugary foods 2-3 times a day this week.">
<cfset gg4 = "gg4. I have eaten sugary foods once a day or less this week.">
<tr><td width="60%" valign="top" bgcolor="#EBF0FA"><b>Original Goal:</b> <i><cfoutput>#g#</cfoutput></i><br /><br />
<cfoutput>#gg#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.GGcriterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.GGcriterion# NEQ "true">
<input type="radio" value="true" name="GGcriterion">Yes &nbsp; <input type="radio" value="false" name="GGcriterion">No
</cfif>
</td>
</tr>
<tr><td width="60%" valign="top" bgcolor="#EBF0FA">
<br /><cfoutput>#gg2#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.GG2criterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.GG2criterion# NEQ "true">
<input type="radio" value="true" name="GG2criterion">Yes &nbsp; <input type="radio" value="false" name="GG2criterion">No
</cfif>
</td>
</tr>
<tr><td width="60%" valign="top" bgcolor="#EBF0FA">
<br /><cfoutput>#gg3#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.gg3criterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.gg3criterion# NEQ "true">
<input type="radio" value="true" name="gg3criterion">Yes &nbsp; <input type="radio" value="false" name="gg3criterion">No
</cfif>
</td>
</tr>
<tr><td width="60%" valign="top" bgcolor="#EBF0FA">
<cfoutput>#gg4#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.gg4criterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.gg4criterion# NEQ "true">
<input type="radio" value="true" name="gg4criterion">Yes &nbsp; <input type="radio" value="false" name="gg4criterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
</cfif>
<cfif #get_goals.HRule# EQ "true">
<cfset h ="h. I will watch television, play video games or use my computer 3 hours or less each day.">
<cfset hh = "hh. I watched television more than 3 hours a day most days this past week.">
<cfset hh2 = "hh2. I watched television/video games/computer time 3 or less hours most days this week.">
<tr><td width="60%" valign="top" bgcolor="#EBF0FA"><b>Original Goal:</b> <i><cfoutput>#h#</cfoutput></i><br /><br />
<cfoutput>#hh#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.HHcriterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.HHcriterion# NEQ "true">
<input type="radio" value="true" name="BBcriterion">Yes &nbsp; <input type="radio" value="false" name="BBcriterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
<tr><td width="60%" valign="top" bgcolor="#EBF0FA"><br />
<cfoutput>#hh2#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.HH2criterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.HH2criterion# NEQ "true">
<input type="radio" value="true" name="hh2criterion">Yes &nbsp; <input type="radio" value="false" name="hh2criterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
</cfif>
<cfif #get_goals.IRule# EQ "true" and #get_goals.FRule# NEQ "true">
<cfset i ="i. I will eat 1 fruit or vegetable every day of the week for this week.">
<cfset ii = "ii. I have eaten a fruit or vegetable every day this week, or nearly every day.">
<cfset ii2 = "ii2. I have eaten a fruit or vegetable only a couple of times or less this week.">
<tr><td width="60%" valign="top" bgcolor="#EBF0FA"><b>Original Goal:</b> <i><cfoutput>#i#</cfoutput></i><br /><br />
<cfoutput>#ii#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.iicriterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.iicriterion# NEQ "true">
<input type="radio" value="true" name="iicriterion">Yes &nbsp; <input type="radio" value="false" name="iicriterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
<tr><td width="60%" valign="top" bgcolor="#EBF0FA">
<cfoutput>#ii2#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.ii2criterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.ii2criterion# NEQ "true">
<input type="radio" value="true" name="ii2criterion">Yes &nbsp; <input type="radio" value="false" name="ii2criterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
</cfif>
<cfif #get_goals.JRule# EQ "true">
<cfset j ="j. I will have 3 low fat servings of dairy each day, whether it is low fat milk, low fat or non fat yogurt or low fat cheese.">
<cfset jj = "jj. I had 1 serving of low fat dairy or less each day this past week.">
<cfset jj2 ="jj2. I had 2 & 3 servings of low fat dairy, nearly every day this past week.">
<tr><td width="60%" valign="top" bgcolor="#EBF0FA"><b>Original Goal:</b> <i><cfoutput>#j#</cfoutput></i><br /><br />
<cfoutput>#jj#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.jjcriterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.jjcriterion# NEQ "true">
<input type="radio" value="true" name="jjcriterion">Yes &nbsp; <input type="radio" value="false" name="jjcriterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
<tr><td width="60%" valign="top" bgcolor="#EBF0FA">
<cfoutput>#jj2#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.jj2criterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.jj2criterion# NEQ "true">
<input type="radio" value="true" name="jj2criterion">Yes &nbsp; <input type="radio" value="false" name="jj2criterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
</cfif>
<cfif #get_goals.KRule# EQ "true">
<cfset k ="k. I will buy 1% or 2% milk instead of whole milk this week.">
<cfset kk = "kk2. This past week I had lower fat milk and did not have whole milk.">
<tr><td width="60%" valign="top" bgcolor="#EBF0FA"><b>Original Goal:</b> <i><cfoutput>#k#</cfoutput></i><br /><br />
<cfoutput>#kk#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.KKcriterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.KKcriterion# NEQ "true">
<input type="radio" value="true" name="KKcriterion">Yes &nbsp; <input type="radio" value="false" name="KKcriterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
</cfif>
<cfif #get_goals.LRule# EQ "true">
<cfset l ="l. I will drink water and diet soda instead of sweetened drinks.">
<cfset ll = "ll. I drank 2 or more sweetened drinks each day this past week.">
<cfset ll2 ="ll2. I never drank more than one sweetened drink each day this past week.">
<tr><td width="60%" valign="top" bgcolor="#EBF0FA"><b>Original Goal:</b> <i><cfoutput>#l#</cfoutput></i><br /><br />
<cfoutput>#ll#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.jjcriterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.jjcriterion# NEQ "true">
<input type="radio" value="true" name="llcriterion">Yes &nbsp; <input type="radio" value="false" name="llcriterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
<tr><td width="60%" valign="top" bgcolor="#EBF0FA">
<cfoutput>#ll2#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.ll2criterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.ll2criterion# NEQ "true">
<input type="radio" value="true" name="ll2criterion">Yes &nbsp; <input type="radio" value="false" name="ll2criterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
</cfif>
<cfif #get_goals.MRule# EQ "true">
<cfset m ="m. I will eat breakfast most days of the week.">
<cfset mm = "mm. I never or almost never ate breakfast this past week.">
<cfset mm2 ="mm2. I ate breakfast most days this past week.">
<tr><td width="60%" valign="top" bgcolor="#EBF0FA"><b>Original Goal:</b> <i><cfoutput>#m#</cfoutput></i><br /><br />
<cfoutput>#mm#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.mmcriterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.mmcriterion# NEQ "true">
<input type="radio" value="true" name="mmcriterion">Yes &nbsp; <input type="radio" value="false" name="mmcriterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
<tr><td width="60%" valign="top" bgcolor="#EBF0FA">
<cfoutput>#mm2#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.mm2criterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.mm2criterion# NEQ "true">
<input type="radio" value="true" name="mm2criterion">Yes &nbsp; <input type="radio" value="false" name="mm2criterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
</cfif>
<cfif #get_goals.NRule# EQ "true">
<cfset n ="n. I will eat a meal at least 2-3 times this coming week with my parents or guardian.">
<cfset nn = "nn. I did not eat with my parents or guardian at all or almost not at all this past week.">
<cfset nn2 ="nn2. I ate a few meals with my parents or guardian this past week.">
<tr><td width="60%" valign="top" bgcolor="#EBF0FA"><b>Original Goal:</b> <i><cfoutput>#n#</cfoutput></i><br /><br />
<cfoutput>#nn#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.nncriterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.nncriterion# NEQ "true">
<input type="radio" value="true" name="nncriterion">Yes &nbsp; <input type="radio" value="false" name="nncriterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
<tr><td width="60%" valign="top" bgcolor="#EBF0FA">
<cfoutput>#nn2#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.nn2criterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.nn2criterion# NEQ "true">
<input type="radio" value="true" name="nn2criterion">Yes &nbsp; <input type="radio" value="false" name="nn2criterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
</cfif>
<cfif #get_goals.ORule# EQ "true">
<cfset o ="o. I will save money by packing my own school lunches and avoiding fast food restaurants and corner stores.">
<cfset oo = "oo. I packed my own lunches most days this week.">
<tr><td width="60%" valign="top" bgcolor="#EBF0FA"><b>Original Goal:</b> <i><cfoutput>#o#</cfoutput></i><br /><br />
<cfoutput>#oo#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.OOcriterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.OOcriterion# NEQ "true">
<input type="radio" value="true" name="OOcriterion">Yes &nbsp; <input type="radio" value="false" name="oocriterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
</cfif>
<cfif #get_goals.QRule# EQ "true">
<cfset q ="q. I will talk to my parents or guardians about shopping more often for food so that I can have healthy foods in the house.">
<cfset qq = "qq. I talked to my parents or guardian about shopping more often so that I can have healthy foods in the house.">
<tr><td width="60%" valign="top" bgcolor="#EBF0FA"><b>Original Goal:</b> <i><cfoutput>#q#</cfoutput></i><br /><br />
<cfoutput>#qq#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.QQcriterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.QQcriterion# NEQ "true">
<input type="radio" value="true" name="qqcriterion">Yes &nbsp; <input type="radio" value="false" name="qqcriterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
</cfif>
<cfif #get_goals.RRule# EQ "true">
<cfset r ="r. I will eat in a fast food restaurant no more than 1 time this week.">
<cfset rr = "rr. I ate in a fast food restaurant very often this past week.">
<cfset rr2 ="rr2. For the most part, I did not eat in a fast food restaurant this past week.">
<tr><td width="60%" valign="top" bgcolor="#EBF0FA"><b>Original Goal:</b> <i><cfoutput>#r#</cfoutput></i><br /><br />
<cfoutput>#rr#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.rrcriterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.rrcriterion# NEQ "true">
<input type="radio" value="true" name="rrcriterion">Yes &nbsp; <input type="radio" value="false" name="rrcriterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
<tr><td width="60%" valign="top" bgcolor="#EBF0FA">
<cfoutput>#rr2#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.rr2criterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.rr2criterion# NEQ "true">
<input type="radio" value="true" name="rr2criterion">Yes &nbsp; <input type="radio" value="false" name="rr2criterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
</cfif>
<cfif #get_goals.SRule# EQ "true">
<cfset s ="s. I will shop for snacks at a corner store or convenience mart only 1 time this week.">
<cfset ss = "ss. I shopped at a corner for snacks nearly every day this past week.">
<cfset ss2 ="ss2. For the most part, I did not shop at a corner store for snacks this past week.">
<tr><td width="60%" valign="top" bgcolor="#EBF0FA"><b>Original Goal:</b> <i><cfoutput>#s#</cfoutput></i><br /><br />
<cfoutput>#ss#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.sscriterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.sscriterion# NEQ "true">
<input type="radio" value="true" name="scriterion">Yes &nbsp; <input type="radio" value="false" name="sscriterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
<tr><td width="60%" valign="top" bgcolor="#EBF0FA">
<cfoutput>#ss2#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.ss2criterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.ss2criterion# NEQ "true">
<input type="radio" value="true" name="ss2criterion">Yes &nbsp; <input type="radio" value="false" name="ss2criterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
</cfif>
<cfif #get_goals.TRule# EQ "true">
<cfset t ="t. I will talk to either my parents, guardians, school counselor, doctor or religious leader about getting counseling to help me with my feelings.">
<cfset tt = "tt. I talked to either my parents, guardians, school counselor, doctor or religious leader about getting counseling to help me with my feelings.">
<tr><td width="60%" valign="top" bgcolor="#EBF0FA"><b>Original Goal:</b> <i><cfoutput>#t#</cfoutput></i><br /><br />
<cfoutput>#tt#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.ttcriterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.ttcriterion# NEQ "true">
<input type="radio" value="true" name="ttcriterion">Yes &nbsp; <input type="radio" value="false" name="ttcriterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
</cfif>
<cfif #get_goals.URule# EQ "true">
<cfset u ="u. I will make an appointment with my doctor find out if I may need help for a possible eating disorder.">
<cfset uu = "uu. I made an appointment with my doctor to find out if I may need help for a possible eating disorder.">
<tr><td width="60%" valign="top" bgcolor="#EBF0FA"><b>Original Goal:</b> <i><cfoutput>#u#</cfoutput></i><br /><br />
<cfoutput>#uu#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.UUcriterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.UUcriterion# NEQ "true">
<input type="radio" value="true" name="uucriterion">Yes &nbsp; <input type="radio" value="false" name="uucriterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
</cfif>
<cfif #get_goals.VRule# EQ "true">
<cfset v ="v. I will eat 3 meals a day.">
<cfset vv = "vv. This past week, I mostly ate 3 meals a day.">
<cfset vv2 ="vv2. This past week, I skipped a lot of meals.">
<tr><td width="60%" valign="top" bgcolor="#EBF0FA"><b>Original Goal:</b> <i><cfoutput>#r#</cfoutput></i><br /><br />
<cfoutput>#vv#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.vvcriterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.vvcriterion# NEQ "true">
<input type="radio" value="true" name="vvcriterion">Yes &nbsp; <input type="radio" value="false" name="vvcriterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
<tr><td width="60%" valign="top" bgcolor="#EBF0FA">
<cfoutput>#vv2#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.vv2criterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.vv2criterion# NEQ "true">
<input type="radio" value="true" name="vv2criterion">Yes &nbsp; <input type="radio" value="false" name="vv2criterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
</cfif>
<cfif #get_goals.WRule# EQ "true">
<cfset w ="w. I will make an appointment with my doctor find out if I may need help for a possible eating disorder.">
<cfset ww = "ww. I made an appointment with my doctor to find out if I may need help for a possible eating disorder.">
<tr><td width="60%" valign="top" bgcolor="#EBF0FA"><b>Original Goal:</b> <i><cfoutput>#w#</cfoutput></i><br /><br />
<cfoutput>#ww#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.WWcriterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.WWcriterion# NEQ "true">
<input type="radio" value="true" name="wwcriterion">Yes &nbsp; <input type="radio" value="false" name="wwcriterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
</cfif>
<cfif #get_goals.XRule# EQ "true">
<cfset x ="x. I will discuss any medications that I have taken to lose weight with my doctor to find out if they are safe.">
<cfset xx = "xx. I have discussed any medications that I have taken to lose weight with my doctor to find out if they are safe.">
<tr><td width="60%" valign="top" bgcolor="#EBF0FA"><b>Original Goal:</b> <i><cfoutput>#x#</cfoutput></i><br /><br />
<cfoutput>#xx#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.xxcriterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.xxcriterion# NEQ "true">
<input type="radio" value="true" name="xxcriterion">Yes &nbsp; <input type="radio" value="false" name="xxcriterion">No
</cfif>
</td>
</tr>
<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
</cfif>
<cfif #get_goals.FRule# EQ "true">
<cfset y ="y. I will figure out an activity that I can do that I don't usually think of as exercise, but might get my body moving a little, like vacuuming, cleaning my home, jumping rope, walking quickly to get someplace I need to go, or something similar.  I will do that at least twice this week.">
<cfset yy = "yy. I have found something that makes me move but I  have not done it yet.">
<cfset yy2 = "yy2. I have found something that makes me move, and I did it once this past week.">
<cfset yy3 = "yy3. I have found something that makes me move and I have done it 2 or more times this week.">
<tr><td width="60%" valign="top" bgcolor="#EBF0FA"><b>Original Goal:</b> <i><cfoutput>#y#</cfoutput></i><br /><br />
<cfoutput>#yy2#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.YYcriterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.YYcriterion# NEQ "true">
<input type="radio" value="true" name="YYcriterion">Yes &nbsp; <input type="radio" value="false" name="YYcriterion">No
</cfif>
</td>
</tr>
<tr><td width="60%" valign="top" bgcolor="#EBF0FA">
<br /><cfoutput>#YY2#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.YY2criterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.FF2criterion# NEQ "true">
<input type="radio" value="true" name="YY2criterion">Yes &nbsp; <input type="radio" value="false" name="YY2criterion">No
</cfif>
</td>
</tr>
<tr><td width="60%" valign="top" bgcolor="#EBF0FA">
<br /><cfoutput>#YY3#</cfoutput>
</td>
<td width="40%" valign="bottom" bgcolor="#EBF0FA">
<cfif #retrieve_logs.YY3criterion# EQ "true">
<b>Excellent Work! Goal Met</b>
<cfelseif #retrieve_logs.YY3criterion# NEQ "true">
<input type="radio" value="true" name="YY3criterion">Yes &nbsp; <input type="radio" value="false" name="YY3criterion">No
</cfif>
</td>
</tr>

<tr>
  <td colspan="2" bgcolor="#EBF0FA">&nbsp;
</td>
</tr>
</cfif>
</cfif>
																
																<tr>
																	<td bgcolor="#E7E7B0" colspan="2">&nbsp;</td>
																</tr>
															</table>
                                                            <input type="submit" value="Save Your Progress" name="B1" style="font-size: 10px"><input type="reset" value="Reset" name="B2" style="font-size: 10px">
</form>
    
    
    </cfif>
    </td>
  </tr>
</table>
  <cfelseif #url.section# EQ "calc">
  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" align="left" valign="middle" background="http://<cfoutput>#site_domain##site_folder##site_template_dir##site_template#/#site_assets_dir#</cfoutput>menu_bg.gif" class="main_page_title">Diet Calculator</td>
  </tr>
  <tr>
    <td>
<style type="text/css"> 

.eebuttons {width:120px}*.ee100 { color : windowtext; font-family : Arial; font-size : 10.00pt; 
font-style : normal; font-weight : 400; padding-left : 1px; 
padding-right : 1px; padding-top : 1px; text-align : left; 
vertical-align : bottom }
*.ee102 { color : windowtext; font-family : Arial; font-size : 10.00pt; 
font-style : normal; font-weight : 400; text-align : left; 
vertical-align : bottom }
*.ee103 { padding-left : 1px; padding-right : 1px; padding-top : 1px }
*.ee106 { color : windowtext; font-family : Arial; font-size : 10.00pt; 
font-style : normal; font-weight : 400; padding-left : 0px; 
padding-right : 1px; padding-top : 0px; text-align : right; 
vertical-align : bottom }
*.ee108 { color : windowtext; font-family : Arial; font-size : 10.00pt; 
font-style : normal; font-weight : 400; text-align : right; 
vertical-align : bottom }
*.ee109 { color : windowtext; font-family : "Times New Roman" , serif; 
font-size : 12.00pt; font-style : normal; font-weight : 400; 
padding-left : 1px; padding-right : 1px; padding-top : 1px; 
text-align : left; vertical-align : bottom }
*.ee112 { background : silver; border-bottom : 0.50pt solid windowtext; 
border-right : 0.50pt solid windowtext; 
border-top : 0.50pt solid windowtext; color : black; 
font-family : Arial , sans-serif; font-size : 8.00pt; font-style : normal; 
font-weight : 400; padding-left : 0px; padding-right : 1px; 
padding-top : 0px; text-align : center; vertical-align : top }
*.ee114 { background : silver; color : black; 
font-family : Arial , sans-serif; font-size : 8.00pt; font-style : normal; 
font-weight : 400; text-align : center; vertical-align : top }
*.ee115 { background : #E7E7B0; color : windowtext; font-family : Arial; 
font-size : 10.00pt; font-style : normal; font-weight : 400; 
padding-left : 0px; padding-right : 1px; padding-top : 0px; 
text-align : right; vertical-align : bottom }
*.ee116 { background : #E7E7B0; color : windowtext; font-family : Arial; 
font-size : 10.00pt; font-style : normal; font-weight : 400; 
text-align : right; vertical-align : bottom }
*.ee117 { background : silver; border-bottom : 0.50pt solid windowtext; 
border-right : 0.50pt solid windowtext; color : black; 
font-family : Arial , sans-serif; font-size : 8.00pt; font-style : normal; 
font-weight : 400; padding-left : 0px; padding-right : 1px; 
padding-top : 0px; text-align : center; vertical-align : top }
*.ee118 { color : windowtext; font-family : "Times New Roman" , serif; 
font-size : 12.00pt; font-style : normal; font-weight : 700; 
padding-left : 1px; padding-right : 1px; padding-top : 1px; 
text-align : right; vertical-align : bottom }
*.ee121 { color : windowtext; font-family : Arial; font-size : 10.00pt; 
font-style : normal; font-weight : 400; padding-left : 0px; 
padding-right : 1px; padding-top : 0px; text-align : left; 
vertical-align : bottom }
*.ee122 { color : windowtext; font-family : Arial , sans-serif; 
font-size : 10.00pt; font-style : normal; font-weight : 700; 
padding-left : 1px; padding-right : 1px; padding-top : 1px; 
text-align : right; vertical-align : bottom }

</style>
<style type="text/css" media="screen">
.eebuttonbar_top {margin-bottom:6px;padding-bottom:6px;border-bottom: 2px solid blue}
.eebuttonbar_bottom {margin-top:6px;padding-top:6px;border-top: 2px solid blue}
.eetabs {display:block;}</style>
<style type="text/css" media="print">
.eebuttonbar_top {display:none;}
.eebuttonbar_bottom {display:none;}
.eetabs {display:none;}</style>
<script language="javascript">
 

var co = new Object;
function recalc_onclick(ctl) {
  if (true) {


co.p1F6=eeparseFloat(document.formc.p1F6.value);co.p1F7=eeparseFloat(document.formc.p1F7.value);co.p1F15=eeparseFloat(document.formc.p1F15.value);co.p1F26=document.formc.p1F26[document.formc.p1F26.selectedIndex].value;co.p1F27=document.formc.p1F27[document.formc.p1F27.selectedIndex].value;co.p1F28=document.formc.p1F28[document.formc.p1F28.selectedIndex].value;co.p1F29=document.formc.p1F29[document.formc.p1F29.selectedIndex].value;co.p1F30=document.formc.p1F30[document.formc.p1F30.selectedIndex].value;co.p1F31=document.formc.p1F31[document.formc.p1F31.selectedIndex].value;co.p1F32=document.formc.p1F32[document.formc.p1F32.selectedIndex].value;co.p1F33=document.formc.p1F33[document.formc.p1F33.selectedIndex].value;co.p1F34=document.formc.p1F34[document.formc.p1F34.selectedIndex].value;co.p1F35=document.formc.p1F35[document.formc.p1F35.selectedIndex].value;co.p1F36=document.formc.p1F36[document.formc.p1F36.selectedIndex].value;co.p1F37=document.formc.p1F37[document.formc.p1F37.selectedIndex].value;co.p1F38=document.formc.p1F38[document.formc.p1F38.selectedIndex].value;co.p1F39=document.formc.p1F39[document.formc.p1F39.selectedIndex].value;co.p1F40=document.formc.p1F40[document.formc.p1F40.selectedIndex].value;co.p1F41=document.formc.p1F41[document.formc.p1F41.selectedIndex].value;co.p1F42=document.formc.p1F42[document.formc.p1F42.selectedIndex].value;co.p1F43=document.formc.p1F43[document.formc.p1F43.selectedIndex].value;co.p1F44=document.formc.p1F44[document.formc.p1F44.selectedIndex].value;co.p1F45=document.formc.p1F45[document.formc.p1F45.selectedIndex].value;co.p1F46=document.formc.p1F46[document.formc.p1F46.selectedIndex].value;co.p1F47=document.formc.p1F47[document.formc.p1F47.selectedIndex].value;co.p1F48=document.formc.p1F48[document.formc.p1F48.selectedIndex].value;co.p1F49=document.formc.p1F49[document.formc.p1F49.selectedIndex].value;co.p1F50=document.formc.p1F50[document.formc.p1F50.selectedIndex].value;co.p1F51=document.formc.p1F51[document.formc.p1F51.selectedIndex].value;co.p1F52=document.formc.p1F52[document.formc.p1F52.selectedIndex].value;co.p1F53=document.formc.p1F53[document.formc.p1F53.selectedIndex].value;co.p1F54=document.formc.p1F54[document.formc.p1F54.selectedIndex].value;co.p1F55=document.formc.p1F55[document.formc.p1F55.selectedIndex].value;co.p1G56=eeparseFloat(document.formc.p1G56.value);calc(co);document.formc.p1F10.value=eedisplayFloat(co.p1F10);document.formc.p1F17.value=eedisplayFloat(co.p1F17);document.formc.p1G26.value=eedisplayFloat(co.p1G26);document.formc.p1G27.value=eedisplayFloat(co.p1G27);document.formc.p1G28.value=eedisplayFloat(co.p1G28);document.formc.p1G29.value=eedisplayFloat(co.p1G29);document.formc.p1G30.value=eedisplayFloat(co.p1G30);document.formc.p1G31.value=eedisplayFloat(co.p1G31);document.formc.p1G32.value=eedisplayFloat(co.p1G32);document.formc.p1G33.value=eedisplayFloat(co.p1G33);document.formc.p1G34.value=eedisplayFloat(co.p1G34);document.formc.p1G35.value=eedisplayFloat(co.p1G35);document.formc.p1G36.value=eedisplayFloat(co.p1G36);document.formc.p1G37.value=eedisplayFloat(co.p1G37);document.formc.p1G38.value=eedisplayFloat(co.p1G38);document.formc.p1G39.value=eedisplayFloat(co.p1G39);document.formc.p1G40.value=eedisplayFloat(co.p1G40);document.formc.p1G41.value=eedisplayFloat(co.p1G41);document.formc.p1G42.value=eedisplayFloat(co.p1G42);document.formc.p1G43.value=eedisplayFloat(co.p1G43);document.formc.p1G44.value=eedisplayFloat(co.p1G44);document.formc.p1G45.value=eedisplayFloat(co.p1G45);document.formc.p1G46.value=eedisplayFloat(co.p1G46);document.formc.p1G47.value=eedisplayFloat(co.p1G47);document.formc.p1G48.value=eedisplayFloat(co.p1G48);document.formc.p1G49.value=eedisplayFloat(co.p1G49);document.formc.p1G50.value=eedisplayFloat(co.p1G50);document.formc.p1G51.value=eedisplayFloat(co.p1G51);document.formc.p1G52.value=eedisplayFloat(co.p1G52);document.formc.p1G53.value=eedisplayFloat(co.p1G53);document.formc.p1G54.value=eedisplayFloat(co.p1G54);document.formc.p1G55.value=eedisplayFloat(co.p1G55);document.formc.p1G57.value=eedisplayFloat(co.p1G57);document.formc.p1H57.value=co.p1H57;document.formc.p1G58.value=eedisplayFloat(co.p1G58);document.formc.p1G59.value=eedisplayFloat(co.p1G59);
};};


var eeisus=1;var eetrue="TRUE";var eefalse="FALSE";var eedec=".";var eeth=",";var eedecreg=new RegExp("[.]","g");var eethreg=new RegExp(",","g");

var arr1xG26G56=new Array(31);for(var ii=0;ii<31;ii++){arr1xG26G56[ii]=new Array(1);for(var jj=0;jj<1;jj++){arr1xG26G56[ii][jj]=0}};var eecm1=new Array(new Array(arr1xG26G56,0,0,30,0));function calc(data){var c1F6=data.p1F6;var c1F7=data.p1F7;var c1F15=data.p1F15;var c1F26=data.p1F26;var c1F27=data.p1F27;var c1F28=data.p1F28;var c1F29=data.p1F29;var c1F30=data.p1F30;var c1F31=data.p1F31;var c1F32=data.p1F32;var c1F33=data.p1F33;var c1F34=data.p1F34;var c1F35=data.p1F35;var c1F36=data.p1F36;var c1F37=data.p1F37;var c1F38=data.p1F38;var c1F39=data.p1F39;var c1F40=data.p1F40;var c1F41=data.p1F41;var c1F42=data.p1F42;var c1F43=data.p1F43;var c1F44=data.p1F44;var c1F45=data.p1F45;var c1F46=data.p1F46;var c1F47=data.p1F47;var c1F48=data.p1F48;var c1F49=data.p1F49;var c1F50=data.p1F50;var c1F51=data.p1F51;var c1F52=data.p1F52;var c1F53=data.p1F53;var c1F54=data.p1F54;var c1F55=data.p1F55;arr1xG26G56[30][0]=data.p1G56;var c1F10=(((c1F6)-(c1F7)));var c1F17=(((c1F15)*(100)));arr1xG26G56[0][0]=(((str_eq((c1F26),("YES")))?(100):(0)));arr1xG26G56[1][0]=(((str_eq((c1F27),("YES")))?(120):(0)));arr1xG26G56[2][0]=(((str_eq((c1F28),("YES")))?(100):(0)));arr1xG26G56[3][0]=(((str_eq((c1F29),("YES")))?(60):(0)));arr1xG26G56[4][0]=(((str_eq((c1F30),("YES")))?(210):(0)));arr1xG26G56[5][0]=(((str_eq((c1F31),("YES")))?(200):(0)));arr1xG26G56[6][0]=(((str_eq((c1F32),("YES")))?(100):(0)));arr1xG26G56[7][0]=(((str_eq((c1F33),("YES")))?(210):(0)));arr1xG26G56[8][0]=(((str_eq((c1F34),("YES")))?(210):(0)));arr1xG26G56[9][0]=(((str_eq((c1F35),("YES")))?(100):(0)));arr1xG26G56[10][0]=(((str_eq((c1F36),("YES")))?(116):(0)));arr1xG26G56[11][0]=(((str_eq((c1F37),("YES")))?(280):(0)));arr1xG26G56[12][0]=(((str_eq((c1F38),("YES")))?(190):(0)));arr1xG26G56[13][0]=(((str_eq((c1F39),("YES")))?(180):(0)));arr1xG26G56[14][0]=(((str_eq((c1F40),("YES")))?(270):(0)));arr1xG26G56[15][0]=(((str_eq((c1F41),("YES")))?(90):(0)));arr1xG26G56[16][0]=(((str_eq((c1F42),("YES")))?(600):(0)));arr1xG26G56[17][0]=(((str_eq((c1F43),("YES")))?(240):(0)));arr1xG26G56[18][0]=(((str_eq((c1F44),("YES")))?(420):(0)));arr1xG26G56[19][0]=(((str_eq((c1F45),("YES")))?(320):(0)));arr1xG26G56[20][0]=(((str_eq((c1F46),("YES")))?(160):(0)));arr1xG26G56[21][0]=(((str_eq((c1F47),("YES")))?(610):(0)));arr1xG26G56[22][0]=(((str_eq((c1F48),("YES")))?(700):(0)));arr1xG26G56[23][0]=(((str_eq((c1F49),("YES")))?(180):(0)));arr1xG26G56[24][0]=(((str_eq((c1F50),("YES")))?(250):(0)));arr1xG26G56[25][0]=(((str_eq((c1F51),("YES")))?(100):(0)));arr1xG26G56[26][0]=(((str_eq((c1F52),("YES")))?(100):(0)));arr1xG26G56[27][0]=(((str_eq((c1F53),("YES")))?(100):(0)));arr1xG26G56[28][0]=(((str_eq((c1F54),("YES")))?(100):(0)));arr1xG26G56[29][0]=(((str_eq((c1F55),("YES")))?(100):(0)));var c1G57=(sumgeneral(31,0,0,eecm1));var c1H57=(((((c1G57)==(c1F17)))?("daily goal reached"):(((((c1G57)>(c1F17)))?("daily goal exceeded"):(((((c1G57)<(c1F17)))?("daily goal not reached yet"):("")))))));var c1G58=(c1F17);var c1G59=(((c1G57)-(c1G58)));data.p1F10=c1F10;data.p1F17=c1F17;data.p1G26=arr1xG26G56[0][0];data.p1G27=arr1xG26G56[1][0];data.p1G28=arr1xG26G56[2][0];data.p1G29=arr1xG26G56[3][0];data.p1G30=arr1xG26G56[4][0];data.p1G31=arr1xG26G56[5][0];data.p1G32=arr1xG26G56[6][0];data.p1G33=arr1xG26G56[7][0];data.p1G34=arr1xG26G56[8][0];data.p1G35=arr1xG26G56[9][0];data.p1G36=arr1xG26G56[10][0];data.p1G37=arr1xG26G56[11][0];data.p1G38=arr1xG26G56[12][0];data.p1G39=arr1xG26G56[13][0];data.p1G40=arr1xG26G56[14][0];data.p1G41=arr1xG26G56[15][0];data.p1G42=arr1xG26G56[16][0];data.p1G43=arr1xG26G56[17][0];data.p1G44=arr1xG26G56[18][0];data.p1G45=arr1xG26G56[19][0];data.p1G46=arr1xG26G56[20][0];data.p1G47=arr1xG26G56[21][0];data.p1G48=arr1xG26G56[22][0];data.p1G49=arr1xG26G56[23][0];data.p1G50=arr1xG26G56[24][0];data.p1G51=arr1xG26G56[25][0];data.p1G52=arr1xG26G56[26][0];data.p1G53=arr1xG26G56[27][0];data.p1G54=arr1xG26G56[28][0];data.p1G55=arr1xG26G56[29][0];data.p1G57=c1G57;data.p1H57=c1H57;data.p1G58=c1G58;data.p1G59=c1G59;};

function str_eq(x,y){return(x.toLowerCase()==y.toLowerCase())};function myIsNaN(x){return(isNaN(x)||(typeof x=='number'&&!isFinite(x)));};function sum2(arr,rt,rb){var sum=0;for(var ii=rt;ii<=rb;ii++){sum+=arr[ii]};return sum};function sum3(arr,rt,ct,rb,cb){var sum=0;for(var ii=rt;ii<=rb;ii++){for(var jj=ct;jj<=cb;jj++){sum+=arr[ii][jj]}};return sum};function sumgeneral(cnt,vsum,vcnt,x){var sum=vsum;for(var ii=0;ii<x.length;ii++){sum+=sum3(x[ii][0],x[ii][1],x[ii][2],x[ii][3],x[ii][4]);};return sum;};function eeparseFloat(str){str=String(str).replace(eedecreg,".");var res=parseFloat(str);if(isNaN(res)){return 0;}else{return res;}};function eedisplayFloat(x){if(myIsNaN(x)){return Number.NaN;}else{return String(x).replace(/\./g,eedec);}};
</script>
  <form id="formc" name="formc" method="post" action="">
	


   <font color="#444444">
	


   <input type="hidden" id="xl_spreadsheet" name="xl_spreadsheet" value="Copy of calc.xls" />
   <input type="hidden" id="xl_version" name="xl_version" value="" />
   <input type="hidden" id="xl_client" name="xl_client" value="h3.3.4" />

	

	</font><font color="#444444">

	

<script language="javascript">
  var submitted = false;
  function check_submit()
  {
     if (submitted) {
        alert("You have already submitted the form.  Please be patient.");
        submitted = false;  // reset if the user wants to submit again, for example
                            // due to failure
        return false;
     } else {
        recalc_onclick('');   // force recalc before submit
        submitted = true;
	document.formc.submit();
        return true;
     }
  }
</script>



	

	</font>



	

     <table  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="border-collapse:collapse;" >
       <col width="48.00" />
       <col width="308.00" />
       <col width="39.00" />
       <col width="48.00" />
       <col width="48.00" />
       <col width="48.00" />
       <col width="48.00" />
       <col width="48.00" />
       <col width="48.00" />
           <tr style='height:13pt'> 
			   <td    class='ee100' bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
			   <td    class='ee100' width="324" bgcolor="#F7F7F7"    >
			<b>
			<font color="#444444">Your current Weight:		    </font>			   </b>			   </td>
			   <td    class='ee106' width="66" bgcolor="#F7F7F7"    >
			     <font color="#444444">
			     <input value="0" name="p1F6" id="p1F6" type="text" 
			      onblur="this.value=eedisplayFloat(eeparseFloat(this.value));recalc_onclick('p1F6')" tabindex="1"
			      style=' width:100% '
	    class='ee108' >
			   </font>			   </td>
			   <td    class='ee100' bgcolor="#F7F7F7"    >
			<font color="#444444">pounds			   </font>			   </td>
			   <td    class='ee100'   colspan="4" bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:13pt'> 
			   <td    class='ee100' bgcolor="#FFFFFF" >
			<font color="#444444">&nbsp;			   </font>			   </td>
			   <td    class='ee100' width="324" bgcolor="#FFFFFF"    >
			<font color="#444444"><b>The weight you want to be:</b>			   </font>			   </td>
			   <td    class='ee106' width="66"    >
			     <font color="#444444">
			     <input value="0" name="p1F7" id="p1F7" type="text" 
			      onblur="this.value=eedisplayFloat(eeparseFloat(this.value));recalc_onclick('p1F7')" tabindex="2"
			      style=' width:100% '
	    class='ee108' >
			   </font>			   </td>
			   <td    class='ee100'    >
			<font color="#444444">pounds			   </font>			   </td>
			   <td    class='ee100'   colspan="4" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:13pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#F7F7F7" width="344" >
			<font color="#444444">&nbsp;			   </font>			   </td>
			   <td    class='ee100'   colspan="7" bgcolor="#F7F7F7" width="335" >&nbsp;			</td>
	       </tr>
	       <tr style='height:13pt'> 
			   <td    class='ee100' bgcolor="#FFFFFF" >
			<font color="#444444">&nbsp;			   </font>			   </td>
			   <td    class='ee100' width="324" bgcolor="#FFFFFF"    >
			<font color="#444444">You need to lose:			   </font>			   </td>
			   <td    class='ee100'   colspan="7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:13pt'> 
			   <td    class='ee100' bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
			   <td    class='ee100' width="324" bgcolor="#F7F7F7"    >
			<font color="#444444">to reach the weight you want to be.			   </font>			   </td>
			   <td    class='ee106' width="66" bgcolor="#F7F7F7"    ><font color="#444444"><font color="#444444">
			     <input value="0" name="p1F10" id="p1F10" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee108' />
			   </font></font></td>
			   <td    class='ee100' bgcolor="#F7F7F7"    >
			<font color="#444444">pounds			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:26pt'> 
			   <td    class='ee103' height="20" bgcolor="#FFFFFF"    >&nbsp;			</td>
			   <td    class='ee103' width="324" height="20" bgcolor="#FFFFFF"    >
			<font color="#444444">&nbsp;			   </font>			   </td>
			   <td    class='ee103' height="20" width="65"    >
			<font color="#444444">&nbsp;			   </font>			   </td>
			   <td    class='ee103' height="20"    >
			<font color="#444444">&nbsp;			   </font>			   </td>
			   <td    class='ee103' height="20" width="94"    >
			<font color="#444444">&nbsp;			   </font>			   </td>
			   <td    class='ee103' height="20" width="2"    >
			<font color="#444444">&nbsp;			   </font>			   </td>
			   <td    class='ee103' height="20"    >
			<font color="#444444">&nbsp;			   </font>			   </td>
			   <td    class='ee103' width="100" height="20"    >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:13pt'> 
			   <td    class='ee100' height="32" bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
			   <td    class='ee100' width="324" height="32" bgcolor="#F7F7F7"    >
			<b>
			<font color="#444444">How
  many pounds do you want to lose this month?		    </font>			   </b>			   </td>
			   <td    class='ee100'   colspan="7" height="32" bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:13pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#FFFFFF" width="344" >
			<font color="#444444">&nbsp;			   </font>			   </td>
			   <td    class='ee100'   colspan="7" bgcolor="#FFFFFF" width="335" >&nbsp;			</td>
	       </tr>
	       <tr style='height:13pt'> 
			   <td    class='ee100' bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
			   <td    class='ee100' width="324" bgcolor="#F7F7F7"    >
			<font color="#444444"><b>Enter pounds to lose (no more than 12):</b>			   </font>			   </td>
			   <td    class='ee106' width="0" bgcolor="#F7F7F7"    >
			     <font color="#444444">
			     <input value="0" name="p1F15" id="p1F15" type="text" 
			      onblur="this.value=eedisplayFloat(eeparseFloat(this.value));recalc_onclick('p1F15')" tabindex="3"
			      style=' width:100% '
	    class='ee108' >
			   </font>			   </td>
			   <td    class='ee106' width="53" bgcolor="#F7F7F7"    >&nbsp;		     </td>
			   <td    class='ee100'   colspan="5" bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:13pt'> 
			   <td    class='ee100' bgcolor="#FFFFFF" >
			<font color="#444444">&nbsp;			   </font>			   </td>
			   <td    class='ee100' width="324" bgcolor="#FFFFFF"    >
			<font color="#444444">You need to cut:			   </font>			   </td>
			   <td    class='ee106' width="66"    >
			     <font color="#444444">
			     <input value="0" name="p1F17" id="p1F17" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee108' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="2" style="vertical-align: top" >
			<font color="#444444">calories
  each day			   </font>			   </td>
	       </tr>
	       <tr style='height:16pt'> 
			   <td    class='ee100' bgcolor="#FFFFFF" >
			<font color="#444444">&nbsp;			   </font>			   </td>
			   <td    class='ee109' width="324" bgcolor="#FFFFFF"    >
			<font color="#444444">
			<br>
			<b>DIET CHOICES
			   <br>
			</b></font></td>
			   <td    class='ee100'   colspan="7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:16pt'> 
			   <td    class='ee100' bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
			   <td    class='ee109'   colspan="8" bgcolor="#F7F7F7" >
			<font color="#444444">Below is a long list of foods you can change 
			or just give up. <br>
			As you choose each one, click on it, and the counter will keep track 
			of how many calories you’ll save by making that choice. <br>
			When you get to your goal, you’re done!
			   <br>
			<br>
			Then, just keep making
  those choices each day, and you’ll be able to lose the weight you want to
  lose!			   </font>			   </td>
	       </tr>
	       <tr style='height:16pt'> 
			   <td    class='ee100' bgcolor="#FFFFFF" >
			<font color="#444444">&nbsp;			   </font>			   </td>
			   <td    class='ee109'   colspan="5" bgcolor="#FFFFFF" >&nbsp;			</td>
	       </tr>
	       <tr style='height:32pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#F7F7F7" >
			<font color="#444444">Change from 2 glasses of whole
  milk a day to 2 glasses of 1% milk a day: Save 100 calories			   </font>			   </td>
			   <td    class='ee112' width="65"    >
    <font color="#444444">
    <select name="p1F26" id="p1F26" size="1" onChange="recalc_onclick('p1F26')" tabindex="4"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G26" id="p1G26" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:32pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#FFFFFF" >
			<font color="#444444">Change from 1 glass of Juicy
  Juice a day to 1 glass of water: Save 120 calories			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F27" id="p1F27" size="1" onChange="recalc_onclick('p1F27')" tabindex="5"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G27" id="p1G27" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#FFFFFF" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:35pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#F7F7F7" >
			<font color="#444444">Change from 8 oz of Snapple a
  day to 8 oz of water: Save 100 calories			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F28" id="p1F28" size="1" onChange="recalc_onclick('p1F28')" tabindex="6"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G28" id="p1G28" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:31pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#FFFFFF" >
			<font color="#444444">Change from 1 package of peanut
  butter crackers to 26 Cheese Its: Save 60 calories			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F29" id="p1F29" size="1" onChange="recalc_onclick('p1F29')" tabindex="7"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G29" id="p1G29" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#FFFFFF" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:29pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#F7F7F7" >
			<font color="#444444">Change from 2 Yodels to 1 Chips
  Deluxe cookie: Save 210 calories			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F30" id="p1F30" size="1" onChange="recalc_onclick('p1F30')" tabindex="8"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G30" id="p1G30" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:29pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#FFFFFF" >
			<font color="#444444">Change from 1 Thomas Bagel to 1
  slice of whole wheat bread: Save 200 calories			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F31" id="p1F31" size="1" onChange="recalc_onclick('p1F31')" tabindex="9"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G31" id="p1G31" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#FFFFFF" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:29pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#F7F7F7" >
			<font color="#444444">Change from skin-on white meat
  chicken to skin-off: Save 110 calories			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F32" id="p1F32" size="1" onChange="recalc_onclick('p1F32')" tabindex="10"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G32" id="p1G32" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:29pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#FFFFFF" >
			<font color="#444444">Change
  from creamed spinach side at Boston Market to green beans side: Save 210
  calories			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F33" id="p1F33" size="1" onChange="recalc_onclick('p1F33')" tabindex="11"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G33" id="p1G33" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#FFFFFF" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:32pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#F7F7F7" >
			<font color="#444444">Change from Caesar side salad
  with dressing at Boston Market to without dressing: Save 210 calories			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F34" id="p1F34" size="1" onChange="recalc_onclick('p1F34')" tabindex="12"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G34" id="p1G34" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:32pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#FFFFFF" >
			<font color="#444444">Change from 2 slices of deep
  dish pizza to 2 slices of cheese pizza: Save 100 calories			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F35" id="p1F35" size="1" onChange="recalc_onclick('p1F35')" tabindex="13"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G35" id="p1G35" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#FFFFFF" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:15pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#F7F7F7" >
			<font color="#444444">Skip 1 Domino’s breadstick: Save
  116 calories			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F36" id="p1F36" size="1" onChange="recalc_onclick('p1F36')" tabindex="14"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G36" id="p1G36" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:32pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#FFFFFF" >
			<font color="#444444">Change from 1 large Pepsi to
  water or diet Pepsi: Save 280 calories			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F37" id="p1F37" size="1" onChange="recalc_onclick('p1F37')" tabindex="15"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G37" id="p1G37" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#FFFFFF" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:32pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#F7F7F7" >
			<font color="#444444">Change from a Dunkin Donut’s
  muffin to a plain bagel: Save 190 calories			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F38" id="p1F38" size="1" onChange="recalc_onclick('p1F38')" tabindex="16"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G38" id="p1G38" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:29pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#FFFFFF" >
			<font color="#444444">Change from a Coffee Coolatta at
  Dunkin Donuts with cream to one with skim: Save 180 calories </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F39" id="p1F39" size="1" onChange="recalc_onclick('p1F39')" tabindex="17"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G39" id="p1G39" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#FFFFFF" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:29pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#F7F7F7" >
			<font color="#444444">Change from a Burger King Double
  Whopper to a Whopper with no mayo: Save 270 calories			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F40" id="p1F40" size="1" onChange="recalc_onclick('p1F40')" tabindex="18"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G40" id="p1G40" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:29pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#FFFFFF" >
			<font color="#444444">Change from a bacon cheeseburger
  at Burger King to a plain burger: Save 90 calories			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F41" id="p1F41" size="1" onChange="recalc_onclick('p1F41')" tabindex="19"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G41" id="p1G41" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#FFFFFF" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:15pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#F7F7F7" >
			<font color="#444444">Skip 1 King size French fries at
  Burger King: Save 600 calories			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F42" id="p1F42" size="1" onChange="recalc_onclick('p1F42')" tabindex="20"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G42" id="p1G42" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:29pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#FFFFFF" >
			<font color="#444444">Change from 1 King size French
  fries to a medium French Fries: Save 240 calories			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F43" id="p1F43" size="1" onChange="recalc_onclick('p1F43')" tabindex="21"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G43" id="p1G43" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#FFFFFF" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:29pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#F7F7F7" >
			<font color="#444444">Change from a King size Coca
  Cola to a diet cola: Save 420 calories			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F44" id="p1F44" size="1" onChange="recalc_onclick('p1F44')" tabindex="22"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G44" id="p1G44" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:32pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#FFFFFF" >
			<font color="#444444">Change from a Big Mac at
  McDonald’s to a regular burger: Save 320 calories			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F45" id="p1F45" size="1" onChange="recalc_onclick('p1F45')" tabindex="23"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G45" id="p1G45" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#FFFFFF" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:32pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#F7F7F7" >
			<font color="#444444">Change from a super size French
  Fries at McDonald’s to a medium size: Save 160 calories			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F46" id="p1F46" size="1" onChange="recalc_onclick('p1F46')" tabindex="24"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G46" id="p1G46" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:16pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#FFFFFF" >
			<font color="#444444">Skip a super size French Fries
  at McDonald’s: Save 610 calories			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F47" id="p1F47" size="1" onChange="recalc_onclick('p1F47')" tabindex="25"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G47" id="p1G47" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#FFFFFF" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:32pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#F7F7F7" >
			<font color="#444444">Change from a 32 oz chocolate
  shake at McDonald’s to a 12 oz size: Save 700 calories			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F48" id="p1F48" size="1" onChange="recalc_onclick('p1F48')" tabindex="26"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G48" id="p1G48" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:32pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#FFFFFF" >
			<font color="#444444">Change from a tuna 6 inch
  sandwich at Subway to a turkey breast: Save 180 calories			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F49" id="p1F49" size="1" onChange="recalc_onclick('p1F49')" tabindex="27"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G49" id="p1G49" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#FFFFFF" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:32pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#F7F7F7" >
			<font color="#444444">Change from a 6 inch meatball
  sandwich at Subway to a roast beef: Save 250 calories			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F50" id="p1F50" size="1" onChange="recalc_onclick('p1F50')" tabindex="28"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G50" id="p1G50" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:16pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#FFFFFF" >
			<font color="#444444">Skip one can of soda:<span> </span>			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F51" id="p1F51" size="1" onChange="recalc_onclick('p1F51')" tabindex="29"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G51" id="p1G51" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#FFFFFF" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:16pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#F7F7F7" >
			<font color="#444444">Skip one small size (25 cents) bag of Doritos:			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F52" id="p1F52" size="1" onChange="recalc_onclick('p1F52')" tabindex="30"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G52" id="p1G52" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:16pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#FFFFFF" >
			<font color="#444444">Skip one bottle of juice:			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F53" id="p1F53" size="1" onChange="recalc_onclick('p1F53')" tabindex="31"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G53" id="p1G53" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#FFFFFF" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:16pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#F7F7F7" >
			<font color="#444444">Skip one large size bag of chips			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F54" id="p1F54" size="1" onChange="recalc_onclick('p1F54')" tabindex="32"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G54" id="p1G54" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:16pt'> 
			   <td    class='ee100'   colspan="2" bgcolor="#FFFFFF" >
			<font color="#444444">Skip one candy bar:			   </font>			   </td>
			   <td    class='ee117' width="65"    >
    <font color="#444444">
    <select name="p1F55" id="p1F55" size="1" onChange="recalc_onclick('p1F55')" tabindex="33"  class='ee114'  style=' width:100% '>
       <option value="NO" selected>NO</option>
       <option value="YES" >YES</option>
    </select>
			   </font>			   </td>
			   <td    class='ee115'    >
			     <font color="#444444">
			     <input value="0" name="p1G55" id="p1G55" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:1px solid #000000; width:100% '
	    class='ee116' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#FFFFFF" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:13pt'> 
			   <td    class='ee100'   colspan="3" bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
			   <td    class='ee106'   colspan="6" bgcolor="#F7F7F7" >
			     <font color="#444444">
			     <input name="p1G56" id="p1G56" 
			      onblur="this.value=eedisplayFloat(eeparseFloat(this.value));recalc_onclick('p1G56')" tabindex="34"
			      style=' border:1px solid #F7F7F7; width:21 ; height:22; float:left; background-color:#F7F7F7'
	    class='ee108' size="1" >
			   </font>			   </td>
	       </tr>
	       <tr style='height:16pt'> 
			   <td    class='ee100'   colspan="2" height="22" style="text-align: right" bgcolor="#F7F7F7" >
			<font color="#444444">
			<b>Total Calories Saved (Daily):		    </b>			   </font>			   </td>
			   <td    class='ee100' height="22" width="65" bgcolor="#F7F7F7"    >
			<font color="#444444">&nbsp;			   </font>			   </td>
			   <td    class='ee106' height="22" bgcolor="#F7F7F7"    >
			     <font color="#444444">
			     <input value="0" name="p1G57" id="p1G57" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:0px solid #000000; width:100% '
	    class='ee108' >
			   </font>			   </td>
			   <td    class='ee121'   colspan="4" height="22" bgcolor="#F7F7F7" >
			     <font color="#444444">
			     <input name="p1H57" id="p1H57" 
			      tabindex="-1" readonly="true"
			      style='border:0px solid #000000; width:241 ; height:20; float:right'
	    class='ee102' >
			   </font>			   </td>
			   <td    class='ee100' width="2" height="22" bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:16pt'> 
			   <td    class='ee100'   colspan="2" height="20" style="text-align: right" bgcolor="#F7F7F7" >
			<font color="#444444">
			<b>Your daily goal:		    </b>			   </font>			   </td>
			   <td    class='ee100' height="20" width="65" bgcolor="#F7F7F7"    >
			<font color="#444444">&nbsp;			   </font>			   </td>
			   <td    class='ee106' height="20" bgcolor="#F7F7F7"    >
			     <font color="#444444">
			     <input value="0" name="p1G58" id="p1G58" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:0px solid #000000; width:100% '
	    class='ee108' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" height="20" bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:13pt'> 
			   <td    class='ee100'   colspan="2" style="text-align: right" bgcolor="#F7F7F7" >
			<font color="#444444">
			<b>Difference:		    </b>			   </font>			   </td>
			   <td    class='ee100' width="65" bgcolor="#F7F7F7"    >
			<font color="#444444">&nbsp;			   </font>			   </td>
			   <td    class='ee106' bgcolor="#F7F7F7"    >
			     <font color="#444444">
			     <input value="0" name="p1G59" id="p1G59" type="text" 
			      tabindex="-1" readonly="true"
			      style='border:0px solid #000000; width:100% '
	    class='ee108' >
			   </font>			   </td>
			   <td    class='ee100'   colspan="5" bgcolor="#F7F7F7" >
			<font color="#444444">&nbsp;			   </font>			   </td>
	       </tr>
	       <tr style='height:13pt'> 
			   <td    class='ee100'   colspan="2" style="text-align: right" bgcolor="#F7F7F7" >&nbsp;			</td>
			   <td    class='ee100' width="65" bgcolor="#F7F7F7"    >&nbsp;			</td>
			   <td    class='ee106' bgcolor="#F7F7F7"    >&nbsp;		     </td>
			   <td    class='ee100'   colspan="5" bgcolor="#F7F7F7" >&nbsp;			</td>
	       </tr>
	 </table>
	 <p></p>
         </div>

 
	<font color="#444444">

 
<input type="hidden" name="xl_aux" value="
">
	</font>
</form>
	<font color="#444444">
<script language="javascript">
function reset_onclick(x){document.formc.reset();postcode();recalc_onclick('');};function postcode(){};function eequerystring(){var querystring=document.location.search;if(querystring.length>0){variables=(querystring.substring(1)).split("&");var variable;var key;var value;for(var ii=0;ii<variables.length;ii++){variable=variables[ii].split("=");key=unescape(variable[0]);value=unescape(variable[1]);if(document.formc[key]!=null){document.formc[key].value=value;}}}}function initial_update(){postcode('');eequerystring();recalc_onclick('');}
</script>





	</font>





<noscript>The browser does not support JavaScript. The calculator created using will not work. Please access the web page using another browser.<p></p></noscript>
													
													
													
													
													
													
													
													
													</td>
												</tr>
											</table>
</td>
  </tr>
</table>

  </cfif>
<cfelseif NOT isDefined('url.section')>
  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>This is the <cfoutput>#module#</cfoutput> Module</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</cfif>