PROJECT NAME
============
CI News Portal  

FRAMEWORK
=========
CodeIgniter  
Version - 3.0.0  

SETUP PROCESS FOR NEWS PORTAL APPLICATION
=========================================
STEP 1: Create and import database
1.1.    Import the 'news_portal.sql' to your MySQL server from \Source\db\ directory to setup the application. This will create a schema named "news_portal" and import dummy data.
1.1.a       Dummy account info after the import:  

            Email: mosrur@gmail.com  
            
            Pass: test123  
            

STEP 2: Database configuration
2.1.    Open the 'database.php' file from \Source\application\config\ directory.
2.2.    Set appropriate database credentials (Line: 65-85).

STEP 3: Email setup
3.1.    Open the 'email.php' file from \Source\application\config\ directory.
3.2.    Set appropriate SMTP credentials to connect your SMTP server.

STEP 4: htaccess file
4.1.    Update the .htaccess file from \Source\.htaccess and make appropriate changes in necessary.


IMPLEMENTED FEATURES NOT MENTIONED IN SPECIFICATION
===================================================
- Validation for email, password strength, file size and other required fields wherever necessary.
- Password recovery feature
- Category and Tags for news items
-- Categories are hard-coded in database and assumed to be edited only from admin area (not implemented)
- Search feature
- Paginations for news list page has NOT been implemented
