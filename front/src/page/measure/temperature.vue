<template>
  <div class="all">
    <div class="left">
      <div id="left-chart"></div>
    </div>
    <div class="right">
      <el-row :gutter="20">
        <el-col :span="17">
          <el-tooltip content="刷新" placement="bottom">
            <el-button type="primary" size="mini" @click="getRightData" icon="el-icon-refresh" circle></el-button>
          </el-tooltip>
          <el-tooltip content="导出" placement="bottom">
            <el-button type="success" size="mini" @click="exportExcel" icon="el-icon-download" circle></el-button>
          </el-tooltip>
        </el-col>
        <el-col :span="7" style="padding: 0">
          <el-input class="temperature-input" type="number" v-model="LIMIT_VALUE" size="mini"
                    :placeholder="'当前阈值：' + option.series[0].markLine.data[0].yAxis + '℃'">
          </el-input>
          <el-tooltip content="设置阈值" placement="bottom">
            <el-button type="danger" :disabled="! LIMIT_VALUE" size="mini" @click="setLimitValue"
                       icon="el-icon-edit"></el-button>
          </el-tooltip>
        </el-col>
      </el-row>
      <Row class="right-table">
        <el-table border size="small" :data="rightData" height="calc(100vh - 185px)">
          <el-table-column align="center" type="index" label="序号" width="70"></el-table-column>
          <el-table-column align="center" label="记录时间" width="200" sortable prop="createTime"></el-table-column>
          <el-table-column align="center" label="温度值" width="125" prop="value">
            <template slot-scope="{row}">
              {{row.value}} ℃
            </template>
          </el-table-column>
          <el-table-column align="center" label="阈值" width="125" prop="limitValue">
            <template slot-scope="{row}">
              {{row.limitValue}} ℃
            </template>
          </el-table-column>
          <el-table-column align="center" label="状态" width="150" prop="state"
                           :filters="[{text: '正常', value: 0 },{text: '异常', value: 1 }]" :filter-multiple="false"
                           :filter-method="(value,row) => row.state === value ? 0 : 1" filter-placement="bottom-start">
            <template slot-scope="{row}">
              <el-tag :type="row.state === 1 ? 'danger' : ''" class="tag-min">
                {{row.state === 0 ? '正常' : '异常'}}
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
              :page-size-opts="[15,30,45]"
              show-sizer show-total show-elevator
              size="small">
        </Page>
      </Row>
    </div>
  </div>
</template>

<script>
  import websocketUtil from '../../utils/websocket'
  import {temperatureService, limitValueService} from '../../api/service'

  export default {
    name: "temperature",
    data() {
      return {
        webSocket: new WebSocket(websocketUtil.webSocketUrl),
        leftChart: null,
        MAX_POINT_COUNT: 15,
        LIMIT_VALUE: null,
        option: {
          title: {text: '坝体温度变化情况', x: 'center'},
          tooltip: {},
          toolbox: websocketUtil.toolbox,
          grid: websocketUtil.grid,
          xAxis: {type: 'category', data: [], axisLabel: {interval: 0, rotate: 40}},
          yAxis: {type: 'value', name: '温度（ ℃）'},
          series: [{name: '温度', type: 'line', data: [], markLine: {data: [{name: '阈值线', yAxis: 0,}]}}],
          visualMap: {show: false, pieces: [{gt: 0, lte: 1000, color: '#cc0033'}], outOfRange: {color: '#ffde33'}},
        },
        rightData: [],
        total: 0,
        searchForm: {
          page: 1,
          size: 15
        },
        disableSetLimitBtn: true
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
          if (this.option.xAxis.data.length > this.searchForm.size) {
            this.option.xAxis.data.splice(0, 1)
            this.option.series[0].data.splice(0, 1)
          }
          this.option.xAxis.data.push(this.getTime(res.time))
          this.option.series[0].data.push(res.value)
          this.leftChart.setOption(this.option)
        }
      },
      initChart() {
        this.leftChart = this.$echarts.init(document.getElementById('left-chart'))
        //加载动画
        this.leftChart.showLoading()
        //数据加载
        this.getDefaultData()
        //关闭加载动画
        this.leftChart.hideLoading()
        this.leftChart.setOption(this.option)
      },
      getDefaultData() {
        this.getLimitValue()
        this.getRightData()
        this.getLeftData(this.rightData)
      },
      getRightData() {
        temperatureService.findAll(this.searchForm).then(res => {
          if (res.code === 0) {
            this.rightData = res.obj.list
            this.total = res.obj.total
          }
        })
      },
      getLeftData(list) {
        list.forEach(item => {
          this.option.xAxis.data.push(this.getTime(item.createTime))
          this.option.series[0].data.push(item.value)
        })
      },
      getTime(dateTime) {
        let time = new Date(dateTime)
        let hours = time.getHours() < 10 ? '0' + time.getHours() : time.getHours()
        let minutes = time.getMinutes() < 10 ? '0' + time.getMinutes() : time.getMinutes()
        let seconds = time.getSeconds() < 10 ? '0' + time.getSeconds() : time.getSeconds()
        return hours + ':' + minutes + ':' + seconds
      },
      getLimitValue() {
        limitValueService.getLimitValue({id: '0'}).then(res => res.code === 0 ? this.setLimitData(res.obj.limitValue) : null)
      },
      setLimitValue() {
        limitValueService.setLimitValue({id: '0', limitValue: this.LIMIT_VALUE}).then(res => {
          if (res.code === 0) {
            this.setLimitData(Number(this.LIMIT_VALUE))
            this.leftChart.setOption(this.option)
            this.LIMIT_VALUE = null
          }
        })
      },
      setLimitData(limitValue) {
        this.option.series[0].markLine.data[0].yAxis = limitValue
        this.option.visualMap.pieces[0].gt = limitValue
      },
      pageChange(page) {
        this.searchForm.page = page
        this.getRightData()
      },
      pageSizeChange(size) {
        this.searchForm.size = size
        this.getRightData()
      },
      exportExcel() {

      },
    }
  }
</script>

<style scoped>
  .left {
    width: 59%;
  }

  .right {
    width: 41%;
  }

  .temperature-input {
    width: 150px;
    margin: 0;
    padding: 0;
  }

  #left-chart {
    height: calc(100vh - 185px);
    width: 100%;
  }

  .right-table {
    padding-top: 5px;
  }
</style>
