<cfoutput>
<html>
  <head>
     <title>#Application.Title#</title>
  </head>

<cfif session.goodUser eq "Yes">
  <frameset rows="65,*" frame border="0">
     <frame name="postmessage" scrolling="no" noresize src="postmessages.cfm">
      <frameset cols="150,*" frame border="0">
          <frame name="users" target="main" src="user_list.cfm">
          <frame name="main" src="messages.cfm">
      </frameset>
      <noframes>
         <body>
            <p>This page uses frames, but your browser doesn't support them.</p>
         </body>
      </noframes>
  </frameset><cfelse>
  <cflocation url="../../http://#site_domain##site_folder#index.cfm?module=#module#">
</cfif>

</html>
</cfoutput>