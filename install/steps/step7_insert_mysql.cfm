<!--Sucessfully Loaded the MySQL Creation Script -->

<!---\\ This Populates the Most minimal of information from the webos_data.sql file //--->
<cftransaction>
<!---<cffile action="read" file="#form.site_location#\db\#form.db_type#\webos_test.sql" variable="test_sql">--->
<cfquery name="populate_tables" datasource="#form.datasrc#">
INSERT webos_company_info (company_name, company_address, company_address_2, company_tollfree, company_phone, company_fax, company_city, company_state, company_zip) VALUES ('WebOS', '9522 Royal Palm Blvd.', '', '888.555.1212', '954.496.1485', '', 'Coral Springs', 'FL', '33065')
</cfquery>

<cfquery name="populate_tables_2" datasource="#form.datasrc#">
INSERT INTO webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column,
side_box_active , side_box_position)VALUES ('1', 'Articles', 'articles.cfm', 'left', '1', '1');
</cfquery>
<cfquery name="populate_tables_2a" datasource="#form.datasrc#">
INSERT INTO webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column,
side_box_active , side_box_position)VALUES ('2', 'Articles Archive', 'articles_archives.cfm', 'left', '1', '1');
</cfquery>
<cfquery name="populate_tables_2b" datasource="#form.datasrc#">
INSERT INTO webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column,
side_box_active , side_box_position)VALUES ('3', 'Current Blog Posts', 'blog_posts.cfm', 'left', '1', '1');
</cfquery>
<cfquery name="populate_tables_2c" datasource="#form.datasrc#">
INSERT INTO webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column,
side_box_active , side_box_position)VALUES ('4', 'Did you Know...', 'dyk.cfm', 'left', '1', '1');
</cfquery>
<cfquery name="populate_tables_2d" datasource="#form.datasrc#">
INSERT INTO webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column,
side_box_active , side_box_position)VALUES ('5', 'Newsletter Subscription', 'newsletters.cfm', 'left', '1', '1');
</cfquery>
<cfquery name="populate_tables_2e" datasource="#form.datasrc#">
INSERT INTO webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column,
side_box_active , side_box_position)VALUES ('6', 'Site Pages', 'pages_menu.cfm', 'left', '1', '1');
</cfquery>
<cfquery name="populate_tables_2f" datasource="#form.datasrc#">
INSERT INTO webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column,
side_box_active , side_box_position)VALUES ('7', 'Available Sections', 'site_modules.cfm', 'left', '0', '1');
</cfquery>
<cfquery name="populate_tables_2g" datasource="#form.datasrc#">
INSERT INTO webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column,
side_box_active , side_box_position)VALUES ('8', 'Site Search', 'site_search.cfm', 'left', '1', '1');
</cfquery>
<cfquery name="populate_tables_2h" datasource="#form.datasrc#">
INSERT INTO webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column,
side_box_active , side_box_position)VALUES ('9', 'Stock Quotes', 'stock_quotes.cfm', 'left', '1', '1');
</cfquery>
<cfquery name="populate_tables_2i" datasource="#form.datasrc#">
INSERT INTO webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column,
side_box_active , side_box_position)VALUES ('10', 'User Profile', 'user_login.cfm', 'left', '1', '1');
</cfquery>

<cfquery name="populate_tables_3" datasource="#form.datasrc#">
INSERT webos_metatags (meta_subject, meta_description, meta_keywords, meta_language, meta_expires, meta_abstract, meta_site_name, meta_revisit, meta_distribution, meta_bots, meta_googlebot, meta_msnbot) VALUES ('ColdFusion CMS', 'WebOS: Coldfusion Website Operating System', 'Coldfusion, CMS, Website, Content Management, Blog, Google Analytics, articles, banners, chat,', 'English', 'Never', 'WebOS: Coldfusion Website Operating System', 'WebOS Development Site', '4 Days', 'Global', 'Index', 'Index', 'Index')
</cfquery>

