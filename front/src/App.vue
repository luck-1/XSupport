<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
  import store from './vuex/store'
  import {mapMutations} from 'vuex'
  export default {
    name: 'App',
    store,
    data(){
      return{
        webSocket: new WebSocket(process.env.BASE_API.replace('http://', 'ws://') + 'websocket'),
      }
    },
    mounted(){
      this.initWebSocket(this.webSocket)
    },
    methods: {
      ...mapMutations(['setTemperatureRecvData','setHumidityRecvData','setSoakRecvData','setGasRecvData','setMetalRecvData','setDisplacementRecvData']),
      initWebSocket(webSocket) {
        webSocket.onopen = () => console.log("websocket连接成功 APP");
        webSocket.onclose = () => console.log("websocket关闭链接");
        webSocket.onerror = (err) => console.log('websocket链接错误' + err);
        webSocket.onmessage = this.onmessage
      },
      onmessage(res) {
        res = JSON.parse(res.data)
        switch (res.bigType) {
          case 0: this.setTemperatureRecvData(res);break
          case 1: this.setHumidityRecvData(res);break
          case 2: this.setSoakRecvData(res);break
          case 3: this.setGasRecvData(res);break
          case 4: this.setMetalRecvData(res);break
          case 5: this.setDisplacementRecvData(res)
        }
      }
    }
  }
</script>

<style>
</style>
