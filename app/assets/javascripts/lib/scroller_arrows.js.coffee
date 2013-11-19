ready = ->
  element = $('.scrollable').jScrollPane(
    contentWidth: '0px'
  )
  api = element.data('jsp')

  $('jspDrag:before').click ->
    api.scrollByY('20px')
$(document).ready ready
#  $(document).on 'page:load', ready