ready = ->
  myMap = ''
  init = ->
    myMap = new ymaps.Map "map", {
      center: [55.032056, 82.903490],
      zoom: 16
    }
    myPlacemark = new ymaps.Placemark([55.032056, 82.903490], {} ,{
      iconImageHref: '/system/images/map_point.png'
      iconImageSize: [60, 84],
      iconImageOffset: [-40, -100]
    })
    myMap.geoObjects.add(myPlacemark)
    myMap.controls.add('zoomControl');
  if $('#map').length > 0
    ymaps.ready(init)
  return
$(document).ready ready
#$(document).on 'page:load', ready
