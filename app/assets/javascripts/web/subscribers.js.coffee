$ ->
  $('.subscribe-btn').click ->
    url = $(this).attr 'href'
    $.get url, {}, (html) ->
      $('.subscribe-modal').modal().html html
    false

  $('body').delegate '.subscribe-modal form', 'submit', ->
    $form = $(this)
    $.post $form.attr('action'), $form.serialize(), (html) ->
      $('.subscribe-modal').html html
    false