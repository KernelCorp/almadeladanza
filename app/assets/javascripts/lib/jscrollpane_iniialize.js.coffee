$ ->
  ready = ->
    $('#na_right_panel').jScrollPane()
      contentWidth: 0
  $(document).ready ready
  $(document).on 'page:load', ready