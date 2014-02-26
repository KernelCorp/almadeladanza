#= require lib/schedule
class adminSchedule extends window.schedule
  constructor: ->
    @show_coaches()
    $('#dance_style').change ->
      $('.ready-to-add').removeClass('ready-to-add')
    $('#coach').change @style_after_fiter
    $('.modal-actions .delete').click adminSchedule::delete_lesson
    $('.modal-actions .busy').click adminSchedule::make_busy
    $('.modal-actions .cancel').click adminSchedule::make_busy
    super


  hide_empty_rows: ->
    return


  bind_delete: (element)->

    if element == null
      element = $('a.on-schedule')
    element.click @show_admin_popover



  delete_lesson: ->
    lesson_id = $('.admin-popover .lesson-id').val()
    $.ajax {
      type: 'delete'
      url: '/admin/lessons/'+lesson_id
      success: ()=>
        elem = $("a[data-lesson-id=#{lesson_id}]")
        if $('.ready-to-add').length > 0
          $(elem).parent().parent().addClass('ready-to-add')
        $(elem).parent().remove()
        adminSchedule::hide_admin_popover()
    }
    return false

  show_admin_popover: ->
    $('.admin-popover .style').replaceWith("<span class='style'>#{$(this).text()}</span>")
    $('.admin-popover .coach').replaceWith("<span class='coach'>#{$(this).data('coach')}</span>")
    $('.admin-popover .time').replaceWith("<span class='time'>#{$(this).data('time')}</span>")
    $('.admin-popover .day').replaceWith("<span class='day'>#{$(this).data('day')}</span>")

    $('.admin-modal-shadow').show()
    $('.admin-popover').show()
    $('.admin-modal-shadow').click adminSchedule::hide_admin_popover
    $('.admin-popover .lesson-id').val($(this).data('lesson-id'))
    if $(this).hasClass 'no-vacancy'
      $('.admin-popover .busy').text('Есть свободные места')
    else
      $('.admin-popover .busy').text('Группа набрана')
    return

  hide_admin_popover: ->
    $('.admin-modal-shadow').hide()
    $('.admin-popover').hide()
    return

  make_busy: ->
    lesson_id = $('.admin-popover .lesson-id').val()
    $.ajax {
      type: 'post'
      url: "/admin/lessons/#{lesson_id}/make_busy"
      success: ->
        elem = $("a[data-lesson-id=#{lesson_id}]")
        if elem.hasClass 'no-vacancy'
          elem.removeClass 'no-vacancy'
          elem.attr('data-busy', false)
        else
          elem.addClass 'no-vacancy'
          elem.attr('data-busy', true)
        adminSchedule::hide_admin_popover()
        return
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

  bind_hover: ->
    $('.ready-to-add').mouseenter ->
      $(this).addClass('hover')
      return
    $('.ready-to-add').mouseleave ->
      $('.hover').removeClass('hover')
      return

  first_hall_filter_action: ->
    super
    adminSchedule::hall_after_filter('div.hall-1')
    adminSchedule::bind_hover()
    return
  second_hall_filter_action: ->
    super
    adminSchedule::hall_after_filter('div.hall-2')
    adminSchedule::bind_hover()
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
