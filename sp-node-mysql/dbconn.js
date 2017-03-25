/* AUTHOR: MATTHEW AQUILES
** FINBUDDY; DUCKHACKS17
** NOTES: INFORMATION TO CONNECT TO DATABSE; DATABASE IS ON MATTS MAC
*/

var mysql = require('mysql');

var connection = mysql.createPool({
  host:'localhost',
  user:'root',
  password:'p0o9I*U&', //should probably not hard code this, but its ok for now
  database:'FinBuddy'
});

module.exports = connection;
