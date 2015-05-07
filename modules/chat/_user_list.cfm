<html>
  <head>
    <title>Logged In Users</title>
  </head>

  <body>

  <cfoutput>
   <form>
    <strong>Logged In Users:</strong><BR>
    <ul>
    <cfloop list="#Application.UserList#" index="UserName" delimiters="#chr(9)#">
        <li>#UserName#</li>
    </cfloop>
    </ul>
    <input type="submit" name="Refresh" value="Refresh User List">
   </form>
  </cfoutput>

</body>
</html>