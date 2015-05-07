<cf_headfoot>
<cfparam name="attributes.script" default="Login FrameWork">
<cfparam name="attributes.page" default="Articles & Article Archive Administration">
<script language="javascript" type="text/javascript" src="assets/scripts/common.js">
</script>
<script type="text/javascript">
<!--
var txt_advanced_editor_warning = "Advanced editor mode cannot be enabled, as this mode is available only in the following web browsers:\nIE5.5+ (Windows)\nLatest version of Netscape, Mozilla & Firefox (Windows)";
var isHTML_Editor = (
		(localBFamily == 'MSIE' && parseInt(localVersion) >= 5) || 
		(localBrowser == 'Netscape' && parseInt(localVersion) >= 8) || 
		((localBrowser == 'Firefox' || localBrowser == 'Mozilla') && parseInt(localVersion) >= 1) || 
		(localBrowser == 'Opera' && parseInt(localVersion) >= 9)
	);
var isHTML_EditorFF = (localBrowser == 'Firefox');
-->
</script>
<script src="assets/scripts/wysiwyg/innovaeditor.js" language="JavaScript" type="text/javascript"></script>

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
<!---\\ Add Function //--->
<cfif do EQ "add">
<CFTRANSACTION>
   <cfquery name="InsertQestion" datasource="#datasrc#">
	INSERT
	INTO #table_poll_q#
	(Question)
	VALUES
	('#Form.Question#') 
</cfquery>
<cfquery name="getLastID" datasource="#datasrc#">
	SELECT MAX(QuestionID) as LastID
	FROM #table_poll_q#
</cfquery>
<cfloop list="#form.Answer#" index="FormAnswer" delimiters=":">	
 <cfquery name="Insertpoll_answers" datasource="#datasrc#">
   INSERT INTO #table_poll_a#(QuestionID, Answer)
   VALUES('#getLastID.LastID#','#FormAnswer#')
 </cfquery>
</cfloop>
</CFTRANSACTION>
  <cflocation url="module_polls.cfm?do=m" addToken="No">
</CFIF>
<!---\\ url.Delete Function //--->
<cfif do EQ "delete">
  <CFTRANSACTION>
  <CFQUERY DataSource="#datasrc#" Name="delete_admin_news">
	DELETE FROM #table_poll_q# WHERE questionid = #url.id#
  </CFQUERY>
  <CFQUERY DataSource="#datasrc#" Name="delete_admin_news">
	DELETE FROM #table_poll_a# WHERE  questionid= #url.id#
  </CFQUERY>
  </CFTRANSACTION>
  <cflocation url="module_polls.cfm?do=m" addToken="No">
</cfif>
<!---\\url.Update Functions//--->
<cfif do EQ "update">
  <CFTRANSACTION>
<cfif isdefined ('Form.Question')>
<!--- Set the data that is to be updated and the tables they apply to --->
<cfquery name="UpdateQuestion" datasource="#datasrc#">
		 UPDATE #table_poll_q#
		 SET 
		 Question='#Form.Question#'
		 WHERE QuestionID = #Form.ID#
</cfquery>
</cfif>
<cfif isdefined ('Form.Answer')>

<cfquery name="UpdateAnswer" datasource="#datasrc#">
UPDATE #table_poll_a#
SET 
Answer= '#Form.Answer#'
WHERE AnswerID = #Form.AnswerID#
</cfquery>

</cfif>
  </CFTRANSACTION>
  <cflocation url="module_polls.cfm?do=m" addToken="No">
</cfif>  

<!---\\ End of Module Functions //--->
<!--- See if user has access level rights to this page --->
<cfif ListFindNoCase("#allusers#", session.permissions, ",")>
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
    <td width="100" valign="top"><img src="assets/modules/modules_polls.jpg" alt="WebOS Site Configuration" width="100" height="100" /><br />
      <br />
      <cfif do EQ "a">
      <b><a href="?do=a">Add a Poll</a><br /></b>
      <cfelse>
      <a href="?do=a">Add a Poll</a><br />
      </cfif>
      <br />

      <cfif do NEQ "m">
      <a href="?do=m">Back to Main</a>
      </cfif>
      </td>
      
    <td valign="top"><cfif do EQ "m">
    <!---\\ Intro Text //--->
    Welcome <b><cfoutput>#session.user#</cfoutput></b>, to the WebOS <b><cfoutput>#attributes.page#</cfoutput></b> Page. Here you can  add, edit and delete Form fields on your WebOS Articles.
      <hr width="95%" align="center"/>
