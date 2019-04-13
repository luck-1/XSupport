<template>
  <el-menu :router="true"
           :collapse-transition="false"
           :default-active="$route.fullPath"
           class="sidebar-menu"
           background-color="#555"
           text-color="#fff"
           :collapse="collapse">
    <template v-for="item in menuList">
      <template v-if="item.subs">
        <el-submenu :index="item.path">
          <template slot="title">
            <i :class="item.icon"/><span slot="title">{{item.title}}</span>
          </template>
          <el-menu-item v-for="(subItem,subIndex) in item.subs" :key="subIndex" :index="subItem.path">
            <i :class="subItem.icon"/><span slot="title">{{ subItem.title }}</span>
          </el-menu-item>
        </el-submenu>
      </template>
      <template v-else>
        <el-menu-item :index="item.path" :key="item.path">
          <i :class="item.icon"/><span slot="title">{{ item.title }}</span>
        </el-menu-item>
      </template>
    </template>
  </el-menu>
</template>

<script>
  import bus from "./bus"

  export default {
    data() {
      return {
        collapse: false,
        menuList: [
          {title: "用户管理", icon: "iconfont icon-yonghu", path: "/user", subs: null},
          {title: "视频监控", icon: "icon iconfont icon-video", path: "/monitor", subs: null},
          {title: "地图监测", icon: "iconfont icon-ditu", path: "/rimArea", subs: null},
          {
            title: "测量中心", icon: "iconfont icon-measure", path: '',
            subs: [
              {title: "温度测量", icon: "iconfont icon-wendu", path: "/measure/temperature"},
              {title: "湿度测量", icon: "iconfont icon-shidu", path: "/measure/humidity"},
              {title: "浸润测量", icon: "iconfont icon-jinrunxian", path: "/measure/soak"},
              {title: "金气测量", icon: "iconfont icon-youduqiti", path: "/measure/gas"}
            ]
          },
          {title: "系统管理", icon: "iconfont icon-yichang", path: "/system", subs: null}
        ]
      }
    },
    methods: {},
    created() {
      bus.$on("collapse", headerCollapse => {
        this.collapse = headerCollapse;
      })
    }
  }
</script>

<style scoped>
  .sidebar-menu:not(.el-menu--collapse) {
    width: 200px;
  }

  .sidebar-menu {
    height: 100%;
    overflow: auto;
  }

  i {
    color: #fff;
    font-size: 18px;
    margin-right: 10px;
    vertical-align: middle;
  }
</style>
