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
    })
    $('a.ui-tabs-anchor').click @tab_click
  open_gallery: (event) ->

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