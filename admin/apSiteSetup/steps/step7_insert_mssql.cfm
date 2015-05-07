<!--Sucessfully Loaded the MSSQL Insertion Script -->
<!---\\ This Populates the Most minimal of information from the webos_data.sql file //--->

<!--- <cfset form.siteID=CreateUUID()> --->
<!--- <cfdump var="#form.siteID#"><cfabort> --->

<cftransaction>
<!---<cffile action="read" file="#form.site_location#\db\#form.db_type#\webos_test.sql" variable="test_sql">--->
<cfquery name="populate_tables" datasource="#form.datasrc#">
INSERT webos_company_info (company_name, company_address, company_address_2, company_tollfree, company_phone, company_fax, company_city, company_state, company_zip, SiteID) VALUES ('#form.site_Name#', 'To Be Entered Step 2', 'step2', 'Step2', 'Step2', '', 'step2', '22', 'step2', '#form.siteID#')

 SET IDENTITY_INSERT webos_config_sidebox ON

INSERT webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column, side_box_active, side_box_position, siteID) VALUES (1, 'Articles', 'articles.cfm', 'left', '1','0', '#form.siteID#')
INSERT webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column, side_box_active, side_box_position, siteid) VALUES (2, 'Articles Archive', 'articles_archives.cfm', 'left', '1','1', '#form.siteID#')
INSERT webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column, side_box_active, side_box_position, siteID) VALUES (3, 'Current Blog Posts', 'blog_posts.cfm', 'left', '1','3', '#form.siteID#')
INSERT webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column, side_box_active, side_box_position, siteID) VALUES (4, 'Did You Know...', 'dyk.cfm', 'left', '1','4', '#form.siteID#')
INSERT webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column, side_box_active, side_box_position, siteID) VALUES (5, 'Newsletter Subscription', 'newsletters.cfm', 'left', '1','0', '#form.siteID#')
INSERT webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column, side_box_active, side_box_position, siteID) VALUES (6, 'Site Pages', 'pages_menu.cfm', 'right', '1','0', '#form.siteID#')
INSERT webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column, side_box_active, side_box_position, siteID) VALUES (7, 'Available Sections', 'site_modules.cfm', 'right', '1','0', '#form.siteID#')
INSERT webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column, side_box_active, side_box_position, siteID) VALUES (8, 'Site Search', 'site_search.cfm', 'right', '1','0', '#form.siteID#')
INSERT webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column, side_box_active, side_box_position, siteID) VALUES (9, 'Stock Quotes', 'stock_quotes.cfm', 'right', '1','0', '#form.siteID#')
INSERT webos_config_sidebox (side_box_id, side_box_name, side_box_filename, side_box_column, side_box_active, side_box_position, siteID) VALUES (10, 'User Profile', 'user_login.cfm', 'right', '1','0', '#form.siteID#')
SET IDENTITY_INSERT webos_config_sidebox OFF

SET IDENTITY_INSERT webos_metatags ON

INSERT webos_metatags (meta_id, meta_subject, meta_description, meta_keywords, meta_language, meta_expires, meta_abstract, meta_site_name, meta_revisit, meta_distribution, meta_bots, meta_googlebot, meta_msnbot, siteID) VALUES (1, 'ColdFusion CMS', 'WebOS: Coldfusion Website Operating System', 'Coldfusion, CMS, Website, Content Management, Blog, Google Analytics, articles, banners, chat,', 'English', 'Never', 'WebOS: Coldfusion Website Operating System', 'WebOS Development Site', '4 Days', 'Global', 'Index', 'Index', 'Index', '#form.siteID#')

SET IDENTITY_INSERT webos_metatags OFF



