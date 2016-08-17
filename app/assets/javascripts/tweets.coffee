# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.post_tweet').on('keyup keydown keypress change',->
    countMax = 255;
    thisValueLength = $(this).val().length
    countDown = countMax - thisValueLength
    $(".count_tweet").html(countDown)
    
    if countDown < 0
      $('.count_tweet').css({color:'red'});
    else
      $('.count_tweet').css({color:'black'});
    ###
    limit = 140
    if thisValueLength < limit
      $('.count').html(limit - thisValueLength).removeClass("text-danger")
    else
      $('.count').html(limit - thisValueLength).addClass("text-danger")
    =end
    ###  
  ).keyup()