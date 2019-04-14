import req from '../utils/request'

export const userService = {
  login: (userData) => req.post('user/login', userData),

  changePassword: (param) => req.put('user/changePassword', param),

  findByUserName: (username) => req.get('user/findByUserName',username),

  saveInfo: (user) => req.post('user/saveInfo', user),

  deleteUser: (id) => req.delete('user/delete',id),
}
