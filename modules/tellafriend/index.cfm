<!---\\ Module Configuration //--->
<cfset module ="tellafriend">
<!---\\ End of Module Configuration //---->
<cfif isDefined('form.tella')>
    <html>
    <meta http-equiv="REFRESH" content="4; url=http://<cfoutput>#site_domain##site_folder#</cfoutput>index.cfm">
    <body>
        <cfmail to="#form.tella#" from="info@yoursite.com" subject="A friend wants you to check out YOUR SITE HERE" server="mail.swidigital.com">
            Someone you know has visited #site_name# and requested we send you an email regarding...

            Check it out today!

            <a href="http://www.yoursite.com">YourSite.com</a>

            Thanks for your time!

            Person's Name
            www.YourSite.com

        </cfmail>

        Your friend has been emailed. Thanks for spreading the word about YourSite.com!<br><br>
        You'll be directed back to YourSite momentarily. Or, you can click below now.<br><br>
        <a href="http://www.yoursite.com">Back to Home page</a>
    </body>
    </html>
<cfelse>
    <table border="0" cellpadding="0" cellspacing="0" width="94%">
    <form name="frmTellaFriend" action="?module=tellafriend" method="post">
        <tr>
            <td colspan="2" align="left">Tell a Friend About YourSite:</td>
        </tr>
        <tr>
            <td align="left"><input type="text" name="tella" size="10" value="Email Address" onFocus="document.frmTellaFriend.tella.value = '';"></td>
            <td align="left"><input type="image" name="btngo" value="Search" src="../assets/graph/send.gif" width="37" height="21" border="0" alt="Send Email"></td>
        </tr>
    </form>
    </table>
</cfif> 