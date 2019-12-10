# IC Food Checker

![IC Food Checker](https://github.com/patrickdicks/IC_Food_Checker/blob/master/IC_Food_Checker.png)

## About:
Database driven website based around the chronic bladder pain condition “Interstitial Cystitis,” which provides users with recommended lists of foods to try.

Supports account creation and user login. 

* Technologies Used:
  * CSS
  * HTML
  * JavaScript
  * MySQL
  * Node.js

## Installation:
```
npm install
```
Open dbcon.js and add MySQL database information to the following:
```
host            : '',
user            : '',
password        : '',
database        : ''
```

Import the following .sql files into MySQL database:
```
food_db.sql
IC_queries.sql
```

## Run:
```
Node app.js [port]
Open http://localhost:[port]/ in web browser
```
