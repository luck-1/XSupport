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

  findAll: (param) => req.get('sysWarn/findAll', param),

  changeState: (param) => req.post('sysWarn/changeState', param)

}

export const temperatureService = {

  findAll: (param) => req.get('temperature/findAll', param),

}

export const humidityService = {

  findAll: (param) => req.get('humidity/findAll', param),

}

export const soakService = {

  findNewestData: () => req.get('soak/findNewestData'),

}

export const gasService = {

  findNewestData: (bigType) => req.get('gas/findNewestData', bigType),

}

export const typeService = {

  updateLimitValue: (param) => req.post('type/updateLimitValue', param),

  findByBigTypeAndSubIndex: (param) => req.get('type/findByBigTypeAndSubIndex', param),

  findTypes: (bigType) => req.get('type/findTypes', bigType)

}

export const exportService = {

  exportExcel: (bigType) => req.get('export/exportExcel/'+ bigType),

}
