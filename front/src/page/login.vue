<template>
  <Row type="flex" aligin="middle" justify="center" @keydown.enter.native="submitLogin()" class="login">
    <Col :xs="{span:22}" class="login-content">
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
    </Col>
  </Row>
</template>

<script>
  import {userService} from '../api/service'
  import {mapMutations} from 'vuex'

  export default {
    name: "login",
    data() {
      return {
        loading: false,
        notice: {
          loginWelcome: {
            title: '欢迎访问',
            desc:'<b>尾矿库坝体安全性能检测平台</b>',
            duration: 3
          },
          loginInfo: {
            title: '体验账号与密码',
            desc:'<pre>账号1：admin 密码：000000 角色：管理员 </pre><pre>账号2：test  密码：000000 角色：普通用户</pre>',
            duration: 5
          },
          successWelcome: {
            title: '欢迎使用尾矿库坝体安全性能检测平台',
            desc: '尾矿库坝体安全性能检测平台<br/><i>（Spring Boot + Vue 的前后端分离平台）</i>',
            duration: 3
          },
          successInfo: {
            title: '已成功登陆',
            desc:'通过右上角的下拉按钮<br/>退出登录体验不同角色账号',
            duration: 5
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
    computed: mapMutations(['setToken', 'setUserId', 'setUsername', 'setLoginIsAdmin']),
    methods: {
      submitLogin() {
        this.loading = true
        userService.login(this.form).then(res => {
          if (res.code === 0) {
            this.saveTolocalStorage(res.obj)
            this.$router.push('/')
            this.$Notice.info(this.notice.successWelcome)
            this.$Notice.info(this.notice.successInfo)
          } else {
            this.password = null
            this.loading = false
          }
        })
      },
      saveTolocalStorage(user) {
        localStorage.setItem('username', user.username)
        localStorage.setItem('userId', user.id)
        localStorage.setItem('loginIsAdmin', user.isAdmin)
        localStorage.setItem("accessToken", user.token)
      },
      saveToStore(user) {
        this.setUserId(user.id)
        this.setUsername(user.username)
        this.setLoginIsAdmin(user.isAdmin)
        this.setToken(user.token)
      }
    }
  }
</script>

<style scoped>
  .login {
    background-image: url("../assets/background.svg");
    background-color: rgba(255, 255, 255,.5);
    height: 100vh;
    width: 100vw;
  }

  .input-box {
    width: 165px;
  }

  .login-title {
    margin-bottom: 20px;
    font-size: 20px;
    text-align: center;
    font-weight: bold;
  }

  .login-content {
    position: absolute;
    top: 50%;
    left: 50%;
    padding: 30px 20px;
    width: 300px;
    border-radius: .4em;
    text-align: left;
    opacity: 8;
    transform: translate(-50%, -50%);
    background-color: rgba(200, 200, 200, .6);
  }
</style>
