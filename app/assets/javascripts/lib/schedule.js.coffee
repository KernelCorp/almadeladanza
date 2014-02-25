class window.schedule
  constructor: ->
    if $('#schedule').length > 0
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
    $('.halls .first a').click @first_hall_filter_action
    $('.halls .second a').click @second_hall_filter_action
    return

  first_hall_filter_action: ->
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

  second_hall_filter_action: ->
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
    hall_class = 'hall-'+lesson.hall_id
    $(td_day+td_time).append('<div class="'+hall_class+'" > <a data-toggle="popover"  class="on-schedule"  ' +
     'data-lesson-id="'+lesson.id+'">'+$('span.ui-style-name#style-'+lesson.dance_style_id).text()+'</a></div>')
    element = $(td_day+td_time+' .'+hall_class+ ' a')
    if lesson.no_vacancy
      element.addClass('no-vacancy')
    @bind_delete(element)
    if $('.additional-info').length > 0
      coach = $('.ui-coach-name#coach-'+lesson.coach_id).text()
      day =  $('.ui-day#day-'+lesson.day).text()
      time =  $('.ui-time#time-'+lesson.time).text()
      title = "Тренер: "+coach+" день: "+day+" время:"+time
      element.attr('title', title)
      element.attr('data-coach', coach)
      element.attr('data-time', time)
      element.attr('data-day', day)
    element.parent().parent().addClass('not-empty')
    if !lesson.no_vacancy
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
      if $('.filter-first').length > 0
        $('.halls .first a').click()
      if $('.filter-second').length > 0
        $('.halls .second a').click()
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
    $('a.day-zoom').click zoom
    return false

  show_popover: (owner)->
    if owner.hasClass 'open'
      owner.removeClass 'open'
    schedule::popover_open = true
    $('.open').popover('hide')
    owner.addClass 'open'
    $('.shadow').show()
    $('.ui-widget-content').addClass('popover-open')
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
    $('.ui-widget-content').removeClass('popover-open')
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