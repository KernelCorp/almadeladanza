class Gallery
  constructor: ->
    $('a.gallery-image').click @open_gallery
  open_gallery: (event)=>
    owner = event.currentTarget
    start = $(owner).data('image-num')
    $('.shadow').show()
    $('.shadow').click ->
      $('.shadow').hide()
      $('.carousel-wrapper').remove()
    if $('ul.bxslider').length == 0
      $('.gallery-events').append('<div class="carousel-wrapper"><ul class="bxslider"></ul><div>')
      for image in $('.gallery-image')
        url = $(image).data('image-large')
        $('ul.bxslider').append('<li><img src='+url+'></li>')
      $('ul.bxslider').bxSlider {
        pager: false
        startSlide: start
      }
    return
ready = ->
  if $('.gallery-events').length > 0
    new Gallery
  return
$(document).ready ready
$(document).on 'load', ready