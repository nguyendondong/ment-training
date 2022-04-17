// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("toastr")
// app/asssets/javascripts/application.js
//= require jquery
//= require jquery_ujs
//= require toastr


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
	$("#micropost_picture").bind("change", function(){
    	var size_in_megabytes = this.files(0).size/1024/1024;
        if (size_in_megabytes > 1) {
        	alert("Maximum file size is 1MB. Please choose an other file!");
        }
    });
