<br>

<cfquery datasource="#datasrc#" name="Totals">
SELECT Questions.Question, SUM(Answers.Votes) AS TotalVotes
 FROM #table_poll_q# questions INNER JOIN #table_poll_a# Answers 
 ON Questions.QuestionID=Answers.QuestionID
 WHERE Questions.QuestionID=#Form.QuestionID#
 GROUP BY Questions.Question
</cfquery>

<!--- Query the answers and the number of votes for each one. --->

<cfquery datasource="#datasrc#" name="Results">
SELECT Answers.Answer, Answers.Votes
 FROM #table_poll_a# Answers
 WHERE Answers.QuestionID=#Form.QuestionID#
 ORDER BY Answers.AnswerID
</cfquery>

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
      <!--- The width of the bar image is equal to the percentage. --->
      
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
     <tr> 
      <td><div align="right">&nbsp;</div></td>
    </tr>
    <tr> 
      <td><div align="right"><a href="?module=polls"> Return to Main</a></div></td>
    </tr>
  </cfoutput> 
</table>

