import req from '../utils/request'

export const loginService = {
  login: (userData) => req.post('user/login',userData),
}
