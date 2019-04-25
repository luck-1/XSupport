<template>
  <div class="temperature">
    <div id="temperature-left"></div>
    <div id="temperature-right"></div>
  </div>
</template>

<script>
  import websocketUtil from '../../utils/websocket'

  export default {
    name: "temperature",
    data() {
      return {
        webSocket: new WebSocket(websocketUtil.webSocketUrl),
        myChart: null,
        receiveData: [
          {time: '2019.4.24', value: -50},
          {time: '2019.4.25', value: 43},
          {time: '2019.4.26', value: 46},
          {time: '2019.4.27', value: 42},
          {time: '2019.4.28', value: 100}
        ],
        option: {
          title: {text: '温度变化曲线'},
          // legend: {},
          tooltip: {},
          xAxis: {type: 'category',data: this.xData},
          yAxis: {type: 'value'},
          series: [{type: 'line',data: this.yData}]
        },
        xData: [],
        yData: []
      }
    },
    mounted() {
      this.init(this.webSocket)
      // this.chart()
    },
    methods: {
      init(webSocket) {
        debugger
        webSocket.onopen = websocketUtil.onopen()
        webSocket.onclose = websocketUtil.onclose()
        webSocket.onerror = websocketUtil.onerror()
        webSocket.onmessage = this.onmessage
      },
      onmessage(res) {
        debugger
        this.xData.push(res.time)
        this.yData.push(res.value)
        // this.myChart.setOption(this.option)
      },
      getAxisData(){
        for (let item of this.receiveData) {
          this.xData.push(item.time)
          this.yData.push(item.value)
        }
      },
      chart() {
        this.getAxisData()
        let option = {
          title: {text: '温度变化曲线'},
          // legend: {},
          tooltip: {},
          // dataset: {source: {xData, yData}},
          xAxis: {type: 'category',data: this.xData},
          yAxis: {type: 'value'},
          series: [{type: 'line',data: this.yData}]
        }
        this.$echarts.init(document.getElementById('temperature-left')),
        //数据加载
        this.myChart.showLoading();
        //关闭加载
        this.myChart.hideLoading();
        this.myChart.setOption(option)
      }
    }
  }
</script>

<style scoped>
  .temperature {
    height: 100%;
    width: 100%;
  }

  #temperature-left {
    float: left;
    height: calc(100vh - 100px);
    width: 40vw;
    border-right: 1px solid;
    margin-right: 5px;
  }

  #temperature-right {
    float: left;
    height: 100%;
    width: 45%;
  }
</style>
