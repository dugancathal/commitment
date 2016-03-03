// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function hideTargets(eventOrIndex, element) {
  $(eventOrIndex.target || element).hide();
};

$(document).ready(function() {
  $('[data-collapsed="true"]').each(hideTargets);
});
$(document).on('page:load', '[data-collapsed="true"]', hideTargets);
$(document).on('click', '[data-collapse]', function(e) {
  $(e.target).find('i').toggleClass('collapse-open').toggleClass('collapse-closed');
  $(e.target).next('[data-collapsed]').toggle();
});
