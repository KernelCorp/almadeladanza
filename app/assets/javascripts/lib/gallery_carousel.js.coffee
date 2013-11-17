class Gallery
  constructor: ->
    $('a.gallery-image').click @open_gallery
    $('a.ui-tabs-anchor').click @tab_click
  open_gallery: (event) ->
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
  tab_click: (data)->
    $('.gallery-events').empty()
    $.ajax {
      type: 'get'
      url: 'gallery_events.json'
      data: {
        id: $(@).children('span').data('lesson-id')
      }
      success: (events) ->
        i = 0
        for event in events
          image = $('<div class="image-wrapper"><a class="gallery-image" data-image-num="'+i+'" data-image-large="'+event.data_image_large+'"><img src="'+event.src+'" ></a></div>')
          $('.gallery-events').append(image)
          i = i+1
        $('.gallery-events').append('<div class="shadow"></div>')
        $('a.gallery-image').click Gallery::open_gallery
        return
    }
    return
ready = ->
  if $('.gallery-events').length > 0
    new Gallery
  return
$(document).ready ready
#$(document).on 'load', ready