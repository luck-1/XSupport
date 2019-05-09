<template>
  <Card>
    <Row>
      <el-col :span="17">
        <el-tooltip content="刷新" placement="bottom">
          <el-button type="primary" size="mini" @click="findAll" icon="el-icon-refresh" circle></el-button>
        </el-tooltip>
        <el-tooltip content="导出" placement="bottom">
          <el-button type="success" size="" @click="exportExcel(-1)" icon="el-icon-download" circle></el-button>
        </el-tooltip>
      </el-col>
      <el-table border size="small" :data="warnData" hit height="calc(100vh - 220px)">
        <el-table-column align="center" type="index" label="序号" width="55"></el-table-column>
        <el-table-column align="center" label="异常时间" sortable width="150" prop="createTime"></el-table-column>
        <el-table-column align="center" label="更改时间" sortable width="150" prop="updateTime"></el-table-column>
        <el-table-column align="center" label="操作人" sortable width="120" prop="optionUser"></el-table-column>
        <el-table-column align="center" label="异常类型" width="120" prop="exceptionLocation"
                         :filters="[{text: '温度异常', value: 0 },{text: '湿度异常', value: 1 }, { text: '浸润异常', value: 2 },{text: '金气异常', value: 3}]"
                         :filter-method="(value,row) => row.exceptionLocation === value" filter-placement="bottom-start"
                         :filter-multiple="true">
          <template slot-scope="{row}">
            <el-tag type="info">
              <span v-if="row.exceptionLocation === 0">温度异常</span>
              <span v-else-if="row.exceptionLocation === 1">湿度异常</span>
              <span v-else-if="row.exceptionLocation === 2">浸润异常</span>
              <span v-else-if="row.exceptionLocation === 3">金气异常</span>
              <span v-else-if="row.exceptionLocation === 4">金气异常</span>
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column align="center" label="异常描述" width="200" prop="exceptionDescription"></el-table-column>
        <el-table-column align="center" label="异常值" width="120" prop="exceptionValue"></el-table-column>
        <el-table-column align="center" label="阈值" width="120" prop="limitValue"></el-table-column>
        <el-table-column align="center" label="异常状态" width="120" prop="exceptionState"
                         :filters="[{text: '未处理', value: 0 },{text: '正在处理', value: 1 }, { text: '已处理', value: 2 }]"
                         :filter-method="(value,row) => row.exceptionState === value" filter-placement="bottom-start"
                         :filter-multiple="true">
          <template slot-scope="{row}">
            <el-tag v-if="row.exceptionState === 0" type="danger" class="tag-min"><span>未处理</span></el-tag>
            <el-tag v-else-if="row.exceptionState === 1" type="warning" class="tag-min"><span>正在处理</span></el-tag>
            <el-tag v-else-if="row.exceptionState === 2" type="info" class="tag-min"><span>已处理</span></el-tag>
          </template>
        </el-table-column>
        <el-table-column align="center" label="备注" width="300" prop="remark"></el-table-column>
        <el-table-column align="center" label="修改状态" fixed="right" width="150">
          <template slot-scope="{row}">
            <el-tooltip content="未处理" placement="top">
              <Button @click="changeState(row,0)" icon="md-create" type="error" size="small"
                      :disabled="isDisable(row,0)"></Button>
            </el-tooltip>
            <el-tooltip content="正在处理" placement="top">
              <Button @click="changeState(row,1)" icon="md-create" type="warning" size="small"
                      :disabled="isDisable(row,1)"></Button>
            </el-tooltip>
            <el-tooltip content="已处理" placement="top">
              <Button @click="changeState(row,2)" icon="md-create" type="success" size="small"
                      :disabled="isDisable(row,2)"></Button>
            </el-tooltip>
          </template>
        </el-table-column>
      </el-table>
    </Row>
    <Row type="flex" justify="center" class="page">
      <Page :current="searchForm.page" :total="pageTotal" :page-size="searchForm.size"
            @on-change="pageChange" @on-page-size-change="pageSizeChange" :page-size-opts="[15,30,50]"
            show-sizer show-total show-elevator size="small">
      </Page>
    </Row>
  </Card>
</template>

<script>
  import {systemService, exportService} from '../../api/service'

  export default {
    name: "system",
    data() {
      return {
        warnData: [],
        pageTotal: null,
        loginUserId: JSON.parse(localStorage.getItem("user")).id,
        searchForm: {
          page: 1,
          size: 15
        },
      }
    },
    mounted() {
      this.findAll()
    },
    methods: {
      findAll() {
        systemService.findAll(this.searchForm).then(res => {
          if (res.code === 0) {
            this.warnData = res.obj.list
            this.pageTotal = res.obj.total
          }
        })
      },
      changeState(row, state) {
        debugger
        systemService.changeState({id: row.id, state: state, userId: this.loginUserId}).then(() => this.findAll())
      },
      isDisable(row, value) {
        return row.exceptionState === value
      },
      pageChange(page) {
        this.searchForm.page = page
        this.findAll()
      },
      pageSizeChange(size) {
        this.searchForm.size = size
        this.findAll()
      },
      exportExcel(bigType) {
        exportService.exportExcel(bigType)
      },
    }
  }
</script>

<style scoped>
</style>
