const webSocketUrl = process.env.BASE_API.replace('http://', 'ws://') + 'websocket'

//保存图片等操作
const toolbox = {
  feature: {
    dataZoom: {yAxisIndex: 'none'},
    restore: {},
    saveAsImage: {}
  }
}

export default {
  webSocketUrl, toolbox
}