<CFQUERY DataSource="#datasrc#" Name="display_polls">
			SELECT *
			FROM #table_poll_q# </CFQUERY>
            <table width="100%"  border="0" cellspacing="1" cellpadding="5">
  <tr align="center" bgcolor="#9CB6DE">
    <td width="51%" align="left" bgcolor="#E2E6E7"><span class="style1"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Title</font></span></td>
    <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong># of Answers</strong></font></span></td>
    <td width="6%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Edit</strong></font></span></td>
    <td width="8%" bgcolor="#E2E6E7"><span class="style2"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Delete</strong></font></span></td>
  </tr>
  <CFLOOP QUERY="display_polls" StartRow="1" EndRow="#display_polls.RecordCount#">
    <CFOUTPUT>
      <tr <CFIF row_color EQ 1>bgcolor="##efefef"</CFIF>>
        <td>#display_polls.question#</td>
        <td align="center"><cfquery name="answers" datasource="#datasrc#">
        select * from #table_poll_a# where QuestionID ='#display_polls.questionID#'
        </cfquery>#answers.recordcount#</td>
        <td align="center"><A HREF="?do=e&id=#display_polls.QuestionID#"><IMG SRC="assets/icons/icon_edit_topic.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="e"></A></td>
        <td align="center"><A HREF="?do=d&id=#display_polls.QuestionID#"><IMG SRC="assets/icons/icon_delete_reply.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="d"></A></td>
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
     
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Add New Poll</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td align="right"><form method="post" action="?do=add">
<input type="Hidden" name="Question_Required" Value="You must have a Question!">
<input type="Hidden" name="Answer_Required" Value="You must have an Answer!">                
                      
                <table width="100%" border="0" cellspacing="0" cellpadding="2">
                  
                  <tr> 
                    <td width="25%"><p><strong>Question:</strong></p></td>
                    <td width="75%"><p> 
                        <input type="text" name="Question" size="40">
                      </p></td>
                  </tr>
                  <tr> 
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr> 
                    <td width="25%"><p><strong>Poll Answers:</strong></p><bR />Separate Each Answer with a  ':'.</td>
                    <td width="75%"><p> 
                        <input type="text" name="Answer" size="40">
                      </p></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td align="right"><input type="image" name="Submit" id="Submit" src="assets/buttons/submit.jpg" /></td>
                  </tr>
                </table>
    <BR>
  </form></td>
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

    <cfelseif do EQ "e">
    <cfquery name="GetPollDetails" datasource="#datasrc#">
SELECT Question
FROM #table_poll_q#
WHERE QuestionID=#URL.ID#
</cfquery>

<cfquery name="GetAnswerDetails" datasource="#datasrc#">
SELECT Answer, AnswerID
FROM #table_poll_a#
WHERE QuestionID=#URL.ID#
</cfquery>

<table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Edit Poll</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td><form method="post" action="?do=Update">
	<input type="Hidden" name="QuestionID" Value="<CFOUTPUT>#url.ID#</CFOUTPUT>">
                      <table width="100%" border="0" cellspacing="0" cellpadding="2">
                        <tr> 
                          <td width="25%"><p><strong>Question:</strong></p></td>
                          <td width="75%"><p> 
                              <input type="text" name="Question" size="40" Value="<CFOUTPUT>#GetPollDetails.Question# </CFOUTPUT>">
                            <input type="submit" name="SubmitButton" value="Make the changes">
                            </p></td>
                        </tr>
		</table>
      </form>						

					<cfoutput query="GetAnswerDetails">
					<form method="post" action="?do=Update">
                      <table width="100%" border="0" cellspacing="0" cellpadding="2">												
						<tr>
                          <td width="25%"><p><strong>Answer:</strong></p></td>
                          <td width="75%">
						  <input type="text" name="Answer" size="40" maxlength="50" Value="#GetAnswerDetails.Answer#"> <input type="submit" name="SubmitButton" value="Make the changes">
						  <input type="Hidden" name="AnswerID" Value="#GetAnswerDetails.AnswerID#">
						  </td>
                        </tr>
					  </table>
                    </form>
					</cfoutput></td>
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


<cfelseif do EQ "d">
<CFQUERY DataSource="#datasrc#" Name="delete_article">
			SELECT *
			FROM #table_poll_q# where questionid ='#url.id#'
</CFQUERY>
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
<!-- fwtable fwsrc="ap_menu.png" fwpage="Page 1" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "2112782397" fwnested="0" -->
  <tr>
   <td width="11"><img name="menu_r1_c1" src="assets/main_box/admin_r1_c1.jpg" width="11" height="20" border="0" id="menu_r1_c1" alt="" /></td>
   <td align="center" valign="middle" background="assets/main_box/admin_r1_c2.jpg"><span class="style1">Delete Poll</span></td>
   <td width="11"><img name="menu_r1_c3" src="assets/main_box/admin_r1_c3.jpg" width="11" height="20" border="0" id="menu_r1_c3" alt="" /></td>
  
  </tr>
  <tr>
   <td width="11" background="assets/main_box/admin_r2_c1.jpg">&nbsp;</td>
   <td align="left" valign="top" bgcolor="#ffffff" class="VertMenuBox"><table cellpadding="5" cellspacing="0" width="100%">
<tr>
  <td>
  Are you Certain you want to delete the Poll: <b><cfoutput>#delete_article.question#</cfoutput></b><br />
  <br />
   <a href="?Delete=yes&id=<cfoutput>#url.id#</cfoutput>">Yes</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="module_polls.cfm">No</a></td>
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