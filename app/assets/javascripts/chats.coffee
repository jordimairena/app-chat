$ ->
  $('#trainers').selectable
    stop: ->
      $('#users .ui-selected').removeClass('ui-selected')
      receiver_li = $('#trainers .ui-selected')[0]
      set_receiver(receiver_li)

  $('#users').selectable
    stop: ->
      $('#trainers .ui-selected').removeClass('ui-selected')
      receiver_li = $('#users .ui-selected')[0]
      set_receiver(receiver_li)

  set_receiver = (receiver_li)->
    receiver_li = $(receiver_li)
    $('.recipient_box').show()
    $('.recipient_username').html(receiver_li.html())
    $('#chat_receiver_id').val(receiver_li.attr('id'))