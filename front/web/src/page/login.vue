<template>
  <Row type="flex" aligin="middle"
       justify="center"
       @keydown.enter.native="submitLogin()"
       class="login">
    <Col :xs="{span:22}"
         class="login-content">
      <Form ref="formInfo"
            :model="form"
            :rules="rules"
            :label-width="65">
        <p class="login-title">尾矿库坝体安全性能检测平台</p>
        <FormItem prop="user" label="账号:">
          <Input type="text" clearable
                 class="input-box"
                 v-model="form.user"
                 placeholder="请输入账号"
                 prefix="ios-person"/>
        </FormItem>
        <FormItem prop="password" label="密 码:">
          <Input type="password"
                 class="input-box"
                 v-model="form.password"
                 placeholder="请输入密码"
                 prefix="ios-lock-outline"/>
        </FormItem>
      </Form>
      <Button type="primary" long
              class="submit-btn"
              size="large"
              :loading="loading"
              @click="submitLogin()">
        <span v-if="!loading">登录</span>
        <span v-else>登录中...</span>
      </Button>
    </Col>
  </Row>
</template>

<script>
  import {loginService} from '../api/service'
  export default {
    name: "login",
    data() {
      return {
        loading: false,
        form: {
          user: '',
          password: ''
        },
        rules: {
          user: [
            {required: true, message: '账号不能为空！', trigger: 'blur'}
          ],
          password: [
            {required: true, message: '密码不能为空', trigger: 'blur'},
            {type: 'string', min: 6, message: '密码长度不能小于 6 位！', trigger: 'blur'}
          ]
        }
      }
    },
    methods: {
      submitLogin() {
        this.$refs.formInfo.validate((valid) => {
          if (valid) {
            this.loading = true
            let str = "username=" + this.form.user + "&password=" + this.form.password;
            loginService.login(str).then( res => {
              if(res.code === 0){
                localStorage.setItem("accessToken",res.obj ? res.obj.webToken : '')
                this.loading = false
                this.password = ''
                this.user = ''
                this.$router.push('/')
              }else {
                this.$Message.error(res.msg);
              }
            })
            this.$Message.success('登录成功!');
          } else {

          }
        })
      }
    }
  }
</script>

<style scoped>
  .login {
    background-image: url("../assets/login.png");
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
