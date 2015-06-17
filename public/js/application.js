$(document).ready(function() {
  $('.edit-user').on('click', updateUserForm);
});

var updateUserForm = (function(event) {
  event.preventDefault();
  $.ajax({
    url : "/user/:id/edit"
  }).done(function(data){
	var form = $(data).find('.edit-user-form').html();
	var title = "<h1 class='update-title'>Update Your Profile!</h1>"
    if ($('form').length) {
      $('.update-title, form').remove();
    } else {
      $('.begin_game').append(title, form);
    }
  }).fail(function(){
    alert("something's wrong")
  })
});