<template>
  <div>
    {{result}}
  </div>
</template>

<script>
  import websocketUtil from '../../utils/websocket'

  export default {
    name: "soak",
    data() {
      return {
        webSocket: new WebSocket(websocketUtil.webSocketUrl),
        result: null,
        data() {
          return {
            receiveData: [
              {time: '2019.4.24', value: -50},
              {time: '2019.4.25', value: 43},
              {time: '2019.4.26', value: 46},
              {time: '2019.4.27', value: 42},
              {time: '2019.4.28', value: 100}
            ]
          }
        },
      }
    },
    mounted() {
      this.init(this.webSocket)
    },
    methods: {
      init(webSocket) {
        webSocket.onopen = websocketUtil.onopen()
        webSocket.onclose = websocketUtil.onclose()
        webSocket.onerror = websocketUtil.onerror()
        webSocket.onmessage = (res) => this.result = res.data
      },
      chart() {
        let str = []
        let str1 = []
        for (let item of this.receiveData) {
          str.push(item.time)
          str1.push(item.value)
        }
        let option = {
          title: {text: '温度测量'},
          legend: {},
          tooltip: {},
          dataset: {
            source: [this.receiveData]
          },
          xAxis: {
            type: 'category',
            data: str
          },
          yAxis: {
            type: 'value'
          },
          series: [{type: 'line',data: str1}]
        }
        let myChart = this.$echarts.init(document.getElementById('temperature-chart'));
        //数据加载
        myChart.showLoading();
        //关闭加载
        myChart.hideLoading();
        myChart.setOption(option)
      }
    }
  }
</script>

<style scoped>

</style>
