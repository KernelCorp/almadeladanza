class window.schedule
  constructor: ->
    @bind_halls_filter()
    @get_popover_callbacks()
    @load_lessons(null)
    @bind_filters_on_styles()
    @bind_day_zoom()
  zoom_target: ''
  popover_open: false

  hide_empty_rows: ->
    $('.ui-widget-content').removeClass('empty')
    $('.lessons-row').addClass('not-empty')
    for time_row in $('.time')
      row = $(time_row).parent()
      if row.find('a.on-schedule:visible').length == 0
        row.removeClass('not-empty')
      else
        row.addClass('not-empty')
    if $('a.on-schedule:visible').length == 0
      $('.ui-widget-content').addClass('empty')
    return

  bind_halls_filter: ->
    $('.halls .first a').click ->
      if $(this).hasClass('active')
        $(this).removeClass('active')
        $('#schedule').removeClass('filter-first')
      else
        $('.active').removeClass('active')
        $(this).addClass('active')
        $('#schedule').addClass('active')
        $('#schedule').removeClass('filter-second')
        $('#schedule').addClass('filter-first')
      schedule::hide_empty_rows()
      return

    $('.halls .second a').click ->
      if $(this).hasClass('active')
        $(this).removeClass('active')
        $('#schedule').removeClass('filter-second')
      else
        $('.active').removeClass('active')
        $(this).addClass('active')
        $('#schedule').addClass('active')
        $('#schedule').removeClass('filter-first')
        $('#schedule').addClass('filter-second')
      schedule::hide_empty_rows()
      return

    return

  bind_add_delete_lessons: ->
    return

  load_lessons: (data)->
    $.ajax {
      type: 'get',
      url: '/lessons.json',
      format: 'json',
      data: data,
      success: (lessons) =>
        $('.not-empty').removeClass('not-empty')
        $('.open').popover('hide')
        $('.lesson-container').empty()
        $('.open').removeClass('open')
        for lesson in lessons
          @add_lesson(lesson)
        @bind_add_delete_lessons()
        @hide_empty_rows()

    }

  add_lesson: (lesson)->
    td_day = '.sc-day-'+lesson.day
    td_time = '.sc-time-'+lesson.time
    td_hall = '.hall-'+lesson.hall_id
    $(td_day+td_time+td_hall).empty()
    $(td_day+td_time+td_hall).append('<a data-toggle="popover"  class="on-schedule"  data-lesson-id="'+lesson.id+'">'+$('span.ui-style-name#style-'+lesson.dance_style_id).text()+"</a>")
    element = $(td_day+td_time+td_hall+ ' a')
    @bind_delete(element)
    if $('.additional-info').length > 0
      coach = $('.ui-coach-name#coach-'+lesson.coach_id).text()
      day =  $('.ui-day#day-'+lesson.day).text()
      time =  $('.ui-time#hall'+lesson.hall_id+'-time-'+lesson.time).text()
      title = "Тренер: "+coach+" день: "+day+" время:"+time
      element.attr('title', title)
    element.parent().parent().addClass('not-empty')
#    if element.parent().parent().prev().children('.time').length > 0
#      element.parent().parent().prev().addClass('not-empty')
#    if element.parent().parent().children('.time').length > 0
#      element.parent().parent().next().addClass('not-empty')
    @get_popover_html(element, lesson)
    return


  bind_delete: ()->
    return

  get_popover_html: (element, lesson) ->
    $.ajax {
      type: 'get'
      url: '/lessons/'+lesson.id
      success: (response)=>
        @bind_popover(response, element)
    }
    return
  get_popover_callbacks: ->
    window.tmp_show = null
    window.tmp_hide = null
    tmp_show = $.fn.popover.Constructor.prototype.show
    tmp_hide = $.fn.popover.Constructor.prototype.hide
    $.fn.popover.Constructor.prototype.show = ->
      tmp_show.call(this)
      if (this.options.onshow)
        this.options.onshow(this.$element)
      return
    $.fn.popover.Constructor.prototype.hide = ->
      tmp_hide.call(this)
      if (this.options.onhide)
        this.options.onhide(this.$element)
      return

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
    zoom = ->
      for_zoom_number = $(this).parent().data('zoom-day')
      if $(this).data('head-class') != undefined
        for_zoom_number = $(this).data('head-class')
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
        schedule::zoom_target = $(this).data('head-class')
        return

    day_mouse_enter = ->
      head_class = $(this).data('head-class') || $(this).parent().data('head-class')
      if schedule::zoom_target != head_class
        $('.'+head_class+' a').click()
      if head_class == undefined
        $('.large').removeClass('large')
        $('.small').removeClass('small')
      schedule::zoom_target = head_class
      return
    $('a.day-zoom').click zoom
    $('a.day-zoom').mouseenter day_mouse_enter
    $('td, th').mouseenter day_mouse_enter
    $('table#schedule').mouseleave =>
      if !@popover_open
        $('.large').removeClass('large')
        $('.small').removeClass('small')
        schedule::zoom_target = ''
      return
    return false

  show_popover: (owner)->
    if owner.hasClass 'open'
      owner.removeClass 'open'
    schedule::popover_open = true
    $('.open').popover('hide')
    owner.addClass 'open'
    $('.ui-widget-content .shadow').show()
    $('.shadow').click ->
      $('.open').popover('hide')
      $(this).hide()
    $('.close-button').click ->
      $('.open').popover('hide')
      return
    $('.button-wrap .sign').click ->
      $(this).hide()
      $('form.inputs').show()
      $('.inputs input').on 'input', ->
        if $(this).val() != ''
          $(this).removeClass('error')
      $('.inputs').submit ->
        $('.inputs input.error').removeClass('error')
        if $('#client_name').val() != '' && $('#client_phone').val() != '' && $('#client_email').val() != ''
          $('.popover-body, .popover-head').hide()
          $('.confirm-block').show()
          $('.popover').addClass('small-popover')
          $('.ok').click ->
            $('.open').popover('hide')
        else
          $('.validation-message').show()
          for input in $('.inputs input')
            if $(input).val() == ''
              $(input).addClass('error')
        return
      return
    return
  hide_popover: (owner)->
    owner.removeClass 'open'
    $('.ui-widget-content .shadow').hide()
    schedule::popover_open = false
    return

  bind_popover: (response, element) =>
    if element.parent().hasClass('sc-time-0') || element.parent().hasClass('sc-time-1') || element.parent().hasClass('sc-time-2')
      placement = 'bottom'
    else
      placement = 'top'
    element.popover {
      placement: placement
      html: true,
      onshow: @show_popover
      onhide: @hide_popover
      container: '.ui-widget-content'
      content: ->
        return response
    }
    return
#          $('.on-schedule').click @show_popover

ready = ->
  if $('.lessons').length > 0
    new schedule
  return

$(document).ready(ready)
#$(document).on('page:load', ready)