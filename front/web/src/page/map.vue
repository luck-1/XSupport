<template>
  <div id="map-box"></div>
</template>

<script>
  import BMap from 'baiduMap'
  export default {
    name: "map-box",
    data() {
      return {
        point: {lng: 116.331398, lat: 39.897445},
        zoom: 12
      }
    },
    mounted() {
      this.getLocation();
    },
    methods: {
      getLocation() {
        debugger
        var map = new BMap.Map("map-box");
        var point = new BMap.Point(this.point.lng, this.point.lat);
        map.centerAndZoom(point, this.zoom);
        //
        (new BMap.Geolocation()).getCurrentPosition(location => {
            this.point.lng = location.point.lng;
            this.point.lat = location.point.lat;
        });
        // var point = new BMap.Point(104.075796, 30.659684);
        // map.centerAndZoom(point, 14);
        map.addControl(new BMap.MapTypeControl());
        map.enableScrollWheelZoom(true);
        map.enableDoubleClickZoom(true);
        map.addOverlay(new BMap.Marker(point));


      }
    }
  }
</script>

<style scoped>
  #map-box {
    height: 100%;
    width: 100%;
  }
</style>
