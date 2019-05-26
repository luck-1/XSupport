<template>
  <Card>
    <Form :model="searchForm" inline :label-width="70">
      <FormItem label="姓名:" prop="name">
        <Input v-model="searchForm.name" clearable placeholder="请输入用户名" style="width: 200px"/>
      </FormItem>
      <FormItem label="联系电话:" prop="phone">
        <label>
          <Input v-model="searchForm.phone" clearable placeholder="请输入用户电话" style="width: 200px"/>
        </label>
      </FormItem>
      <FormItem>
        <el-button @click="findByCondition" type="primary" icon="el-icon-search">搜索</el-button>
      </FormItem>
    </Form>

    <Button @click="showDialog(true)" type="primary" icon="md-add" :disabled="loginIsAdmin === 0">添加用户</Button>
    <Button @click="deleteList" type="error" icon="md-trash" :disabled="loginIsAdmin ===0">批量删除</Button>

    <Row>
      <el-table border size="small" :data="userList" height="calc(100vh - 265px)" loading
                @selection-change="showSelect">
        <el-table-column align="center" type="selection" width="40"></el-table-column>
        <el-table-column align="center" type="index" label="序号" width="55"></el-table-column>
        <el-table-column align="center" label="用户名" sortable width="150" prop="username"></el-table-column>
        <el-table-column align="center" label="姓名" width="100" prop="name"></el-table-column>
        <el-table-column align="center" label="创建时间" sortable width="200" prop="createTime"></el-table-column>
        <el-table-column align="center" label="年龄" sortable width="130" prop="age">
          <template slot-scope="{row}">
            {{row.age}} 岁
          </template>
        </el-table-column>
        <el-table-column align="center" label="性别" width="50" prop="sex">
          <template slot-scope="{row}">
            {{row.sex ? '女' : '男'}}
          </template>
        </el-table-column>
        <el-table-column align="center" label="手机号码" width="150" prop="phone"></el-table-column>
        <el-table-column align="center" label="地址" width="200" prop="address"></el-table-column>
        <el-table-column align="center" label="用户类型" width="100" prop="isAdmin"
                         :filters="[{text: '普通用户', value: 0 },{text: '管理员', value: 1 }]" :filter-multiple="false"
                         :filter-method="(value,row) => row.isAdmin === value" filter-placement="bottom-start">
          <template slot-scope="{row}">
            <el-tag :type="row.isAdmin ? 'success' : 'info'" class="tag-min">
              {{row.isAdmin ? '管理员' : '普通用户'}}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column align="center" label="用户状态" width="150" prop="isForbidden"
                         :filters="[{text: '正常启用', value: false },{text: '已禁用', value: true }]" :filter-multiple="false"
                         :filter-method="(value,row) => row.isForbidden === value" filter-placement="bottom-start">
          <template slot-scope="{row}">
            <el-tag :type="row.isForbidden ? 'danger' : ''" class="tag-min">
              {{row.isForbidden ? '已禁用' : '正常启用'}}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column align="center" label="备注" width="300" prop="remark"></el-table-column>
        <el-table-column align="center" label="操作" fixed="right" width="150">
          <template slot-scope="{row}">
            <el-tooltip :content="row.isForbidden ? '启用' : '禁用'" placement="top">
              <Button :icon="row.isForbidden ? 'md-key' : 'ios-unlock-outline'"
                      :type="row.isForbidden ? 'success' : 'warning'"
                      :disabled="optionBtnIsDisabled(row)"
                      @click="changeForbiddenState(row)"
                      size="small"></Button>
            </el-tooltip>
            <el-tooltip content="编辑" placement="top">
              <Button @click="showDialog(false,row)" icon="md-create" type="primary"
                      :disabled="optionBtnIsDisabled(row)"
                      size="small"></Button>
            </el-tooltip>
            <el-tooltip content="删除" placement="top">
              <Button @click="deleteOne(row)" icon="md-trash" type="error" :disabled="optionBtnIsDisabled(row)"
                      size="small"></Button>
            </el-tooltip>
          </template>
        </el-table-column>
      </el-table>
    </Row>
    <Row type="flex" justify="center" class="page">
      <Page :current="searchForm.page"
            :total="pageTotal"
            :page-size="searchForm.size"
            @on-change="pageChange"
            @on-page-size-change="pageSizeChange"
            :page-size-opts="[15,30,50]"
            show-sizer show-total show-elevator
            size="small">
      </Page>
    </Row>
    <!--    新增 / 修改用户-->
    <Modal :title="dialogTitle" v-model="dialogShow" :width="600">
      <Form ref="userForm" :model="userInfo" :rules="userRules" :label-width="70">
        <el-row :gutter="20">
          <el-col :span="12">
            <FormItem label="用户名" prop="username">
              <Input v-model="userInfo.username" placeholder="请输入" clearable/>
            </FormItem>
            <FormItem label="密码" prop="password">
              <Input v-model="userInfo.password" type="password" placeholder="请输入" clearable/>
            </FormItem>
            <FormItem label="年龄" prop="age">
              <Input v-model="userInfo.age" placeholder="请输入" clearable/>
            </FormItem>
            <FormItem label="用户类型" prop="isAdmin">
              <Select v-model="userInfo.isAdmin" placeholder="请选择" clearable>
                <Option value="0" selected>普通用户</Option>
                <Option value="1">管理员</Option>
              </Select>
            </FormItem>
            <FormItem label="用户地址" prop="address">
              <Input v-model="userInfo.address" placeholder="请输入" clearable/>
            </FormItem>
          </el-col>
          <el-col :span="12">
            <FormItem label="姓名" prop="name">
              <Input v-model="userInfo.name" placeholder="请输入" clearable/>
            </FormItem>
            <FormItem label="确认密码" prop="password">
              <Input v-model="userInfo.againPassword" type="password" show-passwor placeholder="请输入" clearable/>
            </FormItem>
            <FormItem label="性别" prop="sex">
              <RadioGroup v-model="userInfo.sex">
                <Radio label="0">男</Radio>
                <Radio label="1">女</Radio>
              </RadioGroup>
            </FormItem>
            <FormItem label="手机号码" prop="phone">
              <Input v-model="userInfo.phone" type="tel" placeholder="请输入" clearable/>
            </FormItem>
            <FormItem label="备注" prop="remark">
              <Input v-model="userInfo.remark" placeholder="请输入" clearable/>
            </FormItem>
          </el-col>
        </el-row>
      </Form>
      <div slot="footer">
        <Button @click="dialogShow = false">取消</Button>
        <Button type="primary" @click="saveInfo">保存</Button>
      </div>
    </Modal>
  </Card>
