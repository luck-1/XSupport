<template>
  <div class="gas">
    <div id="gas-left"></div>
    <div id="gas-right"></div>
  </div>
</template>

<script>
  import websocketUtil from '../../utils/websocket'

  export default {
    name: "temperature",
    data() {
      return {
        webSocket: new WebSocket(websocketUtil.webSocketUrl),
        leftChart: null,
        rightChart: null,
        leftOption: {
          title: {text: '坝体有毒有害气体占比检测', x: 'center'},
          tooltip: {trigger: 'item', formatter: "{a} <br/>{b} : {c} ({d}%)"},
          legend: {orient: 'vertical', left: 'left'},
          series: [
            {
              name: '有毒气体',
              type: 'pie',
              radius: '55%',
              center: ['50%', '60%'],
              data: [],
              itemStyle: {
                emphasis: {
                  shadowBlur: 10,
                  shadowOffsetX: 0,
                  shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
              }
            }
          ],
        },
        rightOption: {
          color: ['#3398DB'],
          title: {text: '坝体重金属元素检测', x: 'center'},
          tooltip: {trigger: 'axis'},
          grid: {left: '3%', right: '4%', bottom: '3%', containLabel: true},
          xAxis: [{type: 'category', data: [], axisTick: {alignWithLabel: true}}],
          yAxis: [{type: 'value',name: '含量（mg/L）'}],
          series: [{name: '含量', type: 'bar', barWidth: '60%', data: []}
          ],
          toolbox: websocketUtil.toolbox
        },
        leftData: [
          {value: 20, name: 'CO'},
          {value: 20, name: 'SO 2'},
          {value: 20, name: 'NO x'},
          {value: 20, name: 'HCl'},
          {value: 20, name: 'ClO 2'}
        ],
      }
    },
    mounted() {
      this.init(this.webSocket)
      this.initLeftChart()
      this.initRightChart()
    },
    methods: {
      init(webSocket) {
        webSocket.onopen = () => console.log("websocket连接成功");
        webSocket.onclose = () => console.log("websocket关闭链接");
        webSocket.onerror = (err) => console.log('websocket链接错误' + err);
        webSocket.onmessage = this.onmessage
      },
      onmessage(res) {
        res = JSON.parse(res.data)
        if (res.type === 3) {
          this.leftOption.series[0].data = res.list
          this.leftChart.setOption(this.leftOption)
        } else if (res.type === 4) {
          this.getRightData(res.list)
          this.rightChart.setOption(this.rightOption)
        }
      },
      initLeftChart() {
        this.leftChart = this.$echarts.init(document.getElementById('gas-left'))
        //数据加载
        this.leftChart.showLoading();
        //初始化坐标轴数据
        this.getLeftDefaultData()
        //关闭加载
        this.leftChart.hideLoading();
        this.leftChart.setOption(this.leftOption)
      },
      initRightChart() {
        this.rightChart = this.$echarts.init(document.getElementById('gas-right'))
        //数据加载
        this.rightChart.showLoading();
        //关闭加载
        this.rightChart.hideLoading();
        this.rightChart.setOption(this.rightOption)
      },
      getRightData(list){
        this.rightOption.xAxis[0].data = []
        this.rightOption.series[0].data = []
        list.forEach(item => {
          this.rightOption.xAxis[0].data.push(item.name)
          this.rightOption.series[0].data.push(item.value)
        })
      },
      getLeftDefaultData() {
        this.leftOption.series[0].data = this.leftData
      },
    }
  }
</script>

<style scoped>
  .gas {
    height: 100%;
    width: 100%;
  }

  #gas-left {
    float: left;
    height: calc(100vh - 100px);
    width: 40vw;
    border-right: 1px solid;
    margin-right: 5px;
  }

  #gas-right {
    float: left;
    height: 100%;
    width: 45%;
  }
</style>

