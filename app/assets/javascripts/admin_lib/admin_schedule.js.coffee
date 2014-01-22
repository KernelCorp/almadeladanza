#= require lib/schedule
class adminSchedule extends window.schedule
  constructor: ->
    @show_coaches()
    $('#dance_style').change ->
      $('.ready-to-add').removeClass('ready-to-add')
    $('#coach').change @style_after_fiter
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
          if $('.ready-to-add').length > 0
            $(this).parent().parent().addClass('ready-to-add')
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
        if $('#dance_style').val() != '' && $('#coach').val() != '' && hall_id != undefined
          container = $(this)
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
              container.removeClass('ready-to-add')
              adminSchedule::add_lesson(resopnse)
              return
          }
      return
    return



  first_hall_filter_action: ->
    super
    adminSchedule::hall_after_filter('div.hall-1')
    return
  second_hall_filter_action: ->
    super
    adminSchedule::hall_after_filter('div.hall-2')
    return

  hall_after_filter: (hall_class)->
    $('.ready-to-add').removeClass('ready-to-add')
    if $('#dance_style').val() != '' && $('#coach').val() != '' && ($('#schedule').hasClass('filter-first') || $('#schedule').hasClass('filter-second'))
      for td in $('td.lesson-container')
        if $(td).children(hall_class).length == 0
          $(td).addClass('ready-to-add')
    else
      $('.ready-to-add').removeClass('ready-to-add')


  style_after_fiter: =>
    if $('#schedule').hasClass('filter-first') && $('#dance_style').val() != '' && $('#coach').val() != ''
      @hall_after_filter('div.hall-1')
      return
    else
      $('.ready-to-add').removeClass('ready-to-add')
    if $('#schedule').hasClass('filter-second') && $('#dance_style').val() != '' && $('#coach').val() != ''
      @hall_after_filter('div.hall-2')
    else
      $('.ready-to-add').removeClass('ready-to-add')


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
            $('#coach').append('<option></option>')
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
