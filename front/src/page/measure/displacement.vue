<template>
  <div class="all">
    <div class="left">
      <div id="displacement-left-top"></div>
      <div id="displacement-left-bottom"></div>
    </div>
    <div class="right">
      <div id="displacement-right-top"></div>
      <div id="displacement-right-bottom"></div>
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
        data: [],
        xOption: {
          title: {text: '坝体位移x变化情况', x: 'left'},
          legend: {},
          tooltip: {},
          toolbox: websocketUtil.toolbox,
          grid: websocketUtil.grid,
          dataset: {
            source: [
              // ['displacement', '本次测量', '上次测量',],
              // ['0', 1, 2],
              // ['1', 2, 1],
              // ['2', 86.4, 65.2],
              // ['3', 72.4, 53.9],
              // ['4', 43.3, 85.8],
              // ['5', 83.1, 73.4],
              // ['6', 86.4, 65.2],
              // ['7', 72.4, 53.9],
              // ['8', 72.4, 53.9],
            ]
          },
          xAxis: {type: 'category'},
          yAxis: {},
          series: [
            {type: 'bar'},
            {type: 'bar'},
          ]
        },
        yOption: {
          title: {text: '坝体位移y变化情况', x: 'left'},
          legend: {},
          tooltip: {},
          toolbox: websocketUtil.toolbox,
          grid: websocketUtil.grid,
          dataset: {
            source: [
              // ['displacement', '本次测量', '上次测量',],
              // ['0', 1, 2],
              // ['1', 2, 1],
              // ['2', 86.4, 65.2],
              // ['3', 72.4, 53.9],
              // ['4', 43.3, 85.8],
              // ['5', 83.1, 73.4],
              // ['6', 86.4, 65.2],
              // ['7', 72.4, 53.9],
              // ['8', 72.4, 53.9],
            ]
          },
          xAxis: {type: 'category'},
          yAxis: {},
          series: [
            {type: 'bar'},
            {type: 'bar'},
          ]
        },
        zOption: {
          title: {text: '坝体位移z变化情况', x: 'left'},
          legend: {},
          tooltip: {},
          toolbox: websocketUtil.toolbox,
          grid: websocketUtil.grid,
          dataset: {
            source: [
              // ['displacement', '本次测量', '上次测量',],
              // ['0', 1, 2],
              // ['1', 2, 1],
              // ['2', 86.4, 65.2],
              // ['3', 72.4, 53.9],
              // ['4', 43.3, 85.8],
              // ['5', 83.1, 73.4],
              // ['6', 86.4, 65.2],
              // ['7', 72.4, 53.9],
              // ['8', 72.4, 53.9],
            ]
          },
          xAxis: {type: 'category'},
          yAxis: {},
          series: [
            {type: 'bar'},
            {type: 'bar'},
          ]
        },
      }
    },
    mounted() {
      this.getAllData()
    },
    methods: {
      async initChart(chart, option, element) {
        chart = this.$echarts.init(document.getElementById(element))
        chart.showLoading()
        chart.hideLoading()
        chart.setOption(option)
      },
      getAllData(){
        this.getAxisData('x')
        this.getAxisData('y')
        this.getAxisData('z')
        this.initChart(this.xChart, this.xOption, 'displacement-right-top')
        this.initChart(this.yChart, this.yOption, 'displacement-left-bottom')
        this.initChart(this.zChart, this.zOption, 'displacement-right-bottom')
      },
      async getAxisData(axis) {
        let option = null
        switch (axis) {
          case 'x':
            option = this.xOption;
            break
          case 'y':
            option = this.yOption;
            break
          case 'z':
            option = this.zOption;
        }
        let res = await displacementService.findNewestData()
        if (res.code === 0) {
          option.dataset.source.push([axis, '本次测量', '上次测量'])
          res.obj.forEach(item => {
            option.dataset.source.push([item.name, item.thisValue[axis], item.beforeValue[axis]])
          })
        }
      }
    }
  }
</script>

<style scoped>
  #displacement-left-top {
    height: 45vh;
    width: 100%;
  }

  #displacement-right-top {
    height: 45vh;
    width: 100%;
  }

  #displacement-left-bottom {
    height: 45vh;
    width: 100%;
  }

  #displacement-right-bottom {
    height: 45vh;
    width: 100%;
  }
</style>
