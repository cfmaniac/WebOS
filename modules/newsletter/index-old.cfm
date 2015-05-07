<!---\\ Module Configuration //--->
<cfset module ="newsletter">
<!---\\ End of Module Configuration //---->
<!---\\Subscription Routine//--->
<cfif isDefined('url.action') and #url.action# EQ "subscribe">
<CFIF IsDefined("Email")>
     <!--- Insert Member Information Into Database --->
     <CFINSERT DATASOURCE="#datasrc#" TABLENAME="#table_newsletters#" Formfields="userid, firstname, lastname, email, emailtype">

     <CFOUTPUT>
       Thank you,
       Your email address  Has been entered into our mailing list. You'll receive the next mailing!
     </CFOUTPUT>
     <cfif isDefined('session.allowin') and #session.allowin# EQ "Yes">
     <cfquery name="subscribed" datasrc="#datasrc#">
     update #table_usrs# set is_subscribed ='1' where userid='#session.userid#'
     </cfquery>
     </cfif>
</CFIF>     
<CFELSE>
     <!--- Prompt User To Enter information --->
     <form action="http://#site_domain##site_folder#index.cfm?module=newsletter&action=subscribe" method="post">
     <cfif isDefined('session.allowin') and #session.allowin# EQ "Yes">
     <input type="hidden" name="userid" value="#session.userid#" />
     <cfif not isDefined('session.allowin') or #session.allowin# EQ "no">
     <input type="hidden" name="userid" value="anonymous-users-subscribe" />
     </cfif>
       Name: <input type="Text" Value="" Name="Name"><BR>
       Email: <input type="Text" Value="" Name="Email"><BR>
       Receive in: Text <input type="Radio" name="EmailType" value="1">
                   HTML <input type="Radio" name="EmailType" value="0">
       <input type="Submit" Value="Join #table_newsletters#">
     </FORM>
</CFIF>
<cfelseif isDefined('url.action') and #url.action# EQ "unsubscribe">
<!---\\UnSubscribe Routine//--->
<CFIF IsDefined("Email")>
    <CFQUERY DATASOURCE="#datasrc#" NAME="Unsubscribe">
        DELETE
          FROM #table_newsletters#
         WHERE Email = '#Email#'
    </CFQUERY>
    <cfquery datasource="#datasrc#" name="user_unsub">
    UPDATE #table_usrs# set newsletter_sign_up = '0' where userid='#session.userid#'
    </cfquery>
    <CFOUTPUT>
       Thank you,<br>
       Your email address [#Email#] Has been removed from our mailing list. You'll never receive mailing again!
    </CFOUTPUT>
</CFIF>
<CFELSE>
    <!--- Display the unsubscribe form --->
     <form action="unsubscribe.cfm" method="post">
       Name: <input type="Text" Value="" Name="Name"><BR>
       Email: <input type="Text" Value="" Name="Email"><BR>
       <input type="Submit" Value="Join">
    </FORM>
</CFIF>
<cfelseif isDefined('url.section') and #url.section# EQ "newsletter_archives">
<cfinclude template="newsletter_archives.cfm">
</cfif>