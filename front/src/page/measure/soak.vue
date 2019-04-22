<template>
  <div>
    soak
  </div>
</template>

<script>
  export default {
    name: "soak",
    data() {
      return {
        websocketServerUrl: process.env.BASE_API.replace('http://','ws://') + 'websocket',
        webSocket: null
      }
    },
    mounted() {
      this.initWebSocket()
    },
    methods: {
      initWebSocket() {
        debugger
        this.webSocket = new WebSocket(this.websocketServerUrl);
        this.webSocket.onopen = this.onOpen;
        this.webSocket.onmessage = this.onMessage;
        this.webSocket.onclose = this.onClose;
        this.webSocket.onerror = this.onError;
      },

      onOpen() {
        console.log("WebSocket连接成功");
      },
      onMessage(res) {
        res = JSON.parse(res.data);
        console.log(res.value);
      },
      onClose() {
        console.log("connection closed");
      },
      onError() {
        console.log("WebSocket连接发生错误");
      },
      sendData(data) {
        this.websock.send(data);
      }
    }
  }
</script>

<style scoped>

</style>
