import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

let state = {

  collapse:false,

  temperatureRecvData: null,
  humidityRecvData: null,
  soakRecvData: null,
  gasRecvData: null,
  metalRecvData: null,
  displacementRecvData: null
}

const mutations = {

  setToken: (state, token) => state.token = token,

  setUserId: (state, userId) => state.userId = userId,

  setUsername: (state, username) => state.username = username,

  setLoginIsAdmin: (state, loginIsAdmin) => state.loginIsAdmin = loginIsAdmin,

  setUserInfo: (state, userInfo) => state.userInfo = userInfo,

  setTemperatureRecvData: (state, recvData) => state.temperatureRecvData = recvData,
  setHumidityRecvData: (state, recvData) => state.humidityRecvData = recvData,
  setSoakRecvData: (state, recvData) => state.soakRecvData = recvData,
  setGasRecvData: (state, recvData) => state.gasRecvData = recvData,
  setMetalRecvData: (state, recvData) => state.metalRecvData = recvData,
  setDisplacementRecvData: (state, recvData) => state.displacementRecvData = recvData,

}

export default new Vuex.Store({state, mutations})
