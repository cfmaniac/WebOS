<cfset module="chat">
<!--- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        LET EVERYONE KNOW THAT THIS USER LOGGED OUT
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ --->
<cfset Application.MessageLog = "<font color=red><b>#session.MyUserName# Logged Out at #DateFormat(now())# #TimeFormat(now())#</b></font><br>" & Application.MessageLog>
<!--- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        TAKE USER OUT OF THE LIST OF LOGGED IN USERS
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ --->
<!---<cfset Application.UserListCounter = ListDeleteAt(Application.UserListCounter, ListFindNoCase(Application.UserList, session.MyUsername))>--->
<cfset Application.UserList = ListDeleteAt(Application.UserList, ListFindNoCase(Application.UserList, session.MyUsername, "#chr(9)#"), "#chr(9)#")>
<!--- ^^^^^^^^^^^^^
         LOG THE USER OUT
        ^^^^^^^^^^^^^ --->
<cfset session.MyUsername = "">
<cfset session.goodUser = "No">
<!--- ^^^^^^^^^^^^^^^^^^^^^^^^^
        TAKE USER BACK TO THE LOGIN PAGE
        ^^^^^^^^^^^^^^^^^^^^^^^^^ --->
<cflocation url="../../http://#site_domain##site_folder#index.cfm?module=#module#" addtoken="Yes">