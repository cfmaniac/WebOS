<!---\\ Module Configuration //--->
<cfset module ="chat">
<!---\\ End of Module Configuration //---->
<body>
    <!---<form action="<cfoutput>#site_modules_dir#</cfoutput>chat/enter_chat.cfm" method="post">--->
    <form action="http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm?module=#module#&action=enter" method="post">
    <cfif IsDefined("UserMessage")>
       <cfoutput>#UserMessage#</cfoutput>
    </cfif>
    <table width="300" border="0">
      <tr>
          <td width="50%">Screen Name:</td>
          <td width="50%"><input type="text" name="MyUsername" value=""></td>
      </tr>
      <tr>
          <td width="100%" colspan="2"><input type="submit" name="LogMeIn" value="Log In"></td>
      </tr>
    </table>
    </form>
  </body>