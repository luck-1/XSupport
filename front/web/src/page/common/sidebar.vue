<template>
  <div class="sidebar">
    <el-menu default-active="2" class="sidebar-menu" :collapse="collapse">
      <el-submenu index="1">
        <template slot="title">
          <i class="el-icon-location"></i>
          <span slot="title">导航一</span>
        </template>
          <el-menu-item index="1-1">选项1</el-menu-item>
          <el-menu-item index="1-2">选项2</el-menu-item>
          <el-menu-item index="1-3">选项3</el-menu-item>
      </el-submenu>
      <el-menu-item index="2">
        <i class="el-icon-menu"></i>
        <span slot="title">导航二</span>
      </el-menu-item>
      <el-menu-item index="3">
        <i class="el-icon-document"></i>
        <span slot="title">导航三</span>
      </el-menu-item>
      <el-menu-item index="4">
        <i class="el-icon-setting"></i>
        <span slot="title">导航四</span>
      </el-menu-item>
    </el-menu>
  </div>
</template>

<script>
  import bus from './bus'
  export default {
    data() {
      return {
        collapse: false
      }
    },
    methods: {
    },
    created() {
      bus.$on('collapse',headerCollapse => {
        this.collapse = headerCollapse;
      })
    }
  }
</script>

<style scoped>
  .sidebar {
    background-color: #808080;
    height: 100vh;
    overflow-y: auto;
    position: absolute;
    left: 0;
    top: 50px;
    bottom: 0;
    color: #fff;
  }
  .sidebar-menu:not(.el-menu--collapse) {
    width: 200px;
    background-color: #777;
  }
  .sidebar > ul{
    height: 100%;
    overflow: auto;
  }
  a {
    color: #fff;
  }
</style>
