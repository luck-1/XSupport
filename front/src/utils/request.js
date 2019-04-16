import axios from 'axios';
import {Loading, Message} from 'element-ui';
import {common} from "./common";

const loadingConfig = {
  lock: true,
  text: 'loading...',
  spinner: 'el-icon-loading',
  background: 'rgba(0, 0, 0, 0.8)'
  // customClass: 'loading-zindex'
};

function requestHeader(methodType) {
  return {
    credentials: 'include',
    method: methodType,
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'x-access-token': localStorage.getItem('accessToken')
    },
    mode: 'cors',
    cache: 'force-cache'
  }
}

function serverResponse(methodType, url, param) {
  url = process.env.BASE_API + url;
  let response;
  if (methodType === 'GET' || methodType === 'DELETE') {
    url = param ? url + '?' + common.serialize(param) : url;
    response = methodType === 'GET' ? axios.get(url, requestHeader(methodType)) : axios.delete(url, requestHeader(methodType))
  } else if (methodType === 'POST' || methodType === 'PUT') {
    response = methodType === 'POST' ? axios.post(url, param, requestHeader(methodType)) : axios.put(url, param, requestHeader(methodType))
  }
  return response
}

async function serverResult(methodType, url, param, isLoading) {
  let loading = isLoading ? Loading.service(loadingConfig) : null;
  let result = (await serverResponse(methodType, url, param)).data;
  loading ? setTimeout(() => loading.close(),700) : null;
  result.code === 0 ? Message.success(result.msg) : Message.error(result.msg);
  return result
}

export default {
  get: (url, param, isLoading = true) => serverResult('GET', url, param, isLoading),

  delete: (url, param, isLoading = true) => serverResult('DELETE', url, param, isLoading),

  post: (url, param = {}, isLoading = true) => serverResult('POST', url, param, isLoading),

  put: (url, param = {}, isLoading = true) => serverResult('PUT', url, param, isLoading)
}

axios.interceptors.response.use(response => response, err => {
  const loading = Loading.service(loadingConfig);
  let errData = {
    ...err
  };
  if (typeof err === 'string') {
    errData.message = err;
    setTimeout(() => {
      loading.close()
    }, 500);
    return Promise.reject(errData)
  }
  if (err && err.response) {
    switch (errData.response.status) {
      case 400:
        errData.message = '请求错误(400)';
        break;
      case 401:
        errData.message = '登录失效，请重新登录';
        router.push('/login');
        break;
      case 403:
        errData.message = '拒绝访问(403)';
        break;
      case 404:
        errData.message = '请求出错(404)';
        break;
      case 408:
        errData.message = '请求超时(408)';
        break;
      case 500:
        errData.message = '服务器错误(500)';
        break;
      case 501:
        errData.message = '服务未实现(501)';
        break;
      case 502:
        errData.message = '网络错误(502)';
        break;
      case 503:
        errData.message = '服务不可用(503)';
        break;
      case 504:
        errData.message = '网络超时(504)';
        break
      case 505:
        errData.message = 'HTTP版本不受支持(505)';
        break
      default:
        errData.message = `连接出错(${errData.response.status})!`
    }
  } else {
    errData.message = '连接服务器失败!'
  }
  setTimeout(() => {
    loading.close()
  }, 1000);
  return Promise.reject(errData)
});
