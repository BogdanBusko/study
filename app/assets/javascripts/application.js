//= require jquery
//= require rails-ujs
//= require bootstrap
//= require_tree .

$(document).ready(function(){
  $(".js-request").click(function(){
    $("#js-modal-request").show();
    $("#opacity-bg").show();
    $("#object-id").val($(this).data("id"));
  });

  $("#js-close-modal").click(function(){
    $("#js-modal-request").hide();
    $("#opacity-bg").hide();
  });
});
