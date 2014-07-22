ready = ->
  act = ->
    id =  $(this).attr('href')
    $('.ui-widget-content').hide()
    $(id).show()
    $('.ui-tabs-active').removeClass('ui-tabs-active')
    $(this).parent().addClass('ui-tabs-active')
    return
  init = ->
    content = location.hash || $('.ui-widget-content')[0]
    nav_tab = "[data-slug=#{location.hash}]" || $('ul.ui-tabs-nav li')[0]
    $('ul.ui-tabs-nav li').removeClass('ui-tabs-active')
    $(nav_tab).addClass('ui-tabs-active')
    $('.ui-widget-content').hide()
    $(content).show()
  if document.location.pathname == '/dance_styles' || document.location.pathname == '/lessons'
    init()
  $(window).hashchange init
  $('.ui-tabs-nav a').unbind 'click'
  $('.ui-tabs-nav a').bind 'click', act
$(document).ready ready
#  $(document).on 'page:load', ready
