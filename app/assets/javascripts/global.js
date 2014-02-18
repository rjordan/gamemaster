// Place your application-specific JavaScript functions and classes here
$(function () {
  $("#tabs").tabs();
  $(".button").button();
  $("#stories_list").sortable({
    update: function () {
      $.ajax({
        type: 'post',
        data: $('#stories_list').sortable('serialize'),
        dataType: 'script',
        url: location + '/chapters/sort' })
    }});
  $('.markItUp').markItUp(mySettings);
  $("#dialog_invite").dialog({
    autoOpen: false,
    height: 150,
    width: 350,
    modal: true,
    resizable: false,
    Cancel: function () {
      $(this).dialog('close');
    },
    close: function () {
      allFields.val('').removeClass('ui-state-error');
    }
  });
  $('#player_invite').button().click(function () {
    $('#dialog_invite').dialog('open');
  });
});

