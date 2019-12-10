/*  Author: Patrick Dicks
*   Title: IC Food Checker
*   License: MIT
*   app.js
*/

var express = require("express");
var app = express();
var bodyParser = require("body-parser");
var methodOverride = require("method-override");
var mysql = require("./dbcon.js");
var crypto = require("crypto"); // For salting passwords
var session = require('client-sessions');

app.use(bodyParser.urlencoded({extended: true}));
/* cookie for user login */
app.use(session({
    cookieName: 'session',
    secret: 'eg[isfd-8yF9-7w2315df{}+Ijsli;;to8',
    duration: 30 * 60 * 1000,
    activeDuration: 5 * 60 * 1000,
    httpOnly: true,
    secure: true,
    ephemeral: true
}));
app.use(express.static("public"));
app.use(methodOverride("_method"));
app.set("view engine", "ejs");
app.set('port', process.argv[2]);

/* Salting and Hashing */
// Get a random string to use as salt
var genRandomString = function(length){
    return crypto.randomBytes(Math.ceil(length/2))
            .toString('hex') /** convert to hexadecimal format */
            .slice(0,length);   /** return required number of characters */
};

//  Hash the password with the salt
var sha512 = function(password, salt){
    var hash = crypto.createHmac('sha512', salt); /** Hashing algorithm sha512 */
    hash.update(password);
    var value = hash.digest('hex');
    return {
        salt:salt,
        passwordHash:value
    };
};

// Return the salt and the salted + hashed password
function saltHashPassword(userpassword) {
    var salt = genRandomString(16); /** Gives us salt of length 16 */
    var passwordData = sha512(userpassword, salt);
    return passwordData;
}

/* Needed for Login Authentication */
function verifyPassword(password, storedSalt, storedHash) {
    var passwordData = sha512(password, storedSalt);

    // Compare values
    if(passwordData.passwordHash === storedHash){
        console.log("Password is valid.");
        return true
    } 

    console.log("Password is invalid.");
    return false
}

/* ROUTES */
// Main Route
app.get("/", function(req, res){
    // Render page
    res.render('index');
});

/* General List Routes */

// Search General List
app.post("/general/search/", function(req, res) {
	var obj = {};
    obj.generalTableTitle = "Search Results";
    var searchedFood = req.body.food.name;
    obj.searchedFood = searchedFood;
    var searchGenList = "SELECT foodName, comfortRating, origin, voteFriendly, voteTry, voteAvoid " +
    "FROM food WHERE foodName LIKE \'%" + searchedFood + "%\';";
    console.log(searchGenList);

    mysql.pool.query(searchGenList, function(err, result) {
        if (err) {
            res.send("Error searching General List: " + err);
        }
        obj.foods = result;
        res.render("general", obj);
    });
});

// Display General LIst
app.get("/general", function(req, res) {
	var obj = {};
    obj.generalTableTitle = "Contents of General Food List";
    var generalListQuery = "SELECT foodName, comfortRating, origin, voteFriendly, voteTry, voteAvoid " +
    "FROM food;";

    mysql.pool.query(generalListQuery, function(err, result) {
        if(err) {
            res.send("Error retrieving General Food list: " + err);
        }
        obj.foods = result;
        res.render("general", obj);
    });
});

// Filter General List by Rating
app.post("/general/rating", function(req, res) {
	var obj = {};
    var ratingValue = req.body.comfort.rating;
    var filterGenListQuery = "SELECT foodName, comfortRating, origin, voteFriendly, voteTry, voteAvoid " +
    "FROM food WHERE comfortRating=" + ratingValue + ";";
    var title = "Filtered Results: ";
    if (ratingValue == 1) {
        title += "Bladder-Friendly Foods";
    } else if (ratingValue == 2) {
        title += "Foods Worth Trying";
    } else {
        title += "Foods to Avoid";
    }
    obj.generalTableTitle = title;
    mysql.pool.query(filterGenListQuery, function (err, result) {
        if(err) {
            res.send("Error filtering General Food List: " + err);
        }
        obj.foods = result;
        res.render("general", obj);
    });
});

/* Authentication */
// Registration page (sign up form)
app.get("/register", function(req, res) {
    obj = {}
    // Get today's date for input form
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();
    if(dd<10){
        dd='0'+dd
    } 
    if(mm<10){
        mm='0'+mm
    } 

    today = yyyy+'-'+mm+'-'+dd;

    // Store in object for EJS display
    obj.today = today;
    res.render("register", obj);
});

