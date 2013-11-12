$ ->
  ready = ->
    act = ->
      id =  $(this).attr('href')
      $('.ui-widget-content').hide()
      $(id).show()
      $('.ui-tabs-active').removeClass('ui-tabs-active')
      $(this).parent().addClass('ui-tabs-active')
      return false
    $($('ul.ui-tabs-nav li')[0]).addClass('ui-tabs-active')
    $('.ui-widget-content').hide()
    $('#fragment-1.ui-widget-content').show()
    $('.ui-tabs-nav a').unbind 'click'
    $('.ui-tabs-nav a').bind 'click', act
  $(document).ready ready
  $(document).on 'page:load', ready
