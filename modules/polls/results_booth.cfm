<!--- Check that the page was reached by using the form --->

<cfif isDefined('Form.QuestionID')>

<!--- What to do if the form was used to reach this page --->
<!--- Check that there was a radio button selected --->

<cfif isDefined('Form.AnswerID')>

<!--- Check to see if the user hit their back button to try and vote again --->

<cfif IsDefined("cookie.fusionpoll")>

<!--- What to do if the cookie does exist --->
<!--- Check now to see if the cookie is current - does it have the correct ID? --->

	<cfquery datasource="#datasrc#" name="CurrentID" MAXROWS="1">
	SELECT questions.QuestionID
	FROM #table_poll_q# questions
	ORDER BY QuestionID DESC
	</cfquery>

<cfif "#cookie.fusionpoll#" is "#CurrentID.QuestionID#">
<br>
<div align="center">Sorry, you can only vote once.</div>
<cfabort>
<cfelse>

</cfif>
</cfif>

<!--- Radio button selected, so we display the option chosen for the poll --->
<!--- Set the new cookie --->
                
<cfcookie name="fusionpoll" value="#Form.QuestionID#" expires="never">

<!--- Show vote choice and add new vote to database --->

    <cftransaction>
      <cfquery datasource="#datasrc#" name="LastVote">
      SELECT Votes 
	  From #table_poll_a# answers 
	  WHERE QuestionID=#QuestionID# AND AnswerID=#AnswerID# 
      </cfquery>
      <cfset NewVotes=LastVote.Votes + 1>
      <cfquery datasource="#datasrc#" name="NewVote">
      UPDATE #table_poll_a# 
	  SET Votes=#NewVotes# 
	  WHERE QuestionID=#QuestionID# AND AnswerID=#AnswerID# 
      </cfquery>
    </cftransaction>

<cfquery datasource="#datasrc#" name="showanswer">
	SELECT Answers.Answer, Answers.AnswerID
	From #table_poll_a# answers
	WHERE Answers.AnswerID = #AnswerID#
</cfquery>

<cfquery datasource="#datasrc#" name="showquestion">
	SELECT questions.QuestionID, questions.Question
	FROM #table_poll_q# questions
	WHERE questions.QuestionID = #QuestionID#
</cfquery>
<br>
<cfoutput>	
<div align="center">Thanks for voting. For the question <strong>'#showquestion.Question#'</strong> you chose:</div>
</cfoutput>
<cfoutput>
<div align="center"><i>'#showanswer.Answer#'</i></div>
</cfoutput>

<cfelse>

<!--- No radio button selected, so tell the user to try again --->

<br>
<div align="center">Sorry, you didn't select anything. Please select an answer before hitting the 'Vote' button.</div>

</cfif>

<cfelse>

<!--- What to do if the form was not submitted to reach this page --->

<cfif isdefined ('URL.QuestionID')>

<!--- Check to see if someone is accessing the results before anybody has voted --->
<!--- Check for the sum of all votes for the current poll --->

<cfquery datasource="#datasrc#" name="check">
 SELECT SUM(Votes) AS AllVotes
 From #table_poll_a# answers
 WHERE Answers.QuestionID=#URL.QuestionID#
</cfquery>

<cfif check.AllVotes is "0">

<br>
<div align="center">There are currently no votes for this poll. Vote now to be the first.</div>
    
<cfelse>

<cfquery datasource="#datasrc#" name="Totals">
SELECT questions.Question, SUM(Answers.Votes) AS TotalVotes
 FROM #table_poll_q# questions INNER JOIN Answers 
 ON questions.QuestionID=Answers.QuestionID
 WHERE questions.QuestionID=#URL.QuestionID#
 GROUP BY questions.Question
</cfquery>

<!--- Query the answers and the number of votes for each one. --->

<cfquery datasource="#datasrc#" name="Results">
SELECT Answers.Answer, Answers.Votes
 From #table_poll_a# answers
 WHERE Answers.QuestionID=#URL.QuestionID#
 ORDER BY Answers.AnswerID
</cfquery>

<!--- Display the results when they are available --->

<table width="175" border="0" align="center" cellpadding="2" cellspacing="0">
  
  <!--- Display the question --->
  
  <cfoutput query="Totals"> 
    <tr> 
      <td><div align="center"><strong>#Question#</strong></div></td>
    </tr>
  </cfoutput> 
  
  <!--- Display the answers and their number of votes. --->
  
  <cfoutput query="Results"> 
    
	<!--- Set the percent of total votes for each answer. --->
    
	<cfset Percent=Round((Votes / Totals.TotalVotes) * 100)>
    <tr> 
      <td><div align="left">#Answer#</div></td>
    </tr>
    <tr> 
	  
	  <!--- Display the percentage of votes in a graph format. --->
      <!--- The width of the bar image is equal to the percentage of votes. --->
      
	  <td><div align="left"><img align="middle" src="images/poll-graph.gif" width="#Percent#%" height="5"></div></td>
    </tr>
    <tr> 
      <td><div align="right"><em>#Votes# votes - #Percent#%</em></div></td>
    </tr>
  </cfoutput> 
  
  <!--- Display the total number of votes --->
  
  <cfoutput query="Totals"> 
    <tr> 
      <td><div align="right"><strong>Total:</strong><em><strong> </strong>#Int(TotalVotes)# 
          votes</em></div></td>
    </tr>
  </cfoutput> 
</table>

</cfif>

<cfelse>

<!--- Show the previous polls list --->

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
	<br>
	<div align="center">
    Choose a question from the droplist and hit the 'Show Me' button to see the corresponding results.
	</div>
	</td>
  </tr>
</table>

<BR>
<div align="center">
<form action="?module=polls&action=past_results" method="post">

	<cfquery datasource="#datasrc#" name="CurrentID" MAXROWS="1">
	SELECT questions.QuestionID
	FROM #table_poll_q# questions
	ORDER BY QuestionID DESC
	</cfquery>
	<cfset Current=CurrentID.QuestionID>
	<cfquery datasource="#datasrc#" name="PastPolls">
		SELECT Question, QuestionID
		FROM #table_poll_q# questions
		WHERE QuestionID <> '<cfoutput>#Current#</cfoutput>'
		ORDER by QuestionID DESC
	</cfquery>
    <select name="QuestionID">
       <cfoutput query="PastPolls">
        <option value="#QuestionID#">#Question#</option>
       </cfoutput>
	</select>
	<input type="submit" name="Submit" value="Show me">
</form>
</div>
</cfif>

</cfif>