app.post("/register", function(req, res) {
    obj = {};
    // Get values from form
    var userName = req.body.username;
    var userPassword = req.body.password;
    var userEmail = req.body.email;

    // Validate username
    var checkUsername = "SELECT COUNT(userId) AS count FROM user WHERE userName = \'" +
    userName + "\';";

    mysql.pool.query(checkUsername, function(err, result) {
        if(err) {
            console.log("Error checking username: " + err);
        }

        obj.errorType = "Registration Error";
        obj.backButtonText = "Back to Registration";
        obj.returnPage = "/register";

        // Check count value to make sure this username is unqiue
        if(result[0].count > 0) {
            obj.message = "Username '" + userName + "' already exists!";
            // Not unique, send error
            res.render("error", obj);
        } else {
            // Is unique, verify email
            var checkEmail = "SELECT COUNT(userId) AS count FROM user WHERE email = \'" +
            userEmail + "\';";

            mysql.pool.query(checkEmail, function(err, result) {
                if(err) {
                    console.log("Error checking email: " + err);
                }
                // Check count value to make sure this user email is unique
                if(result[0].count > 0) {
                    obj.message = "Email '" + userEmail + "' is already registered.";
                    // Not unique, send error
                    res.render("error", obj);
                } else {
                    // Is unique, insert new user
                    // username, email, and password format are validated in the form
                    // The admin booleon defaults to false
                    // The registration date defaults to today's date
                    // The login status and last login fields default to null

                    // Salt and Hash user-entered password
                    var saltedHashedPasswordData = saltHashPassword(userPassword);

                    //  Store the results
                    var saltedHashedUserPassword = saltedHashedPasswordData.passwordHash;
                    var userSalt = saltedHashedPasswordData.salt;

                    // Insert salt, hashed and salted password, and other user info into database
                    var insertUserQuery = "INSERT INTO user (userName, email, password, salt) VALUES (\'" +
                    userName + "\', \'" + userEmail + "\', \'" + saltedHashedUserPassword + "\', \'" + userSalt + "\')";

                    mysql.pool.query(insertUserQuery, function(err, result) {
                        if(err) {
                            console.log("Error inserting newly registered user: " + err);
                        }
                        // Make sure new password got hashed, salted, and stored correctly
                        var verifyInsert = "SELECT password, salt FROM user WHERE userId = " + 
                        result.insertId + ";";
                        mysql.pool.query(verifyInsert, function(err, result){
                            if(err) {
                                console.log("Error retrieving password and salt: " + err);
                            }
                            // Verify that it was salted, hashed, and stored correctly by immediately
                            // retrieving this user's salt and hashed password
                            if(verifyPassword(userPassword, result[0].salt, result[0].password)) {
                                // Go to the logged in user page
                                res.render("personal");
                            } else {
                                // Display error message
                                res.send("Something went wrong. The password was not stored correctly.");
                            }
                        });
                    });
                }
            });
        }
    });
});

// Route for login
app.get("/login", function(req, res){
    res.redirect('/');
});

// Route for logging in with username and password
app.post("/login", function(req, res) {
    obj = {};
    var username = req.body.uname;
    obj.username = username;
    var password = req.body.psw;
    obj.password = password;
    var searchUser = "SELECT * FROM user WHERE userName = \'"
    + username + "\';";
    console.log(username);
    console.log(password);

    // Search the database for this username
    mysql.pool.query(searchUser, function(err, result) {
        if (err) {
            res.send("Error searching for username: " + err);
        }

        obj.errorType = "Login Error";
        obj.backButtonText = "Back to Login";
        obj.returnPage = "/";
        obj.message = "Incorrect Username or Password";

        if(typeof result[0] !== 'undefined' && 
           typeof result[0].userName !== 'undefined') { 
            if(verifyPassword(password, result[0].salt, result[0].password)) {
                // sets a cookie with the user's info
                req.session.user = result;
                // Go to the logged in user page
                res.redirect('/personal');
            }
            else {
                res.render("error", obj);
            }
        }
        else {
            res.render("error", obj);
        }
    });
});

function requireLogin (req, res, next) {
    if (typeof req.session.user !== 'undefine' &&
        req.session.user != null) {
        next();
    } else {
        res.redirect('/register');
    }
};

// Personal Food Page (must be logged in)
app.get('/personal', requireLogin, function(req, res) {
    res.render('personal');
  });

app.use(function(req, res, next) {
    if (req.session && req.session.user) {
        var username = req.body.username;
        var searchUser = "SELECT userName FROM user WHERE userName = \'"
        + username + "\';";

        mysql.pool.query(searchUser, function(err, result) {
            if (err) {
                res.send("Error: " + err);
            }
    
            if(typeof result[0] !== 'undefined' && 
               typeof result[0].userName !== 'undefined') { 
                req.user = result;
                delete req.user.password; // delete the password from the session
                req.session.user = result;  //refresh the session value
                res.locals.user = result;
            }
            
            // finishing processing the middleware and run the route
            next();
        });
    } else {
      next();
    }
});

// forgot password
app.get("/forgot", function(req, res){
    res.render("forgot");
});

app.post("/forgot", function(req, res){
    obj = {};
    var username = req.body.username;
    obj.username = username;
    var searchUser = "SELECT userName FROM user WHERE userName = \'"
    + username + "\';";
    console.log(username);

    mysql.pool.query(searchUser, function(err, result) {
        if (err) {
            res.send("Error: " + err);
        }

        obj.errorType = "Password Error";
        obj.backButtonText = "Back to Password Reset";
        obj.returnPage = "/forgot";
        obj.message = "Username not found";

        if(typeof result[0] !== 'undefined' && 
           typeof result[0].userName !== 'undefined') { 
            res.redirect('/');
        }
        else {
            res.render("error", obj);
        }
    });
});

app.get("/logout", function(req, res){
    req.session.reset();
    req.session.user = null;
    res.redirect('/');
});

/* Error Codes */

app.listen(app.get('port'), function(){
    console.log("ICN Database Server has started! Press ctrl-C to terminate.");
});
