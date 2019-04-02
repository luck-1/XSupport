<template>
  <el-container class="all">
    <el-header class="home-header">
      <v-header/>
    </el-header>
    <el-aside>
      <v-sidebar/>
    </el-aside>
    <el-main>
<!--      <vTag/>-->
    </el-main>
    <el-footer></el-footer>
  </el-container>
</template>

<script>
  import vHeader from './header'
  import vSidebar from './sidebar'
  import vTag from './tag'

  export default {
    name: "home",
    components: {vHeader, vSidebar, vTag}
  }
</script>

<style scoped>
  .home-header {
    margin: 0;
    padding: 0;
  }
</style>
