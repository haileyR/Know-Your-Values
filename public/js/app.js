$(document).ready(function() {
  // $('header').on('submit', '#login', logInOutAjaxCall);
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

  $('#friends').on('click', '#friendslistButton', friendsAjaxCall);
  $('#friends').on('click', '#friendrequestButton', friendsAjaxCall);
  $('#friends').on('submit', '.unfriend', friendsEditAjaxCall);
  $('#friends').on('submit', '.add', friendsEditAjaxCall);

  $('#friends').on('submit', '#search', function(event){
    event.preventDefault();
    $target = $(event.target);
    $.ajax({
      type: $target.attr('method'),
      url: $target.attr('action'),
      data: $target.serialize()
    }).done(function(response){
      $('#friends').children('ul').replaceWith(response)
    });
  });

  function friendsAjaxCall(event){
    event.preventDefault();
    $target = $(event.target);
    $.ajax({
      type: $target.attr('method'),
      url: $target.attr('action'),
      data: {user_id: parseInt($('#userID').val()), friend_id: parseInt($target.children('#friendID').val())}
    }).done(function(response){
      $('#friends').children('ul').replaceWith(response)
    });
  };

  function friendsEditAjaxCall(event){
    event.preventDefault();
    $target = $(event.target);
    $.ajax({
      type: $target.children('input[name="_method"]').val(),
      url: $target.attr('action'),
      data: {user_id: parseInt($('#userID').val()), friend_id: parseInt($target.children('#friendID').val())}
    }).done(function(response){
      $('#friends').children('ul').replaceWith(response)
    });
  };




});




