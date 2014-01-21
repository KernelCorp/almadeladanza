#= require lib/schedule
class adminSchedule extends window.schedule
  constructor: ->
    @show_coaches()
    super


  hide_empty_rows: ->
    return


  bind_delete: (element)->
    if element == null
      element = $('a.on-schedule')
    element.click ->
      $.ajax {
        type: 'delete'
        url: '/admin/lessons/'+$(this).data('lesson-id')
        success: ()=>
          $(this).parent().remove()
      }
      return false

  bind_add_delete_lessons: ->
    @bind_delete(null)
    $('td.lesson-container').click ->
      if $('#schedule').hasClass('filter-first')
        hall_id = 1
      if $('#schedule').hasClass('filter-second')
        hall_id = 2
      if $(this).children('.hall-'+hall_id).length == 0
        if $('#dance_style').val() != '' && $('#coach').val() != null && hall_id != undefined
          $.ajax {
            type: 'post'
            url: '/admin/lessons'
            data: {
              lesson: {
                day: $(this).data('day')
                time: $(this).data('time')
                coach_id: $('#coach').val()
                dance_style_id: $('#dance_style').val()
                hall_id: hall_id
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


  bind_popover: ()->
    return

  bind_filter_on_stules: ->
    return
  bind_day_zoom: ->
    return
  get_popover_callbacks: ->
    return

ready =->
  schedule = new adminSchedule

$(document).ready ready
$(document).on 'page:load', ready
