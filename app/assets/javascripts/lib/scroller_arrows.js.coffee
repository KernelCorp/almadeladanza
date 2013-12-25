ready = ->
  element = $('.scrollable').jScrollPane(
    contentWidth: '0px'
    animateScroll: true
  )
  api = element.data('jsp')

  up_arrow = $("<span id='up_arrow' />")
  up_arrow.click ->
    api.scrollByY(-100)

  down_arrow = $("<span id='down_arrow' />")
  down_arrow.click ->
    api.scrollByY(100)

  $('.jspDrag').append up_arrow
  $('.jspDrag').append down_arrow

$(document).ready ready
$(window).resize ready
#  $(document).on 'page:load', ready