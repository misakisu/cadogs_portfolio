// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .
$(document).on('turbolinks:load',function(){
     $('.slider').bxSlider({
        auto: true,
        maxSlides: 1,
        controls: false,
    	});
     $("#submit").prop('disabled', true);
     $("#content").keyup(function() {
      console.log($("#content"))
        if ($("#content").val() != '') {
           $("#submit").prop('disabled', false);
        } else {
          $("#submit").prop('disabled', true);
        }
     });
 });
/*keyupは入力中にキーが離れたらfunctionを実行*/