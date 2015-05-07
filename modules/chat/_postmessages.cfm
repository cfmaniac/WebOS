<!--- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        If a new message if posted, put into the application variable so everyone can see it
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ --->
<cfif IsDefined("FORM.new_message") and FORM.new_message IS NOT "">
      <cfset FORM.new_message = ReplaceList(FORM.new_message, Application.WordBanList, Application.WordReplace)>
	 <cfset Application.MessageLog = "<b>#session.MyUserName#</b>: #FORM.new_message#<br>" & Application.MessageLog>
</cfif>

<!--- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
         DISPLAY THE FORM THAT ALLOWS NEW MESSAGE TO BE ENTERED
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ --->
<html>
  <head>
     <title>Post New Message</title>
  </head>

  <body bgcolor="#000000" onLoad="document.post.new_message.focus()">

  <form action="postmessages.cfm" method="post">
  <table width="100%" border="0">
    <tr>
       <td width="100%"><input type="text" name="new_message" value="" size="50">
                                    <input type="submit" name="PostIt" value="Post Message">
                                    <a href="logout.cfm" target="_top">Logout</a></td>
   </tr>
  </table>
</form>

</body>
</html>