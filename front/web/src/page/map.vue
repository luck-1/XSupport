<template>
  <div id="map-box"></div>
</template>

<script>
  import BMap from 'baiduMap'

  export default {
    name: "map-box",
    data() {
      return {
        zoom: 12
      }
    },
    mounted() {
      this.getLocation();
    },
    methods: {
      getLocation() {
        let map = new BMap.Map("map-box");
        let point = new BMap.Point(116.331398, 39.897445);
        map.centerAndZoom(point, this.zoom);
        let geolocation = new BMap.Geolocation()
        geolocation.getCurrentPosition(location => {

          if (geolocation.getStatus() === 0) {
            // if(1){
            map.panTo(location.point)
            //当前位置标注
            map.addOverlay(new BMap.Marker(location.point));
          } else {
            alert('err code: ' + this.getStatus());
          }
        });
        //鼠标滑轮缩放
        map.enableScrollWheelZoom(true);
        //双击缩放
        map.enableDoubleClickZoom(true);
        //地图缩放
        map.addControl(new BMap.ScaleControl());
        //可折叠的缩略图
        map.addControl(new BMap.OverviewMapControl());
        // 地图类型
        map.addControl(new BMap.MapTypeControl());
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
