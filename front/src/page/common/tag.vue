<template>
  <div class="common-tag" v-if="this.tagList.length > 0" :style="{left: (collapse ? 65 : 200) + 'px'}">
    <el-tag v-for="(tag,index) in tagList" :key="index" :type="tag.path === $route.fullPath ? '' : 'info'"
            class="tag-li" @close="closeTag(index)" @click="$router.push(tag.path)" closable hit>
      {{tag.title}}
    </el-tag>
    <el-button class="tag-button" type="primary" size="mini"
               @click="tagList = tagList.filter(item => item.path === $route.fullPath )">
      <span>关闭其他</span>
    </el-button>
  </div>
</template>splice

<script>
  import bus from './bus'

  export default {
    name: "tag",
    data() {
      return {
        collapse: false,
        tagList: []
      }
    },
    watch: {
      $route(to, from) {
        this.setTags(to)
      }
    },
    created() {
      this.setTags(this.$route)
      bus.$on("collapse", getCollapse => {
        this.collapse = getCollapse
      })
    },
    methods: {
      setTags(route) {
        if (!this.tagList.some(item => item.path === route.fullPath)) {
          this.tagList.push({title: route.meta.title, path: route.fullPath})
        }
      },
      closeTag(index) {
        let curItem = this.tagList.filter(item => item.path === this.$route.fullPath)[0]
        debugger
        if (this.tagList.length >= 2) {
          if (this.tagList[index].path === curItem.path) {
            let tag = this.tagList[index - 1] ? this.tagList[index - 1] : this.tagList[index + 1]
            this.$router.push(tag.path)
          }
          this.tagList.splice(this.tagList[index], 1)
        }
      }
    }
  }
</script>

<style scoped>
  .common-tag {
    position: fixed;
    right: 0;
    height: 30px;
    font-size: 12px;
    overflow: hidden;
    vertical-align: middle;
    z-index: 2;
  }

  .tag-li {
    float: left;
    margin: 3px 5px 2px 2px;
    cursor: pointer;
    overflow: hidden;
    height: 23px;
    line-height: 23px;
    border: 1px solid #e9eaec;
    padding: 0 5px 0 8px;
    max-width: 90px;
    white-space: nowrap;
  }

  .tag-button {
    margin: 0 5px 0 5px;
    position: absolute;
    right: 0;
    top: 0;
    width: 80px;
    height: 30px;
    box-shadow: -3px 0 0 3px rgba(0, 0, 0, 0.1);
  }
</style>