<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (1, 'Site Configured', 'site_configured', '1', 'Tells the System if the WebOS System has been configured', 'CORE', 0, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (2, 'Site License', 'site_license', 'WEBOS_001_RC15_D', 'License Key for WebOS', 'CORE', 0, NULL);
</cfquery>
<cfquery name="populate_tables_3" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES(3, 'Site Name', 'site_name', '#form.site_name#', 'Title of your Website', 'SYSTEM', 1, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (4, 'Site Type', 'site_type', '#form.site_type#', 'Type of Site WebOS is running', 'CORE', 2, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (5, 'Site Admin Dir', 'site_admin_dir', '#form.site_admin_dir#', 'The Location of the Admin Directory', 'SYSTEM', 3, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (6, 'Site Modules Dir', 'site_modules_dir', '#form.site_modules_dir#', 'the Location of the Modules Directory', 'SYSTEM', 4, NULL);
</cfquery>

<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (7, 'Site Location', 'site_location', '', 'The Path on Server of the Webos Installation', 'CORE', 5, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (8, 'Client Name', 'client_name', '#form.client_name#', 'The Name of the Client for WebOS', 'SYSTEM', 6, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (9, 'Client Email', 'client_email', '#form.client_email#', 'The Email address of the Client', 'SYSTEM', 7, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (10, 'Site Team', 'site_team', 'dev', 'The Team Developing the Website', 'SYSTEM', 8, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (11, 'Site Email', 'site_email', 'jharvey@moxymedia.com', 'The Email of the Team Developing the Website', 'SYSTEM', 9, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (12, 'Data Source', 'datasrc', '#form.datasrc#', 'The Datasource for WebOS databases', 'CORE', 10, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (13, 'Site Template', 'site_template', '#form.site_template#', 'The Default Template Layout for the Site', 'TEMPLATES', 0, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (14, 'Site Header', 'site_header', '#form.site_header#', 'Your Header for the Website', 'TEMPLATES', 1, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (15, 'Site Footer', 'site_footer', '#form.site_footer#', 'Your Footer for the Website', 'TEMPLATES', 2, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (16, 'Site Width', 'site_width', '#form.sitE_width#', 'The Width of your Website (Pixels or Percent %)', 'TEMPLATES', 3, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (17, 'Left Column Active', 'left_col_active', '#form.left_col_active#', 'Activate/DeActivate the Left Column of your Website', 'TEMPLATES', 4, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (18, 'Left Column Width', 'left_col_width', '#form.left_col_width#', 'The Width of your Left Column', 'TEMPLATES', 5, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (19, 'Right Column Active', 'right_col_active', '#form.right_col_active#', 'Activate/DeActivate the Right Column of your Template', 'TEMPLATES', 6, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (20, 'Right Column Width', 'right_col_width', '#form.right_col_width#', 'The Width of your Right Column', 'TEMPLATES', 7, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (21, 'Reinitialization Code', 'reinit_code', 'WEBOS_CF_2007', 'The Reinstallation code for re-running the Installer', 'CORE', 11, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (24, 'Site Headers Dir', 'site_header_dir', '#form.site_header_dir#', 'The Location of the Headers Directory', 'TEMPLATES', 8, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (23, 'Site Templates Dir', 'site_template_dir', '#form.site_template_dir#', 'The Location of the Templates Directory', 'SYSTEM', 12, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (25, 'Site Footers Dir', 'site_footer_dir', '#form.site_footer_dir#', 'The Location of the footers Directory', 'TEMPLATES', 9, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (26, 'Site Assets Dir', 'site_assets_dir', '#form.site_assets_dir#', 'The Location of the Assets directory that holds your site images, scripts and styles', 'TEMPLATES', 10, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (27, 'Site Scripts Dir', 'site_scripts_dir', '#form.site_scripts_dir#', 'the Location of your JavaScripts Directory insite of your Site Assets Folder', 'TEMPLATES', 11, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (28, 'Site Styles Dir', 'site_styles_dir', '#form.site_styles_dir#', 'The Location of your Site Styles Sheets directory inside of your Site Assets Directory', 'TEMPLATES', 12, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (29, 'Site Style Sheet', 'site_style_sheet', '#form.site_style_sheet#', 'The Name of the Style Sheet for your site', 'TEMPLATES', 13, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (31, 'Side Boxes Dir', 'site_sidebox_dir', '#form.site_side_boxes#', 'The Name of the Directory holding all the modules Side Boxes', 'TEMPLATES', 15, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (32, 'Site Domain ', 'site_domain', '#form.site_domain#', 'The Name of the Domain where the System resides', 'SYSTEM', 0, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (33, 'Mail Server', 'site_mail_server', '#form.site_mail_server#', 'The Name of your Mail Server. (i.e., mail.yoursite.com)', 'CORE', 0, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (34, 'Mail Server Username', 'site_mail_user', '#form.site_email#', 'Your Username for your mail server', 'SYSTEM', 0, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (35, 'Mail Server Password', 'site_mail_pass', '', 'Your Password for your mail server ', 'SYSTEM', 0, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (36, 'Site Folder', 'site_folder', '#form.site_folder#', 'The Folder Under the Domain where the system is installed', 'SYSTEM', 0, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (37, 'Send HTML Email', 'send_html_email', '1', 'Set to ''1'' to Send HTML Emails. Otherwise, Set to ''0''', 'SYSTEM', 0, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (38, 'Template Index', 'template_file', '#form.template_file#', 'The index file for the Template', 'TEMPLATES', 0, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (39, 'Website ID', 'website_id', '0001', 'The ID Number of the Website Running WebOS', 'CORE', 0, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (40, 'Website Category ID', 'website_cat_id', '0001', 'The Category ID of the Site Type', 'CORE', 0, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (41, 'RSS Feeds Logo', 'rss_logo', 'moxy_rss.jpg', 'The Logo of your Website, Displayed for RSS Feeds Module', 'TEMPLATES', 1, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (42, 'RSS Feeds Logo Directory', 'rss_logo_dir', 'rss_logo/', 'The Directory for your RSS Feeds Logo', 'TEMPLATES', 1, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (43, 'WebOS Version', 'webos_version', '1.25', 'The Version of WebOS', 'CORE', 0, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (44, 'Display Company Information on Contact Page', 'inquiry_show_info', '1', 'Enable/Disable Viewing of Company Information on Contact Page', 'CORE', 0, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (45, 'Enable Dynamic Page Titles on Webiste', 'show_page_titles', '1', 'Enables display of Page Titles in your Browser', 'CORE', 0, NULL);
</cfquery>
<cfquery name="populate_tables_4" datasource="#form.datasrc#">
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified) VALUES (50, 'Datebase Type', 'db_type', '#form.db_type#', 'Tells WebOS what Type of Database it is running on', 'CORE', 0, NULL);
</cfquery>

<cfquery name="populate_tables_5" datasource="#form.datasrc#">
INSERT webos_company_hours (hours_monday, hours_tuesday, hours_wednesday, hours_thursday, hours_friday, hours_saturday, hours_sunday) VALUES ('9am-5pm', '9am-5pm', '9am-5pm', '9am-5pm', '9am-5pm', 'Closed', 'Closed')
</cfquery>

<cfquery name="populate_tables_7" datasource="#form.datasrc#">
INSERT webos_rss_config (rss_config_id, randomize_feeds, random_feed_value) VALUES (1, 0, 0);
</cfquery>

<cfquery name="populate_tables_8" datasource="#form.datasrc#">
INSERT webos_rss_feeds (rss_id, rss_title, rss_content, rss_status, rss_weight) VALUES (4, 'NY Times World News' , 'http://www.nytimes.com/services/xml/rss/nyt/International.xml' , 1, 0);
</cfquery>
<cfquery name="populate_tables_8" datasource="#form.datasrc#">
INSERT webos_rss_feeds (rss_id, rss_title, rss_content, rss_status, rss_weight) VALUES (5, 'NY Times Automotive News' , 'http://www.nytimes.com/services/xml/rss/nyt/Automobiles.xml' , 1, 1)
</cfquery>


<cfquery name="populate_tables_9" datasource="#form.datasrc#">
INSERT webos_spotlights (spotlight_id, spotlight_title, spotlight_description, spotlight_time_sensitive) VALUES (1, 'WebOS Spotlight', 'WebOS Spotlights Module can be used to highlight new features, articles, news Topics, or anyhting you care to highlight on your site''s main page!<br><br><img src="http://localhost/_local_dev/_webos/admin/_assets/_icons/icon_edit_topic.gif" alt="include images too" align="absmiddle" border="0" hspace="0" vspace="0">And Yes you can even include images...<br>', 0);
</cfquery>
<cfquery name="populate_tables_9" datasource="#form.datasrc#">
INSERT webos_spotlights (spotlight_id, spotlight_title, spotlight_description, spotlight_time_sensitive) VALUES (2, 'WebOS is Versatile', 'WebOS has been developed to be extremely verstaile and incredibly customizable...', 0)
</cfquery>
<cfquery name="populate_tables_9" datasource="#form.datasrc#">
INSERT webos_spotlights (spotlight_id, spotlight_title, spotlight_description, spotlight_time_sensitive) VALUES (3, 'WebOS is Fully Customizable!', 'You can Customize WebOS to easily look like your current Website with our Easy to use and Edit Templates!', 0);
</cfquery>
<cfquery name="populate_tables_9" datasource="#form.datasrc#">
INSERT webos_spotlights (spotlight_id, spotlight_title, spotlight_description, spotlight_time_sensitive) VALUES (4, 'More Default Modules than any other CMS! ', 'Currently, WebOs comes out-of-the box with over 20 standard Modules!<br>That''s Right!<br> How many other CMS Systems come with an integrated Chat, Forums, Search Engine Friednly ULS, Image Gallery, and RSS Feeds!', 0);
</cfquery>

<cfquery name="populate_tables_10" datasource="#form.datasrc#">
INSERT webos_pages (page_id, page_title, page_content, page_in_menu, page_status, weight) VALUES (1, 'About WebOS', 'WebOS was developed because of the need for an easy to edit, install and administrate content management system in ColdFusion. The Company I was working for had an aging ''Legacy''-based CMS, which was at the best, difficult if not tedious to install, update and modify.<br><br>WebOS solves all of the tediousness and difficulties in running and administrating a Dynamic ColdFusion CMS.<br><br>With an easy-to-use Administration Panel, anyone with a little knwledge can use and administrate WebOS. <br><br>WebOS is a module-based CMS with a template structure used to change the site layout easily without extensive HTML knowledge.<br><br>WebOS comes out-of-the-box per say with a wide variety of modules:<br>Google Analytics, Article Manager, Banner Manager, Blog, BreadCrumb Navigation, Chat System, Did-you-Know Module, Forum, Image Gallery, Customizable Contact Form, Links Directory, Meta Tag Generator, News Manager, Page Editor, PodCast Library, Polls &amp; Surveys, Mortgage Rates Ticker, RSS Feeds, Search Engine Friendly URLS, SiteMap, Site Search, Spotlights Manager, TaxForms Search and Download Manger, Tell-a-Friend Manager.<br><br>Having this Modular architecture makes WebOS easy to install, modify and use!<br>', 1, 1, 0);
</cfquery>

<cfquery name="populate_tables_11" datasource="#form.datasrc#">
INSERT webos_sitesearch (search_in, search_in_value) VALUES ('articles', 1);
</cfquery>
<cfquery name="populate_tables_11" datasource="#form.datasrc#">
INSERT webos_sitesearch (search_in, search_in_value) VALUES ('pages', 1);
</cfquery>
<cfquery name="populate_tables_11" datasource="#form.datasrc#">
INSERT webos_sitesearch (search_in, search_in_value) VALUES ('blog', 1);
</cfquery>
<cfquery name="populate_tables_11" datasource="#form.datasrc#">
INSERT webos_sitesearch (search_in, search_in_value) VALUES ('links', 1);
</cfquery>
<cfquery name="populate_tables_11" datasource="#form.datasrc#">
INSERT webos_sitesearch (search_in, search_in_value) VALUES ('rss', 1);
</cfquery>
<cfquery name="populate_tables_11" datasource="#form.datasrc#">
INSERT webos_sitesearch (search_in, search_in_value) VALUES ('forum', 1);
</cfquery>

<cfquery name="populate_tables_13" datasource="#form.datasrc#">
INSERT webos_inquiry_subjects (subject) VALUES ('General Inquiry');
</cfquery>
<cfquery name="populate_tables_11" datasource="#form.datasrc#">
INSERT webos_inquiry_subjects (subject) VALUES ('Website Issues');
</cfquery>
<cfquery name="populate_tables_11" datasource="#form.datasrc#">
INSERT webos_inquiry_subjects (subject) VALUES ('Technical Support');
</cfquery>
<cfquery name="populate_tables_11" datasource="#form.datasrc#">
INSERT webos_inquiry_subjects (subject) VALUES ('Advertising Information');
</cfquery>

<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (1, 'Google Analytics', 'Enables Google Analytics for your Website', 1, 0, '', 'analytics', 1);
</cfquery>
<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (2, 'Articles', 'Enables you to have Articles on your Website', 1, 0, 'left', 'articles', 1);
</cfquery>
<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (3, 'Banners', 'Enables Banners on your website', 0, 0, 'left', 'banners', 1);
</cfquery>
<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (4, 'Blog', 'Enables a Web Blog on your site', 1, 3, 'left', 'blog', 1);
</cfquery>
<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (5, 'Chat', 'Enables a Chat System on your Site for either Users or For Live Support', 1, 4, 'left', 'chat', 0);
</cfquery>
<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (6, 'Did you Knows', 'Have Randomized ''Did You Know'' content on your website', 1, 2, '', 'didyouknow', 1);
</cfquery>
<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (8, 'Links Directory', 'Enables your site to have a Links Directory', 1, 5, 'left', 'links', 1);
</cfquery>
<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (9, 'Meta Tags', 'Inserts Pre-Optimized Meta Tags for your Website', 1, 0, '', 'metatags', 1);
</cfquery>
<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (11, 'Pages', 'Create and Update Content Pages for your Website', 1, 1, 'center', 'pages', 1);
</cfquery>
<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (12, 'PodCasts', 'Enable PodCasts for your Website', 1, 0, 'left', 'podcasts', 1);
</cfquery>
<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (13, 'Polls', 'Enable Polling & Surveys on your Website', 1, 0, 'left', 'polls', 1);
</cfquery>
<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (14, 'Rate Ticker', 'Mortgage rates Ticker for Financial-type Websites', 0, 0, '', 'ratesticker', 0);
</cfquery>
<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (15, 'RSS Feeds', 'Enables RSS Feeds for your Website', 1, 0, 'left', 'rss', 1);
</cfquery>
<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (16, 'SEO Friendly URLS', 'Enables SEF URLs for your website', 0, 0, '', 'sefurls', 0);
</cfquery>
<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (17, 'Sitemap', 'Generates an easy to Follow Site Map', 1, 0, 'footer', 'sitemap', 0);
</cfquery>
<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (18, 'Site Search', 'Enables a Search Egnie for your Website', 1, 0, 'header', 'sitesearch', 1);
</cfquery>
<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (19, 'Spotlights', 'Have Spotlighted Content Displayed on your website', 1, 0, '', 'spotlights', 1);
</cfquery>
<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (20, 'Tax Forms', 'Tax Form Search and Download Utility for Financial-type Sites', 0, 0, 'left', 'taxforms', 0);
</cfquery>
<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (21, 'Tell-A-Friend', 'Have users tell friends about features on your website', 1, 0, 'right', 'tellafriend', 0);
</cfquery>
<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (22, 'Stock Ticker', 'Scrolling Stock Ticker', 0, 0, 'left', 'stockticker', 1);
</cfquery>
<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (23, 'Main Page', 'Your Main (or Home) Page', 1, 1, 'center', 'mainpage', 1);
</cfquery>
<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (24, 'Inquiry Form', 'Fully Customizable Contact Form for Your Website', 1, 0, 'center', 'inquiry', 1);
</cfquery>
<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (25, 'Forum', 'Enables your WebOS System to have a Forum', 1, 0, 'left', 'forum', 1);
</cfquery>
<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (26, 'Breadcrumbs', 'Easy Navigation Links so your users can easily navigate your Website', 1, 0, 'center', 'breadcrumbs', 0);
</cfquery>
<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (27, 'Zip Search', 'Enables your site to use a Zip Search Utility', 0, 0, 'center', 'zipsearch', 0);
</cfquery>
<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (28, 'User Profiles', 'Enables Users to Sign-up and Create a Profile for your site', 1, 0, 'center', 'users', 0);
</cfquery>
<cfquery name="populate_tables_12" datasource="#form.datasrc#">
INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin) VALUES (29, 'Newsletter', 'Enables your site to have a Newsletter Subscription System', 1, 0, 'center', 'newsletter', 1);
</cfquery>

<cfquery name="populate_tables_13" datasource="#form.datasrc#">
INSERT webos_mainpage (main_page_id, main_page_title, main_page_content, main_page_time_sensitive, main_page_start_date, main_page_expire_date, main_page_active) VALUES (1, 'WebOS'' MainPage Goes Dynamic', 'This is a demo site powered by WebOS. Based on Coldfusion with a

template technology and integrated with a MSSQL database, it is a fully

functional Site Engine that allows you to try WebOS. <p justify\="" align="\"><b>This service is for demo purposes only.</b> No real content. No real polls. No real anything. Please do however, work with and use the WebOS system.</p> <p justify\="" align="\">To replace this text with a welcome message of your own, log in to the <a href="admin/index.cfm">administration panel</a>, and in the left hand menu, select, Modules, MainPage under the Site Configuration menu.</p><p justify\="" align="\">If you see an Expiration date in the lower right-hand corner, a new page will be displayed on that date. <br></p><br>', 0, '2008-01-03 00:01:00.0', '2008-01-03 00:01:00.0', 1)
</cfquery>
</cftransaction>