</template>

<script>
  import {userService} from "../../api/service";

  export default {
    name: "user",
    data() {
      const validatePassword = (rule, value, callback) => {
        if (!value) {
          callback(new Error("密码不能为空！"))
        } else if (value.length < 6) {
          callback(new Error("密码长度不得小于 6 位！"))
        } else {
          callback()
        }
      }
      const validateAgainPassword = (rule, value, callback) => {
        if(! value){
          callback(new Error("密码不能为空！"))
        }else if(value !== this.userInfo.password) {
          callback(new Error("两个输入密码不一致！"))
        } else {
          callback();
        }
      }
      const validatePhone = (rule, value, callback) => {
        let reg = /^[1][3,4,5,7,8][0-9]{9}$/;
        if (value === "" || value === null || value === undefined) {
          callback(new Error("手机号码不能为空"));
        } else if (!reg.test(value)) {
          callback(new Error("手机号码格式错误"));
        } else {
          callback();
        }
      }

      return {
        dialogShow: false,
        dialogTitle: null,
        selectList: [],
        pageTotal: 0,
        userList: [],
        loginIsAdmin: JSON.parse(localStorage.getItem('user')).isAdmin,
        loginUserId: JSON.parse(localStorage.getItem('user')).id,
        userInfo: {
          id: null,
          username: null,
          password: null,
          againPassword: null,
          isAdmin: null,
          name: null,
          sex: null,
          age: null,
          address: null,
          phone: null,
          remark: null
        },
        searchForm: {
          name: null,
          phone: null,
          page: 1,
          size: 15
        },
        userRules: {
          username: [{required: true, trigger: 'blur', message: '用户名不能为空'}],
          password: [{required: true, trigger: 'blur', validator: validatePassword}],
          againPassword: [{required: true, trigger: 'blur', validator: validateAgainPassword}],
          phone: [{ required: true, validator: validatePhone, trigger: "blur" }],
          isAdmin: [{required: true, trigger: 'blur', message: '用户类型不能为空'}],
          name: [{required: true, trigger: 'blur', message: '姓名不能为空'}],
          sex: [{required: true, trigger: 'blur', message: '性别不能为空'}],
          age: [{required: true, trigger: 'blur', message: '年龄不能为空'}],
          address: [{required: true, trigger: 'blur', message: '地点不能为空'}]
        }
      }
    },
    mounted() {
      this.findByCondition()
    },
    methods: {
      findByCondition() {
        userService.findByCondition(this.searchForm).then(res => {
          if (res.code === 0) {
            this.userList = res.obj.list
            this.pageTotal = res.obj.total
          }
        })
      },
      showDialog(isAdd, user) {
        if (isAdd) {
          this.dialogTitle = '添加用户'
        } else {
          this.dialogTitle = '修改用户'
          this.userInfo = user
        }
        this.dialogShow = true
      },
      changeForbiddenState(user) {
        userService.changeForbiddenState({id: user.id}).then(() => this.findByCondition())
      },
      saveInfo() {
        this.$refs.userForm.validate(valid => {
          if (valid) {
            debugger
            userService.saveInfo(this.userInfo).then(res => this.dialogShow = (res.code !== 0))
            this.findByCondition()
          }
        })
      },
      deleteOne(user) {
        userService.deleteOne({id: user.id}).then(() => this.findByCondition())
      },
      deleteList() {
        if (this.selectList.length === 0) {
          this.$message.warning("未选择任何数据")
        } else {
          let idList = []
          this.selectList.forEach(user => idList.push(user.id))
          userService.deleteList(idList).then(() => this.findByCondition())
        }
      },
      showSelect(selectList) {
        this.selectList = selectList
      },
      optionBtnIsDisabled(row) {
        return this.loginIsAdmin === 1 ? false : (row.id !== this.loginUserId)
      },
      pageChange(page) {
        this.searchForm.pageNum = page
        this.findByCondition()
      },
      pageSizeChange(size) {
        this.searchForm.pageSize = size
        this.findByCondition()
      }
    }
  }
</script>

<style scoped>

</style>
