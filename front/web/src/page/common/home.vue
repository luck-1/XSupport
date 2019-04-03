<template>
  <div class="home">
    <v-header/>
    <v-sidebar/>
    <div class="content-box" :class="{'content-collapse': collapse}">
      <v-tag/>
      <div class="content">
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
        collapse: null
      }
    },
    components: {vHeader, vSidebar, vTag},
    created() {
      bus.$on("collapse", headerCollapse => {
        this.collapse = headerCollapse;
      })
    }
  }
</script>

<style scoped>
  .content-box {
    position: absolute;
    left: 200px;
    right: 0;
    top: 50px;
    bottom: 0;
  }

  .content {
    position: relative;
    padding: 40px 10px 10px 10px;
    width: auto;
    background-color: aquamarine;
    overflow: auto;
  }

  .content-collapse {
    left: 65px;
  }
</style>
