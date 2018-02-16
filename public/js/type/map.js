/**
 * 
 */
$( document ).ready(function() {
	$("body").append('<div id="map" class="map"></div>');
	var map = new ol.Map({
		target: 'map',
		layers: [
		    new ol.layer.Tile({
		    	source: new ol.source.OSM()
		    })
		],
		view: new ol.View({
			center: ol.proj.fromLonLat([-53.1341847, -29.9308313]),
			zoom: 7
		})
	});
});

