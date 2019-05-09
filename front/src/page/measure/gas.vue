<template>
  <div class="gas">
    <div class="left">
      <el-row :gutter="20">
        <el-col :span="16">
          <el-tooltip content="导出" placement="bottom">
            <el-button type="success" size="mini" @click="exportExcel(leftBigType)" icon="el-icon-download" circle></el-button>
          </el-tooltip>
        </el-col>
        <el-col :span="8">
          <el-input :placeholder="'当前阈值:' + LIMIT_VALUE_LEFT_COLUMN" size="mini" v-model="leftInputModel"
                    class="input-with-select" style="width: 200px">
            <el-select v-model="leftSubIndex" size="mini" slot="prepend" style="width: 80px"
                       @change="findByBigTypeAndSubIndex(leftBigType,leftSubIndex)">
              <el-option v-for="(item,index) in leftOption.series[0].data" :key="index" :label="item.name"
                         :value="index"></el-option>
            </el-select>
          </el-input>
          <el-tooltip content="设置阈值" placement="bottom">
            <el-button type="danger" :disabled="disableUpdateLimitBtm(leftInputModel)" size="mini" @click="updateLimitValue(leftBigType,leftSubIndex,leftInputModel)"
                       icon="el-icon-edit"></el-button>
          </el-tooltip>
        </el-col>
      </el-row>
      <div id="gas-left"></div>
    </div>
    <div class="right">
      <el-row :gutter="20">
        <el-col :span="16">
          <el-tooltip content="导出" placement="bottom">
            <el-button type="success" size="mini" @click="exportExcel(rightBigType)" icon="el-icon-download" circle></el-button>
          </el-tooltip>
        </el-col>
        <el-col :span="8">
          <el-input :placeholder="'当前阈值:' + LIMIT_VALUE_RIGHT_COLUMN" size="mini" v-model="rightInputModel"
                    class="input-with-select" style="width: 200px">
            <el-select v-model="rightSubIndex" size="mini" slot="prepend" style="width: 80px"
                       @change="findByBigTypeAndSubIndex(rightBigType,rightSubIndex)">
              <el-option v-for="(item,index) in rightOption.xAxis[0].data" :key="index" :label="item"
                         :value="index"></el-option>
            </el-select>
          </el-input>
          <el-tooltip content="设置阈值" placement="bottom">
            <el-button type="danger" :disabled="disableUpdateLimitBtm(rightInputModel)" size="mini" @click="updateLimitValue(rightBigType,rightSubIndex,rightInputModel)"
                       icon="el-icon-edit"></el-button>
          </el-tooltip>
        </el-col>
      </el-row>
      <div id="gas-right"></div>
    </div>


  </div>
</template>

<script>
  import websocketUtil from '../../utils/websocket'
  import {gasService, typeService,exportService} from '../../api/service'
  import {mapState} from 'vuex'
  import store from '../../vuex/store'

  export default {
    name: "temperature",
    store,
    data() {
      return {
        loginIsAdmin: JSON.parse(localStorage.getItem('user')).isAdmin,
        leftInputModel: null,
        rightInputModel: null,
        LIMIT_VALUE_LEFT_COLUMN: 0,
        LIMIT_VALUE_RIGHT_COLUMN: 0,
        leftSubIndex: 0,
        rightSubIndex: 0,
        leftBigType: 3,
        rightBigType: 4,
        leftChart: null,
        rightChart: null,
        leftOption: {
          title: {text: '坝体有毒有害气体占比检测', x: 'center'},
          tooltip: {trigger: 'item', formatter: "{a} <br/>{b} : {c} ({d}%)"},
          legend: {orient: 'vertical', left: 'left'},
          toolbox: websocketUtil.toolbox,
          grid: websocketUtil.grid,
          series: [
            {
              name: '有毒气体',type: 'pie',radius: '55%',center: ['50%', '60%'],data: [],
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
    computed: mapState(['gasRecvData','metalRecvData']),
    watch: {
      gasRecvData(newVal){
        this.leftOption.series[0].data[newVal.subIndex].value = newVal.value
        this.leftChart.setOption(this.leftOption)
      },
      metalRecvData(newVal){
        this.rightOption.series[0].data[newVal.subIndex] = newVal.value
        this.rightChart.setOption(this.rightOption)
      }
    },
    mounted() {
      this.initLeftChart()
      this.initRightChart()
    },
    methods: {
      async initLeftChart() {
        this.leftChart = this.$echarts.init(document.getElementById('gas-left'))
        this.leftChart.showLoading()
        await this.getDefaultName(this.leftBigType)
        await this.getDefaultValue(this.leftBigType)
        this.findByBigTypeAndSubIndex(this.leftBigType, this.leftSubIndex)
        this.leftChart.hideLoading()
        this.leftChart.setOption(this.leftOption)
      },
      async initRightChart() {
        this.rightChart = this.$echarts.init(document.getElementById('gas-right'))
        this.rightChart.showLoading();
        await this.getDefaultName(this.rightBigType)
        await this.getDefaultValue(this.rightBigType)
        this.findByBigTypeAndSubIndex(this.rightBigType, this.rightSubIndex)
        this.rightChart.hideLoading()
        this.rightChart.setOption(this.rightOption)
      },
      async getDefaultName(bigType) {
        await typeService.findTypes({bigType: bigType}).then(res => {
          if (res.code === 0) {
            if (bigType === this.leftBigType) {
              res.obj.forEach(item => this.leftOption.series[0].data.push({name: item.name, value: 0}))
            } else {
              res.obj.forEach(item => this.rightOption.xAxis[0].data.push(item.name))
            }
          }
        })
      },
      async getDefaultValue(bigType) {
        await gasService.findNewestData({bigType: bigType}).then(res => {
          if (res.code === 0) {
            if (bigType === this.leftBigType) {
              res.obj.forEach(item => this.leftOption.series[0].data[item.subIndex].value = item.value)
            } else {
              res.obj.forEach(item => this.rightOption.series[0].data[item.subIndex] = item.value)
            }
          }
        })
      },
      async findByBigTypeAndSubIndex(bigType, subIndex) {
        await typeService.findByBigTypeAndSubIndex({bigType: bigType, subIndex: subIndex}).then(res => {
          if (res.code === 0) {
            bigType === this.leftBigType ? this.LIMIT_VALUE_LEFT_COLUMN = res.obj.limitValue : this.LIMIT_VALUE_RIGHT_COLUMN = res.obj.limitValue
          }
        })
      },
      async updateLimitValue(bigType, subIndex, limitValue) {
        await typeService.updateLimitValue({bigType: bigType, subIndex: subIndex, limitValue: limitValue}).then(res => {
          if (res.code === 0) {
            if(bigType === this.leftBigType ){
              this.LIMIT_VALUE_LEFT_COLUMN = limitValue
              this.leftInputModel = null
            }else {
              this.LIMIT_VALUE_RIGHT_COLUMN = limitValue
              this.rightInputModel = null
            }
          }
        })
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
  .gas {
    height: 100%;
    width: 100%;
  }

  #gas-left {
    height: 100%;
    width: 100%;
  }

  #gas-right {
    height: 100%;
    width: 100%;
  }
</style>

