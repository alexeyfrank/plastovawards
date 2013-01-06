jQuery ->
  $('.add-menu-item-btn, .edit-menu-item-btn').click ->
    $.get $(this).attr('href'), {}, (html)->
      $('.menu-items-modal').html(html).modal()
    return false
  