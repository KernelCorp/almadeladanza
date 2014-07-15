class @MenuPopup
  sign_up: '#sign_up'
  shadow: '#main_shadow'
  popup: '#main_popover'
  constructor: ->
    $(@sign_up).click @show_popover
    $(@shadow).click @hide_popover
    return
  show_popover: =>
    $(@popup).fadeIn(500)
    $(@shadow).fadeIn(500)
    return false
  hide_popover: =>
    $(@popup).fadeOut(500)
    $(@shadow).fadeOut(500)
    return false