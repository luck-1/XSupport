<template>
    <div class="all">
      <v-header />
      <v-sidebar />
      <vTag />
    </div>
</template>

<script>
  import vHeader from './header'
  import vSidebar from './sidebar'
  import vTag from './tag'
  export default {
    name: "home",
    components: {vHeader,vSidebar,vTag}
  }
</script>

<style scoped>

</style>
