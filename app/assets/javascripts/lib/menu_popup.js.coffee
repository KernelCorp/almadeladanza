class @MenuPopup
  sign_up: '#sign_up'
  shadow: '#main_shadow'
  popup: '#main_popover'
  constructor: ->
    $(@sign_up).click @show_popover
    $(@shadow).click @hide_popover
    $('.close-button').click @hide_popover
    $('.ok').click @hide_popover
    $('.inputs').submit ->
      $('.inputs input.error').removeClass('error')
      if $('#client_name').val() != '' && $('#client_phone').val() != '' && $('#client_email').val() != ''
        $('.inputs').hide()
        $('.confirm-block').show()
      else
        $('.validation_message').show()
        for input in $('.inputs input')
          if $(input).val() == ''
            $(input).addClass('error')
        return false
      return
    return
  show_popover: =>
    $(@popup).fadeIn(500)
    $(@shadow).fadeIn(500)
    return false
  hide_popover: =>
    $(@popup).fadeOut(500)
    $(@shadow).fadeOut(500)
    return false