'use strict';

var request = require('request')

var env = require('./env')

var MongoClient = require('mongodb').MongoClient;

var World = function World(callback) {

  var self = this;

  this.lastResponse = null;
  this.db = null;

  this.connect = function (callback) {
    /*var connStr = "mongodb://";
    connStr = connStr + user + ":";
    connStr = connStr + pwd + "@";
    connStr = connStr + host + "/";
    connStr = connStr + db;*/
    var connStr = "mongodb://cucumber.utu.ai:27018/?ssl=true&certificatePreference=RootCACert:from_file&rootCAPath=ca.crt"
    console.log(connStr);

    MongoClient.connect(connStr, function (err, db) {
      if (err) {
        return callback.fail("DF:: ERROR Connection to the MongoDB" + err.message);
      }
      console.log('Connection successful...');
      self.db = db;
      console.log('Here is the db: ', db);
      callback();
    });
  }

  this.get = function (path, callback) {
    var uri = this.uri(path)
    request.get({ url: uri, headers: { 'User-Agent': 'request' } },
      function (error, response) {
        if (error) {
          return callback.fail(new Error('Error on GET request to ' + uri +
            ': ' + error.message))
        }
        self.lastResponse = response
        callback()
      })
  }

  this.post = function (path, requestBody, callback) {
    var uri = this.uri(path)
    request({
      url: uri, body: requestBody, method: 'POST',
      headers: { 'User-Agent': 'request' }
    },
      function (error, response) {
        if (error) {
          return callback(new Error('Error on POST request to ' + uri + ': ' +
            error.message))
        }
        self.lastResponse = response
        console.log(response);
        callback(null, self.lastResponse.headers.location)
      })
  }

  this.put = function (path, requestBody, callback) {
    var uri = this.uri(path)
    request({
      url: uri, body: requestBody, method: 'PUT',
      headers: { 'User-Agent': 'request' }
    },
      function (error, response) {
        if (error) {
          return callback(new Error('Error on PUT request to ' + uri + ': ' +
            error.message))
        }
        self.lastResponse = response
        callback(null, self.lastResponse.headers.locations)
      })
  }

  this.rest_delete = function (path, callback) {
    var uri = this.uri(path)
    request({ url: uri, method: 'DELETE' },
      function (error, response) {
        if (error) {
          return callback(new Error('Error on DELETE request to ' + uri + ': ' +
            error.message))
        }
        self.lastResponse = response
        callback()
      })
  }

  this.options = function (path, callback) {
    var uri = this.uri(path)
    request({
      'uri': uri, method: 'OPTIONS',
      headers: { 'User-Agent': 'request' }
    },
      function (error, response) {
        if (error) {
          return callback.fail(new Error('Error on OPTIONS request to ' + uri +
            ': ' + error.message))
        }
        self.lastResponse = response
        callback()
      })
  }

  this.getCollection = function (collection) {
    console.log('Here is the db in getCollection: ', self.db);
    self.db.collection(collection, function (error, data_collection) {
      if (error) callback(error);
      else callback(null, data_collection);
    });
  };

  //find all datas
  this.findAll = function (data_collection, callback) {
    this.getCollection(function (error, data_collection) {
      if (error) callback(error)
      else {
        data_collection.find().toArray(function (error, results) {
          if (error) callback(error)
          else callback(null, results)
        });
      }
    });
  };

  //find an data by ID
  this.findById = function (id, callback) {
    this.getCollection(function (error, data_collection) {
      if (error) callback(error)
      else {
        data_collection.findOne({ _id: data_collection.db.bson_serializer.ObjectID.createFromHexString(id) }, function (error, result) {
          if (error) callback(error)
          else callback(null, result)
        });
      }
    });
  };


  //save new data
  this.insert = function (collection, callback) {
    this.getCollection(function (error, data_collection) {
      if (error) callback(error)
      else {
        if (typeof (collection.length) == "undefined")
          collection = [collection];

        for (var i = 0; i < datas.length; i++) {
          data = collection[i];
          data.created_at = new Date();
        }

        data_collection.insert(datas, function () {
          callback(null, collection);
        });
      }
    });
  };

  // update an data
  this.update = function (dataId, collection, callback) {
    this.getCollection(function (error, data_collection) {
      if (error) callback(error);
      else {
        data_collection.update(
          { _id: data_collection.db.bson_serializer.ObjectID.createFromHexString(dataId) },
          datas,
          function (error, collection) {
            if (error) callback(error);
            else callback(null, collection)
          });
      }
    });
  };

  //delete data
  this.delete = function (dataId, callback) {
    this.getCollection(function (error, data_collection) {
      if (error) callback(error);
      else {
        data_collection.remove(
          { _id: data_collection.db.bson_serializer.ObjectID.createFromHexString(dataId) },
          function (error, data) {
            if (error) callback(error);
            else callback(null, data)
          });
      }
    });
  };


  this.rootPath = function () {
    return '/'
  }

  this.gistPath = function (gist) {
    return '/gists/' + gist
  }

  this.repoPath = function (owner, repo) {
    return '/repos/' + owner + '/' + repo
  }

  this.issuePath = function (owner, repo, issue) {
    return this.repoPath(owner, repo) + '/issues/' + issue
  }

  this.uri = function (path) {
    return env.BASE_URL + path
  }

  callback()
}

exports.World = World
