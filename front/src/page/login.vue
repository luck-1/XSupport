<template>
  <Row type="flex" aligin="middle" justify="center" @keydown.enter.native="submitLogin" class="all">
    <div class="login-pic"></div>
    <el-col :xs="{span:22}" class="login-content">
      <Form ref="formInfo" :model="form" :rules="rules" :label-width="65">
        <p class="login-title">尾矿库坝体安全性能检测平台</p>
        <FormItem prop="user" label="账 号:">
          <Input type="text" clearable class="input-box" v-model="form.username" placeholder="请输入账号"
                 prefix="ios-person"/>
        </FormItem>
        <FormItem prop="password" label="密 码:">
          <Input type="password" class="input-box" v-model="form.password" placeholder="请输入密码"
                 prefix="ios-lock-outline"/>
        </FormItem>
      </Form>
      <Button type="primary" long class="submit-btn" size="large" :loading="loading" @click="submitLogin">
        <span v-if="!loading">登录</span>
        <span v-else>登录中...</span>
      </Button>
    </el-col>
    <div class="login-footer">
      <p>
        <a href="login.vue"><i>关于我们</i></a>
        <a href="login.vue"><i>法律声明</i></a>
        <a href="login.vue"><i>服务条款</i></a>
        <a href="login.vue"><i>联系方式</i></a>
      </p>
      <p><i>地址：陕西省商洛市商洛学院 邮编：726000 Copyright © 2015-2019 版权所有</i></p>
      <p><i>建议使用 IE8 及以上浏览器 陕 ICP 备：012345678号 phone：15191406523 E-mail：1986906062@qq.com</i></p>
    </div>
  </Row>
</template>

<script>
  import {userService} from '../api/service'

  export default {
    name: "login",
    data() {
      return {
        loading: false,
        notice: {
          loginWelcome: {
            title: '欢迎访问',
            desc: '<b>尾矿库坝体安全性能检测平台</b>',
            duration: 4
          },
          loginInfo: {
            title: '体验账号与密码',
            desc: '<pre>账号1：admin 密码：000000 角色：管理员 </pre><pre>账号2：test  密码：000000 角色：普通用户</pre>',
            duration: 7
          },
          successWelcome: {
            title: '欢迎使用尾矿库坝体安全性能检测平台',
            desc: '尾矿库坝体安全性能检测平台<br/><i>（Spring Boot + Vue 的前后端分离平台）</i>',
            duration: 4
          },
          successInfo: {
            title: '已成功登陆',
            desc: '通过右上角的下拉按钮<br/>退出登录体验不同角色账号',
            duration: 7
          }
        },
        form: {
          username: '',
          password: ''
        },
        rules: {
          username: [
            {required: true, message: '账号不能为空！', trigger: 'blur'}
          ],
          password: [
            {required: true, message: '密码不能为空', trigger: 'blur'},
            {type: 'string', min: 4, message: '密码长度不能小于 4 位！', trigger: 'blur'}
          ]
        }
      }
    },
    mounted() {
      this.$Notice.info(this.notice.loginWelcome)
      this.$Notice.info(this.notice.loginInfo)
    },
    methods: {
      submitLogin() {
        this.$refs.formInfo.validate(valid => {
          if (valid) {
            this.loading = true
            userService.login(this.form).then(res => {
              if (res.code === 0) {
                localStorage.setItem('user', JSON.stringify(res.obj))
                localStorage.setItem('token', res.obj.token)
                this.$router.push('/')
                this.$Notice.info(this.notice.successWelcome)
                this.$Notice.info(this.notice.successInfo)
              } else {
                this.form.password = null
              }
              this.loading = false
            })
          }
        })
      },
    }
  }
</script>

<style scoped>
  .input-box {
    width: 165px;
  }

  .login-pic {
    background-image: url("../assets/login.jpg");
    background-color: rgba(100, 100, 100, .6);
    width: 40%;
    position: absolute;
    top: 10%;
    left: 15%;
    bottom: 35%;
  }

  .login-title {
    margin-bottom: 20px;
    font-size: 20px;
    text-align: center;
    font-weight: bold;
  }

  .login-content {
    position: absolute;
    top: 35%;
    left: 80%;
    padding: 30px 20px;
    width: 300px;
    border-radius: .4em;
    text-align: left;
    opacity: 8;
    transform: translate(-50%, -50%);
    background-color: rgba(200, 200, 200, .6);
  }

  .login-footer {
    height: 200px;
    width: 100%;
    position: absolute;
    bottom: 0;
    background-color: #e9eaec;
    text-align: center;
    font-size: 16px;
    line-height: 40px;
    padding: 30px;
  }

</style>
