import req from '../utils/request'

export const loginService = {
  login: (params) => req.post('user/login?' + params),
}
