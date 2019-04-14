import axios from 'axios';
import {Loading, Message} from 'element-ui';
import {common} from "./common";

axios.interceptors.response.use(function (response) {
  return response
}, function (err) {
  const loading = Loading.service(loadingConfig)
  let errData = {
    ...err
  }
  if (typeof err === 'string') {
    errData.message = err
    setTimeout(() => {
      loading.close()
    }, 500)
    return Promise.reject(errData)
  }
  if (err && err.response) {
    switch (errData.response.status) {
      case 400:
        errData.message = '请求错误(400)'
        break
      case 401:
        errData.message = '登录失效，请重新登录(401)'
        router.push('/login')
        break
      case 403:
        errData.message = '拒绝访问(403)'
        break
      case 404:
        errData.message = '请求出错(404)'
        break
      case 408:
        errData.message = '请求超时(408)'
        break
      case 500:
        errData.message = '服务器错误(500)'
        break
      case 501:
        errData.message = '服务未实现(501)'
        break
      case 502:
        errData.message = '网络错误(502)'
        break
      case 503:
        errData.message = '服务不可用(503)'
        break
      case 504:
        errData.message = '网络超时(504)'
        break
      case 505:
        errData.message = 'HTTP版本不受支持(505)'
        break
      default:
        errData.message = `连接出错(${errData.response.status})!`
    }
  } else {
    errData.message = '连接服务器失败!'
  }
  setTimeout(() => {
    loading.close()
  }, 1000)
  return Promise.reject(errData)
})

const loadingConfig = {
  lock: true,
  text: 'loading...',
  spinner: 'el-icon-loading',
  background: 'rgba(0, 0, 0, 0.5)',
  // customClass: 'loading-zindex'
}

function getResConfig(methods) {
  return {
    credentials: 'include',
    method: methods,
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'x-access-token': localStorage.getItem('accessToken')
    },
    mode: 'cors',
    cache: 'force-cache'
  }
}

function getFullUrl(url) {
  return process.env.BASE_API + url;
}

function beginLoading(isLoading) {
  return isLoading ? Loading.service(loadingConfig) : null
}

function endLoading(result, loading) {
  if (loading) {
    setTimeout(() => {
      loading.close()
    }, 300);
    if (result.code != 0) {
      Message.error(result.msg);
    }
  }
}

export default {
  get: async (url, param, isLoading = true) => {
    let loading = beginLoading(isLoading);
    url = param ? getFullUrl(url) + '?' + common.serialize(param) : getFullUrl(url);
    let result = (await axios.get(url, getResConfig('GET'))).data;
    endLoading(result, loading);
    return result;
  },
  delete: async (url, param, isLoading = true) => {
    let loading = beginLoading(isLoading);
    url = param ? getFullUrl(url) + '?' + common.serialize(param) : getFullUrl(url);
    let result = (await axios.delete(url, getResConfig('DELETE'))).data;
    endLoading(result, loading);
    return result;
  },
  post: async (url, data = {}, isLoading = true) => {
    let loading = beginLoading(isLoading);
    url = getFullUrl(url);
    let result = (await axios.post(url, data, getResConfig('POST'))).data;
    endLoading(result, loading);
    return result;
  },
  put: async (url, data = {}, isLoading = true) => {
    let loading = beginLoading(isLoading);
    url = getFullUrl(url);
    let result = (await axios.put(url, data, getResConfig('PUT'))).data;
    endLoading(result, loading);
    return result;
  }
}
