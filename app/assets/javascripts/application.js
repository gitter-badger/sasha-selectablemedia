// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_self

var dialog;

$(function(){
  dialog = $('#btn-popup').modal({
    show: false
  });
  
  $(document).on('click', '.close-dialog', function(){
    close_dialog();
  });

  $(document).on('click', '.btn-popup', function(){ 
    $('#popup-title').text(this.title);
    var body = dialog.find('.modal-body');
    body.load(this.href, function(){
      dialog.modal('show');
    });
    return false;
  });
  
  $(document).on('ajax:success', '.btn-danger', function(){
    reload_customers();
  });

  $(document).on('ajax:error', '#btn-popup form', function(event, xhr, status){
    $(this).replaceWith(xhr.responseText);
  });

  $(document).on('ajax:success', '#btn-popup form', function(){
    reload_customers();
    close_dialog();
  });

});

function close_dialog(){
  dialog.modal('hide');
}

function reload_customers(){
  $('#content-page').load('/customers');
}