SET IDENTITY_INSERT webos_config ON
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (1, 'Site Configured', 'site_configured', '1', 'Tells the System if the WebOS System has been configured', 'CORE', 0, NULL, '#form.siteID#')
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (2, 'Site License', 'site_license', 'WEBOS_001_RC15_D', 'License Key for WebOS', 'CORE', 0, NULL, '#form.siteID#')
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES(3, 'Site Name', 'site_name', '#form.site_name#', 'Title of your Website', 'SYSTEM', 1, NULL, '#form.siteID#')
INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (4, 'Site Type', 'site_type', '#form.site_type#', 'Type of Site WebOS is running', 'CORE', 2, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (5, 'Site Admin Dir', 'site_admin_dir', '#form.site_admin_dir#', 'The Location of the Admin Directory', 'SYSTEM', 3, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (6, 'Site Modules Dir', 'site_modules_dir', '#form.site_modules_dir#', 'the Location of the Modules Directory', 'SYSTEM', 4, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (7, 'Site Location', 'site_location', '#form.site_location#', 'The Path on Server of the WebOS Installation', 'CORE', 5, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (8, 'Client Name', 'client_name', '#form.client_name#', 'The Name of the Client for WebOS', 'SYSTEM', 6, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (9, 'Client Email', 'client_email', '#form.client_email#', 'The Email address of the Client', 'SYSTEM', 7, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (10, 'Site Team', 'site_team', 'dev', 'The Team Developing the Website', 'SYSTEM', 8, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (11, 'Site Email', 'site_email', 'jharvey@moxymedia.com', 'The Email of the Team Developing the Website', 'SYSTEM', 9, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (12, 'Data Source', 'datasrc', '#form.datasrc#', 'The Datasource for WebOS databases', 'CORE', 10, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (13, 'Site Template', 'site_template', '#form.site_template#', 'The Default Template Layout for the Site', 'TEMPLATES', 0, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (14, 'Site Header', 'site_header', '#form.site_header#', 'Your Header for the Website', 'TEMPLATES', 1, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (15, 'Site Footer', 'site_footer', '#form.site_footer#', 'Your Footer for the Website', 'TEMPLATES', 2, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (16, 'Site Width', 'site_width', '#form.sitE_width#', 'The Width of your Website (Pixels or Percent %)', 'TEMPLATES', 3, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (17, 'Left Column Active', 'left_col_active', '#form.left_col_active#', 'Activate/DeActivate the Left Column of your Website', 'TEMPLATES', 4, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (18, 'Left Column Width', 'left_col_width', '#form.left_col_width#', 'The Width of your Left Column', 'TEMPLATES', 5, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (19, 'Right Column Active', 'right_col_active', '#form.right_col_active#', 'Activate/DeActivate the Right Column of your Template', 'TEMPLATES', 6, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (20, 'Right Column Width', 'right_col_width', '#form.right_col_width#', 'The Width of your Right Column', 'TEMPLATES', 7, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (21, 'Reinitialization Code', 'reinit_code', 'WEBOS_CF_2007', 'The Reinstallation code for re-running the Installer', 'CORE', 11, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (24, 'Site Headers Dir', 'site_header_dir', '#form.site_header_dir#', 'The Location of the Headers Directory', 'TEMPLATES', 8, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (23, 'Site Templates Dir', 'site_template_dir', '#form.site_template_dir#', 'The Location of the Templates Directory', 'SYSTEM', 12, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (25, 'Site Footers Dir', 'site_footer_dir', '#form.site_footer_dir#', 'The Location of the footers Directory', 'TEMPLATES', 9, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (26, 'Site Assets Dir', 'site_assets_dir', '#form.site_assets_dir#', 'The Location of the Assets directory that holds your site images, scripts and styles', 'TEMPLATES', 10, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (27, 'Site Scripts Dir', 'site_scripts_dir', '#form.site_scripts_dir#', 'the Location of your JavaScripts Directory insite of your Site Assets Folder', 'TEMPLATES', 11, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (28, 'Site Styles Dir', 'site_styles_dir', '#form.site_styles_dir#', 'The Location of your Site Styles Sheets directory inside of your Site Assets Directory', 'TEMPLATES', 12, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (29, 'Site Style Sheet', 'site_style_sheet', '#form.site_style_sheet#', 'The Name of the Style Sheet for your site', 'TEMPLATES', 13, NULL, '#form.siteID#')


INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (31, 'Side Boxes Dir', 'site_sidebox_dir', '#form.site_side_boxes#', 'The Name of the Directory holding all the modules Side Boxes', 'TEMPLATES', 15, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (32, 'Site Domain ', 'site_domain', '#form.site_domain#', 'The Name of the Domain where the System resides', 'SYSTEM', 0, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (33, 'Mail Server', 'site_mail_server', '#form.site_mail_server#', 'The Name of your Mail Server. (i.e., mail.yoursite.com)', 'CORE', 0, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (34, 'Mail Server Username', 'site_mail_user', '#form.site_email#', 'Your Username for your mail server', 'SYSTEM', 0, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (35, 'Mail Server Password', 'site_mail_pass', '', 'Your Password for your mail server ', 'SYSTEM', 0, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (36, 'Site Folder', 'site_folder', '#form.site_folder#', 'The Folder Under the Domain where the system is installed', 'SYSTEM', 0, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (37, 'Send HTML Email', 'send_html_email', '1', 'Set to ''1'' to Send HTML Emails. Otherwise, Set to ''0''', 'SYSTEM', 0, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (38, 'Template Index', 'template_file', '#form.template_file#', 'The index file for the Template', 'TEMPLATES', 0, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (39, 'Website ID', 'website_id', '0001', 'The ID Number of the Website Running WebOS', 'CORE', 0, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (41, 'RSS Feeds Logo', 'rss_logo', 'moxy_rss.jpg', 'The Logo of your Website, Displayed for RSS Feeds Module', 'TEMPLATES', 1, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (42, 'RSS Feeds Logo Directory', 'rss_logo_dir', 'rss_logo/', 'The Directory for your RSS Feeds Logo', 'TEMPLATES', 1, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (43, 'WebOS Version', 'webos_version', '1.25', 'The Version of WebOS', 'CORE', 0, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (40, 'Website Category ID', 'website_cat_id', '0001', 'The Category ID of the Site Type', 'CORE', 0, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (41, 'Display Company Information on Contact Page', 'inquiry_show_info', '1', 'Enable/Disable Viewing of Company Information on Contact Page', 'CORE', 0, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (42, 'Enable Dynamic Page Titles on Webiste', 'show_page_titles', '1', 'Enables display of Page Titles in your Browser', 'CORE', 0, NULL, '#form.siteID#')

INSERT webos_config (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group, weight, last_modified, siteID) VALUES (50, 'Datebase Type', 'db_type', '#form.db_type#', 'Tells WebOS what Type of Database it is running on', 'CORE', 0, NULL, '#form.siteID#')
SET IDENTITY_INSERT webos_config OFF



SET IDENTITY_INSERT webos_mainpage ON

INSERT webos_mainpage (main_page_id, main_page_title, main_page_content, main_page_time_sensitive, main_page_start_date, main_page_expire_date, main_page_active, siteID) VALUES (1, 'WebOS''Welcome!', 'This is your default main page of your site. <b>This page will be updated soon!</b> We are loaded with tons of content designed to answer your questions about chiropractic care in our office.', 1, '', '', 1, '#form.siteID#')

SET IDENTITY_INSERT webos_mainpage OFF



SET IDENTITY_INSERT webos_modules ON

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (1, 'Google Analytics', 'Enables Google Analytics for your Website', 1, 0, '', 'analytics', 1, '#form.siteID#')

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (2, 'Articles', 'Enables you to have Articles on your Website', 1, 0, 'left', 'articles', 1, '#form.siteID#')

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (3, 'Banners', 'Enables Banners on your website', 0, 0, 'left', 'banners', 1, '#form.siteID#')

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (4, 'Blog', 'Enables a Web Blog on your site', 1, 3, 'left', 'blog', 1, '#form.siteID#')

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (5, 'Chat', 'Enables a Chat System on your Site for either Users or For Live Support', 1, 4, 'left', 'chat', 0, '#form.siteID#')

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (6, 'Did you Knows', 'Have Randomized ''Did You Know'' content on your website', 1, 2, '', 'didyouknow', 1, '#form.siteID#')

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (8, 'Links Directory', 'Enables your site to have a Links Directory', 1, 5, 'left', 'links', 1, '#form.siteID#')

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (9, 'Meta Tags', 'Inserts Pre-Optimized Meta Tags for your Website', 1, 0, '', 'metatags', 1, '#form.siteID#')

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (11, 'Pages', 'Create and Update Content Pages for your Website', 1, 1, 'center', 'pages', 1, '#form.siteID#')

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (12, 'PodCasts', 'Enable PodCasts for your Website', 1, 0, 'left', 'podcasts', 1, '#form.siteID#')

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (13, 'Polls', 'Enable Polling & Surveys on your Website', 1, 0, 'left', 'polls', 1, '#form.siteID#')

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (14, 'Rate Ticker', 'Mortgage rates Ticker for Financial-type Websites', 0, 0, '', 'ratesticker', 0, '#form.siteID#')

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (15, 'RSS Feeds', 'Enables RSS Feeds for your Website', 1, 0, 'left', 'rss', 1, '#form.siteID#')

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (16, 'SEO Friendly URLS', 'Enables SEF URLs for your website', 0, 0, '', 'sefurls', 0, '#form.siteID#')

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (17, 'Sitemap', 'Generates an easy to Follow Site Map', 1, 0, 'footer', 'sitemap', 0, '#form.siteID#')

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (18, 'Site Search', 'Enables a Search Egnie for your Website', 1, 0, 'header', 'sitesearch', 1, '#form.siteID#')

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (19, 'Spotlights', 'Have Spotlighted Content Displayed on your website', 1, 0, '', 'spotlights', 1, '#form.siteID#')

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (20, 'Tax Forms', 'Tax Form Search and Download Utility for Financial-type Sites', 0, 0, 'left', 'taxforms', 0, '#form.siteID#')

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (21, 'Tell-A-Friend', 'Have users tell friends about features on your website', 1, 0, 'right', 'tellafriend', 0, '#form.siteID#')

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (22, 'Stock Ticker', 'Scrolling Stock Ticker', 0, 0, 'left', 'stockticker', 1, '#form.siteID#')

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (23, 'Main Page', 'Your Main (or Home) Page', 1, 1, 'center', 'mainpage', 1, '#form.siteID#')

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (24, 'Inquiry Form', 'Fully Customizable Contact Form for Your Website', 1, 0, 'center', 'inquiry', 1, '#form.siteID#')

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (25, 'Forum', 'Enables your WebOS System to have a Forum', 1, 0, 'left', 'forum', 1, '#form.siteID#')

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (26, 'Breadcrumbs', 'Easy Navigation Links so your users can easily navigate your Website', 1, 0, 'center', 'breadcrumbs', 0, '#form.siteID#')

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (27, 'Zip Search', 'Enables your site to use a Zip Search Utility', 0, 0, 'center', 'zipsearch', 0, '#form.siteID#')

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (28, 'User Profiles', 'Enables Users to Sign-up and Create a Profile for your site', 1, 0, 'center', 'users', 0, '#form.siteID#')

INSERT webos_modules (module_id, module_name, module_description, module_installed, module_weight, module_column, module_directory, module_admin, siteID) VALUES (29, 'Newsletter', 'Enables your site to have a Newsletter Subscription System', 1, 0, 'center', 'newsletter', 1, '#form.siteID#')

SET IDENTITY_INSERT webos_modules OFF

INSERT webos_company_hours (hours_monday, hours_tuesday, hours_wednesday, hours_thursday, hours_friday, hours_saturday, hours_sunday, siteID) VALUES ('9am-5pm', '9am-5pm', '9am-5pm', '9am-5pm', '9am-5pm', 'Closed', 'Closed', '#form.siteID#')

SET IDENTITY_INSERT webos_our_rss_feeds ON
INSERT webos_our_rss_feeds (rss_id, rss_title, rss_content, rss_created, rss_author, rss_author_email, rss_status, rss_weight, siteID) VALUES (1, 'WebOS Rss Feeds Go Live!' , 'Test of Time shall Prevail.<br>' , CAST(0x000099E000000000 AS DateTime), 'WebOS Admin' , 'jharvey@moxymedia.com' , 1, 0, '#form.siteID#')
INSERT webos_our_rss_feeds (rss_id, rss_title, rss_content, rss_created, rss_author, rss_author_email, rss_status, rss_weight, siteID) VALUES (3, 'WebOS Debugs and Verifies it''s RSS Feeds!' , 'That''s Right! Our RSS Feeds are now verified and RSS 2.0 Compliant! <br>' , CAST(0x000099D100000000 AS DateTime), 'Admin' , 'jchharvey@moxymedia.com' , 1, 1, '#form.siteID#')
INSERT webos_our_rss_feeds (rss_id, rss_title, rss_content, rss_created, rss_author, rss_author_email, rss_status, rss_weight, siteID) VALUES (4, 'WebOS Automates RSS Creation' , 'WebOS now automated the RSS XML File it generates, each time a local-content RSS Feed is added, editted or deleted. This takes one-step out of generating a RSS XML after adding a new RSS topic.<br>' , CAST(0x000099D200000000 AS DateTime), 'WebOS Admin' , 'jharvey@moxymedia.com' , 1, 2, '#form.siteID#')
SET IDENTITY_INSERT webos_our_rss_feeds OFF

<!--- SET IDENTITY_INSERT webos_rss_config ON
INSERT webos_rss_config (rss_config_id, randomize_feeds, random_feed_value, siteID) VALUES (1, 0, 0, '#form.siteID#')
SET IDENTITY_INSERT webos_rss_config OFF --->

SET IDENTITY_INSERT webos_rss_feeds ON
INSERT webos_rss_feeds (rss_id, rss_title, rss_content, rss_status, rss_weight, siteID) VALUES (4, 'NY Times World News' , 'http://www.nytimes.com/services/xml/rss/nyt/International.xml' , 1, 0, '#form.siteID#')
INSERT webos_rss_feeds (rss_id, rss_title, rss_content, rss_status, rss_weight, siteID) VALUES (5, 'NY Times Automotive News' , 'http://www.nytimes.com/services/xml/rss/nyt/Automobiles.xml' , 1, 1, '#form.siteID#')
SET IDENTITY_INSERT webos_rss_feeds OFF


SET IDENTITY_INSERT webos_spotlights ON
INSERT webos_spotlights (spotlight_id, spotlight_title, spotlight_description, spotlight_time_sensitive, spotlight_start, spotlight_expire, siteID) VALUES (1, 'WebOS Spotlight', 'WebOS Spotlights Module can be used to highlight new features, articles, news Topics, or anyhting you care to highlight on your site''s main page!<br><br><img src="http://localhost/_local_dev/_webos/admin/_assets/_icons/icon_edit_topic.gif" alt="include images too" align="absmiddle" border="0" hspace="0" vspace="0">And Yes you can even include images...<br>', 0, CAST(0x00009CA900000000 AS DateTime), CAST(0x00009E1500000000 AS DateTime), '#form.siteID#')
INSERT webos_spotlights (spotlight_id, spotlight_title, spotlight_description, spotlight_time_sensitive, spotlight_start, spotlight_expire, siteID) VALUES (2, 'WebOS is Versatile', 'WebOS has been developed to be extremely verstaile and incredibly customizable...', 0, CAST(0x00009CA900000000 AS DateTime), CAST(0x00009E1500000000 AS DateTime), '#form.siteID#')
INSERT webos_spotlights (spotlight_id, spotlight_title, spotlight_description, spotlight_time_sensitive, spotlight_start, spotlight_expire, siteID) VALUES (3, 'WebOS is Fully Customizable!', 'You can Customize WebOS to easily look like your current Website with our Easy to use and Edit Templates!', 0, CAST(0x00009CA900000000 AS DateTime), CAST(0x00009E1500000000 AS DateTime), '#form.siteID#')
INSERT webos_spotlights (spotlight_id, spotlight_title, spotlight_description, spotlight_time_sensitive, spotlight_start, spotlight_expire, siteID) VALUES (4, 'More Default Modules than any other CMS! ', 'Currently, WebOs comes out-of-the box with over 20 standard Modules!<br>That''s Right!<br> How many other CMS Systems come with an integrated Chat, Forums, Search Engine Friednly ULS, Image Gallery, and RSS Feeds!', 0, CAST(0x00009CA900000000 AS DateTime), CAST(0x00009E1500000000 AS DateTime), '#form.siteID#')
SET IDENTITY_INSERT webos_spotlights OFF

SET IDENTITY_INSERT webos_pages ON
INSERT webos_pages (page_id, page_title, page_content, page_in_menu, page_status, weight, siteID) VALUES (1, 'About WebOS', 'WebOs was developed because of the need for an easy to edit, install and administrate content management system in ColdFusion. The Company I was working for had an aging ''Legacy''-based CMS, which was at the best, difficult if not tedious to install, update and modify.<br><br>WebOS solves all of the tediousness and difficulties in running and administrating a Dynamic ColdFusion CMS.<br><br>With an easy-to-use Administration Panel, anyone with a little knwledge can use and administrate WebOS. <br><br>WebOS is a module-based CMS with a template structure used to change the site layout easily without extensive HTML knowledge.<br><br>WebOS comes out-of-the-box per say with a wide variety of modules:<br>Google Analytics, Article Manager, Banner Manager, Blog, BreadCrumb Navigation, Chat System, Did-you-Know Module, Forum, Image Gallery, Customizable Contact Form, Links Directory, Meta Tag Generator, News Manager, Page Editor, PodCast Library, Polls &amp; Surveys, Mortgage Rates Ticker, RSS Feeds, Search Engine Friendly URLS, SiteMap, Site Search, Spotlights Manager, TaxForms Search and Download Manger, Tell-a-Friend Manager.<br><br>Having this Modular architecture makes WebOS easy to install, modify and use!<br>', 1, 1, 0, '#form.siteID#')
SET IDENTITY_INSERT webos_pages OFF

SET IDENTITY_INSERT webos_sitesearch ON
INSERT webos_sitesearch (search_config_id, search_in, search_in_value, siteID) VALUES (1, 'articles', 1, '#form.siteID#')
INSERT webos_sitesearch (search_config_id, search_in, search_in_value, siteID) VALUES (2, 'pages', 1, '#form.siteID#')
INSERT webos_sitesearch (search_config_id, search_in, search_in_value, siteID) VALUES (3, 'blog', 1, '#form.siteID#')
INSERT webos_sitesearch (search_config_id, search_in, search_in_value, siteID) VALUES (4, 'links', 1, '#form.siteID#')
INSERT webos_sitesearch (search_config_id, search_in, search_in_value, siteID) VALUES (5, 'rss', 1, '#form.siteID#')
INSERT webos_sitesearch (search_config_id, search_in, search_in_value, siteID) VALUES (6, 'forum', 1, '#form.siteID#')
SET IDENTITY_INSERT webos_sitesearch OFF

 SET IDENTITY_INSERT webos_inquiry_subjects ON 
INSERT webos_inquiry_subjects (subject_id, subject, siteID) VALUES (1, 'General Inquiry', '#form.siteID#')
INSERT webos_inquiry_subjects (subject_id, subject, siteID) VALUES (2, 'Website Issues', '#form.siteID#')
INSERT webos_inquiry_subjects (subject_id, subject, siteID) VALUES (3, 'Technical Support', '#form.siteID#')
INSERT webos_inquiry_subjects (subject_id, subject, siteID) VALUES (4, 'Advertising Information', '#form.siteID#')
 SET IDENTITY_INSERT webos_inquiry_subjects OFF 

</cfquery>
</cftransaction>