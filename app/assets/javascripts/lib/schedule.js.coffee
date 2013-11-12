#= require turbolinks.js
class schedule
  constructor: ->
    @load_lessons(null)
    @bind_filters_on_styles()
    @bind_day_zoom()
  load_lessons: (data)->
    $.ajax {
      type: 'get',
      url: '/lessons.json',
      format: 'json',
      data: data,
      success: (lessons)->
        $('.lesson-container').empty()
        for lesson in lessons
          td_day = '.sc-day-'+lesson.day
          td_time = '.sc-time-'+lesson.time
          td_hall = '.hall-'+lesson.hall_id
          $(td_day+td_time+td_hall).empty()
          $(td_day+td_time+td_hall).append($('span.ui-style-name#style-'+lesson.dance_style_id).text())
    }

  bind_filters_on_styles: ()->

    $('a.ui-tabs-anchor').click (data)=>
      dance_style_id = $(data.currentTarget).children('span').data('lesson-id')
      if  dance_style_id != ''
        data = {
          dance_style_id: dance_style_id
        }
      else
        data = null
      @load_lessons(data)
      return

  bind_day_zoom: ->
    $('a.day-zoom').click ->
      for_zoom_number = $(this).parent().data('zoom-day')
      if !$('.zoom-day-'+for_zoom_number).hasClass('large')
        $('.large').removeClass('large')
        $('.small').removeClass('small')
        $('.zoom-day-'+for_zoom_number).addClass('large')
        $('.sc-day-'+for_zoom_number).addClass('large')
        if $('.sc-day-'+for_zoom_number).prev().hasClass('lesson-container')
          $('.sc-day-'+for_zoom_number).prev().addClass('small')
        $('.sc-day-'+for_zoom_number).next().addClass('small')
        $('.zoom-day-'+for_zoom_number).prev().addClass('small')
        $('.zoom-day-'+for_zoom_number).next().addClass('small')
      else
        $('.zoom-day-'+for_zoom_number).removeClass('large')
        $('.sc-day-'+for_zoom_number).removeClass('large')
        if $('.sc-day-'+for_zoom_number).prev().hasClass('lesson-container')
          $('.sc-day-'+for_zoom_number).prev().removeClass('small')
        $('.sc-day-'+for_zoom_number).next().removeClass('small')
        $('.zoom-day-'+for_zoom_number).prev().removeClass('small')
        $('.zoom-day-'+for_zoom_number).next().removeClass('small')
      return

ready = ->
  new schedule
  return

$(document).ready(ready)
$(document).on('page:load', ready)