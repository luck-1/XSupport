<template>
  <div class="sidebar">
    <el-menu :default-active="defaultActive"
             class="sidebar-menu"
             background-color="#777"
             text-color="#fff"
             :collapse="collapse">
      <template v-for="item in menu">
        <template v-if="item.subs">
          <el-submenu :index="item.path">
            <template slot="title">
              <i :class="item.icon" /><span slot="title">{{item.title}}</span>
            </template>
            <el-menu-item v-for="(subItem,subIndex) in item.subs" :key="subIndex" :index="subItem.path">
              <i :class="item.icon" /><span slot="title">{{ subItem.title }}</span>
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
  </div>
</template>

<script>
  import bus from './bus'

  export default {
    data() {
      return {
        defaultActive: "2",
        collapse: false,
        menu: [{
          title: "导航一",
          icon: "el-icon-location",
          path: "1",
          subs: [
            {title: "导航一", icon: "el-icon-location", path: "1-1"},
            {title: "导航一", icon: "el-icon-location", path: "1-2"},
            {title: "导航一", icon: "el-icon-location", path: "1-3"}
          ]
        },
          {title: "导航一", icon: "el-icon-location", path: "2"}
        ]
      }
    },
    methods: {},
    created() {
      bus.$on('collapse', headerCollapse => {
        this.collapse = headerCollapse;
      })
    }
  }
</script>

<style scoped>
  .sidebar {
    height: 100vh;
    overflow-y: auto;
    position: absolute;
    top: 50px;
  }

  .sidebar-menu:not(.el-menu--collapse) {
    width: 200px;
  }

  .sidebar > ul {
    height: 100%;
    overflow: auto;
  }
</style>
