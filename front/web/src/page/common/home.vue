<template>
    <div class="all">
      <v-header />
      <v-sidebar />
    </div>
</template>

<script>
  import vHeader from './header'
  import vSidebar from './sidebar'
  export default {
    name: "home",
    components: {vHeader,vSidebar,}
  }
</script>

<style scoped>

</style>
