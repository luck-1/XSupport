<template>
  <div id="map-box"></div>
</template>

<script>
  import BMap from 'baiduMap'

  export default {
    name: "map-box",
    data() {
      return {
        zoom: 15
      }
    },
    mounted() {
      this.getLocationMap();
    },
    methods: {
      getLocationMap() {
        let map = new BMap.Map("map-box");
        let point = new BMap.Point(116.331398, 39.897445);
        map.centerAndZoom(point, this.zoom);
        // navigator.geolocation.getCurrentPosition(position => {
        //   //经度
        //   let longitude = position.coords.longitude;
        //   //纬度
        //   let latitude = position.coords.latitude;
        //   BMap.convgps(longitude, latitude, 1, 5, convRst => {
        //     let point = new BMap.Point(convRst.x, convRst.y);
        //     map.panTo(point)
        //     //当前位置标注
        //     map.addOverlay(new BMap.Marker(point));
        //   })
        // });

        let geolocation = new BMap.Geolocation()
        // 开启SDK辅助定位
        geolocation.enableSDKLocation();

        geolocation.getCurrentPosition(location => {

          if (geolocation.getStatus() === BMAP_STATUS_SUCCESS) {
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
    },
    onSuccess(position) {
      //经度
      let longitude = position.coords.longitude;
      //纬度
      let latitude = position.coords.latitude;
    }
  }
</script>

<style scoped>
  #map-box {
    height: 100%;
    width: 100%;
  }
</style>
