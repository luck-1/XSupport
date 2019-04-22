import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const state = {
  token: null,
  userId: null,
  username: null,
  loginIsAdmin: null
}

const mutations = {

  setToken: (state, token) => state.token = token,

  setUserId: (state, userId) => state.userId = userId,

  setUsername: (state, username) => state.username = username,

  setLoginIsAdmin: (state, loginIsAdmin) => state.loginIsAdmin = loginIsAdmin

}
export default new Vuex.Store({state, mutations})
