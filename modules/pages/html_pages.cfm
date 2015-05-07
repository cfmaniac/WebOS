<html>
<head>
<title>Generating Static HTML with ColdFusion</title>
</head>

<body>
<cfscript>
     //Set the URL of your site. For example, www.domain.com (do NOT include http:// or a trailing slash)
     myurl = "localhost";
     //Let's retrieve the current path so we can store the file without problems. Remember, your directory     //must have write permissions
     path = GetDirectoryFromPath(GetCurrentTemplatePath());
     //Lets set the pages that we want to make static. We will convert the extension to html
     pages = arrayNew(2);
     //We need to define the page to load
     pages[1][1] = "index.cfm";
     //For each file, we will need to tell it what file to create (we'll do this for each file)
     pages[1][2] = "index.html";
     pages[2][1] = "index.cfm?id=resume";
     pages[2][2] = "resume.html";
     pages[3][1] = "index.cfm?id=about";
     pages[3][2] = "about.html";
     pages[4][1] = "index.cfm?id=contact";
     pages[4][2] = "contact.html";
     //Now our pages are stored in an array so we can loop the list now.</cfscript>
<cfloop from="1" to="#ArrayLen(pages)#" index="i">
     <cfhttp method="get" url="http://#myurl#/#pages[i][1]#" throwonerror="yes">
     <cftry>
          <cffile action="write" file="#path#/#pages[i][2]#" output="#cfhttp.FileContent#">
          <cfoutput><b>#pages[i][1]# has been converted to #pages[i][2]#</b><br></cfoutput>
          <cfcatch type="any">
               <cfoutput>#pages[i][1]# was NOT converted to #pages[i][2]#<br></cfoutput>
          </cfcatch>
     </cftry>
</cfloop>
</body>
</html>