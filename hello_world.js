'use strict';
var helloWorld = function helloWorld(callback){

    self = this;

    this.message = function(name){
        console('Hello '+name);
    }
    
    module.exports.helloWorld = helloWorld;
}