<template>
  <div class="home">
    <v-header/>
    <v-sidebar/>
    <div class="content-box" :style="{left: (collapse ? 65 : 200) + 'px' }" >
      <v-tag/>
      <div class="content">
        <keep-alive>
          <router-view v-if="$route.meta.keepAlive"></router-view>
        </keep-alive>
        <router-view v-if="! $route.meta.keepAlive"></router-view>
      </div>
    </div>
  </div>
</template>

<script>
  import vHeader from './header'
  import vSidebar from './sidebar'
  import vTag from './tag'
  import bus from './bus'

  export default {
    name: "home",
    data() {
      return {
        collapse: false
      }
    },
    components: {vHeader, vSidebar, vTag},
    created() {
      bus.$on("collapse", headerCollapse => { this.collapse = headerCollapse; })
    }
  }
</script>

<style scoped>
  .content-box {
    position: absolute;
    left: 200px;
    top: 50px;
    right: 0;
    bottom: 0;
  }

  .content {
    position: relative;
    padding: 40px 10px 10px 10px;
    width: auto;
    height: 100%;
    background-color: #fff;
    overflow: auto;
  }
</style>
