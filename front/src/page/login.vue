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
      </Form>c
      <Button type="primary" long class="submit-btn" size="large" :loading="loading" @click="submitLogin">
        <span v-if="!loading">登录</span>
        <span v-else>登录中...</span>
      </Button>
    </Col>
  </Row>
</template>

<script>
  import {userService} from '../api/service'

  export default {
    name: "login",
    data() {
      return {
        loading: false,
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
    methods: {
      submitLogin() {
        this.loading = true
        userService.login(this.form).then(res => {
          if (res.code === 0) {
            localStorage.setItem('username', this.form.username)
            localStorage.setItem('userId', res.obj.id)
            localStorage.setItem("accessToken", res.obj ? res.obj.webToken : '')
            this.$router.push('/')
          } else {
            this.password = ''
            this.loading = false
          }
        })
          // this.$router.push('/')
      }
    }
  }
</script>

<style scoped>
  .login {
    /*background-image: url("../assets/login.jpg");*/
    background-color: rgba(0, 0, 0, 1);
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
    background-color: rgba(255, 255, 255, .6);
  }
</style>
