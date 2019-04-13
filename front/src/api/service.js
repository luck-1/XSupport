import req from '../utils/request'

export const loginService = {
  login: (userData) => req.post('user/login', userData),
  changePassword: (changePassword) => req.put('user/changePassword', changePassword),
  add: (user) => req.post('user/add', user),
  update: (user) => req.put('user/update', user),
  delete: (id) => req.delete('user/delete',id),
}
