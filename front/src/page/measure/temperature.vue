<template>
  <div class="temperature">
    <div class="temperature-top">
      <el-input class="temperature-input" :placeholder="'当前阈值：' + option.series[0].markLine.data[0].yAxis"
                type="number" v-model="LIMIT_VALUE">
      </el-input>
      <el-button type="primary" size="mini" @click="setMaxValue">设置阈值</el-button>
    </div>

    <div id="temperature-left"></div>
    <div id="temperature-right">
      <Row>
        <el-table border size="small" :data="rightData" height="calc(100vh - 200px)">
          <el-table-column align="center" type="index" label="序号" width="70"></el-table-column>
          <el-table-column align="center" label="记录时间" width="200" sortable prop="createTime"></el-table-column>
          <el-table-column align="center" label="温度值" width="130" prop="value"></el-table-column>
          <el-table-column align="center" label="阈值" width="130" prop="limitValue"></el-table-column>
          <el-table-column align="center" label="状态" width="150" prop="state"
                           :filters="[{text: '正常', value: false },{text: '异常', value: true }]" :filter-multiple="false"
                           :filter-method="(value,row) => row.state === value" filter-placement="bottom-start">
            <template slot-scope="{row}">
              <el-tag :type="row.state === 1 ? 'danger' : ''" class="tag-min">
                {{row.state ? '正常' : '异常'}}
              </el-tag>
            </template>
          </el-table-column>
        </el-table>
      </Row>
      <Row type="flex" justify="center" class="page">
        <Page :current="searchForm.page"
              :total="total"
              :page-size="searchForm.size"
              @on-change="pageChange"
              @on-page-size-change="pageSizeChange"
              :page-size-opts="[10,20,50]"
              show-sizer show-total show-elevator
              size="small">
        </Page>
      </Row>
    </div>
  </div>
</template>

<script>
  import websocketUtil from '../../utils/websocket'
  import {temperatureService} from '../../api/service'

  export default {
    name: "temperature",
    data() {
      return {
        webSocket: new WebSocket(websocketUtil.webSocketUrl),
        leftChart: null,
        MAX_POINT_COUNT: 15,
        LIMIT_VALUE: null,
        option: {
          title: {text: '坝体温度变化曲线', x: 'center'},
          tooltip: {},
          xAxis: {type: 'category', data: [], axisLabel: {interval: 0, rotate: 40}},
          yAxis: {type: 'value', name: '温度（ ℃）'},
          series: [{type: 'line', data: [], markLine: {data: [{name: '阈值', yAxis: 0.3}]}}],
          toolbox: websocketUtil.toolbox,
        },
        rightData: [],
        total: 0,
        searchForm: {
          page: 1,
          size: 10,
        }
      }
    },
    mounted() {
      this.init(this.webSocket)
      this.initChart()
    },
    methods: {
      init(webSocket) {
        webSocket.onopen = () => console.log("websocket连接成功");
        webSocket.onclose = () => console.log("websocket关闭链接");
        webSocket.onerror = (err) => console.log('err' + err);
        webSocket.onmessage = this.onmessage
      },
      onmessage(res) {
        res = JSON.parse(res.data)
        if (res.type === 0) {
          if (this.option.xAxis.data.length > this.MAX_POINT_COUNT) {
            this.option.xAxis.data.splice(0, 1)
            this.option.series[0].data.splice(0, 1)
          }
          this.option.xAxis.data.push(this.getTime(res.time))
          this.option.series[0].data.push(res.value)
          this.leftChart.setOption(this.option)
          this.getRightData()
        }
      },
      getTime(dateTime) {
        let time = new Date(dateTime)
        return time.getHours() + ':' + time.getMinutes() + ':' + time.getSeconds()
      },
      getDefaultData() {
        temperatureService.findAll({page: 1, size: this.MAX_POINT_COUNT}).then(res => {
          if (res.code === 0) {
            for (let i = 0; i < res.obj.list.length; i++) {
              this.option.xAxis.data.push(this.getTime(res.obj.list[i].createTime))
              this.option.series[0].data.push(res.obj.list[i].value)
            }
          }
        })
      },
      initChart() {
        this.leftChart = this.$echarts.init(document.getElementById('temperature-left'))
        //数据加载
        this.leftChart.showLoading();
        //初始化坐标轴数据
        this.getDefaultData()
        //关闭加载
        this.leftChart.hideLoading();
        this.leftChart.setOption(this.option)
      },
      setMaxValue() {
        if (this.LIMIT_VALUE !== null) {
          this.option.series[0].markLine.data[0].yAxis = this.LIMIT_VALUE
          this.LIMIT_VALUE = null
          this.leftChart.setOption(this.option)
        }
      },
      getRightData() {
        temperatureService.findAll(this.searchForm).then(res => {
          if (res.code === 0) {
            this.rightData = res.obj.list
            this.total = res.obj.total
          }
        })
      },
      pageChange(page) {
        this.searchForm.page = page
        this.getRightData()
      },
      pageSizeChange(size) {
        this.searchForm.size = size
        this.getRightData()
      }
    }
  }
</script>

<style scoped>
  .temperature {
    height: 100%;
    width: 100%;
  }

  .temperature-top {
    display: inline-block;
    width: 100%;
  }

  .temperature-input {
    width: 150px;
    margin: 0;
    padding: 0;
  }

  #temperature-left {
    float: left;
    height: calc(100% - 80px);
    width: 55%;
    border-right: 1px solid;
    margin-right: 5px;
  }

  #temperature-right {
    float: left;
    height: calc(100% - 80px);
    width: 40%;
  }
</style>
