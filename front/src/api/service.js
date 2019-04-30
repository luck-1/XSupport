import req from '../utils/request'

export const userService = {

  login: (userData) => req.post('user/login', userData),

  changePassword: (param) => req.put('user/changePassword', param),

  findByCondition: (param) => req.post('user/findByCondition', param),

  saveInfo: (date) => req.post('user/saveInfo', date),

  deleteOne: (id) => req.delete('user/deleteOne', id),

  deleteList: (ids) => req.post('user/deleteList', ids),

  changeForbiddenState: (id) => req.get('user/changeForbiddenState', id)
}

export const systemService = {

  findAll: (param) => req.get('systemWarning/findAll', param),

  changeState: (param) => req.post('systemWarning/changeState', param)

}

export const temperatureService = {

  findAll: (param) => req.get('temperature/findAll', param),

}

export const humidityService = {

  findAll: (param) => req.get('humidity/findAll', param),

}

export const limitValueService = {

  setLimitValue: (param) => req.post('limitValue/saveInfo', param),

  getLimitValue: (id) => req.get('limitValue/findById', id)

}
