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
            <el-button type="success" size="mini" @click="exportExcel(bigType)" icon="el-icon-download" circle></el-button>
          </el-tooltip>
        </el-col>
        <el-col :span="7" style="padding: 0">
          <el-input class="limit-input" type="number" v-model="inputModel" size="mini"
                    :placeholder="'当前阈值：' + option.series[0].markLine.data[0].yAxis + ' ℃'">
          </el-input>
          <el-tooltip content="设置阈值" placement="bottom">
            <el-button type="danger" :disabled="disableUpdateLimitBtm(inputModel)" size="mini" @click="updateLimitValue"
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
              :page-size-opts="[15,30,50]"
              show-sizer show-total show-elevator
              size="small">
        </Page>
      </Row>
    </div>
  </div>
</template>

<script>
  import websocketUtil from '../../utils/websocket'
  import {temperatureService, typeService,exportService} from '../../api/service'
  import {common} from '../../utils/common'
  import {mapState} from 'vuex'
  import store from '../../vuex/store'

  export default {
    name: "temperature",
    store,
    data() {
      return {
        loginIsAdmin: JSON.parse(localStorage.getItem('user')).isAdmin,
        bigType: 0,
        leftChart: null,
        MAX_POINT_COUNT: 15,
        inputModel: null,
        option: {
          title: {text: '坝体温度变化情况', x: 'center'},
          tooltip: {},
          toolbox: websocketUtil.toolbox,
          grid: websocketUtil.grid,
          xAxis: {type: 'category', data: [], axisLabel: {interval: 0, rotate: 40}},
          yAxis: {type: 'value', axisLabel: {formatter: '{value} (℃)'}},
          series: [{name: '温度', type: 'line', data: [], markLine: {data: [{name: '阈值线', yAxis: 0,}]}}],
          visualMap: {show: false, pieces: [{gt: 0, lte: 100, color: '#cc0033'}], outOfRange: {color: '#ffde33'}},
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
    computed: mapState(['temperatureRecvData']),
    watch: {
      temperatureRecvData(newVal){
        if (this.option.xAxis.data.length > this.searchForm.size) {
          this.option.xAxis.data.splice(0, 1)
          this.option.series[0].data.splice(0, 1)
        }
        this.option.xAxis.data.push(common.getTime(newVal.time))
        this.option.series[0].data.push(newVal.value)
        this.leftChart.setOption(this.option)
      }
    },
    mounted() {
      this.initChart()
    },
    methods: {
      async initChart() {
        this.leftChart = this.$echarts.init(document.getElementById('left-chart'))
        this.leftChart.showLoading()
        await this.getDefaultData()
        this.leftChart.hideLoading()
        this.leftChart.setOption(this.option)
      },
      async getDefaultData() {
        await this.getRightData()
        await this.getLeftData(this.rightData)
        await this.findByBigTypeAndSubIndex()
      },
      getRightData() {
        return temperatureService.findAll(this.searchForm).then(res => {
          if (res.code === 0) {
            this.rightData = res.obj.list
            this.total = res.obj.total
          }
        })
      },
      getLeftData(list) {
        let newList = list
        if(newList.length < this.MAX_POINT_COUNT){
          for (let i = newList.length;i < this.MAX_POINT_COUNT;i++) {
            newList.push({createTime:new Date(),value: 0})
          }
        }
        for (let i = newList.length - 1; i >= 0; i--) {
          this.option.xAxis.data.push(common.getTime(newList[i].createTime))
          this.option.series[0].data.push(newList[i].value)
        }
      },
      findByBigTypeAndSubIndex() {
        return typeService.findByBigTypeAndSubIndex({bigType: this.bigType,subIndex: 0}).then(res => {
          res.code === 0 ? this.setLimitData(res.obj.limitValue) : null
        })
      },
      updateLimitValue() {
        typeService.updateLimitValue({bigType: this.bigType,subIndex: 0, limitValue: this.inputModel}).then(res => {
          if (res.code === 0) {
            this.setLimitData(Number(this.inputModel))
            this.leftChart.setOption(this.option)
            this.inputModel = null
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
      exportExcel(bigType) {
        exportService.exportExcel(bigType)
      },
      disableUpdateLimitBtm(inputModel){
        return this.loginIsAdmin === 0 ? true : ! inputModel
      }
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

  .limit-input {
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
