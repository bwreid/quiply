$(function() {
  $('#tweet_submit').click(post_tweet);
  // $('#tweet_content').focus(grow_box);
  $('#tweet_content').keyup(calculate_length);
  // $('#tweet_content').focusout(shrink_box);
  $('.tweet').find('a .foundicon-plus').parent().click(add_story);
  var timer = setInterval(update_tweet_list, 30000);
});

var last_run = new Date().toUTCString();

function add_story() {
  var story = $(this).parent().find('span').html().replace('<p></p>','*p*');
  $('.story_build').find('h6').html(story);
  $('.tweet').find('a .foundicon-plus').parent().click(add_story);
}

function calculate_length() {
  $('.js_tweet .right').text($('#tweet_content').val().length);
  var character_count = $('#tweet_content').val().length;

  if(character_count > 200)
    $('.js_tweet .button.secondary.disabled.right').css('color', 'red');
  else
    $('.js_tweet .button.secondary.disabled.right').css('color', '#1d1d1d');

  if(character_count > 255) {
    var input = $('#tweet_content').val();
    input = input.substr(0,255);
    $('#tweet_content').val(input);
  }
}

function alert_message(msg) {
  $('.alert-box').remove();
  var div = $('<div>').addClass('alert-box').text(msg);
  var close = $('<a href="" class="close">&times;</a>');
  div = div.append(close);
  $('.tweet_container').prepend(div);
}

function update_tweet_list() {
  $('.tweet_container').load('/tweets' + ' .tweet_list');
  $('.alert-box').fadeOut();
  $('.alert-box').remove();
  return false;
}

function grow_box() {
  $('#tweet_content').animate({rows: 4}, 'fast');
  $('#tweet_submit').toggleClass('secondary');
}

function shrink_box() {
  $('#tweet_content').animate({rows: 1}, 'fast');
  $('#tweet_submit').toggleClass('secondary');
}

function post_tweet() {
  var token = $('input[name=authenticity_token]').val();
  var content = $('.story_build').find('h6').text() + ' ';
  content += $('#tweet_content').val();

  if($('#tweet_content').val().length > 10) {
    $.ajax({
      dataType: 'json',
      type: "POST",
      url: "/tweets",
      data: {authenticity_token:token, content:content}
    }).done(show_tweet_dynamic);
    var msg = "Posted!"

  } else {
    var msg = "Too short!"
  }
  alert_message(msg);
  return false;
}

function show_tweet_dynamic(tweet) {
  var user_id = $('#tweet_content').next().next().val();
  var username = $('#tweet_content').next().val();
  var link = $('<a>' + username + '</a>').attr('href', '/users/' + user_id);
  var label = $('<label>').append(link);
  var span = $('<span>')
  var ptag = $('<p>').html(tweet.content.replace('*p*','<p></p>')).append(label);
  var div = $('<div>').addClass('panel tweet');
  div = div.append(span.append(ptag));
  $('.tweet_list').prepend(div);

  $('#tweet_content').val('');
  $('.story_build').find('h6').text('');
  $('.js_tweet .right').text('0');
}