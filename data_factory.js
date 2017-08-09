// var Db = require('mongodb').Db;
// var Connection = require('mongodb').Connection;
// var Server = require('mongodb').Server;
// var BSON = require('mongodb').BSON;
// var ObjectID = require('mongodb').ObjectID;
var MongoClient = require('mongodb').MongoClient;

function dataFactory (user, pwd, host, db) {
  var connStr = "mongodb://";
  connStr = connStr + user + ":";
  connStr = connStr + pwd + "@";
  connStr = connStr + host + "/";
  connStr = connStr + db;
  console.log(connStr);
  // MongoClient.connect("mongodb://rajesh:test1234@ds129143.mlab.com:29143/rajesh-test", function(err, db) {
  MongoClient.connect(connStr, function(err, db) {
    if(!err) {
      console.log("DF - We are connected");
    } else {
      console.log(err);
      console.log("DF - bite me!");
    }
  });
  // this.db= new Db(db, new Server(host, port, {safe: false}, {auto_reconnect: true}, {}));
  // this.db.open(function(){});
};

dataFactory.prototype.getCollection= function(collection, callback) {
  this.db.collection(collection, function(error, data_collection) {
    if( error ) callback(error);
    else callback(null, data_collection);
  });
};

//find all datas
dataFactory.prototype.findAll = function(callback) {
    this.getCollection(function(error, data_collection) {
      if( error ) callback(error)
      else {
        data_collection.find().toArray(function(error, results) {
          if( error ) callback(error)
          else callback(null, results)
        });
      }
    });
};

//find an data by ID
dataFactory.prototype.findById = function(id, callback) {
    this.getCollection(function(error, data_collection) {
      if( error ) callback(error)
      else {
        data_collection.findOne({_id: data_collection.db.bson_serializer.ObjectID.createFromHexString(id)}, function(error, result) {
          if( error ) callback(error)
          else callback(null, result)
        });
      }
    });
};


//save new data
dataFactory.prototype.save = function(collection, callback) {
    this.getCollection(function(error, data_collection) {
      if( error ) callback(error)
      else {
        if( typeof(collection.length)=="undefined")
          collection = [collection];

        for( var i =0;i< datas.length;i++ ) {
          data = collection[i];
          data.created_at = new Date();
        }

        data_collection.insert(datas, function() {
          callback(null, collection);
        });
      }
    });
};

// update an data
dataFactory.prototype.update = function(dataId, collection, callback) {
    this.getCollection(function(error, data_collection) {
      if( error ) callback(error);
      else {
        data_collection.update(
					{_id: data_collection.db.bson_serializer.ObjectID.createFromHexString(dataId)},
					datas,
					function(error, collection) {
						if(error) callback(error);
						else callback(null, collection)
					});
      }
    });
};

//delete data
dataFactory.prototype.delete = function(dataId, callback) {
	this.getCollection(function(error, data_collection) {
		if(error) callback(error);
		else {
			data_collection.remove(
				{_id: data_collection.db.bson_serializer.ObjectID.createFromHexString(dataId)},
				function(error, data){
					if(error) callback(error);
					else callback(null, data)
				});
			}
	});
};

exports.dataFactory = dataFactory;
