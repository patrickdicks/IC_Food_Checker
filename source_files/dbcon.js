var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit : 10,
  host            : 'classmysql.engr.oregonstate.edu',
  user            : 'cs340_dicksp',
  password        : '1783',
  database        : 'cs340_dicksp'
});

module.exports.pool = pool;
