<template>
  <div class="tag">
    tag
<!--    <ul>-->
<!--      <li class="tags-li" v-for="(item,index) in tag" :class="{'active': isActive(item.path)}" :key="index">-->
<!--        <router-link :to="item.path" class="tags-li-title">{{item.title}}</router-link>-->
<!--        <span class="tags-li-icon" @click="closeTags(index)"><i class="el-icon-close"></i></span>-->
<!--      </li>-->
<!--    </ul>-->
  </div>
</template>

<script>
  export default {
    name: "tag",
    data() {
      return{
        tag:[]
      }
    }
  }
</script>

<style scoped>
.tag{
  background-color: #aaaaaa;
  /*position: fixed;float: left;*/
  /*overflow: hidden;*/
  /*background: #;*/
}
</style>
