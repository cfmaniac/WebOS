<!---\\ Module Configuration //--->
<cfset module ="ratesticker">
<!---\\ End of Module Configuration //---->
<cfinvoke component="getrates" method="getrates">
 <!---<cfinvokeargument name="dest_url" value="http://localhost/cfc_dev/rates/">
 <cfinvokeargument name="dest_dir" value="C:\Inetpub\wwwroot\cfc_dev\rates\">--->
 <cfif #cgi.SERVER_NAME# EQ "capital.com">
 <cfinvokeargument name="dest_url" value="http://capital.com/components/rates/">
 <cfinvokeargument name="dest_dir" value="F:\webroot\capital.com\components\rates\">
 <cfelseif cgi.sserver_name eq "localhost">
 <cfinvokeargument name="dest_url" value="http://localhost/cfc_dev/rates/">
 <cfinvokeargument name="dest_dir" value="C:\Inetpub\wwwroot\cfc_dev\rates\">
 <cfelseif cgi.server_name eq "dev.swidigital.com">
 <cfinvokeargument name="dest_url" value="http://dev.swidigital.com/capital.com/components/rates/">
 <cfinvokeargument name="dest_dir" value="C:\Webroot\Dev.swidigital.com\capital.com\components\rates\">
 </cfif>
 <cfinvokeargument name="grabrates_url" value="http://www.bankrate.com/aff/jsfeeds/aff-mtg-2.js">
 <center>
<script language="javascript" src="ticker.js">
</script>
</center>
</cfinvoke>