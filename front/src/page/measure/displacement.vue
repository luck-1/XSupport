<template>
  <div class="all">
    <div class="left">
      <div class="displacement-pic"></div>
      <div class="displacement" id="displacement-left-bottom"></div>
    </div>
    <div class="right">
      <div class="displacement" id="displacement-right-top"></div>
      <div class="displacement" id="displacement-right-bottom"></div>
    </div>
  </div>
</template>

<script>
  import websocketUtil from '../../utils/websocket'
  import {displacementService} from '../../api/service'
  import {mapState} from 'vuex'
  import store from '../../vuex/store'

  export default {
    name: "displacement",
    store,
    data() {
      return {
        xChart: null,
        yChart: null,
        zChart: null,
        xOption: null,
        yOption: null,
        zOption: null,
        chartData: [],
      }
    },
    computed: mapState(['displacementRecvData']),
    watch: {
      displacementRecvData(newValue) {
        debugger
        this.chartData = []
        newValue.displacement.every.forEach(item => this.chartData.push(this.getDataItem(item.point, item.pointName, item.thisValueData, item.beforeValueData)))
        this.init()
      }
    },
    mounted() {
      this.findNewestData().then(() => this.init())
    },
    methods: {
      async init() {
        debugger
        this.xOption = this.getOption('x')
        this.yOption = this.getOption('y')
        this.zOption = this.getOption('z')
        this.chartData.forEach(item => {
          this.xOption.dataset.source.push([item.name, item.x, item.x0])
          this.yOption.dataset.source.push([item.name, item.y, item.y0])
          this.zOption.dataset.source.push([item.name, item.z, item.z0])
        })
        this.initChart(this.xChart, this.xOption, 'displacement-right-top')
        this.initChart(this.yChart, this.yOption, 'displacement-left-bottom')
        this.initChart(this.xChart, this.zOption, 'displacement-right-bottom')
      },
      async findNewestData() {
        let res = await displacementService.findNewestData()
        if (res.code === 0) {
          res.obj.every.forEach(item => this.chartData.push(this.getDataItem(item.point, item.pointName, item.thisValueData, item.beforeValueData)))
        }
      },
      initChart(chart, option, element) {
        chart = chart === null ? this.$echarts.init(document.getElementById(element)) : chart
        chart.setOption(option)
      },
      getDataItem(index, name, thisValueData, beforeValueData) {
        return {
          index: index,
          name: name,
          x: thisValueData.x,
          y: thisValueData.y,
          z: thisValueData.z,
          x0: beforeValueData.x,
          y0: beforeValueData.y,
          z0: beforeValueData.z
        }
      },
      getOption(axisType) {
        return {
          title: {text: '坝体位移' + axisType + '变化情况', x: 'left'},
          legend: {},
          tooltip: {},
          toolbox: websocketUtil.toolbox,
          grid: websocketUtil.grid,
          dataset: {source: [['displacement', '本次测量', '上次测量']]},
          xAxis: {type: 'category'},
          yAxis: {type: 'value'},
          series: [{type: 'bar'}, {type: 'bar'}]
        }
      }
    }
  }
</script>

<style scoped>
  .displacement-pic {
    background-image: url("../../assets/displacement.jpg");
    height: 45vh;
    width: 100%;
  }

  .displacement {
    height: 45vh;
    width: 100%;
  }

</style>
