<template>
  <div class="home-header">
    <div class="header-btn" @click="collapseChage()">
      <i class="el-icon-menu"></i>
    </div>
    <div class="header-title"><span>尾矿库坝体安全性能检测平台</span></div>
    <div class="header-right">
      <el-dropdown class="header-right-user" size="small" @command="handleCommand">
          <span class="header-right-user-link">
            {{username}} username<i class="el-icon-caret-bottom"></i>
          </span>
        <el-dropdown-menu>
          <el-dropdown-item command="editPassword">修改密码</el-dropdown-item>
          <el-dropdown-item command="exitLogin">退出登录</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>

    <el-dialog title="修改密码" :visible.sync="dialogShow" width="300px">
      <el-form :model="passwordParam" :rules="changeRules" label-width="80px" label-position="right">
        <el-form-item label="原密码：" prop="oldPassword">
          <el-input v-model="passwordParam.oldPassword" placeholder="请输入原密码"/>
        </el-form-item>
        <el-form-item label="新密码：" prop="newPassword">
          <el-input v-model="passwordParam.newPassword" placeholder="请输入新密码"></el-input>
        </el-form-item>
        <el-form-item label="新密码：" prop="againPassword">
          <el-input v-model="passwordParam.againPassword" placeholder="请再次输入密码"/>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm()">确 定</el-button>
          <el-button @click="dialogShow = false">取 消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
  import bus from './bus'
  import {userService} from '../../api/service'
  export default {
    name: "common-header",
    data() {
      const validatePassword = (rule, value, callback) => {
        if (!value) {
          callback(new Error("密码不能为空！"))
        } else if (value.length < 4) {
          callback(new Error("密码长度不得小于4位！"))
        } else {
          callback()
        }
      }
      const validateTemp = (rule, value, callback) => {
        if (value !== this.passwordParam.newPassword) {
          callback(new Error("两个输入密码不一致！"))
        } else {
          callback();
        }
      }
      return {
        collapse: true,
        username: localStorage.getItem('username'),
        dialogShow: false,
        passwordParam: {
          id: localStorage.getItem('userId'),
          oldPassword: '',
          newPassword: '',
          againPassword: '',
        },
        changeRules: {
          oldPassword: [{required: true, validator: validatePassword, trigger: 'blur'}],
          newPassword: [{required: true, validator: validatePassword, trigger: 'blur'}],
          againPassword: [{required: true, validator: validateTemp, trigger: 'blur'}]
        }
      }
    },
    methods: {
      collapseChage() {
        this.collapse = !this.collapse
        bus.$emit("collapse", this.collapse)
      },
      exitLogin() {
        this.$router.push("/login")
        localStorage.clear()
      },
      submitForm() {
        userService.changePassword(this.passwordParam).then(res => {
          if (res.code === 0) {
            this.dialogShow = false
            this.$router.push('/login')
          } else {
            this.passwordParam.newPassword = ''
            this.passwordParam.againPassword = ''
          }
        })
      },
      editPassword() {
        this.passwordParam.oldPassword = ''
        this.passwordParam.newPassword = ''
        this.passwordParam.againPassword = ''
        this.dialogShow = true
      },
      handleCommand(command) {
        command === "exitLogin" ? this.exitLogin() : this.editPassword()
      }
    }
  }
</script>

<style scoped>
  .home-header {
    position: relative;
    background-color: #333333;
    color: #fff;
    width: 100vw;
    height: 50px;
    font-size: 21px;
    line-height: 50px;
    padding: 0;
  }

  .header-btn {
    float: left;
    padding: 0 20px;
    cursor: pointer;
  }

  .header-title {
    float: left;
  }

  .header-right {
    float: right;
    padding-right: 50px;
  }

  .header-right-user {
    color: #fff;
    cursor: pointer;
  }
</style>

