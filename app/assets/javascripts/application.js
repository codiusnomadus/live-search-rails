//= require jquery
//= require bootstrap-sprockets
//= require rails-ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  var recipe_search_form = $("#recipe-search");
  var recipes_list = $("#recipes");
  var recipe_search_field = $("#search");

  recipe_search_form.keyup(function() {
    recipes_list.hide();
    if (recipe_search_field.val() !== "") {
      recipes_list.show();
      $.get(
        recipe_search_form.attr("action"),
        recipe_search_form.serialize(),
        null,
        "script"
      );
      return false;
    } else {
      recipes_list.hide();
    }
  });
});
