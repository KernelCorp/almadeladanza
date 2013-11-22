#= require lib/schedule
class adminSchedule extends window.schedule
  constructor: ->
    @show_coaches()
    super


  bind_add_delete_lessons: ->
    $('a.on-schedule').click ->
      $.ajax {
        type: 'delete'
        url: '/admin/lessons/'+$(this).data('lesson-id')
        success: ()=>
          $(this).remove()
      }
      return false


    $('td.lesson-container').click ->
      if $(this).children('a').length > 0
        $(this).children('a').click()
      else
        if $('#dance_style').val() != '' && $('#coach').val() != null
          $.ajax {
            type: 'post'
            url: '/admin/lessons'
            data: {
              lesson: {
                day: $(this).data('day')
                time: $(this).data('time')
                coach_id: $('#coach').val()
                dance_style_id: $('#dance_style').val()
                hall_id: $(this).data('hall')
              }
            }
            success: (resopnse)=>
              adminSchedule::add_lesson(resopnse)
              return
          }
      return
    return

  show_coaches: ->
    $('#dance_style').change ->
      if $(this).val() != undefined
        $.ajax {
          type: 'get'
          url: '/admin/dance_styles/get_coaches.json'
          data: {
            id: $(this).val()
          }
          success: (request)->
            $('#coach').empty()
            for coach in request
              $('#coach').append('<option value="'+coach.id+'">'+coach.name+'</option>')
            return
        }
      else
        $('#coach').empty()
    return

#  bind_admin_popover: ()->
#    $('.on-schedule').popover {
#      trigger: 'click'
#    }
#    return
  bind_popover: ()->
    return

  bind_filter_on_stules: ->
    return
  bind_day_zoom: ->
    return
  get_popover_callbacks: ->
    return
  get_popver_callbacks: ->
    return

ready =->
  schedule = new adminSchedule

$(document).ready ready
$(document).on 'page:load', ready
