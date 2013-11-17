#= require turbolinks.js
class schedule
  constructor: ->
    @load_lessons(null)
    @bind_filters_on_styles()
    @bind_day_zoom()
  load_lessons: (data)->
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
    $.ajax {
      type: 'get',
      url: '/lessons.json',
      format: 'json',
      data: data,
      success: (lessons) =>
        $('.open').popover('hide')
        $('.lesson-container').empty()
        $('.open').removeClass('open')
        for lesson in lessons
          td_day = '.sc-day-'+lesson.day
          td_time = '.sc-time-'+lesson.time
          td_hall = '.hall-'+lesson.hall_id
          $(td_day+td_time+td_hall).empty()
          $(td_day+td_time+td_hall).append('<a data-toggle="popover" class="on-schedule" >'+$('span.ui-style-name#style-'+lesson.dance_style_id).text()+"</a>")
          element = $(td_day+td_time+td_hall+ ' a')
          @get_popver_html(element, lesson)
    }

  get_popver_html: (element, lesson) ->
    $.ajax {
      type: 'get'
      url: 'lessons/'+lesson.id
      success: (response)=>
        @bind_popver(response, element)
    }
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
    $('a.day-zoom').off().off().on 'click', ->
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
    return false
  show_popover: (owner)->
    if owner.hasClass 'open'
      owner.removeClass 'open'
    $('.open').popover('hide')
    owner.addClass 'open'
    $('.ui-widget-content .shadow').show()
    $('.shadow').click ->
      $('.open').popover('hide')
      $(this).hide()
    return
  hide_popover: (owner)->
    owner.removeClass 'open'
    $('.ui-widget-content .shadow').hide()
    return

  bind_popver: (response, element) =>
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