#= require turbolinks.js
class schedule
  constructor: ->
    @load_lessons(null)
  load_lessons: (style)->
    $.ajax {
      type: 'get',
      url: '/lessons.json',
      format: 'json',
      success: (lessons)->
        for lesson in lessons
          td_day = '.sc-day-'+lesson.day
          td_time = '.sc-time-'+lesson.time
          $(td_day+td_time + ' .hall-1').append("some_style")
    }


ready = ->
  new schedule
  return

$(document).ready(ready)
$(document).on('page:load', ready)