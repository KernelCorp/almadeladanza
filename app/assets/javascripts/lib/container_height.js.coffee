$ ->
  resize = ->
    height = parseInt $('#na_page_container').css('height')
    $('#na_content').css('height',height - 201) if (height - 201) > parseInt $('#na_content_wrapper').css('height')
    console.log '!!!!'
  ready = ->
    resize()
    $(window).resize resize
  $(document).ready ready
  $(document).on 'page:load', ready
