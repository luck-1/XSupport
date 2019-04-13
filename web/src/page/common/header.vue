<template>
  <div class="home-header">
    <div class="header-btn" @click="collapseChage">
      <i class="el-icon-menu"></i>
    </div>
    <div class="header-title"><span>尾矿库坝体安全性能检测平台</span></div>
    <div class="header-right">
      <el-dropdown class="header-right-user" size="mini" @command="handleCommand">
          <span class="header-right-user-link">
            username<i class="el-icon-caret-bottom"></i>
          </span>
        <el-dropdown-menu>
          <el-dropdown-item command="editPassword">修改密码</el-dropdown-item>
          <el-dropdown-item command="exitLogin">退出登录</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>
  </div>
</template>

<script>
  import bus from './bus'

  export default {
    name: "common-header",
    data() {
      return {
        collapse: false
      }
    },
    methods: {
      collapseChage() {
        this.collapse = !this.collapse
        bus.$emit("collapse", this.collapse)
      },
      exitLogin() {
        this.$router.push("/login")
      },
      editPassword(){

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
