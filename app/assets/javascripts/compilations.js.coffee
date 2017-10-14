# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

  fave = $('div#fave')
  $.get('/compilations/'+compilation_id+'/favourite_data.json').then (r) ->
    fave.find('span.fav-count').text r.count
    if r.fave_status
      icon = $('a#fave i')
      icon.removeClass 'fa-heart-o'
      icon.addClass 'fa-heart'
    return

  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $('a#embed').on 'click', (e) ->
    e.preventDefault()
    code = $('code#embed')
    text = code.text()
    code.text text.replace('XYZ', document.body.clientHeight - 150)
    $('div#embed_code').show()
    $('html, body').scrollTop $(document).height()
    return

  $('a#fbshare').click (e) ->
    e.preventDefault()
    window.open $(this).attr('href'), 'fbShareWindow', 'height=450, width=550, toolbar=0, location=0, menubar=0, directories=0, scrollbars=0'
    false

  $('a#fave').on 'click', (e) ->
    e.preventDefault()
    icon = $('a#fave i')
    if icon.hasClass('fa-heart')
      $.ajax
        url: '/compilations/'+compilation_id+'/favourite'
        type: 'PUT'
        data: 'type': 'unfave'
        success: (r) ->
          fave.find('span.fav-count').text r.count
          icon.removeClass('fa-heart')
          icon.addClass('fa-heart-o')
          return
    else
      $.ajax
        url: '/compilations/'+compilation_id+'/favourite'
        type: 'PUT'
        data: 'type': 'fave'
        success: (r) ->
          fave.find('span.fav-count').text r.count
          icon.removeClass('fa-heart-o')
          icon.addClass('fa-heart')
          return
    return

