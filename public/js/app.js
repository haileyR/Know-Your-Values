$(document).ready(function() {

  $('header').on('submit', '#login', logInOutAjaxCall);
  $('header').on('click', '#logout', logInOutAjaxCall);
  $('header').on('click', '#registerNow', logInOutAjaxCall);
  $('header').on('submit', '#register', logInOutAjaxCall);

  function logInOutAjaxCall(event){
    event.preventDefault();
    $target = $(event.target);
    $.ajax({
      type: $target.attr('method'),
      url: $target.attr('action'),
      data: $target.serialize()
    }).done(function(response){
      $('.userInfoCont').replaceWith(response);
    });
  };

  $( "#progressbar" ).progressbar({
    value: 37
  });


});




