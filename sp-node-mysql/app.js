var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var cors = require('cors');

//require routes defined in routes directory
var users = require('./routes/users'),
    budget_data = require('./routes/budget_data'),
    living_budget_data = require('./routes/living_budget_data'),
    savings_budget_data = require('./routes/savings_budget_data');
//TODO: add routes for the rest of the tables here

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(cors());
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname + '/FinBuddy_Bootstrap'))); //serves webapp
app.use('/users', users);
app.use('/budget_data', budget_data);
app.use('/living_budget_data', living_budget_data);
app.use('/savings_budget_data', savings_budget_data);
//TODO: include other urls for requests here

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
