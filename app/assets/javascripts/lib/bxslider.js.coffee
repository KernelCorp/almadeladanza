ready = ->
  $(".bxslider").bxSlider (
    pager: false
    infiniteLoop: false
    hideControlOnEnd: true
  )
$(document).ready ready
#  $(document).on 'page:load', ready