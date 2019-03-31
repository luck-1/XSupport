<template>
  <div class="header">
    <div class="header-btn" @click="collapseChage">
      <i class="el-icon-menu"></i>
    </div>
    <div class="header-title"><span>尾矿库坝体安全性能检测平台</span></div>
    <div class="header-right">
      <el-dropdown class="header-right-user">
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
        bus.$emit("collapse",this.collapse)
      }
    }
  }
</script>

<style scoped>
  .header {
    position: relative;
    background-color: #333333;
    box-sizing: border-box;
    color: #fff;
    height: 50px;
    width: 100%;
    font-size: 21px;
    line-height: 50px;
    margin: 0px;
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

  .header-right-user-link {
    color: #fff;
    cursor: pointer;
  }
</style>
