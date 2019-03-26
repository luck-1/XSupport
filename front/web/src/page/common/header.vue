<template>
  <div class="header">
    <div class="icon">
      <i class="icon iconfont icon-gerenxinxierweima"></i>
    </div>
    <div class="title">
      <span>TITLE</span>
    </div>

    <div class="right">
      <div class="user">user</div>
    </div>
  </div>
</template>

<script>
  export default {
    name: "common-header",
  }
</script>

<style scoped>
.header {
  display: flex;
  flex-direction: row;
  flex-wrap: nowrap;
  font-size: 20px;
  background-color: black;
  color: aliceblue;
  height: 60px;
}
</style>
