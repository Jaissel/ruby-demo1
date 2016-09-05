var markersArray, placeMarkerAndPanTo, updateFields;

markersArray = [];

 $(document).ready(function() {

   var myLatLng = {lat: 4.713302984798316, lng: -74.080810546875};

  $('[data-geousable]').each(function () {
    var $fields = $(this),
    $map = $('<div id="geous-map" style="width:100%;height:200px;"></div>');
    $fields.prepend($map);

    var map = new google.maps.Map(document.getElementById('geous-map'), {
      center: myLatLng,
      scrollwheel: true,
      zoom: 8
    });

    return map.addListener('click', function(e) {
      placeMarkerAndPanTo(e.latLng, map);
      return updateFields(e.latLng);
    });

  });


});

placeMarkerAndPanTo = function(latLng, map) {
  var marker;
  while (markersArray.length) {
    markersArray.pop().setMap(null);
  }
  marker = new google.maps.Marker({
    position: latLng,
    map: map
  });
  map.panTo(latLng);
  return markersArray.push(marker);
};

updateFields = function(latLng) {
  $('#place_latitude').val(latLng.lat());
  return $('#place_longitude').val(latLng.lng());
};
