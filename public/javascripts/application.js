// Place your application-specific JavaScript functions and classes here
$(function() {
  $("#tabs").tabs();
  $(".button").button();
  $("#stories_list").sortable({ 
      update: function() { 
        $.ajax({ 
          type: 'post', 
          data: $('#stories_list').sortable('serialize'),
          dataType: 'script',
          url: location+'/chapters/sort' }) 
      }});
  $('.markItUp').markItUp(mySettings);
});

