#= require lib/schedule
class adminSchedule extends window.schedule
  bind_filter_on_stules: ->
    return
  bind_day_zoom: ->
    return
  get_popver_callbacks: ->
    return
$(document).ready ->
  schedule = new adminSchedule
