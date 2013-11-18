class Gallery
  constructor: ->
#    $('a.gallery-image').click @open_gallery
    $('.gallery-image').fancybox({
      maxHeight: 400
      padding: 20
      prevEffect		: 'fade',
      nextEffect		: 'fade',
      openEffect	: 'none',
      closeEffect	: 'none'
#      prevEffect		: 'none'
#      nextEffect		: 'none'
#      'beforeShow': ->
#        $(".fancybox-image").css({
#          'height': '400px'
#          'width': 'auto'
#        })
#        this.height = 400
#        this.width = $(".fancybox-image").innerWidth()
#        return
    })
    $('a.ui-tabs-anchor').click @tab_click
  open_gallery: (event) ->
#    owner = event.currentTarget
#    start = $(owner).data('image-num')
#    $('.shadow').show()
#    $('.shadow').click ->
#      $('.shadow').hide()
#      $('.carousel-wrapper').remove()
#    if $('ul.bxslider').length == 0
#      $('.gallery-events').append('<div class="carousel-wrapper"><ul class="bxslider"></ul><div>')
#      for image in $('.gallery-image')
#        url = $(image).data('image-large')
#        $('ul.bxslider').append('<li><img src='+url+'></li>')

#        pager: false
#        startSlide: start
#        adaptiveHeight: true
#      }
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
        for event in events
          image = $('<div class="image-wrapper"><a class="gallery-image" rel="gallery" href="'+event.data_image_large+'"><img src="'+event.src+'" ></a></div>')
          $('.gallery-events').append(image)
        $('.gallery-image').fancybox({
          maxHeight: 400
          padding: 20
          prevEffect: 'fade',
          nextEffect: 'fade',
        })
        return
    }
    return
ready = ->
  if $('.gallery-events').length > 0
    new Gallery
  return
$(document).ready ready
#$(document).on 'load', ready