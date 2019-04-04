<template>
  <div class="tag">
    <el-tag v-for="item in tagList" closable
            class="tag-list"
            :type="isActive ? 'info' : 'info'"
            :key="item.title">
      {{item.title}}
    </el-tag>
    <el-dropdown class="tag-dropdown" size="mini" @command="handleTags">
      <el-button type="primary" size="mini">
        标签选项<i class="el-icon-arrow-down el-icon--right"></i>
      </el-button>
      <el-dropdown-menu slot="dropdown" >
        <el-dropdown-item command="closeOther">关闭其他</el-dropdown-item>
        <el-dropdown-item command="closeAll">关闭所有</el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>
  </div>
</template>

<script>
  export default {
    name: "tag",
    data() {
      return {
        isActive: true,
        tagList: [{title: "1", path: "1",type:"success"}, {title: "2", path: "2"}, {title: "3", path: "3"}]
      }
    },
    methods: {
      closeIndex(index){

      },
      closeOther(){
        const curItem = this.tagList.filter(item => {
          return item.path === this.$route.fullPath
        })
      },
      closeAll(){

      },
      handleTags(command) {
        command === "closeOther" ? this.closeOther() : this.closeAll()
      }
    }
  }
</script>

<style scoped>
  .tag {
    background-color: #aaaaaa;
    right: 0;
    height: 30px;
    width: 100%;
    font-size: 12px;
    overflow: hidden;
  }
  .tag-list{
    float: left;
    margin: 3px 5px 2px 2px;
    cursor: pointer;
    overflow: hidden;
    height: 23px;
    line-height: 23px;
    border: 1px solid #e9eaec;
    padding: 0px 5px 0 12px;
    color: #666;
  }
  .tag-dropdown{
    float: right;
    padding: 0 3px 0 0;
  }
</style>
