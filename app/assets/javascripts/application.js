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
//= require popper
//= require bootstrap
//= require rails-ujs
//= require dataTables/jquery.dataTables
//= require dataTables/extras/dataTables.responsive
//= require js/sb-admin
//= require js/jquery.autocomplete.min
//= require iziToast
//= require js/bootstrap-select
//= require_tree .

iziToast.settings({
    position: 'topCenter',
    timeout: 2500,
    pauseOnHover: false,
    progressBar: false,
    displayMode: 2,
    messageSize: "15"
});