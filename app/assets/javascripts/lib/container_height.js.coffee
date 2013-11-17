$ ->
  resize = ->
    height = parseInt $('#na_page_container').css('height')
    $('.scrollable_container').css('height',height - 201)
    $('.scrollable').css('height',height - 201)
    console.log '!!!!'
  ready = ->
    resize()
    $(window).resize resize
  $(document).ready ready
  $(document).on 'page:load', ready

#  if (height - 201) > parseInt $('#na_content_wrapper').css('height')
