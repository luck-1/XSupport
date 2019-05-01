<template>
  <div class="gas">
    <div id="gas-left"></div>
    <div id="gas-right"></div>
  </div>
</template>

<script>
  import websocketUtil from '../../utils/websocket'
  import {gasService, typeService} from '../../api/service'

  export default {
    name: "temperature",
    data() {
      return {
        leftBigType: 3,
        rightBigType: 4,
        webSocket: new WebSocket(websocketUtil.webSocketUrl),
        leftChart: null,
        rightChart: null,
        leftOption: {
          title: {text: '坝体有毒有害气体占比检测', x: 'center'},
          tooltip: {trigger: 'item', formatter: "{a} <br/>{b} : {c} ({d}%)"},
          grid: websocketUtil.grid,
          legend: {orient: 'vertical', left: 'left'},
          series: [
            {
              name: '有毒气体',
              type: 'pie',
              radius: '55%',
              center: ['50%', '60%'],
              data: [],
              itemStyle: {emphasis: {shadowBlur: 10, shadowOffsetX: 0, shadowColor: 'rgba(0, 0, 0, 0.5)'}}
            }
          ],
        },
        rightOption: {
          color: ['#3398DB'],
          title: {text: '坝体重金属元素检测', x: 'center'},
          tooltip: {trigger: 'axis'},
          toolbox: websocketUtil.toolbox,
          grid: websocketUtil.grid,
          xAxis: [{type: 'category', data: [], axisTick: {alignWithLabel: true}}],
          yAxis: [{type: 'value', name: '含量（mg/L）'}],
          series: [{name: '含量', type: 'bar', barWidth: '60%', data: []}]
        }
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
        if (res.type === this.leftBigType) {
          this.leftOption.series[0].data[res.gasParam.subIndex].value = res.gasParam.value
          this.leftChart.setOption(this.leftOption)
        } else {
          this.rightOption.series[0].data[res.gasParam.subIndex] = res.gasParam.value
          this.rightChart.setOption(this.rightOption)
        }
      },
      async initLeftChart() {
        this.leftChart = this.$echarts.init(document.getElementById('gas-left'))
        this.leftChart.showLoading()
        await this.getDefaultName(this.leftBigType)
        await this.getDefaultValue(this.leftBigType)
        this.leftChart.hideLoading()
        this.leftChart.setOption(this.leftOption)
      },
      async initRightChart() {
        this.rightChart = this.$echarts.init(document.getElementById('gas-right'))
        this.rightChart.showLoading();
        await this.getDefaultName(this.rightBigType)
        await this.getDefaultValue(this.rightBigType)
        this.rightChart.hideLoading()
        this.rightChart.setOption(this.rightOption)
      },
      getDefaultName(bigType) {
        return typeService.findTypes({bigType: bigType}).then(res => {
          if (res.code === 0) {
            res.obj.forEach(item => {
              if (bigType === this.leftBigType) {
                this.leftOption.series[0].data.push({name: item.name, value: 0})
              }else {
                this.rightOption.xAxis[0].data.push(item.name)
              }
            })
          }
        })
      },
      getDefaultValue(bigType) {
        return gasService.findNewestData({bigType: bigType}).then(res => {
          if (res.code === 0) {
            res.obj.forEach(item => {
              if (bigType === this.leftBigType){
                this.leftOption.series[0].data[item.subIndex].value = item.value
              } else {
                this.rightOption.series[0].data[item.subIndex] = item.value
              }
            })
          }
        })
      }
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

