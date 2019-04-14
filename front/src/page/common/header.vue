<template>
  <div class="home-header">
    <div class="header-btn" @click="collapseChage()">
      <i class="el-icon-menu"></i>
    </div>
    <div class="header-title"><span>尾矿库坝体安全性能检测平台</span></div>
    <div class="header-right">
      <el-dropdown class="header-right-user" size="mini" @command="handleCommand()">
          <span class="header-right-user-link">
            {{username}}<i class="el-icon-caret-bottom"></i>
          </span>
        <el-dropdown-menu>
          <el-dropdown-item command="editPassword">修改密码</el-dropdown-item>
          <el-dropdown-item command="exitLogin">退出登录</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>

<!--    <el-dialog title="修改密码" :visible.sync="dialogShow" width="400px" >-->
<!--      <el-form :model="passwordParam"  label-width="80px" label-position="right">-->
<!--        <el-form-item label="原密码：">-->
<!--          <el-input v-model="passwordParam.oldPassword" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="新密码：">-->
<!--          <el-input v-model="passwordParam.newPassword" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="新密码：">-->
<!--          <el-input v-model="tempPassword" />-->
<!--        </el-form-item>-->
<!--        <el-form-item >-->
<!--          <el-button type="primary" @click="submitForm()">确 定</el-button>-->
<!--          <el-button @click="dialogShow = false">取 消</el-button>-->
<!--        </el-form-item>-->
<!--      </el-form>-->
<!--      :rules="changeRules"-->
<!--      <div slot="footer" class="dialog-footer">-->
<!--        <el-button type="primary" @click="submitForm">确 定</el-button> -->
<!--        <el-button @click="dialogShow = false">取 消</el-button>-->
<!--      </div>-->
<!--    </el-dialog>-->
  </div>
</template>

<script>
  import bus from './bus'
  import {userService} from '../../api/service'

  export default {
    name: "common-header",
    data() {
      // const validatePassword = (rule, value, callback) => {
      //   debugger
      //   if (!value) {
      //     callback(new Error("密码不能为空！"))
      //   } else if (value.length < 4) {
      //     callback(new Error("密码长度不得小于4位！"))
      //   } else {
      //     callback()
      //   }
      // }
      // const validateTemp = (rule, value, callback) => {
      //   if (!value) {
      //     callback(new Error("请再次输入密码！"))
      //   } else if (value != this.passwordParam.newPassword) {
      //     callback(new Error("两个输入密码不一致！"))
      //   } else {
      //     callback();
      //   }
      // }
      return {
        collapse: true,
        username: localStorage.getItem('username'),
        dialogShow: false,
        tempPassword: '',
        passwordParam: {
          id: localStorage.getItem('userId'),
          oldPassword: '',
          newPassword: '',
        },
        // changeRules: {
        //   oldPassword: [{required: true, validator: validatePassword, trigger: 'blur'}],
        //   newPassword: [{required: true, validator: validatePassword, trigger: 'blur'}],
        //   tempPassword: [{required: true, validator: validateTemp, trigger: 'blur'}]
        // }
      }
    },
    created(){
      debugger
      console.log(this)
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
          debugger
          if (res.code === 0) {
            this.dialogShow = false
            this.$Massage.success(res.msg)
            this.$router.push('/login')
          } else {
            this.$Massage.error(res.msg)
            this.passwordParam.newPassword = ''
            this.tempPassword = ''
          }
        })
      },
      editPassword() {
        debugger
        console.log(this)
        this.passwordParam.oldPassword = ''
        this.passwordParam.newPassword = ''
        this.tempPassword = ''
        this.dialogShow = true
      },
      handleCommand(command) {
        debugger
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

