$(document).ready(function() {
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
      $('#friends').children('ul').replaceWith(response);
      $target.children('input').val("");
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




  $('#bio').on('submit', '#bioEdit', function(event){
    event.preventDefault();
    $target = $(event.target);
    $target.children('button').text('Saving...');
    $.ajax({
      type: 'PUT',
      url: $target.attr('action'),
      data: {user_id: parseInt($('#userID').val()), newbio: $target.siblings('p').text()}
    }).done(function(response){
      $target.children('button').text('Saved');
    });
  });


  $('#possiblevalues').on('click', 'a', function(event){
    event.preventDefault();
    console.log(location.pathname+'/addvalue');
    $target = $(event.target)
    $.ajax({
      type: 'post',
      url: location.pathname+'/addvalue',
      data: {friend_id: parseInt($('#userID').val()), value_id: parseInt($target.attr('value'))}
    }).done(function(response){
      $target.closest('#possiblevalues').siblings('div').children('p').replaceWith(response);
    });
  });


  $('#addvalue_form').on('submit', function(event){
    event.preventDefault();
    $target = $(event.target)
    $.ajax({
      type: 'post',
      url: location.pathname+'/addvalue',
      data: $target.serialize()
    }).done(function(response){
      $target.siblings('#addedvalues').children('p').replaceWith(response);
      $target.children('input[name=\'word\']').val("");
    });
  });

  $('#morevalue_form').on('submit', function(event){
    event.preventDefault();
    $target = $(event.target)
    $.ajax({
      type: 'GET',
      url: location.pathname+'/values'
    }).done(function(response){
      $target.siblings('#possiblevalues').children('p').replaceWith(response);
    });
  });



});




