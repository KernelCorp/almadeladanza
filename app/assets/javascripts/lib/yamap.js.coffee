ready = ->
  myMap = ''
  init = ->
    myMap = new ymaps.Map "map", {
      center: [55.032056, 82.903490],
      zoom: 16
    }
    myPlacemark = new ymaps.Placemark([55.032056, 82.903490], {} ,{
      iconImageHref: 'http://lorempixel.com/30/42/cats'
      iconImageSize: [30, 42],
      iconImageOffset: [-15, -42]
    })
    myMap.geoObjects.add(myPlacemark)
  ymaps.ready(init)
  return
$(document).ready ready
#$(document).on 'page:load', ready
