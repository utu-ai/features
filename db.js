'use strict';

var MongoClient = require('mongodb').MongoClient;

var DB = function DB(callback) {
    var self = this;

    this.db = null;

    this.connect = function (user, pwd, host, db, callback) {
        var connStr = "mongodb://";
        connStr = connStr + user + ":";
        connStr = connStr + pwd + "@";
        connStr = connStr + host + "/";
        connStr = connStr + db;
        connStr = "mongodb://cucumber.utu.ai:27018/?ssl=true&certificatePreference=RootCACert:from_file&rootCAPath=ca.crt"
        console.log(connStr);

        MongoClient.connect(connStr, function (err, db) {
            if (err) {
                return callback.fail("DF:: ERROR Connection to the MongoDB" + err.message);
            }
            self.db = db;
            callback();
        });
    }
    callback();
}

exports.DB = DB;