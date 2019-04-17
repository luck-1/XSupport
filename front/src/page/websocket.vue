<template>

</template>

<script>
  export default {
    name: "websocket",
    data() {
      return {
        websocketServerUrl: process.env.BASE_API + "/websocket",
        webSocket: null
      }
    },
    mounted() {
      this.initWebSocket()
    },
    methods: {
      initWebSocket() {
        this.websock = new WebSocket(this.websocketServerUrl);
        this.websocket.onopen = this.onOpen;
        this.websock.onmessage = this.onMessage;
        this.websock.onclose = this.onClose;
        this.websocket.onerror = this.onError;
      },

      onOpen() {
        console.log("WebSocket连接成功");
      },
      onMessage(res) { //数据接收
        const redata = JSON.parse(res.data);
        console.log(redata.value);
      },

      onClose(e) { //关闭
        console.log("connection closed (" + e.code + ")");
      },
      onError(error) { //错误
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
