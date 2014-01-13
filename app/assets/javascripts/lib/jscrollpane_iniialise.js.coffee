ready = ->
  $('.scrollable').jScrollPane(
    contentWidth: '0px'
  )
$(document).ready ready
$(window).resize ready
#  $(document).on 'page:load', ready